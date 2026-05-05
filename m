Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E1235F196
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 16:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997192; cv=none; b=Xj8fr5/XUSqBHaqltMWrY66TVLsseY4vY3/RDx0Ib0ygJY4PPzj2lxsy3YW/OmVEfuQWzbMq8/u+g/B+Cs1rwg5sgKQK2nuqK5fpM2LuINU58Jk37JrQgBOYj6qoY/6q/HaH0kI5hUn1WaTEt4LQWxQoe3hQzbeUjBjj+BbAm+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997192; c=relaxed/simple;
	bh=8NaqPaBb1Xsn/l72cI102luEopF9fq/jYD/XsjUz8RQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TMbXZTJSpoq254/FYlB8fN5kr+RhSQwzX5HQAKLD7e1ydb4BOtmDM07fGb/NsDshPfXGBHOrTPpcL9JFBtcfa/Rl+I4W7AgpUNme7Kplj+Ujc158rk5eith8605ewZR2KPrA/iHFXCNFa3jDw94XbI51AUtZlMpDeTR3dp0YKbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbFX2NOU; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbFX2NOU"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-44da2de25f3so1672570f8f.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 09:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997190; x=1778601990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJ541EuMVQQ1n/T8Bd5ppQrgaJbp2dn8HqZE862Y/v4=;
        b=gbFX2NOUNzEDf8ZOwRuh3ZdB/nHdHRhxJ/vaDqmgddB6wjfNC8I9sYyM6f6j0d9S4b
         6FKRsUUBs2fH73zv6FKVTHlSUUXFyfrRadnRBzBrz48w/WXB7S3oc2Om0INDcVOlhDkg
         dqMkeKF/ZAQ53pAQKWCm01aqwE4Y1WUZyfaXVnn+VzAWJXx/IsvG1aV5+Bnq60evHayW
         L1QvfcO8uKgnib0E2eTQ6j2ag0h8xKHa3tghxUkod+7EUqV8VjVrNEP7hx8rIqAOjKaX
         bYiknYml8sxDRIoQWIL1H0h1IrdK0fXB5ayxTubMWP+xQaYbgXlj9+pAyokuvCWEAIHZ
         NK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997190; x=1778601990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DJ541EuMVQQ1n/T8Bd5ppQrgaJbp2dn8HqZE862Y/v4=;
        b=mMctAd6zmNmrnTing8mueCyXRBKuJbI2VkyQnvbZqtMI3BuEw4yzXRxlUtzrVWY+FZ
         D7W5RSs+LQZquy3ZZuKmLzk5nSstCKyFaVOQNQts1YyjMdhk8GM7lZFUia541DVOcLw0
         4V1GfxEefFyOZGixWSOQ56S6r/EqYHygpdOwvLKjEppRnFCJFE68yL596l7+1f64cfHk
         S0LHu0DbJpWHgl4ST9gJd31uvYSRTOABnjd8Q0YQMRCs1sN1pL5Lw6I/fmUkn0/bqmQ3
         xLSU/AGTUkl2whFmZeSHJHt0cdSoM24yQ3aXV0Bg06DERf/xESg8cxOaZUceK49XRlLP
         1I/A==
X-Gm-Message-State: AOJu0YzXofyYX0ZvAs22yxuNmWNx1GX/Ly/xz77HEamD95wNjlEe6iNU
	MiDSh0FswAD3kYLuoaNBYe2RC1ctaXAsk3H5ScNqKDvXGONT0XVD9biH
X-Gm-Gg: AeBDieu7hTMwsut7zBKiCSGSbF5dpSOki5sX77fz9XZLKwovKOI04xSYRiVz/2o0sXF
	5ub36B4m9NbD0GSI5ZMqIODHoa6mGRoOvKFCJbXaZpKZrpzSeAS39Yjd2knm26LkJImTVJcU/Oz
	7u1NZgzvoLdRNRW4QtTKRruowPfHUtWs8xTFmFEcOOPvjI3VXg0VysXX0IBJ24FxZNJaPkv4Xiy
	T/fz1gJp1AtBMdLidxfykPMIzX+bxef8J6HE5Bq44D4s2T29GOquPbMcwTp72OTAnf6RXz51EjF
	eLFIHZnIvt7EXb4OBwTiCYgwU173+lRxeDe4BMwqP5yl79TVD1SvIvNJrLEal/y5Efq71fd1ndI
	+iyTjUsxRK3IdRcRsDfrmwphmHVKVEAylnJ3FbjV7PerY1pqttb74Pzen2MUVKDfROz9RcaGFyu
	fP1kpsWbD+FZiJocqjmcFKgbmnzAp//sZnTS6jYJ2NXuE3ySGkLPMesr4VOllMrjEIuPBvrkg5V
	OhANs4=
X-Received: by 2002:a05:6000:2088:b0:44a:b931:f32a with SMTP id ffacd0b85a97d-44bb586d065mr25568540f8f.27.1777997189628;
        Tue, 05 May 2026 09:06:29 -0700 (PDT)
Received: from mamamia.internal (a89-182-137-143.net-htp.de. [89.182.137.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm5398891f8f.32.2026.05.05.09.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:06:29 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
Date: Tue,  5 May 2026 18:06:17 +0200
Message-ID: <20260505160623.1369347-4-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505160623.1369347-1-a.heider@gmail.com>
References: <20260505160623.1369347-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the QSPI controller node and describe the attached SPI NOR flash
(Winbond W25Q64FWSSAQ).

Add a corresponding vendor flash partition layout.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 43 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 8bb85b5ba1943..32599082b3c36 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -166,7 +166,7 @@ buck3_1v8: buck3 {
 				regulator-always-on;
 			};
 
-			buck4 {
+			buck4_3v3: buck4 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-ramp-delay = <5000>;
@@ -249,6 +249,47 @@ dldo7 {
 	};
 };
 
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_cfg>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <26500000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		vcc-supply = <&buck4_3v3>; /* QSPI_VCC1833 */
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootinfo@0 {
+				reg = <0x0 0x10000>;
+			};
+			private@10000 {
+				reg = <0x10000 0x10000>;
+			};
+			fsbl@20000 {
+				reg = <0x20000 0x40000>;
+			};
+			env@60000 {
+				reg = <0x60000 0x10000>;
+			};
+			opensbi@70000 {
+				reg = <0x70000 0x30000>;
+			};
+			uboot@a00000 {
+				reg = <0xa0000 0x760000>;
+			};
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	pinctrl-names = "default";
-- 
2.53.0

