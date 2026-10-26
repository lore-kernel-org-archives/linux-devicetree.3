Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051131;
	b=mZLyOLnFtL6yBMNNzZxTX5GYOUnFtxZwDLEooBSSA2MUBDYSFlqaxZ2dvTkxPttJ8WG1
	 UEZw9IfF/gcL7B3yJXDrhA2xgyX212JS/kF/zm1kKaFXw5A2qtW9jfTCjVav8FgzM75GN
	 vYQbtmAxiC/NyhD7/10LaxQYqjzKlNR8XCTkc9vf28mUbAmyE9SGggYNUOwOb1RRthyaY
	 meMpIghpU96+g0D6gJYJJV3yzepmvKHvfOkG1gaKrPaW8+UiG95MEiqRivWQepmYPKQvU
	 77tMyty8KUKL1gezp2M6s9S7em772hERjE40F0p8YyqrldEGrWKJ4i78IWfVRdkCp9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RxRxbLBQ5S84nbJ2Z24j8qYmciKanlUFlKBok3xXqSM=;
	b=GmFob2GwYNClyv2KRW2ALVzTIAFJKixM2PcuYYjDbEcEFgAbj7pGlJqh7V7rzVzvqmYb
	 Cp8gizesK5D9fFIMmHYW3eOdcbJsI6t7Y4EXSaUFeHUZntCVQM+19wbkJ0zZV/phR9heG
	 3zCBJoB0ZEytT0FBfq0iu+S57YZomxzsfoTA5ek+06mUBP7RCgJ4CsQY32eSOsF4pb+8U
	 5FTjzRCqESrLplb/yXRTEWefgfvYZFyIdn8Qhh14m2CzoQwCsJsMEuvAwbreJl1ibATI6
	 Ib+8FGQ82m4bqzDAfxaBCflUgTLHKOodE5MChGCi+Wq1vZnCiMAJbf0WR1e8ltXin1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M3BEGRGA;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD0760A2608
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 21:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BD0760A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M3BEGRGA
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-369f33df08eso3921603eec.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793051130; x=1793655930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RxRxbLBQ5S84nbJ2Z24j8qYmciKanlUFlKBok3xXqSM=;
        b=M3BEGRGAH/Vn2SxAJ2DzND9XWJaEthgW/2MXtbTOVBhxXeA9DgmqzFakwsDvTIr4Nm
         7cB3fF0bUrpubPo+WWG22t5+1qoyUQRWDdijeDyKfjB/xcFfTQSWEy42gLuAnCIwTIE0
         PBlq477/agmjQqRSYYXMAKswTErSit3gwmpSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793051130; x=1793655930;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RxRxbLBQ5S84nbJ2Z24j8qYmciKanlUFlKBok3xXqSM=;
        b=GFYIACFKAf1M00LPtUVqS30R5BHoV4WTseyG30gbGxaLXE7PUT1Aete5/ubfitOhTt
         9N09MI09mvefsZPp642cTK/wd3Xyx8Aj9fseTD2UtyJp1hRnNpBJimkccwUMzIliOscs
         Tk61Hx8Km9Sw3BI7Hj+y2XGZt5TPeDcL3i6t77atyuPL+LVmSb5oX7Pe2c/s5WdAEH2A
         jCR9wWgWtf3MThWcJVgjSHA/4npck27lGkfuNj4bw7hhhVaDGgGlnvZsUf9B8jJeYmXF
         TnfTow5xijpEYj8fXTQCH7I8QX3bLUj8kontWF5xZm/njjIDN2nVevIF6wScfEJmWdA9
         2Lhw==
X-Forwarded-Encrypted: i=1; AKwUvBwbXNQ/klvXRspwQoDLWy71diK3tlmHooJwZUXw4LpsfZ/9BfGPHuW6XRCBAgGk+DEAWeUUZpGpO5tF@vger.kernel.org
X-Gm-Message-State: AFq9FYLexX3j+3MehF8tx5n+vvJo/heu4iRGM4Y9txs8vsopEDLjmDqP
	PV3KvmOKFK5pXnrJqNW1O0DUFi1bULHV4HWNiHJeI0/dJhdjULt3drrCrE2mSrTpUA==
