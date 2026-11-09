Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794266700;
	b=czrc6zehSKvEDK8eCi+V3hOSR1SowEKhPP6mrtvRRx6aILdhwU81XEhaPoeOHtd+7S0b
	 45gcpEZWlwM4ClgIFRcCa5ZzAXCViwJB1NWbBog8wZOb23XBIAYiX7iLhd65L7Y6LSJMn
	 GxKYeAROd6N/pquxoXsChIUhc0SelH7Pe36LLYrw0FhlpAn2/r9oZCmpFAevDaW/OX3Dz
	 lyMmCgK6xfrQxY65XjNMElEZB1EzfuYfkrsw6jCV1Rdy4vmDWWCsMkz9qTGU75sT0N4Lh
	 FzvxjacoPPJwEA1OWTn1KIG4BO+qu4udnLZCkNGsh6v33pgSJ1jlqd+VHJOW4LdH33Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794266700;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=J+68wHIkUnHwz3TivKr0WUSuO34xn3RSmjsxMh6ln60=;
	b=OD7qOCHoYO6GiGYME++405RELurqNavu+IRrWvEserXDtZhIY/qUmmbGjPDfvi6Hoeil
	 BnfXAGVxvcCL1kFR30kwhdjbUWULW5MgzHAUFEacBBZ8QlT0wYxISvzBagqYtGPDzH0PE
	 U55O6seo+AHcuDDqqnPN0hr52rqIcWST+eoEvkiAtcfBXIBZQCH4FxUK6fSiKUWyrcUZA
	 Q2bUq74frNBuKRNrIYHMGjHJdd21S/O/rn8SCUvZ1ajp9ZMxVNvQGiS6cLdwkKJ9Afag9
	 GEiiToac48isJMSlZ61Yh1vVLCwjDhgU/lG6BILCuJd0MtbxIF2eakre11YfdHo/Luw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=piHV1Lxo;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE60606A331
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 23:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DE60606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=piHV1Lxo
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id QWzsxrLD44vCDQYjSxCOdX; Mon, 09 Nov 2026 23:24:58 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QYjSxnCE3YskhQYjSxkJjR; Mon, 09 Nov 2026 23:24:58 +0000
X-Authority-Analysis: v=2.4 cv=CKMqXQrD c=1 sm=1 tr=0 ts=6af2564a
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=yC-0_ovQAAAA:8
 a=_jlGtV7tAAAA:8 a=X6MXEInN9CrlbRLakdQA:9 a=CjuIK1q_8ugA:10
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=J+68wHIkUnHwz3TivKr0WUSuO34xn3RSmjsxMh6ln60=; b=piHV1Lxota5tnko/Lsecfqv1WG
	cSQHd75k+wzOZePtR2ZBlYbAnYa767CLXA09Bue5KP/frAws6rpWrLxDno7xMPsdR3R6CNzjgOm3+
	cofch2KLmvS3hJ1vebizHrCH3ik8x1EpQsMM5ZTEWoV5lhK8rLCKEWijw/0uEqxAvWlVvbwsWg8ZF
	2pQ63lT/vKqlwMyKiiXuleanAdRR5f1N+ZfxfxcE+RMsjKRkRirqtXY72DAV3Zm/yi2XOPaOC7N5m
	2zKyS4xlaXAPB1KfusHlQQ1baAU11/gRd2MMSB04++dLIDuE1geYLMAn6MfDMEFk69mafTmZsrFfj
	HnTtmqgg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:51608 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQYjQ-00000000xBF-2QUA;
	Tue, 10 Nov 2026 04:54:56 +0530
Date: Mon, 9 Nov 2026 15:24:55 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v8 5/7] watchdog: rzv2h_wdt: Add syscon based WDTDCR
 access
Message-ID: <835899c7-5dea-4f34-b804-1b6bbb564d71@roeck-us.net>
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261001165201.763882-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
In-Reply-To: <20261001165201.763882-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQYjQ-00000000xBF-2QUA
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:51608
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 87
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMWfcwWzU6A92ccjNKy58IsxTI68ggDg7PUmuNUqnU/n+C33knELVrfNl253CLz14okLX+4HkyRsAyrOpiFjaz+sic162n8F6LDUmj2AZ0GJ9JyDW5cY
 k4XGTbmFfX9PQpUX2LQbOJ1RK06pw/b9rFyksz9yLDox8YOosK321ifElrxz+tm1ObILX0VkaX4zM3GNw/Ecad32+ysCbtg9gmK+4cm/WJZlvhCOZh2gCtqu

On Thu, Oct 01, 2026 at 05:51:59PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> On RZ/T2H and RZ/N2H, WDTDCR is located in the SYS block rather than the
> WDT register space. Allow the WDT driver to access it through the syscon
> regmap exposed by the CPG driver. Retain support for the existing second
> WDT register region for compatibility with older device trees.
> 
> The syscon regmap uses locks and cannot be used from the watchdog restart
> handler, which runs in atomic context. Use the CPG helper for this path so
> WDTDCR can be accessed without taking a lock, while continuing to use the
> syscon regmap for normal start and stop operations.
> 
> Keep the WDTDCR start and stop helpers as void and treat the regmap
> operations as best effort. Propagating errors from these MMIO-backed
> accesses would complicate the control flow and error handling, while
> the restart path in particular should make a best effort to restart
> the system.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter
