Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572371;
	b=y5wV4RDEwzUkSeWI7fg0f01qtxVJ7HIcHLJRMYbn+5mVkPQWfkQwjy4t8d+yykKD7Ngt
	 JE3uoWXRAe/oBpflzyZ4ntA/GIMudJBV4L94dVmcckrY1wAkVln6VBGxfId7+cjxkdeYL
	 84ZPjxEqkyMaN4S97o05N6BDVznoJZIoDe6GYoo2HnqTMeq24NYqqoW9OYGouizfR0JL7
	 LOdCGUQqe4GPo5EqY3OQof17oZAlTintUI7+iS751c1TTGtek9DhCAspEyD9GbEdfx+4r
	 QDWEkcpx45VFidKxji7CmVJKIwMkgh/r775YYj3blZZxz0kOogKixfn2WdH/ubQ7AhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cYjE70VK9dQOuYVSDX1vCeqjSSE/jR55HkQy4/7ye/I=;
	b=sCfFR1iIR04DTfxOpA1Nbrmg9kMM3AYBAjCUtv+/ofqy4Auda3oY3Wsmq21gb/NcdvEp
	 e0hHLEQwKMTRkJkgZqNKnJzthZKeMDey/u8LNzbcc4ZMcDxN5KlTqK5NZiT6Oi30RL8VH
	 zBEyzF6hC6kCu9KH+gwuVVkFtWnqDfdGhGb6rYpNspKD+rP/A8wNngAgmR7uOt/zTW3cc
	 aLaVK0G5sN1JSZWZqXpbj+AaYKfEEOVhLmghCy8zsvNGN53FQ1H20GYg4ome+y3gF9WEj
	 1Z+McJxXaUQ2C4bS8f/x4/MLDdtphb8LE/VF5K+eFqdqWio07xmlUOGIKxS5zRkW2Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L+TEqmEQ;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABA3606A32C
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ABA3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L+TEqmEQ
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a070b3f44aso153592b3a.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 01:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792572370; x=1793177170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYjE70VK9dQOuYVSDX1vCeqjSSE/jR55HkQy4/7ye/I=;
        b=L+TEqmEQlPVsZuo1fkvPl++sMPQwiPUJII2p1B+u3s4pc9VFskc6MpsD09l8NXlJtT
         LdCsasMDuloH36mlimuT9VkfVrLxn9XSoIVYJ70sIeYz+N0Lg+vsqg6Xg12fNgNliz4P
         irrSbM0J13u675IX4EncRuJ11PnbjOgxOOBTnoPN6LugVKvqv+24OJRN0zmFAoxZ+kzx
         WD9xlw+Ovp8BwBXDRPWcED3vMn0s/irMPnCx2noc0t2Uo3UdnotNF5Om65iUY8X0idXD
         2SrKmRmRrrBaN6eiMv5f1d+CUKzP4+yIBmDbfKLlLS3QAwnpCzgloSL4ox2crMlE1N7+
         4ITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572370; x=1793177170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYjE70VK9dQOuYVSDX1vCeqjSSE/jR55HkQy4/7ye/I=;
        b=fWKhJmM9r8aa3Dx8VCbQBHmNHFvJj+JXxkih9uDGOq+Kr6LTRrDtoPsGXJSfNr+7GU
         27ulAFD6H8Ay82uP5lrndrlCmYMK9VnifAWfppA9qP5DuUadaNvfYAs42kIfTvu739s4
         roSlnT4GFVhVjO39SSTXFdjRxe4+2Qan1tfYEIGLF8JSFg3Y8uFeXtVxep0UehTF0dh3
         ZzRn2zfBU4IBR9Kq0jm37SuEnSa9ctY//os56V3uTlXn6uOky5qkMsKdJ8iKjXPhy38P
         0wJ1OLwzFRUZ9mn/0C3DNwpk8mCMHWSwMAig938mu405w+PdIPIEepMLB6lTYBbQDu8w
         KX7w==
