Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023328;
	b=ezChdFBV7ErKNDCfFe8Md+QcKXwogu7E0z7LLFBdwI2yQIk6e7hOaV5c6hOkIoOofqGk
	 cyjznzndgbbFlOIz7z5Vk8nBRi5inlEaLnVhMI57dmO6AeSu/i69vPlJaBM5/1gjnP/p7
	 r/3wlCGlJwAK4ZhRQxgEAbostv91bDHePVp7uZq7ZDgRMkjzUxhdvwrYz8/5463cyyhpt
	 DrCpI+TNuM2qwgNC2FdPRp+14zr74ZfB2mboIVUF4Sxkt2PH6qwlySktFN07ZaXr9GBUE
	 bHFZtfA/kgArDMsksWY64kYX/PV7BFjoBeVdq+q2pk6SVIHum0ghmKJErR4kMG0CPHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023328;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2uWCRDuODnY58Uyfoue4Yo4N5KO6wwI6SBmfACaKwkk=;
	b=Tuff475XwBLYp7EHm9a/PpPtR3fIJ313ft+bNfSH3TTdCRkg9zYk5IlmC9Mhm1jjzku3
	 vXkIX0kuDaB0pzFdNpCaoCOoBXVoi2vDPUz8sjNl9JgdD/ZKpMFes6MhwZwBG8jLzg9Rs
	 m9bbNXpugXcK+FZsjgKEkD/a1SbUElUPWXImUFNXXKijsI335cwxnUXpv8Yqs1NOsONA6
	 TavZljieKL3vnlfWgUa1tj21jyPyPTgEiCWgA5ScANcgoMO35K4g/a/pT/C2UBY294hMR
	 ro6aXjTOgfxbo8wDgVRPTjaxKfGX7w+kFYNB8oNUoqSpXu+6aTUSu3A+etRaovjpRDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="H1wa/+fz";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B710606A330
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 17:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H1wa/+fz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78F71F000C5;
	Wed, 18 Nov 2026 17:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795023328;
	bh=2uWCRDuODnY58Uyfoue4Yo4N5KO6wwI6SBmfACaKwkk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H1wa/+fzKw9ux7oTezSjWzt+Ey2QzSBtrc8VVwBWGumYCEZ72v7SM0mpGwH0kzswT
	 rlRdo0yhvT5VQNIRIyfQmpdvQJX0PyREBd4fC3mBbuFh7nM6FkO65hmwf3Zfyc7ciM
	 auqYHGmgrcy1ds+c+mGZHl2FudxXeHX5cInxAtLFPcPcWo4TF5XZp+xLvqECGU6MKD
	 ZbBYxntGeQPC2l1POK94N/oeFa38uc7In1qgMH/Cn0lKcv46ua0veBIRaouhasWi/r
	 d7tak7HkODCa6nTqmG4Axd01SzCvVdTpIzAzXHlEyma5kmvSS5CA+jvscH38xZeGMh
	 7a04LIZyHRIeA==
Message-ID: <sashiko-outbox-221663@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/12] arm64: dts: qcom: pm660: Add node for PMIC
 VBUS booster
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-pmi8998-vbus-v2-6-3c77a72b280a@ixit.cz>
References: <20261118-pmi8998-vbus-v2-0-3c77a72b280a@ixit.cz>
 <20261118-pmi8998-vbus-v2-6-3c77a72b280a@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 17:35:27 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: qcom: pm660: compatible mismatch with
  usb-vbus-regulator schema
--

commit 4860c32276902904ecaa66c748be4bfd758d569f
Author: David Heidelberg <david@ixit.cz>

arm64: dts: qcom: pm660: Add node for PMIC VBUS booster

This commit adds the USB VBUS output regulator device tree node for the
PM660 PMIC.

> diff --git a/arch/arm64/boot/dts/qcom/pm660.dtsi b/arch/arm64/boot/dts/qc=
om/pm660.dtsi
> index 156b2ddff0dcb..fe9ef304d64e7 100644
> --- a/arch/arm64/boot/dts/qcom/pm660.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm660.dtsi
> @@ -90,6 +90,13 @@ pm660_charger: charger@1000 {
>  			status =3D "disabled";
>  		};
> =20
> +		pm660_vbus: usb-vbus-regulator@1100 {
> +			compatible =3D "qcom,pm660-vbus-reg", "qcom,pmi8998-vbus-reg";
> +			reg =3D <0x1100>;
> +
> +			status =3D "disabled";
> +		};

[Severity: Medium]
Does the fallback compatible "qcom,pmi8998-vbus-reg" here mismatch the
binding schema added in commit "dt-bindings: regulator:
qcom,usb-vbus-regulator: Add pmi8998 and pm660"?

While qcom_usb_vbus_regulator_match in
drivers/regulator/qcom_usb_vbus-regulator.c matches
"qcom,pmi8998-vbus-reg", the binding defines the fallback constant as
"qcom,pm8998-vbus-reg" (missing the "i"):

Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml:
      - items:
          - enum:
              - qcom,pm660-vbus-reg
          - const: qcom,pm8998-vbus-reg

This mismatch causes dtbs_check validation to fail for boards including
pm660.dtsi.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-pmi8998-vb=
us-v2-0-3c77a72b280a@ixit.cz?part=3D6
