Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7506E43B6CE
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 17:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443983; cv=none; b=YEYAzpR8EcMrW+JOUm7ub9Qp7eZMXNwagu9FYqPzu2rB2MilvDic0LWGh1kwV5BsBItjey6cOn1G0pK57Qw6K0y+5f3Amvsi48h2zW/fY54e0N7tRgjRutfYgmf8m/FifOYV4qIFhwSx5cLRYZ57XB8Sc4wr15W1AMmmF4gccKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443983; c=relaxed/simple;
	bh=HQJ/Ie+2S0zkCH8tb0YTK46iEh7rox5jpQzKt5Wwveg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hEE+DJ8rVfbTxnSa3EPDdEgtlEeO0Wpy2enS8HQY48L7dNxGvzTM+B+i7FMEq6fdsIdwyGHzjrYdqVLuOA1hqkBNrxj+yPxFS30WOn46OrQ+KLrp90bHrqkPXTocM+vmx3RuY0IvN9+90v43nKsIVwYnts8BbhBnp77xMiao8JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=dNY6G1vo; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="dNY6G1vo"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493e4cccd8dso1799325e9.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443980; x=1784048780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d2Cy3oDNso38IWq2Zx6vkOBXD0S6afSS2z3CCsQoqsM=;
        b=dNY6G1votZmk0SWmOxcUdH7DDlbJdHBpDfwiIWM5IF1o1VmCyThFw5a9KxSNqi3rRM
         toHiTDGY6iNdag8JMqah7uBZt/a37J6ik87OpY+GAJCIzvgCVZPlYx3gLIbZQcdDyuEm
         WIac6yxHChCPSRD2TV0VXir1fg8DU6Tmjo8zSJgyVwrWYFA5l7bpobAXW6jU5MNfzSCp
         Fsk4iIYqy8R011KBbJz+VDvEJbq9kbVMEHF0Am63Sa+YkYsfO/34WYWtv+mza3CXOBVp
         Uj1pGLOpFuOiCEyRdweEcsNVryzmeeTmtx3lIMT3+9JyjLJMp0gNRQyyvtqwGMjkoHx1
         VwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443980; x=1784048780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2Cy3oDNso38IWq2Zx6vkOBXD0S6afSS2z3CCsQoqsM=;
        b=lcnse3j0LtLN8TxN/NOx77qTYHMsTYefFmD15Y7pxfu/n53ASGegB4A1rizcfK/am6
         csjGTbID4k8+u7KR6ggFODXJnFBTRDLhXj18AN3luUlDmtmxIaQeaZJmAQSoNulInQhd
         pgNJlUxX9rfQMRkYcwA9sVS3KvxX+Xx36v+cRXAC3mMoRCaaOi0KwbHYL+gp9gXij/rW
         0jX2HiOyCObvPIGpXWv523xBpb2gSU4tgrOUo1ZNSVM+sb2brp47/D6RF9fHsbeklHqb
         ygWTpzJ/NhypBapbg/KwcjTB6RpaHGQUser6n+lRqDzJnk8jR/z4n28erUdzyPDxY+sB
         DvNA==
X-Forwarded-Encrypted: i=1; AHgh+RrB97JYnn0lV/J0iZIvn3Fy8ByRypz/iU5RQI59+MUO09yOoWC/87KmZahOsjiQSOP1QSwjSQSeQL3u@vger.kernel.org
X-Gm-Message-State: AOJu0YysApDGVt/gPD5FTgtiNnbeLL6oDUjsUcmPL45fRVIfugjWBakf
	/POmxcwv0hxlEB73XKXl9m1/WN8iXlrCXIPqErzrOKudiLVt8GHFaizEu7/t0S/ZD1g=
