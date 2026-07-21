Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3861360EDB
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640898; cv=none; b=P9IAUJOrlL3ac8ojd94b3slJurglVJqfXAZsc+9/H9CEeKwoDH1IRbNO9KKw0Dvh7JCe4ON82E9/tcHASTgWUuSHSNuLymaLfkprAfBxC0mXgKJduQHliRPvgLiefA91ByapEeknX/c+tcMxB/iS7D2pBAy5T4bNP/+EQcrnpr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640898; c=relaxed/simple;
	bh=Le0pS+wSaAuopO75giTF+/8Fe89fTHJBxjd48DNeawo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jqxTPxe+6t9O4ZQ9eUUGAYKGb4HJs1CFvSp+fhXa9HKhUpYgwTkpjhLPXskxcg8jVjoA7Kz43CoHIJ25LJiQB6VF1GvT2QGtSWhyNj8GsIrQQCjaEmCSFCziq2RPOKHziFl3Uc4lI43+K0vmqESd2uQv8LOCCKB/6Nwh5k2znmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/LjtTwb; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/LjtTwb"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-96944741eaeso2800397241.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784640895; x=1785245695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BIe2hT1tS/hkONRpAbeJmIad5iezlCwLptmTsdS8/DQ=;
        b=j/LjtTwbdhP+b5B9bUcHC0LipFKCY7Xft/brTsjTQYUzROE3CwTqpv2TyeEFnuxl6u
         z403CteeqCMevKw6CICFf/rH3PcpNG1Xti8R8DmMRbOXt5iGs32cjYrzQG76x4c1gwuT
         S93Z8uCg7X0alN5ZARXJ6SMJJB1jyaIftrNhmmjHZ/PQIfyme9s024umBfRZjClTCILD
         n0NfrROkECy/PCDJ1cxJlmI9MfyDUTnVnqizBeBbnJ+ebBOLTkkVQdOeQvBPRver4yC8
         kEBUc2QF4/i/egWbNHtwWnUjbTMgkYejZgXoVOkkeaFp5Q9KV9PDHHVBC0bMhLYDjzga
         ZCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640895; x=1785245695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIe2hT1tS/hkONRpAbeJmIad5iezlCwLptmTsdS8/DQ=;
        b=EII6Tfyu5hddDi872XnRrplqKO0bM9BFW9DzxRgYbi+r3MTcIlgh63ilfcWF7aIW82
         fOy0O3cFWAt/tlOpISAawoaDawV2i7CP5TIztjdUJOoyQ9r9WUc580mliAr6oJrypoFO
         lEVUgCjTo+ZcuMFevwk6eCGMbhGMpTN5JqWYnYUFexasYWe4cyx8Sw2Hs8qkJhKn0LWn
         /MssDiNBpFj593TiQl94zAswWdYqdZvPrdsSrvcz5lohaX4PLr9X5qI9uRftv7HnNExS
         oa+8rnP0GLv1rYiJtJ0WomuGLLRKpRuQhljccjbBgpT2xSmA4k4FVsMBdld/zhlqxpky
         +DIw==
X-Forwarded-Encrypted: i=1; AHgh+RrpoF9j56owKh+aDZT+wlsZXbnSDhtXIi7mmQ0o/fYuGw1UvdGsuppq0tr6OqS10XpIWv/3fqf8VOpd@vger.kernel.org
X-Gm-Message-State: AOJu0YwQYNWjDr1euRqPx+qevbzNqSDEoRYbeZFCJdDqD7q5ayGHfEro
	q9Dlq7oBPoR0nEhKrUu8bDbpdFvf5ywk656Zd6Jdhh3Wfd5pK1B+wdAo
X-Gm-Gg: AR+sD10uO9cOYbNLQiOoCMx0FRUSQa/7gobHiP1aRcW7SSoCPnMIHcvB30h/glfu51B
	ni1js9LBlbDbPMUC1ASiOQhG/slaKZZwsxILA0dPXJsMbZpGSTezY/fmtkHZ1meFGFUKeFpnHxn
	wwNDO8VOPLvwPrToUNql6z3T1tutFbx7Dzq4BdcSG5qD9FmVWKyvTbDc+a/XILUiX5Y5JwA6qu3
	Die0ImIcw3isePyuDC3+k+092YfQVf+eMlSMM5rXFDkCDFlThRr0FiKylrMOGRO5tuoj7GJz3Av
	BS1Hw+3gjF8HZYLLlspJyxROV1kULHPV2nOlJGwR/zTQQn2ckl1j76Lc4/5NTtXIahozT3gdjSg
	SeiYCuB0RgnHyK0GCwsgHZLIoobuhsmLvXx0Wuln2T6IdGUs2iD44ZLS6tH/yoQ0C8gpkIysh1L
	kj3QEZ3hMGafoQMkeF/pOvA2/HX/Sw11mSJRMqdlcGsLWHPt8U5GxQZJfZEilG
X-Received: by 2002:a05:6102:3e13:b0:738:be73:55e9 with SMTP id ada2fe7eead31-747534dcb84mr5275283137.12.1784640895443;
        Tue, 21 Jul 2026 06:34:55 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:a24:fdfe:648c:2808:d17c])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-74757fad06csm11851362137.4.2026.07.21.06.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:34:55 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Fix Gru WLAN sideband interrupt
Date: Tue, 21 Jul 2026 10:34:45 -0300
Message-ID: <20260721133445.44283-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Marvell WLAN host wake interrupt is wired to GPIO0 8 and is not
one of the PCI INTx interrupts. The PCI device schema therefore
interprets the two-cell GPIO interrupt specifier as an invalid PCI
interrupt and reports dtbs_check warnings:

pcie@0,0: wifi@0,0:interrupts:0:0: 8 is not one of [1, 2, 3, 4]
pcie@0,0: wifi@0,0:interrupts:0: [8, 8] is too long

Describe the sideband interrupt with interrupts-extended, which
explicitly carries the interrupt controller and removes the ambiguity.

Fixes: 48f4d9796d99 ("arm64: dts: rockchip: add Gru/Kevin DTS")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
index 3f3cb0eb5809..5435fbc27095 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
@@ -505,8 +505,7 @@ &pci_rootport {
 	mvl_wifi: wifi@0,0 {
 		compatible = "pci1b4b,2b42";
 		reg = <0x0000 0x0 0x0 0x0 0x0>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio0 8 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&wlan_host_wake_l>;
 		wakeup-source;
-- 
2.43.0

