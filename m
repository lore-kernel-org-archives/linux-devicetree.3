Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEF5338936
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 15:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783868829; cv=none; b=OYr1Timvv0CtSkHePXR9bfaX7DawWNO/lrUO8h0CEFmz9EtqFG56UHYN355+f2f3B9/WtRfLRjAxIPDeHCAZFt5Mjlyl5HHJHQv4ErqsL6qfs+hxcfUOX//uPH1oR5sNPDF3UcE7XjWSQZfWk/t1TtqxsuspJFHmhutoy04IyH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783868829; c=relaxed/simple;
	bh=MpwmTm9lpYiSebNgqs15AcemjrEKdUu/uHtzGTc1WZM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pkYpbA1TM7HTc606fwnsd+AbORTjAsAuaxE1h7hBoy2RdqaqAPrS2EMpUtE1mjoluNGEZglTSCKk/m7Rf9iXHyDEUWxdcyC/zPVtt1nGyOXIXi24sv2kVSUHG6tLbzqw/eNXSwwWedrcKSmfBNteXIgwPcKIsJ2zkw2j1hP61Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kslMz+NK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kslMz+NK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A411F000E9;
	Sun, 12 Jul 2026 15:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783868827;
	bh=PexZsrIw8yZcaT2J/RBRrQI4KwQuXyWhnitzYNjbA4g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kslMz+NKm64orvSxs3RVhWXXix9rcN/tW8jWNNr/RYPidf1MsiyDT0EH1eO6CPfls
	 fX2FLfV78IMY8k7cY/8MxhblpBYmzzTPAoK/gyNUY0xTNfmXPyAcz1jewvmcroiERo
	 q5ST49vxNsck825c5OKU/r5AwTBnlT8os+aXCcIaRYz0ZvuxSo09bz5lnThQ73Nza1
	 3refVksGL3d78HFunp1SyPunwKlKUrvj2GvEzgRQNvSFjW9Rj6EMTnZ6NlkBArzfmf
	 T6Ju6YxN+aPagB22vAGJwAz85arkKLi2L5JkxVOkDJ98acVRW+DvxugKqEtk5QzLaH
	 L8/mF+O3dPiWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: soc: qcom,wcnss: Drop redundant $ref of
 firmware-name property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260712145654.126171-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260712145654.126171-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 15:07:06 +0000
Message-Id: <20260712150707.83A411F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Schema validation error: `default` value for `firmware-name` is a s=
calar string but should be a string array.
--

--- Patch [1]: [PATCH] dt-bindings: soc: qcom,wcnss: Drop redundant $ref of=
 firmware-name property ---
commit ee3e2676da46575844622ab43164871fd3c8d4ab
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dt-bindings: soc: qcom,wcnss: Drop redundant $ref of firmware-name property

This commit removes the explicit string reference for the firmware-name
property and replaces it with maxItems: 1, implicitly adopting the
string-array type from the core schema.

> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml b=
/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
> @@ -19,7 +19,7 @@ properties:
>      const: qcom,wcnss
> =20
>    firmware-name:
> -    $ref: /schemas/types.yaml#/definitions/string
> +    maxItems: 1
>      default: wlan/prima/WCNSS_qcom_wlan_nv.bin

[Severity: Low]
Will this cause dt_binding_check to fail? Since the property type is now
implicitly a string-array due to maxItems, should the default value be
updated to an array format like [ wlan/prima/WCNSS_qcom_wlan_nv.bin ] to
avoid a JSON schema validation error?

>      description:
>        Relative firmware image path for the WLAN NV blob.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712145654.1261=
71-2-krzysztof.kozlowski@oss.qualcomm.com?part=3D1