X-Gm-Gg: AfdE7ckHxC6xTNQsK1asytArptA9ZIhkfnY3pXfBcErvLKUxbyTRiz2AfA0nTK5OQDe
	ApixlJ8TA03Af0COU/l2Cl28lZLDS9nTvVdlo+sJvU7h6c6+vD3aB7rBmsmjQ8nsQLo03u0s461
	lYANiV87E4jWNdkUCpEn/nOmDD1/deAcpdVH26rxoudWpcA7vRXlk5daetwuTUedQyyvi9L+NGT
	mk7x/B0dqTEruC+tNC1adLJUYZnj3/dFQ9qj8RmjVOf0UwZaN2UuNjZvrWs2Jbb3PMoqsE6BYCx
	5lokIdYH+i2V4kuhGVLEfGZvq7AAOEWsP7kbjqkUu+eMjfKUXYEJWgVeqUcljGSaXm/QUin0OA8
	aUQDRCq5i5uvhehV882Q/oIBEVC6/Mm3nCalNnke+/92YqtTbaGMcPsRdIvXxqoF5VyNtpsBsvI
	LB1u5ctwznOCUWmMaDR3rNvX7KQ/qAAdIqRXUXgH+b2W3RT/r3pnsa0yVKNZ+qYBWs
X-Received: by 2002:a05:600c:4f81:b0:493:b8dd:9d68 with SMTP id 5b1f17b1804b1-493df041a17mr69949875e9.10.1783443979865;
        Tue, 07 Jul 2026 10:06:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:19 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:38 +0100
Subject: [PATCH v2 06/20] media: imx355: Set register LINE_LENGTH_PCK
 programmatically
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-6-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
In-Reply-To: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The driver already has the LLP value stored in the mode structure,
but also had the same value set via register writes in the mode's
register list. Remove this duplication.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 38 ++++++++++----------------------------
 1 file changed, 10 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 363b5667b6c9..66e70650e666 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -33,6 +33,9 @@
 #define IMX355_REG_FLL			0x0340
 #define IMX355_FLL_MAX			0xffff
 
+#define IMX355_REG_LLP			0x0342
+#define IMX355_LLP_MAX			0xffff
+
 #define IMX355_REG_X_ADD_START		0x0344
 #define IMX355_REG_Y_ADD_START		0x0346
 #define IMX355_REG_X_ADD_END		0x0348
@@ -259,8 +262,6 @@ static const struct imx355_reg_list imx355_global_setting = {
 };
 
 static const struct imx355_reg mode_3268x2448_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -269,8 +270,6 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
 };
 
 static const struct imx355_reg mode_3264x2448_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -279,8 +278,6 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
 };
 
 static const struct imx355_reg mode_3280x2464_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -289,8 +286,6 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
 };
 
 static const struct imx355_reg mode_1940x1096_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -299,8 +294,6 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
 };
 
 static const struct imx355_reg mode_1936x1096_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -309,8 +302,6 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
 };
 
 static const struct imx355_reg mode_1924x1080_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -319,8 +310,6 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
 };
 
 static const struct imx355_reg mode_1920x1080_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -329,8 +318,6 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
 };
 
 static const struct imx355_reg mode_1640x1232_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -339,8 +326,6 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
 };
 
 static const struct imx355_reg mode_1640x922_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -349,8 +334,6 @@ static const struct imx355_reg mode_1640x922_regs[] = {
 };
 
 static const struct imx355_reg mode_1300x736_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -359,8 +342,6 @@ static const struct imx355_reg mode_1300x736_regs[] = {
 };
 
 static const struct imx355_reg mode_1296x736_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -369,8 +350,6 @@ static const struct imx355_reg mode_1296x736_regs[] = {
 };
 
 static const struct imx355_reg mode_1284x720_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -379,8 +358,6 @@ static const struct imx355_reg mode_1284x720_regs[] = {
 };
 
 static const struct imx355_reg mode_1280x720_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -389,8 +366,6 @@ static const struct imx355_reg mode_1280x720_regs[] = {
 };
 
 static const struct imx355_reg mode_820x616_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x44 },
 	{ 0x0902, 0x00 },
@@ -1058,6 +1033,13 @@ static int imx355_start_streaming(struct imx355 *imx355)
 	if (ret)
 		return ret;
 
+	/* set line length */
+	ret = imx355_write_reg(imx355, IMX355_REG_LLP,
+			       imx355->hblank->val + imx355->cur_mode->width,
+			       2);
+	if (ret)
+		return ret;
+
 	/* Apply customized values from user */
 	ret =  __v4l2_ctrl_handler_setup(imx355->sd.ctrl_handler);
 	if (ret)

-- 
2.34.1

