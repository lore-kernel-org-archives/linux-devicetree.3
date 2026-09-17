Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F7A450407
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633636; cv=none; b=plqLTiGZYRGiJz5PQriCU+s/DmyjURjdujl+EnTDncDtQTxOJ4c7dXhF175mlE5NF2nsJQ5lfZqNZKVf5LPWiaFCcOL15rkHvQp5mU2WMwL0Ko1XVQOM6P0lzpgN92AIXUzCu6/KWgzLIFRJG0G8SyjZ0CGwo3iJPqabFN418ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633636; c=relaxed/simple;
	bh=DytvD9FZrUP2Shv4Tg+pb5PSuP+p3AjgJxqepBSLVOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dTuLQn4EmDXwa/Mi2f65g/NcVVBqFn5nXo05LcbkP+l1/+zZ76fnyOVyTLmNaI07+jopsWHkcTw7iQZ0WF7FHtCW+IQ+xMl7zqUzZRP+eWm0tAzbDxkyYDMPg/kvxLGJefanN8twRbGszCI1VHh4ZxY8JL7PJdXrsGAmLWpfBBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=mUDKU7Bn; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="mUDKU7Bn"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48449f62b93so179791f8f.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 01:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1789633614; x=1790238414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMkgBdb6Add+uH48UOWcPcDDnexiIDFVK5Cum+qocr8=;
        b=mUDKU7BnzgeCpsJXbxjkDhms900R8fQaYAIfZTBC/xekiDrngr37laiz2MYRRxkr2R
         mr7z4BESP8QMMe4N8rlZalL1GkY9asGY7G0SzAZpC9tmNPpz2zobX9fSbPZFAAxIHobZ
         +hHioAQO1nsLrbKCUzSn5Yr+VnIBw6n5PINFCUxes2+XXsYq0NVkFiFm33w3JIU84poP
         ea6TpxaDizviYOe+DiZt0gTsWLMOl0AgauqzgFIr3/Xuwfwr4wrKErOe+zr1fYm3nzG+
         28LcIQFmjB1xsoM+OazRVhbDxz9SizVWvFfG884CpPYAFrNeaLpHJ7CMCQENIlKaQc/9
         QuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633614; x=1790238414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kMkgBdb6Add+uH48UOWcPcDDnexiIDFVK5Cum+qocr8=;
        b=A66fkxj3var5WVy8GD/3dMAKRManw6Wbr8Qy6oea0U+7gxaboVFRJs9O9D+fYZxb7r
         q3KNoWdkimi5LHY3NGURKQWh30qDNIwt9SLigh98ra4OEOhZCx96o91PlUVNJM+tXEoV
         hVYon8dpfe8L2HmPdMwyTW9krJH2UL/eoADwbMtzU2Prt30ySaTZJjR0OKAI/Z4IzMhB
         0WUbKvJPnn64+/A/iWBtb09xXoMZJwV32e55XdFulkcrdmKLt1o0ZB5UOShTZbsTzUwP
         FucgZo/4gzMe9cTQxz/8KHmVgmCgVUYenUNvYRTa/L+fTz13DoIakgJs3bSsAI3sghxX
         yUmQ==
X-Gm-Message-State: AFuF++mhjAiLnRvXwzr2BseZrJ8wOnd9R1XIKHWP/73zxtVTNK38cXb4
	b+SOq0uvAXugnCRS3lqUH159m3SV7JAkNVsg96NU3PE5fKM/H4nR0xkL6iKKtrYJ/QA=
X-Gm-Gg: AYBFou0Yqtq2O5Fx4bPASORHTESTRTG+mO4KsaUZ+32akaoG5oHC8qGku47k4sTQSax
	YnPYa6emCIAs9/C8oNW7k2sCAa7WOOgxNUeRm5MXrsP7chUEdf6NayQ6qJSO+v3H+UuV1zXtV0U
	nvaZEbw/Jjhrz+DrHxhwpVu9vv3BHKaSs/0Wg7kC2PHjLVviA/rHKZaiLuKnzDthFNCTg7tm0R9
	hHEYx5Yvu5nuOy0L1iV3M1+YK2isNuh4fn2B57eO4i3e78u5ltT/PSow7c5DG8n4tQMXRgRd0o7
	IyXJNhaif++LtaYEZWjUdQFaYLOwoYdwBxdEzXVbaA6kafCO3lpK4yIL0Uq1TD4xHmefrsGVgU0
	nkYB6BiwfZQq9mgwWlUs7f/36UkcDrtUq5xUSXurwlr8Fegrmp0IGEpW8uCRn8VmpPYoNDTtcDb
	lsrf9a5DkqzdYxRc5vQp++JLOEzhb2h9e3HsfD22cDPnZtGBxR2IXQrtG+7xuEVPUiakqA0puGa
	8N/vc53eVVAgUyVVujVjn/xw51CMGumD/2e
X-Received: by 2002:a05:6000:2084:b0:484:3147:49c9 with SMTP id ffacd0b85a97d-48713ae5112mr4241921f8f.2.1789633613879;
        Thu, 17 Sep 2026 01:26:53 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf342a0sm13420395f8f.24.2026.09.17.01.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:26:53 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH 2/4] arm: dts: sunplus: add PWM, watchdog and MMC nodes to SP7021 DTSI
Date: Thu, 17 Sep 2026 10:26:30 +0200
Message-ID: <20260917082632.626614-3-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917082632.626614-1-ag@ffroot.co.za>
References: <20260917082632.626614-1-ag@ffroot.co.za>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device nodes for the peripherals that have upstream drivers:
- PWM controller
- Watchdog controller
- eMMC controller

Also add a label to the gpio-leds node so board DTS files can override it.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi | 37 ++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi b/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
index ae9bbe0320b8..40dc92a05f0e 100644
--- a/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
+++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
@@ -291,9 +291,44 @@ uart4: serial@8780 {
 			pinctrl-0 = <&uart4_pins>;
 			status = "disabled";
 		};
+
+		pwm: pwm@7a00 {
+			#pwm-cells = <2>;
+			compatible = "sunplus,sp7021-pwm";
+			reg = <0x7a00 0x80>;
+			clocks = <&clkc CLK_DISP_PWM>;
+			status = "disabled";
+		};
+
+		wdt: watchdog@630 {
+			compatible = "sunplus,sp7021-wdt";
+			reg = <0x630 0x08>, <0x274 0x04>;
+			clocks = <&clkc CLK_STC0>;
+			resets = <&rstc RST_STC0>;
+			status = "disabled";
+		};
+
+		mmc0: mmc@3b00 {
+			compatible = "sunplus,sp7021-mmc";
+			reg = <0x3b00 0x180>;
+			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkc CLK_CARD_CTL0>;
+			resets = <&rstc RST_CARD_CTL0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&emmc_pins>;
+			bus-width = <8>;
+			max-frequency = <52000000>;
+			non-removable;
+			disable-wp;
+			cap-mmc-highspeed;
+			mmc-ddr-3_3v;
+			no-sdio;
+			no-sd;
+			status = "disabled";
+		};
 	};
 
-	leds {
+	leds: leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
 		pinctrl-0 = <&leds_pins>;
-- 
2.53.0

