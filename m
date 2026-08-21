Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6246F4195DC
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 21:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787346752; cv=none; b=oSyTTH5FyYQ3WLcAsap3TUaMByB7I4mof55/SPsYJldI8Ekx7OOu3SJPp4FWJ6xR+TY5ap9oMG88QneROLJRBqt5wIg5aXSgAD4t/92Olbpay/cbwdPVVP7FkUbEyO8KEqdoge1OGNFMDCH0JXkYN0eA7kQ3BX71vL0H+mxV0+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787346752; c=relaxed/simple;
	bh=yBObii33XQtUMDVLhg3tSMOFUhkADs9/f6LHaLvE8qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9xHVIZk53OJF9y2y01LKyxUr0EISr/QTWJ7H48DVgmzXaY9k4Zu1jyzwQR7Z1sb9ABccgSFF5YrR1XEsBrGgK4Fb6ZxX+rPpctROTR88L78lhQRwcHIZDvbKbmUxpGepk84//YhEg8BGF+5wkjOetkXGfIjHgObNsQLSyT5k/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ca2NyiPH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ca2NyiPH"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf50c6f235so17955745ad.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 14:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787346750; x=1787951550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fF5C2lxgka8/ldFjOYo/eP0wFxrYBeqRPIw1nyxaOJ8=;
        b=ca2NyiPHpK5c1eh75RVL34aHtY3cfEZhhklEXCbFt2HrTOz1/YKJm4PGh6yN12dRbd
         aKXQvcxEJmTQogVGwU3OlT4UA8FsHTqAhi5bhumVYFHIZ3m9ekcSqxj/dKUJwXCuhPKp
         pFz2QMiA7t5hdjkELVwDgpbm/ShZ9A0F7bJRkt5I5TmErXCfjnrBk1EslpqR1SIFZ4HO
         iv2pKG656ML3/uHCP+ZVa13Io0XzZqSGIxpWJ6Ody+DD+S04Zz+q1QrMpxKEfcwwSnvA
         iuKZVhqBnAr5+hIQAYNOzb2t3anP/dwKNet7th8mKhZ620ijoB9tJRp75//WNknA/el8
         h70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787346750; x=1787951550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fF5C2lxgka8/ldFjOYo/eP0wFxrYBeqRPIw1nyxaOJ8=;
        b=OoMqtBmkPxVulNpJKVm5mQSj7BZgwdHmPc3IN4Pa75tkUtZg7NpIfAfE3na0bOlRYC
         pmUu7XeeJa7tD2bv23MRT5EZ/E/flrHZS6LlvxwKQcI79TAIdA9XAIqUXEhE7gcfcj/z
         chaVKh3LZkRQEtwgSpWanfHektK46rxaH6iWpN1JLFkBiYhOQOpPWpauyC/AYajroAvt
         zLR9/u26ASBsOmHW6BraYJiQomXKzyCtVM+mljoNBNYVhQLDiZcpF6GT50EdVPBhmdI9
         vuFPvyFS5PWw+SadMKFaIB2EYc6SvC/QMfsAjuEKbJ24slt9r2MPLvJwVtK+6RSE3lCo
         7rQA==
X-Forwarded-Encrypted: i=1; AHgh+RqKLMIiBfQXp268k+0yOqF66qRg1TXdh8KhHUeoBARE809u8DhXbkbNzLX69b30V7tnZ7Yvm2nLfGw4@vger.kernel.org
X-Gm-Message-State: AFuF++mF2hTSlbUrh/uigpUY2E4jtQEul/WpLWbAlgkexWGBPl2Mhu20
	y2Go49+k/op/ak1hkJ2iSMUWczTkfKQME1VSVTYUe69hjtWNSxK8kXhC
X-Gm-Gg: AR+sD10I4n7L0ZNLw9l7uL1fsmFaQPqNpOmKG3srwGictOqlFuE9xFy22M2A+Yr/ox7
	Ale5oQCmTXiJ4MjzgF5Aj6GWCa5ubfc6AZU5+2JqyTv0gJ/z6Dn7brpsTxlAdP0R4M27lX+y9kB
	29FFYM0Y0Oyi6xUU18NjJf6jIu5B+AzsMFFF9c3MsdfeK3Rdxm3avHr53ACoN1r91ne3yPGWcd2
	zYQfkl6K9N6rqLLVJCQcyX264BjvYMESW/6UfIPg3ygKWz56wdtzWjDLq2usbC9RxkiXGvkgCRR
	JSvxx0zA3VcNoQQWrjPQ7W3jgBh2RNmdR12AokCa2NEGUDobslcWPR6iZJPvzN5Qf4Sr06AtH00
	Q6duAWwIMXLbBlDB3ACCMVAVwvcBafjPSTymwa0ifyZfUPHa0INbdYL6PZrz99Wb/i4yZY1Nmys
	cPMAYp4pb/57J+OGn6mRLdCTr3ZV7tcGvqOj42xP5aDtRxRkXP0EJ2nfEDtHtff2CZO1h/LkjCa
	gx9v1sJ3IQ8xvCoCY6ulugAruTzZMy/HvBfkTSyCO49CwNRw65oPTfAp8L+Mpi23lHUI3qtIF0w
	Mw==
