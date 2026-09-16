Received: from mail-wr2-f15.google.com (mail-wr2-f15.google.com [74.125.225.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B7A53359F
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 23:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602763; cv=none; b=Wkc79YwH1F7zJGYi+kTZcvXDxq8s3kl33shdy+PjNYuTsOr5KTLjk5VqqsZmev1tmZjFGXjx8Kl1J7+qDfnzopP5ppdtOEQwOgHcn+MAAblBWTtsgjMf+fW67XRskYXXk0ogtrfyykMu93BDuiL2h0jz92+LqfJm0vcxVtRH1wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602763; c=relaxed/simple;
	bh=cXFXLP+NjYWZtJpQfz+KEsHtZfam6Old8yzjXsddKto=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ca/Z/aQSziCfyujO6DYwaIHR1yUXjsCzfTGrTb1ZvrNZ/1fvG0ohcRbF/cIpEcY6gHZ62G4pmJqKrH6BxEFwVBx9as5nKURgbW6ffastfCaHhavoC8vXb7XQEMyrasGgVURdqQhNPySbrDdOJIqiBJdtdR14UjTY5NaEx/qmdXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7VeK/o0; arc=none smtp.client-ip=74.125.225.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7VeK/o0"
Received: by mail-wr2-f15.google.com with SMTP id ffacd0b85a97d-482f633ecdeso237717f8f.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 16:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602755; x=1790207555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tmAu67PdIVI7V1UutpEDvX/bujznCInbK+OAzRMwn/o=;
        b=Z7VeK/o0Hki/LXVrrrkPm/toPwU7WsGonTfv71e2ZZEVViHfelDod8elIyMqGb1i6U
         Jc1ohu8eXp7kqtxUVnfBQCk+ezruz2pUNSnmlxEJOFb4nHjeBmRb4c4Qp22H1Lg2Io2M
         nSePr300R9xCT2UkvCKEf9QXidhYYMrQmgCMB9wUg4Qm3OAL6Y5W1krCb0g0A+3djSvw
         IXD3/tOpxrVx6MZWt0pknH1vFRiCzpNK5KQIosnFuph1i8YUJQAMPx1BKVJLXEW4Y9gT
         vWxnWflnLlZE/bShebjbC91EyVYUHSfccBkPUCl80FfvzoeuJL5UCtb7Yx5fjYyo7kjS
         Sk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602755; x=1790207555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tmAu67PdIVI7V1UutpEDvX/bujznCInbK+OAzRMwn/o=;
        b=UsjDQH0rhd39gWjty32veAT+/ECxVFgOiX/grwOB4wme1eifjAcButUS4y6kPUZZx+
         XOl6G1OYAAjAWNUUu/FCtCN18zYD6tA+TgWjLTPNK53fehIVEQvgUEb6jxyiX2O4SS1T
         jermB8H3LCTejYG5i4sp8na4w/z0UJ8H0XAR5dRUkyBdHRSHEyRUzHG2f6SJriieY7qu
         SL11LXIOYN6OQn1FDNFWcZJO8dG5Z5ObES2z2X3IbUxR6mpAA/o/mII35v1+xHouGLb2
         vt78pElhmFFrTHfKAfPtEe8oBLDvTtan3L43tyKfRfSgtZUwVDyPC7VXaQ4nbs7WCl6u
         CqhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPuBOEt+XC/eImtFULoKmGxh6uqdVj9A/wivkAWWCZjWWExlg/kAyi7u1ySk/eRPPad3sCb47hTxg+@vger.kernel.org
X-Gm-Message-State: AFuF++kmoZ8EGqdJBijJoCojuidXL3W89eAOz3H6adTNdAWsfqwiKVIr
	A9YZg7QD21NB+age+9CRe+kEqVlKOjAPG7vCAwGkCZ5M1ESrnzx7v+Z6
X-Gm-Gg: AYBFou1+XmniXUw9LxZhVFjo47bhCmaUpCBgBEA4zK70y+9sQtTTjMcdz4T4BVzuPOh
	Pkly721fcYOfOMv+3m4kv9x+6yrE0nkIEixug5P0z4Jopuqd005RoyR5W4zTm8hnaGuvSUEoBEd
	iJ+A23KafqwqxzD13EQHEtfPA0NqSiKM4Jkzshlk8/1RVkCC/5NqZzCfx2QkM8Yx0zLe2nVik5p
	zylZoKjla+vNxIJDlmu+1aF1myW0MEp8IRbExC8i117HPcCJAZboIne8TW/oyIun6ob0UtGr9ud
	gCyKz2vPQtyllMMF7NM0Z970V29xsgi0Paktt0M8uwvr3l04xQDG+eHjMkTq+RsJwJlmnRbcReM
	JjDwRe/4qCr2bSUWfpKTqfJcKblF7UHIBOUeY+oSQ/ZUtZlRSvM/qQ1iNTs5KgDRd7nBfd0vOgO
	oq5xgi6buWGx/uxTjXeLNTkiXYvZaaPl/V+Dx9AZXOzDzjjzuaG21F4NeN4IupNt9aLn82ewR8P
	cbXKRxIKKrYnndsUFNaZS965gydrADIwgvw167vBW6tpM9JEzJq7zaxHveyxj8=
X-Received: by 2002:a05:6000:2304:b0:487:b32:9d6f with SMTP id ffacd0b85a97d-4870cf25729mr5407208f8f.22.1789602754931;
        Wed, 16 Sep 2026 16:52:34 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm11861104f8f.1.2026.09.16.16.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:52:33 -0700 (PDT)
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
Subject: [PATCH net-next v16 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Thu, 17 Sep 2026 01:51:34 +0200
Message-ID: <20260916235200.20712-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916235200.20712-1-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
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
index 0e04d92d1b09..35e20ddd018b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9755,6 +9755,15 @@ F:	include/uapi/linux/if_bridge.h
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
2.55.0

