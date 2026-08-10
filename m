Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9767635E926
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786346371; cv=none; b=nzfJxprNwz+dY0svQHGS9XM8J3taHdXkXND652bm8w/tB1crGr3L0pkKTvCE5dyTFAzHMw6+eSoRKJEI5ppfniOZeFUlUaU3zTq/+Fseu17IxqDUTnYI/Wjgu0FHHMNyeNeOF5hQ303n4/wSpvdBdcWuYhuRCm/jNIEtMNtBO1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786346371; c=relaxed/simple;
	bh=yRqIKMgHpG6/aINTdokgXlyMzpYbdjzohGVwuW7T8xM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SIOeT4lbdagq6g1K/16sO4TICcqiJmVuyf3zhGbnvNSBPnPJ0Wq3rZQpEIKNrr1moUXjK+M3orBT+sgqi68nxwtR19hQjO6qGQqa4vjzV6MPa9xPznMYhS3XMLddE74KQEc2Z37zQLw9Rq684XS5tNPwNW2xGYOQn+ZIVxS/t9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+kiXoGQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+kiXoGQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE891F000E9;
	Mon, 10 Aug 2026 07:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786346370;
	bh=9uBAnT1RnPqcdGHqaztr8cApubEmj1/B9E4s8ssNtyc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D+kiXoGQNULf+FjH20c/Guu/ZirR8cKRfh0KjKJeYNsjXWwc9/7Z17p1vSwOrrtol
	 3Vo5kZGsSz4nFJUAJfhY320WglvWD5E+UqIlkJrzIc4SiuCmGxXqbCTY7wR/Ro0s62
	 q9ZzLJsfswhOx8Y2RfHpyMtZAizKB3E6M/ApEYG7A6pW14o4bAFlWBXfcyhTpyga+z
	 SZICHdPAO49gPgqJL1hiT/fgBJYPr9Ymx99P9STs920aNy6xQ41Xuol2REfMwIhVT4
	 BmeGJ0moCW36w3BJX+wc9wJa6fQUCG7kh7DfArinsDxoDc6BJXhlfTZv/Wesej29BW
	 kVxgkg1oGLUqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/7] dt-bindings: iio: light: ltr501: Add ltr329
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260810-liteon-ltr329-v4-3-8bd3dfd15280@geanix.com>
References: <20260810-liteon-ltr329-v4-0-8bd3dfd15280@geanix.com>
 <20260810-liteon-ltr329-v4-3-8bd3dfd15280@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 07:19:28 +0000
Message-Id: <20260810071929.DCE891F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema allows the `interrupts` and `proximity-near-level` pr=
operties for `liteon,ltr329`, despite the hardware lacking support for both.
--

--- Patch [3]: [PATCH v4 3/7] dt-bindings: iio: light: ltr501: Add ltr329 c=
ompatible ---
commit 886ebb6ac5c09271398d18cea2c0a6d6d1bb9043
Author: Esben Haabendal <esben@geanix.com>

dt-bindings: iio: light: ltr501: Add ltr329 compatible

This commit adds a new compatible string for the LTR-329ALS-01 ambient
light sensor. The commit message notes that it is similar to LTR-303ALS-01
but without interrupt support.

> diff --git a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.ya=
ml b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
> index 6234e2eaec2e4..8c9d6cee55b49 100644
> --- a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
> +++ b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
> @@ -17,6 +17,7 @@ properties:
>      enum:
>        - liteon,ltr301
>        - liteon,ltr303
> +      - liteon,ltr329

[Severity: Medium]
Since the commit message explicitly states that the LTR-329ALS-01 does not
have interrupt support, should the schema actively disallow the interrupts
property for this specific compatible string?

Currently, because interrupts and proximity-near-level are defined globally
in this schema, validation will silently pass if a device tree node for
liteon,ltr329 incorrectly includes them.

Could an allOf rule be added to restrict these unsupported properties?

  allOf:
    - if:
        properties:
          compatible:
            contains:
              const: liteon,ltr329
      then:
        properties:
          interrupts: false
          proximity-near-level: false

>        - liteon,ltr501
>        - liteon,ltr559

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-liteon-ltr=
329-v4-0-8bd3dfd15280@geanix.com?part=3D3
