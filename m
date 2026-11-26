Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655574;
	b=vffItN4zVW2/Q9BEyvib32foBifUfY/CkpOpIxLsNMroLHbd6LcC8uYyeP3geLfR0ov4
	 qWEdZOLyl2oZCzCJ31j4QwtPU9xbsVgxr9fjxi507cToBhrdW5JX5NLzY9njSPY8IrSs9
	 aS0dnzNK3+8wls4jE0XmciKAFId71bPO1BsI6yf390aKltp2f7zTU83HU42uo9Tbqf9HE
	 beGvwrpCee+dKDlAs0sT0ReDpPkF2wQKDvx8Jyj6TeydjQDYM92OOow9boFAEZTltuzRK
	 pLIwdgbsGz4zWggxkGj3KQfejqY1Tip3zWEbb2fakC+apndyclknyq9E6Tdgc1gl5Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655574;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QFPp+98olB7H96ELndfVAn1aKwnYlE7wJR1s/MOg1H0=;
	b=LZPETpbR/TMW803pPo+1U7p8ewD7jQ/5hZshcPCnPru2iik1qtZ3jfMBOT7TgKcO7FvR
	 EhL3H1DBILS3x7oxNM9CqHn56tTx5tF0tsODP9saSreTsRuVXOW8stXp24hLKdRwPxUNP
	 C+wOxGGYJZEq7ajbMFtmEpVmY5ftQhB3s468GTom28QmOClHk6/wFF3PnIn8YuRQreTNV
	 9N7NU4L3ABwuV5m9h3sIpe18ZrubzZGbFCAZ+WVRqzVQfNy+E62fa/3xzj88Qx7xePSvO
	 pT8K5QprHUCQ8KT1aYQHpAAIWVI5VfNdCGSwJ6CrSYgBSe7Ef3WXubt0szApsZURubA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=csebFMpp;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0uU1xHkU;
	arc=none smtp.remote-ip=202.12.124.150
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7459606A326
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7459606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=csebFMpp;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0uU1xHkU
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 75C621D00579
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:12:53 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 25 Nov 2026 20:12:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1795655571; x=1795741971; bh=QFPp+98olB
	7H96ELndfVAn1aKwnYlE7wJR1s/MOg1H0=; b=csebFMppgOhUiBbEkbTSRv9iZs
	f0Mv7OqLVjAjyDyr0Lz75ojOLtUOsZ3Sw/N8FIGK/Oj7Jv7uAqygHc0sifPczpeS
	WkKL+zLYZ/nHVWjEB+1/U3XkcDBKGPYljVCk4+fzhkJPGWii3IaA5byD0bIJ2xJd
	aIM7I7mj50iElY8ymTYk4A1CZ7R/IZ17wAMUIvzRBIeO40YEqHpDlABIiUe+aPuM
	b8Fv1wv3JYlQx0rCGhe2rEHlHF3D0RVg0wnIAwCySVXniXoRLXpW3+csrepj1YGM
	O3PyHmOuFVg226bNNFzKcSjYR03m/jy+t8ogTolg83mP07zW+RwLE1x3Gm+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795655571; x=1795741971; bh=QFPp+98olB7H96ELndfVAn1aKwnYlE7wJR1
	s/MOg1H0=; b=0uU1xHkUn32vcdm8XjisZD7aSDs9UE6fsR0vrXBZKC3XJLAvOrP
	F1JpLpdUB1IsKyzIl/ReCUjVBeGzeUDtl+8n6Cpbz0F5asf2yL0LAFLxRVCidm9E
	zNKISMDoXy4fUw1ZuuuHmUtAR1bCdDHNOCpgRT+/moEvtkUQ/lMeTcvz3JD48Qzv
	9y7zTbwE3zaYqbm3JDMTHhcrrHZQ+WHfpmR1hqPVj2f2tvx9ZiGh49D7UIgg8fF7
	gtz8UdxNh9HEiADicztA74Z5cwrrFPYBfuuKiLDFMUihns78SxFlVR2w94jRLLNL
	ZIAHMBRWQVRTaz5dBdLCbyc/UgCDblK9mVA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795655571; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:I+V3sh6r/rEiSV6kMYUYeyDLj6QXPv0BDbIRUNfbsCeHZlf
	Jeq0aTQYZWGr5H/oDD+qc7Ag9D21vZvoacyBBeOQJA6QXHYU8p9WjzUTvNj8usqk
	WZ9xpW9q/I6fO495/R8IcMgZnuT7PFYq9NkMghDHPu0pFEF93YGT86PbPZUNu7hR
	qmIaRQuXVY1uGcXh1dwJNjEdRFFMM0PtCSg4pE0meIZV2AaXUBU6qU76HYFf6Bae
	B1B58da7Gg2frorrG4cOU4YXL5olUvwYAL/+rOgA0wL+R0YerJZsoGkbKjMqV3N7
	PPkzyK57PLJIPRG6bcDL6ZCmo5JJQdfffsBiJCQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Q0i1sTTQbcjmcXXT+M78PquS39tDib4K1VaPggSsh+0=:rq6xRGOu8WZ0gInXjlwLQNeu4yVsubQwpS0nHDS7kME=;
