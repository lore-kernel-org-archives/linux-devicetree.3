Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9117D39A80E
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 22:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780527253; cv=none; b=mnqA+CzbRs9+kw4OBLvnsI6TJqMQ6uj8LRU1/m2tTwK8Vt/RO+Ew0c5DRxLWWI5L1B67MF8uExxVtwkrkL7qKHlWI78/xuTb5f8Aags8yo204O5yeE/OazJ4GpIir1ci8Z8+Q46a69WiLNDF+YPQVSFNDaZgM9pVGRTREf/dYjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780527253; c=relaxed/simple;
	bh=nYAVBK9yWXmZ8FEbBC2MUhh4ZhIgYxBfZRpmyskldx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WQdYgd9Lpc7QKywiSrmm9fPI7ZaYPBd14hSCdk38LtHvXh9UlyqlDc13U+3KuIWqVq9lcTXJI9BTNY+Fb5EWv1Rq6mWah9jCLIn0xJ8xs7tDnLvAO14UR4GZljDUZnMkOErOBZC8DvZNPVCwKJJPg6yCQamVvS+JnltcsH1b7AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+umxRTg; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+umxRTg"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso850335e9.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 15:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780527251; x=1781132051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLH9imkqpbpmJAh8J9v3XS6EMAgKWrtcFsXCB/DHgBQ=;
        b=L+umxRTgdU3PtilN8j+lPspdNAX4+jr0U5x0+frZ163pJQycOqCyelXMildjd239Tg
         Pau0nnjNWLPfaz7DGGYN1FE4hU3IPzgcLghG4ahZbaX4VZNxYM+UuDO7rayBzr4/EQ4e
         nXoPeMqnBK5sHfCGIugP8zbkcph+LB7GFNNCDpnd5TMK3pPITHy1RVgZ81ZDct2/SIYR
         0vNdc2mSh9yaSrvfmVi7PKRRg5hZlM2Z1H4t/Uz3G8M0xDikb6HnD0IzUcwGHZShD2DO
         bEaHTm7p41VDcrw+G6wjKYxpEUlEmiHIXvnt2CKQf4kca9LzX3ewOUbgi/6YIFTS2Rwm
         ePNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780527251; x=1781132051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bLH9imkqpbpmJAh8J9v3XS6EMAgKWrtcFsXCB/DHgBQ=;
        b=rp3fqkhkmmAbum1906TE868a6bB8LRolIE5KAJhqCCf6VbNvZMELrvJrKD4ZAfWgO8
         Q/jZ15ZZMiEDiOq5ryQfNkfPYnZzCC3m8VyUSmm/81cHO/KtenN1JJlfdvE41RGlqQA6
         cSt+fgEkTBot86OZyUzw/aBpr4OyOTlI9pwCrd/PpQ91ISDVS/y0HN0s5nCbSAkI3XTa
         xg3Lu+vy6TLjiS+GlJcMXXHl5jY2z1eL6Iz6nI8Bk5Rdwlscrd6MDAX6Qxzd6A76THQ5
         O0jmxu4dtu2uDAmZfkp4dtF5AAoQZKSrNYZUnp2er3vVjn+svPay8GBjlTORk2dE+SEq
         ch3g==
X-Forwarded-Encrypted: i=1; AFNElJ9ICVHA/Hvgd0j7cBSRKe4Mjy2dztSJMFCcFWlsGAtoL06TnVkF35Hsfep8Qeh3ExfluXd/QZ7vSmnu@vger.kernel.org
X-Gm-Message-State: AOJu0YzEOHhrcocOqebDHod+AxdqEm4iM9cPDgkLRZS2XpEW6ygQ/1tc
	CR907/xEs7iWfgB9mXzPH6tvsJNvqwlZKZrai1R+GV6E+MEVAGbF1dj7
X-Gm-Gg: Acq92OECIy2DfBVnZLsA+LGwcaaUotS6iozPA7LKAq2voUx7VK8mLoTu/a4Z0x9Hqjq
	fFRrscRd/rO1Vij4+z2NPV76GYo+bAUJ0QjU9Iez8//ZuoeJbZtwk4OMEHX2nUV5m5Aij1StsgG
	kTiqXxVG27lIa/0+cB+8o6snLXO8+Dyxb5D7uAL5PcK8lVKDYCCzWEnoOsD+HrJhSpcZoojk+iu
	0lFEEUtoovne8xT29Mrh7Kr6zNfHEhIkh0n1TmUlEvVZ170XJl71qPvjRoaDYjP6Is7Y+Cy3CWa
	Abb89WWe5VCKrwP4gw+/eGESgPCWFDpQq6VwYYWlJckMRSpSgrpjcNZQkhGG4+zA2mzaZUup4bh
	pBwsJ8DL8iI6Oirj5SU/FH7kT0n//5pSfdLrS46M8BDM9KN3oyE3+cwzifmpOodIFwI5zoKs5Eo
	GjqgcqdyBVLsADh01/HguIiLoVUWpN5jSzBSTG1qis+8j/FKuHXDgH16onc40+U497t3NTiNtUC
	/cxZ+SR1slMqpxQRj7JdhJkWbavaOplPQoiMYlcyaYZDvA=
X-Received: by 2002:a05:600c:46ce:b0:490:abef:dae6 with SMTP id 5b1f17b1804b1-490b5eb0aeemr79808335e9.19.1780527250987;
        Wed, 03 Jun 2026 15:54:10 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.dsl.teletu.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c183asm26366385e9.6.2026.06.03.15.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 15:54:10 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 1/2] arm64: dts: imx8mm-var-som-symphony: add wakeup sources
Date: Thu,  4 Jun 2026 00:53:59 +0200
Message-ID: <a34f166c6376ac9e0f1721ec2cf6d1477b6646f6.1780527068.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780527068.git.stefano.r@variscite.com>
References: <cover.1780527068.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the Symphony carrier board GPIO keys and capacitive touchscreen as
wakeup sources.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 857325ef4461..090752014ee2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -55,18 +55,21 @@ key-back {
 			label = "Back";
 			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_BACK>;
+			wakeup-source;
 		};
 
 		key-home {
 			label = "Home";
 			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_HOME>;
+			wakeup-source;
 		};
 
 		key-menu {
 			label = "Menu";
 			gpios = <&pca9534 3 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_MENU>;
+			wakeup-source;
 		};
 	};
 
@@ -187,6 +190,7 @@ ft5x06_ts: touchscreen@38 {
 		touchscreen-size-y = <480>;
 		touchscreen-inverted-x;
 		touchscreen-inverted-y;
+		wakeup-source;
 	};
 
 	rtc@68 {
-- 
2.47.3

