Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E233BE174
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 21:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778708098; cv=none; b=AKNInk1dV2cd7ipDqyOWNHwlMXNFf/TUtcWNmU3Q43BSjmEU2dbCKTSGvRrZEli5j0fGG1J7LmnNIHKoVmqUAe1htY8Ng52d82WyjSrzP7ao3FE6p+yBy7NntJafSdX0SR8goG7Kg52GEUYBcDP30C7NSI73fjn/9++8OW2diDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778708098; c=relaxed/simple;
	bh=3uC6ehw7dYS+zE3mSPk0mFUtmfCilzSMucfnhq7sAks=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i7kgummY02af10BnUrh3m9F+6ctivl8TbJszgOHVR7SijM5U8zkZ+5pZttrSBjkrysuZR9JhAeZJuQWI/a0UnUEgrcuWqm1sKlxeBs7u9ptTL5j1Er6nWvAUTwmNFrPDjzKCg3uLbeAdXdL5Afk94VR3OzbfhlU7DI06pktDFYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KG6Z6oF+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KG6Z6oF+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59D0C19425;
	Wed, 13 May 2026 21:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778708097;
	bh=3uC6ehw7dYS+zE3mSPk0mFUtmfCilzSMucfnhq7sAks=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=KG6Z6oF+sytNxQ2flqQUNfMbn/l0xHWFRHuaOdPazBE6qXJ4FyDQgs60RQjgxEcc9
	 F9wFqWrpc5aAWmdbtL1OFLqQyogBmavFGVjaCxG4VpwQ+inXgCONLQyI/FcSONcWtx
	 X5cDnsD5KflWrWlPFwyZZWanfbTzM/jO75b03Nl4jmrWG4j8SgUF0tGclJ40b/y+oN
	 CvHb3VretEIKM7kGuaxe9cnU/jCosiVcABl5AJYr7dLCCv5x/T3oLkAQUHUQcLMjKW
	 hiFDSY1kT9gLDMlIlrH9fcjRsB458KwH9zdZGoE36nHzWK+AD7ZdUpDWN0cGN4gb/B
	 AUJgkkbPhhwdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/6] media: dt-bindings: Document SC8280XP/SM8350
 Iris
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260512-iris-sc8280xp-v5-1-8cc251e83b58@oss.qualcomm.com>
References: <20260512-iris-sc8280xp-v5-1-8cc251e83b58@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 21:34:56 +0000
Message-Id: <20260513213456.E59D0C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect YAML sequence indentation breaks `make dt_binding_check`.
--

commit 7d3ce999d6af6439f0c83bd8f368afdadb5e31c4
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

media: dt-bindings: Document SC8280XP/SM8350 Iris

The Iris block on SM8350 and SC8280XP is compatible with the Iris (Venus)
on SM8250. This commit updates the bindings to describe the block as Iris
v2 and documents the SM8350 and SC8280XP IP cores using a fallback
compatible string.

> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> @@ -10,15 +10,21 @@ maintainers:
[ ... ]
>  properties:
>    compatible:
> -    const: qcom,sm8250-venus
> +    oneOf:
> +      - const: qcom,sm8250-venus
> +      - items:
> +        - enum:
> +            - qcom,sc8280xp-iris
> +            - qcom,sm8350-iris
> +        - const: qcom,sm8250-venus

Will this indentation cause `make dt_binding_check` to fail?

The kernel's Documentation/devicetree/bindings/.yamllint file enforces
indent-sequences: true with a 2-space indentation rule. This requires any
block sequence acting as a value for a mapping key to be indented further t=
han
the key itself.

Here, the "- items:" element is at 6 spaces, placing the "items:" mapping k=
ey
conceptually at 8 spaces. The child sequence elements "- enum:" and "- cons=
t:"
are placed at 8 spaces, identical to the parent "items:" key, rather than b=
eing
indented inside it.

Yamllint typically expects the child sequence to be indented an additional 2
spaces (at 10 spaces) and will likely flag an indentation error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-iris-sc828=
0xp-v5-0-8cc251e83b58@oss.qualcomm.com?part=3D1
