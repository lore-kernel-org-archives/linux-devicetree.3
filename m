Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A368525A97
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 15:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904668; cv=none; b=gwpZEgBsCK++A/20tWcp9f0b6PT1bIWJbD/1kjTs2H3+Gq0SVUbLvWU4f9BPv9d0skE6/NWbX6WNLxw2mmyu9Pu5MdBxpb5wthW3njWQeWXDlspSreWA/1eCzaw6OFZ3L/Lr3qkAhMqa5yC79PtXnLuybYzcuuaw6ONsFs+Haic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904668; c=relaxed/simple;
	bh=gkLhZ9o7hxqWFSpVSb8hHClkkDfQJUhvSWSxQoDNUQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VwZqO3W51I3/N2PWErnGWJC77BnBEV3HiWzoCycv7WvUuAoCFI8mkdwy/kkszFdW6h69Jr39zbgC6crEHEPxz8VgGlCPMcpvvO3k2viHoNwnJU3a6nZIyf9ALqwnqWnrpjfcsUvDfzr/kapqoMVn1twjzwaNRYdcvG01xZUDAig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=q+6TCtDd; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="q+6TCtDd"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso295535f8f.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791904663; x=1792509463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vQDRTMDHo67Jv1aCF1efiajgwTxDzdnW3ZpdVhzeRvo=;
        b=q+6TCtDdyx+D+4o5kjx32yArBOBzGdoUWgw+VVtVXLcFtCUCsZDqY+FuNTZkKXJbzN
         Iju2M1iTDeXrOXniJX/L0EhI+zMmZLa5ibbVtdylanfFS5PT5/Pu9V5SXWBGEL1q+Ajl
         tQZce/AzD78qpTCHKdBReuxrWIGdTjgUxEkYgSfS61kEslGzQbH7mw705vdDUOIO66Kw
         TCLruEnuuNnqrpDKVV0tqpGFAn3p61/Oo8McT7cJL16retL5gbq9X1i5UqluwdE01pdk
         NQ5oIvqqhv3tTruB5aD4FjJcZM+XIP2msIuL8kxeRHKqtkoH0a9J8RY0ETa9U8QY8KkK
         UBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904663; x=1792509463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQDRTMDHo67Jv1aCF1efiajgwTxDzdnW3ZpdVhzeRvo=;
        b=PYz5Hj0RrQWIsjG77gRa4LP4xzej7WD8Z83Ly1ITZs+d7hs4379SIZ9xdk9FjM+g5G
         uUK4EcusbFob4sW+On2oTUScp4jDA9LI9Wtu2mO5Pfn8uYgdUljN9PWlOwxluvwXE3/L
         YfmNFdbt6IGcHGEdgByDQeh3DseLHQ8xch6TMJZuGk9jXzV316q6lADTdc7Labq6KxPa
         d0iUnRXi92mbAGvoM4dgJ8kPovjmgM0CPRz1pL4l6sXR7fOCDPvYYYXQiNg3xCsgiNxn
         UIMtqtLY2wbGfCbaQ6cHiHjLkX39lm/+B9UGtt/6BSsFhhd5R5cdBQM4lHMdCIjffLXU
         73nA==
X-Forwarded-Encrypted: i=1; AKwUvBwvFCj2qW8AcXunMh/5EJ7mgTyhatrOhQWWeuGXgiLHcaTpl5RHmQ3Kad9nK5zo6uxcKaavXcOlF6Zc@vger.kernel.org
X-Gm-Message-State: AFq9FYKNw/HPQ8PUScloout/jzDIjHju/OpvBeBmyYNpvgtuTfEdKz1f
	qmO9Z9oYEQ3BiR+DZnKxuSkFolFzHKyEqUGsUFidHbc0Kv9j+HpmejJVZXJY49BLggg=
X-Gm-Gg: AYBFou2RtUHwZpyLpUA08BttlMOjG0rJwlLRRbRXBcaO//THVgNNv3gs3bHzxThHKYC
	LFjncOB/DW/gTwq+rYOSsQ1BufuQXMK0r7X6SroAcyVGxoHz+TjRpZDZY2gRJkjm8K7npcOhpad
	NCrAThs3yMVCroNwbcwFHqQKqaQ4SYEy+BlxbBbMDvzBog7OCHhXSXk0NLAf48wb+xZXDd+vrk7
	8zQ3k56AQ+GGWWIVzftr5Y+ILx74qnU8AZ3JhMct1cH+oRxHd+zlJB7Du4mBYFi6QUckY+/8LAj
	gMngFVM8V1oacFDbeLxJ64uvMrLwR7Oslk5TgWOB1hlcyfQzbINAbpAQkkoQtxBND2Woi+VPdnG
	6xCewoVRO3a6dcQggJLjiEk2nDAUdJ/wPJiYAtSdARd5o5VIR8ov9BToq1Pl438l4duA7cX+FZK
	HVU7i1WJo2uqc11Pqq4woIfsXBgeL8qDKjXQIm1M9YErUFVbBAD7nFbzIDi0xHyhpOHJQGmyi87
	pV17IZQBS0LtwmKws39jn19nQP3r/16ZcPKloQwuzmN2zg/3w==
X-Received: by 2002:a05:6000:290b:b0:487:2805:6834 with SMTP id ffacd0b85a97d-48dbace156emr23493781f8f.42.1791904661225;
        Tue, 13 Oct 2026 08:17:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaabb8sm6529743f8f.15.2026.10.13.08.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:17:40 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 13 Oct 2026 16:17:01 +0100
Subject: [PATCH v2 02/13] media: sony-starvis2: Reorder link frequencies to
 remove lookup
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-media-starvis2-v2-2-3670722d250a@raspberrypi.com>
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
In-Reply-To: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
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
index 84e77aba92fd..c7fbc5c132f4 100644
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
@@ -912,7 +901,7 @@ static int starvis2_write_common(struct starvis2 *starvis2)
 	cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
 		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_DATARATE_SEL,
-		  link_freqs_reg_value[__ffs(starvis2->link_freq_bitmap)],
+		  __fls(starvis2->link_freq_bitmap),
 		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_LANEMODE, starvis2->lane_mode,
 		  &ret);
@@ -1161,7 +1150,7 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
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

