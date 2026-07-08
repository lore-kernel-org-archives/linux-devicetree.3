Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218DD47DD54
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522167; cv=none; b=Xeh8W9mpcQxaLFYFzQPGQN2Hl66NrcRJt0KpBRKLDSUkVCYeBf/TsdGaEAZHXkCf1eTcK4ld3ur8cQHc5rzhN7W/aXSD7QDr4udu7aHGysEPl3J/TyfRuophnwnFFNfVR6brMBroREyHVeLypsIYkQMHUSo+lu9GurJp+B6jX8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522167; c=relaxed/simple;
	bh=Y13P6d/hP9MONM9g2M3JRHmmeNpDAlPRWKBNqbY3BGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=umxC+RIh6It5P3OkV3XiKc51rUEEKwxruBI/yMRiw3AmO0N7xyfurEPiZHqLhqrVt9kD9HesdSsBlKZPcSNbY2Hgc5HUve6IffR67M0sghaRueTsNTJjJSGURa2R1hmJoeVLqiuYxUHr8VNxVKVRNlsbS7cGDkVwa916sKgoCcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=HUCfkimA; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="HUCfkimA"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so4704355e9.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522157; x=1784126957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fBwAFnI0CLH29JbBAy6QPj6qdoZnqHm2ZK4wHLoQ3Bo=;
        b=HUCfkimA1v6FCYtk8yegJ1OmPmjcu8KtW0p2rWAW4E4uAgKYwEtLQq2KRMeR3hOu6w
         UH5hNbGD7oFQ8SThT4kgvRCKaz2Bri9ecB48au0OmF3tZtjM7wubirdVysGeQSVhFUCr
         qFdpvaQ9adc7STqVjSFTaz37yXWglTr79zdl6RDa8ppbb/rfIIRPPAEAmgVzrVDNA3ry
         3jVsJZqvAcgPTpfxcwG4mfYktKfBTZG4U1DM6W+Duj0TI5FM56YXO0/Bju0XluU0BZ+w
         clsNK+2McN0Y35fLQkVOl7R0FbMansg0NFCeI8LJPE+r12BCBtyT94ve7qMvB+h9RAnf
         j68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522157; x=1784126957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fBwAFnI0CLH29JbBAy6QPj6qdoZnqHm2ZK4wHLoQ3Bo=;
        b=NBoLxJ5fgPJOp7goZf+Nuk6zWF7xR1A/B9yhJJMzfYJ1bifQf/j/ontWtxUd4gjbkp
         CIKGFhTqMoTwPz6PUDsniwI37SWsF93/UNMoCwEzsHF+9HrnrdtDRH3UyPCBUaI6zqmg
         PjtFysBiVXgoAleRr3aPZX9PscNbf370RS+ouKua4M9Q9xTblFE8kxPPhwc3523ZNWX+
         DxJKDGEOgVZCWpG/cUxlqxeF81TdorPNk4IpKfiLaJCCtvQcCq60qk9LKSUdTYi4c5xJ
         iyKPXRyfxVsw76yL1crogbKIaAFmQhXDVwnWC21UMCOnQ1sPiNUEXHKp58OtuKw6w0/O
         envA==
X-Forwarded-Encrypted: i=1; AHgh+RoiX1ayfYIwNpQypZEHfmJzvfFbPtE/EzDscbY6pZkChdOfwXwuj0yPiD6NlgrifbzRw00lQrIpJ+57@vger.kernel.org
X-Gm-Message-State: AOJu0YxlqJQJHiTrpPi5flkAlUHRSKEidBPpbMY7YqmxSLBbl3c6Bw6P
	JGQGnp14SCWoli55oxlFnSsfQRnT4Z1Asx2KjzI1gFYxfMNFOwvJJO7cd0/YvusL+Go=
X-Gm-Gg: AfdE7cmXWTKogj9nCrlzhVV4xEE6kR0b2AnID2FInZXKE75Ur+FeaUblWUoHbaC115S
	jWmjpYZ5sJB/lVmu7qLqtxLGQg0WkDIIgMN+P8tnu48ZloO8KZvIFLKwlaqsfacxBVSYRIdwNjo
	BsEIIhxzvLUoo153yxKDSUZ7VE/fNXTtQNsrZiFeC3xhj8aEEIP9WKb4xAtaB+N7IiaP0+AlXsW
	7bnNx9gqqIDpXGl+8DSgjl1dm1K6xi4HH920LaN9GRRfu/aQAInIRkQq0/duAo4GTzwqpJCaVez
	rNjuZLeS8NvNpI2Iy7ETrvPk0EbmcXwldVCmrSXvCmSDi4PMfjvNTsepfENwpBRAA0uprletPfI
	Pws6okR9cexbDyTANILGeVLEv84KDKx/TlAzxCFkhyYvVurNztQUCEPpD5P7RZO5KBN+B4ghBTm
	dxVR/Az2nOJA4NHm4xFOuyYlsd5TG/A7qb4znlo9494V+cb7zA+bahcwG6dV7uUat9
X-Received: by 2002:a05:600c:6085:b0:492:454c:347c with SMTP id 5b1f17b1804b1-493e6859969mr26493025e9.7.1783522156758;
        Wed, 08 Jul 2026 07:49:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:16 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:45 +0100
Subject: [PATCH v3 09/20] media: imx355: pixel_rate never changes, so don't
 recompute
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-9-9df386a623d7@raspberrypi.com>
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
In-Reply-To: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The pixel rate is always the same, so there is no need to try and
recompute it in imx355_set_pad_format, and then no need to have the
pointer to it stored.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx355.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 2880e03b3f08..2a97e076bff7 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -151,7 +151,6 @@ struct imx355 {
 	struct v4l2_ctrl_handler ctrl_handler;
 	/* V4L2 Controls */
 	struct v4l2_ctrl *link_freq;
-	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
@@ -867,7 +866,6 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 	s32 vblank_def;
 	s32 vblank_min;
 	s64 h_blank;
-	u64 pixel_rate;
 	u32 height;
 
 	mutex_lock(&imx355->mutex);
@@ -888,9 +886,6 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 		*framefmt = fmt->format;
 	} else {
 		imx355->cur_mode = mode;
-		pixel_rate = IMX355_LINK_FREQ_DEFAULT * 2 * 4;
-		do_div(pixel_rate, 10);
-		__v4l2_ctrl_s_ctrl_int64(imx355->pixel_rate, pixel_rate);
 		/* Update limits and set FPS to default */
 		height = imx355->cur_mode->height;
 		vblank_def = imx355->cur_mode->fll_def - height;
@@ -1180,9 +1175,8 @@ static int imx355_init_controls(struct imx355 *imx355)
 	pixel_rate = IMX355_LINK_FREQ_DEFAULT * 2 * 4;
 	do_div(pixel_rate, 10);
 	/* By default, PIXEL_RATE is read only */
-	imx355->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
-					       V4L2_CID_PIXEL_RATE, pixel_rate,
-					       pixel_rate, 1, pixel_rate);
+	v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops, V4L2_CID_PIXEL_RATE,
+			  pixel_rate, pixel_rate, 1, pixel_rate);
 
 	/* Initialize vblank/hblank/exposure parameters based on current mode */
 	mode = imx355->cur_mode;

-- 
2.34.1

