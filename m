Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1751A46A5FB
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 16:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784650407; cv=none; b=OdRnSNNdrfEoviD6/bboj0nqw0Y7d+ev5v4w7UYeqQ+l5leliPr6tnTewS94hFDZfc5ptlahDunRQXQriEiTHpOch71nu+Cb+633jqyPKaCQEtW2GQW1N4FTjadId65WXz/0vDOsOTHpM07voPAtN9VKNbSIsCYOXMo33hDgYJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784650407; c=relaxed/simple;
	bh=uaRfl+zCkdpZUD7Wzj2CgQZtDnhYn+/y8na2rrPgUi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fq5T4NfYnpSOcK3HXacsAeHwMcP+jvzwkKnI6qlkXWhIrDHUgqeZurk5O2uVVaktP94xRV2li5Od7/13BU/PxWmAo+UyiuTIbXh/IZIh1IO59PPJdy8EmUvMUtsK+QInYaQbyzc61wXAHNPPJn8fQB6rMt5zQA+ncfHiiKEer9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eUMZcYm/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=abZq8Ep4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eUMZcYm/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="abZq8Ep4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784650402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=16RyG3rd15UswS247w8Y2rBGrhgjsgtjs/mBo5jjAhc=;
	b=eUMZcYm/mKDTNE45T6wbmadHrsAlF25bfrwG8zO/+Y9ZfXXoLHGPm81fWleoSzkgqCm3UQ
	V1JY8DSXlOQdQpFSiGMIYzB2Wp+7/xQn/SB8C6Q3O8vNAUrYWvUgkVqx5xusaO5Kkj3CRw
	4Y0DqsaARPK+b+tlnLMDnwVMlhTYOtc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-Me7JnjVoNDOdYL5jC9getg-1; Tue, 21 Jul 2026 12:13:18 -0400
X-MC-Unique: Me7JnjVoNDOdYL5jC9getg-1
X-Mimecast-MFC-AGG-ID: Me7JnjVoNDOdYL5jC9getg_1784650398
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8efe7db1c42so212926946d6.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784650398; x=1785255198; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=16RyG3rd15UswS247w8Y2rBGrhgjsgtjs/mBo5jjAhc=;
        b=abZq8Ep4jiFcmFrN2/od2Umge82NtUsSGaljbf+ScGJdYvYT2HfapsvLjSTbjWgPea
         GojmFQc6z7wUNvvboedLYUq/Edx2Lw5aZ2fJxbc4kkKTCJiAdzRUFG6c39UpEVZ1/Laa
         y/ROL2Y65DVJXrR23yK0++KvmK//PYtSXPlaCl22RImj1h/rbmIzvjmlrTt+lyLNBm1l
         KUoc6H3JkyAimbAO/rKJteakn7uIK8a88rsAT/LvXIqd+7ZywN/kYTCw+zn/21DfevZb
         30blGiMI/x7NxMIIY0ZJGAp9KCxtqoWKYN15l6igPlODJQRI+IF1BTOJtm300d5uNCo4
         e4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784650398; x=1785255198;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=16RyG3rd15UswS247w8Y2rBGrhgjsgtjs/mBo5jjAhc=;
        b=htKDKH8tZildv0oW7EPhjKZbjjgb+M0kWQvWq8NVFoIAjspVRTbXTPRRDOhvyuv4h0
         IEzbAGOyi99E8SNZhMGsTLbZrqgJvZmv4hstST3GgGhhnF7dLWuemBwKykDN2TlG9+3t
         qQ5rTN2QPji7erg46UGou4mUmB7crAZpWnWa3uIxibupTqiAcy+Y2S62ZcSvCG3ATexN
         B4Dlhp+q9WvB1QRekzLsYf/A38hQ/X4TKAc2CjvR5SykBnlnYfiNUdqGiTLBUGwirRa+
         OqG2Xpt+MNoBwkaZyp5Iomiif7VCS2Nv10oJDfOqqRKA+DI75JQlP3IEZux6RD/FsZr1
         8OmQ==
X-Forwarded-Encrypted: i=1; AHgh+RrSV4ev9pgWc0gGD/K9x+UGC115qnUjnC9s+fzXizm51sYSPmES5ELJ69zwL5KS7LxXjcxTgcSNY/w5@vger.kernel.org
X-Gm-Message-State: AOJu0YxLP6tNS0P/b0G5cLis+lHtwMJCyJc3uppi7j4iUJ7Gafjft3nM
	PPMaRJa+cwVHNPFvjZTo5fXT1z7XoH+3ZxhI4pFWstHMgBxQ1T5y1eLHwgcDBOUCOZWp7dI2VWo
	e1GLEJYvBM7gLWBhBC0/HRt7eBqEPB69KM6gaHT15lhTZP5JLFFixCYS7VFn5f83MjQZfk0E=
X-Gm-Gg: AR+sD105AaFnazfPKPUCaxtnh8k2J298JO4EqjZ4//OKuFXe/tiItmU27PR8fvg/uHV
	8/hawRmM+o5F45nIJQsOXYD4cxaelfLV1aOgrbfwIpzHYKWmgPv1euH6FoaoJZpFBNZy5Ite5RX
	JSClzrjoABFc9c9shC7Is3dhSpKuWDHEZObGOhVFTmHzDoix+k0e1RZMi2FqHh2YMqm6JMzPX+y
	okxmveieienQoIO4NKQu/HmWf2uvqRIy8auV14QOzZR3+iWiTAioeRQa7ANV0t+OUJToa6bVWgi
	e3NnEcKmclWKSckBtwKJk8g9LxqDev4Itosu8VGHa5UtVIU0PsvgAVtC3p8Wd5LyaRRzJpZW/T5
	z55ewFoYt1BF1cvwcUt/XC+oqtmoz1LCv
