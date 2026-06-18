Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF5C3F39DD
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781784848; cv=none; b=WskfTTFKfTjpdFibfnKIVkwL1yjQ7RRNjZIRbnv0Oc3qvit7R9MTm2CHq/BJi5ljp1E5EP6x3x7TAcH9RlvZHMbnmkFiUMd8R95sH9Pg6PTfPEH+RBFbxEIpI3Bmq8nBwU2TxSew9B+e9McNj0e2r8JVWDSEyruXZKRZ5chdhBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781784848; c=relaxed/simple;
	bh=VY/VoAIzKfy8md3Nh1SyGJKfZgKQG+izXGdilhEBIBo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l8nj87YEkEkl9W++teVGgOAAKdlQ4LLhlJr2FK+RbTsOIuuBtRsaCdipMyXKwXcDOWDBjgLtHlo45YGGHohb+umFAqgjXEuXgKS6H2lWLMzY5aMPKRbB9ediB+E8CYb6u8kji7Yv+7v0kLgXOsJhdEkw5P9sbuUeobRvcC1vgY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T8pEP4kP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T8pEP4kP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5831E1F00A3A;
	Thu, 18 Jun 2026 12:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781784847;
	bh=SzN/D/x2F/5m79hQimGs6uI2nJgEpiJjQblPF7Vyjk8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T8pEP4kPgTWEIhevfetOcm4w1YuDMZuWdMcF7PcfEfVycdmn8oPakifQUe5N1R8Oi
	 H38Og+NdRpS2WUWLnWKt0o9tvXLVyDpItMz8KhiMsXVL95+PqMzWlDAhfS8PRn1gIQ
	 gVm7MuUmCg35XP50+3ycFsFR0aAhffW3q05SaED7J2Rwe0YdfIN/ce5OBKNHy4yMUl
	 ZddFK6uZ9aLwMFBhaOIUqHcTQzHTKazQIhdwrb2ZbE5RdnKjsZqLaB55xQyXA5rXpN
	 BoWkrIdPdtr53Bos6CHdTIRUQkNAT/5KQHvztZxI84ClWfCY27gnLm6I570La+s1e7
	 LLQRL+bfdKicA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sm8750: Add camss node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260618-pakala-camera-v2-1-9fbb729fd242@oss.qualcomm.com>
References: <20260618-pakala-camera-v2-0-9fbb729fd242@oss.qualcomm.com>
 <20260618-pakala-camera-v2-1-9fbb729fd242@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 12:14:06 +0000
Message-Id: <20260618121407.5831E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch introduces a new device tree node with the compatible str=
ing 'qcom,sm8750-camss' but fails to provide the required dt-binding docume=
ntation.
--

commit b023f9563ab4fb78586aec9991211a5cce1748d9
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

arm64: dts: qcom: sm8750: Add camss node

This patch introduces a device tree node for the SM8750 camera subsystem
(camss).

> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/q=
com/sm8750.dtsi
> index 18fb52c14acd7..ad3a23dc175de 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -3005,6 +3005,209 @@ videocc: clock-controller@aaf0000 {
>  			#power-domain-cells =3D <1>;
>  		};
> =20
> +		camss: isp@ad27000 {
> +			compatible =3D "qcom,sm8750-camss";

[Severity: Low]
Is there a dt-binding patch included in this series for the camss: isp@ad27=
000
node in arch/arm64/boot/dts/qcom/sm8750.dtsi? Adding the qcom,sm8750-camss
compatible string without matching documentation causes make dtbs_check to =
fail
when validating the new node.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-pakala-cam=
era-v2-0-9fbb729fd242@oss.qualcomm.com?part=3D1
