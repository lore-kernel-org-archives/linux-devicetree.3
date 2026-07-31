Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E304779B9
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785523026; cv=none; b=j7W93NQpYGlJh1VfnC8rAohnaksj8dDdviWJpXjQi+3eUMNjVz3U7YQuQJD/Hixy32uErhV6ux41JhSsKFAcCAjkGK2KxXgg+2fVOtyEHH6XtHz123l6AxkplEJ+n+uzDospk6oDVV23jczJ1Cl1NlfH7z9psRs00zqvxNLQjqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785523026; c=relaxed/simple;
	bh=x7AMqU3UXgVMxm7jyT2tjTwZaR/VAclWp4wQfgFtpGY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=px2AXQeiG0Y/feIxI97Q3XAOPK9hLG2AFmM2uPBCHeX/2hWzeZaBtxLBd4CZ8nqbRiPKecbaCdTcm/ow0E9hJFSRX/vNDehCbQzXscEpNTDoQntnnX3Anlro4L8VJF5LsKTQpNH+sOiCwp648y31hTsmqnAJk5cQb04qcllE+c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBqZHmAW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBqZHmAW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D36FF1F00AC4;
	Fri, 31 Jul 2026 18:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785523024;
	bh=hFIVwkrTyDRg4x5IaouxNGVMHZXSfiHwFsR7n5YIZe0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IBqZHmAWUCaF7inEo89rQmIHOfqZriV3iAgYdZEXe6WfxdfFvhkVkDRynKEffUqJt
	 kML2HCkYIx5/9C0y2A7Y6H66g/e9vf0sd93RAsUOFe33nG2UZAiATwt+urVEtkufVp
	 b70LWq+oopvdQ6o5IkaN9jWc03UCO+VFheidK8heJSCdHNWCQt71q3FhjGWFKpLeBE
	 Ue5jXTOQ2CH5GW1x5pHsIXLD+b4gQ4CijjQOgzPTic9Rdi7zo3YMaWowAqoqmxT0Jn
	 jTkdcX0K0zAyhWb9RRUioeKhCSr0QzRHPhsElQDkmO2LNa/D+rDUepULXyP3LFL4ED
	 E8cw7aEs2cS3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 20/21] dt-bindings: display: rockchip: dw-dp: Fix
 sound DAI cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260731-synopsys-dw-dp-improvements-v8-20-ac1e6a75782f@collabora.com>
References: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
 <20260731-synopsys-dw-dp-improvements-v8-20-ac1e6a75782f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 18:37:03 +0000
Message-Id: <20260731183703.D36FF1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Changing `#sound-dai-cells` to `const: 1` without updating in-tree =
DTS files in the same series breaks `dtbs_check` bisectability.
--

--- Patch [20]: [PATCH v8 20/21] dt-bindings: display: rockchip: dw-dp: Fix=
 sound DAI cells ---
commit afb955faffe4407ec88a5c35c168c8dd82310361
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

dt-bindings: display: rockchip: dw-dp: Fix sound DAI cells

This commit updates the #sound-dai-cells property for the Rockchip dw-dp
controllers from 0 to 1 to allow selecting between I2S and S/PDIF interface=
s.
It anticipates future Multi Stream Transport (MST) support where additional
numbers will identify both the interface and the stream.

> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
dw-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw=
-dp.yaml
> index 2b0d9e23e9432..c4f8959dd65da 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.y=
aml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.y=
aml

[ ... ]

> @@ -83,7 +83,8 @@ properties:
>      maxItems: 1
> =20
>    "#sound-dai-cells":
> -    const: 0
> +    const: 1

[Severity: Low]
Does this change break dtbs_check bisectability for RK3588 boards?

The commit message mentions that the mainline rk3588 DTS include sets this
to 0 and will be fixed up separately. If the in-tree DTS files (such as
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi) are not updated in the same
patch series, make dtbs_check will fail on those boards during a bisect
until the separate fix is applied.

> +    description: 0 for I2S, 1 for S/PDIF
> =20
>  required:
>    - compatible

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-synopsys-d=
w-dp-improvements-v8-0-ac1e6a75782f@collabora.com?part=3D20
