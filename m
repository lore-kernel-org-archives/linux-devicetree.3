Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4453644C6;
	Mon, 18 May 2026 11:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103330; cv=none; b=TkJxy6x16ua3ntUCi6dado48uTNCGADsWstANpZ+iXLNvK4BxUzA3llQTdl9KT1jsa1swZDFxDObLVeSILEk0F8q2hs7nG8OzrHqDqOBSjlXk+me03pVY9VrshXWoNCCbR8orCOSiFhJveA8sxXKWj7caWa0PPT7/9bf+GOGveE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103330; c=relaxed/simple;
	bh=w2n0G2+Jazj7BtyrJBZLOCheDF0NMvvyn9XJCPYHCN0=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qtiJ8V9iqYTkqK9p3+OUc0aTelzCTbdgLNiPT0vHKWV2nDzbdX/XAt0gKjb6jYsvXcPAIKh3wcHH+VRly6gH+9TEyJfF5oR5h6g+drNhIwIlp/asX5bvUv6MGWoe1BM+I1wDBomnK2VRdf9Vz+HMo/l43N4jlepN4cwud4Knm3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=myqoaJPz; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="myqoaJPz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779103322;
	bh=w2n0G2+Jazj7BtyrJBZLOCheDF0NMvvyn9XJCPYHCN0=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=myqoaJPzPyi+al1ubYSV7anQy9yZQTl1plzyC4g+tWiGfye3dcGdVLplqjgQJ73NO
	 qXaY1nm0hrrXiVov2hXCCZYBLMZa0LY11XCaVutXw0bCkmNwizNfInjC5d9ythy+4+
	 coIQVM5ddaRgAmttQpeKxosnh1Ub4ijCFfhhBSEAdFx/2jAbbHMjl2xnFAEBh7ayxB
	 18LWYKqiio2Ug5Jdk5VWe+q/zusQiUta4iwjmoSoElSxROC97srr4qI9pZ2Bt3f7GX
	 p0Cvo1uBUfOP7kGNCab0sRT4ettc/oU71nbxM5GvJkwA8Fa9TTzaUNKaS+UUTU5FTG
	 2lc06OwsWtWsg==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 67FB76054D;
	Mon, 18 May 2026 19:22:02 +0800 (AWST)
Message-ID: <88d92981e89a9c6c62b6ddc2fa4af51dcc32c276.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 1/1] ARM: dts: aspeed: santabarbara: Add system
 monitoring GPIOs
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Fred Chen <fredchen.openbmc@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 20:52:02 +0930
In-Reply-To: <20260421130344.2751662-2-fredchen.openbmc@gmail.com>
References: <20260421130344.2751662-1-fredchen.openbmc@gmail.com>
	 <20260421130344.2751662-2-fredchen.openbmc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Fred,

On Tue, 2026-04-21 at 21:03 +0800, Fred Chen wrote:
> Add several GPIO expanders to the Santabarbara platform, with ioexp0
> (0x20) configured to aggregate interrupt signals from downstream
> expanders to optimize sideband pin usage.

Can you provide a bit more context? Is this the result of a broader
design change? Or is it a case of adding descriptions of hardware that
was already present in the design?

Andrew
