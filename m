Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DBF3F8ECD
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787508; cv=none; b=AjwbdV7E1H4ZIQWzVCTLoY/uIuTHKcIdmjIeGe40xBvVK3J0AwzUrXiiMgSQLctjzccn/LfeQB2S0dFAHTBlgJcloZNuIvtkbMPTpyNjIRoWN04QUtkWewGFw8TzD1EiZ4TyYm62zHblM5ctGobI+CUnDZ4XHuX+qobNBb5jDkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787508; c=relaxed/simple;
	bh=AtNohlQ0WYu7yAy0ZDcPtcuY1C2JeuynsMtDfbhK1Oc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XxD6IEeR6nLUBGDmyrFRwxWASMPkIBh9WiVS3Zc1kNxe27qq7pznFd1ZZ4pY4kmNQlHVhR2FLbss3+TD3i057iPcaWvmlKiJEBsehv8gx1oabyu7rKPcrZ4eT5MGBtp6cJ87BkVIF9xwSlBe0SVSTQO/V4C/wm9gMd1GbvT0dhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvOy8Eb4; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvOy8Eb4"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso6728015e9.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 05:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781787505; x=1782392305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7ibR1uk6j3yRvHUeSG7+Ts5vUBpNZwTn1NirzFE3FA=;
        b=AvOy8Eb4O66msKeiGx9eKXsBNctPy7nQL4W2hlD8s60TyF5D1pddEMLn3117zVTmxk
         YNvSxXaMZbPe782JNFuvTz1oLtsLItPH0wtYxoV47mmqHtQjs3llYiNA4MHwhGl3sjNR
         2SE70W4ed+/o9dqqdYgTvZMjINPAHyS+gkKwVov1wMG138uWeb1G2FMICYPxCtBGGyYG
         MVXDi1qEflcuvTKuEt9y+vdQ8P2i4GTMVkzjZQgjdElMGPB97BPAnTDOycQfg6weUgrE
         Hw9Fk2BG9DomVaVBRqpebEsGO0l29Rke3mxLDvd0tObP82kSQd+WivKesac9BiGVagxm
         kBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787505; x=1782392305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z7ibR1uk6j3yRvHUeSG7+Ts5vUBpNZwTn1NirzFE3FA=;
        b=k02hTuRRE6izLIlQr/VcokTGQbZwBo7VBHZ2XaChTPs0Jd+Uad/5ABXbhdqF0+KQzS
         ELKZoCK64Gqf8r1Fi1hgS9DXksb17jo2fy4XYnG2nUF3K01snBB3UHLnmaZd7cTbWC9e
         Iskgwy5r3s6D91lL0I9+HYzZmSMl9ZfH9ohqir7QDz4zhAgkR/KafAfRi8SvBTJm1PvB
         AID1L4CSPhZ4oyRNz2WF5y5l+OkyMozOZU39hW19v+PjppSfOSENwUmoCHvahFcs++v/
         fpT0ITuzyvi6X02AvYFcOLMv7OCXhEtB+2nU6yA5/yDu3kKHkdKGNlf/gncJK5l13ITi
         Jg9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9uKpA/XNjetD6ICSOW/ri/G7viQ6YltDMOQqq/4/iHAqlxPsBinH5sRJNbz3NdbGQf9cN7ecCoRvnO@vger.kernel.org
X-Gm-Message-State: AOJu0YyupLFW041oFw7k7pkzb4xdogKVlo5Yp1o0ZOsmT3Qc+YiAFt5m
	Ypcx2947/2kBb0j9Mk2FsW1rLI+6FK9iODWa2MTZx6vrkP1oAQObTY3o
X-Gm-Gg: AfdE7cnKUKXjM61mAyYc7Qr0dBqwOVFXKRDYSC10nd+b8bVwuBvwZIICcJAdOWTSbjl
	Z6IENtKpH1zmfzsPbqjGg9egV3GF/kezrMBJ0MUk+qdrvRKHTtq9Hww9qoiK7+eqNBjAHqtMVC8
	El9vyv8YuKTMzkdQqDEjWhdrTt545ttNT7Tbn61HsIJvokjrQ30F/v/cp3nN3FOU9YAw8YG6nvc
	14ot8xl26LH2/0+5dJKbpQyYPDpjrAyW2rlCDdmkPm9WNX0LqzzCY9FE3EJaDYIjc/FkQuNPxV1
	WisIouveIrsH9CeajAYACcDlmktBmbuWuM1jg9v3uQQwJ1p1ZJdIaFRD33xVA5TZ+uBPteBTA/8
	QE+8LmyQXlusQJ7UX0sZj9hmbtCA4nX5o7qETJjAeNMGk02Gp39uRo4/cxTTOi3S5GL9ARUaIdi
	pU3/rRgEsmddRVBY0utEx+r1HhfDQb1FZfvluINB5d7VuIlw1KD4fmQPo6UBbUNQ==
X-Received: by 2002:a05:600c:2947:b0:490:6237:5200 with SMTP id 5b1f17b1804b1-492333f5dbamr93229425e9.10.1781787505189;
        Thu, 18 Jun 2026 05:58:25 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm241451585e9.3.2026.06.18.05.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:58:24 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [RFC PATCH net-next v8 07/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Thu, 18 Jun 2026 14:57:15 +0200
Message-ID: <20260618125752.1223-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618125752.1223-1-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc1dde0c9067..ef3ef5096d08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9593,6 +9593,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.53.0