X-Forwarded-Encrypted: i=1; AKwUvBx5LEwO5gJMzoV9YpGmqQrTtU3EmuJc8kia08DkwWqW8IQvz/vb4GKu3EcXH+ezCGoN9wYRyw3gdXSe@vger.kernel.org
X-Gm-Message-State: AFq9FYJxRiqxX8Uxz/LeBq9LrmAybhcDjvmS4EG5NYP5ZwkVVfQBVG0k
	oBgV/vjfcZKK3MF82UA9bqkCTi9iPXG9SpQxNEk1eRFBcO3nb3pzY6re
X-Gm-Gg: AYBFou38vfEz0TDcbSRb8aGEOACzCKOIw6nRyAU+n6cWtglrQW2l3rEWUNucPTpHfj/
	F4JEPC4MbnTXsvVTYRkXsGqJewxZ7TBOu2vbQRyznVGxCoxVpDK/3V2fi6MBg1mPRlq6epZ074e
	vvnzxlx6zYmqnwvGesNirFKWhI6ebJocmZZPHPwXEcfkw6aSP8r6vC7JAnqiP8+LrVYYadqvYN3
	tXhKc9X5+HU7bOYsNJn6QylYMVw6nJ8K/9NkMmyvjTo1beMWjsF1atSVEwwWX462MKQFf3xA1nM
	Xsh1xm1lUegapQ6sie/xOLhpZMcbyn3CJ6b/TrL3JokA52BBTNUYcv+UWvTS1WdSlyQIl02BA/x
	+mqYjTBM31CUhJO+Ytwj6RlDv7Ly7qX2zS4GOEqxUILht88BTynGZQVfSv+qhTRVBVWa8mz3iGR
	8TPVKZSWoSc8tbmcFme2f4lkjmvwqZOqP07RebrwCftYpxrT324FkFSgAUTstUpEV/LA298ynux
	MQ/gfj95l3f3H6kfzyxpdkqrPzIKS/pR6mmKFpCPm0FfMXduOCGXtYhfRzueiMY0QCjjO8N9fyI
	zAn2dSM=
X-Received: by 2002:aa7:8887:0:b0:89f:129a:9590 with SMTP id d2e1a72fcca58-8a089ebacf3mr1029844b3a.48.1792572369847;
        Wed, 21 Oct 2026 01:46:09 -0700 (PDT)
Received: from FLK-B04Q314.global.tektronix.net ([87.58.102.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895c08c8sm604998b3a.25.2026.10.21.01.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:46:09 -0700 (PDT)
From: Krzysztof Kaszubski <sympthicode@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alice Guo <alice.guo@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kaszubski <simpthicode@gmail.com>
Subject: [PATCH] ARM: dts: imx7ulp: add "tpm6" pwm node to i.MX7ULP
Date: Wed, 21 Oct 2026 10:45:59 +0200
Message-ID: <20261021084602.121087-1-sympthicode@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Krzysztof Kaszubski <simpthicode@gmail.com>

Add the Low Power Timer/Pulse Width Modulation Module 6 (TPM6)
node to the i.MX 7ULP device tree.

TPM6 is located in the Application Domain (Cortex-A7) at base
address 0x40a10000. This enables PWM and timer support for
peripherals connected to this domain, such as display backlight
controllers.

Signed-off-by: Krzysztof Kaszubski <simpthicode@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
index 39e37ae9b2b1..f5ec5e9d65de 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
@@ -216,6 +216,16 @@ tpm5: tpm@40260000 {
 			clock-names = "ipg", "per";
 		};
 
+		tpm6: pwm@40a10000 {
+			compatible = "fsl,imx7ulp-pwm";
+			reg = <0x40a10000 0x1000>;
+			assigned-clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
+			assigned-clock-parents = <&scg1 IMX7ULP_CLK_SOSC_BUS_CLK>;
+			clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		usbotg1: usb@40330000 {
 			compatible = "fsl,imx7ulp-usb", "fsl,imx6ul-usb", "fsl,imx27-usb";
 			reg = <0x40330000 0x200>;
-- 
2.43.0

