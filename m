Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F20936F8EA
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 21:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788037610; cv=none; b=qH02ZrCBwEl+WDW847skhyMh3CUJXc7Imafgug1KWpwV7fw/zNNBH9TsAR9OZNumNcpX4kwubZ7SSo5YbGbhOPCJk2YTeYyyTQ42JkfveP+TsaPil2bz7n9u6ec9PHgwHeAMmIbsVbc9VVR8n767tclmppDCqx9Gwg4p0+8Ncgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788037610; c=relaxed/simple;
	bh=ljlDwxHktzwwNFVL7ZC2GPhxTnyCYzuhVZ5B9iUD+Jc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O7c6DZgam9fqN0AH3IGEJ8EWl1lXcVjEVPqU2nlSuo8rSxZQMkAbgkGfXOsgqjGj3UuDb+Id47f3zPXaPHH/W2Yf6N1LDpr3RliRLJ2ow77B4lFqe4L7Ff4f1IvP+YK6Df+2oDs4yolbjOq6R3fcwb9lw4vjcK39N2uC6rEakf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C/pRkr9D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C/pRkr9D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F491F000E9;
	Sat, 29 Aug 2026 21:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788037609;
	bh=yJL4GWz5c9TX5YWWb/Y1ndKwkT44Tj2KUaCBVOfWI9g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C/pRkr9DgDSmf5PJa6fAelxoB9H/XF7P+dvEny8C6dI993WkFZLs2thY5FXNNRijG
	 j6jIGSmUMEBN8XtI8m5wO0YjmPng2ZZQ44seh3bBgWjrcW5KTEXnkZRN4v+XhYPSO+
	 /cq97TDmU5tgTL2Y/3lSA/UNBAfs7TkZibACGVazmMpLgXg3e6QhzZt+g6Moc/2JEO
	 27MJAr2a6vGvilWOmrWmNF2n2BfzamNi4TrN8nbLFOsKvNWZ52k/kenpuUj6gVophe
	 xMwIri84sX9WFGdUUQF9gtsy4BlX2AK/40x4ZMQ2VnsjhKT5MYqeNjGbu974yI3onJ
	 rvJwFXz7xeQ8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] pmdomain: riscv: Add RPMI device power service
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Yeong" <joshua.yeong@starfivetech.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260829205520.1691-3-joshua.yeong@starfivetech.com>
References: <20260829205520.1691-1-joshua.yeong@starfivetech.com>
 <20260829205520.1691-3-joshua.yeong@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 21:06:48 +0000
Message-Id: <20260829210648.D7F491F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Missing cleanup of initialized PM domains on the probe error path =
leads to a Use-After-Free in the global `gpd_list`.
- [High] Concurrent mailbox accesses cause stack Use-After-Free and queue c=
orruption due to un-synchronized, non-blocking requests.
- [High] Ignoring the return value of `pm_genpd_remove()` in the driver rem=
ove path leaves dangling pointers in the global `gpd_list`.
- [Medium] Missing little-endian to CPU conversions on RPMI RX message fiel=
ds causes data corruption on big-endian platforms.
- [Medium] Domains initialized in the ON state will never be powered off be=
cause the driver lacks a `sync_state` callback.
- [Medium] Uninitialized stack memory in RPMI response structures can be ex=
posed to user-space.
--

commit 0568e3713c09ba7a392adb765c276307e1fd7322
Author: Joshua Yeong <joshua.yeong@starfivetech.com>

pmdomain: riscv: Add RPMI device power service

Add a generic power domain provider on top of the RISC-V Platform
Management Interface (RPMI) device power service group, reached through
an SBI MPXY channel.

