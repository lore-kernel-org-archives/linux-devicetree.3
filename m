Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B1639182A
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 08:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791017203; cv=none; b=QDdtXxZoOjnw9b2AjX7JEfAwsurfkuO3rRXqEOLsZ+r+oy+pqadtUgPPO1XxAhzCiftl+3Q3AWtQJy2baWamAn/q+C1TCZndB3npYaGbeh0ErfQzPzeJNmeO7VKvi1ykBGBHmo2MgtnuZUmcHNgYHBd2rmewbkuQdh6C7JVZ95Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791017203; c=relaxed/simple;
	bh=JfQBFB8HvJuf4fvwAODgo8KaNTpRE8MxypcQlOdr4a4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B+eNJsAWpoTM9hYrU2XeBFj2M5Xi+1IjCNrv/9vsjappqUJYzk2yIweKzmyxMODvCcPHrPuq1O+IMwDuJUQBBfkuISW1FYxTVEtU3JiXo9tx5ZPD6SW+WqLD04IannsFEoShFT+XhJSHolI6r5OT31U5aWQYoKeyyj3RmDK5hL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXn5nMU8; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXn5nMU8"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2e48eb8d967so626135ad.0
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 01:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791017199; x=1791621999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t/wrLOCtE1sCCWrIKRX05ezT6tc6dZyG9f7Xo2wQXRw=;
        b=ZXn5nMU8EamCVde3w00PG10bd2fGLZkka6sHhvORJ6Gb/Lo8TX/g6wJRBmZ6Kkgdup
         wnPMdKJ2m637ZG6DgnDfz5VSf9kb8mGMLEsqnbSTGzrMPoXgcW9ZZsrHbQkDm2Fnh7on
         JjySkgR712hT/k96x4+D6exNpB9XGrcLnSodDcC/ERxJzvzVbT54oqmEwBw94841bSVR
         P0HiWJ23CwnapFH2CNRxVAy9Bz8kvSNxze1W7tGHrtnC/0ODIvww7jZbvIVDJycZlWmW
         2Pxy39MfUH+kiJvArojOVMFk0ybKIIVxmZWTGEaqXR+mWQj0ilp7nk91zgwRGpdfCdtR
         7uZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791017199; x=1791621999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/wrLOCtE1sCCWrIKRX05ezT6tc6dZyG9f7Xo2wQXRw=;
        b=uWYvU6o+bE6FNfcJbf9KMKodsWWgoYcMvsz1NEhG28Z8sL5WFmdoAYdqbo7hOBr4Aj
         WjI9uFc/PXtuBHvnUWYXtH7syzXTBqSawf3TatNVoI3H2RXRBFl1zF3rLD43jWLF+s45
         teJnUv9QC7oIKNHqAOpu1Gg686YRddJdK/mYyMn+EGzu16xq6YyvJ8u1SINWlSw49EOF
         d3iK0W3C/YqCapxN92sUrNy/gOBDnRDjoHJI63n3YDw5O/EKLGoYRI4rGX006+5zPBwc
         1NxFmb9Q9+UEqpgcU9vJLYKhZ5ORyCULgrvyN/GEgjIwnvbbLk69Cmod56HMyNxvNEMZ
         +jVg==
X-Forwarded-Encrypted: i=1; AKwUvBysOlSNrGstrjkPwKA708Iuzr/zuRi4w52RadToil2960dvDLAQQ3R9RSjKPdp+ReN6mtQFhXdEqxBc@vger.kernel.org
X-Gm-Message-State: AFq9FYKWoyEe3wbuiHniGG1kRMehbmiirC2X2HcqdtoruT26JvqgHYDP
	/Zynt6sCrSr34MJVWoq7+tQrmnyB2anWn0rH25M+kZ5k7B2invFnlYup
