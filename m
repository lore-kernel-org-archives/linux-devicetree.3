Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5C948382F
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146650; cv=none; b=tYp+1G/o/2Nf5QtDw6ELsI/OtLtJnO6ZW1ja/Jdx5qpkX85PmOVWqdm2db5TBauv+xj4IEAp7N+7Y1YQIXBEO+xd/s0oCvBsQ4M7vNwwcrMZnSdJF0DaKGGN3XHR3wYEPfFmOIIXAdf3hs2WlvnXj17hQnAhbNNdiLtk9A+GN3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146650; c=relaxed/simple;
	bh=BU4GHjU/addW49Fi5owY8SmKZGnqIixi6vq82uwwdHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O531VPb3Gb1UDoVpeG2jLzMraAJJfPMQGdij1CZhzBdZmekmxu34A2ZsFA8R9a0HY9zT4QKvHVcb4uVyyIvIk8ET7EvQXPlHEdomtKxlQ+NTtyyqVDiIUQkc8ZMEh7zHRvfp+sldG5WQE1llUH+RL8XMMPgXF47uj6bShh4hnME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7BFCT/E; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7BFCT/E"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1a86c0316so281019a12.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792146647; x=1792751447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5k/Nx254skplKaHZfy+hhUKCjKjMi13IPnfogdi4XtM=;
        b=S7BFCT/EMivHs3GpxR8g2OGgep6n7aljN6TgWLs4Dkcw063iO/HCfXTfx+SbQJfv6h
         VONgebflpBCSV+6JvBMvwSEQOt9PqWNOYQue1ZYUAah7pF6eK48nb+qTfTbIaLtK7wCQ
         6KiuACMDYnGEvOs1eDqgoIwsb3yur7GCeau/zbSId599Jb5dejMKtr54BigTL0ND0T2P
         ifwIheMZecu00LspxeNEy4HD0/yDnVRFa5rBnVIwDKBuQz9iubwDLzhutgMfN2KLUyxl
         3Jn7GTptQtVEaNy8u5PnS+HeqcMyGK0ZIqvk8jVrncOAqoCPOuLqjsqTCdRm31e+ND6l
         OMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146647; x=1792751447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5k/Nx254skplKaHZfy+hhUKCjKjMi13IPnfogdi4XtM=;
        b=EQTisfvvhHsRUQeFqI/FNogaAPbkM+70tpqAkKu7GBG0PAt2uyCLBRsvHPTQtSS30m
         GnGdfVi01DVH03TG4O8kYg2HrhZiYNYym0fXDDub8z7yAiWMrFIjrOTK5245FxvQ2qfE
         G/SSH80oDXmQWGONCmV4Q/2JmLBcpcf1dfwO3YlQn3NAeWXWoU7SVQhU+ZK54QVjw2Yl
         EmlUd3bEG9YdS8DcUy/Hv7c6Vz8k2hu0aCJWc0BOJAUsAVDc71EP16M+wxE7GwkFhYIA
         IeLn0kORErUQnyTX5wCuIpjCTutOCgqZ+KlNOZThnUMkIHCVIZAwPLuGAg1YGt/UylyU
         PX3A==
X-Forwarded-Encrypted: i=1; AKwUvBwNGN9J/M4u6ZK7o4IyJ6TyiMKsgbHFHwaLGp5vjO78ncXfQwfAIrUTBjMlC9TPuQHT/O7/aZUe/yac@vger.kernel.org
X-Gm-Message-State: AFq9FYInZOo7lhSXO2/gikW+eQdynW1AOzUqrhbEmbhTvwt9e7xqM+26
	EdYvgAdDq5rflgk5QQn8/zp0Z2bWz7nZkcihZVkQpHo5mC6cYDWszuRB