> diff --git a/drivers/pmdomain/riscv/riscv-rpmi-device-power.c b/drivers/p=
mdomain/riscv/riscv-rpmi-device-power.c
> new file mode 100644
> index 0000000000000..f34ef48dff394
> --- /dev/null
> +++ b/drivers/pmdomain/riscv/riscv-rpmi-device-power.c
> @@ -0,0 +1,441 @@
[ ... ]
> +static int rpmi_power_state_get(struct rpmi_device_power_domain *mpxy_pm=
_domain,
> +				u32 domain_id, u32 *state)
> +{
> +	struct rpmi_pm_get_power_state_tx tx;
> +	struct rpmi_pm_get_power_state_rx rx;
> +	struct rpmi_mbox_message msg;
> +	int ret;
> +
> +	tx.domain_id =3D cpu_to_le32(domain_id);
> +
> +	rpmi_mbox_init_send_with_response(&msg, RPMI_DP_SRV_GET_STATE,
> +					  &tx, sizeof(tx), &rx, sizeof(rx));
> +
> +	ret =3D rpmi_mbox_send_message(mpxy_pm_domain->mpxy_ctx->chan, &msg);
> +	if (ret)
> +		return ret;
> +
> +	if (rx.status)
> +		return rpmi_to_linux_error(rx.status);
> +
> +	*state =3D rx.power_state;

[Severity: Medium]
Will this return corrupted state data on big-endian platforms?

The driver correctly uses cpu_to_le32() for TX fields but fails to use
le32_to_cpu() when reading the raw little-endian power_state field from the
RPMI RX message.

> +
> +	return ret;
> +}
> +
> +static int rpmi_power_state_set(struct rpmi_device_power_domain *mpxy_pm=
_domain,
> +				u32 domain_id, u32 state)
> +{
> +	struct rpmi_pm_set_power_state_tx tx;
> +	struct rpmi_pm_set_power_state_rx rx;
> +	struct rpmi_mbox_message msg;
> +	int ret;
> +
> +	tx.domain_id =3D cpu_to_le32(domain_id);
> +	tx.power_state =3D cpu_to_le32(state);
> +
> +	rpmi_mbox_init_send_with_response(&msg, RPMI_DP_SRV_SET_STATE,
> +					  &tx, sizeof(tx), &rx, sizeof(rx));
> +	ret =3D rpmi_mbox_send_message(mpxy_pm_domain->mpxy_ctx->chan, &msg);

[Severity: High]
Can concurrent mailbox accesses cause stack Use-After-Free and queue
corruption?

Because the mailbox is configured for non-blocking execution in probe
(tx_block =3D false), mbox_send_message() will asynchronously queue message=
s if
the channel is busy. Since msg is stack-allocated, returning from
rpmi_power_state_set() destroys the message structure while it may still be
in the mailbox queue.

> +	if (ret)
> +		return ret;
[ ... ]
> +static int rpmi_device_power_get_attrs(u32 domain_id,
> +				       struct rpmi_device_power_domain *mpxy_pm_domain)
> +{
> +	struct rpmi_pm_get_domain_attrs_tx tx;
> +	struct rpmi_pm_get_domain_attrs_rx rx;
> +	struct rpmi_mbox_message msg;
> +	int ret;
> +
> +	tx.domain_id =3D cpu_to_le32(domain_id);
> +
> +	rpmi_mbox_init_send_with_response(&msg, RPMI_DP_SRV_GET_ATTRS,
> +					  &tx, sizeof(tx), &rx, sizeof(rx));
> +	ret =3D rpmi_mbox_send_message(mpxy_pm_domain->mpxy_ctx->chan, &msg);
> +	if (ret)
> +		return ret;
> +
> +	if (rx.status)
> +		return rpmi_to_linux_error(rx.status);
> +
> +	mpxy_pm_domain->transition_latency =3D rx.transition_latency;

[Severity: Medium]
Is an endianness conversion missing here?

The transition latency field is read directly without little-endian to CPU
conversion, which could cause incorrect latency evaluations on big-endian
systems.

> +	strscpy(mpxy_pm_domain->name, rx.name, RPMI_PM_DOMAIN_NAME_LEN);

[Severity: Medium]
Does unconditionally copying rx.name here expose uninitialized stack memory
to user-space?

Because the rx struct is uninitialized on the stack, if the RPMI firmware
returns a success status but populates fewer bytes than the expected size,
uninitialized stack memory will be copied into the PM domain structure and
subsequently exposed through sysfs or debugfs.

> +
> +	return 0;
> +}
[ ... ]
> +static int rpmi_pm_domain_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct rpmi_device_power_domain *mpxy_pd;
> +	struct genpd_onecell_data *mpxy_pd_data;
> +	struct generic_pm_domain **domains;
> +	struct device *dev =3D &pdev->dev;
> +	struct rpmi_ctx *mpxy_ctx;
> +	u32 num_domains =3D 0;
> +	int ret;
> +	u32 i;
> +
> +	mpxy_ctx =3D devm_kzalloc(&pdev->dev, sizeof(*mpxy_ctx), GFP_KERNEL);
> +	if (!mpxy_ctx)
> +		return -ENOMEM;
> +
> +	/* Setup mailbox client */
> +	mpxy_ctx->client.dev		=3D dev;
> +	mpxy_ctx->client.rx_callback	=3D NULL;
> +	mpxy_ctx->client.tx_block	=3D false;
> +	mpxy_ctx->client.knows_txdone	=3D true;

[Severity: High]
Does configuring the mailbox client for non-blocking execution
(tx_block =3D false) require driver-level serialization?

Without synchronization, concurrent state change requests from different
devices will queue stack-allocated messages and cause a Use-After-Free when
the calling functions return immediately.

> +	mpxy_ctx->client.tx_tout	=3D 0;
[ ... ]
> +	mpxy_pd_data->domains =3D domains;
> +	mpxy_pd_data->num_domains =3D num_domains;
> +
> +	platform_set_drvdata(pdev, mpxy_pd_data);
> +
> +	return of_genpd_add_provider_onecell(np, mpxy_pd_data);
> +}

