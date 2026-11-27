Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.204.237.243
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745897;
	b=KH9YPOe5bwJjBoEwCH2dvmrxeafcbTbR+z91a1HLS0pr9CLxwltPAnYTMK5iYkNsTKr3
	 8prBdi4WN6u4XQXUfKI0WqqZsNqQqv1SR2UFUILLLyEIkwmWZer8e7TRbudnDQEkeoROv
	 bG08WQ35aycreIbMnwsZqFpVTcRkd0wwMNDRCNbZFg2XAd2xSV3OFHNanlmuC7mpXr9Lm
	 UhccIcHzPWEyBB2Nfa2RfHVUocglnxOmUYfZs0APxHk13+waP94munV7qpYSDYklwE124
	 xVfVDw7XSUE5kEiLZMeVpm4/kauNQV0d7kRRvvMCPI3/8kB2OZrnwVcEfoqxK7BR5dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745897;
	h=DMARC-Filter:X-MailGates:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0FgtUwX/QDpFjEdtf0ENnKLphQXReRL+nipzTS3d7jo=;
	b=Vs8ebnwBJo4L/MhLvHUBtTFxOesfR6JC9F+J3oXH1upA6ZovW9MRLnscweoPvtTc/+6d
	 +qnQBeZrQ6isqFSpGDmz10LQunlDM9j5ZO6Uj5V1Eor0pCOMlqCrW5wYW1L1LEVRUY5dx
	 IowOdfB2AgBo4ZYUiXRwzP1fe0FxLu0g86l9+Gfv8px3HURLCVvt6mh3VNCbOr/cDseiU
	 3mwHjIEJrq7DYjMjmP/kuSedL71tZ7fH7daKHNmhUDuYGQwBbHCIFUeFNb9wtslwYG5lS
	 Ln7oeDt9J+aYdb3nnCkeomP+FGXIZhqzdA0kUzx6n3B/zFVz/f31m6gBA5TSUWBxL1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cqplus1.com;
	spf=fail smtp.mailfrom=cqplus1.com;
	arc=none smtp.remote-ip=113.204.237.243
Received: from mailgates (unknown [113.204.237.243])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9261A606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 02:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9261A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cqplus1.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=cqplus1.com
X-MailGates: JQAAAAAAAAAfEkwRaGUJdV0mcS9qYmAANgVuW2wtGhd0cygqCFVkKmINFxt
	e
Received: from 172.28.114.216
	by mailgates with MailGates ESMTP Server V6.0(3855455:0:AUTH_RELAY)
	(envelope-from <qinjian@cqplus1.com>); Fri, 27 Nov 2026 10:17:53 +0800 (CST)
From: Qin Jian <qinjian@cqplus1.com>
To: ag@ffroot.co.za
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux@armlinux.org.uk,
	qinjian@cqplus1.com,
	robh@kernel.org
Subject: Re: [PATCH v5 6/6] configs: sp7021: fix defaults and enable existing device drivers
Date: Fri, 27 Nov 2026 10:08:00 +0800
Message-ID: <20261127020800.193813-1-qinjian@cqplus1.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260924164922.117236-7-ag@ffroot.co.za>
References: <20260924164922.117236-7-ag@ffroot.co.za>
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
