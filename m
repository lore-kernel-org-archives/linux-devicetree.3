Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140ED4746B1
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251438; cv=none; b=Xtdm7NUJmh6elwk5M6w06LsIIIRDsH/i6WIT+SbtVMpJ/vuyofkRWdS3QZ46sskwCeWwHIeuZEkl5Uq109HRZAUfLwuxl8rKNcfIRdbKrEdD9YbS+ZPoNk+8/HSqQ3ZHHH6HlVUsuJIK3ZMguRR4430qcWfdscsK/ST2UksJ07o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251438; c=relaxed/simple;
	bh=DlPWvl7VPmpyoxjPLEXDDFgGlZBGBcqWJsRTiZvvGGY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ABphMXHFYDpmHUCgEmh0m7DQdFt7N82TkZiXxYhx+IV7eCFrtmfqzJuzpFFtCviSbzw944z1eHGfWpLF8h+SctmaK/Zq052xma2LWIOt43y5AY27oMeW+Cub/8eUq0tly7ySzMSlVybZEhgpseom4aBz+etG5PgPcxPZXqMWEKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNALetWt; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNALetWt"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso23056495e9.3
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 01:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788251435; x=1788856235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=winUkNgWZKpQ2EAEJkwIhIBpCcK8DMcWRELm0nMiNB0=;
        b=jNALetWtYGBgk4UmMQ3NXZNE2x5Ewkx4DpUYN5vLTrdK8qmV7H7m2F5RKtdfbKX59T
         vbCu0l6wjvVTMjzlr7bW6W5iMnXX2POAcQZ3Hum4Hwr4FyqL0wlfmz+R7HL5h45xaVv2
         23LtcWRWR7FgGrFSwllD5QFlmwQTw6LBEe2zW6vfesk1KhI2vVdrCJalRIGZXEvtxtxA
         Rv/+/LrC7kKb2SX4bEZdjY+q+GdWaas0hOgwYBqAnHoIsX9EBrRt5Pi2hb1Yg5tNSZQ1
         v+AEnlhIfr4zCpVwx81TuDdiW11DZN0h4dAHPS19eKxVV8YyhlZgyyRbZSUfHbErU6Xd
         m88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251435; x=1788856235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=winUkNgWZKpQ2EAEJkwIhIBpCcK8DMcWRELm0nMiNB0=;
        b=ZH0qQLkPLQcTpBom9RoJBdKygAzTMxMXJOmLXEqLWZI9GPoWD5DxqhCnLsHAjRqFJ8
         FRbe4dwKzIlB6s7pk9aHPk6Kro0vFdG5Y5NFUn0XPpI15Z24V3y71Ng/kq6VrTzZaAVz
         V/yqN0bl14O1zXg/d9/xWQgFhYFb9iqnHgRQPhruKBU2WnKiakDJVvMDHPmEySKQm6G7
         5WjRwfhU9HHKEx3eAX6qnE/1Ta8TpUCcfKiM+MHTuhjGm8p2JKHdsTLYbMHoJ5F6SJx6
         /Xw81dpfNS9PAQWY/fiZU6lYJi1QiFDnK7bvnApuMX1uqoHrvrzuO0R4ctPMRjuhxUL+
         tttg==
X-Forwarded-Encrypted: i=1; AHgh+RqaPuoZ3litojuEIk5K8TBkxtrf4NDpwrTu9Oobj7gezmruqTZB+9MIH8Y7YS4im/fUFRyWJyKoctYY@vger.kernel.org
X-Gm-Message-State: AFuF++l2TaEUi+DI8BsPwmLqir/kDmDaDp4ikbWKGj8hrUQRZYcof/Vz
	+N2rVm8JNG06uVOUea/hLG3hz2hXDa1S5zg6jQYSBUUtIovE2HMSARFj
X-Gm-Gg: AR+sD13k29Wl07zZY1lpTYzNw+/FRNlFtkpsdquWqiyzHnzYqIDVtWDHNxAI+vQoP4N
	O8I0EVrfojTY/aFbedKHj3O1Bh2KrjVrdMCfFGxbf62O/NRLL+c/KODMDwGGAGLe9FuOArtyzRy
	at9ttq338Mm2C8SrfWxmd/I1K/Z6F3i7Ndxu9I7932PXTpScaCl8mp8ly2qmmF4geEuP38X9I3x
	zWrY7as9b6HdJrE3bXnBa5spjDxdN9Vj3VyTDm/B4J24FVp9JHiV4cp671xczZgO3XLwdmYEu2d
	Brz2CPSuMXPqiIBGHmUuuZw7FLyVk4U8zbhn0qWewpCbPpuwpC+GkhLh8kJT0cjMBCUV9KEEMlH
	1/AdxiEBFqRvqnLBhEaSCH1yxOqgRxz9K69dbGddF8OZfPo6EKsyhrIJejCFKy19eKKSac6LHQq
	y0XO2N6sg1kEh0lRMHFlHMluspeSNmu79aU6WhjUcJn/q+a1M+84BwuP9HeQvVwRal7NheVfHzt
	z+iicI+XcMjIuSodh2ec0TuXBvXfhpdZ6IPmKwiahqp5ma0MjOP
X-Received: by 2002:a05:600c:19c8:b0:49b:c8e:a211 with SMTP id 5b1f17b1804b1-49b91c20bfamr493430315e9.5.1788251434958;
        Tue, 01 Sep 2026 01:30:34 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cdce08862sm51459635e9.1.2026.09.01.01.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:30:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v15 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Tue,  1 Sep 2026 10:29:23 +0200
Message-ID: <20260901083001.8044-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901083001.8044-1-ansuelsmth@gmail.com>
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
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
index 0b42e898f4d8..1b4f79be5e54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9757,6 +9757,15 @@ F:	include/uapi/linux/if_bridge.h
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

