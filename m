Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC3D438008
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 20:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784752297; cv=none; b=exhaZ1ZwoiBmi68SBHvendEkhkO28I7+u3WSJkmerN6tDIXmjSniXqVd+eJ+Xdpw1CS8OX/6vrJPVHUstbV6S5AeEDY9iyYsCZGdO2jW6+Ic4WEtvzvwi7yMKIf/COlbYks3oZax3PWdAs+3ixcJ2UwzZRKEjrO9jVCp5+9voIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784752297; c=relaxed/simple;
	bh=UoEo+rWIkC1aWNZcBUOcKadFyb1gPIT26H0nu88T1XU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eJX5jc9B6oTlkYnn9LYf9RUkxR3GQ6kq4KbPmlt/8IOY/Ak6mN2B+zqCzI5QKQgkwNJ7jpzGznMMXepj6hnM19vwTwXqWnNvkpfL9gZ/DvIhhcvvLUCA9KLlFCUiGMIFeq3CG+kOFo+t7v8EbMbTHvka5tOW+CrNO204VASH0ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fDGOTPLg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bM5/Lozl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fDGOTPLg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bM5/Lozl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784752295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k8Wg39SYXO0JHmLOHU0723C4lSHO7cWpCqGrL2pJzpY=;
	b=fDGOTPLgJlWNfCRHDNYGJX9rSjnf7bt6ASMAmHx9FIm7IwO98TIp0JAR6aQ2D2/vehBAuV
	R2SblTtbBEImxO5yep6g3A9Df5sczZiteiFwAWSBHG1x8qBvc7iW+9aaSBnvPRwJ3q7gnF
	ykjOvKN79mL7VK4VoDxv0t17Aakj8HE=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-JRUKXbDlObGagophonyK4Q-1; Wed, 22 Jul 2026 16:31:33 -0400
X-MC-Unique: JRUKXbDlObGagophonyK4Q-1
X-Mimecast-MFC-AGG-ID: JRUKXbDlObGagophonyK4Q_1784752293
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81f0b6bb02dso62182777b3.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784752293; x=1785357093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k8Wg39SYXO0JHmLOHU0723C4lSHO7cWpCqGrL2pJzpY=;
        b=bM5/Lozla9tM6LWDezijF0blpV0jxHSX9ua769OLEvXGK3GFA9ZlIqG4ZQyTrf0/Rp
         C5MZ4873q46LM6VHjMD32mKvfiFBl34AH9kq9lnFhGJZLMK5VYSWt5YpJGCHrh1s5NVS
         4GNswOoGVv0Pxfd4NQZwdrOURY5geJP7Kzi87yEkh13Kkenov7ttgYMF9kREClV1HyAg
         m6NJnxehi7XTm/QsOrchnf4hTSkjP+Qrbwo6/dsd5PXBFohpdnTgiphPVPMmnTmkKIyF
         4L8LlxMIQqeYOAfdOZWoUKJgdoAtmji925CdRLYYMRe41RTUY51vo7ZbEiVLOwsRsy0w
         RCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752293; x=1785357093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k8Wg39SYXO0JHmLOHU0723C4lSHO7cWpCqGrL2pJzpY=;
        b=aFeaOqFTUOfAabkLRy3LolUq3eJUph3Fwo2pCIJHVbK5rtrR44steY8LqXlLpcCn0d
         wVNTzpCbULSAekLRZQwPpzVwDe+hJbl94Zn9v7GPUphcwi3W3mBVkG1AM40E/H7cOLrt
         M4xmQYZAvOWL8VQp1gQhXNROr40lMEgJldiBr0EnVEMfcT8SqCHNDHpYnzab0kysI3i5
         Eo6cPuiRJA/CRRbp0uxhVoRVy7V13YJSw7jlGgTYvdHfLc+FLrKlDLZllYMr02981iXb
         FP3XGfM6fKOdj9S2JutQFMQJVQ9no8M04f+eErJoGniAWL37iuoEqqK63bBgqwB+eGyh
         i6FA==
X-Gm-Message-State: AOJu0Yw4NVHPdjT44JHobjIchgEQ7rhVW9wk8QqZTmatDoAg64qutnwO
	orLAtUfnJT7z7xBPEGYjN/VX29q/r9gZv1Ykf1WfkRvzrjCFpFkwm5H3mkHLbOSDFyigYKsXDwN
	rqvCygUvHhFXd0uLLtFZ1Pn9Dyn/HZH127YF3FwQ7G0bGJHhZuQOqK4L4vm97Bx8=
X-Gm-Gg: AR+sD120F/EEVvPSJlKpiV1r8Dzxmt2eC/vXB+ykDYvIielVGy71/MqL2cM4bnBJKWt
	Qt8WD0bgSr83IVa3xHrtZowV1v0WpG1wdqX68Br59lxlBxHBgnFiyIRWs559u2ZYxRKqqerwMBB
	+Esg+zPbAaQGIFR4uKwnigBEH7yQNYDx3SDp2M4FOyTJLldXDYhC+a3niT1wd3CB7E49ON2tb9A
	YqZv/BGqSirnLLUbNLBpzvTlNlxWWRVE5d1md9uQQtOu9e3UZUqyH0RGmgki+ce2HZFpE83wh1J
	pOOUntyYkZUkTQBPcZYXOPMEMDW3AjApl7ao95wStin9C+0OfrQsnQ==
X-Received: by 2002:a53:df51:0:b0:667:c93a:82e6 with SMTP id 956f58d0204a3-668a4cacafcmr40410d50.44.1784752293093;
        Wed, 22 Jul 2026 13:31:33 -0700 (PDT)
X-Received: by 2002:a53:df51:0:b0:667:c93a:82e6 with SMTP id 956f58d0204a3-668a4cacafcmr40395d50.44.1784752292656;
        Wed, 22 Jul 2026 13:31:32 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-668906d9344sm1923573d50.12.2026.07.22.13.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:31:32 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 2/2] riscv: dts: spacemit: k3-com260-ifx: add eeprom on i2c1
Date: Wed, 22 Jul 2026 16:28:48 -0400
Message-ID: <20260722202848.1817988-3-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722202848.1817988-1-jberring@redhat.com>
References: <20260722202848.1817988-1-jberring@redhat.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable i2c1 for k3-com260-ifx and use it for a 24c02 eeprom. This
eeprom, unlike the one connected to i2c2, is part of the carrier board.
Some boards do not have any data programmed on this eeprom from factory.

Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 15 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi   | 12 ++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index e7f76cd24b903..a5c08a7a781a9 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -20,6 +20,21 @@ chosen {
 	};
 };
 
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_1_cfg>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		pagesize = <8>;
+		reg = <0x50>;
+		read-only;
+		size = <256>;
+		status = "okay";
+	};
+};
+
 &sdhci0 {
 	pinctrl-names = "default","uhs";
 	pinctrl-0 = <&mmc1_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 5b9045e014345..6482d24be1394 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -78,6 +78,18 @@ gmac1-phy-0-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c1_1_cfg: i2c1-1-cfg {
+		i2c1-1-pins {
+			pinmux = <K3_PADCONF(54, 5)>,	/* i2c1 scl */
+				 <K3_PADCONF(55, 5)>;	/* i2c1 sda */
+
+			bias-pull-up = <1>;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c2_1_cfg: i2c2-1-cfg {
 		i2c2-1-pins {
-- 
2.55.0

