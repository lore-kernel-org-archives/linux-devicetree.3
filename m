Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4948D541E47
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 15:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079873; cv=none; b=oGLsIWN56EsJRlt7xAT4p3vCWPT3HXDaOsMgCARt3f0TgQ+2EJCVSZ4ctMyOfssp9obAADpn4GkZXxID7pKrgJkXHtVkseYG5CWAT8+zL4WwHGqGdrhB8d8vGnIvFJzqfhbqgPfQWR0gufW23nD3hE570TkViLfvZINlJlgb6Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079873; c=relaxed/simple;
	bh=zKSuXRI8aMna5pQ3QoL4QnTlDfII69cLtILjo3bnSvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dwTaUPuT7TwDsFFNPSKPMcGA+6gSqPiaqfHY1Ft19NGcELigd0KntkNE+d/1Pm73I/rZqkC4FySdioERp+XlCSvDubYep5YxtH058hlKwhJGUr2eC9wJ96P4vuwp9E/uUUCLhtFbEKYD2q5AhBbkkofMQ5uIbwONaD8BUgbGlOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=bdVv/nnT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="bdVv/nnT"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so34118215e9.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079858; x=1792684658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4qkq2Ot5KdEpoUe+1OGX5HpRdoidJ8DEnSvKe5Kbn0=;
        b=bdVv/nnT0TWRYBsu8qMDYMEMbhkUHp4+4SENDSp1jSD6BScBr4+OuOqbdwBz8eQmgp
         lW0Jn0vJZcFFMQQ9VhsA+Vwc9st6oFknMCDduXt+sZvs4FYSqPaGS5e5rypTdlR2cCG5
         hlQtMn8cMlFGtA+LNmftZiwCzL8mk1xrAGbBIZwoF8Rg2A/ZEDnkUARfvJ5uU7wMTGoF
         uK5QcGIEgsccf9/VebidNitFzjNemMV/ZSYGXm/X+H1fSihMivWIoN12re9AGpOMDQcA
         AMLdrTybGfTWgOl7DqD9FOwumwGcFwnSZIwbKxKlzH6xzQ18nIMOBLpT915ixG8Qag6g
         UMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079858; x=1792684658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w4qkq2Ot5KdEpoUe+1OGX5HpRdoidJ8DEnSvKe5Kbn0=;
        b=ZvONFqHU6YZ6io31Hks6vXM65vM0CP3P4+tF46ugHVytwKw3Zj/+vuK/7BZsGAwig7
         IO6EoqMCqvg++9eg3x2Zy1gtJc5og6IJWP1XoCgtXU7F1IP3CiIR2tWij9gdGqK6uOUR
         Ch6I5nfwcn9vc96qpUJuaAJabjT7lDxJNP1CFB3lMEbZW3aOUQYUKcVmusi1tIiSgFTh
         h7pffwBCuyumqnONTSVqBDmq6V3bS5RtzKjvsCfmQDoK9EjRC7vDa8wbDkisaxaMg+9w
         WAP5PLhhwJOBGoBUkoTDQbK2uJsJmS5BBuKKE26fw5V/PFkAIl8vESqSFETOFzbPkoR0
         PChg==
X-Forwarded-Encrypted: i=1; AKwUvByVJ41g0WlKkcW82lI+MgI855VLjp9P2iDmr2BnqIPVxYmAClDvcLORz+A7HFRoucLvEOhA2ioqDpU2@vger.kernel.org
X-Gm-Message-State: AFq9FYKUYdjXWYzVTaTfi8udVvGtUFtDPCtMuIHiTL+ZVwj7JARQAiiX
	BnG7reGZ9YGFhmOZwyGwxHVv8smURbMilj2PUI19jqBhZFCV4w0AB9oJkHLSN6HxQHc=
