Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC049429020
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784107769; cv=none; b=BvuPRuexJ4raSfqWBguKwkwdaF8SJTar3O0vesDWpsjlQXBe/zTbz933UB00ovZYixH+ARqRcWPE4lwgmULc0yWUXdxfDVz8q+5FfdlXQtELRDt1u/8pQKhz9GPF28C7zh9LLF+K80ELRI4GqBFuuC5xLj0gaqtSPeTV2hhMASE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784107769; c=relaxed/simple;
	bh=d63nZGY544IkMRXI+AMsOOmVpdAP6Z/3GWCZnHMyqpk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=se6vXN1mD9b23PNnA6B+mgp0nBYmPS/CkKeJ0rf81ZKYw1n7bOYdjzkScMgb5jzv4+uH7+XNFrqarPA5dGoLz3BPWNbRZGSxPegSUoyDqEiGsDvYhnQPJ3pPtoWB+tiAIg78yiCa2hSEM3CvGZMk+4H7KkbCy9/ExDeI+4/hMPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PzWiUdGR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PzWiUdGR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028BA1F000E9;
	Wed, 15 Jul 2026 09:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784107766;
	bh=5KC4FoOl5GD0sM0hOKn075tBZupvUCcf96uZZD+e0ZE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PzWiUdGRC5Ru6dIMpnMOicVu+IFzZskVb0pfQV6plRJp4keMHO3xeYRwPgsHpR72S
	 SOvhkYHhR65YoIL5NHAB8u9eXa4KRBZvO9oDgOniq1zW9j0dsfA0Mg2Nv4GT63cBXr
	 5DOtMldjnrlJXRh4ldmUkepGmZ9ezh5OtyBblXjdxSdpJRpbkPVI9LFNBf7fRubrFG
	 eyEFFGG2Asb0jABXvcGoUntVNSwRTNp4gwzfUctI4x7xJTJbkszSBU+If6sHWOLWG6
	 u7THmPTkBplE0NqegN/Wnbsdo9Mor/iCF4mO8vL8aOJ3fh/ZTJ86+zJ123sfrpswV0
	 OaAZ6zkLbzfmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 12/16] power: sequencing: pcie-m2: support matching
 on remote "port" node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260715085348.3457359-13-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
 <20260715085348.3457359-13-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 09:29:25 +0000
Message-Id: <20260715092926.028BA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing `serdev_controller_put()` in `pwrseq_pcie_m2_create_serdev=
_one()` returns path.
- [High] Unchecked `pdev->dev.parent` in `pwrseq_pcie_m2_notify()` leads to=
 NULL pointer dereference.
- [High] Mixing `devm` registration with manual resource cleanup causes Use=
-After-Free of regulator consumers.
--

--- Patch [12]: [PATCH v5 12/16] power: sequencing: pcie-m2: support matchi=
ng on remote "port" node ---
commit 8eb380a4e579162e00e556321400077f29d6c07e
Author: Chen-Yu Tsai <wenst@chromium.org>

power: sequencing: pcie-m2: support matching on remote "port" node

This commit updates the pcie-m2 power sequencing driver to support matching
against remote "port" nodes for USB hubs. It uses of_graph_get_remote_port()
and falls back to the remote port parent for other connection types. It
also updates the existing matching logic to use device_match_of_node().

> diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/se=
quencing/pwrseq-pcie-m2.c
> index ddfe6ca824945..01f9f6a717464 100644
> --- a/drivers/power/sequencing/pwrseq-pcie-m2.c
> +++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
> @@ -175,9 +175,16 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device=
 *pwrseq,
>  	 * parent matches the OF node of 'dev'.
>  	 */
>  	for_each_endpoint_of_node(ctx->of_node, endpoint) {
> +		/* USB port devices are tied to the port nodes. */
> +		struct device_node *remote_port __free(device_node) =3D
> +				of_graph_get_remote_port(endpoint);
> +		if (device_match_of_node(dev, remote_port))
> +			return PWRSEQ_MATCH_OK;
> +
> +		/* Try the remote port parent for other types. */
>  		struct device_node *remote __free(device_node) =3D
>  				of_graph_get_remote_port_parent(endpoint);
> -		if (remote && (remote =3D=3D dev_of_node(dev)))
> +		if (device_match_of_node(dev, remote))
>  			return PWRSEQ_MATCH_OK;
>  	}
> =20

[Severity: High]
This isn't a bug introduced by this patch, but does=20
pwrseq_pcie_m2_create_serdev_one() leak the serdev_ctrl reference on the
early return path?

If the serdev device was already created for the PCI device, the list
iteration returns 0 directly:

drivers/power/sequencing/pwrseq-pcie-m2.c:pwrseq_pcie_m2_create_serdev_one(=
) {
    ...
    scoped_guard(mutex, &ctx->list_lock) {
        list_for_each_entry(pci_dev, &ctx->pci_devices, list) {
            if (pci_dev->pdev =3D=3D pdev)
                return 0;
        }
    }
    ...
}

This appears to bypass the serdev_controller_put(serdev_ctrl) cleanup. Could
this accumulate leaked references during PCI bus probing or device
notification callbacks?

[Severity: High]
This is a pre-existing issue, but could pwrseq_pcie_m2_notify() trigger a
NULL pointer dereference on systems with a root PCI bus?

Some bus scanning flows use pci_create_root_bus(NULL, ...), where devices
have no parent. The BUS_NOTIFY_ADD_DEVICE notifier is registered globally
and evaluates this without checking if pdev->dev.parent is NULL:

drivers/power/sequencing/pwrseq-pcie-m2.c:pwrseq_pcie_m2_notify() {
    ...
    if (!pci_parent || (pci_parent !=3D pdev->dev.parent->of_node))
        return NOTIFY_DONE;
    ...
}

Could this cause a kernel panic during PCI bus probing on affected systems
when the driver is active?

[Severity: High]
This isn't a bug introduced by this patch, but does mixing devm registration
with manual regulator cleanup cause a use-after-free?

In the probe error path and remove function, the regulators are manually
freed:

drivers/power/sequencing/pwrseq-pcie-m2.c:pwrseq_pcie_m2_probe() {
    ...
err_free_regulators:
    regulator_bulk_free(ctx->num_vregs, ctx->regs);
    ...
}

drivers/power/sequencing/pwrseq-pcie-m2.c:pwrseq_pcie_m2_remove() {
    ...
    regulator_bulk_free(ctx->num_vregs, ctx->regs);
    ...
}

Since the power sequencer device is registered via
devm_pwrseq_device_register(), it remains active until the devres teardown
runs after the function returns. If a consumer calls a power sequencing
operation during this window, or if the driver is unbound via sysfs, will
it access the freed regulator consumer objects?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715085348.3457=
359-1-wenst@chromium.org?part=3D12
