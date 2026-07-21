Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA2D47F2D5
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628682; cv=none; b=Cdiy1lLGOprpoTBwcg6vhNKXq3TfAS5GN/0mmGmGHhsmCneD73GDKUeb88Z+xz/PNHVfZqvIARaiNecBFxvVGeOzG4U802jmOOr8NoNDi7grVW+4ImyelimlcHcTh5kRwxYjeRssujr9vmgBqV9GbTz/vji7ypftfFZuy4+Lpuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628682; c=relaxed/simple;
	bh=ZRKdbf4Dq1PCBc6VUndi+/kgDHv6ev1d+6/PG4zmJAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOK3XuNDLL7+jljZEHCs3ZkIyrPX6mdtoO/CXFyRAk3/66OBp6X371sDpdR6rz7/4VWohAaB7koFDlNKReEHsKQ1ZfMNnqbIhoHZEYvUfrfxHakeB/7KGl+bevQ4gX8B9ZhzUBTEHlDaaJR9sNwk6I6ifT7D8mQLBv7c29P/GnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sssf1utu; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sssf1utu"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f7444576cso1539958f8f.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 03:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628677; x=1785233477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7vsNly9Dxng/eQA268CICSe8sI1SJ/lZVaGeKmkMRps=;
        b=Sssf1utuC6WJafcUXkvwCuAY/Hl3PtCZH6w/lqP4Alpe6SXmv/d9s3jV0n7sdf9GpK
         JmbiPOBKQw0uWIPjdSYLN3cQtwpYQe05+O83g51obASHduNEjeTgHtKc5UxrXTuhf59U
         Llto/UOhxNxDt/sWB4CRmfoC1tUIIrhRQYKaA8apaTi8r2vKqXSAIaHxsrQB1QkVzFHQ
         ogAR+B375mM87occ2sdCl8G+1IUxRGO0eIrsPZI0ytekQlrRrlMVwKawmz4EMx4mxyyL
         E/I/Pkaqa+11wBrpkVlS561p3lbd25YAzAswx3PXngtiBRpgZjuwpCBB4W006fjXYGxY
         2TLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628677; x=1785233477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7vsNly9Dxng/eQA268CICSe8sI1SJ/lZVaGeKmkMRps=;
        b=IoLQ+fhr8GrkYl/WghRSM7N733ZqKTbeGloWS+bT7voW0FFkXmen1qe7t67NBF3PLM
         +JxIh9LykB3H5vU/KMn3uRgVkJwhfmPY6Eo+V3+tdTbrHieWIfYFCb2PP7u8FFfS2Nfe
         WaEwEKFknExuYlujfMMsYSktWb1vMSDN/KLMcv51/WxiC0Izm/HIH4suRG1C4yJjlDqD
         n71aTROVPnSGc5jCzaOKl2uWPNXYiqHcDkKqLv3f6LlTzDMsNhQcP9JXk2oj7lXaDtz1
         /7+V1KEEbCCAQ5gPqO4jDqpYtjQONCBQoEAcHQyNZsI8ZRZrxhPNtgGTyN2RbCfmBOjl
         SDYA==
X-Gm-Message-State: AOJu0Yw3T8/ZUxFWQocuIb5+tMCXDl2+fWRIvW8aIcGdUDXA/4gCUSBD
	8ZkeLSzIsDgIyIW2jYkyNihLwB2IFY8caAbqyzQa2EJtmJ2jjzzZ7oQb
X-Gm-Gg: AfdE7cmATurmebI+gwU1jD02yOvoI/v5UDt0Hsdbfxkw2aaoipqbYFnNczuQArsD483
	Ele2cW+iTQ/2CZWoe2c+zcsAtf9fBev/FlpG1cXe/nBmU0MWCW/iNoWm1tOkc+AIJ8DF3VZwu9/
	be2sZ5Tgc+atPoLxMWEQlOG2j3u2eg/y+o4hVpKjvGOrA6ioGNag1NjRsaehwILZYglOtwDaYjZ
	Nc7TEVO1JJ5oRpKVXdnERQ498eirD/Z+gZ0aKnhJIr6IWR/Q/lDrMXi3CXPzNkATDNSgj7I1+g1
	NOv1uMOnV1zknZ3wsxWFO9m5+1yStrwhAN+tRKkc4O2hbsDqEn503zIr47wRKUoVBJjhaN4z41V
	+vxiHtOx8ygGfiUrvV9gqcfaIlYuXf5hQf7EeQWg//VE8cMD9T3YoT96Z7IuyRdBoyeXlEo8gnn
	ygfFnboLxY9eu3MyRO3eKmlXovZTlnRxyLIQ==
X-Received: by 2002:a05:600c:45d3:b0:495:503f:cf9a with SMTP id 5b1f17b1804b1-495503fd2a0mr142245615e9.9.1784628677148;
        Tue, 21 Jul 2026 03:11:17 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956547319dsm57127085e9.5.2026.07.21.03.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:11:16 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/10] ARM: tegra: tf701t: Fix BCM43341 WiFi/BT chip configuration
Date: Tue, 21 Jul 2026 13:10:56 +0300
Message-ID: <20260721101059.451699-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721101059.451699-1-clamor95@gmail.com>
References: <20260721101059.451699-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop reset GPIO from bluetooth part. Add lpo clock to both WiFi and
bluetooth nodes. Add 'brcm,bcm43340-fmac' as primary compatible and
'brcm,bcm4329-fmac' remains as fallback.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 3de5c84d5f009..b71a02b3fd86f 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1300,8 +1300,9 @@ bluetooth {
 			compatible = "brcm,bcm4334-bt";
 			max-speed = <4000000>;
 
-			clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
-			clock-names = "txco";
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>,
+				 <&palmas_clk32k>;
+			clock-names = "txco", "lpo";
 
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(U, 6) IRQ_TYPE_EDGE_RISING>;
@@ -1309,7 +1310,6 @@ bluetooth {
 
 			device-wakeup-gpios = <&gpio TEGRA_GPIO(EE, 1) GPIO_ACTIVE_HIGH>;
 			shutdown-gpios = <&gpio TEGRA_GPIO(Q, 7) GPIO_ACTIVE_HIGH>;
-			reset-gpios = <&gpio TEGRA_GPIO(Q, 6) GPIO_ACTIVE_LOW>;
 
 			vbat-supply = <&vdd_3v3_com>;
 			vddio-supply = <&vdd_1v8_vio>;
@@ -1450,7 +1450,7 @@ palmas_gpio: gpio {
 				#gpio-cells = <2>;
 			};
 
-			palmas_clk32kg@0 {
+			palmas_clk32k: palmas_clk32kg@0 {
 				compatible = "ti,palmas-clk32kg";
 				#clock-cells = <0>;
 			};
@@ -2382,9 +2382,12 @@ mmc@78000000 {
 		vqmmc-supply = <&vdd_1v8_vio>;
 
 		wifi@1 {
-			compatible = "brcm,bcm4329-fmac";
+			compatible = "brcm,bcm43340-fmac", "brcm,bcm4329-fmac";
 			reg = <1>;
 
+			clocks = <&palmas_clk32k>;
+			clock-names = "lpo";
+
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(U, 5) IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "host-wake";
-- 
2.53.0

