Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11256526AB0
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064109; cv=none; b=Vstt9IPSKNmZhAbd5EXuFQXOzoVKSLbRLf3rP2YIqdGOLlWn4vIrxN2VvunUtl0lNbg6hNGe9RgHB2wposo9wSe4i7z9WR6lur61r+JI9TRh6d1d+BgcBRxfx4ZDvrdsWhPYzJJevjrjwFJdpOhvzoDft1uwmHS3lSIRq4c9ew8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064109; c=relaxed/simple;
	bh=bbyeP03gBPHvNx+YpSbids6Ib61D9Tlgwed4YbVP+I8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b3zpVemZuWwxdAwD/zHVfL247G1+tgHrswkWUQIZAs9ETy+zvFsWmr8mbsQiV6g+KGGdzGBqtns624sQo+AkptjCik/GdsKFulPKozK5p4P9Z7ubSSr6KuK3pMsdZHA4MBXJOUXXb+cW9pOVSJknIF3HHkBiCltICt/8ZaJnc6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhla/AT2; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhla/AT2"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e82ea30faso2294965e9.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064095; x=1790668895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C/lMPPdyVDY8UDcv/G9hmnqUs4LxNskElZuOnfztMlQ=;
        b=dhla/AT2tMVXZWvnnkIAEbrVq8aMTS59v0WcUwEAWajKrjdMM0wIghac5M+bFqD1Bc
         OJ4+nMOmI3daeW4hV9YOATuNVdPNNCZTbJOPV8NANwxV2d9u1Lrx6ba/v8ntObHcLYRi
         YyvcVBalRB3e5SHp6og9VXCwUEZRbkpMClfVOCE+O7HeJHV9qTS1paa5Xv9VEqW6eILB
         RhHQeyzfVIcFPY42rwhvcqDI/UX4x9Jx70gn1kNFLQ1AWbNxXJ0QNuu38R7KXi+PgI06
         SvWkcyP8aum0nNnqxp1fZuD+E9Uu5l2DPxKt1nP9pMwmOyuTdTkdtFzhcJcEE+KuWdCE
         oDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064095; x=1790668895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C/lMPPdyVDY8UDcv/G9hmnqUs4LxNskElZuOnfztMlQ=;
        b=VLdRRBrnmSr7yv6RrDhJMcCiZ+W2ydhqCXu6/0b5B6onPGG63fEkoMrnpG76q8QZLI
         ZiuCC9ssJHC2hUA6fJF1qoGV/NBvz4LorHBd2iNVkuHs+egSpZFWNwVX6/O3Uc+aJTtI
         LmHbe6xKhmYPHfpTe75w/AeqYNMx2VfAx9kMjeOKyh6RWbx2em9CquRrK1F4YgrbYWtC
         DJ8YX1SwJn+zV19+1pr5sf2yNXqBdvKriI8ukDawSY8VkiXFMlKVuZL6GJbH2fKTCbiD
         cCN8Rso+bjiiu6o8kf/8oEW4QkWddXUyREBXXviS0eW/vBYMcPmMF6pSNZ1TM5pul2Xq
         2uWQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+uKdOj2q5eGYVxi/Eg34tMRkKgWPIszFL/hUTQ1gjFjWbRcEmwU7MukRIhj9jdZQBwWefLoY3h8p0@vger.kernel.org
X-Gm-Message-State: AFuF++nQGnF+j4DiRjsOmpjJm9sN1w7ip1gkAMJ0pynt5EpSCxgxPihn
	zEPbRfjLdJLBZaXHgNQTqH9e89Tkyd0QC8d3rJE0YMBumGISqTD0dTyf
X-Gm-Gg: AYBFou2KMazgr8WlUMn9rglAEhfZJLeytGN+Bitw32h8quHQcF6014MCeAX+GRAaylp
	ffalaLVYeXkJnQMz+6o8JwrTC1OPiq8NjHwXrE+RZO4YOSdGlTjENJ+vLdFGe6Sj2FPy7c2GeS6
	KXbz26wNtvWFnxYYBHNhJrP+E4od2P7sBz0rx+eby8iLjdUfL7h5jiOVQsxXjWQ79xwsm5PcbsD
	+I1YVzvORdxMVfJc3yhhlyaNQPLd2P3gHma9rbVf69Q7No3q4D1CTe5J08ejJq9w6ZPcv0PqPHX
	wCpVNeeWFoNqNc3WICp4Vapb5isiG8CRESSedpjVwH5hqmLFGTecbyTi0guHWDPeBVd8ZyPVGLi
	byzC2StFUADoSo5tPF3snqkBXTv6ZhRh0sFcDqYw9AOeGPKwt7K98ogznR7JWT65Kb3S2bL4Taj
	YrxGwENuErHCZRohH+DdGRr8LgXWsD2WLyE+RSqHPizu/0xxH7Y9pRiCkMB069H6ZgbKJdXiIJp
	38RsIJNTwszsFh/goxKBcpwwajqAeM4Y3V2nXAv2y0KAzKpN3zpoUV4my1nXUzeabwg6juBhjGd
	1G7i6AIjmrs62Q==
