Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406583;
	b=PeteOIBCv5USHmRMPXXljJsheeXGX0ZEQ5BzOvYu+uS0A9HQBNR/DeMifv86beRyNDUm
	 0YwvZoQcrvSxi2uzfAAa6AmzhJE18xEomlrydM2qnu5JhBmCanp03FGuv7yw8pQ/WsIzQ
	 VupEFm3t/jC6xUPX//6F1ZuXoLcq23kKNXqMBbVYqGNaZF5nEI+R3BDs2aSVNoPgqGaTz
	 xYpaAjKiEEWzTnj4G9prgbqltpOE0ymAbKGZutaFtgYUuPIqJ45QBoEQNuD+ao1rCL9BM
	 x5Aoz4yH/lpl1tvkFjtOUBuRGgPIE7RZlOZl41HXSdt4DIYjs9M1ashnxnO9PF/50Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406583;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/kg6Bf4Zd/+1JDj+jPZTDRULB7ZCPsp3uXK1tQCPEKg=;
	b=G6j83N41TTF4ArQNNLgbsFoFePnK4o8H9OlHRDTvn0x2+GwSihQ/caADcEQHdzrmz4Ml
	 Xc4I1kkYzJ5tAiAQAN4JDWH9797IQXy3RRcWWmQb5uZm5obsxdQ9lUV6cu2BzP3jM2IjS
	 mYYkL/Ub02jpo3qtg1PuMM/rv6m9fyxVrquFoNXX12Xc3QDW7/tkuRPWh7aSsIU4MnqlP
	 Ora498Ovv0+D48W0GDnjWdW4+3gLlItT3yKeQCBAGljYxLSqhNNF2n3Dfj+DSDLgzDuJB
	 PuIPhoWQy0iDStPeVx+jjPLifuTVzTYu1s5BgL4trpdHXel1M/38D/53wa99RtuwhiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NJNUuUUL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17891606A321
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 14:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NJNUuUUL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 645821F00A05;
	Wed, 11 Nov 2026 14:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794406582;
	bh=/kg6Bf4Zd/+1JDj+jPZTDRULB7ZCPsp3uXK1tQCPEKg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NJNUuUULM8lEHYv0yywYxaAfpkZ+LuAsEkTv2rwO9YNpokMfQ0PD47r1ffJZJUvg8
	 ylnmzz62vMLI4ilPWkxmGebY14bdUeaCAFUMVDqQo8rZWAE3UvG9nYVHjxorQGC6zU
	 xgyA2j9lyDNHTrSIaNItd+bTRk8CVQaEFGHZamVFb1i1dpbAhI0Jth8c5EMTD2zple
	 FWo/YKeKFoigOa0PNVqLCpjh2WL2MgDl4lkAYPjxCZcGh1TRXgJsSh01oEI0mFQG90
	 9GShMuPaW/RaNvpssDsUz1oMcbubYuph+WYuO6PSvM2u9Nl+QhsSNi36O3x7e4Xm2H
	 jLGX5DtWLYJZw==
Message-ID: <sashiko-outbox-209129@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/8] spi: cadence-xspi: wait for the controller
 initialization on resume
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261111-xspi-cadence-add-acmd-v2-2-d339046ada8b@analog.com>
References: <20261111-xspi-cadence-add-acmd-v2-0-d339046ada8b@analog.com>
 <20261111-xspi-cadence-add-acmd-v2-2-d339046ada8b@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 14:16:21 +0000
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
- [Low] spi: cadence-xspi: missing Fixes trailer for cdns_xspi_resume()
  init wait fix
--

commit 1cfb3d5d49d047b5fae8e262c396fe9156989594
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

> spi: cadence-xspi: wait for the controller initialization on resume
>
> The controller IP might lose power across a system suspend (e.g. its
> power domain being gated). In that case, it goes through its reset and
> initialization process again on resume, which is only done when the
> INIT_COMPLETED bit is set in the controller status register. However,
> the resume path reconfigures the controller right away.
>
> Add a helper to wait for the controller to complete its initialization
> and use it on resume before configuring anything. If the controller did
> not lose power, the bit is already set and there is nothing to wait for.
>
> The helper will also be used after the optional hardware reset, added
> in a following patch.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

[Severity: Low]
This fixes a bug in cdns_xspi_resume().  Should this include:

  Fixes: db6a59cfcc93 ("spi: cadence-xspi: support suspend/resume")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-xspi-caden=
ce-add-acmd-v2-0-d339046ada8b@analog.com?part=3D2