X-Gm-Gg: AYBFou3cGDDMPq2Vq+1YOoL0YJdLN/BbCJQ+dqWMqyS+xdvrQYUJ27AsA8wHhjVUCfn
	ynvHRu8QlOzWW2/Nj5rs8wh8lv0P8IpsgBQ2VMVSpzaVzzzCZITTVIhSRWdCOh1FmaC587Lztee
	JltLdE9UAF3xdL47PDbn8np7j39sQkbMcg0imKNnqZFC6aZSkXOY3K8DLJKw/hGEZMNYZkvmwHc
	bHVWzu755t4hVRtDo76OFDZ+xPrNLs2N1PcaR5sdAUEyyLeV6Rt1htOcd+GRNk1Pm2F228aa9Lh
	DuxlPWh4H/YjMqZUl0Xhn/hl04N0kXENTwJ61qVp5puAupp6ZeWq+zSorIfATET3u+YUlkzlN+8
	gIMlYSx9SmCQKdc35F8J9OJyk6ykJuMgC+mMMlt8+wiW1odNA0FX1nOGGhJuEkLxr5MGn3kmoqF
	hHS046ZkdjXJBgquvn1hwo1UxU1x06v2BKJAg4VgQvX4ktLuq8MtTIAnpUB3uRMK00uAEmX6vC6
	624lkp6Sc/omTrobxPNRVIl/dJl8sJaHqtTuFQmbDAV0jBqKw==
X-Received: by 2002:a05:600c:c113:b0:4a1:985b:83a9 with SMTP id 5b1f17b1804b1-4a1985b87f5mr234591235e9.4.1792079858432;
        Thu, 15 Oct 2026 08:57:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:38 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2026 16:57:28 +0100
Subject: [PATCH v4 02/16] media: sony-starvis2: Reorder link frequencies to
 remove lookup
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-media-starvis2-v4-2-75fcdb4163f3@raspberrypi.com>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
In-Reply-To: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

link_freqs_reg_value is table that just reverses the order of the
link frequency enum.

Reverse the order of the link frequencies so that the table is
redundant, and remove it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index b4733990d03a..3656658e18a4 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -186,25 +186,14 @@ enum starvis2_lanemode {
 
 /* Link frequency setup (DDR: lane rate = 2 x link freq) */
 enum {
-	STARVIS2_LINK_FREQ_297MHZ,
-	STARVIS2_LINK_FREQ_360MHZ,
-	STARVIS2_LINK_FREQ_445MHZ,
-	STARVIS2_LINK_FREQ_594MHZ,
-	STARVIS2_LINK_FREQ_720MHZ,
-	STARVIS2_LINK_FREQ_891MHZ,
-	STARVIS2_LINK_FREQ_1039MHZ,
-	STARVIS2_LINK_FREQ_1188MHZ,
-};
-
-static const u8 link_freqs_reg_value[] = {
-	[STARVIS2_LINK_FREQ_297MHZ]  = 0x07,
-	[STARVIS2_LINK_FREQ_360MHZ]  = 0x06,
-	[STARVIS2_LINK_FREQ_445MHZ]  = 0x05,
-	[STARVIS2_LINK_FREQ_594MHZ]  = 0x04,
-	[STARVIS2_LINK_FREQ_720MHZ]  = 0x03,
-	[STARVIS2_LINK_FREQ_891MHZ]  = 0x02,
-	[STARVIS2_LINK_FREQ_1039MHZ] = 0x01,
-	[STARVIS2_LINK_FREQ_1188MHZ] = 0x00,
+	STARVIS2_LINK_FREQ_1188MHZ = 0x00,
+	STARVIS2_LINK_FREQ_1039MHZ = 0x01,
+	STARVIS2_LINK_FREQ_891MHZ = 0x02,
+	STARVIS2_LINK_FREQ_720MHZ = 0x03,
+	STARVIS2_LINK_FREQ_594MHZ = 0x04,
+	STARVIS2_LINK_FREQ_445MHZ = 0x05,
+	STARVIS2_LINK_FREQ_360MHZ = 0x06,
+	STARVIS2_LINK_FREQ_297MHZ = 0x07,
 };
 
 static const u64 link_freqs[] = {
@@ -913,7 +902,7 @@ static int starvis2_write_common(struct starvis2 *starvis2)
 	cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
 		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_DATARATE_SEL,
-		  link_freqs_reg_value[__ffs(starvis2->link_freq_bitmap)],
+		  __fls(starvis2->link_freq_bitmap),
 		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_LANEMODE, starvis2->lane_mode,
 		  &ret);
@@ -1175,7 +1164,7 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	const u32 hmax_4lane =
-			min_hmax_4lane[__ffs(starvis2->link_freq_bitmap)];
+			min_hmax_4lane[__fls(starvis2->link_freq_bitmap)];
 	const u32 lane_scale =
 			starvis2->lane_mode == STARVIS2_LANEMODE_2L ? 2 : 1;
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);

-- 
2.34.1

