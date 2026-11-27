Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.204.237.243
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795744700;
	b=tgva7SUkbHWS/0LJOED6l7Ac180FI6nZjjl2h+Ei5O3YqOV6Bj3uM3QG1mKUCB5Vt0wu
	 vcf3rCgwGZhu2Nqb7Drq0VgvqT6a9Uq79tiM8inBcYul8UdJavQa+t6yONmffSSDGFo9X
	 qHRSpwVPXvxTv6xQmoTOuhseILVvX7rR7sHQQVs49ieQw0/D50mcCuYXPIsoOLmTAhEMg
	 eDnYIEwdg6c/WfMDQbiJnpKxBGIJauTfjynKPANGxwYEgkm4g9/Acm+/Rz/AylGaZlZIu
	 vLEjVovUQzrmJYR7cnxYLzAcglkeX873Rhvo/1ZuN9wn2JeCs8073aiuJ7Qr718PDmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795744700;
	h=DMARC-Filter:X-MailGates:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0FgtUwX/QDpFjEdtf0ENnKLphQXReRL+nipzTS3d7jo=;
	b=GofAdLx2bNwW8Hm0Cra5XsCF5H8pCEzYLhYVCSTr4nu5vgxXalLFJy4aqD+9+SI+q6Ek
	 5j95JiaR/tJH+NB3g/Q5TkxgjeplPSIgf0BR1dB4ZSccTdCkTCAF9eO6xlUuLViMmTTEL
	 YQHUGn0WDs/JqgPHw2OdysPOPIYzFqzoK0sGDL5wrgi5xWVvH9rtCL7svf+YiVM/+ioKu
	 fvNw6PPNdnizi+7zJCjkznMY0ibECCIFbF/5hBUGRuNbiPKiifnB5QRhC7vgFsqxNhYfq
	 LrJFlNoyrvn6zbSpBhzKg4uxHHJ/YGuNPlH+m5MKpM3nMOLHoJOQ42zuc1omtXy7Kbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cqplus1.com;
	spf=fail smtp.mailfrom=cqplus1.com;
	arc=none smtp.remote-ip=113.204.237.243
Received: from mailgates (unknown [113.204.237.243])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57DC5606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57DC5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cqplus1.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=cqplus1.com
X-MailGates: JQAAAAAAAAAMC2gUOm5SZHp9cTMyHikHNGZ3bGAhDmBscA86TAJQaQ99HFF
	e
Received: from 172.28.114.216
	by mailgates with MailGates ESMTP Server V6.0(3855456:0:AUTH_RELAY)
	(envelope-from <qinjian@cqplus1.com>); Fri, 27 Nov 2026 09:57:47 +0800 (CST)
From: Qin Jian <qinjian@cqplus1.com>
To: ag@ffroot.co.za
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux@armlinux.org.uk,
	qinjian@cqplus1.com,
	robh@kernel.org
Subject: Re: [PATCH v5 5/6] arm: dts: sunplus: add Tibbo LTPP3G2 board
Date: Fri, 27 Nov 2026 09:48:02 +0800
Message-ID: <20261127014802.192986-1-qinjian@cqplus1.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260924164922.117236-6-ag@ffroot.co.za>
References: <20260924164922.117236-6-ag@ffroot.co.za>
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
