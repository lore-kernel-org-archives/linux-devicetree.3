Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779720;
	b=uZn7mFsHYxoSEJtVeTdgM5rDt/pNeSd5w4Y+3boqr9N24fJyYybcBXMTXjbY5GfIqwT0
	 Ne2GKAfkeavHAEhWGh1gY3lth+cip0X93Uo2p5pu+m/lkB5vSHG9fi5vphH+eg3O7+I83
	 fCb1CPInFpyPqS+WVoxsN+tjKNcmLwlvmQ0POqk2SzhGSteEVranrKu8LC5/5n89DsicB
	 bKO0sZ2eoNqRcixTOb78OuCfd7IGrUDDOiYUjJJBFxAFip5vsMKyfYkaEivFZgeBoxFyN
	 pB0JRsHiG+cuQ5lttjqgJg2HAVK1Ne8URN0SkXbQCMKCEQvNhAIBXrLXeuRSGs61xwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779720;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ceqg+n1PnnOfQcr4/rnfHnosw+WyLQFP0/o9HOpLM4w=;
	b=rNhOxWyA2oys++HP7j97UujFcEZmBcTSvy2U9B8IFqlu1p4Gl0+E8IngU7jW8rm4eLOD
	 z2qj/i3Lv7CErG6qsQMVoredeP8cZ7yoL8lNidohwySNXc+QfsxNCxbyazp74QqjMYRNA
	 NZRi515DE0MvxIzG/U9F7Te2CUVJnbTNbtD6pw+0zt/cImEV4g/nOPJDDI4xbTyC6P+4U
	 Dm68UxDfQ/vIWiWlZcR32kia6LPHenvSXOIr4vH32ihMSoNcbfKS0HOHubeAvkUsMQpYY
	 OX+3bQFdiq5QTQ7Y0QDmlCHyuuiSH0gXFGlUtojpVGFzYrJpx6Rxb7Ajrme764GH57A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FDHl6I7i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CFA606A329
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FDHl6I7i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA151F008A0;
	Fri, 27 Nov 2026 11:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795779719;
	bh=ceqg+n1PnnOfQcr4/rnfHnosw+WyLQFP0/o9HOpLM4w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FDHl6I7ib0K9YEyCDUMDEbyoJCbVUK0tEGGmODDiNN/poS/OYCNDvMLeM0NX81zRP
	 HhAS3/tYa5GeiYYIjFLQMn0pqLvMbputlkrwnKvf01lXPYqjm7H8gcN6K6YyXeDMp/
	 9VjMjgxLR1swQW50WLUnUrISVhPn7Y7c2FuzLcKYRUavScZFuIQ4r+yhfB1yodl6WM
	 Ye+ekOVwO8Zgy3r+saEgitikLbnwkdPTUBQNyx9RIhkqHw185MlzLzqXYXuVRW3Kza
	 JxsMKDq4pxFJ3mI36Dx2b6YSAi+LmhhW+upSr6Ib5HGLEjjvH9wSuHOV9ROkrS5YSq
	 kN/ON8bu41+Nw==
Message-ID: <sashiko-outbox-237264@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8750: describe the TNOC AMBA
 periphid
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261127113158.932414-3-xiaqinghuan@mail.ustc.edu.cn>
References: <20261127113158.932414-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261127113158.932414-3-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 11:41:59 +0000
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
- [Low] arm64: dts: qcom: sm8750: missing Fixes trailer for tn@109ab000
  probe fix
--

commit 371c99c386c64a78dc9fc7007e0a244dc58f9483
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

> arm64: dts: qcom: sm8750: describe the TNOC AMBA periphid
>
> The trace NOC at 109ab000 is an AMBA device, but without
> "arm,primecell-periphid" the AMBA core reads its ID as 0x00000000 on
> this platform, so coresight-tnoc (which matches 0x000f0c00/0x001f0c00
> with mask 0x00ffff00) never probes and the node is reported as
> "deferred probe pending: (reason unknown)".
>
> The value is the one the driver expects for this integration and the
> same way sm8250 describes its funnel.  Add it so the TNOC binds.
>
> *** AI-assistance disclosure ***
> This patch was prepared with the help of an LLM coding assistant.  The
> author reviewed every line and verified the binding on hardware.
>
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

[Severity: Low]
This fixes probing of the tn@109ab000 node on SM8750.  Should this
include:

  Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127113158.9324=
14-1-xiaqinghuan@mail.ustc.edu.cn?part=3D2
