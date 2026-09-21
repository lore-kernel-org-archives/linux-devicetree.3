Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00DE43DED7
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978436; cv=none; b=Ua14CBjblzQ4+abbF8CH7gx5TUIdh4Th2Net3n5CiOy+Tq4UH7laUrDHEScIhHM8BonTBle61I3P0j7PR3HbuH3tx56fSE4RIVSQQspvpCv4y468sudbtbmlVm4JEXYjaPUaBS646lwE7/IgqEfXNMVBBgZsz6rMgjc6wtUR7+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978436; c=relaxed/simple;
	bh=14DdJd2gyFd5iE4lLyFJW3jtWmsZihzx/zIP988lSGs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mWg0ZQ9FcLvBoUr5p6oYNvzsHS+Fu8CHVNQ3pUDcTOypmlHQutFziY0dZiMMAuT74bx7revgDGcJNIJH+3FiLvRDJ9y4MApmyHRfIKLM1v8Jgdts9+z1vmS+DzQ+nxsJU2WtG4MBSql+2H7QAPkwvqZ88TcTyUOfFI9dGaIYJ9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kfknk6HW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kfknk6HW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C561F000FF;
	Mon, 21 Sep 2026 08:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789978434;
	bh=eKCFZ6M4EMEb0RxVM5oBQhZLNCEVB4QYyFA/3HKxp74=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kfknk6HWp4BAgO07yCdsDBVLNb+MkKmZRM1DvZB9jcgKpGxqQLexwGHM9h+WGwQ7d
	 XFQyIWi7URJ52gucYhFi8pgKLGQv0SOjzgUSxngK2oREZb6F73zT9VWk/uzjIbhgz4
	 dfo1qJbq2lZbmX5NNgkYAaBf1LWnOU2vM5L1aI+uV7mcxrrBoTWahXiJMQdopVA2md
	 iE5FPbCR5DAto0pffUC4uLbZFqcAr44vWjXJg/jNLXqyyoJf+i8iDPuIY7p45d91qa
	 YXvLSDvgEuhsdc0u4s2/l+fs10g0BF7zmyIOilJjT8AyUyS4x99nAc1UUDnPpkJwAW
	 scz/7OaXFBIUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: net: meson-dwmac: add T7 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260920-t7-node-new-v1-2-e6e0840c1b0b@amlogic.com>
References: <20260920-t7-node-new-v1-0-e6e0840c1b0b@amlogic.com>
 <20260920-t7-node-new-v1-2-e6e0840c1b0b@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 08:13:53 +0000
Message-Id: <20260921081354.37C561F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: net: meson-dwmac: missing t7-dwmac in select block
- [Medium] dt-bindings: net: meson-dwmac: missing t7-dwmac in generational =
constraints
--

commit cf2bd16c5188a0d6d2a0e2fdf91dd50ebfa695b8
Author: Xianwei Zhao <xianwei.zhao@amlogic.com>

dt-bindings: net: meson-dwmac: add T7 support

Adds the T7 compatible string to the Meson DWMAC binding and adds a
conditional schema check to enforce the correct compatible combination.

> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.ya=
ml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> index 5c91716d1f21e..f75a275e2d759 100644
> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> @@ -28,6 +28,18 @@ select:

[Severity: Medium]
Should amlogic,t7-dwmac be added to the select block?

If a node is added with compatible =3D "amlogic,t7-dwmac";, it appears the
dt-validator will skip this schema entirely if the string is not explicitly
listed in the select properties. This would bypass the new allOf.if rules
added below.

> =20
>  allOf:
>    - $ref: snps,dwmac.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: amlogic,t7-dwmac
> +    then:
> +      properties:
> +        compatible:
> +          items:
> +            - const: amlogic,t7-dwmac
> +            - const: amlogic,meson-axg-dwmac
> +            - const: snps,dwmac-4.00

[ ... ]

> @@ -139,8 +151,10 @@ properties:
>            - amlogic,meson-gxbb-dwmac
>            - amlogic,meson-axg-dwmac
>            - amlogic,meson-g12a-dwmac
> +          - amlogic,t7-dwmac

[Severity: Medium]
Does this new compatible string also need to be added to the existing
allOf.if blocks that check for amlogic,meson-axg-dwmac?

Since T7 uses AXG as a fallback, it shares its hardware constraints like
clocks and rx-internal-delay-ps. By omitting amlogic,t7-dwmac from those
existing conditional blocks, the schema implicitly relies on the fallback
string to trigger validation. A missing fallback string in a device tree
would bypass these generational constraints.

>      contains:
>        enum:
> +        - snps,dwmac-4.00
>          - snps,dwmac-3.70a
>          - snps,dwmac

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-t7-node-ne=
w-v1-0-e6e0840c1b0b@amlogic.com?part=3D2
