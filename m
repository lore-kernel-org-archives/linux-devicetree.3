Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4817472771
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 13:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786109896; cv=none; b=tkWJmaTys1AbNCM6kE9I89kyxu6upQUPskcwZ3fcHaTu1SZkYkYuWU3HxCVGSefgX2NtX0lSnoRzO/YL9GtqxdpGft2oDZuXMwuZuqfvEY8up9YiWjKMFQL3SI/0vyRqHK++d7Kuo7bfdOCYNKFbmybxmnpMS2YPwzziRijWsFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786109896; c=relaxed/simple;
	bh=j5Asb2UkIaOJoyrfAwLUghKnxztFsh1ejS8m+siuLXA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qOEzZ//zFW71IQ0EZwXj9H9CQ1gmXL9UMTvvnMtmbKGCFP9urJYS+lzkMdibShTLw7gtbSHSprX/fqUhRSMpgyAtYUoT9I66txL9ajnzCsVGO8IANEreYhMv0VVwCRMRhQW54/8Czj1xVShJd7zFYkkUNuz5fzUL88dIk2KseQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lbrwZfbR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbrwZfbR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5877A1F000E9;
	Fri,  7 Aug 2026 13:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786109891;
	bh=LvJvz1ZKlgzAwyDgOX6Vrpi8wJbkk1ey/OV8P4gQz/A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lbrwZfbRQtOE96UbfBMMbFUiErfcgNAHW4P4kh7Ruw7Ff55eP0CTwXm0y2TY5vnvi
	 zhlq5hWsk8Zsn9EylPu5YVu/VEXVFKEhIJXbmlpk3F/vuYXmTSxe3hRd/Vp/0mARd0
	 25ftN6pV8tBoDVtyayoSCX+zTHjZNH3EEDDw1xJVkunh4N8Sy36uvJeFCdSaSCELrz
	 mCtwNzzQZ4BS6rzAWPg5tm/kIIzFM9Urb21EDRK8OKJVcwaKJr6eXJi/jwWnKuo3A+
	 VGvzEAelnvKm6gEjtOkNuzQL70O/xLB02d63n+WHeJWEijK9qRtqdOXYsDVT/FAap8
	 LoFWXAfZzk0OQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 12/22] dt-bindings: media: i2c: add MAX9296A,
 MAX96716A, MAX96792A
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807-gmsl2-3_serdes-v15-12-7212e9e5156a@analog.com>
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <20260807-gmsl2-3_serdes-v15-12-7212e9e5156a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 13:38:10 +0000
Message-Id: <20260807133811.5877A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `i2c-alias-pool` property is artificially restricted to a ma=
ximum of 2 items, breaking validation for standard dual-link camera configu=
rations.
--

--- Patch [12]: [PATCH v15 12/22] dt-bindings: media: i2c: add MAX9296A, MA=
X96716A, MAX96792A ---
commit e68b0ac7c49e56511d1d1a563e3454615bdf8543
Author: Cosmin Tanislav <demonsingur@gmail.com>

dt-bindings: media: i2c: add MAX9296A, MAX96716A, MAX96792A

This commit introduces device tree bindings for the Maxim MAX9296A, MAX9671=
6A,
and MAX96792A GMSL to CSI-2 deserializers. It defines constraints for the
various supported properties, including ports, power supplies, and the I2C
address translator layout.

> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.y=
aml b/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> new file mode 100644
> index 0000000000000..de6bfcec5dc63
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
[ ... ]
> +  port0-poc-supply:
> +    description: Regulator providing Power over Coax for GMSL port 0
> +
> +  port1-poc-supply:
> +    description: Regulator providing Power over Coax for GMSL port 1
> +
> +  i2c-alias-pool:
> +    maxItems: 2

[Severity: Medium]
Will this limit of 2 items break validation for standard dual-link camera
configurations?

A typical setup with two GMSL links often includes two serializers and two
image sensors. Such a configuration would require at least 4 I2C aliases in
the pool to translate all remote peripheral addresses.

Does this constraint incorrectly map to the number of GMSL links rather than
the expected number of remote I2C devices?

> +
> +  i2c-atr:
> +    type: object
> +    additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-gmsl2-3_se=
rdes-v15-0-7212e9e5156a@analog.com?part=3D12
