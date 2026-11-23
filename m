Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795464724;
	b=tIgqE/7T2yrz001mwLYGFYxpKBRK01i/jwG1C4z7SCi0BjXDo7ZEn9Pdmsk+SF/iXvBl
	 7UQ0mJ1Eekap2i8FzVIdBgaBGNHyabGiP/PmU+aPeZ+LV6MbJ0ABJ1QFtde/oXErOt6D0
	 MaEs0kzI35CnjxSWcw5f3r99l7gt/VIWcbDqMnBCDRD7zXa0s/KboV9B2gxPnXlpk0r9t
	 r5JEGp0Liua99eAbzSfY/hN/GVEK2w0wrAvlLdppX306ycTX9HxAYJosg+w3xXiTclQYL
	 Sc6pVBEFcheMTznu9+r4zrqGk11ndY+R+pZXRhrewi2L5OGto++bJVL5hewZqc51Yew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464724;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=NK2TAdN7QxXlztQobC5fKCMiso1wIiEVmRdbWsstQAk=;
	b=n5cFrTXVFaeucd+INNykDZIeTZjuF88GQXg6bxEIEn7mHVtmIIgNyKeY0pRkHwHa97ba
	 M6to66k/fjgJpQxLlM3GC9WX6eXNTzgbYVabfwhhe752MFlq11c9XUTd+a7/6PYOHaA9u
	 yr0EUwcsz9/9+9l3AGuZ9PsqkkdVtDGevCdNpz7lQXcCr2GtbM4WHhAqW76T1KSNJV6c/
	 HW2x8dYfSh8VZ8ssKPoa8yj9hTrMdS1vis6Mr94v+5falSG69IrfJI6Emxb3SPtBdZcyO
	 h8upyB6QAcoEw3kJ7OVrjaWb76rKd67HGK3RMxZifRxL4AWz9NBrKEqbiTV6zyqF9AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=nqwqg11w;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF305606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF305606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=nqwqg11w
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id VUaRxxudsVK9UVaORxzoEH; Mon, 23 Nov 2026 20:12:03 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id VaOQxGppESgq1VaORxAiuk; Mon, 23 Nov 2026 20:12:03 +0000
X-Authority-Analysis: v=2.4 cv=c8KrQQ9l c=1 sm=1 tr=0 ts=6b049e13
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=p6fxDhJg9I0BSXovcPcA:9 a=CjuIK1q_8ugA:10
 a=cvBusfyB2V15izCimMoJ:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NK2TAdN7QxXlztQobC5fKCMiso1wIiEVmRdbWsstQAk=; b=nqwqg11wPGBOPBl0au8ZN/l02z
	mOqyg267Xy8LoWIcDlxOs3ZjdSTIQdidEv+vDmzYr9onPkx+WhTmH0f23M0+PMAZg7FFSbOCJ67LE
	MOBCINlW5qfxUiryS7sF+ZJXH2gRoZzknafRaVwDLrif99Vpts4sq119kfdlfVXgt7aeTK4s/k5LR
	N6OBoJldfk6ZYxDQiRc22tRjzkW7s7zYQ2uWiPJ1SnQwoylcAQNNIVeNDsvC9lmm18YAlkNYXVZtR
	LmCe1m3f6AtqmAamDEe0OvPfUwqYDJxM8+D7AxiFwktxrTbAEcg9ZJWHZu68DAzvUos4wZ10hyErQ
	yqb6FFQg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:49156 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xVaOQ-00000001dt3-1HPJ;
	Tue, 24 Nov 2026 01:42:02 +0530
Date: Mon, 23 Nov 2026 12:12:01 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: David Yang <mmyangfl@gmail.com>
Cc: linux-watchdog@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: arm,sp805: reference the
 PrimeCell binding
Message-ID: <1266dc98-b755-4112-8c1a-0ad54164dbaf@roeck-us.net>
References: <20261114184257.535546-1-mmyangfl@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261114184257.535546-1-mmyangfl@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xVaOQ-00000001dt3-1HPJ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:49156
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 20
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEhoxE+109gEKeUEqzur/LML1exF1xh9fYrUkACynzSCLnqC8UbfwiBg5RS8YdNud6qlghLBV5G5TBoj12F1uJfB7rks5c3QirgnkAqh2FpqJB6WE8l/
 VJR3wyJ/FsEfZCAfOLtuo02BY0iCWokj/BGe4Bg3cDcqypIKuulylsnKRLMPKCHgSX/pSnrXwPWXqPf2MNEGWTNCCRsCA04RmQyQLoUUCGeC1hHrugW16dLh

On Sun, Nov 15, 2026 at 02:42:33AM +0800, David Yang wrote:
> Unlike the other PrimeCell bindings, the binding ends in
> unevaluatedProperties: false without referencing
> /schemas/arm/primecell.yaml#, so arm,primecell-periphid is not an
> evaluated property on an arm,sp805 node. Two nodes in the tree carry
> that property regardless -- watchdog@a2c000 in hisi-x5hd2.dtsi and
> watchdog@8000 in mps2.dtsi.
> 
> `make CHECK_DTBS=y`:
> 
>   watchdog@a2c000 (arm,sp805): Unevaluated properties are not allowed
>   ('arm,primecell-periphid' was unexpected)
> 
> Add the reference so the property becomes evaluable; both nodes then
> validate.
> 
> Fixes: 73d3e43f9813 ("dt-bindings: watchdog: sp-805: Convert to Json-schema")
> Signed-off-by: David Yang <mmyangfl@gmail.com>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