X-Received: by 2002:ad4:5dc5:0:b0:8cc:de2:3b5d with SMTP id 6a1803df08f44-9077833676fmr208455006d6.16.1784650395298;
        Tue, 21 Jul 2026 09:13:15 -0700 (PDT)
X-Received: by 2002:ad4:5dc5:0:b0:8cc:de2:3b5d with SMTP id 6a1803df08f44-9077833676fmr208454366d6.16.1784650394783;
        Tue, 21 Jul 2026 09:13:14 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90778543d85sm119008176d6.3.2026.07.21.09.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:13:14 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
Date: Tue, 21 Jul 2026 09:12:41 -0700
Subject: [PATCH v8] arm64: dts: s32g: Add GPR syscon region
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-upstream-s32g-gpr-syscon-v8-1-49c308536aa6@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0Jm7Rio2hZW3sOwaOgUuoCSGSQSw
 t2tnMDle8l/fwchjiTQFDswrVFimjLYSwHd4KaeMPrMoEqlS1MZfM+yMLkR5aZ67GdG2aRLE5p
 HqJUOVlt/hzyfmUL8nOlXm3mIsiTezqfV/Owf0dVghURVbYOyRlv1ZPKDW65dGqE9juMLUKOvr
 MEAAAA=
X-Change-ID: 20260717-upstream-s32g-gpr-syscon-75f926f868d4
To: Chester Lin <chester62515@gmail.com>, 
 Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dan Carpenter <error27@gmail.com>, Jared Kangas <jkangas@redhat.com>, 
 Dan Carpenter <error27@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784650392; l=2767;
 i=jkangas@redhat.com; s=20251111; h=from:subject:message-id;
 bh=lHjtYpzASvlxCVG3xK2x9n2hpQ6hZK9tKMMaQqJSCeY=;
 b=8ABgP1iCn05nj/pN7ivfiWkvV8wjCMbPOBY708QDHm/JR0QQ1ywmBsudLTLIbKYGcPDmFkhUx
 outpkTAD5lOCyizJF3VSDULxbbFxFlTpUNX5qZRSfFKfkCsoTG6Yb5j
X-Developer-Key: i=jkangas@redhat.com; a=ed25519;
 pk=eFM2Mqcfarb4qox390655bUATO0fG9gwgaw7kGmOEZQ=

From: Dan Carpenter <error27@gmail.com>

Add the GPR syscon region for the s32 chipset.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
[jkangas@redhat.com: GPR syscon resized from 0x3000 to 0x100]
Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
Revision of Dan's v6 patch based on discussion in [1] to avoid a panic
when reading the debugfs regmap's registers file.

[1]: https://lore.kernel.org/all/aej2X2Gp-UI3Vmvo@rh-jkangas-kernel/

v8: Correct gpr node ordering, drop T-b tag
v7: Shrink gpr size from 0x3000 -> 0x100, add 'arm64:' prefix to subject
v6: no change
v5: no change
v4: no change
v3: no change
v2: Remove #address-cells and #size-cells
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 6 ++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 809019ea0e299..29050aa5ae960 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -122,6 +122,11 @@ rtc0: rtc@40060000 {
 			clock-names = "ipg", "source0";
 		};
 
+		gpr: syscon@4007c000 {
+			compatible = "nxp,s32g2-gpr", "syscon";
+			reg = <0x4007c000 0x100>;
+		};
+
 		pinctrl: pinctrl@4009c240 {
 			compatible = "nxp,s32g2-siul2-pinctrl";
 				/* MSCR0-MSCR101 registers on siul2_0 */
@@ -795,6 +800,7 @@ gmac0: ethernet@4033c000 {
 			compatible = "nxp,s32g2-dwmac";
 			reg = <0x4033c000 0x2000>, /* gmac IP */
 			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
+			nxp,phy-sel = <&gpr 0x4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 22e80fc03f9c7..8baae30f9f192 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -180,6 +180,11 @@ rtc0: rtc@40060000 {
 			clock-names = "ipg", "source0";
 		};
 
+		gpr: syscon@4007c000 {
+			compatible = "nxp,s32g3-gpr", "syscon";
+			reg = <0x4007c000 0x100>;
+		};
+
 		pinctrl: pinctrl@4009c240 {
 			compatible = "nxp,s32g2-siul2-pinctrl";
 				/* MSCR0-MSCR101 registers on siul2_0 */
@@ -874,6 +879,7 @@ gmac0: ethernet@4033c000 {
 			compatible = "nxp,s32g2-dwmac";
 			reg = <0x4033c000 0x2000>, /* gmac IP */
 			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
+			nxp,phy-sel = <&gpr 0x4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";

---
base-commit: fce2dfa773ced15f27dd27cd0b482a7473cdcf2a
change-id: 20260717-upstream-s32g-gpr-syscon-75f926f868d4

Best regards,
-- 
Jared Kangas <jkangas@redhat.com>

