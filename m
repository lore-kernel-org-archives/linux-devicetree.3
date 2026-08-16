Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957F725A655
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 14:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786889705; cv=none; b=ahG39s0VIrVxfzHVbwpDGlScPrRUIqDt1Ylm9o026sI7EOkTwVYmpJLqPgTHD4bQrKqGZMtBy6BHrRI8G4CAb/aXRnUUGxDvf7bnNx2sIZgM+3SiQcIrNjrSTKCBVAresJmnqJh9E9sgrXqpE6tUJXap83/wJ5zhcHykd9BauIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786889705; c=relaxed/simple;
	bh=ObshUOuX/TJC1Nw8zGQe4F872cYo14pVuqzxMIGXE0k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nvf0Q+7ws8RjxCbC6tnQrt+rkw/ftxx/135TpDoOLromL1NpTtA3kwj2LMQtr3LeA56UY3/AuN/9Ids81/MtakJqpp07PZk7KEzFxQg87Wvrfiuf9SJDKqfpvTPKP4/YjlVzwSt4IP65OnFOjywaHAC9D2UGkpTWbxA+ncZRs6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y41ghpM+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y41ghpM+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FD51F000E9;
	Sun, 16 Aug 2026 14:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786889702;
	bh=lrfYzbR/4Lp0myluQo/OyRuHpa6Ndfe510IvTW2egXc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y41ghpM+PEJri/01ylCd+gkwEMmixWiZ8YtuBnvGczoEuRKcAxafFzOt7aZI0XCl7
	 RSaGkLNFgzhyQ2dHuvCrkVNSNWhbyNROgSoOBWXgiq+akRjkItGL90Y7K+BxOUIyHG
	 b5SkIPEwVz2T3LtXI0T5iFODxMSjIUybzzWFc8YfvY8QhKLcY0yfq53oMyBIhP8MTf
	 33ouKR5XzF3YxKOWIXBgCl8vGnqUvjKvHhpSlcwbD6gZkm+PsCI6V0lWot4jKdzDLA
	 3qszeE8ddPaeyS3Q4eRnbzoGS5EBQM3EsRlu6DXcmG5hCO6SwnIEhTYW1cYZKqJ8IH
	 Y6W3P5+giIEeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] ARM: dts: bcm2835: Add the V3D reset line
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260816-vc4-reset-control-v1-4-896444373716@igalia.com>
References: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
 <20260816-vc4-reset-control-v1-4-896444373716@igalia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 14:15:02 +0000
Message-Id: <20260816141502.96FD51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] GPU hang recovery is permanently broken for older BCM2835 device t=
rees that lack the `resets` property.
- [Medium] Missing `pm_runtime_mark_last_busy()` in `vc4_v3d_pm_put()` caus=
es premature device autosuspend.
--

--- Patch [4]: [PATCH 4/4] ARM: dts: bcm2835: Add the V3D reset line ---
commit 911a73ec97f6adb52d8c5867c354702414eb11dd
Author: Ma=C3=ADra Canal <mcanal@igalia.com>

ARM: dts: bcm2835: Add the V3D reset line

The PM block exposes a reset line for the V3D block, which the vc4 driver
uses to reset the GPU when recovering from a hang instead of forcing its
power domain down. Wire it up in the shared V3D node, covering BCM2835,
BCM2836 and BCM2837.

> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi b/arch/arm/bo=
ot/dts/broadcom/bcm2835-common.dtsi
> index 1e76b290510d3..39eea8ce10583 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
> @@ -139,6 +139,7 @@ v3d: v3d@7ec00000 {
>  			compatible =3D "brcm,bcm2835-v3d";
>  			reg =3D <0x7ec00000 0x1000>;
>  			interrupts =3D <1 10>;
> +			resets =3D <&pm BCM2835_RESET_V3D>;

[Severity: High]
Does this change mean GPU hang recovery is permanently broken for older
BCM2835 device trees that lack the resets property?

Looking at vc4_reset() in drivers/gpu/drm/vc4/vc4_gem.c, it explicitly skips
resetting the hardware if the reset line is absent:

	if (v3d->reset) {
		drm_info(dev, "Resetting GPU.\n");

		ret =3D reset_control_reset(v3d->reset);
		if (ret)
			drm_err(dev, "Failed to reset the GPU: %d\n", ret);

		vc4_v3d_init_hw(dev);
	} else {
		drm_info_once(dev, "No reset line; GPU state is not reset.\n");
	}

Will this cause the system to be unable to recover from a GPU hang on older
device trees, making the GPU effectively unusable after the first hang, and
breaking Device Tree backward compatibility guarantees?

[Severity: Medium]
Also, does the driver suffer from a performance regression due to premature
device autosuspend?

Looking at vc4_v3d_pm_put() in drivers/gpu/drm/vc4/vc4_v3d.c:

void
vc4_v3d_pm_put(struct vc4_dev *vc4)
{
	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
		return;

	pm_runtime_put_autosuspend(&vc4->v3d->pdev->dev);
}

Because pm_runtime_mark_last_busy() is not called before dropping the
reference, the autosuspend delay is calculated from the resume time, not the
idle time. If the job took longer than the autosuspend delay, could the
device suspend immediately upon dropping the reference, causing power-cycli=
ng
overhead between back-to-back jobs?

>  		};
> =20
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816-vc4-reset-=
control-v1-0-896444373716@igalia.com?part=3D4
