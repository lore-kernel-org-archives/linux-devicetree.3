Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114834;
	b=4XpSeVDBlXZP9Rrt7OBaZzxsW5xNFQk3IhOuCuPjhcNmnGIWlJ1Cake5WIe9Rh/egwND
	 80mDWWVMZlors5Yx5AHpqVkMiKCJpDZzmfjTGXFC9su5mQkVG1JglSqedltNAqWwNx8Xc
	 QHf3iBF3qfsieqdMSdqHDgQkBDkII4C3Z/muFO88EDRpcPtUiH04rDoUHIx/kFld01w5w
	 +bP2r7fIry0+gwt9eDFxeqEBC8D0yzEcws/z3avHZlPe0heZVkknu7xaazGINWstA7kfl
	 8CZ40oJ6GQRIXVbiUqcXTQa4GrGdCUPU/a//vxfLafOBmDUXzdL0CWsvl1BJGpt/mCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114834;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=hcVetJ3j4Yw0L4vaeF4Sin3e+Kqt87+IIjhgJbDSvlc=;
	b=rGVCl1GrMu6bWKisI4HLdJtQV2hDwPy6Vo2HuNz6mkdweqyVYnGvYADBVIuK+kcWUnOn
	 v8RDil70SKcY+RcZvx7rvDT6S/HJOSM1FKF9I84l4Xp3wc/tPFNsJXlSSySDd1CPrwm86
	 1xS9WU0L9iV42PR8T4cKEIYkz83ZDS/XC7MhFTnfcEYY4SXQxO6/97xVF6BhU6QfAmKYL
	 BSxgIqvX5hG3xUxqGEh4muhvOJSeql09IhhsQutyGJyav9Gz2HkhHh64VLr4Jnx5tIs4m
	 GYSZ9TY54W77zUTYcp5TLRAGwukR23QSyC7X09NX/PgO92nDnP9A81C8ghiPzgwIEVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=FmxUwmAs;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F52606A327
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 15:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0F52606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=FmxUwmAs
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id LhidxxkLFv0ndLj4zxL6EQ; Tue, 27 Oct 2026 15:27:13 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Lj4xx9JjPoYFCLj4yxWVpe; Tue, 27 Oct 2026 15:27:12 +0000
X-Authority-Analysis: v=2.4 cv=b4Cy4sGx c=1 sm=1 tr=0 ts=6ae0c2d0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=xkLUNt4dAAAA:8
 a=zk4-lHRcAAAA:8 a=X3a0BiUdAAAA:8 a=_jlGtV7tAAAA:8 a=OpKgjLFNguK3uynLL7kA:9
 a=CjuIK1q_8ugA:10 a=A2EApc-QTtVVSfvlwUcc:22 a=7cv85riZL9-k45RWW8P6:22
 a=aWu3muFgq6otJbhCXpL5:22 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hcVetJ3j4Yw0L4vaeF4Sin3e+Kqt87+IIjhgJbDSvlc=; b=FmxUwmAs7mF4dF4b3MQBl8bdVb
	tiCn1dYzKJ0/5zMuy3Dkl5KtJ1CdWrSMhaagLq87Gx1uPeduOFJAZZReNPm7krFrp0E60KhUlLIDc
	70bByHiXUwq6iK+SuZfP+qFgtQERObuDjcXRMpBCSrAB+a4BQNBCvwyL7kA0dqv78KyQ6qQWLmyRA
	Hq42mLTB+P7mkwhAHTZEbxhOIJ8RQ+dr6VZLeMOToBzgTx990t+r2R8igmo3YeZYI720aXTIoEzEs
	LnG2PVoLpX07aKgbwkJl8Q9l2uD8LdzNHoRsOylbfZGPe9Q4HIZozVgI9EWjY8N/Ouib2/Lj2x8ET
	IhcPGRCw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:41180 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xLj4v-00000000Fjr-01VO;
	Tue, 27 Oct 2026 20:57:09 +0530
Date: Tue, 27 Oct 2026 08:27:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, linux-watchdog@vger.kernel.org,
	upstream@lists.phytec.de, andrej.picej@norik.com
Subject: Re: [PATCH v2 3/4] watchdog: da9062: Add support for dlg,wdt-sd
 property
Message-ID: <2365680e-3319-4ee1-90f4-33041e8f701b@roeck-us.net>
References: <20260924065044.368341-1-primoz.fiser@norik.com>
 <20260924065044.368341-4-primoz.fiser@norik.com>
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
In-Reply-To: <20260924065044.368341-4-primoz.fiser@norik.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xLj4v-00000000Fjr-01VO
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:41180
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 27
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEkkVS9OfH1zWDJt6QOuSjWVJTtM60zpg8pDbIncueAX3Cy+wux4W2UCtHkuPMdwCzW0CKrc9FrPkfHn0dgGB59Z2Wu3r8LNA+GhEVpfL/HJMVE/Yaqr
 OVn+um1jieOEwY00FfLpQnruk6sH5YnqQy4NiADlw1TsbiH8RvYmOYr5k0WCAfDyLFVdnwnhzfBSKxJrUKOcMObfe3PbrxEOnRbQGrB0tPwdU0N6fs4m7bKL

On Thu, Sep 24, 2026 at 08:50:43AM +0200, Primoz Fiser wrote:
> From: Andrej Picej <andrej.picej@norik.com>
> 
> Implement a method to change watchdog timeout configuration based on the
> "dlg,wdt-sd" devicetree property. Setting the WATCHDOG_SD bit enables
> SHUTDOWN mode, and clearing it enables POWERDOWN mode on watchdog
> timeout.
> 
> If no devicetree property is specified, the WATCHDOG_SD bit stays in the
> default configuration, not breaking behaviour of devices which might
> depend on default fuse configuration.
> 
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> Tested-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Applied.

Note that this depends on the mfd patches making CONFIG_I writeable. Those
patches have been accepted but are (as of this writing) not yet upstream.
Assumption is that both this and the CONFIG_I patches will be applied
with the 7.5 merge window.

Thanks,
Guenter