X-ME-Sender: <xms:k4cHa0GdHKbMWjJhotoLJn_zcVf207pWafl0MQHx794PRpGZKFVcoQ>
    <xme:k4cHayii4_XqdCUy5bfnX0Y_KfqidZnP271fQ488M8rTg0nkROttU27P5h9zpc0JX
    lFnVX7uW4y6p1l5SOk4HNnq94hJnQuwMN4KsacSRK6rnk8ompjFrohE>
X-ME-Received: <xmr:k4cHaxiD5oGhwklRRZMPphhiN4ortZMUD9XVTWU8rMiIKzmoICRtVyd-VtqYyr8-E7UJjZQhdJ2euhvHmoC5OAAhptmnEguzUlc>
X-ME-Proxy-Cause: dmFkZTG0rxQYipiteh89VTxNujjcq7oJ6AI8/b9/lv+JwM2PNH0ky658Zp0jDPofAzJsG/
    ZQu5GcTSXHhrU3CcJoy6C1K1bQ6vro+A6eC7QdoOX8XIi7t0s6yXZPqNDY+OjlxKoE9ktT
    NM7IrzlPvdpl06IqqwaOwQBopeNlKj0mag1R3fCYnHSHjpACcMAQRo/PrXW4G10Wx1WCUK
    kGKUeJF5Lw/g9x7ya2UlZTED5wT+xb9btslIHSuUF8BB8VfOS57evdqjRcOZN7OmEMv30c
    2yogudxI0ANUXjhDo6q/kjYUcoj7pVP9Z/oEWvePj73xUyqhiBEhGmHlt3pAHAO2l4kKGR
    Y4CBIQcVrQb6DY+gmtOQWinKB0jkTHvOlEVC9o1w974iuoERGgLMPyb5cGP3LpD2n1WImE
    Qqbnd27BfuiqTfhLl97qvXq/8+zFU7cNG/8z0LD5cDzV/iyI3Lljw9Vsh+bt8LNtSZlt2n
    dQX2+Czn2HFAu3i+bRVajncraUfveSIIBnymn1t9WteKrXWp9CIdeEf3mjgYM8z4b60+mZ
    HzTRNBHQeINorJluCDAtjpdKz3GaHN3tz4ieliS3tYZJ93TVGpAaDBi9/xvGP7EIzZuK+Q
    WtLqdO7SRx5uv5braDVAcRqtssFXojTA5Q6I691mMS1NSYjPLjkIOLiOYwcg
X-ME-Proxy: <xmx:k4cHa1mgK7EpLcXSceXoVGApuqd988gMOwDkBAdTklHoWjdj7k1rAQ>
    <xmx:k4cHa1bPKoQOvqZNC5DdBsV1PMBm1J6pexnGoRgZkHKR2HSYbHUP7g>
    <xmx:k4cHa4wLqrTcg5W3-Ou0zLXHfZ_4zw0CcMlaPu6yjNyEb8kNJoBInQ>
    <xmx:k4cHa8ZDkgJ7NQIM8n0CPol8tUetjjp2RBg-UmLgvtF7HASvpJQRNA>
    <xmx:k4cHa-kR7uPkcLcsUX9P6JEFTYrzqBkwfNjS64e6s98Ptm-2p8N9D0K3>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 20:12:50 -0500 (EST)
Date: Thu, 26 Nov 2026 02:12:49 +0100
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] phy: apple: atc: Split generation-specific code
Message-ID: <20261126011249.GF372978@robin.jannau.net>
References: <20261125-t8122-phy-v3-0-196e20b3537e@chaosmail.tech>
 <20261125-t8122-phy-v3-5-196e20b3537e@chaosmail.tech>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261125-t8122-phy-v3-5-196e20b3537e@chaosmail.tech>

On Wed, Nov 25, 2026 at 02:11:49PM +0100, Sasha Finkelstein wrote:
> atc.c is getting pretty big, split out the hardware generation-specific
> code into separate files.
> 
> Reviewed-by: Sven Peter <sven@kernel.org>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/phy/apple/Makefile    |    2 +-
>  drivers/phy/apple/atc-t8103.c |  273 +++++++++
>  drivers/phy/apple/atc-t8122.c |  713 +++++++++++++++++++++++
>  drivers/phy/apple/atc.c       | 1286 +----------------------------------------
>  drivers/phy/apple/atc.h       |  340 +++++++++++
>  5 files changed, 1333 insertions(+), 1281 deletions(-)

from a code history and code churn point of view it would have been nice
if the split happened before or while adding t8122 support. Not sure if
it is worth the effort now that t8122 support already exists.

Janne
