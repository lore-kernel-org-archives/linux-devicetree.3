Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794589256;
	b=QjpBeT1ERGsDqBATdObwCTksYeLfTUvZm/sqYH0y5rLbNlNB+rWdgm6pHRLKyUaO3eVa
	 7MwpmWy1NuPW0mTIJKe3RFPlCadX4lz4Xj0RBRnb4dWchtFP4F+pwVLNTUIdcMbdAmuN7
	 2vOJVcFqu+W5t7xMmrflKczT75uOUqwqlAn/cM8cBOQi/1yrvaVRegOsmU84rffHLR8Kr
	 anhx0oUhdU8UcRdfnrAYPIMrBHe6yd2UP/yhLdt+a8z1dE2qYuiMc4I/tfdabxpDjdUag
	 8IdnFozOjyqsV7IyI1RtfB1m2uPzo8np6XoDQOimcLhNJffjUupr6QpfkDLUGYwcWwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589256;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wJougDotl1Za4S160DiURMn6GmN9EBA+EDBxFwXgJwk=;
	b=Dj6RqmQnEyYHjbIFhIWe1Im6ja0MU8NGhadNGo4OE5PJjRQZ0N5pLrw4ohFT0KrFbIP7
	 oqJKlpESDDLMHlHNjT3U7QO2DtEJb4t9QtpqD28zHXRda2AEKnM6HGNQ8QdjLOqBvReuB
	 mVJChZ3DbA1AzLkV7dyo95Dq6GuBGEyMq4oi9PtEm13WmVV32XUqC3jy0IS0nrvyNFzMt
	 G3UMIMBIzlj7w6EG6lKEtkBjbTQGPMCfdGlega5Njwvj0LCetq20M9PdvM7SIuJFxr8oY
	 XjXDid1N4RkEI/Che/0ZCvVNCptw2bcCbNdctzbCipLV5743OmXxfugA02W2DIw/ACg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Lb/cNSwX";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69C5606E1D8
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 17:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lb/cNSwX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297E51F000C4;
	Fri, 13 Nov 2026 17:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794589256;
	bh=wJougDotl1Za4S160DiURMn6GmN9EBA+EDBxFwXgJwk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lb/cNSwXxfZN0RwGSzds1nc86liaHMCO742MZdRvLrqdeVSb/sA6xzYtLnzXC/yo1
	 c4IEi64IDgc/EDdLpRkSFaqFFy9Cy8N1zFsUaahHzQqZo3mNVULH0JUn2/q5MQgFj4
	 7oY1bTUz9+sUOw+mNpp6vKmssFF8mXrGTce5R5SoegKbbwH0rTkOufHBffNq6fQvNf
	 tn9LdcgitkQSo+7MXJmgJQex10NN6+RGLf+1XEFFwwr5IjqxwQKivd3AVxz/DrKzBM
	 OzaNFjdRzRwgcL3AuTIWSooWs+Qh67cuO11/hBjAy12AgOLcMlvu3jI1mIgtezMDkj
	 oCk4apFruznOg==
Message-ID: <sashiko-outbox-213262@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: mediatek: mt8173: Add the keypad
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Brue" <ryanbrue.dev@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-2-d3b8865fa50f@gmail.com>
References: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-0-d3b8865fa50f@gmail.com>
 <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-2-d3b8865fa50f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 17:00:55 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: mediatek: undocumented mediatek,mt8173-keypad
  compatible
--

commit ab28d23b13a382f84e79c4c35213e145004742ac
Author: Ryan Brue <ryanbrue.dev@gmail.com>

arm64: dts: mediatek: mt8173: Add the keypad controller

This commit adds a disabled keypad controller node to the MT8173 SoC
device tree.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8173.dtsi
> index 2ecdea33672ea..61261fe643ab7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -555,6 +555,16 @@ pwrap: pwrap@1000d000 {
>  			clock-names =3D "spi", "wrap";
>  		};
> =20
> +		keyboard: keyboard@10010000 {
> +			compatible =3D "mediatek,mt8173-keypad",
> +				     "mediatek,mt6779-keypad";

[Severity: Low]
Is "mediatek,mt8173-keypad" documented in
Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml in
this tree?  A separate patch adding the compatible string was queued in
the input tree, so until that binding update is present in the target
branch, checkpatch.pl reports UNDOCUMENTED_DT_STRING and make dtbs_check
fails schema validation on MT8173 device trees.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-rbrue-suez=
-upstreaming-amazon-suez-dts-v2-0-d3b8865fa50f@gmail.com?part=3D2
