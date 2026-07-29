Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DD536F8F5
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 22:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785362939; cv=none; b=LvMqWj2mnjhDrE5v8oY8ipdbugFq70WRa23O2zWAyYTJjhlbOaTZ6oCZDkBRGKe2tvvGEpUberu2R0MaLG9fb4IGEVxLvdwJkbBz0bIRCgBS81TX1hIoYxuDrOA298OO/KtRcuw67wf8g2rnQTNiDt9eIkVzIDvoMTgG7aDERQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785362939; c=relaxed/simple;
	bh=Qv83pZkTwk8cTg4Fv02oL+XpU//mD0ctqQF29flqb4M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dBKPaJAuQ8xOqk5/nOG1hzFP8BHvwi98g1Aza1fSwZpzFXjGl7b/Idc1abU3JNo276p8IFLxV4Gjpb5qRv4qq+2aLWyNNp96gdr5CdG4Q4iBgZ87pQlmDeQvEEFRqdKXdcFDuNC4cYaM0z7t0HmgE22STWhHi149Sbf2v7B0fC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W6l+JCum; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W6l+JCum"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA4E1F000E9;
	Wed, 29 Jul 2026 22:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785362937;
	bh=zMoomxKsynFE4JSA+0MJpbIZiipGeVN/ZLZSuc0EmYc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W6l+JCum9GM5hUWtwLTpVELrH44NJRKKzy39djZMOJgTRp5u8if707eQTXozTHkZ1
	 MEVwMxCKwdqwLv2DoDwzUKqEax7gsaZei3V72UiOpFadp910Ny9y1gMT93193drae+
	 ejM91Kyj0rbTz2za2kcITujVJTXv810d5ghMh0ixYQSQVL4rLwxsYkjVEXvj0Z+9BU
	 496huhyUCLYc/DPf0SppFWzLe7kyRtPbqBnr1/QuAydlgJ9f3rcrkrxYJueGD1WngZ
	 9D9F9zx0DF3nSEF29e6lPiMBYdwqCak6CxZIyeakc8M84xCnKgahqzkZIV3pGasyZQ
	 zezdzQYBVshYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-shift-axolotl: Add
 actuator for main rear camera
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: conor+dt@kernel.org, robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260729-dw9714v-v1-2-3c479b3cf8c0@ixit.cz>
References: <20260729-dw9714v-v1-0-3c479b3cf8c0@ixit.cz>
 <20260729-dw9714v-v1-2-3c479b3cf8c0@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 22:08:56 +0000
Message-Id: <20260729220856.EEA4E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Deprecated node name for the fixed regulator 'cam-bus-2p8-regulator=
'.
--

--- Patch [2]: [PATCH 2/2] arm64: dts: qcom: sdm845-shift-axolotl: Add actu=
ator for main rear camera ---
commit 4edbb2eb79bd8137a526316cca12432942ca08b4
Author: David Heidelberg <david@ixit.cz>

arm64: dts: qcom: sdm845-shift-axolotl: Add actuator for main rear camera

This commit adds a fixed regulator and actuator node for the Dongwoon
DW9714V main rear camera actuator.

> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm=
64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index e31c784eff3de..6d0254e205850 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -86,6 +86,32 @@ battery: battery {
>  		voltage-max-design-microvolt =3D <4400000>;
>  	};
> =20
> +	/* SGM2036-2.8YUDH4G/TR */
> +	cam_bus_2p8: cam-bus-2p8-regulator {
> +		compatible =3D "regulator-fixed";

[Severity: Low]
Does this node name trigger a dtbs_check warning during validation?

The fixed-regulator schema typically expects node names to use a regulator-=
=20
prefix to match its regex pattern. Naming this node regulator-cam-bus-2p8=20
instead of cam-bus-2p8-regulator would match the preferred schema and avoid=
=20
triggering a deprecated pattern warning during static analysis.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-dw9714v-v1=
-0-3c479b3cf8c0@ixit.cz?part=3D2
