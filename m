Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795496485;
	b=jPKkh87u/IEhMz0eisoqgqKOnmDC60/73w9PF8R2hT1XN9XFzNBaIKEdgcwQFdow2Tzc
	 KGZ6RhG7TcSH8JIlp5RnNH9vT8/l0LTU+zITF5X0+iOJHL6RRTbhXm6z+erwsQooe/yfd
	 wQQI4GSADi6i7Ey+MuU1MlGLxL/kF8AUfM/0qa/bHsVsmW07R966tncOEubGv0hV4xXUQ
	 FB/okQ7qioXjIc/A7VTEh1y7MTGlJelMhaN6hgo3Ip23OGfSlbwjiJPN+qPIjSMrvk876
	 pIQ7ElRyq9IRya+TvHxVZb3KUp4ycjGDMXSJ+6NE1DyrwkdCPIz5k1M44wBWkveOfxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795496485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Vs2X3vFXBgQuWTNtNhfJh5Gfnrco9rGsYZYJIbU5LNg=;
	b=QDysQ44Q4OB42XTCnxMyRBzzZ7c/d80sW3+wDkP42psweAjAJQ0kPPiEVuxDvvgMRNpW
	 ZlaK6o1MjY4vTF6WlnvBln1X4RNstGEVrgY01hEW5a50fc0Wf3vZgJodJ2/JwVXYDe1k7
	 LV0Cins75BqRS5JM1prY/GCKAEeD/JKCHjppOaJ6/HE7iCunY7iVFd5swIVcQ/06xraE2
	 WB6mg1pjwpEOnkCJVmpjGxqxNtwk75gpedTdPTNYwvrbckIsGW9A1SPrO05VNGlwbGRcb
	 iKmfVIXBxHua9CWrxFi5tT4Em4v4suZp9vAA9MmfM952gwY44S12O19vXuVrM4eyvQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WuzjfOOG;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC652606A33D
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 05:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC652606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WuzjfOOG
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb606491faso22242635e9.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 21:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795496483; x=1796101283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vs2X3vFXBgQuWTNtNhfJh5Gfnrco9rGsYZYJIbU5LNg=;
        b=WuzjfOOGCFqsF4B3uCWv0lke2vzIM9DvBzCEPmRRrrzCd7ohSU3hsTghjaUrgjmfTp
         0E5gMNbVoB2y1lM+yCa+wksZXyC769hqiOYKNJeEAla122fcwpjLQABYCXczYetuPOOB
         889d5I8iH/ON/RgIWF+e8y8WrWb2SjuuHJBb+I0cWD5YohvpMCPQViGqcdS4RaWqzFcp
         sqofC67CEdG7UJwWLcZjZRSkXSsuabAyZ5KlaYbhFyx9gccSAp8zjz76Vp2+wzvVPOB0
         CBbhZbGNlyztzF+qswzGw/Sh6VzK/FcEXgcE3Liud7l0vScsp425Db3eXu5l3B5+gkdR
         tfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795496483; x=1796101283;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vs2X3vFXBgQuWTNtNhfJh5Gfnrco9rGsYZYJIbU5LNg=;
        b=keDW51nbcswJOJjE7tu9ll/qKT3iuvFB/wJsxQs7jnngpiznTwuuKba5ITf2jod2Qg
         8LeeJ4eAueadXXWX0rsRdUdleCAu/pn4o3dNr+ILfBcpitS6IrvwyFV9OzEVZDIbn2uB
         SWuw2fmhUPYMrSQNhdQy9Fs+Ihw1fgOI957ZqKT4sX6U8aM8ZJKATGmOlXNzwfKCrgD3
         +hycvjaOx0FK1pHHanVakNIB1PEaOcd6zESewyc5Kgk1NBPIITPsrvBOp8TBcV5Q17iU
         1whEeB5nq/8s20od5x3zbPsHteBDP7oNW6RUThbCy/YSkw8xFi2tPUQtADuuBnZV5Fio
         djCA==
X-Forwarded-Encrypted: i=1; AL+hErGj4FQtQytnbGVCU8iBgMgDWLKVg1w54OzuiopS2AxMcVJHUuBwPNjhcbE68BSSHW/uEsFSdo1WYlKF@vger.kernel.org
X-Gm-Message-State: APuU4Z+bRJfxGhH7nvedzkdqX9SwFAs1fzH8sQGHE/RxbaLerRWmLnHs
	VxSZilJUC8++jTJyjG4jPCk70ZKkIKsmJ95kmTJX1iEYMetcybXdNeAX
X-Gm-Gg: AZFdTZfe4MAVbJw2I2dBO9H+yTv+LdRVFZo0c46TH7rq/7Mh774zlNWjOCR+Zhp+AfX
	HYTjavu39sMNT+Enm627yi96+0RLkCAZPuYN3BX39FPvw4WOEfmCxm2Fl0ECIp6xq0mP8PmqOw/
	Ypv56bxDstPyUFuSgwMbi16Y/BjJ5DAAXdPpILRzhdDSn21lZDMHwbJosvOBcTE4EdFETbmP0a7
	OKwyAa/5QbQ7/+qeik/Cuv075xNo1kassfLs+rq8d471kqde8BgafnImO0QF4cRXqTsf/QAl5m2
	vMMfiiRDJtnbKALIafwVYCAW4Md2IXgp6oz1pvXrVHxp31Lx8J8JXxpT0hGjvXGStrumn9tolKT
	JCeALoYgWNsExLl2SfoeFnMpg1WOE3+D4+Wvcm4IIYD87bJ5htiBM36WC9a5vnwIsPGH0ATmNvh
	JpEWwoFJhXOerR0J3GjCagF116u3MagQkAKz/oAQUmaUTAPDKTDeyfAVeXz8Ih+xRyFrWHS6N/0
	n2Wn0Y3hjz6NHIXg2opyLjMAfsFlKSTxQUtk3pLuondc4nfRdw5n8aTHLQOleO8d5f27vIorbJ5
	qn+xlSq0iIDUd8L6/fbVmlAq5PNE/M0oZbAWSotC1JGm6Igynmps0hzLu5vnMN8LVQOc+zQkR6L
	hVXHyymdorAhjnhZh1T109I9VQQKh9MSlhOjCVOBnIQ7i0ri4JX+WXOF0m8N/QJVTWt4tyyBxeT
	kdjX39+wIcdPGKlt+wfgxmhNvu+IVL2FPLQtDE9pbTIphoge3GC81T
