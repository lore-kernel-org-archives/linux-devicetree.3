Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C773ACA4D
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 17:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780162533; cv=none; b=JC1Z8F58lcMpcLIeu8ycGE87qHJYmtJgvO9mxtwgbb6LytiPzGA/ESkK6M+UXePAJRXMRJkfqOxBCDYH6X6IgLcPyCpR6X+O1epfsPym6gkZf4LpgpPsbBXGAZySGJDPSIVI7YJZP9pBDWj3rRjKp+MUy+3i+3SlAyivGPQqL6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780162533; c=relaxed/simple;
	bh=VJhjDbD9k93v4xWoMfUMeJOvaM+SAKtvPHI+Ks7kzIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K1hW8NscByNYZeAkJHuCxvVEoRF7uexNlR1hw7YqQ/SyLAFaPujfos2Y98H2eS6wwn6D5ZcUWW8F7gg3ng2yTfRj1cq1R/E0oIQC8UtcBmwn8wFjSkVEhUIRJ2cfkfaFOriULUgr4siY3bs0sNWN7rDNKwCR4v8HxG97yHDVuCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0jwYzx+; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0jwYzx+"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8cce87d7995so21356656d6.0
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 10:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780162531; x=1780767331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1iXfEJhkoJc89mTL/JJu7oRdlYA/T+hX/oQJz+ARaI=;
        b=R0jwYzx+1ZmaI0uAwPYjxniN+v9XmBsQUynqcpNtcu5UN44fE0gB1PSbEbcmfR2Zwl
         tjWhj38xQg6Lo3ifxoaJnyPa+wj6XoWtlqodJymG5v1pYBe4lhB7+HeZu3053QlTVXtL
         FYz7tPXqH0NkEbkWli0799Gx3iYmPsnO8kUBpLY7G0N5tTj76dgwhJDoQK2yhrlNkbJL
         aFvxsMsMaS66faJ1QyWb4yLigIeayEMnHg11kMTxzoIDBtolzl8vPdIg1u9l+dp+/Tkd
         FjFl9VGjzUBNm7LrbOm+UQhHnhL7TLKIgJRN09kF0yON5UCEhrZeOr5Adf7lyi4hkPb5
         X9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780162531; x=1780767331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e1iXfEJhkoJc89mTL/JJu7oRdlYA/T+hX/oQJz+ARaI=;
        b=DK59BF88dG/1rqUe15pKbkQ6GyPZ0gJzOoZjoq2RlVcbhc81YnLmODKOdDdoCBBE3X
         9MVCaOpOoNzsmI9cbB3DxJkNiVVdysKPQHw4cS+s8zORWs0AnroY3Sla7nqRqhRcQDX4
         YK9onEOebNTqiW5hth/PcGVLJVmRp2JaWlgVZF++S9vlhx9Am9N9Wioc5d+U6F+cX9wr
         D4mGpB1TFLyp2/+0DowbXAsQmDlB3un+OTgLeYX3uKMcdoZNBb1t/1RA5qpJkb8lA0Gb
         xOngWMfsbrdjZwTgBBiCsluHUFxIfebfHRa/9mygeUG9kx/UEiXhoNjGbvjkxjMDcMnU
         L1ag==
X-Forwarded-Encrypted: i=1; AFNElJ8NQe29qZcmrTqr7GsUhZE5ZOI+yldq4efPecs3OX3750MuAI5yi7FPks+kBOWd8FInoXutqO5zAx0o@vger.kernel.org
X-Gm-Message-State: AOJu0YyOf01nKP43ZLaYm4xbnBqSkiKAPsKi0qieQGy++sjOj4UC/Xqp
	YHnC7Wslort+c2QlDYnFG9YAAVXgKsIO6oRvLne5A/87QJ+vRRRC6LI4
X-Gm-Gg: Acq92OHQK4fQDGFHtDPfny8xZ1guoFjji9uSr72g173h4kI6Z81fJiW41jTTK4b2mKB
	57ZUSzqcIKunw9zwJRN7xSi8PJyi6PRQUBjnj+nhpFcMqHj5dcVoEBw7l26GjqC2A7inAixTFhP
	FOOfS+KZzyzqyQAarglOTNyp6kD+gS8JtZImeJspl/QtNYV/uAN351ti+ZMlxTI657bUmOEFX02
	AXO0EYcKUqe68EoUu+TkqjohdNKYVmgxEB/uI33GWf1lJrAxEQwOQ5T7mlHNu3ECjgSJEK1755x
	Yvl6SSxJxTOuEohcXPxj6fA52CQiHUnPnD10tWXJpzCRLjGLchaoyce3/XcZrKNrp0Oy9hN1FuG
	vbve3KyFegwbiv7WR+92uQ66tAwuN/+MnO02shicVRjBdGsGmEnG6NA349JIgRv044l1EPcU5hE
	TImEc+pcU7GuU2y/rsl3Ds3S2KwrTZVWLd0koufjk4VrhmLt+6Lm+Xjlb3IJIqDRHx2ok=
X-Received: by 2002:a05:620a:800f:b0:915:40ff:4e10 with SMTP id af79cd13be357-91540ff552dmr582669085a.4.1780162530542;
        Sat, 30 May 2026 10:35:30 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153244e114sm565606885a.5.2026.05.30.10.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 10:35:30 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v5 RESEND 2/5] arm64: dts: sophgo: add initial Milk-V Duo S board support
Date: Sat, 30 May 2026 13:33:44 -0400
Message-ID: <20260530173347.33533-3-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530173347.33533-1-josh.milas@gmail.com>
References: <20260530173347.33533-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds initial arm64 support for the Milk-V Duo S board
[1] making it possible to boot Linux to the command line.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/arm64/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts

diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
index 94f52cd7d994b..68aace728223a 100644
--- a/arch/arm64/boot/dts/sophgo/Makefile
+++ b/arch/arm64/boot/dts/sophgo/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
new file mode 100644
index 0000000000000..8632470f43ab0
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V Duo S";
+	compatible = "milkv,duo-s", "sophgo,sg2000";
+
+	aliases {
+		i2c4 = &i2c4;
+		mmc0 = &sdhci0;
+		serial0 = &uart0;
+		spi3 = &spi3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&dmac {
+	status = "okay";
+};
+
+&emmc {
+	bus-width = <4>;
+	no-1-8-v;
+	cap-mmc-hw-reset;
+	no-sd;
+	no-sdio;
+	non-removable;
+	status = "okay";
+};
+
+&gmac0 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
+
+&saradc {
+	status = "okay";
+};
+
+&sdhci0 {
+	bus-width = <4>;
+	no-1-8-v;
+	disable-wp;
+	status = "okay";
+};
+
+&sdhci1 {
+	bus-width = <4>;
+	cap-sdio-irq;
+	no-mmc;
+	no-sd;
+	non-removable;
+	status = "okay";
+};
+
+&spi3 {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&usb {
+	dr_mode = "host";
+	status = "okay";
+};
+
-- 
2.53.0

