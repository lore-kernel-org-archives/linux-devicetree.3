Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793851939;
	b=BoQP3tiH7iHiS43+adaFpaBp1sEYuYmZGHu+qzkZVf1zZlL2epmw2/bicV+vnrGqg1HH
	 OCzrhKaJnrjnSI1IZag8j/FVMwIvSKt50JBX1RFPJ8CCHM3nsntjVZZRJC/oTsmWkskGF
	 q2wR49ezesWJWALfbWJ/Apaop3m+KxaV5Tu4Rns4mKuooMHnYPv8eX4KZ2XwX2jHbFygT
	 X7KVWuD5AsPPYeDFyoR+5TlwUbR0sR3VKQIvQFF8pJs/zn0Hi01UxnG3VjjQESkBWcaFz
	 SC6u4ZsabCDUIQl2W8xUT5L56gdyhf60d/cILlRUJudPz6AYVHePCU//IDJR0mnqvvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851939;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=c8m5MIJPDMmiDGEpNvB5AEdQQVP/9nxkivagAbmdY3E=;
	b=n6/9nXaUX9lAyzJ/aaMswGF5bhEvats0anHupTmJc1YRMLNL99IwufHG8ZblnWBmFKl/
	 /8RtgTSLRa85iIlgbKiSD/a57R8KUbHfoJ7iROE6jX0WayBlwD7n0Ml5o/ca94/Em5/if
	 4zLU6bRWghWc0XSW+nZ+os4gh9ZO/ekTiB+btS0Y2Kmj3cbqV6iqZarvf867Ig0Mr8uGX
	 JBVQkAsWhsiql/CRQ4LAEn5jVDc/McsTt+Os37hDDqKcXtOSVwnvwWU9LS9PvoxmF7nMB
	 OfFqXKmEUxeRRydeF4fvIDyj/QN337cVnUOQYz0Qm89SEpJhhbbqf8p7x2tQyH2zoUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=drn8R2A+;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3640C606A329
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 04:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3640C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=drn8R2A+
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id OmEzxaS37VK9UOopmxKgWZ; Thu, 05 Nov 2026 04:12:18 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id OopmxE8J1BdeUOopmxR7oB; Thu, 05 Nov 2026 04:12:18 +0000
X-Authority-Analysis: v=2.4 cv=AaexH2XG c=1 sm=1 tr=0 ts=6aec0222
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=gAnH3GRIAAAA:8
 a=4dYrO911E-Z2Nd993hQA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=c8m5MIJPDMmiDGEpNvB5AEdQQVP/9nxkivagAbmdY3E=; b=drn8R2A++CY7/9cj26bKs6QiaD
	J6pcWbAyKj9SHdAz892lRIdOdsexDxV48JWnpvyYaHeM8BXjCiktAO8SFWYJwG3raZXF4dGfc2Fzo
	IB/quCSEYeyr5gOHKFl2NBIk23YSKpL/8ygJWK8ACNBOjXEQQESxhKF6VZHrr9mrMxt3EERFkdrra
	slrNuoGUiAjeR+jmX8a4ebeDeRsBS6TQo5vM7omEKD5BugR2FDOOt/4NC2mQ0YFQxKt3gxehPAOLK
	TcH6cJMz6HHd6fFV+6/885QELU4fSZWlg/j1OTRw62ySBJ22rtqzeV6ANpt806NpsO+kWSvuBh+Ly
	LEY+ncnw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:46092 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xOopl-00000004BYe-4AfM;
	Thu, 05 Nov 2026 09:42:18 +0530
Date: Wed, 4 Nov 2026 20:12:17 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Carlos Jones <carlosjr.jones@analog.com>
Cc: alexisczezar.torreno@analog.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/max20830) Add support for MAX20810,
 MAX20815, LTM4739, LTM4740
Message-ID: <777a34ee-aa9c-44ee-ba00-5bda32539324@roeck-us.net>
References: <20261103084331.449-1-carlosjr.jones@analog.com>
 <20261103084331.449-3-carlosjr.jones@analog.com>
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
In-Reply-To: <20261103084331.449-3-carlosjr.jones@analog.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xOopl-00000004BYe-4AfM
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:46092
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 18
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMKBLRAwOMTN3kB3dgimc7ZLXeNsRg6h8QYJlvRtUb4eQDM4WgzkymtaYmzH/VCOX1jLO2OaHzQhgs9I+bJLWpXhOPZ1lB8mv9B2ei5iJgJlbu12TsFC
 oAnnab89Orhp2BNe0PduGhgVU66fva2ML/4fGxdkE6tjKVd/HRZ147QIMIpxvHQqj3oUwGGNkJ11639mQlBc1CY9K7jmaTEUU35nOC3b3CqEJQbK9B7t6Nnk

On Tue, Nov 03, 2026 at 04:43:31PM +0800, Carlos Jones wrote:
> From: Carlos Jones Jr <carlosjr.jones@analog.com>
> 
> Add support for additional members of the MAX20830 family:
> - MAX20810: 2.7V-16V input, up to 10A output
> - MAX20815: 2.7V-16V input, up to 15A output
> - LTM4739:  3V-15V input, up to 10A output
> - LTM4740:  3V-15V input, up to 15A output
> 
> The LTM4739 and LTM4740 are the LTM-series equivalents of the MAX20810
> and MAX20815 respectively. All share the MAX20830 PMBus command set and
> telemetry, so no new register handling is required; they are accepted by
> matching their IC_DEVICE_ID.
> 
> The LTM4739 and LTM4740 are uModules built around the MAX20810/MAX20815
> dies and report the die's IC_DEVICE_ID with a "B" suffix ("MAX20810B" /
> "MAX20815B"), not the "LTM4739"/"LTM4740" names printed in their
> datasheets (which are being corrected to match). Only the IDs observed on
> hardware are matched; the plain datasheet IDs ("MAX20810", "MAX20815",
> "LTM4739", "LTM4740") are not matched, as no part reporting them has been
> observed.
> 
> Matching is via the existing adi,max20830 fallback compatible; no new
> of_match entries are needed.
> 
> Signed-off-by: Carlos Jones Jr <carlosjr.jones@analog.com>

I'll make the change to Kconfig as suggested by Sashiko. No need to resend.
Applied.

Thanks,
Guenter