X-Gm-Gg: AYBFou3y0EFLz71On6Hj24DeeUF9kw9uEDDDT/G0no2YP4dNcFVtaUf/gLzUzsKRN1F
	Dvm26A2oSLo+T9r20BEN8v6/LhW/6gixv1YAsbgJsSaufIbXJZckF4wonHkNhr+Aenm/acgzjMe
	LLqKEjWbd78UcYMPlN55fcdq33wX/g3+JuhgCaO31ItrVg3tQM9g7vIrbig1Py3GuVSJtZjqNIK
	pniYsSzBaPjqH3kTv2ZwRKDg1DarWlVOMiWAK4GKIcQLS6r6KR5sPlsW5TXsTxBiiyBG//tf9I8
	z6s10GTlKIfS2gJYspMa2z+J1dgAWW4W3AMcrjEHKBQr78ekedIbgs72FZGsR0FAH3xFDEGIIi1
	7zc+DfPwTJuaGoO1mTATH0+4EzuUuDjN8MBW+rdIT9whsILASlvk2ekprz5hCq/QnLhGUbSE+m8
	ISLIBAhUesVMEWSzhadsHvg1eR/vSwhSp6DozCmV2yn3zLvxCBoxH3Bmh2vo75cVANYR1p8DWbC
	U9WIz8S4gcy5gFTiqiEPSRsYxHVJSznNnsU47kH09i4vgdAw2TRhBoFieNMV6Qdt+KzwgRDwDuX
	u3dmvA5bz+hSX3TSMW8=
X-Received: by 2002:a05:7022:eb57:10b0:165:55e2:2d69 with SMTP id a92af1059eb24-199377d8c73mr12569336c88.46.1793051129456;
        Mon, 26 Oct 2026 14:45:29 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:79c5:9cd3:db14:7468])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-198a0f81ea9sm32064575c88.11.2026.10.26.14.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:45:28 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 9/9] MAINTAINERS: Add entries for CPM drivers used on Tensor SoCs
Date: Mon, 26 Oct 2026 14:43:47 -0700
Message-ID: <20261026144346.9.Ibb4a0adecf127291198c372da631ff62b483a795@changeid>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261026214359.3122870-1-briannorris@chromium.org>
References: <20261026214359.3122870-1-briannorris@chromium.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Google Tensor SoC known as Laguna introduces a variety of new
drivers, with Google-designed IP. Add entries to the GOOGLE TENSOR SoC
SUPPORT entry to cover the new drivers that interface with the Central
Power Manager (CPM).

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 MAINTAINERS | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20bd4e03bb54..c997d23e377d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11424,18 +11424,28 @@ C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
-F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
+F:	Documentation/devicetree/bindings/soc/google/
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	arch/arm64/boot/dts/google/
+F:	drivers/clk/google/
 F:	drivers/clk/samsung/clk-gs101.c
+F:	drivers/irqchip/irq-google-*
 F:	drivers/mailbox/goog-mba*
 F:	drivers/phy/phy-google-usb.c
+F:	drivers/pmdomain/google/
+F:	drivers/reset/google/
+F:	drivers/soc/google/
 F:	drivers/soc/samsung/gs101-pmu.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c
 F:	drivers/usb/dwc3/dwc3-google.c
-F:	include/dt-bindings/clock/google,gs101*
+F:	include/dt-bindings/clock/google,*
+F:	include/dt-bindings/interrupt-controller/irq-cpm-google.h
+F:	include/dt-bindings/power/google,*
+F:	include/dt-bindings/reset/google,*
+F:	include/dt-bindings/soc/google,*
 F:	include/linux/mailbox/goog-mba-message.h
+F:	include/soc/google/
 K:	[gG]oogle.?[tT]ensor
 
 GPD FAN DRIVER
-- 
2.56.0.307.g5fe7bd680c-goog

