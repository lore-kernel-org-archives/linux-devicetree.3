Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41ABBDF76
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 00:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787530085; cv=none; b=HMgm7TBkf+bHqwB3K24vggC+Oe1XhRTYRpxnni1RoPrJiSjYRYagKwYT9fU93mUqEikbwlowhjGhBKZ+zYKxuUHii1IazUwDf7KyZyofR2bpp1ivq2Hm/93wI8AeDMGPEKcdkKc4wfteaWbK5QgJiSIVrJTu5F2gICdX6j9siRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787530085; c=relaxed/simple;
	bh=JVkotxiO1asvuV2dAwYUXcyy6cLlrlF0hHoLhKu582I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SLW6uQ8N3JGgCwW/PjtXGhoX4hmWW+9nRlK7lBlfdiLqFKaqnCq/lCZJBStW+R/1HTBS/Z2iYOAXZOPVPTnJ5dih4nI6OM05HVugSwjA97LFrtJUzAdPLFAQvnV+rMJDvaPv+Nxm/0aLlFjyMMa4Pkay8zcRrP+v50YWrKjw7gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HPVGASga; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HPVGASga"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B401F000E9;
	Mon, 24 Aug 2026 00:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787530084;
	bh=41Ko1+/eIS0UF1PZevpNobHEHRXKWbI4c8qHZBwmRs0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HPVGASga1ieMhpDfRG4X26v9XToBAqQ+wLSM0hlWBBVUDOmKg/i/L5HKaIV8Cx8+H
	 dUG890k0+3p7ODtezxhnMQZbI6y0N6Hykg7lLgxaffLAEEAdHI93vLfesHxvKVAk2N
	 B0roPc00O86oWv/K1vF0Z2Jgo+X4TYGhuUVKAM4rYG9jPxyGxxhRym3vytyYOQ8576
	 tx1Y8AmcaSWDJBvavTIA9pmUWmDXxcnHFzVjA9hbQBlVKOEZOpYb40z8v2bkruIHzS
	 /OFuPPFnwjqnwdWGVCvrrFLD4J0ebsVooYlBSBo5MwRL6snIRFj1dcoteIjVMF+Vqj
	 OgWAZ91QlvwnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: dts: marvell: add SDHCI clock-names to Armada 38x
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260823235652.77997-1-rosenp@gmail.com>
References: <20260823235652.77997-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 00:08:03 +0000
Message-Id: <20260824000803.C2B401F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver ignores the return value of `clk_prepare_enable()` for =
its primary clocks, risking unclocked register accesses.
- [High] The driver improperly handles `-EPROBE_DEFER` from `devm_pinctrl_g=
et()`, allowing the probe to succeed without necessary pins.
- [High] The driver ignores the return value of `pm_runtime_get_sync()` in =
suspend, resume, and remove callbacks.
--

--- Patch [1]: [PATCH] ARM: dts: marvell: add SDHCI clock-names to Armada 3=
8x ---
commit 00932f716bef42c94516ea3abd25e12b0e972f6b
Author: Rosen Penev <rosenp@gmail.com>

ARM: dts: marvell: add SDHCI clock-names to Armada 38x

The marvell,armada-380-sdhci binding requires clock-names, but the
Armada 38x SDHCI node only carries an unnamed clock reference.
Add the missing clock name so the node passes schema validation.

> diff --git a/arch/arm/boot/dts/marvell/armada-38x.dtsi b/arch/arm/boot/dt=
s/marvell/armada-38x.dtsi
> index 1d616edda322d..0618779090d04 100644
> --- a/arch/arm/boot/dts/marvell/armada-38x.dtsi
> +++ b/arch/arm/boot/dts/marvell/armada-38x.dtsi
> @@ -627,6 +627,7 @@ sdhci: sdhci@d8000 {
>  					<0x18454 0x4>;
>  				interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks =3D <&gateclk 17>;
> +				clock-names =3D "io";
>  				mrvl,clk-delay-cycles =3D <0x1F>;
>  				status =3D "disabled";
>  			};

[Severity: High]
This is a pre-existing issue, but does the host driver ignore the return
value of clk_prepare_enable() for its primary clocks?

Looking at drivers/mmc/host/sdhci-pxav3.c in sdhci_pxav3_probe():

    clk_prepare_enable(pxa->clk_io);
    ...
    clk_prepare_enable(pxa->clk_core);

And in sdhci_pxav3_runtime_resume():

    clk_prepare_enable(pxa->clk_io);
    clk_prepare_enable(pxa->clk_core);

If clock enablement fails, could the hardware remain unclocked and cause
subsequent register accesses to trigger a bus hang?

[Severity: High]
This is a pre-existing issue, but does the driver improperly handle
-EPROBE_DEFER?

Looking at drivers/mmc/host/sdhci-pxav3.c in sdhci_pxav3_probe():

    } else {
        dev_dbg(dev, "could not get pinctrl handle: %ld\n", PTR_ERR(pxa->pi=
nctrl));
    }

If devm_pinctrl_get() returns -EPROBE_DEFER, the driver drops the error code
and allows the probe to succeed without necessary pins. Will this cause
high-speed SD/MMC cards to fail tuning or experience data corruption when
the driver attempts to switch to high-speed UHS modes?

[Severity: High]
This is a pre-existing issue, but are the return values of
pm_runtime_get_sync() ignored during power management transitions?

Looking at drivers/mmc/host/sdhci-pxav3.c in sdhci_pxav3_remove():

    pm_runtime_get_sync(&pdev->dev);

This also happens in sdhci_pxav3_suspend():

    pm_runtime_get_sync(dev);

And in sdhci_pxav3_resume():

    pm_runtime_get_sync(dev);

If pm_runtime_get_sync() fails and returns a negative error code, does the
driver unconditionally proceed to call the host functions which read and
write host controller registers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260823235652.7799=
7-1-rosenp@gmail.com?part=3D1
