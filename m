Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588193;
	b=iaj162xscw9b0nJPcd17da3k7btzwlURbmNEl0HfSukngenp9VbFTvt0MkSqcCPuHr4k
	 HX1HZPPyKwZ3j4GFyTfUACuAPW5lrRrYJR+ze9oayUef6rxPn5hw280IRUkrVx6nYv4rD
	 DfkCgrejhZGetRr+02zCOWjazRRn+kxioyzBR9zZpaizHS+WjVUWkXequVGF/SAFtRBSf
	 bPUIlDbRNThLtEcDYquc+a4cL4S6LJn/Dh7hiFJkxa+eQrM2Smy+8BLmsvAn4a+yYoAAZ
	 +GaHaI7ocPE+LX2q0puB6Jf/2hyhcT0ZtgtmlBf2LnmiX7etOIK45cd1I/bR7cT8EOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=3p1f8Yec85jLXGY1wQELmw04hKpnMA5OmY/Vm2aQaMI=;
	b=Kk0Tm3hOp/ZlZPazN2+u7ZZ3irHN03HsFUIB50EuwxmM3DrEWSAndYVyFmtelN6SfcxE
	 Kxu0mTzNfM7zMNa7RZSZMs86543UkmQUG/O1yYtdMGfOjE3dKfxtv4cI9yBVgSYG5QFCd
	 FZLWKwBGFP9Sat8MlExy4UpOVMybxxXWIEhnlGO1pLj2ckz6BpV+igr7rDnbUr9HRHQOH
	 3Ssx/xB0oyzbJht2R8Zm0Y9VhoicBGxQIAoOLcK4B0ddOyvTsXw4cZb7SbFi4a2f3NlfT
	 9R6bD0BZhN/DBRzAOI3gNDg2ypE4hSiHm0Gg1itMScL//GdYQSFH8UK3rMdtJTNe4bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gl5mRAc+;
	arc=none smtp.remote-ip=209.85.210.65
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9DA606D5E1
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 16:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE9DA606D5E1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gl5mRAc+
Received: by mail-ot1-f65.google.com with SMTP id 46e09a7af769-84e513877a3so1866155a34.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794588192; x=1795192992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3p1f8Yec85jLXGY1wQELmw04hKpnMA5OmY/Vm2aQaMI=;
        b=gl5mRAc+Q87yIw3FA7INlu9F67qDStwak1WRRCFyGImlP1tanQWXnyQlcGJLv2T0V0
         YY692v+CGbD7myx/t6zAZocLSAJz94JuctGdQ6xWyr1G3CJZvm6WCs7omRUCusgJud1m
         4wMf8WEa8u5w4xFPZ47nZYr75vDoO1pS9Vl5dDuqqR0JOOPUm+CjiniRiTH7/EYqFbXi
         xT9/k0C0EKHnVXD/cqBQ7KwJkAHwtyj4o899oz0M/1pmGyNvlqDSuBmwAJGjpTRnlA6z
         rN7RA8tkRrM/E1FBYQS6xXFELcysgByZ5xb6FUNDnMDO4jkeQ+2u91L3ti8q0qZ1i8Iq
         VV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588192; x=1795192992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3p1f8Yec85jLXGY1wQELmw04hKpnMA5OmY/Vm2aQaMI=;
        b=sFSsWc1EzON62vNALBcKk+Q1wtkCXcyKtoMjXM8GB2oRnI1b1AsDqy9KHUlBn43uUF
         +pVhcRGcHN0ojxNKI/hKoRxxCvwsNHEkQzbMJnEhskG7llPrtdFd/ukhld4os3O9MzKm
         tqsvr5rDV2Um3qxTcuaX1skHVODKPr3MVXnZVFoXfLAG+aLG/Fsjgc8NN+dsagxFySBs
         atmYwcfxr8GzACFVdBI6rdS40ZRUZv88yfjGm4FBcR7O28WGtpNUC80rpK4FqtFfp8dy
         iQIhGqozzQx38pWb+E2rrgWypEnGYgu0V+EdlVR2QV6gh1Fvx1h3a1rGFQvXDLZIhacE
         mWQw==
