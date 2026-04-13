Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AAF3932CB
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065215; cv=none; b=gVfkemrKMi3LOFzzbCGPviLkUsdTv7u8QOysvCN3vuOsU59Wp55/DI1lBN6fCtu4/85ghbqmURoya9KBzEQy6PNRVztEJrd5upj7UWadEZH5dJSLVG7NBj6vtRsNKv79ORkg+yl41HGWChwC/a41m5bYeZBVDNe1vCapK6pnUxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065215; c=relaxed/simple;
	bh=yPVLAlhkTA+kUGyF0dssolOKikJzb0AxKHREa9fEcLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qfz3fx36yckB3sefCEgWabmrmP8IkPoLwQVO59jbf9RFP2yAvXtmlPSSr5NuGtpXamVy4NYOb3Kodt/zdc7Bj0mHUQzyTZ7QxGQdAP8oSGXRy5bnP3Pm0jWRrv138QBTvpTj+uzaBRnTnBMAEmsvIZiIlPcV8cjhbY/6vKn+Ugc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=odlFGFgq; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="odlFGFgq"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d77f60944so413961f8f.3
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 00:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065213; x=1776670013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39t86zaG16kXe9hLAHIjg+gQj/3rkIeOmwWRfItDZnQ=;
        b=odlFGFgqBtKQ+GYHEMVyNZlJU+/ZAfGnsyDilHN6j35CLePn32/atvVXDrfuaFWS0Y
         ODRPVBH9VmsVZXXB/45fetful1G8R6EvlPAAvjIgELe1a/G362HfDqgbDVKL8OxJ5BNN
         c/o7rXE29CHg4FmD9qySldy9wmjgUaVBfbpvLSOlcd4L587i4rEK90Hdgceqvm3GZxdq
         wS/zCQTNUwszP0arCs1Xx8YvuuC2ejRW7MPIckRgF83teBlCd5kmVw3m/b4w6R8lykKz
         qaacgTzXO9U8plpA0v2Rpv/lE9EA86RbyVHhaF/dLCkJjnmKCDDgWqSS/JUAtt2ex4VG
         hF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065213; x=1776670013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=39t86zaG16kXe9hLAHIjg+gQj/3rkIeOmwWRfItDZnQ=;
        b=nFH3uH87I6l6N2Ol2xjthL8LT2MjWta3wwOROAC2OmwkRPRbKYjEvJW465GHHepoCF
         YBRkbSn8jrXEn9IGsccBJ266wknptx6/EiaqzKXg6O9xZ0Dx6nfU/M4HxjTrwgzgpmvt
         T/5FeOjOPlQyqtrf/HtvnXHwdu7JiiCwgbbTe47QWOcWEI9O1dpX53y8vXsCASdFUd7w
         JrFBtoBf0YqgQoH5C10zLnqYsjUSJG2ZpqisDKrS3peWQxhnC5q7CdGm1g4IV1h0GztY
         Jt+7DMNC5YNOHfOZpC7fJMYLFlpRObUa+TTCz3V+vvv3tns8VwyxvpJDwFgHEEZghLl6
         AuuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/EpVrPFRsyKnGIuB/XnOXo0sOLgBhOkvAXltM2LNEfmL1HmGIfiLxQr9y9R7S3p3ZUIdzARCq5BRub@vger.kernel.org
X-Gm-Message-State: AOJu0YxN83jSGWSYpTqvl2G/pcnHd9yf58i5ucTRjpROEq4NUrDPzNAi
	innmb7ZZzqMrK8+8BrorN+zvhwHOZh7BHCOXeS8pzMdDa7b1Jaj+IBp1
X-Gm-Gg: AeBDieuziDOB96FMOQ7Z9LHzjQeHRigDEZ7OFUb94drv/zxYna0lg1K+vCJVF+hdlrM
	YmIwQGQdtH0zN/LfkaxutqYMRQWiUtU93ICgIo94h3e/69oU8hY9G3tk30thGYcp/V8ivZWX21r
	FV7HprCVBIef2b4x6e2O+toD70HHuM+Le9hN+QSGCSJS8yYRqzsEnV728RIhTZiBZVshDoxOyV6
	yuvIGDyDxOICj85Wb5GoGgGnzURkUNa21QAevgVwK7dHEq8KGfBq2amfHIF+526cu8xAoh8Tqvp
	NNs3zCA1YXtNEmbOU97K+Xk751jFdhveVDjAYPMX9Mwf95ZCNR18E7TU31NxgPjJrDuuyy2nVnt
	gZT3gwi7Q6G15IpjBU04gKKBofupfZ3X8aaMTBlTtPNU8nudMjg/3A9U2+UhOj7CogLVY4qad0o
	1B0ad8MBmaLSc0BQHr1JrbHB/ebjUaM3aFu4vLhnQU79aRLUhsWv7ycQ37vd7O7fKQuvBKU7Zjf
	Ko=
X-Received: by 2002:a05:6000:2586:b0:43d:1c7a:8b59 with SMTP id ffacd0b85a97d-43d642ea4c9mr17192774f8f.40.1776065212404;
        Mon, 13 Apr 2026 00:26:52 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7d5812dcsm340817f8f.32.2026.04.13.00.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:26:52 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v7 8/9] riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes
Date: Mon, 13 Apr 2026 09:24:50 +0200
Message-ID: <20260413-orangepi-sd-card-uhs-v7-8-16650f49c022@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
Content-Transfer-Encoding: 8bit

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Suggested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5790d927b93d..a7d88564630f 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -220,7 +220,7 @@ buck3_1v8: buck3 {
 				regulator-always-on;
 			};
 
-			buck4 {
+			buck4: buck4 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-ramp-delay = <5000>;
@@ -241,7 +241,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -367,3 +367,23 @@ hub_3_0: hub@2 {
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+	broken-cd;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.53.0