[Severity: High]
If of_genpd_add_provider_onecell() fails, does returning the error directly
leave initialized PM domains dangling in the global gpd_list?

The framework does not clean up individual initialized domains when provider
registration fails. When devres eventually frees the backing memory, the
global gpd_list will contain dangling pointers, leading to a Use-After-Free
and kernel panic.

> +
> +static void rpmi_pm_domain_remove(struct platform_device *pdev)
> +{
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct genpd_onecell_data *mpxy_pd_data;
> +	unsigned int i;
> +
> +	of_genpd_del_provider(np);
> +	mpxy_pd_data =3D platform_get_drvdata(pdev);
> +	for (i =3D 0; i < mpxy_pd_data->num_domains; i++) {
> +		if (!mpxy_pd_data->domains[i])
> +			continue;
> +		pm_genpd_remove(mpxy_pd_data->domains[i]);

[Severity: High]
Is it safe to ignore the return value of pm_genpd_remove() here?

If the driver is unbound via sysfs while consumer devices are still attache=
d,
pm_genpd_remove() will fail and return -EBUSY. Ignoring this failure allows
the function to complete and devres to free the memory while the domains are
still actively linked in the global list, causing a Use-After-Free.

> +	}
> +}
> +
> +static const struct of_device_id rpmi_pm_domain_of_match[] =3D {
> +	{ .compatible =3D "riscv,rpmi-device-power" },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, rpmi_pm_domain_of_match);
> +
> +static struct platform_driver rpmi_pm_domain_platdrv =3D {
> +	.driver =3D {
> +		.name =3D "riscv-rpmi-device-power",
> +		.of_match_table =3D rpmi_pm_domain_of_match,
> +	},
> +	.probe =3D rpmi_pm_domain_probe,
> +	.remove =3D rpmi_pm_domain_remove,
> +};

[Severity: Medium]
Will domains initialized in the ON state remain powered on forever?

The platform driver omits a .sync_state callback. Without this callback (or
setting GENPD_FLAG_NO_STAY_ON), the genpd core sets stay_on =3D true for
default-ON domains and never clears it, preventing them from being powered
off.

> +
> +module_platform_driver(rpmi_pm_domain_platdrv);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829205520.1691=
-1-joshua.yeong@starfivetech.com?part=3D2
