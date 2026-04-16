Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEF43DE44D
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 14:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776349317; cv=none; b=I/FemHYW1wEmXy2qkE+PX33dCVEqky43HfWLVxcia4mGdUsUTSQcKcQTMSYSpMPKI2V1tCDAdKBLYJe7jDYVv1bOYi/bMCpwgdSvFrUKR/BgD7QLijNt8ixbpGh7Bpx3DjpCZYuguQQ0ambRul7NBP64FwNpSW7IwAJ1Ftq5R8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776349317; c=relaxed/simple;
	bh=mAjT45WQhnjtVyYVvBf2pQ/QyrbZdt2tiyZOsc7r+ck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CkTK+G7+jsMqkOuAxsalxAmwGlQ5Uv5xRYPqfB6ilKJlBhL1H0ADuCS+LXyUdJVgjdQDfa/pszuXIOPBlEpo9ZoN00QWd1M9lp4r0BS352/kEsKGV2BtAznCX4rbdFoERMSBtQmcKJ3F8tbcbZw+Fk8N8M1iH6kB1Z7JjWDPSvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=K235CF+t; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="K235CF+t"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12c0ee23e24so723760c88.2
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 07:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1776349315; x=1776954115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uFu1DzNio6n1RumPdBhDerBBGIlEwFQJz0L3Q0gtmOw=;
        b=K235CF+t5eMvvDMUhl9C6BbtmbC7yCWvlzK11XOVOt1y2ghHNdcbvdC2WqBb9XAdq7
         U6EuokXEvhkqUGlMRqSup+F0q89Ydqzmn5sA+Up3n2/VUb1qC/CcuCffxvIVqBW/WBB3
         KytuiJhyxtUYE+5eVjtyslh80+BbAPX1sUPfuHn39h/jOtGfmLY9azcIpEqsrUH/FkRX
         kqi6oN40QQPoeumhfuefIayJEO4Qfo6BJ/LNZxhnmHwH8fU5DU3Ymr/Jqg+a/dQHyiCe
         AYX2Rtgue+sOktyWtWoz2J80eg+Egx6EJPFDvf/6/JKRG7E+TyrM/sAJM5MCszjV7Krn
         3wXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776349315; x=1776954115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFu1DzNio6n1RumPdBhDerBBGIlEwFQJz0L3Q0gtmOw=;
        b=Nhl9BbFPaP8Le4J+OCPV7lkC3v3R6rOJ1opfWewLIBrjuHfWvs/jKFGS45YgTHcGGK
         BoY/dYkfNpJiWKC22N9rzQ+yQ2xWEDxIsYans9VHDJ6kYjOesG5oIX3tMSp1PRj6x6GN
         SYxBqIp1uWt2Alg65UzegnjBZ7FI2xHsuOKvBaH0oALMzeHnUFaEoSiM5jm+j3Yp9tvQ
         R6Ad97OZjl7oyfhN/guhc2dJpNZHNz+GeoZIST4SxoketF2gWgaQm59si/k7x6OLZVcm
         IQnC0B4PQmgquA8KD3vl46WyS+dDs2g7H3NhTsfq5H4q4qFntpml5Hu9PsPCLveyOiUk
         zGYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/h1OVJQPxWz3C/VnVB4RH3hQANDOh3HsTYxx7vdOX0TbCmQVFiMmFecL34o3mQCYZtKeJQ0LlXXMjF@vger.kernel.org
X-Gm-Message-State: AOJu0YyzR9Or+GtclnGA0/u2+VtOwzdUoXJS38plL+6EqKQupREONylc
	oQjnpOuMoiALgk7r3T8QGJrP45KDls+rqRoAmr4SZY8RQv/AX/a9oRora0iumqS32A==
X-Gm-Gg: AeBDieuVRH7GTroGdhOvh5nQhvhw/3RE5oZT81SrebqTZjg8eP1n9mJUA+B13edFhnf
	9mD2nh265aeSeWPlwTybU4aj88BRC8q+wCjCKfEFsYRoAnErkrrOAWtbCfWS+YiisP8agYIyZr1
	jg75qfCl61JnuD9IB5HDAF8AsWFLVhKE/AQFYcvCkr/tCJ3igeqVj1yn2Hs6ld3OOT+sRuzoeJR
	UZe+ecmNG0lkAu9RsnC2fr05p+nsM7+u30A7gbRQ+UtbMqUlpNA0xVmvGa28Z1pwENK8e2UdEkv
	rHt8aBg4wek3Mm3lFFnSPBkRIYZUiyGahNZXyQ2j1acUkINtQFBlBopoDT7z1sTde+XflMKS6PV
	GBOLeWZEHL2z5Iq2diFb63aofU65eRhLf42uwThxeAgxAzrQY05uXW45inyGN8rvlx7qca7iSl+
	YLWwv8vEAe+Zoe9N/LsALByYAa7blgDXehPJOxa6FyEq5X1H+lYU7/KZGky14=
X-Received: by 2002:a05:7300:7495:b0:2c1:7ca:cec2 with SMTP id 5a478bee46e88-2e193539dd3mr726559eec.8.1776349315133;
        Thu, 16 Apr 2026 07:21:55 -0700 (PDT)
Received: from adriana-schoodic-rtc.sjc.aristanetworks.com ([74.123.28.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c605851sm7577478eec.9.2026.04.16.07.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 07:21:54 -0700 (PDT)
From: Adriana Stancu <adriana@arista.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Adriana Stancu <adriana@arista.com>
Subject: [PATCH v3] rtc: bq32000: add configurable delay between RTC reads
Date: Thu, 16 Apr 2026 07:21:51 -0700
Message-ID: <20260416142151.3385827-1-adriana@arista.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the RTC is used on systems without a interrupt line, userspace
tools like `hwclock` fall back to a frequent polling loop to synchronize
with the edge of the next second.

On the BQ32000, this aggressive polling can temporarly lock the register
refresh cycle, because the continuous transfers prevent the hardware from
updating the buffer. This results in stale data reads or select() timeouts
in userspace.

This patch introduces a delay before reading the RTC registers in order to
provide a sufficient idle time for the hardware to sync with the register
buffer.

Signed-off-by: Adriana Stancu <adriana@arista.com>
---
 drivers/rtc/rtc-bq32k.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/rtc/rtc-bq32k.c b/drivers/rtc/rtc-bq32k.c
index 7ad34539be4d..edce95eb328f 100644
--- a/drivers/rtc/rtc-bq32k.c
+++ b/drivers/rtc/rtc-bq32k.c
@@ -16,6 +16,7 @@
 #include <linux/kstrtox.h>
 #include <linux/errno.h>
 #include <linux/bcd.h>
+#include <linux/delay.h>
 
 #define BQ32K_SECONDS		0x00	/* Seconds register address */
 #define BQ32K_SECONDS_MASK	0x7F	/* Mask over seconds value */
@@ -89,9 +90,17 @@ static int bq32k_write(struct device *dev, void *data, uint8_t off, uint8_t len)
 
 static int bq32k_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
+	struct i2c_client *client = to_i2c_client(dev);
 	struct bq32k_regs regs;
 	int error;
 
+	/*
+	 * When the device doesn't have the interrupt connected, prevent
+	 * userpace from polling the RTC registers to frequently.
+	 */
+	if (client->irq <= 0)
+		usleep_range(2000, 2500);
+
 	error = bq32k_read(dev, &regs, 0, sizeof(regs));
 	if (error)
 		return error;
-- 
2.51.0