X-Received: by 2002:a05:600c:4515:b0:4bb:659c:b8db with SMTP id 5b1f17b1804b1-4bb88813b27mr278328245e9.12.1795496483167;
        Mon, 23 Nov 2026 21:01:23 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-f512-85ee-fdbe-0621.ipv6.o2.cz. [2a00:1028:8388:a84e:f512:85ee:fdbe:621])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm353489155e9.1.2026.11.23.21.01.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 21:01:22 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] watchdog: max63xx_wdt: Add support for specifying WDI logic via GPIO
Date: Tue, 24 Nov 2026 06:01:17 +0100
Message-ID: <20261124050118.87944-3-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124050118.87944-1-pepe.schlehofer@gmail.com>
References: <20261124050118.87944-1-pepe.schlehofer@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pali Rohár <pali@kernel.org>

On some boards the WDI (watchdog input) pin of the chip is connected to
a GPIO, and only the SET pins are mapped to the register.

Take the GPIO from the optional wdi-gpios property. When it is present,
ping the watchdog through it instead of the register.

Signed-off-by: Pali Rohár <pali@kernel.org>
[pepe.schlehofer@gmail.com: use wdi-gpios, request the GPIO as an output
 with devm_gpiod_get_optional(), ping without the lock, include
 linux/delay.h, update the header comment]
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---

Notes:
    Changes in v4:
    - take the GPIO from wdi-gpios
    - request it with devm_gpiod_get_optional() (Tzung-Bi) and
      GPIOD_OUT_LOW. v3 passed GPIOD_FLAGS_BIT_DIR_OUT alone, which sets
      no direction
    - ping without the lock, with gpiod_set_value_cansleep() (Tzung-Bi,
      Guenter)
    - include linux/delay.h (Tzung-Bi)
    - print the error once (Tzung-Bi)
    - say in the commit message that the GPIO replaces the register for
      the ping (Tzung-Bi)
    - update the comment at the top of the file
    
    Changes in v3:
    * Use gpiod_set_value()
    Changes in v2:
    * Usage of dev_err_probe()
    * Fixing assignment of wdt->ping
    * Remove clearing of wdt->gpio_wdi
    * Move YAML change to separate patch

 drivers/watchdog/max63xx_wdt.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/max63xx_wdt.c b/drivers/watchdog/max63xx_wdt.c
index 9e46b86b9b20..482cf9f6bd6e 100644
--- a/drivers/watchdog/max63xx_wdt.c
+++ b/drivers/watchdog/max63xx_wdt.c
@@ -7,8 +7,9 @@
  * Copyright (C) 2009 Marc Zyngier <maz@misterjones.org>
  *
  * This driver assumes the watchdog pins are memory mapped (as it is
- * the case for the Arcom Zeus). Should it be connected over GPIOs or
- * another interface, some abstraction will have to be introduced.
+ * the case for the Arcom Zeus). The WDI pin can be connected to a GPIO
+ * instead. Should the other pins be connected over GPIOs or another
+ * interface, some abstraction will have to be introduced.
  */
 
 #include <linux/err.h>
@@ -18,6 +19,8 @@
 #include <linux/kernel.h>
 #include <linux/watchdog.h>
 #include <linux/bitops.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 #include <linux/io.h>
@@ -50,6 +53,9 @@ struct max63xx_wdt {
 	void __iomem *base;
 	spinlock_t lock;
 
+	/* optional GPIO connected to the WDI pin */
+	struct gpio_desc *gpio_wdi;
+
 	/* WDI and WSET bits write access routines */
 	void (*ping)(struct max63xx_wdt *wdt);
 	void (*set)(struct max63xx_wdt *wdt, u8 set);
@@ -155,6 +161,13 @@ static const struct watchdog_info max63xx_wdt_info = {
 	.identity = "max63xx Watchdog",
 };
 
+static void max63xx_gpio_ping(struct max63xx_wdt *wdt)
+{
+	gpiod_set_value_cansleep(wdt->gpio_wdi, 1);
+	udelay(1);
+	gpiod_set_value_cansleep(wdt->gpio_wdi, 0);
+}
+
 static void max63xx_mmap_ping(struct max63xx_wdt *wdt)
 {
 	u8 val;
@@ -226,6 +239,13 @@ static int max63xx_wdt_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	wdt->gpio_wdi = devm_gpiod_get_optional(dev, "wdi", GPIOD_OUT_LOW);
+	if (IS_ERR(wdt->gpio_wdi))
+		return dev_err_probe(dev, PTR_ERR(wdt->gpio_wdi),
+				     "failed to get the WDI GPIO\n");
+	if (wdt->gpio_wdi)
+		wdt->ping = max63xx_gpio_ping;
+
 	platform_set_drvdata(pdev, &wdt->wdd);
 	watchdog_set_drvdata(&wdt->wdd, wdt);
 
-- 
2.54.0 (Apple Git-157)

