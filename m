Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714719;
	b=ztrcP8b0wjCCakz5ManDb8FJFGwNN/PTqHq6xeQi/SBAav++TwPXY0mithwqETUf83/j
	 gNnzQ2ZD2Qyub82QCgM9we7tf6M4hI1dMMt1yt+WQmmqwZepmYef55TV/0G8IidGVicLD
	 mL2QAtARQmDhqpdUxgfl0mdbsNn4QxC0Np5URKa0mmBdM/z5Lq9KSAZI+ZrrgBfY/wznO
	 jcVEezqZsJMWneGbKRrj+u8U5hWgyFPPz2MR5qPjKOZrtp7EB0oW3P7vYvMga8CQHZy74
	 L/qGuln9tao9GcbtU030Vaxqy4xyq72xxo8OPtilF0Bypf2sQHhix94B1GL7rLRBUgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714719;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=WUmT6CAUiVXyDquHcVLXStJkH7YVniXYY2fst0uJG/c=;
	b=deqvJBbPgG5zU65kKvBeK5JNO4zyZgBKXUFKjm3bQIUpJGZrHgCZAwGXK3oWcIPT3kPY
	 yu93Nh4HKshHKF1wmTNcTK/QAABBEuI5hFulhtQixBzyZBTWhlFDyav228oEDEhHayfVF
	 dXppFp7Mbx1ius4U/WK5CI21I2ZHylj69rww71AadQ/t/TzCp5ntTPqj9KIODlEr/CfG4
	 Ll2jfbMIAb2QX8VqdKIx2cAlLD+0FManuO08rpkMrYKHaLYOPNFpO718eHSxvSyH+fJF8
	 51IB6PwaYWkwqxHXX5LHCavIQ7sUN1venrv/kfmNRtD0v4p+1JeAcbIM4T1Cg/KpScA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=KsZuoxiW;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825AF606A331
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 14:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 825AF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=KsZuoxiW
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id O5gqx4N26JFmFOF8XxG9IL; Tue, 03 Nov 2026 14:05:17 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id OF8Wx58FsmASCOF8WxGCTo; Tue, 03 Nov 2026 14:05:16 +0000
X-Authority-Analysis: v=2.4 cv=XJkwSRhE c=1 sm=1 tr=0 ts=6ae9ea1d
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=EUspDBNiAAAA:8
 a=oz-p-7aixD_jC9KcsVQA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WUmT6CAUiVXyDquHcVLXStJkH7YVniXYY2fst0uJG/c=; b=KsZuoxiWiTV6WuFXC5es94x3+k
	CDj/0sZQMEWDWX00zYQk+T0f5REShQl9QtXfwXvt8yVOFxiKJecLVAt59UMTnnTuxDWGqY7Un58gB
	oSVCyuQA5APzw09m7EmALSTiiH7AKCR4ZQJzwCi7nh4o3g8F+a1G6Q7up4XSgSTwuoMvRLrvRAXh/
	qG2jrL6BaAt3lK4KJqpw3APVPi+xl1HbM71t54gjHtOaIP4pYE/zncshe+Ng33cTB5kN8XIzaFA7Q
	YPiP9pEiEGD44mHyEQabSToc5tN35XQN8VgEhgWTT7ICKVmPqbEsJ4tqKmEfk1CHrgWXHjOLaE7Tq
	3VC4tbYA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:36386 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xOF8V-00000002ZBT-2orD;
	Tue, 03 Nov 2026 19:35:15 +0530
Date: Tue, 3 Nov 2026 06:05:14 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Kevin Jia <kjia@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add TDK FS160x and FS1006
Message-ID: <9bc4cc83-c96c-4d06-aaae-e18b033ed489@roeck-us.net>
References: <20261030-fs1603-v3-0-6f8963a74def@nexthop.ai>
 <20261030-fs1603-v3-1-6f8963a74def@nexthop.ai>
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
In-Reply-To: <20261030-fs1603-v3-1-6f8963a74def@nexthop.ai>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xOF8V-00000002ZBT-2orD
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:36386
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 4
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfK5WwRHdLey6CA+HMaqrhJwQV3R63lq+cQIk5MjhxdeWHwVBSALVeN25R6SlHAYzBT4m7UV133gkKFl/iB5Pp9dLKFXkfOU0iZdf2yF799XrAyvVX7nF
 32Ckn+wOqwbY1bcdjyf87cziQbLm3JbJd+d91lNc5TN7PWzkSEfFSpI9I8J6JpWrOHu5d9X0w9A6s2yHxekGOGgmN8i1IxIYFi+PUesgD7H10MoGUuKXfTji

On Fri, Oct 30, 2026 at 08:35:37PM +0000, Kevin Jia wrote:
> Add the TDK FS1603, FS1604, FS1606 and FS1006 uPOL converters. They have
> no ID register, so each part and factory preset has its own compatible,
> including the 3.3 V and 5.0 V presets of the FS1006. The FS1604, FS1006
> and FS1606-2500 encode telemetry the same way as the FS1603 and fall back
> to it. The base FS1606 reports in 10 mV steps and the FS1606-0600 needs
> an output current correction, so neither has a fallback.
> 
> Signed-off-by: Kevin Jia <kjia@nexthop.ai>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
