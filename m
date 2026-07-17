Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391A93D9691
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 06:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271326; cv=none; b=e1HMAOQemuVTvFp/ylpTb3y6TtC73j4FnxEfNzfuAKSG7B/256IcVo/A94B/wRRz9/zx7Rq2iIAeh1uA5h77Csv47+9an7IJr4jHUIvO+lvv7xkdg/0h/5U4+PyyA7bOI/T/29qphG9ccCMwY1+iw3WGSyO77SloSHLn5QNkt4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271326; c=relaxed/simple;
	bh=rSkcPxlDmospi87HHpmbrQ+oifpV2RxCLNsblYdSW/s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DpAHFNUeIk2IG7ni4G1ywE7G0NcGWTyZ0u6wqERa0If83FhGLPlIcIs9za8huTXA2cYtVd5TnsCd5D42mKt70JoqRiU6VpecvUmwt+Sqd1OE0sAMkcU2/YUBMdkGDwmkmYU0kvAdzKHJoRHIeTTg3UWxZ2Lga+p4TO/0gzaSd2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANC7Rflf; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANC7Rflf"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49544a80b9dso7790495e9.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 23:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271322; x=1784876122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RH5Rm+VqeCudjfRml6HtxpQ7RLGC9UFpnfUcRZ/Bi4M=;
        b=ANC7Rflf93ySjwIQE8A4G7NmOn8y0cSY4oEQ0a+yp+EEw4+hbR2YBPp/u5GVcdWRoG
         tu8xX4kRotvENx1ZBkVujMVUDziSfaOVo/xItVWfCUH8mIaCy3xXfy+BQJHI+51pfpt0
         w3+i54XLhxdusWbMos9UrXnQhI1C9eCiregdXVzE2PxMe5xjNmc75E3Bgj2HB8Mh+WmD
         DtzKVvpG67v+6BRaIA1tYLAHK3sYY+cKb/YtkQ5jLHTj1MZe+xX9KT4LlQMaNKLSylpJ
         0a5vOVHWHh1TfPNeNgV4tyAlbwXzXdDJTV0IxR/6SEz28bfnA7LeznPAg4B6BsCgyUyE
         72Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271322; x=1784876122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RH5Rm+VqeCudjfRml6HtxpQ7RLGC9UFpnfUcRZ/Bi4M=;
        b=Uh5n9JadhxajISh1SiyRWhxDomXeoMEOp1GBmlqAO8AHau9ygqNBCEa0sdIT/rmKx4
         iuC55ZlcEP5mMCUFNsWlgiLfKyX9D7G+Brh6vybrUTQgvVxBDDzk55l7KgylcvdL3f3y
         vg22lTHDHbbpjSngizMnIhuNRiWF+dNPRW8SYrq2fEWl5SDerRWnoiRcO/jteewF9F5+
         PVTQl2lqf3xJEoqfmJxMeorWM2gOx2D6NBN2+5dLyKZw3Fve6hsDyZmltmN8nB1RjaoL
         deDCcIuptRoXublclgEDCxbj6+hruV3LaSCsTk3iptqQ1otuRJyaR+6z9kEb8IrplR6j
         Hj6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp1ShUQOEwlhkfa1NZaBtRpw9ux4Y4H3Uy0OhVHNI6wJa7UQrAs6KCjY3CNlBXzvBDTf4EW/OEdm2Dn@vger.kernel.org
X-Gm-Message-State: AOJu0YxoigyU7c1JsgXe1h0LJkwm4jdOEgmdFHkS5MGPmGZKkvGATOii
	q82o9G1IAeQlNWo4LN+BDn9Rm7y0XW4W4A9gc9QfQQlKF8CnuGu4EzcH
X-Gm-Gg: AfdE7cl1TJWU1XHNTGGU4wWL136bP4ePDGzX97zzeRvK9uvPdNu9lKZ7hiHKLg4j0tT
	wRST3XYKvxfXOYZCNqBrbfu5RNHhUrcjQvBG5Cc5wMwH5kvPtkTc2wZtk7nYZ5YtVWVCqof54hC
	9+gQ8KFXxtTt9V/fJYNyvzu0VAFiZ8gGbaunPuTft6mZInVzmt2TV/Ka3V7BRe+UN6OPmZy4ZZZ
	XB6w/QitP3edl5o6GEQPS3Lcz5nM7KnGYcXQL0IERO7pdlVHynRz2BJdKRwdY8ObFtWwg3x3kTN
	nDJXrYumi5ICwHvaAq59sMJwdAr3fUtLm6m+VsVruuW3lS2X8Z+bGbyEEDGd+6yPA7PaBGGq+VJ
	YjG/VQ3qq32lYG380Pqm660BOi5JfjA3LIwUanNCUsnR0VMUsCc9hHN2XrHJ/jVyKhn6ji0azAy
	7S7wjdWVsPM8uXULu55PSA4e6/tfdj+2CqZIjg82hZ9bLUfDehtc+BkPCl7MYphUl7B+RGtA==
X-Received: by 2002:a05:600c:574d:b0:492:4a50:41fe with SMTP id 5b1f17b1804b1-4954a405e58mr9272335e9.22.1784271321433;
        Thu, 16 Jul 2026 23:55:21 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-495499f3f99sm24260835e9.0.2026.07.16.23.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:55:21 -0700 (PDT)
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
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v9 07/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri, 17 Jul 2026 08:54:07 +0200
Message-ID: <20260717065448.1498335-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717065448.1498335-1-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
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
index f3218abefd0c..51704a90ca46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9682,6 +9682,15 @@ F:	include/uapi/linux/if_bridge.h
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

