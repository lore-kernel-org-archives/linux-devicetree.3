Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631819;
	b=y2Z9CstB+q0j1FFtMV1Ujm0HrYFDJ6wj2SYZobInC5YQF+rl1y+FT8CRR4ETaOgCiSsy
	 qAkaAFeogFd0R0L2ZcBV4Dx7tp8ZiBlHRfip3yZXfHQxSVmvb5mEhaRlBfMaA0QUySlVV
	 tCH342M/AYvYlTG+y+z2HLtH+hdes+xoUQ1d4RH+Ot0qEMN/Iy7WU++BY1jaGO1lL75pA
	 zfdN41tqD412AzOed5341sQQr8kvZVF3VI/s8dEa/H8uLcVoypnrA1WoEXBpiTqEjG9VL
	 zHYlzBOUgJnbBtvKk3FJFIHNy/A6qR7FRSGH8r7sbe6JRTPa9VV9HCqBaPZzZcm4eTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631819;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=F/vQzTFayyFkCRmqJbg1f47qlyovwSCO1GLJCd5nXcw=;
	b=ErqS8FkRnyOxoFk685H0ynJTV9MrugAM+Qz4RIBclBiYCMrzSOkdh0mnEFRWDJL85tLk
	 8Oh9Q0oV5TwYyP+kBeSkHQGwP0wxZB51w1Q10PeS5yyQTrposimx5vl+Dto/CpQ1Lkunj
	 swWL3RQimfXu0sILItk/+vrpgQ7+c6ihEKwZAIKzIa1lVMA28MvSams6PMqYLbzixA+PQ
	 DAp9l5dqouVhuytiCB8FpvufWytdnPJ4odatWSbKPYddi1XFHdaei/m5U6TfoY+pO1oVt
	 gsRlkZ7BHVCJfnScePJ+teghmBMdK95LLY57A3suzixGu39OVJr/zlfPiAMFoNEbuKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=22zsud3j;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AEB609996B
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 15:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36AEB609996B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=22zsud3j
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id NrdsxQoETMylkNtZSxyARD; Mon, 02 Nov 2026 15:03:38 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id NtZRxMC2m1xnwNtZRxmk6J; Mon, 02 Nov 2026 15:03:37 +0000
X-Authority-Analysis: v=2.4 cv=OsxPyz/t c=1 sm=1 tr=0 ts=6ae8a649
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=Bq6zwJu1AAAA:8
 a=QyXUC8HyAAAA:8 a=DlIQwTXsA3Kt32vZTR0A:9 a=CjuIK1q_8ugA:10
 a=KQ6X2bKhxX7Fj2iT9C4S:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=F/vQzTFayyFkCRmqJbg1f47qlyovwSCO1GLJCd5nXcw=; b=22zsud3jyKjuE8iSOkWioVFvS2
	oPNLzxJBKdep+4vN+CFlmj6Zbz8dUR3FC89euC0/4oRtxMZI2xaFFbHWTojlkBKkxV4aAVBgM4Uru
	RtP8qmvMhLCBa+C3XAOH8Xx2k/AOIc8PLIfFhTCYzRet4QV7qVpr56BcD00Fo0VpMpJHH7huU0Ge/
	c3yH1gS1tTeBhzCxU2ZAy/qTOylpS0B2IIyHCiv2v+7oyLX1+EuafcmqSD0zZRyoNTZB4Bv8IQg0z
	xVLm4jvliPtHDfAuyEg4vHF4MJX+oSVdPWEPXCQQBWCb6doM0kj1wpuZi+dhw4khtl46OHHNHmXuM
	yW/UJ0PQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54142 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xNtZQ-00000003q96-4333;
	Mon, 02 Nov 2026 20:33:37 +0530
Date: Mon, 2 Nov 2026 07:03:36 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 5/6] hwmon: (peci/cputemp) Add support for Granite
 Rapids (GNR)
Message-ID: <35bba1af-7ed5-41c2-8608-3c81fc823345@roeck-us.net>
References: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
 <20261019114502.55307-6-changhuang.liang@starfivetech.com>
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
In-Reply-To: <20261019114502.55307-6-changhuang.liang@starfivetech.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xNtZQ-00000003q96-4333
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:54142
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfL0t2Ju0LvZacVyrQ8MPMzvwHN/kArPkELgARRa3SYVHydIReoeSEevUVPMWZgspTiPYjQSmxWnDW5vFB+IkgP2zi/AqALcV+sLK7uvtjm0eC1++RQQy
 vlSg4ZO7GO2tNdyTocCXn0e8aCx6k16RaaNa11lEO/0a56xniPPLkEdOl4wUr+mtgxfEDBwBk9q1WCwVlyAqHLfNEVueRWYrJmH30Ja+NjuC1PBo2SMpgKpI

On Mon, Oct 19, 2026 at 04:45:01AM -0700, Changhuang Liang wrote:
> Add Granite Rapids (GNR) CPU support to the PECI cputemp driver.
> 
> For Granite Rapids, the resolved cores mask must be collected from each
> compute core. This implementation is relatively complex. Since we do not
> use the resolved cores information for these CPUs, we can explicitly
> state in the driver that the core mask is not supported for this model.
> 
> Define new cpu_info structure for GNR with minimum PECI revision 0x42 and
> the thermal margin conversion function dts_ten_dot_six_to_millidegree().
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Iwona Winiarska <iwona.winiarska@intel.com>

Applied.

Thanks,
Guenter
