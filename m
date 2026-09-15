Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E723BFACB
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 20:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789504075; cv=none; b=BcaAmCMY6zconLAMnlcN5fNwv86+woBfDQzcLjH9qaGTsHzZcKBiNMOGjT5lxu/RSTItDyb3eb8I6FJE2drut+KPxB570mXw5dvQBaIEnT4VHE399+7qOYJXzbfURdJBEDIyQYXNuNDaWLjX1wJJUGotuPBDA2LEKX12D33GgNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789504075; c=relaxed/simple;
	bh=0UWVahgUL4pqRApPSj6+xGS3wnzKmfRQegMpkz3F+AY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PeuZHfcedSsDWPTkA5GrtHj5fJ+L3h0W4RMLX33a3iWRZhIJZNF9tyQP1ZYH7WsTw/C8e5MoUPcE9ZLItGLj3xemgnnT7aao9bcGiWkA94/lKsck3+d23ulEhdPdXJQN1zftGnnKzGvc1k0ekp//NYP9rLzDkqvpNDqP/CFq+aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mGGgNNKx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mGGgNNKx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C82A1F000FF;
	Tue, 15 Sep 2026 20:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789504073;
	bh=xtHX74kslunI9nyedo0rpgldyHkGLV3rT+1h1BLan/k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mGGgNNKxSFBOPojS9rtNtsHj5Wj+CYiBtyvQV1vJLi5RM+eM50UDMJrn0HGczUOGl
	 089hWvGd2jx2fq3tDsg07YCkJfkgNZ/oSq15QTAjFFenZZ240iLywldzTRTUc1Xs6D
	 3CR1E8IzstAC2hDyB8Dtjn2qy+tHqs+iHVi9j4Moc85Oq/38yg3tS012wTS/cUaaVT
	 Oen9z79ypEaybTfmLM2HEGXQCLf7LZBm7FbcnSwr4Yv8l59xLVJfbJB7cCFYxLpx3g
	 xJQgUK83+3i4nJ7tvqcSWJSC3lapliunfdmey2OptLLs59oANXhvsyjFdpY3JxUL1a
	 CTQpl8Cp+6sZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: add Vision Components
 GmbH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Leitner" <richard.leitner@linux.dev>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260915-vc-mipi-ctrl-v1-1-8a42b693d889@linux.dev>
References: <20260915-vc-mipi-ctrl-v1-0-8a42b693d889@linux.dev>
 <20260915-vc-mipi-ctrl-v1-1-8a42b693d889@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 20:27:53 +0000
Message-Id: <20260915202753.8C82A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: vendor-prefixes: incorrect alphabetical sorting of vis=
ion-components
--

commit 1128759ad400d01e3eb91ec0f2b73289ba5e494d
Author: Richard Leitner <richard.leitner@linux.dev>

dt-bindings: vendor-prefixes: add Vision Components GmbH
   =20
Add vendor prefix for Vision Components GmbH, a manufacturer of camera
modules.
   =20
Link: https://www.vision-components.com

> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index ba20029693734..b853fb9338527 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1845,6 +1845,8 @@ patternProperties:
>      description: Vishay Intertechnology, Inc
>    "^visionox,.*":
>      description: Visionox
> +  "^vision-components,.*":
> +    description: Vision Components GmbH

[Severity: Low]
Does this insertion break the required alphabetical order?

Based on ASCII sorting, "vision-components" (where the hyphen is ASCII 45)
should precede "visionox" (where the letter 'o' is ASCII 111).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-vc-mipi-ct=
rl-v1-0-8a42b693d889@linux.dev?part=3D1