X-Gm-Gg: AYBFou3nB8wgdbLHqTAqsKTtAV9hTiiZkQNVc1NpoU97Pf1qpORrAxVmRG8QPah75dK
	qG+Kk9/ra7W/5rSQrTiEEWXqOMNAbkiQeMto9QftWf6Fi0M17fJ3VnNkB7008dCxQtZLcVmIUHF
	sMPqwqiBbNuTALixa+kfTy2fl7HokU3GVrlld+qhVnrjjzlWibRgQQaryGvDqhxyxwjtoKtlaeR
	rXJZPpbf5Q+2I0vrcWG0CvcNV2x8a1X25e0o6D3ccvAoUTBV65A+U/bl7CafTqaf4Fl/3Pyrr/g
	8zhizcgZk6sh+Rl3wkMvznS1jY9cC270pz/7QC5pPViJvYImh5f5Azr2vP5pgO2TFGHrUhfoToX
	xF0R2wmDaVhbflanlWWfwTeqfYyXNp76jXPztaGviFC9o4wl11G3lzDeTK6Ur+1Y1DAQXcbY9jO
	YyQQe482AZ7taq1BgL5PbzH+FIxdWCyo+SioNALvG2EoX2LYa3iS0iLQDiUUmZYg/eW/+DoT2Ow
	+8dfXo1FJrDc2A6QEENefVqn/Ao+2yG4tvEdg+FD0gGbfAc5B1piBtD+NiOjW8Telj0eYc=
X-Received: by 2002:a17:90b:4ac3:b0:3a4:9d98:f980 with SMTP id 98e67ed59e1d1-3a6ce5eb2b0mr7077989a91.1.1791017199330;
        Sat, 03 Oct 2026 01:46:39 -0700 (PDT)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4664ebsm2208033a91.7.2026.10.03.01.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 01:46:38 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Hiago De Franco <hfranco@baylibre.com>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Joshua Milas <josh.milas@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 0/2] riscv: dts: sophgo: Milk-V Duo 256M ethernet support
Date: Sat,  3 Oct 2026 16:46:24 +0800
Message-ID: <20261003084627.353899-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Milk-V Duo 256M has no Ethernet connector of its own; the SG2002's
internal PHY is only usable through the optional USB & Ethernet IO
board. This series adds an overlay for that board and fixes the name of
the internal PHY node it exposes.

Changes in v2:
 - Enable Ethernet through an overlay instead of in the board
   devicetree, since without the IO board the pins may be used as GPIO
   (Inochi)
 - Send both patches in one thread (Inochi)
 - Test link-up and traffic on the IO board, which v1 could not
 - Collect Inochi's Reviewed-by on the PHY node name fix

The overlay has the same shape as Hiago's for the Milk-V Duo [1], so the
two boards stay consistent. The PHY node name fix is in cv180x.dtsi and
so covers that board as well.

Testing, with a kernel built from this branch:

 - sg2002-milkv-duo256m-eth.dtb: eth0 comes up at 100Mbps/Full, gets an
   address via DHCP and passes traffic
 - sg2002-milkv-duo256m.dtb: no eth0 is created, and the gmac node
   reads back as disabled
   
Kernel log with sg2002-milkv-duo256m-eth.dtb:

  [    1.426499] stmmaceth 4070000.ethernet: User ID: 0x10, Synopsys ID: 0x37
  [    1.426536] stmmaceth 4070000.ethernet: 	DWMAC1000
  [    6.052829] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
  [    8.138131] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx

  # ip addr show eth0
  2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP qlen 1000
      inet 192.168.0.47/24 brd 192.168.0.255 scope global dynamic noprefixroute eth0

With the base sg2002-milkv-duo256m.dtb:

  # ip addr show eth0
  ip: can't find device 'eth0'
  # cat /proc/device-tree/soc/ethernet@4070000/status
  disabled

iperf3 against a desktop on the same switch gives 94 Mbit/s with the
board sending and 70-74 Mbit/s with it receiving, with no
retransmissions either way. The receive side being slower is not a CPU
limit on the board; I have not looked into it further yet.

v1: https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
    https://lore.kernel.org/sophgo/20260803163427.74445-1-chenyou910331@gmail.com/

[1] https://lore.kernel.org/sophgo/20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com/

Chen-Yu Yeh (2):
  riscv: dts: sophgo: add Milk-V Duo 256M ethernet support overlay
  riscv: dts: sophgo: cv180x: Fix internal ephy node name

 arch/riscv/boot/dts/sophgo/Makefile             |  3 +++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi          |  2 +-
 .../dts/sophgo/sg2002-milkv-duo256m-eth.dtso    | 17 +++++++++++++++++
 3 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso

-- 
2.43.0

