Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BA62FE56F;
	Sun, 17 May 2026 07:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779001531; cv=none; b=hzqYO8+bZITprb3/qfmHhAx6yRPXCPQMnZiIrr9uML/psPRRZZAlSkmbGHvoTBjyK4ulftE616WlR43GdAeWtmyxoQCtTYiD9EsuNWtR8iWO2n0YGHtU3dtBeSNONnwipoB6jmyYO2+aSz8tVbYefpDjMaJZn1UABPStzOMtTho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779001531; c=relaxed/simple;
	bh=pShye0OKl2FKUITelBTK/F1J9muALv+vuqGujMe/U2A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QZ884+gSIm9i+xo2cnZO/0jbUvl5n/Eqmi0UrsjNfJ8xzANKZ+N9w/qNjyI+Ihmxl77sKcgpDfcC5waacyVa36vyfxvPRqCOWXuGIcVWUGrzDzxBh5bIkSRbsHNwGhgM/e2GkAY2dUiv4LNwZJcACo1csdK2zE6Q7GGPzltrE0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [119.122.215.211])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3eb40bc05;
	Sun, 17 May 2026 15:00:14 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@kernel.org
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable QSPI for OrangePi RV2
Date: Sun, 17 May 2026 15:00:06 +0800
Message-Id: <20260517070006.1836396-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <177893657188.2456968.7429508961699495905.b4-ty@b4>
References: <177893657188.2456968.7429508961699495905.b4-ty@b4>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e34bc44fe03a2kunm6878ac1010c8b4
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTRhOVkkZGh4dGhgYS0gaSlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJSkpZV1kWGg8SFR0UWUFZT0tIVUpLSU
	JNS0pVSktLVUtZBg++

Hi,

> Applied, thanks!

Wow, you're so fast!
The robot report has one typo:

> +			uboot@a00000 {
> +				reg = <0xa0000 0x760000>;
> +			};

This should be:
```
			uboot@a0000 {
```

Could you fix it? Or I can send the v2 patch.

Thanks,
Chukun
