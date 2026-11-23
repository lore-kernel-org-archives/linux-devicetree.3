Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795464888;
	b=JQg1g5oUQ3YMFqjJZZCn5yTDc7kWsxX/wpgcrp6InApGrsv3msoXhouRHf1lnYkKPkdg
	 0x5h8azTTxEhjnA2MWRkE58JhXBeJrDMqzYfVw3iz/80NjU+yq07/SOqO5GySZTDaC6ju
	 PT1q8ZSYNSEPasY0z53qgAon4JROq+byUejzhdDGCGpYfxdAdcwjGUfcUQA6+8B5ZS08l
	 6Uq8DRMjuvucjPn8LqbExmHFr372DIPq/Q0d1c3ZKytzJIEbohRWqR4Orn6KXBOKNgUrs
	 CaVSdOraYv2XVpl6YUBjZxNei50C86lfTRTfneuggHtutfkbkWs2ZcSyOd0KYHsB/ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464888;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=Znz/EHw8pGjnVb+24THLSzwjj9xCRhxrR3p+gGFhSv0=;
	b=je2OrZJ9UnPAyGr8gWPKJ5nNkdIVpFlRRcM9ZiCBt1x9ybEot8iV2ywjSecS0gnn7VNO
	 kBIYmVLh4wJVu0G15U1sB8c3h/Fs/ngx73oZiQPa8e55E+gJVheSbxyvLMt9XmIEQHWF5
	 Ed0DxvxOs1BZSfv4r98z89XbUROVcwjmpbbxUnyaUq0en9EN0bz+FUVp+3hSPb4wIjaKb
	 pyIPp3eU5OAX0OYi+NpmmkgdXH7kItwQcdko/3Fdnh1tHY0LpmLWs6vdd7QzSlukMPJ4g
	 CtlMyIXHO06deU92+DnwZdiXU5pB6Slyi3UFsBEER0f+8pWcvW8DoSxlTzJLV/mxhrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=0JY4wPg4;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A552F606A326
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A552F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=0JY4wPg4
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id VYLRxvMqFRiNxVaR5xPoj6; Mon, 23 Nov 2026 20:14:47 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id VaR4xUmoH3nNNVaR4xQ5Xi; Mon, 23 Nov 2026 20:14:46 +0000
X-Authority-Analysis: v=2.4 cv=TuLmhCXh c=1 sm=1 tr=0 ts=6b049eb7
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=vsWaLUaKAAAA:8
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=eMddLIfAi8SY0Rflj0oA:9 a=CjuIK1q_8ugA:10
 a=ZAjiiiQUslnskKx8wA3N:22 a=AbAUZ8qAyYyZVLSsDulk:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Znz/EHw8pGjnVb+24THLSzwjj9xCRhxrR3p+gGFhSv0=; b=0JY4wPg4lQatPuT+RzaNpzWaxh
	4vjqPfVlAaAotDLwhzu5P68Y9CDpqgF9Ix1HiqTZKvhWGvmUP2SbWYbhWvqDAUnSOgkaWhOp7zaY4
	4gzT7xmT2GOcFFKtLX8OqI5xweA3YOHvi3jbRP7A2NT7F5J++9/kF7Z76Us3vAdFniZLal16URCBU
	4VHSiJRnA3z22qhFVHivGS+bAYr0R19LTcDMbPYyzHdtFpDUbdOUhA+8XUF6378z3LELcz3ggdxmC
	GdmRZz1JTHNRfCscBtdRXTj13ViWMAT23c3kknIGZ+nz0jjksoLfYcL7Pb5tvmO/DrxmNHK09SeqF
	G/HoNtlg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:60706 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xVaR3-00000001eYv-0aUE;
	Tue, 24 Nov 2026 01:44:45 +0530
Date: Mon, 23 Nov 2026 12:14:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Rui Cao <i@udp0.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org,
	linux-serial@vger.kernel.org, phone-devel@vger.kernel.org,
	Roman Vivchar <rva333@protonmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 MT6833
Message-ID: <352ec537-ea94-41ef-bba2-44964fb8ebd2@roeck-us.net>
References: <20261117-mt6833-base-v2-0-058a0685c40c@udp0.com>
 <20261117-mt6833-base-v2-2-058a0685c40c@udp0.com>
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
In-Reply-To: <20261117-mt6833-base-v2-2-058a0685c40c@udp0.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xVaR3-00000001eYv-0aUE
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:60706
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 37
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKf4CN7RSFwTriiGo+dsOxbaBxjfP2f3451IBkOp8nmp7va69g2MfaPXJFbMvq5aEAigHvdH0uk37vGS1QsUP0fJOkBSTVL8jwvSJjcISAyZvc3JTVs+
 jjika6zczHM6kUhKQbn4xigEotskaREu4G4II5618MBocNHdgKmHvLgK6IuicP60Rvd/heq0Mj31TgWGKCjKKurKv1QnqoJXxNXrendfODRZUlBhK1q4uxIt

On Tue, Nov 17, 2026 at 05:11:32PM +0800, Rui Cao wrote:
> From: Rui Cao <i@udp0.com>
> 
> Add MediaTek's MT6833 (Dimensity 700) as a compatible of its own.
> 
> It can't fall back to mediatek,mt6589-wdt, which also describes
> MT6589's twelve TOPRGU reset lines: MediaTek's kernel for MT6833 resets
> the connectivity CPU through bit 12 of WDT_SWSYSRST, past them, and has
> no full reset table for the SoC to take one from.
> 
> Signed-off-by: Rui Cao <i@udp0.com>
> Reviewed-by: AngeloGioacchino Del Regtno <angelogioacchino.delregno@collabora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
