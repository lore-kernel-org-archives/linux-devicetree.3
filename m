Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11A63B8407
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 19:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778701922; cv=none; b=El19oFjHK6E2WszGGzhxKgrVcIRQmd6TD78kh3lBvJjV5rDdkE+nbwjqfI95i2tZ3xBxhXU/jT0scXpFICblhF4cVauTDnC8SXCgaCN/L3NF8uNZvIwP6qJcOl1cRQTcvcXXM1BVzTM0s9+H/ult717PYj5Fhg3NpwP4q9xc2cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778701922; c=relaxed/simple;
	bh=EV1a4xyUfqDAG4cb5IPDmYqrwm4bOYiqBcEHrmkLg1I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DoQaQXFZEEkKrnhfcNx4sL4DaDX0NWSsK23roSDXzRkwUTFR303LejpgP6ikgFbefLu/HODWZzZLyaqHr4He2SaZAmyt9IJHCPm8X65irnsirdi9fmHKY9HxbQwEBgtIm+6IMkiyIm676r96nDpqltJXYcTh9CNrHAjTj20vtiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KFQRCJoX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFQRCJoX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435EDC19425;
	Wed, 13 May 2026 19:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778701921;
	bh=EV1a4xyUfqDAG4cb5IPDmYqrwm4bOYiqBcEHrmkLg1I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=KFQRCJoXiYUTbPczIw9Pq7gtcFHsaE5Jmuv+xZLZH/hS3RDDSvUl5xEj8LGuTEMtF
	 zkUNd2A04QRYEsI1bJOs3J7Hw5cB2bB9nPyYq2KA1mstBgL4dsxXbm1cbk11Xgkede
	 ISM+jCWiQ/XJ+f73/Divw9cYrXq4BFdIUl8egKvrsvHcU1i5dvHF7JbVH2VyPB27a/
	 EiBB3ikACKHWZxGRwXtIduBZ4Kt6e6mJEvarPd0PPqX7o86I3Ykwe3my0B8LYQ4GpN
	 xby47/CXXZH2UXss4sNzZw+TvJ7RyaQCRO0S/TTK9ek8jNdy+Q+1vjs950MsPl6Ijp
	 MdzmDkzO46aOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/6] regulator: dt-bindings: mt6359: Deprecate bogus
 vcn33_[12]_* split regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260512085358.1693208-4-wenst@chromium.org>
References: <20260512085358.1693208-4-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 19:52:00 +0000
Message-Id: <20260513195201.435EDC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The regular expression for the deprecated regulators lacks the end-=
of-string anchor `$`, which could match unintended properties.
- [Low] The binding's example section was not updated to reflect the new, c=
orrect regulator definitions.
--

commit 75d8942658a7e71876edb163381baadd080c5c5f
Author: Chen-Yu Tsai <wenst@chromium.org>

regulator: dt-bindings: mt6359: Deprecate bogus vcn33_[12]_* split regulato=
rs

This commit deprecates the split vcn33_[12]_bt and vcn33_[12]_wifi regulato=
rs
because they refer to the same output. It adds the proper regulators vcn33_1
and vcn33_2 to match the actual outputs.

> diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator=
.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
> index ac925334ae833..eb62d6a0355d9 100644
> --- a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
> @@ -30,7 +30,7 @@ patternProperties:
>      $ref: regulator.yaml#
>      unevaluatedProperties: false
> =20
> -  "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
> +  "^ldo_vcn(18|13|33_[12])$":
>      type: object
>      $ref: regulator.yaml#
>      unevaluatedProperties: false

[ ... ]

> @@ -55,6 +55,15 @@ patternProperties:
>      $ref: regulator.yaml#
>      unevaluatedProperties: false
> =20
> +  "^ldo_vcn33_[12]_(bt|wifi)":

Does this regex regression allow incorrectly named device tree nodes to pass
validation?

Without the $ anchor at the end, the regex will incorrectly match any prope=
rty
name that merely starts with the pattern, such as ldo_vcn33_1_bt_invalid.

This would allow nodes with trailing characters to bypass the
additionalProperties: false restriction.

> +    type: object
> +    $ref: regulator.yaml#
> +    description:
> +      vcn33_[12]_(bt|wifi) are incorrect representations.
> +      Use vcn33_[12] instead.
> +    deprecated: true
> +    unevaluatedProperties: false
> +
>  additionalProperties: false
> =20
>  examples:

Is there a regression here where the examples section was not updated to
reflect the new correct regulator definitions?

The examples block still defines the deprecated ldo_vcn33_1_bt,
ldo_vcn33_1_wifi, ldo_vcn33_2_bt, and ldo_vcn33_2_wifi nodes:

        mt6359_vcn33_1_bt_ldo_reg: ldo_vcn33_1_bt {
          regulator-name =3D "vcn33_1_bt";
          regulator-min-microvolt =3D <2800000>;
          regulator-max-microvolt =3D <3500000>;
        };

This can cause make dt_binding_check to issue deprecation warnings.

It could also potentially mislead developers who copy the example code into
their device trees.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512085358.1693=
208-1-wenst@chromium.org?part=3D3
