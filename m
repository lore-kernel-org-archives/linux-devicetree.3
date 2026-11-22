Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369120;
	b=xkpEg5XmquYr5OMahf0Nmo/lLGHuoBcy6ybKSb7siq2wYTtvWf+4f6LioxuEhFAdHxc2
	 9NK+byvkLcvJpH5NArbnScokOr1/ae/vio3+bOI7yproc+3rZuOwo5fzDwAJnmjUrS5pU
	 UWErU8qxrZbine5UJhPro2dQ7HgKcjwRGYyitERz45Z02QHjSSs+NX5IkzCPuWR2f/bR2
	 vFmPSSJ8m+iD4KNub8PWwHfJA51Mx8eQgZicvRRGNqg5VFEksNczjLJEQ1ynT6GJpc+9Q
	 wjtPRC4aKCtmU8uSlvWMSto0CHqZwbD5m7IxBnwKEVJigl3A69k1LD98OP+ci6JtUwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0I/gkzCqyaCNd3bzstkk5KNSlHR8/A+NpuninLCCHoY=;
	b=C4URFfc9Mc102QTPT7n0y7dHwx6vu06sVmMLBln0+ld1Gq6qgJgX9BVzRTSv5kZp6nYD
	 2yUl8XsKMdZ5kmeAeJGRN4CUN4uWjQozxYbV52VnLycL1mvk5M3Uw+Y8HhtHs3MgTeHu4
	 MG55N6VRvfn2oUDw1DaTEV0mlhGylLQExGzkT2qGQy4BPjMUAKyRjnH4A6908mHG9Z9q5
	 K1qCbY4aLJPEE4wpXFJW75UIhl9vpIMUbV4x1TjkHHOZg8IAyzMUjovQ+FxWHCIM84oyZ
	 jylTJUHZhIyYSP7LXkGuL7WFP4CJ+2TwMi4/bPdylJzRAm0jNEWrReB5AUashNHoRqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uTMAQXaT;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B5D606A32A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 17:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60B5D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uTMAQXaT
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso3173037c88.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795369119; x=1795973919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0I/gkzCqyaCNd3bzstkk5KNSlHR8/A+NpuninLCCHoY=;
        b=uTMAQXaT040U5qUmYkbdA83OsJ/0S5t9wAC5tjeAWCn0h2wQisMy5QeDH3JXAr4Bit
         VHjz5EbSlUprj4CXB3uxyNJeZsu79WgaX4QM5LzfUHbeGchJXBAwfuXMyh16hVY/Ra4f
         azRRfe+uiZAsccUDkqJw1F8o+f/hhg7t65J+yj1JfY3MXgKdoMqqXLCB6EX0mbQwe+Cb
         WFzQo0cstg5P0ZPRBWg8TLbrTNA7IZpDvS1VR42ZtT7h/a361ukZtSn619G0eMZOjxGv
         21v0Lb56DfgHW4ncixWGXVhE1wkVT8S1fA+g9kzLPK5yli+d2inTNL7OfKTsNzBuGMGF
         cJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369119; x=1795973919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0I/gkzCqyaCNd3bzstkk5KNSlHR8/A+NpuninLCCHoY=;
        b=NAYwIPBvpq6eEey/Z+httnVVrpNOqHU357RBiQsqxIZ/ec3EbdFoniT5txku2Vnyn6
         HPJiKAhJWTZRFojW198kG1a/gQ73SuEZXihfN2NoOCSOGawlhw/xhqBGQV10jqy8Pyka
         j+voiZD1eYhyHBKp+Sgtsb5EcJB4Gaq/VMQ5mWXb+Yt3+ieTJqPstOJzevMmFzmzzfc9
         xGNd3bH+B45HHMBYlADLTruH4OJelOC9XpPuJgBJyZNNTWG5yzx8Z9Bo7c97pWSskxj5
         vlS5NngdAbHd2yCDgVC1PW2kGJh9Y3DuFh1mkZJbCWoXRgNj0R61EGpHdBh4tbHOiE3D
         cR4A==
X-Forwarded-Encrypted: i=1; AL+hErF4Ql6vKndTGfIL9Ti6b6F+jKs1UV/wQ6eiaUlQznZEYY2HWGBJqq3fIe2aS916yjyR9xMNCrqeNvxO@vger.kernel.org
X-Gm-Message-State: APuU4Z+79kDvVD2vVksXdB2iN0HCA3IgmFkNU6cZ7KKW9Ic9zwGyPJK9
	WywUHy/5zzZxt3WSggDrK3hYrUU9Pv2PXA4G1zi+3T8zwBavnSachK5t
