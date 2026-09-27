Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C7039E177
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 02:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477817; cv=none; b=dP/HDv8hPKTC6ciYD0b32C7Z/J4I72tCqRuNC2yS2eonOF3oTq0zKjfBU3iMD6Z28wW9RbMP6NF7XvKv6vd3kwFo9Tfa1/r2UrpCbZPrgJJM8T9Xflndc1vHZd0YIfN1/zQwFiR4qJ0KDde0Er43GB2mAQXVonObwYo5lre9Wtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477817; c=relaxed/simple;
	bh=JLLY8202AFqPiR7IQZMFqT+Np/Pbs4qmrHh6nwqETJ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Oy9zHUdl3blBJXyhhdu8v3CHDAnYaR6sn4LosSZfU0WTDl435edmnDtCZgQFf8nB1kRwaj0EVQtnZnpuz/HpZkzoa/qJUn1O7+MGcX9haGPBjAjqKRB6rhXxJrd2e47kxmh4feoW1Q9FFl47rksUqeTBsgYBZzXmWPWEhrmRM4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=yoKSfm/1; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="yoKSfm/1"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ec6188so8740945ad.3
        for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 19:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790477815; x=1791082615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zx161GO4leyejnwa92HDTsrJTQOft6nH8qorocIvjzU=;
        b=yoKSfm/15VtXpMM9+BHs8gsYgRdp7fwEG7DGqYNixRewKAmjD+qpvwSmp0EN7Imgkd
         oY3BYVDjMuvkHdv3wVGcCYa1eLytphX1iofvzCFLTe6/xXEBzItwgUbIYD6vwGiTKQvH
         YsflVsgNZD4ccxI0buRouR+CCUQscg4+bkUJqfwSfemJY4SAQnSId+Ao8TKWQFz+TYx/
         SPDvXZTvanTWMeaKDza11K4VFayIFhUtvnDrO4OQY6ik3vjL1Yqgwt6ccQgDidztCsL0
         GYr7N9KVBlSh5/msOduPrHWiBT/w7z072H/4wkcAq6co32A0ghbZwKj14oxSbgajNfXO
         nJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477815; x=1791082615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zx161GO4leyejnwa92HDTsrJTQOft6nH8qorocIvjzU=;
        b=fknWjMYPdkPdwrNCD1ZSAsPN27ubwKwh47WHMJmz60+zRGJwF5j2FxiLDWiE77Szqp
         edtbORI6PDupKj+3j4XoNqnmumN1MQ7/cVrn7wzA/2C4RExaN8c3soKy07qqn+1buzQh
         cvzm5VVWXeEpV4gGpvEFKaPCDsgT8Fq2iT7BnMijPZrDb/VbUi1+aUFv7uZ0TJiZwz4B
         T9XkO+hiH0jkfx4WMXOfu6Bd+TLMOPD7ofAQC5f3ZFaSU/PqeCs0cKqngELhjo5fcKyo
         YKuA77YJubMZMrZd/nMUGT5RRWkWuDnB8y3zpaW1KdBRF+hPRFDBzHTkwhQ09bpPI3FY
         f6yg==
X-Forwarded-Encrypted: i=1; AKwUvBy81LpUiSfBtHc9EPGzfuHfFuaWudgVufKel6nd3jCRjytbLT17zJCxXNch4npmMy+VNE8d7D0XbAKZ@vger.kernel.org
X-Gm-Message-State: AFq9FYIoxUf/dD+/tGUgoAnYOtyBr94PCLEOnKCyNJzuD5ul6hZYOBVy
	AoKWu7PmHbO3asbS3sgxTZtOILKn6sW7HivF7BeEg8mJocMC85Rbt9HcWdxPjTDgmktW
X-Gm-Gg: AYBFou0GwR0wQc33/mZeqaeQ0eblVRUNyV5fy2sKrgrEeujkNNKplj7p1xrVSsqonQt
	ygVaxrZ7ISyRcIUxvGpQYwBo/MzX8p/VZvvt5RdUDSqqVyrkdNYcRBPlADVsYbxMj4ddCjXeq3j
	1SMTMg3Q2qEp2M9WLNxUNv4p/+YrgzhcWIRfgkWH8Zexc7vOTCejzNIOumTv18322zYtc8qjQXy
	eMW4wqZHzTbD3AsqYyi4rtFaGn1sunRhD2vxcJnB5ZFlasaC+hAgVok8S68ELFO4bJX6S7FmKcs
	oCcyHhF2p/gyxaTmHh0FdLbgF+l8rEGkGZAL16cA91EB+tVJZVOkQWJtAlfA+PvEirIIdlcWAdg
	psI/P66hKw84IrwQmqq6C7lHHc31ulIExi651uElxiyPcjg9xm7n8aWAS0MwFs6DWFDG7uy0P8m
	URMQN/mjUt4QXMT5x3mM93PcqHkL7sYUvAIVXsM8BlC4/Ma73RPnnMTvUDelVgKiCzEx85w/W+p
	KNX
X-Received: by 2002:a17:903:984:b0:2dd:c100:4246 with SMTP id d9443c01a7336-2df7e13c585mr80615525ad.42.1790477814644;
        Sat, 26 Sep 2026 19:56:54 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bfd4sm25512285ad.52.2026.09.26.19.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:56:52 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Bastian Germann <bage@debian.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tien.nguyenminh@embeddedlinux.blog
Subject: [PATCH 3/3] riscv: dts: allwinner: d1-t113: Add the hardware spinlock
Date: Sun, 27 Sep 2026 09:56:26 +0700
Message-Id: <20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the hardware spinlock of the D1 and T113. It goes in
sunxi-d1-t113.dtsi rather than sunxi-d1s-t113.dtsi, as the D1s manual
has no spinlock in its memory map.

Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
index 3b077dc086..228cc5c074 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
@@ -11,5 +11,14 @@ dsp_wdt: watchdog@1700400 {
 			clock-names = "hosc", "losc";
 			status = "reserved";
 		};
+
+		hwlock: hwlock@3005000 {
+			compatible = "allwinner,sun20i-d1-hwspinlock",
+				     "allwinner,sun6i-a31-hwspinlock";
+			reg = <0x3005000 0x1000>;
+			clocks = <&ccu CLK_BUS_SPINLOCK>;
+			resets = <&ccu RST_BUS_SPINLOCK>;
+			#hwlock-cells = <1>;
+		};
 	};
 };
-- 
2.34.1

