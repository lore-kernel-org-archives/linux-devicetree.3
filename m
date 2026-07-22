Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CA4459AF8
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 23:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763383; cv=none; b=SBFxUtkP3eojT3URFKlVWLl3pzuCUh+Pu/9DqrkIGRwzN4JvI+SZpb8ZjON6Z04tQsjYl8Fzf8yOPZ1ZYi22qo1tu7dIkjl+p/4M5ewTBvfLeS7vOUGETiIvgHBngoK6stbBNJT6rHQw2jebeZBBDU+iyxRlzPEZK1MDSUM2BnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763383; c=relaxed/simple;
	bh=1/CkHD0oxgnHzUCphQPj9uX6mQV8xPw5f6Jx+XznVi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UeXuFk/Aozqy4DxX4J0Qn8y2eWG7kcYwKxnLWTqaQX6uLvxk+lQn6X58lanlm2SB1BgZtEMpKOSvgMrlTv+YWL3+HmGV68VgMoWnefKEvvx3ifxBr2L28EAx2YMa0l7wF3hIpavHymAc2h8jDsi5oTZnxXLy4A43CjIk9y6yCGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jF6T1vLG; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jF6T1vLG"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-80c5cb9a888so458657b3.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 16:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784763381; x=1785368181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSow7P/U4ty7TVa1wStrr2GU4gsF6dil0NdrrF14oGU=;
        b=jF6T1vLGVhV9442oFMaECj1fsLCJOm9oHRWRlarpgTOxKe3l2pbFzcz+b2QDW8rDkh
         +gQDRB11L6HhgVqCpf+c6PlWOh5qMkQmYj05qRRCuJXwLx3JsYtS6LYRZXq0QtoVRxwB
         lPmHB0ZVLJh5C2dJ/iCFFMCCg6IxwAPIpC6lWLIk5qDIlmHsSoOfdQf/g9O3NQjkopd+
         I1nv6vvT72+4fhAlWJpQ8mC6y5qqzUyxA8xN/4FiiBLjNrlJicu9Stv11NFG3T7pakWe
         TLhzbkxQgfZOFdfp7lNs4yTGfsZqnMH6YZXeT/+GJoAAscX0xOb+0vyhvmYiv+XvPrb2
         OV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763381; x=1785368181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gSow7P/U4ty7TVa1wStrr2GU4gsF6dil0NdrrF14oGU=;
        b=eRD8EaOeS0390/EPKZvExXevW989hD05PE4RY7y4Z1aeeWPOla3xhYOFUS+6+4osgu
         3WQPtdonNMmDUsuwA55obAkJEI3WIF6FWw0+ArkoxbvfpmrJFEGBzhKY1awn7/2gJMNj
         LDwIpmLI7elxjgOYHGVOaKSBYvrfAD3uftVVu58N3rd6EsQyg6BG8hxoZ1jdfN7SvI7F
         IyojOdSBB3yU7G1JuOlH50txWg6pm1dQSYZYsgnIWfNvUPuNzO2io3000fUXPWN4VC3k
         t2jOrTLZL7OU3Qy9UVWb0Z0RIBSSe1s4CHYgh9t+PcyZkkoKqEP6AaAiAvWwNo63tHFz
         Hseg==
X-Forwarded-Encrypted: i=1; AHgh+Rr3dnkCz4KkQ5e4bbOfzoNaB+DdaDd+gL0//0ljAcIwaZruigQrFxLj2+31ksYSUiCeDtukQ/AKZyDp@vger.kernel.org
X-Gm-Message-State: AOJu0YzBibC6OBDwBWx9Qt9nkoMvoDxG8WDTldAw/Eoxz7GQ8YigaCfZ
	5fjggLMxr5i+QLV4qkvKtSth5IkLgy28LLmk5FnqqU1wSl4FtV3NHH6i
X-Gm-Gg: AR+sD10WSROa+js0DntmLs8DBvsvWcV0EnsXjqIjqiiBAF/lvPNnJBeXUlEi7oyq3f1
	Pw5KkK7c9bRrSWU1zej/su9s2oHz3NlqAMDc161PXJxPl0NK6RlCh4hBVDnGo5euTUTVO1SgnCv
	w2zylLvmEi27ZqzC2EizxM5YOAGLe1fZW19LG5Gd6JYQcxAdMlrvIULzFCTlE5z8OXxFvliZP+m
	T1nD9nbWPx+4ElXgZdf9t0yR3YbJbaNGJ5itCFA89LIhYToOv2NK8M2Hi5P+pZUIQYqtT5B+JUa
	6gxWNQ/23DUf0VxMMu7Mq6qdf4owOhNyi4/1mltjLYkhboT4Ysox+NWuObguIC8lLNljXKeDZ3p
	nFCcMQGgQyFFbvEPN4UcOSQbPPLGjGTdXbEbthGJW+c51JvTTiWzHQ+36rlF4az1umRaNuPheHE
	2tSb6GK/b0WlaXX/0FxHjKe8RZ+4iUEqzWcq+6
X-Received: by 2002:a05:690c:d07:b0:80c:90ed:c79f with SMTP id 00721157ae682-81f4c30b5e3mr2230927b3.52.1784763380753;
        Wed, 22 Jul 2026 16:36:20 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33c627c9sm20937027b3.19.2026.07.22.16.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:36:20 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v3 4/4] arm64: dts: allwinner: a523: enable IR on the Avaota A1
Date: Wed, 22 Jul 2026 19:36:04 -0400
Message-ID: <20260722233604.3001063-5-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722233604.3001063-1-utilityemal77@gmail.com>
References: <20260722233604.3001063-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andre Przywara <andre.przywara@arm.com>

The Avaota A1 board has an IR receiver chip on the PCB (next to the
Ethernet jacks), wired to the PI8 pin on the SoC.

Add the pin description to the PIO DT node, and enable the CIR receiver
in the main power domain.

Tested on the board with evtest and some random TV remote control.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi          | 7 +++++++
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index c2de662140ce..219fd76a4710 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -155,6 +155,13 @@ i2s2_pi_pins: i2s2-pi-pins {
 				bias-disable;
 			};
 
+			/omit-if-no-ref/
+			ir_rx_pin: ir-rx-pin {
+				pins = "PI8";
+				allwinner,pinmux = <3>;
+				function = "cir_rx";
+			};
+
 			/omit-if-no-ref/
 			ledc_ph_pin: ledc-ph-pin {
 				pins = "PH19";
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 474354fbfcec..994f1e4f0ce7 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -100,6 +100,12 @@ &gpu {
 	status = "okay";
 };
 
+&ir {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ir_rx_pin>;
+	status = "okay";
+};
+
 &ledc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ledc_ph_pin>;
-- 
2.54.0

