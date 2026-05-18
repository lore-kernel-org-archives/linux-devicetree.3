Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3949A3A6B61
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779142262; cv=none; b=QX8hwg0x8ZadJ67ugDPdMcKzbQfu8Gwg3fS3a7c+x8cIxjTzfMVc4HWRkLxIdqcHL3/qh4myZJPmsT+k+fDG4ePyD9x8IW15lrtASZx18q/vghkPrP1ieQlmVQTbtUELEhPVMNmnZdmtvpeF3u8vmM37jPEqKIbwYZMCr9pbe0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779142262; c=relaxed/simple;
	bh=Efi4RAG8RGsHB1BAVv/9Ai/jkH8Dz/VK2OAPKg4ddMs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=niXPihrjY9t8hh5bV9iC4C0tT40jqMB9YLcYeT64hiVf5kKWAX1LkWf9+CvLnVHMyUvcn8BQOtJluYRbd8+/J51yupD4MLKVBbodeYiZZ+P12odleYMtXCC7iq3EB2sNcJT1JrfCHA8NloueKUrzky4YAbT5k1utRzZyxV5eHLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6Q0wXST; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6Q0wXST"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38E9C2BCB7;
	Mon, 18 May 2026 22:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779142261;
	bh=Efi4RAG8RGsHB1BAVv/9Ai/jkH8Dz/VK2OAPKg4ddMs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=N6Q0wXSTZUreWg7q94WcrTi/SLgHn90XrW8GhSItyaBWoprc3dXq5RJJsIeAYS9Mq
	 x9GxVxErUzPGqYPrbv77SC7vztNcoNuCyNuDcdEG9OU8BSvQN2hj+s/Mnfgd3h5zzA
	 P2aY+uHlKu4VtGVzFmQ5buyikfjnJfRX9FrOUtFI/ajPiL5SXlFSy8BhoadaBvSMZi
	 Dj6MSAYk3fSAmQqJNCbNb35oQQlUeLmxVLWScaqv8NnAUSt8C1qraylWgiRCRuD6RO
	 PoEcINNHDunIZF1p6lXrikgTMj9sUNBI2HW901Ppquqp1vvT/CuaKJnqpKlt6r6Q58
	 Fioxn8btz0EIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 04/11] dt-bindings: iio: adc: hx711: add HX710B
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Piyush Patle" <piyushpatle228@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260518220228.63322-5-piyushpatle228@gmail.com>
References: <20260518220228.63322-5-piyushpatle228@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 22:10:54 +0000
Message-Id: <20260518221101.A38E9C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added `dvdd-supply` property is described as HX710B-speci=
fic but is not forbidden on HX711 nodes in the schema.
--

commit e277e4c3f21226be9f52ecf29adbdc5f6f73f38d
Author: Piyush Patle <piyushpatle228@gmail.com>

dt-bindings: iio: adc: hx711: add HX710B support

This commit adds support for the HX710B ADC chip. It adds the avia,hx710b
compatible string, documents the HX710B-specific dvdd-supply and vref-supply
properties, and updates the schema constraints.

> diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/=
Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> index 9134bbe413796..b2b5c7bdf05e6 100644
> --- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml

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

The commit message mentions documenting the HX710B-specific DVDD and VREF
supplies. While vref-supply is explicitly forbidden on HX711 nodes in this
else branch, dvdd-supply is not.

Does this schema unintentionally allow the dvdd-supply property on avia,hx7=
11
nodes? Should dvdd-supply: false also be added to this else branch?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518220228.6332=
2-1-piyushpatle228@gmail.com?part=3D4
