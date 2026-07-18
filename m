Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD90345CDD
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784376816; cv=none; b=FRhFdWZpEm2MMbLWhVOpJ5DyiU/DOYj3IUgeBu99Yw9Io7lu5SshCEJ77MXedR72Aat1us/Kc0YsdIbtqJrRfL9btzKcLToViIqTFmxNOg02e5yeBQEeAHyBRRBWfJE5Nqg/TAAk6awIDPuCzRSbjUmg8M0LNVCkyXCDVp9UqnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784376816; c=relaxed/simple;
	bh=ahGedmz4KIwG5D9g6N8Bsit1R/L0NEk9pJRDw1cB3Mg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OI/R9EXIZQ9i134tNUCvP6cftvTypCGrRo7IlxuayAFubrhAl6gJ1Sa+/M+qiFUkrcuXAdsJK/gar/cy5CWCF+1oV6XugQ94bihdwJoaCprApK03Jcyds3uAjsFiAVoxil721LQPoAKExKyDaugnurDAlj3RHdUKHtGLVaB3NZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VSUf8vIv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VSUf8vIv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 341F81F000E9;
	Sat, 18 Jul 2026 12:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784376815;
	bh=ivANB74AHS3OZkHYidPym7fmiJqn/YAVTA6cWRLBpMk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VSUf8vIvZrZrIQr2fich/luzw/RMAjkTM1uSBl2QIUV5HgIXCIuEqs69d5gn6E8oq
	 MdIxo7Eh7dNUL5B8P919Qbqm0xEV3w2ss4cXpTGNHSX50U6JESkEp5C2l6fWnOD6VD
	 bYXbqeqBoS+XMkpkqyGaO9xLja7YMp9zMpO53b3p6iId57kxCBaOX4/QeIGn/BYObY
	 2k00m3F6GNBHswuQX6ISssZ0wr3CjZpxqoXyXELYqGwZ2bAA4AZS7V3hUjvuwdOCKS
	 mOYFrs2y7P5ow60IH/IiDx8R+88NOLTU61jFmjT6rbJu5KMI/0nbjL3Kle8gqOQD16
	 KMDBdWcmkxh3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Kalambo SoC and
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopikrishna Garmidi" <gopikrishna.garmidi@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260718-b4-kalambo-crd-v1-1-a1069b5a2757@oss.qualcomm.com>
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
 <20260718-b4-kalambo-crd-v1-1-a1069b5a2757@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 12:13:34 +0000
Message-Id: <20260718121335.341F81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The Kalambo SoC compatible string schema lacks a fallback to its=
 base Mahua SoC, preventing reuse of existing kernel drivers.
--

--- Patch [1]: [PATCH 1/5] dt-bindings: arm: qcom: Document Kalambo SoC and=
 board ---
commit 495e4544978416b176f59d42fe901afdd835094e
Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

dt-bindings: arm: qcom: Document Kalambo SoC and board

This commit documents the compatible strings for the Qualcomm Kalambo SoC
and its Compute Reference Device (CRD) board. The Kalambo SoC is noted as
a derivative of the Mahua SoC with CPU cluster 0 removed.

> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
> index c7c9a92796846..b0c07a57bda69 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml

[ ... ]

> @@ -174,6 +174,11 @@ properties:
>                - qcom,kaanapali-qrd
>            - const: qcom,kaanapali
> =20
> +      - items:
> +          - enum:
> +              - qcom,kalambo-crd
> +          - const: qcom,kalambo

[Severity: Medium]
Since the commit message mentions Kalambo is a derivative of Mahua, should
this strict two-item list include a fallback to "qcom,mahua"?

Without the fallback, core drivers that match strictly on "qcom,mahua"=20
(like qcom_pd_mapper and ubwc_config) might fail to probe, or the device
tree will fail dt_binding_check validation if the fallback is actually
included in the device tree nodes.

> +
>        - items:
>            - enum:
>                - qcom,mahua-crd

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718-b4-kalambo=
-crd-v1-0-a1069b5a2757@oss.qualcomm.com?part=3D1
