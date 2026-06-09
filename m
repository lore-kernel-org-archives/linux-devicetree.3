Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F268D3B0AF1
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 10:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000916; cv=none; b=d56qGCOtYUOk9OOZX+NgdOAVlhKCDY6b46ItqTMUZ01hLd+VuuBWRLa3MniHp0OGU6/7CIBF/wyXHreHytOZ9DIW2xP18oqZ8SZQeuveexb0Q86VgHo+f5IjcwexeVfMKXtjlqyx9UbmaibL9IIiRmVChaMWQqLTdvmW1jVY9zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000916; c=relaxed/simple;
	bh=UrB8xKpd3JjwZZhKN0CFo35yeE/S0fJNZKwlaSDr/cs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YKraIN/nTL/Eq07/zjR8pmO5T7gEKBzUiv960oP0g/fRYgzSD53oV67SgJnd7AIgPFFj1NuVpRz50uHlX8oiTDAl0AfjKPrFOh9GbfhJ9L9tz0LmpOCT44cmp5inhMKIO522AoiQxEfoJ9YVUf0TuYQppE40ynXfoCO2NRjUhus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLz+mVDe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLz+mVDe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B2A1F00898;
	Tue,  9 Jun 2026 10:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781000915;
	bh=0tNCgyZ5pw/vMy96H+SV+GF2mgF2QwLHhMD1BNeaKoY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TLz+mVDeTJdPWF2HGUkEehUSwGgT0H85ufVb1QWGzwBt3oOHTKgcUwDAw15mW+cdK
	 +ZLzZ4zlCOe212PR/Ws/sY0qf5QFfqU/vN84rA3DOho9pwXqSAILmmpz2Uu897Nb0w
	 hGc8dpSkfJ/Xo3LvKdIjr5bt8ymCZXu/6A/928DkMpiL/hVwd1DYdM5O/rc8jpXYtX
	 mIQNliXkIzv3wLIvzFGXCCZjwuKp7wI1Tfa2qi/rijemi1uuGyGhAL1zcWfeqSZjgB
	 nv9038k1UG/sgldl3SbRJ/bjTUgEVMJJY5NOyYGMeLJu51kyXa43lk0IDF4DtRUUKO
	 nGy1Ax2qcnfKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/12] dt-bindings: iio: dac: ad5696: rework on power
 supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609-ad5686-new-features-v2-2-70b423f5c76d@analog.com>
References: <20260609-ad5686-new-features-v2-2-70b423f5c76d@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 10:28:34 +0000
Message-Id: <20260609102835.38B2A1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Adding `vdd-supply`, `vlogic-supply`, and unconditionally requirin=
g `vref-supply` breaks backward compatibility for existing device trees.
- [Medium] Making `vlogic-supply` unconditionally required forces device tr=
ees to document a non-existent hardware connection for single-channel devic=
es.
--

commit 8357cd3efa5f819678f24f0cbf0a39208f4078bc
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>
Subject: dt-bindings: iio: dac: ad5696: rework on power supplies

This commit reworks the power supply bindings for the ad5696 DAC series. It
adds vdd-supply, vlogic-supply, and vref-supply, deprecates vcc-supply, and
updates the required properties.

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml b/=
Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml
> index 2dcc049f30e91..e5fbaec4adf71 100644
> --- a/Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml

[ ... ]

> @@ -55,8 +65,21 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - vdd-supply
> +  - vlogic-supply

[Severity: High]
Does adding vdd-supply and vlogic-supply to the global required list break
backward compatibility for existing device trees? Older device trees that
omitted these will now fail dtbs_check.

[Severity: Medium]
Does making vlogic-supply unconditionally required force device trees to
document a non-existent hardware connection? Single-channel devices in this
family (such as adi,ad5693, adi,ad5693r, and adi,ad5311r) physically do not
have a dedicated VLOGIC pin.

> =20
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            anyOf:
> +              - const: adi,ad5693
> +              - const: adi,ad5694
> +              - const: adi,ad5696
> +    then:
> +      required:
> +        - vref-supply

[Severity: High]
Does unconditionally requiring vref-supply break older device trees that
correctly utilized the formerly valid vcc-supply?

To preserve DT ABI compatibility, should the schema allow either vcc-supply=
 or
vref-supply to satisfy the reference voltage requirement?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-ad5686-new=
-features-v2-0-70b423f5c76d@analog.com?part=3D2
