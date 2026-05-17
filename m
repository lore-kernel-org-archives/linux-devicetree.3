Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48753164DF;
	Sun, 17 May 2026 10:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779015323; cv=none; b=XyJ6Kr6cyGL5CY30e7GPFfpaZnJaKqGanLg/Z0BBUoKzPP01bjADTVpOx5PcJ9bQUY9kG17tpV32leh5gQZ0NiIlAC/xbzb0GT/6GlsUKoiaeJs9WjjjmP70ohkIdxpqPconGwhJ5OyW6TvGRaWaxDZxMqm/785v1+GmDeI7ppw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779015323; c=relaxed/simple;
	bh=mym2AZr8qHmYBPdF1FDnJxIrdkbbp8uIX7LVOJu77SU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LSm1cmq4mdauQ5fxA6OB2dEkJdU8sV6RYGN2jRseR9Vz0G2pMie9mFftvDnCEUCysr2ABBPLZdAhs/+hBTaDgr4GB1iy/23rMGPPzMM3V5QM8yM5JbMs4iQ4v0pKsLu83wFmjduJodRKZX0lZwZoQ1qdw48q/t6620cia6zfZd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [119.122.215.211])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3eb5cf39b;
	Sun, 17 May 2026 18:50:01 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: legoll@online.fr
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable QSPI for OrangePi RV2
Date: Sun, 17 May 2026 18:40:40 +0800
Message-Id: <20260517104040.1941126-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <e92fc4a6-7a63-4d24-9c13-8fec3d8184d3@online.fr>
References: <e92fc4a6-7a63-4d24-9c13-8fec3d8184d3@online.fr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e358ea40403a2kunm5a1540d111564e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSx5PVk4YGRoZQh5KTExDSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJSkpZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pOTE5VSktLVUpCS0tZBg++

Hi,

> but cannot see anything relevant to SPI in dmesg, whereas I see [Q]SPI 
> in u-boot output, but there it is listed as:
> [   0.887] SF: Detected XM25QH128A with page size 256 Bytes, erase size 
> 64 KiB, total 16 MiB
> Which is not the same you tested (XM25QU128C).

Please do not trust the flash name printed by vendor UBoot.
XM25QU128C is 0x204118, while XM25QH128A is 0x207018.

~ # cat /sys/kernel/debug/spi-nor/spi0.0/params 
name            spi-nor-generic
id              20 41 18 20 41 18
size            16.0 MiB

You can also check the silkscreen of the SPI NOR flash. By
the way, the IO voltages of these two flashes are different.

> How can I know this patch is working properly ?

[    1.116594] 6 fixed-partitions partitions found on MTD device d420c000.spi
[    1.116609] Creating 6 MTD partitions on "d420c000.spi":
[    1.116615] 0x000000000000-0x000000010000 : "bootinfo"
[    1.119280] 0x000000010000-0x000000020000 : "private"
[    1.120718] 0x000000020000-0x000000060000 : "fsbl"
[    1.122064] 0x000000060000-0x000000070000 : "env"
[    1.126373] 0x000000070000-0x0000000a0000 : "opensbi"
[    1.127679] 0x0000000a0000-0x000000800000 : "uboot"

These partitions can be tested using the mtd command.
Or simply view the contents of these partitions:
~ # hexdump -C /dev/mtd0

Thanks,
Chukun
