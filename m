Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941000;
	b=w28khwdqrBXvZFdqyUi+aJkfCq7PQEHGSzZxW4qiSW+7nPbswp9ENGN/46OXYbKpZ1M4
	 HGd5MvX7HkVV6xJZH98yqw6RgHqHTKNKI+Zxk+1pIVgdtcAJLNNQSGEgj39FkqW7DlsHV
	 ZvEIejMknUY9KVpTvwdeF/LracdDvopyJiBCXh3EeD9nEQld+YxgFDjsb8of9qLpDboK9
	 1Q9AiyCtt66X0BsQQpD5G/Sa21a1Tpqg0FW6lzWwLntuxQmz1B/O+L9uccki8bDXIUyEa
	 gpI9CPmzqHVEzIPYB8t+BMVBAOTN+HB/KA/GWTxoVAjeG/odROp/yWRWP1VMoiF+9Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941000;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=lfQK1qZ4pCnARv91d8ZOSe1H7v7Ch00995WaHoda5R4=;
	b=LSp3UjR2S3F0WVB0Ese/vstVN6KiYr9MhFe9VLQ1SWmSyy1/yWtJqqGLdQHZHDLr64fa
	 Lw/jhpCwKEhyFhxS+IJonLQOgh7PPsq1xQLHEKyJ+8sxbTCnSdTz5G2NVVkGEOeeXAC5m
	 0N2o8ZEd5fMWx5Lway4CrGLgOSnC6kZ9nDVy+bIQOTWdBfm9c4m67W4dB5E7D7T9kpYu9
	 1o6xWDgMegDp+auwQxhVx3mglHzVuTUeAatIZ9RV6rQpgc7ruLxWZ1S4wQJ6xOePq9Cgo
	 /fL8i3bweINvoVz+JAH+agOu20Ccd6eBhHemg4HxzAVJK3KYyRsvzhn58DA3789sYqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=p5pQpwrG;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA1D606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 18:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EA1D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=p5pQpwrG
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id TNTQxCImGJFmFTO9HxMweQ; Tue, 17 Nov 2026 18:43:19 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id TO9GxoSplGh2BTO9Gxi65h; Tue, 17 Nov 2026 18:43:18 +0000
X-Authority-Analysis: v=2.4 cv=Aszu3P9P c=1 sm=1 tr=0 ts=6afca046
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=gAnH3GRIAAAA:8
 a=KQfoQ390rSe1vipBtJIA:9 a=CjuIK1q_8ugA:10 a=GiPHQlO4o4oA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lfQK1qZ4pCnARv91d8ZOSe1H7v7Ch00995WaHoda5R4=; b=p5pQpwrGgNVXIksQWi7otCUCTH
	xdUHmv3f8JO2JDwzVsxySrwUVOBvBxWVQGWq59lMMWIXLlyOM++4KdwI5tBIujcfJB7rD9Z0MMJTJ
	mgXRw8zEt7ymetR9Xn0CyQKabEzGM6zGas3Ab3+L489vSR03rjO/NRSqsr2MmIKfidEVfRjTDJvHX
	ZXNDo3gbqlecGX13wsKxn03NmtyOGht3GxJmNZsqGV9AP7Z9GEM7cC15UrYHcKtdwIsN+8jrP/LZ3
	8y3DRCk2GxtNTQ7HMfP54SBhsL/au/KBg0msvGKC2Hil9GDb9J+D052C15pmKAS8vQAFNEnCnwx++
	DB+3TCNQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:44568 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xTO9F-000000008EC-42KE;
	Wed, 18 Nov 2026 00:13:18 +0530
Date: Tue, 17 Nov 2026 10:43:17 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Christopher de Guzman <christopher.deguzman@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] hwmon: ltc2978: Document LT7175 and LT7176P
 support
Message-ID: <0e44793b-38e3-48e4-aff3-84e423ff63bb@roeck-us.net>
References: <20261110-upstream-lt7175-lt7176p-v2-0-dd60d28383bf@analog.com>
 <20261110-upstream-lt7175-lt7176p-v2-3-dd60d28383bf@analog.com>
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
In-Reply-To: <20261110-upstream-lt7175-lt7176p-v2-3-dd60d28383bf@analog.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xTO9F-000000008EC-42KE
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:44568
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 27
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfE3I9XgQOyS6igWJWeNLqiOAFol57zyF5sQZTynbFO2LkgeuqLFU5/OSA7vzIgdzGVSVVfbTbEDxxNBwonxQuRR5xtpl3QWndICmIqCRBa++PLJ7SGOz
 u4i+dWQNdAho+n5hWNe9saj9fsxRL6Ihh7dscoGbZtgYon3viq7CkV8F0o9Om4zgqvY/trFSza1yFPk13Upg9tebaJnFnX6laAzlmH+6IqdNXBqUI/NkfUMc

On Tue, Nov 10, 2026 at 06:00:42PM +0800, Christopher de Guzman wrote:
> Document support for the LT7175 and LT7176P PMBus buck regulators.
> 
> Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>

Applied.

Thanks,
Guenter
