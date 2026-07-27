Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D941F3F5BED
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 09:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145663; cv=none; b=lRWmcMD1lyMypAs6YrP8gugVbaeA6tzVEsTNMe9N9ZEZLOw27N0wwRorUvITaknCC+rLWQdQ9zhwOp0fTVBqZAIzHhFjX6F6E7N8tdZHLQ7xzU6o7DS0huFqhGa3YGOGp/QncYvkMd7VpW+Xo/CkyT+lfuo8uRHSIoqWeLduSVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145663; c=relaxed/simple;
	bh=QD3t63uWxKq2du3y4d4m9Juyuvd2MQBM+dVhxe550ao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VEfisCOv+wxLy2Uoz+3bm/KgJIrHJf7H4kny+C77wtG906/+92Ed/T+G3MwzhjsgmR+x96ZMNY9ZlgSWLlrkI93/Lpzx/kn/Q9TXFTSHh/ROUHJcC43tAS27A07x1G900JE+YLm3UNNbjjAZ37g/mIF1bkRp64YbUAlM4l1BLQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgPsQoMw; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgPsQoMw"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e88b60121so1934295a91.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 02:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145659; x=1785750459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jLPhM0E6IPzEl+l07UYYijZDLOCaVV9s+4+FtNKHwms=;
        b=CgPsQoMwbc82G+pjH1SF517qBznLi5ZmdlJPidwLBVOKZ1HDUPHX2craq7s91Ceb7V
         BPqiJayVj/KwCpzZG59UvJ/mDSlkSrr7FuSMfhWIa6LcCDbjeS3TCF53R5fcSzTwO4zt
         XKkdehkBCb8Xb6iOSn3mJ+0JHHOH68JPBJ0lnDgz2Sz/mZdsR0bpfb7zONRyMR0/gOc8
         7+S43VD6tEKlSTyQHThqVAqrNF3gPcvZwjLFgybSjTz8zAKT/RMMee4WAWB+6ePQVRDm
         yi5Bfj2J0ur1YY9Vq2dQaNToEk9C9mIwY5c8wCrlaEwM4IfVaMyxSNQMHAP9CI2Lhxbi
         7eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145659; x=1785750459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLPhM0E6IPzEl+l07UYYijZDLOCaVV9s+4+FtNKHwms=;
        b=FF8WJC6yi0y/1ZnGClGllSexnX1bySrQkJrVHlqqpRQvFh9Mjq2pMpEF9rVGWJ8RP5
         uubcyzTgUDgL4VlEu/bRFI9kJULRRQoqOx9uR8yWjbk8ZIeUP5RiiMASZwbAEyWz3Wd6
         N/h8NKGS11t4P9mOjrNfSIHjDZfPep8aiI3Fm0l73FolmHXxhmTrgVua8vKADKp0aqDs
         cTmREiAASkGELyT6kPx3jlJ+vyx/FuUkf/7/+5bxz0VS918UiFDbNW+UKokj3JBXWlQb
         VRPkqDv0MLxFCf6c/f8xWw6ScBAStmY3EqXZOd6MZM+lkcE2peD5zzZM4llOAZ6rI6uE
         rWoQ==
X-Forwarded-Encrypted: i=1; AHgh+RoWJ1ttXdfDBeul6sNigPMo7QbhJYdxnDJDSOPVUeVbT8xbPzqhN1t+A7PDMX/xa62B+KY+QjAz4CNn@vger.kernel.org
X-Gm-Message-State: AOJu0Yze29Uc2cOnZASAOFaLq1ZEwAyNWPlzfSbp3IaLnJ/zbPGIxdwn
	/Bbfgv7aS0HYA/bjSbfbFQeZeKoHH8Y+auSsQpTPQ841nAolqVPoeODT
X-Gm-Gg: AR+sD101cP6nBukEof+Wr3AbkbdtJUK1B88nlVdqQvq9FnRg8Vd+WVdZFGMck1/ovor
	yw3pK02JzPVvJg8gUO9LANIXiBB61nb5/vF9zY5N8+VCt/WoVYy9GOAwe86PfP+G/E31HMBnA+9
	l/h7/xShXoQKeNsmcWIOvjPiOYN2njxbK9vLJTYfrv6sudTKeourSWDOjyND2WjeJzdFPRVnaK5
	27FzdsREI7HwoU0bZK55L1IPod7e8O6QsGlS24zCHKur9chkXD2Au+ATKny/d4bCEGao1q5x295
	M3BUpqMRnB/gozc/RzWLzP/gWahACF1CUAuyan2fZ3g9OEiGS1PEFbi2FFXHyCR8iyevp6mBERA
	V+/hiDRjVaDsGJvBHUX4W+9ldpcdrfsPawyylyMjMznxLP5JIn+J5ThNbi897V/RIbhU/WJ7eLt
	EH
X-Received: by 2002:a17:90b:58ac:b0:38f:57f3:4dc6 with SMTP id 98e67ed59e1d1-38f57f34fd4mr1073921a91.21.1785145658748;
        Mon, 27 Jul 2026 02:47:38 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0eaa8sm4893167a91.8.2026.07.27.02.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:47:38 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/2] riscv: dts: spacemit: k3: Add USB/PCIe devices
Date: Mon, 27 Jul 2026 17:47:22 +0800
Message-ID: <20260727094726.890179-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DTS for series:
https://lore.kernel.org/linux-pci/20260709040027.958400-1-inochiama@gmail.com
https://lore.kernel.org/linux-phy/20260703021024.495433-1-inochiama@gmail.com

Changed from v1:
1. Fix clock of usb3d_u2phy.

Inochi Amaoto (2):
  riscv: dts: spacemit: k3: add USB controller and USB phy support
  riscv: dts: spacemit: k3: Add PCIe device node

 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  51 ++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  33 +++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 237 +++++++++++++++++++
 3 files changed, 321 insertions(+)

--
2.55.0