X-Received: by 2002:a05:600c:354e:b0:49e:479b:c13b with SMTP id 5b1f17b1804b1-49fc7dff668mr165633455e9.1.1790064095154;
        Tue, 22 Sep 2026 01:01:35 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B80530056971C6280202175.dsl.pool.telekom.hu. [2001:4c4e:1b80:5300:5697:1c62:8020:2175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaf97e2sm18248625e9.2.2026.09.22.01.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:01:34 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v2 07/11] arm64: dts: rockchip: rk3588: add an OPP table for the NPU
Date: Tue, 22 Sep 2026 10:01:10 +0200
Message-ID: <20260922080114.44662-8-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922080114.44662-1-royalnet026@gmail.com>
References: <20260922080114.44662-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NPU compute clock is driven by the firmware, which only accepts one of
the rates in its own PVTPLL table: 300, 400, 500, 600, 700, 800, 900 and
1000 MHz through the PVTPLL, plus 200 MHz off GPLL. Anything else comes
back as SCMI_INVALID_PARAMETERS, and that refusal never reaches the caller:
the clock framework does not look at what the clock's set_rate returns, so
clk_set_rate() reports success and the clock stays where it was. The table
therefore has to name those rates exactly rather than describe a range.

200 MHz is included even though the vendor table stops at 300, because
mainline pins the cores there with assigned-clock-rates, the firmware's
table names 200 MHz exactly, on its GPLL path, and that is the rate the
NPU boots and idles at. Its voltage is the same 700 mV the vendor uses for
300 MHz, so it is conservative.

The voltages are the vendor's, and the upper half of the table matches the
GPU table in this file step for step: 700 MHz at 700 mV, 800 at 750, 900 at
800, 1000 at 850. There is no PVTM or binning here, for the same reason the
GPU table has none: mainline uses conservative worst-case voltages instead
of per-chip nvmem data.

The table is marked opp-shared and referenced from all three cores. They
have one clock and one supply between them and cannot be scaled
independently, and that is what opp-shared describes: one table for one
clock, the way a CPU cluster shares its table.

The full SoC range is described rather than a per-board subset, so that a
board which cannot cool the upper rates drops them in its own .dts with a
/delete-node/ on the OPP it does not want. A board may only delete OPPs
that way, never invent intermediate ones: a rate that is not in the
firmware's table is refused by the firmware, but the kernel never learns
of it, so an invented OPP would be refused while the kernel went on
reporting it as set.

rk3588j.dtsi does not include this file; it carries its own derated tables
for the CPU clusters and the GPU, and it gets no NPU table here. That is
deliberate. The J part is rated lower than the rates in this table and none
of it can be measured on the hardware this was written on, so inventing a
derated NPU table would be guessing. Its NPU node stays disabled, so
nothing binds and the cooling map added later in this series is simply
never resolved.

The same rates and voltages were arrived at independently by Nicolas
Dufresne in a proof of concept that was never posted to the list; his
version differs in that it marks 200 MHz as opp-suspend and drops the
assigned-clock-rates pins.
Link: https://gitlab.collabora.com/nicolas/linux/-/commits/rock5b-npu-poc-4

Assisted-by: LLM checkpatch dtbs_check
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
v2:
- opp-shared, and the table referenced from all three cores (Nicolas).
- The opp-suspend paragraph is gone. In the v1 thread I said v2 would
  argue that the driver already puts the device back at its boot rate;
  that is again driver behaviour used as a devicetree argument, which is
  what Nicolas objected to, so I am not making it. Whether opp-suspend
  at 200 MHz describes the hardware is a question for the DT
  maintainers, in the cover letter.
- "give a driver nowhere to return to" is gone for the same reason.
- The paragraph on the table being inert until the driver patch is
  gone (Nicolas).
- New: the firmware's refusal of a rate is not reported back through the
  clock framework. Found by reading clk_change_rate() in drivers/clk/clk.c
  after a test that requested a rate outside the table.

 arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi | 54 ++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
index b5d630d2c879f..59ecaef5101da 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
@@ -151,6 +151,48 @@ opp-1000000000 {
 			opp-microvolt = <850000 850000 850000>;
 		};
 	};
+
+	npu_opp_table: opp-table-npu {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <700000 700000 850000>;
+		};
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <700000 700000 850000>;
+		};
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <700000 700000 850000>;
+		};
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <700000 700000 850000>;
+		};
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <700000 700000 850000>;
+		};
+		opp-700000000 {
+			opp-hz = /bits/ 64 <700000000>;
+			opp-microvolt = <700000 700000 850000>;
+		};
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <750000 750000 850000>;
+		};
+		opp-900000000 {
+			opp-hz = /bits/ 64 <900000000>;
+			opp-microvolt = <800000 800000 850000>;
+		};
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <850000 850000 850000>;
+		};
+	};
 };
 
 &cpu_b0 {
@@ -188,3 +230,15 @@ &cpu_l3 {
 &gpu {
 	operating-points-v2 = <&gpu_opp_table>;
 };
+
+&rknn_core_0 {
+	operating-points-v2 = <&npu_opp_table>;
+};
+
+&rknn_core_1 {
+	operating-points-v2 = <&npu_opp_table>;
+};
+
+&rknn_core_2 {
+	operating-points-v2 = <&npu_opp_table>;
+};
-- 
2.43.0

