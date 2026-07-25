Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2003603D5
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 03:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784949572; cv=none; b=cczoZiB9LaTgHILJng3aLJma2QbWnfIsixs5/CWXc1t3KzDDdEhISho3pSRdZucMKJR0jP8PFP83kU7SWbAVZQlKn3b/o+Rjux/ckonSeUwxGA7DHpdfdYRn0gk0S+kQ2RaVP4t0c4Sgjj1B1v8DsgP+ZJ0jmKMRYbq379P9hEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784949572; c=relaxed/simple;
	bh=itI/1VwTHA3V7ox5PXMT2Vrb2UKYmyIibaQ0egNmgMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gZHJUvkbMXKnEQ16Oy4Pax6PodbQfODDngovJwvWDI/GLk8yn2z6Y8A+GaTU4l9hwS5jRd0h04LpZX7ct46xWFmeIgLp0urQ3RkYdyR6/5sXoLVgKykYm87aDIAUK6uIlySID+qdpRIZfKLsR+udMjR2NHm2f8VIfSssVdtLH1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+YPHCOI; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+YPHCOI"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-c96739a46acso596848a12.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 20:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949566; x=1785554366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VnOgmyFyaaGmxr13glRiK2+qIyg9Qu4CO8mOwq+CLUM=;
        b=O+YPHCOIbJuFOzcCS7O5V8H+xJKv2+iZPFhuas6IX/WlkMufxN6QjbEGso8D/XSUB+
         BOZK+1DYuXeyMJjGD5iuXYolxXNquNwjDEV8LSRmyqcc5IRX/5g+Yz+HDYRqCHI21oyh
         00AWI7HtAkWG0J18SqSoHYKaXOyv7i9YLMq4eihuKbDMFTPzfSKAH2JoBu/8NHOuhvrv
         v5j4gfQHAzuqDmk2XBPMIvyB4RZzVRZi2tvEHc3E/FnfnbgVqVef9tDhU/U9LIoFP+uU
         5fqkambI/GzcgqoJupzsTP2reYNSPKe5XQrlgHeWTC3ZPbttOr8wQ5N9pXRurpbMLEaz
         kkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949566; x=1785554366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnOgmyFyaaGmxr13glRiK2+qIyg9Qu4CO8mOwq+CLUM=;
        b=gcp59WgokLFOFN+ZlbMrTZhL2db5BSkhhCWc/IXFvBsTftewJN6goZqCYxEpC33vE3
         EMUccXQ47Kxlhqe5eExxuzo5hR4kD3Ga7sUxliRp+HgGg+iqdRAlUUWevkR/9htwI2Sr
         nlZ6xfqEib/4T6Gr9Num2MdHT8pahHwbtuIWy9Qq49OWeTN9bWvNy//8Y97UXmCcBXVo
         oZq+vALan9RTIUKnrv09UWdeejT5JKFLmD/uoB++91PxyyaE6mQk/Vwsx8rnwUOp2XiX
         00jZFgZCNIi8HJSoOmRBIn5zrcdUGlsABl5CmZHgLL3HbCHPi/ZO/Cv9tT5zIt/jhzvO
         UnEQ==
X-Forwarded-Encrypted: i=1; AHgh+RpREarLr0fCxGSqyjvQNRUhb5aHvwp+AuImqcyS+6aN0Ch/oqSPvgGibJClM+sQPO0MvAGWZLddgH8B@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+JyGrxwIJLsYV/PVuyOVp43z1XVF/w5xDz+etbfqRgwTnkSKt
	0u3PFgCZg/yS1OFZXdyo9uNXgYfX9WvhS1gDCl3ANMi4anyi02xfv2+y
X-Gm-Gg: AR+sD12Euhj+CsKXZufadCYBm7RzU3e2jXQL+XNZA1I12BPlaH/NibjIVRMI3Ymb0uW
	s/POzORCrqTADBLTxtbDgjGrSRf5BLTb5cQ39/y8o3cpEsoTfs8BMuEcn0aTmnXu6q79c9Vjvm7
	UHIZCE3NzReJijIgtmEWQMla4b6UVDv1yHOoAQX9Wc1TC8kP430o0tE5fOr4JUPIbyRprzx18rh
	BivB9elDyWt1RPe8gezBaMquc3KySApFp2mATfvMIxpC1zjdOSAEy2Je7eeCDVNKiSXUqzys9VY
	52Qo+XnAjL4/rN46pVED8wp82A2MANSFGQTvVkwM4N3hy6FB9GDWOs5qVkeZUsN7mVcVFZnN+RD
	8G3TRMWvu52U8pLiCNv06CKHQQZF1m43BAeu574XlPeVzg3fB2lDp3uo=
X-Received: by 2002:a05:6a00:2d9b:b0:848:2a71:a48a with SMTP id d2e1a72fcca58-84e593ff0ccmr648871b3a.13.1784949566154;
        Fri, 24 Jul 2026 20:19:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:19:24 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:47 -0400
Subject: [PATCH 15/17] riscv: dts: spacemit: k3-pico-itx: enable the
 DisplayPort output
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-15-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1

Pico-ITX brings the second DPU's output to an external DisplayPort
connector. Enable that DPU and the DisplayPort controller it feeds.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 11 +++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b89c1521e664..6c31460990a7 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -6,6 +6,7 @@
 #include <dt-bindings/gpio/gpio.h>
 
 #include "k3.dtsi"
+#include "k3-display.dtsi"
 #include "k3-pinctrl.dtsi"
 
 / {
@@ -221,3 +222,13 @@ hub@1 {
 &usb2_phy {
 	status = "okay";
 };
+
+&dpu1_crtc0 {
+	status = "okay";
+};
+
+&dp1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dp1_1_cfg>;
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 3ee1471f3798..2f36eba20f1e 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -11,6 +11,17 @@
 #define K3_GPIO(x)	(x / 32) (x % 32)
 
 &pinctrl {
+	/omit-if-no-ref/
+	dp1_1_cfg: dp1-1-cfg {
+		dp1-pins {
+			pinmux = <K3_PADCONF(24, 6)>;	/* dp1 hpd */
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <3300>;
+		};
+	};
+
 	gmac0_rgmii_0_cfg: gmac0-rgmii-0-cfg {
 		gmac0-rgmii-0-pins {
 			pinmux = <K3_PADCONF(0, 1)>,	/* gmac0_rxdv */

-- 
2.43.0