X-Gm-Gg: AZFdTZcKy91JB33ynPfVIpYwNQmB27TXphkfRDZdYhYpHpAU3XQpashU6o0+R/bj+eC
	sif4H0jj/g3PHMoJ1nwt0nICYZOrNqkgNATlThhw+Lbq6/ewG00kjlMaWvgQ4xDs57RFzvL6Yt3
	cMP4Vyoh/vod08uL0ONZECg21BZJ689Q33QGDjr4oFQJud5F5VCfMzaMD59f+5pA8671KSoy/zJ
	UlRf8LepTeGPmi05x8Dv26uJLv+oMlNGWBvxWI8bQTxqVzGjdcQTs3o5waxgmIl5y1LU3J6otJ7
	ctb4zMcNJv16vkxTNPCFsNtAPcYIRA68uWZ7gNB3JtYO7VFYsZBYnlfjYV4bzXl5Viirn721Y4e
	1dJkP9KLdATuDvP2coc/wyT0hq6zjvfPfoLzvh4p5faJ1lb4ZnSXhBDQlFwQceMB4vUGHxuPNPv
	jWfG78j/+AgImuAmU7EdIa1yo1Sso23fHODu+1MmxdYzNKxNCe8Y33c3J/euDUsWHaK/v2WXiYV
	vVPslyhwao/XotQjmGQrf3asaYX3EYdXn2NbroIUjL59GXlUSSI82xVj1afioklId5Tf6tRQbYm
	4ajxpuZyaXFKwVSDh3jej8STdOxTprcERzq4+vW7aVcc6cyVXA==
X-Received: by 2002:a05:7300:430a:b0:379:7bb6:9c4b with SMTP id 5a478bee46e88-385717083eamr12238447eec.39.1795369119433;
        Sun, 22 Nov 2026 09:38:39 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm29097985eec.12.2026.11.22.09.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:38:38 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	me@ziyao.cc,
	aurelien@aurel32.net,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH v3 0/3] Add read-only SpacemiT K3 eFuse support
Date: Mon, 23 Nov 2026 01:38:07 +0800
Message-ID: <20261122173810.2409146-1-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series adds read-only NVMEM access to bank 0 and bank 7 of the
SpacemiT K3 eFuse controller. These banks contain temperature calibration
parameters and other configuration data.

Tested on a SpacemiT K3 COM260 Kit. Both banks returned the same data
across repeated reads and five unbind/rebind cycles. Reads from the other
banks returned zeros. With the separate K3 thermal series applied, all
seven temperature channels resumed reporting after each rebind.

Changes in v3:
- Use an exclusive, managed reset and assert it on detach or a subsequent
  probe failure.
- Use a 512-byte NVMEM space with bank 0 at 0x000 and bank 7 at 0x0e0;
  cover the other banks with keepouts.
- Update the binding and DT calibration cell offsets to 0x1c and 0xea.
- Clarify the shadow reload names and remove the incorrect reset comment.
- Drop Conor's Acked-by from the binding patch after changing the NVMEM
  address layout.

v2: https://lore.kernel.org/all/20261116075423.1519438-1-duge1256@gmail.com/

Changes in v2:
- Trigger a shadow reload before polling FUSE_READY; fail probe on timeout.
- Enable the clock only while accessing hardware and leave the shared
  reset deasserted on teardown.
- Explain why the root key and SSK registers are excluded.
- Use an aligned __le32 cache instead of put_unaligned_le32().
- Drop unnecessary Kconfig dependencies and the bootloader initialization
  requirement.
- Use devm_platform_ioremap_resource() and align the register definitions.
- Enable the eFuse node by default in k3.dtsi.
- Add Conor's Acked-by to the binding patch.

v1: https://lore.kernel.org/all/20261106060525.346873-1-duge1256@gmail.com/

Jiayu Du (3):
  dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
  nvmem: Add read-only SpacemiT K3 eFuse support
  riscv: dts: spacemit: Add K3 eFuse and temperature trim cells

 .../bindings/nvmem/spacemit,k3-efuse.yaml     |  63 ++++++
 MAINTAINERS                                   |   6 +
 arch/riscv/boot/dts/spacemit/k3.dtsi          |  23 ++
 drivers/nvmem/Kconfig                         |  11 +
 drivers/nvmem/Makefile                        |   1 +
 drivers/nvmem/spacemit-k3-efuse.c             | 205 ++++++++++++++++++
 6 files changed, 309 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
 create mode 100644 drivers/nvmem/spacemit-k3-efuse.c


base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
-- 
2.43.0

