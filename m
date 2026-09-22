Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65C45275BC
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064124; cv=none; b=dzkvbUxy4AByCAbJYMTpg6U/WSfJrhZbxtoVR4V42al3N+adRdPmSNssYI7VqnWwiI3kvmoP72RJ8My67ruTJWDcF9DlspzI8nkRZvydvp1RYK/aDyRTg0hz36FozM8KOXnL8xOCJAUnkpP+IELyZjXcASLS7eLuEYjI7qevUlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064124; c=relaxed/simple;
	bh=8caMejK8hgruIPCiytRhmYLDcurgxrGWdTVCVpsRw0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBWyJ+Cu7u9NJsSl04mhrlPDx4UtrVjs0Q2o7OXkQ8PyCaa1IvnP5a/cC3iRjDJNifSK6pxhmDm7Wu439NkPuSNgswNrImWCJSiOeQDtD3qeO4aa1hqCFJHgWRcvut/usL0TiUxmiVi0ACxrl4rdz0YICqxxYg6gdgm+Ce+wpdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qf+nY3bJ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qf+nY3bJ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d0726cdbcso2018185e9.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064101; x=1790668901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k8SSEreitnBFuEXQj3F3dce2S1yQFmhptrw7zyYrACU=;
        b=qf+nY3bJ0l4kr1VWLZG7cczDhzi0I0pbqnIGx0g2Ca16CelTZIS3wgyAlHU7Q3ZF+T
         l3GyoPioQCGr4o+Ymi5fe+rwTJUIcf0pxEbt0dm3UrHYNiQ2Efu4KEEtsfpadkOj5WKu
         PD0UrdqVCAcrqyYHOLqoODqlg6q1UUw1ysOVm0QCwDu2eqtaUEhU3a8OYqlKEmlf2p4l
         pLZf/ZLXsvoGHP+OHJKWCI5v60PbFo/olg49RqIdQcQaezuKKnii/GtCGtgEK850S1Iu
         4gZ9nvv+RcYzjfPYilp3D6iyRufxOlOSvym9fKuTyrAF3r5f7CYQMePOTWFYjnYTLam9
         vOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064101; x=1790668901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k8SSEreitnBFuEXQj3F3dce2S1yQFmhptrw7zyYrACU=;
        b=QImqT4lOE9dSRu0YrtYvvrqmJpjNDlfPZS5Qcu2BDlMBsYZbaAagSuioQYD6+vO4/7
         Qm2QImTaB3bRgE3JgW8mhHm0WJKd9r7hoadze5vLGVFA/MNdae9vji+eEfqBdNKIP6GN
         74BGfzz50o/Eujq3H2LrWKxgfYFzRdOY5JxM8Y7HX446NXM34z4//xJ5p4rX9y778y2V
         +VvO3LUCE76N6nMH0BmahpbISQYenDkuXNgcUb+fEY18W3w/XXpHktuz8VFXAOO92Xvz
         f1rGkUDQ+ufLOoP3GCkopmBNSz6dRv+NYm7CkofKVkvqSunVIlcP13KswSDvybh02rbc
         ZJAg==
X-Forwarded-Encrypted: i=1; AKwUvBwXdfI5OR4ioKlXjnVCv/jyuhJ9Y3nu7V9VqC4EXufYl5DTcBMlABMd/XyNQnIPDUwiBWn1P+UgyaXl@vger.kernel.org
X-Gm-Message-State: AFuF++lO4D1CpEl1BDalGamzsXif0nCUx1DHY1IOGC754Ggm62H+qZ8z
	DKWM6O5Q4V9cmYa/y7mPqF243+UL6ruZTx9jRSXeJncBppevNnPuWTb0
