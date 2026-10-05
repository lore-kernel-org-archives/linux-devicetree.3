Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5843BB671
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 21:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791234036; cv=none; b=UmPrWj6NtWt+ud1uFOMnGDfErGNv/2xyW6e2eYEaJ2K2nIykoysaJ9SfKWqFtu83OWj00BA7PWjSqiYabK9qa9kU+74ZE085XYdUkxHcFFuKAvHwrveYWZAoHQx2pA8O92VKcTWrwQV4pQrQNOvinZ5HNb2H6+zP4P0c1ZTuXiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791234036; c=relaxed/simple;
	bh=8yg3jhaaVEm2BYZ2jMfK219y5rlWshCXYnvNK7e5XTw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MDi+s591Rq1BEDxjlxBAXrLm8Ve1Tr04KXbnshq0GHy6qqK9czoPDZ9Ua7Tr6i4FQhc1M409ws3vBAbTtZha6N/k2YC50YcAFAj7NWLQZtsP/2y+3QxktsegMNzl/X9+95yw0OynHW8Dce+5DIfBy2SmG5vnVDRz+ad4SVInMwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NMPlURJS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMPlURJS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD341F000FF;
	Mon,  5 Oct 2026 21:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791234035;
	bh=NZnig060A2+dyXYPVegaaaDgcgCAkb4dTQ1fT3mGOV8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NMPlURJSr+WV2vaLeQkGrdPvkWC6C4GVqGe4kivANXIFsorAURSDfDQqPh/0XMo2W
	 k04NXKqsDtr2RIr40pJy32XeYiOtPgcFz6Y8oj9QHVHJRruAxXhJT010WXbCzw4CA4
	 GZA7b3NcF7h/vapElpaIoh+XTBngfduOlAYmeAbEaOv6mJbHVTRKmcydCNIcxeI26O
	 YDjsSkm975DToeKn7Ab0ZehDeUl+vS9x37AD/cT9PKc+5kfpD7wBPs3ThLk/3GlzQC
	 gooIS5PEqGe+8az+e8PftjnhxBJjY/1L4rgGIOz41OsAly2546/qnNw4YR7Rxr6WUP
	 6wV9+5hZ97PpQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: bus: Add HiSilicon local bus
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261005205310.2079198-1-robh@kernel.org>
References: <20261005205310.2079198-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 21:00:34 +0000
Message-Id: <20261005210035.1FD341F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing `required` block allows nodes without `reg` to=
 pass
--

commit 31cf8e8c992601dbcd36de1b649ef5c513febf6f
Author: Rob Herring (Arm) <robh@kernel.org>

dt-bindings: bus: Add HiSilicon local bus

This commit introduces a new device tree binding schema for the HiSilicon l=
ocal
bus. It sets up validation constraints for the compatible string and regist=
ers.

> diff --git a/Documentation/devicetree/bindings/bus/hisilicon,hisi-localbu=
s.yaml b/Documentation/devicetree/bindings/bus/hisilicon,hisi-localbus.yaml
> new file mode 100644
> index 0000000000000..cd9ecea88269f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/hisilicon,hisi-localbus.yaml

[ ... ]

> +properties:
> +  compatible:
> +    items:
> +      - const: hisilicon,hisi-localbus
> +      - const: simple-bus
> +
> +  reg:
> +    maxItems: 1
> +
> +unevaluatedProperties: false

[Severity: Low]
Should this schema include a required array to enforce the presence of the
compatible and reg properties?

Because properties are optional by default, omitting an explicit required
block here means that incomplete device tree nodes missing either the reg
property or the compatible string will silently pass dtbs_check validation
without enforcing the constraints defined above.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005205310.2079=
198-1-robh@kernel.org?part=3D1
