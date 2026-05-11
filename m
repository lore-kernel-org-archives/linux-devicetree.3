Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1F92C11E6
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 21:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778536470; cv=none; b=aCvShOQA/YxK0+Q6daunIlAwmM/T2thrr6jy0UAvyh38H05xbjp83GiN1jf+aov5r6hXB56UWrcESDZ84F6BHemYfQgziFpjQZW0cZTHE/JVitKLkJPZAeaYRGGF+yB2Gc7UbkaZ0EDSuAB6sGo5shgvWI7AqhS58n2iC9RUBBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778536470; c=relaxed/simple;
	bh=Wy1AvQIcsJmell4zzVpOgol7ox0yFYD5rMyHUKBtO6Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OvEc5srrzWEXBuDPpiI4dVzlB2v7XKGbyK3Btm/ukp+6aOBBmKKC40i8PW4NRfiLVLHy8oSkS+eY5XQDn+V+9SGOU9hHE5gCAs7Z5xGEfkWFZLgeZHLYZ3bHhY4M8XP3cRGBNKH/uu2hVQjR081RcPA6+2nCx3AsvjA71vYCXIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s6kffboM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s6kffboM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4441FC2BCF5;
	Mon, 11 May 2026 21:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778536470;
	bh=Wy1AvQIcsJmell4zzVpOgol7ox0yFYD5rMyHUKBtO6Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=s6kffboMnRICvh/TX7/TVTkqzRoprV+/CjJuyK+4JNNvWyRiHluYGdGl29S/uSqMu
	 FmaEkpyoUZ5Kc0jw5Syu3AyYFMG4/kjVlzr3Q/PJBsuB3x8LGA1JI4FeZVmm1DQ/ej
	 wqav3iyRlB0MOLT5nkEksMR8LlrP0Gr9+dorZh+kPO/5yEwOD4BVgmwJKFP9J/bZmE
	 sIyttSAgt17XkSrkRbt8w5Q8Vz6m4tNoQ1KvZd6x0Ze0Q4g2mGeo3ulNsjB1evXYRL
	 z0t6g7jQQCozUPX6vBulKz3jC3Tv7WbAvNp9hsbzy0ByF8a3QLAFbQLLQar43rkqKr
	 bu/WHBiti6CXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 04/11] dt-bindings: iio: adc: hx711: add HX710B
 support
Reply-To: sashiko@lists.linux.dev
To: "Piyush Patle" <piyushpatle228@gmail.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260510194947.31997-5-piyushpatle228@gmail.com>
References: <20260510194947.31997-5-piyushpatle228@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 21:54:29 +0000
Message-Id: <20260511215430.4441FC2BCF5@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `dvdd-supply` property is incorrectly permitted for the olde=
r HX711 variant, violating the intended hardware constraints and contradict=
ing the commit message.
--

commit b2ce63274d21d343a80ad3dfc6983d09ccc4fbdc
Author: Piyush Patle <piyushpatle228@gmail.com>

dt-bindings: iio: adc: hx711: add HX710B support
   =20
This adds the avia,hx710b compatible string and documents the hx710b-specif=
ic
dvdd and vref supplies. It also adds constraints to forbid hx711-only
properties on hx710b nodes and requires vref-supply for hx710b.

> diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/=
Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> index 9134bbe413796..b2b5c7bdf05e6 100644
> --- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml

[ ... ]

> @@ -44,6 +49,17 @@ properties:
>        RATE pin state is determined by the board wiring.
>      maxItems: 1
> =20
> +  dvdd-supply:
> +    description:
> +      Digital supply voltage (DVDD). For the HX710B, DVDD must be
> +      greater than or equal to AVDD. When DVDD is a battery rail and
> +      AVDD is a regulated supply, one channel monitors the DVDD-AVDD
> +      difference for battery level detection.
> +
> +  vref-supply:
> +    description:
> +      Reference voltage input (VREF).
> +
>    clock-frequency:

[ ... ]

> @@ -53,6 +69,21 @@ properties:
>      maximum: 2500000
>      default: 400000
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: avia,hx710b
> +    then:
> +      properties:
> +        vsup-supply: false
> +        rate-gpios: false
> +      required:
> +        - vref-supply
> +    else:
> +      properties:
> +        vref-supply: false

The commit message states the intention to document the hx710b-specific dvdd
and vref supplies.

Since dvdd-supply is defined in the top-level properties block, does this
else clause also need to forbid dvdd-supply for the older avia,hx711 varian=
t?

Currently, omitting dvdd-supply: false permits the property for the older
hx711 variant. Should dvdd-supply: false be added here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510194947.3199=
7-1-piyushpatle228@gmail.com?part=3D4
