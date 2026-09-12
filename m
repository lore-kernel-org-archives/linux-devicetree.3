Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2598301486
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 23:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789254532; cv=none; b=opoI5iiz5NSqthHqCPzGsT9B1oG8gThkizUAxRaUhMI3T45DlOqa9Becw3k1Yo2X/48ZcLQ69tJgmGV0LVmSA2I3kX6XunHX8pNTtkueZlBdeVL6VQUPuZmEJtCzzt4X86qIbZdgTzEFCg3mblSOyktV5TuebHC08KRYzvWuIx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789254532; c=relaxed/simple;
	bh=JBDEzamj2PwxfWI39gEDVSRoKeLBosMADu2OyKmmhpM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NoV4QyfUSZYINK5VwQNcwHE+OddjMJ8oD2Nr8/3iz3pmT4kam+dJCahWKQ9CBRA7aHdJacsUA2CP9ArknJDRN6ui4lfdvwLETg2TLkVpahI08CnskJcP35ZPn0Ho/1KM7YtqVGPjFemJoRzLfVaHcV8daT2xRW5Fe3MTywG2oBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Httl12Ua; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Httl12Ua"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 049661F000FF;
	Sat, 12 Sep 2026 23:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789254531;
	bh=LtALdiBjrxkf+oVhYEt9gGQblx8tuzi4dr7FK4XsAFg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Httl12UavMS06PMxhX/RtwMOrCAm0skqULJEHnaybXFf5v9XO/PY7jVDf1/GPWdA/
	 4GoH27CA8CeDu93Vy4CpoHnfwjctFmO8iVOqePxqGv1qbXQiFfIexj1mkLqZ6wlScn
	 gHiY87VtjzZXyAr+WXgmxB4/JfB+UWLShb9uaR0i/2ER4pqLSf+qbrTEAktoWD2jtH
	 adZSFg59HO/i4PhbspxCCLpCYzQZ6h6mwnfbxvRFbQeORo8JiY/tw9hIPFrL+if9LF
	 NJZc+IsKpKmPVhT6FonVH+Re7fkSi0AbBo4ADdhjjq+EpWhhjp6GvDE86ia24aeoNe
	 L8QA+U7iKMOBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/8] usb: misc: qcom_eud: add per-path role switch
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260912225301.3396556-5-elson.serrao@oss.qualcomm.com>
References: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
 <20260912225301.3396556-5-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 23:08:50 +0000
Message-Id: <20260912230851.049661F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The driver registers its USB role switch with the incorrect fwno=
de for legacy device trees, preventing USB connectors from finding the swit=
ch.
- [Medium] Dangling fwnode pointer in the registered USB role switch due to=
 missing device node refcount increment.

Pre-existing issues:
- [High] The hardirq handler calls a function that sleeps, leading to a ker=
nel panic.
--

commit 9414ff0b2c9f7c78a66f0bce1fe95af108a567fa
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: add per-path role switch support

The EUD hardware can support multiple High-Speed USB paths, each connected
to different USB controllers. Restructure the driver to support per-path
role switches and remove the chip-level role switch. Additionally, remove
the unnecessary role switch call from enable_eud().

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 868725ad35e09..5e2034fb11ab5 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
[ ... ]
> @@ -270,12 +273,15 @@ static irqreturn_t handle_eud_irq(int irq, void *da=
ta)

[Severity: High]
This is a pre-existing issue and was not introduced by the patch under
review, but does handle_eud_irq() end up sleeping in a hardirq context?

Looking at the driver's interrupt handling, handle_eud_irq() is the
primary hardirq handler (top-half). When it receives an EUD_INT_SAFE_MODE
interrupt, it calls pet_eud():

drivers/usb/misc/qcom_eud.c:handle_eud_irq() {
    ...
	case EUD_INT_SAFE_MODE:
		pet_eud(chip);
		return IRQ_HANDLED;
    ...
}

However, pet_eud() invokes readl_poll_timeout() which internally calls
usleep_range() and attempts to sleep:

drivers/usb/misc/qcom_eud.c:pet_eud() {
    ...
		ret =3D readl_poll_timeout(chip->base + EUD_REG_SW_ATTACH_DET,
					reg, (reg =3D=3D 0), 1, 100);
    ...
}

Can this lead to a kernel panic due to scheduling while atomic when the
hardware generates a safe mode interrupt?

>  static irqreturn_t handle_eud_irq_thread(int irq, void *data)
>  {
[ ... ]
> @@ -327,14 +356,59 @@ static int eud_init_path(struct eud_chip *chip, str=
uct device_node *np)
[ ... ]
> +	role_sw_desc.fwnode =3D of_fwnode_handle(np);

[Severity: Medium]
When processing a legacy device tree, does this assign the wrong fwnode
to the role switch?

In a legacy DT, np points to the ports node instead of the main eud
device node. By setting the fwnode to the ports node here, the role
switch is registered with that specific fwnode.

However, when a connector driver searches for its remote role switch,
of_fwnode_graph_get_port_parent() explicitly skips nodes named "ports" and
returns the parent device node instead. Does this mismatch cause the
connector framework to fail to find the EUD's role switch, breaking the
role-relay functionality on platforms using legacy DT bindings?

> +	role_sw_desc.set =3D eud_role_switch_set;
> +	role_sw_desc.driver_data =3D path;
> +	snprintf(path->name, sizeof(path->name), "eud-path%u", path_num);
> +	role_sw_desc.name =3D path->name;
> +
> +	path->eud_sw =3D usb_role_switch_register(chip->dev, &role_sw_desc);

[Severity: Medium]
Does this leave a dangling fwnode pointer in the registered USB role switch?

Looking at eud_probe(), it iterates over child nodes using:

for_each_child_of_node_scoped(np, child) {
    ret =3D eud_init_path(chip, child);
    ...
}

The child device node pointer is passed to eud_init_path() as np, where
its fwnode is directly passed to usb_role_switch_register().
usb_role_switch_register() stores the fwnode but does not increment its
reference count.

Since for_each_child_of_node_scoped() automatically drops the reference on
the child node when the loop advances or exits, does the registered
role switch retain a pointer to a device node with a decremented reference
count? For dynamic DT overlays, could this lead to a Use-After-Free upon
role switch removal or sysfs access?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912225301.3396=
556-1-elson.serrao@oss.qualcomm.com?part=3D4
