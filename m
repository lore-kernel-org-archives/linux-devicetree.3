Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1327E366075
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 11:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497886; cv=none; b=Euc6esk1s6Bwyy46TcrnPVi946PcIHxX8eb5ZIVcAGC5V8eIm3MJYgonygvIxADmG8bpBZkPbTErY1NhGQo0QaYoHiKMNUsIYinILyXOh5qw3XlCMyTHhl3bPNnx0YBW+1GcBnhTZaH/QPxCE/2EqwK52T0Q+YJX37zqXUEXTiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497886; c=relaxed/simple;
	bh=wf5+F3IJ7PHN/4gxwWfDTlalBjHbtHC1YY7hC84qZII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qX60VIKKrAsK3diaxv3K5t5wb4hIo1tYs5a+9xn8qRXigebD7Rlcuf3L93k+Qwssa7ItwJNTO0Laa9QL2HGkqSsv84Icem3GKU9cA+Sc9gduOYYDi91GcDDZjcLzP/TfXXwQpoAxLwvkiOFawTBmrn8g5p+f+VnAHU0eiSxVmp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2CkroAh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2CkroAh"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso48604375e9.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 04:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778497884; x=1779102684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/ImowRCcqssAiG38GcpnppUO6MMYNPjG1Lujw+hqMY=;
        b=K2CkroAhC/ziyUvFkQNgHVFkH2wMP/c9rBU/5FaRMLUFrAOo06D0z6/Vfr0LoGEAFY
         mAceaEQ7Lf4btk+2b1ts33McXX6Jma2wYPvciDCfb/MlKiT9ykZjvYUf9vLfyu81vF1i
         tQhj5HgXAag4dG3K7Ur64sD2mqmoKHRnwJfTx3bMLjmTUFJk/1KjH1TGaGjytZh0JTdr
         CEmWMRvOyyfQcN2t5i5j/U6BsLMCqI8XkRW3QAbf13U6nPsTFFInpjwD0DILUIFgclWl
         M4kCuMkbn+XnaMCIWmgOWgYQMXaPT8MUzT6LWM0ER9zlZj5liOHMYfou4/iAw7zYKNQn
         Lnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497884; x=1779102684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P/ImowRCcqssAiG38GcpnppUO6MMYNPjG1Lujw+hqMY=;
        b=CpALvVwh0ofI80f3KFQZ108GEq3lXHV25X5n9sjjBZDahvfPgmlxYJcFA/mjnmJTwx
         SMFwMXCfMcIE6Y6FnAoVd/HkLdyCLGsTuRojDagVc6O8+tp0qe6M628EifyqLI8bKIO0
         sgh0keY5iyXdlGB/BhBgkxLdk9a7GFqk4LluouZRl0/3qFCoFTszUDqfn1z1PFtBYtsm
         HsD+OSXcDl+1JVhIkvYP6Ut09hDIDsuPKkcElfMCe4iTAN6zoAUH+JNW/8svWWa6+jjh
         tePVEL/Wy85Djj55YZlSWJ7Joq02R6Wia3xFmEqnDs4jK6/g4E3Lls609ZQIMkX7bLA9
         W7TQ==
X-Gm-Message-State: AOJu0Yy4XHsIxrqIEgnouJbqZ8PpmdfXxVIeAPzINZgGgThhtKZGkAXz
	fptYFSRAOzeKK2NWT0VpjwsjR4IN6Qeick0vlrPEnOiWcy7fj1w8MUoY
X-Gm-Gg: Acq92OFBZcOjiwEI30JwXP0/sDD4QnjIi7MixP3Rd4MrVGmexqJT5hXhK23ymj2KidS
	72OQzHiq5UFM2SJKCZ7DB+2O607sjEFMGNFMnAi7l9khY+e+cWklEfyb1y+rU4tXIbXKH3eeUUy
	Kh3BBhRA7PdlNZWWxbviUT9925G3RKaTkHaelEGyMY1cl1xZVYgeahg/Q+GX/QwevxFgMYR6NIK
	yBud39ttNUzj2Tf5Ce3Lsq3bW4Dd40aQa0e26gA06wKOXUB9i1f3O3L4TV82vPc0uo39EMEJjhN
	iIohoUuCw4HKiNb+n7tt2Iv6WG9QT+DuUBRDnS/wZgtVlwp4GVZKigNjvGyyiBm8c9oThsppcgO
	QZIVV7J15MsZtXc/vyOqOUDpeMpTSLvII3rxye1xdJVhNtqo7sPRgahSzGbD+FI6YKgnTjUeODm
	ohEdvb9DtJuanuVa081d7hZKqDois4Hoxnz/uke8KSAdGw0PnfQ0kB4SCro7I0nGhe5PTzr388w
	tFi
X-Received: by 2002:a05:600c:a305:b0:48a:5970:2005 with SMTP id 5b1f17b1804b1-48e51e08362mr251837475e9.2.1778497883359;
        Mon, 11 May 2026 04:11:23 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e9585sm175077375e9.5.2026.05.11.04.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:11:22 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
Date: Mon, 11 May 2026 13:11:10 +0200
Message-ID: <20260511111116.1109643-4-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511111116.1109643-1-a.heider@gmail.com>
References: <20260511111116.1109643-1-a.heider@gmail.com>
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
index 79415d760f162..7ebace0e46edb 100644
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

