Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795148904;
	b=Stw9FAsjeAuFIMA6iZALK5+J7mvmg8b8STxRfc4Mdog62iA0IcEjVZE9kSDxEmpyCcRl
	 nQGN7LHlPn/VGymkH1+QLu3xu3yExr9W90++x/u1BQcUaBm9aFU2FVbJ0ZOXuu2w8zq/R
	 4nmll1M7xvVw8INNs3nJ5ltQ6CeUyy+1G+bwDkCPT6qKn+XZFh1siAPS1nzKcsXn2jz3y
	 yNujx5ccPzJd8KIPQsaWhAjw/Xm3whDVO/LGxV6f7gDzGkgv2RlXfXoCal8Px30ujQXKd
	 TZHwyTEDitrqxAe4+wJGmPZXs9U8ll0tV2gnp3OozWntk+/yrobRJIxw+/BYjvMKAlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795148904;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=nLedZFBA7pqqAsbPKZ7gcKV3+oeuaHEN21qa0HYf6XM=;
	b=oSlFd9VCTm6romDDx+qq3FQO22SbJxxF9GpC5JUOMHZ7GheOM5zbfwpER/ZUyONiLf9D
	 8f3e2CctCM975/ziY9dvZWje4eY9w6l0g8CcA60hCPfRVist92YOq6KTXYf1RD9dVRBA3
	 jtkTJ8KHL+mA2OzzgClTNzO0F0tdDwPXWAZNzjjhSDIMPyePRYxJ8ujXOVcCG6xku2LWg
	 3Rav4qX4zBYWljBNoGHcJWZxYU+jj8iaGWAcKy7zMoohXJEopxVdVZpZggCrq0J+UygLx
	 ig8rY/fyE9X0P5BFD+lYSBYk3aOZJr7DKJgFJSRfWlcLQdsAkWmsBQ0YSX4jax69JKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=FzyVJj7c;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34447606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 04:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34447606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=FzyVJj7c
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id UCyxx5mWryb4YUGEZxTTQV; Fri, 20 Nov 2026 04:28:24 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id UGEZxu6GgSeuLUGEZxXoxo; Fri, 20 Nov 2026 04:28:23 +0000
X-Authority-Analysis: v=2.4 cv=NYvm13D4 c=1 sm=1 tr=0 ts=6affcc67
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=zpOVymEVAAAA:8
 a=sfOm8-O8AAAA:8 a=VwQbUJbxAAAA:8 a=hcTXbwEjzvrjQ1zhnm8A:9 a=CjuIK1q_8ugA:10
 a=LCD48ZUe64JR9pieE8wa:22 a=TvTJqdcANYtsRzA46cdi:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nLedZFBA7pqqAsbPKZ7gcKV3+oeuaHEN21qa0HYf6XM=; b=FzyVJj7cPvl7dEzz9yFaq4vsUh
	vV8Mtn7m3ZT1wQ+TyHistVMiLvQQiaVc93lEZehmwmIZVDjKlVAegoI/Bi1Q3DVjhrAqiPaZ23QOj
	UDpbQU4rSzBP6QCymIRj+WZgGmJVbAR0U7SI1WO867eMPhV/54DmMbc3ze3U1k/GlQGdxxC7yGS/F
	2PeoUhwh6NO3vETtwcEc8gX6GcLdSBZ061df7JkOC/4gT5KgMYHGSBm9i6Vw9B3nmAiomi71E15IC
	NMeEt27xdyds8cipmdI8jjiusi+LufINp3B2qLNLx++tTxEcghAlJvosRWbgs5M7W0gmWZoft6YAj
	Fua7BaKw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33778 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xUGEY-00000003dBr-1qLm;
	Fri, 20 Nov 2026 09:58:22 +0530
Date: Thu, 19 Nov 2026 20:28:21 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ben Grisdale <bengris32@protonmail.ch>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: mediatek,mtk-wdt: fix mt6797
 compatible
Message-ID: <6002e935-199e-4d0c-adb9-d0c83162994a@roeck-us.net>
References: <20261110-6797-wdt-v1-0-7f07755b6074@protonmail.com>
 <20261110-6797-wdt-v1-1-7f07755b6074@protonmail.com>
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
In-Reply-To: <20261110-6797-wdt-v1-1-7f07755b6074@protonmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xUGEY-00000003dBr-1qLm
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:33778
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 4
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfL/ej7r045VAjl+oFgtFUEmhe306HDEBBOmOdtFZs7YGz95zoqVfN6bOhTujkUslkrbPDEq9/noFSxUZx3ifNNcYX/XvSlNgoNBrlFx9PDJf3SY0Uiix
 ZCoxS4oMhGQSzaJSBF4mWhY/WYxK4uw+J4rgKFibneldXItUddJgORCnMhaZ+loLLNSN5oWRvZgx2uqM54dxQH84JaQVOgDibhlUc1Uquqq3SslR3fzdtQ3u

On Tue, Nov 10, 2026 at 09:22:21PM +0200, Roman Vivchar wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> The TOPRGU reset bits on the mt6797 SoC do not match that of mt6589,
> therefore they are not compatible [1].
> 
> Deprecate the mt6589 fallback for mt6797 and add its own compatible
> string. Also add a new binding header for the actual watchdog resets on
> the SoC.
> 
> Link: https://www.96boards.org/documentation/consumer/mediatekx20/additional-docs/docs/MT6797_Register_Table_Part_1.pdf [1]
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