X-Received: by 2002:a17:90b:3985:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-395c357d3a3mr15702940a91.15.1787346749757;
        Fri, 21 Aug 2026 14:12:29 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:194c:dba4:ea1e:d7d1:affe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf175399sm49755257eec.26.2026.08.21.14.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:12:29 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 15/17] rtc: rzn1: Add OF match data to gate SUBU register access
Date: Fri, 21 Aug 2026 22:10:30 +0100
Message-ID: <20260821211032.13554-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821211032.13554-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260821211032.13554-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/N1 RTC driver selects SCMP mode only when an optional xtal clock
is provided at a valid rate other than 32768 Hz. Without an xtal clock,
or when it runs at 32768 Hz, the driver uses SUBU mode.

However, the RTCA0SUBU register used by SUBU mode is not present on all
SoCs that integrate a similar variant of the RTC block. Allowing SUBU
mode on those variants would expose RTC offset operations that access a
non-existent register.

Add OF match data to describe whether the RTC supports the SUBU register.
Reject probe with -EOPNOTSUPP when SUBU mode would be selected on a
variant without SUBU support.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v5->v6:
- Fixed merge-conflict on rtc-next
- Added Reviewed-by and Tested-by tags from Wolfram

v4->v5:
- Renamed rzn1_data to rzn1_rtc_rzn1_data
- Added a print message to indicate that SUBU mode is not supported
  on the variant.
- Added a comment to indicate that the xtal clock is NULL when SUBU
  mode is not supported.
- Added Suggested-by tag from Wolfram.

v3->v4:
- New patch
---
 drivers/rtc/rtc-rzn1.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 33c7ef5c1eba..8c3dbbc34717 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -19,6 +19,7 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/rtc.h>
@@ -66,6 +67,10 @@
 #define RZN1_RTC_TIMEC 0x68
 #define RZN1_RTC_CALC 0x6c
 
+struct rzn1_rtc_data {
+	bool has_subu;
+};
+
 struct rzn1_rtc {
 	struct rtc_device *rtcdev;
 	void __iomem *base;
@@ -405,6 +410,7 @@ static void rzn1_rtc_disable_hardware(void *data)
 
 static int rzn1_rtc_probe(struct platform_device *pdev)
 {
+	const struct rzn1_rtc_data *data;
 	struct device *dev = &pdev->dev;
 	unsigned long rate = 32768;
 	struct rzn1_rtc *rtc;
@@ -412,6 +418,10 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	struct clk *xtal;
 	int irq, ret;
 
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return -ENODEV;
+
 	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
 		return -ENOMEM;
@@ -455,8 +465,12 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 		if (rate < 32000 || rate > BIT(22))
 			return -EOPNOTSUPP;
 
-		if (rate != 32768)
+		if (rate != 32768 || !data->has_subu)
 			scmp_val = RZN1_RTC_CTL0_SLSB_SCMP;
+	} else if (!data->has_subu) {
+		/* xtal is NULL here */
+		return dev_err_probe(dev, -EOPNOTSUPP,
+				     "No valid XTAL provided and SUBU mode not supported\n");
 	}
 
 	/* Calculate the duration of two RTC_PCLK clock cycles */
@@ -509,8 +523,12 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	return devm_rtc_register_device(rtc->rtcdev);
 }
 
+static const struct rzn1_rtc_data rzn1_rtc_rzn1_data = {
+	.has_subu = true,
+};
+
 static const struct of_device_id rzn1_rtc_of_match[] = {
-	{ .compatible	= "renesas,rzn1-rtc" },
+	{ .compatible	= "renesas,rzn1-rtc", .data = &rzn1_rtc_rzn1_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, rzn1_rtc_of_match);
-- 
2.43.0