X-Gm-Gg: AYBFou3qKSiN/FsvVXSNSCz5DIn6K2zQKsrnIvYNIUaZD/eFUC7asJvaI2Cqxc6oDNj
	P9B4DqnCkxv9DZUGWldAvkDqtaM5Vz+2IzXjjxPC3HQfJC6GYdiyo32++EEDkjGchpdSL9tm4KZ
	qkGiqHKfM8j5cZVaS5/arrNp+n5XuTBg53lkTu7TnD9jzZ4ji+sPpGzLbRrBObr5a1xEje/32J2
	Mt0zug6Gph7mX/xqmkzVAUWgQegmlHDsSDBlFXW/W0V+MnK5MKLkBNFWKFzjyZHoGQCDKoYkhNO
	t0yWNFYKGz99qXSlDykYmlkSN1VNUrsTtOL3a+vvd0ucOrzJAKyn0X2ZZMnUYkpZjlFxVnhwvjU
	C3JcOG5HBZIaKImYSdkXNQo8dFeyVzfH509L5PxvWEOOtentOYS6MSrN8pvA7vXO2sI+Upg1PfB
	rWbm3jYJRlHOPUz80DX2mlF+ws8n+tmXhGB/bU5lUz/BO5TGYShHpHYKIc/YN2ABDwW3wxGt585
	QSUBrh/9Lg7
X-Received: by 2002:a17:907:d1b:b0:c29:4a1f:76be with SMTP id a640c23a62f3a-c31aa013b5bmr2062189666b.20.1792146647503;
        Fri, 16 Oct 2026 03:30:47 -0700 (PDT)
Received: from localhost.localdomain ([193.107.16.241])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce133sm60613866b.31.2026.10.16.03.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:30:47 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Date: Fri, 16 Oct 2026 15:29:37 +0500
Subject: [PATCH v2 5/5] arm64: dts: rockchip: add FIT-PCIE-SATA overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-ok3568-c-v2-5-068d68430e6d@gmail.com>
References: <20261016-ok3568-c-v2-0-068d68430e6d@gmail.com>
In-Reply-To: <20261016-ok3568-c-v2-0-068d68430e6d@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792146625; l=2276;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=BU4GHjU/addW49Fi5owY8SmKZGnqIixi6vq82uwwdHk=;
 b=L6u76hvhoFC1VxSmQLMBau5CcR67ge6OIBk/TdlLnbx3Gjxy2lnT5flh1/HFTDlutOvBF0orb
 uvcNsyj5RxQDcjFvDJgMbKc0qpdj8XXPdVnnu+FBW8dVEo/93Pokamp
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=

FIT-PCIE-SATA V1.0 is an adapter that included with OK3568-C board
and allows to connect SATA drives to the device.

Add overlay to use combphy2 in SATA mode.

Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile                    |  5 +++++
 .../boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 48c83f79f83b..45e94a44107e 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -155,6 +155,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-mecsbc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-nanopi-r5c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-nanopi-r5s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-odroid-m1.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-ok3568-c-fit-pcie-sata.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-ok3568-c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-photonicat.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-qnap-ts233.dtb
@@ -275,6 +276,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-lion-haikou-haikou-video-demo.dtb
 rk3368-lion-haikou-haikou-video-demo-dtbs := rk3368-lion-haikou.dtb \
 	rk3368-lion-haikou-video-demo.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-ok3568-c-fit-pcie-sata.dtb
+rk3568-ok3568-c-fit-pcie-sata-dtbs := rk3568-ok3568-c.dtb \
+	rk3568-ok3568-c-fit-pcie-sata.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-puma-haikou-haikou-video-demo.dtb
 rk3399-puma-haikou-haikou-video-demo-dtbs := rk3399-puma-haikou.dtb \
 	rk3399-puma-haikou-video-demo.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso b/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso
new file mode 100644
index 000000000000..474488ea994b
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * FIT-PCIE-SATA V1.0 is an adapter that included with OK3568-C
+ * board and allows to connect SATA drives to the device.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&pcie2x1 {
+	status = "disabled";
+};
+
+&sata2 {
+	status = "okay";
+};

-- 
2.56.0

