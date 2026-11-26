Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.204.237.243
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660960;
	b=A7OALH3qMHl1Pqk0qkaG/7adOduMfaNF8ahk5yAv+q3VqfjGyb4xH2SEwGvlUoVzTOR9
	 syMWWKqUooNW8PbnB1zRKjFgH3SzgVMnNzz2VlpjVHsO2QYUB4yLbmmfksLPL+H738ooG
	 K1IdqetH4+8Yn6KfpBpQ9k2A+APv0FFSqqBBlZWYHC9x8zDtKI9glE/zHjTS+Ak7h68AN
	 RGEu0Luzt10hatJ52Nm8CkooBeN6OK/mKywXRJpfE3sXTFL0M6RcdmK5tKENEt1LLNsGr
	 fB1GZH47apMFGeGL0CxJtJK6zuXAsDbLRTjHMmWMSOfewaKZJlhsTNCIYwP8YWXEWmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660960;
	h=DMARC-Filter:X-MailGates:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fUpXcnBoqheZvx0e9QGWAetYZq9Ks8jKPtY4D8e6Xs8=;
	b=GCkV/ptS/pGVRott8VtQancBzj9VkuEvLxeGcFY5XPsfscwov75maht3XabnOtYTyFR3
	 wcJhz75E7LO9YUc0BNRVyhEh59SMy9JXOgRlkX3NjbuN0AsgSo3PaXkl45VzODA0hFC8J
	 kO809T9J+8v15Rpr6PhVzbTOUibGLotV219VsG9Hk1aR2gMA0jfa3znI6NiaNIpSMvDnA
	 JFRBNdAsznlX5rpUZzkBtZkQcGRU3iP2cK3kQhhJYiSGIWHttGSnduGmnEILaZ8/HIz2b
	 yixw5TsvJgfTbUn0/MKTuB9jraEH6AnV2/P5RBpC/pjMy28lgx5whQ7zZfvmSyCNi2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cqplus1.com;
	spf=fail smtp.mailfrom=cqplus1.com;
	arc=none smtp.remote-ip=113.204.237.243
Received: from mailgates (unknown [113.204.237.243])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23AA606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C23AA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cqplus1.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=cqplus1.com
X-MailGates: JQAAAAAAAAAKCWcrCRdJDEQGF35jTC99KQ1TCwwBfiUbYn14fUNaYD1qHQd
	e
Received: from 172.28.114.216
	by mailgates with MailGates ESMTP Server V6.0(3855458:0:AUTH_RELAY)
	(envelope-from <qinjian@cqplus1.com>); Thu, 26 Nov 2026 10:41:58 +0800 (CST)
From: Qin Jian <qinjian@cqplus1.com>
To: ag@ffroot.co.za
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux@armlinux.org.uk,
	qinjian@cqplus1.com,
	robh@kernel.org
Subject: [REPLY][PATCH v5 3/6] arm: dts: sunplus: add PWM, watchdog and MMC nodes to SP7021 DTSI
Date: Thu, 26 Nov 2026 10:32:08 +0800
Message-ID: <20261126023208.36806-1-qinjian@cqplus1.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260924164922.117236-5-ag@ffroot.co.za>
References: <20260924164922.117236-5-ag@ffroot.co.za>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Acked-by: Qin Jian <qinjian@cqplus1.com>
