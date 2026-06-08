Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992D8328635
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 20:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780952047; cv=none; b=TckKHx2jjX7EoRdgsuSMgkdHypBWQSze4WpWXkN3mpPCKHqEoBd2JtIkGa18FvMBgp/LrJ+0JeVBm3Ic/j4Fu4KIebRGv5NimAs07nHB4o4qdu50zGHbc9mgQLhRKWZsGhU+24hj780Asrwomdq2H28jcLkcEtx/A1qiQqZYPL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780952047; c=relaxed/simple;
	bh=UzEyInNtE2iIfNnR1RCJY7U7GkJ7z4NyZ66tJHOhUtI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QLW5Ak3lJkoEQLGc8LMOKT0VNrsaM6ZBLYNVM1ENWjgOup36wXeYyLc3/O3qmIhDEuMWEPvq5ryM4d4dcRRbNqsqlLnQW++75Ey575gzf1USr2L69UKNlXZpU3xNMNWoIDEkzb4BtdwClN3LYIQGZvVw7vQxuRCJC2vOATvj0IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=guYitO+s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="guYitO+s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45ED31F00893;
	Mon,  8 Jun 2026 20:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780952046;
	bh=I/rsn2WJl7fKXdHXCcPrmQwiiSRKpN1Y6FN9Lisx8/s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=guYitO+sT+/xkUFsXI+BIWvo/2G7aNlTrZrSsZX1If8Q239EyaeHYczuN1iYLzsTk
	 Fz3QJLl/Dg1IdntgbdptPIBS9nl9M4rJ/kZWeZRgN5LVi8ngqwblElTIhrIar8TFT0
	 3kbz1ioOTALXSWuPZkwrpro/xC5ZlDXzCeKje8oJu8Hw6l94MpuoXMxUORa8eQMd/N
	 BwemMRv3H1YM39OCOHz8ZFTyCXAWa4B7VyI6sK2g5QCn5HWGkUNJ2Kt3meluvYj56S
	 54K1ArlkYMnCkmV8oN2P55ZfQbXELmjeOZ/DIFnV5M3v7rs5Hxw5QvIBsoH8wAj0C2
	 4WjRLeg7cvCHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: mfd: syscon: Disallow simple-bus
 with syscon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v3-1-4eba9ec1212a@oss.qualcomm.com>
References: <20260608-n-dt-bindings-simple-bus-syscon-v3-1-4eba9ec1212a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 20:54:05 +0000
Message-Id: <20260608205406.45ED31F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch introduces several new compatible strings (e.g., `ti,a=
m3352-scm-conf`) to the exception list without documenting them in any vali=
d dt-binding schema. This causes a bisectability breakage in `dtbs_check` d=
uring the series and leaves permanent 'undocumented compatible' warnings at=
 the end of the series.
--

commit 0cddec624a3b6ba2f0c447b95621f32101d2e31f
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dt-bindings: mfd: syscon: Disallow simple-bus with syscon

This commit adds a schema to disallow the combination of syscon and
simple-bus compatibles. It includes an exception list for legacy
configurations that currently rely on this pattern.

> diff --git a/Documentation/devicetree/bindings/mfd/syscon-common.yaml b/D=
ocumentation/devicetree/bindings/mfd/syscon-common.yaml
> index 14a08e7bc8bdd..2d5eef5add544 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon-common.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
[ ... ]
> @@ -52,11 +53,44 @@ allOf:
>            contains:
>              const: simple-mfd
>      then:
> +      # Always require a specific compatible for syscon with simple-mfd
>        properties:
>          compatible:
>            minItems: 3
>            maxItems: 5
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: simple-bus
> +    then:
> +      # simple-bus conflicts with syscon - if a device is a system contr=
oller
> +      # with miscellaneous registers, then it has at least one dedicated
> +      # function thus it is not a simple bus. Allow existing exceptions.
> +      if:
> +        properties:
> +          compatible:
> +            not:
> +              contains:
> +                # This list CANNOT grow

[Severity: Medium]
Will this break bisectability for dtbs_check? Since the DTS files are
updated later in the series, it seems like existing TI DTS files using sysc=
on
and simple-bus without these new specific compatibles will fail validation
when this patch is applied.

> +                enum:
> +                  - cznic,turris1x-cpld
> +                  - img,pistachio-cr-periph
> +                  - ti,am3352-scm-conf
> +                  - ti,am4372-scm-conf
> +                  - ti,dm814-scm-conf
> +                  - ti,dm8168-scm-conf
> +                  - ti,dra7-scm-conf
> +                  - ti,omap2-scm-conf
> +                  - ti,omap3-scm-conf
> +                  - ti,omap4-sysc-padconf-global
> +                  - ti,omap5-scm-wkup-conf
> +                  - ti,omap5-sysc-padconf-global

[Severity: Medium]
Are these new TI compatible strings documented in a dedicated binding schem=
a?

Being listed inside this enum block doesn't document them for dtschema, whi=
ch
might result in continuous undocumented compatible warnings for all the
updated TI boards at the end of the series.

> +      then:
> +        required:
> +          - incorrect-usage-of-simple-bus-and-syscon

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-n-dt-bindi=
ngs-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com?part=3D1