X-Gm-Message-State: APuU4Z8XLuNaE3xO82BDqG83d4PHVicl2iWbwXaKKj87QyNwhQDhVtd+
	jISYrdLgeuXK+bUJmCjYRQLsutgX812UoCynSifngkFK2B8kRrgEbqRt
X-Gm-Gg: AYBFou2eXfDc6Cb9m8M2AQsh7F04wcp5A9Rd/519GrThlZVC4RykdGF6Q76wNxp2Ity
	KO6vMjaiPGQWoSena1FciAOjRklxCpVRWfBx6ZG+TYxyHFPbNlfbqJb6MF2gWAtkwgBCNg2OCIs
	5NzXWoAVKJ5sWk/nxdVBLq2SSU7OuYz13JtBx0Cwe8/zguUZ71G72y63/X00onl5dRR85tQKjs9
	E3+8W+jLqVIyigZfuBeSAp8g9z97yjhsHHGknW3ANyLHvPA+IpV6JZrN/AF2Y0Y79mc91qW8TFJ
	9nnVb4UuKY91lnCUdQqXeyjxLLFDexrpJvCIhY/C3keSmQ4N9BSYs1Y9mvfNjFsKtxvgEjkSSdp
	PJer0LmI/zZW5SJo8IVMeQSZmOcghPEf7lFynNxrT2VqRqIMTCsBP+hsB+kEZ5VV0fckJNoriW4
	AGg+GJDASs+LPKq9lTrwAMvPQqSZgMiSQuig1P7IyIefPn9L48LZ+RGN99gv/GjZgiGQSlV9ToV
	iKHggPDKfRK9QM7UzUF5UNtp5V3TC0d9hQhfhisWRadLotTPa7CGwHjcQbi7lTmkfIkWctqcV4m
	u6zl4DuuwUy8gMiegibe5Ey0f4zs1BDp3BaK+v1OivryRFUQVqs7qtBHPY3z+a2/Xoah2cn7lUi
	woFmTWHpLfzRzsEIB7oE=
X-Received: by 2002:a05:6830:8545:10b0:861:befc:9b95 with SMTP id 46e09a7af769-861befc9e27mr1819572a34.26.1794588191654;
        Fri, 13 Nov 2026 08:43:11 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880e5148sm2712816a34.10.2026.11.13.08.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:43:11 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 13 Nov 2026 10:42:45 -0600
Subject: [PATCH v2 2/3] arm64: dts: mediatek: mt8173: Add the keypad
 controller
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-2-d3b8865fa50f@gmail.com>
References: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-0-d3b8865fa50f@gmail.com>
In-Reply-To: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-0-d3b8865fa50f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794588187; l=1040;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=XWTgqrmP7rORvhppkX5O4ecuuFFQiKCRGXT4o7Blnls=;
 b=p1V9+WfESnlytGo+yWLkayiutHu52hR6G9rdCc885GFv0kK/66QQx3BmStt3S4rQZBGGzCuSb
 N1MV6nuLbwiCY6FjGl8S0MX7B0dx1kTM+hKuPoR9KcdWLmYpg/fcM72
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The MT8173's keypad controller is register-compatible with the MT6779's.
Describe it, disabled, for boards to enable with their key map.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 2ecdea33672e..61261fe643ab 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -555,6 +555,16 @@ pwrap: pwrap@1000d000 {
 			clock-names = "spi", "wrap";
 		};
 
+		keyboard: keyboard@10010000 {
+			compatible = "mediatek,mt8173-keypad",
+				     "mediatek,mt6779-keypad";
+			reg = <0 0x10010000 0 0x1000>;
+			interrupts = <GIC_SPI 154 IRQ_TYPE_EDGE_FALLING>;
+			clocks = <&infracfg CLK_INFRA_KP>;
+			clock-names = "kpd";
+			status = "disabled";
+		};
+
 		cec: cec@10013000 {
 			compatible = "mediatek,mt8173-cec";
 			reg = <0 0x10013000 0 0xbc>;

-- 
2.56.0