X-Gm-Gg: AYBFou3A29+wMeBJ4BgTcVyHVuLGDjslXIZOUsi5CoCJPF24q17YZPFGyeHwQEEyTsh
	KrSFNVTqFT2mX6M/slZX0Fw4QfreWzqMAXyXGOKMLI6VWCzTcD3vfIv4hDBT0hIrh29DLYTdKji
	7GNM1KwVspYNxuajztTcFTwdAo/KdJdrVqXEqDIcmpsfrMTK2vGrPGUfZuZ00yqoTIgtppavH8d
	F5iz+NLXo2Si37HRQQLf/1AaY9PtUKS00Kwlk8aC0+AKuHcTRhQQShCxXXsVALY+OCukYO6GDup
	m/hxox4iweNPT93cgasMonwOUhFJP3I2IyeIDr08LWSTwF8EzAVVG5QE/PVq/+14x40r/mVnDOU
	B5nL8qvul29kIZExPT1HsNudCJjo07jj3/Wht4sffK0vD8czpCd6GPsjykhmYm4oXMArDIpb3LA
	x01pqtoJQjOQEnmxY80SovVzQE9cLv8tXzINXu4ReJtPOp9htPWGQmDe6rW36WnF1nx4yKkt7BK
	WXTm+vrjiOYD4cvWVLg49XzsyUP4UDEpK0DJ10I+3bvQRl9kk7yxaZRj5ySssOCGYwRH0wxkJxI
	toA=
X-Received: by 2002:a05:600c:6992:b0:49b:9241:7ff0 with SMTP id 5b1f17b1804b1-49fc7b7a756mr226941795e9.0.1790064100738;
        Tue, 22 Sep 2026 01:01:40 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B80530056971C6280202175.dsl.pool.telekom.hu. [2001:4c4e:1b80:5300:5697:1c62:8020:2175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaf97e2sm18248625e9.2.2026.09.22.01.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:01:40 -0700 (PDT)
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
Subject: [PATCH v2 11/11] arm64: dts: rockchip: rk3588: add passive cooling to the NPU thermal zone
Date: Tue, 22 Sep 2026 10:01:14 +0200
Message-ID: <20260922080114.44662-12-royalnet026@gmail.com>
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

The NPU zone has had only a critical trip at 115 degrees, which is a
shutdown and not a cooling policy. Now that the NPU can be throttled by
capping its clock, give the zone a passive trip and a cooling map, in the
same shape and at the same temperatures as the GPU zone right above it:
85 degrees with 2 degrees of hysteresis, and a 100 ms passive polling
delay.

The #cooling-cells property goes on rknn_core_0, the first of the three
core nodes, as the one node that stands for the shared clock as a cooling
device. The other two cores have no clock of their own and cannot be
throttled independently of it.

The cooling map is inert until the driver registers a cooling device:
thermal_of_should_bind() only resolves a map entry once a matching cdev
appears, so this patch on its own changes nothing but the trip point. On a
board that leaves the NPU disabled the passive trip has no cooling device
to act on and only changes the polling rate above 85 degrees, as the GPU
zone's trip already does on a board without the GPU.

The thermal path itself has not been exercised on the board this was
written on. Reaching 85 degrees on an NPU workload with the fan curve here
has not been possible, so what is verified is that the zone parses and
binds, not that throttling engages at temperature.

Assisted-by: LLM checkpatch dtbs_check
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
v2: commit message only: wording for the shared table, and a sentence
on boards that leave the NPU disabled. The diff is unchanged.

 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 376ad04e07869..c3d22b08f415b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1162,6 +1162,7 @@ rknn_core_0: npu@fdab0000 {
 		clock-names = "aclk", "hclk", "npu", "pclk";
 		assigned-clocks = <&scmi_clk SCMI_CLK_NPU>;
 		assigned-clock-rates = <200000000>;
+		#cooling-cells = <2>;
 		resets = <&cru SRST_A_RKNN0>, <&cru SRST_H_RKNN0>;
 		reset-names = "srst_a", "srst_h";
 		power-domains = <&power RK3588_PD_NPUTOP>;
@@ -3212,17 +3213,31 @@ map0 {
 		};
 
 		npu_thermal: npu-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <100>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsadc 6>;
 
 			trips {
+				npu_alert: npu-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				npu_crit: npu-crit {
 					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&npu_alert>;
+					cooling-device =
+						<&rknn_core_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 	};
 
-- 
2.43.0

