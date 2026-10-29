Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283523;
	b=dpQb30v0ttTE6+pBLFvK1pGRHlmXYmuGHe810IKHB20Ct1ixy1agel5uuil7mk4IZw2K
	 tPejJ9K+ZAc3APv49qvuq0GlItUCqRckS6oujDNRffkaLqA5XKi0Td+CRuY5zfcpaTWzM
	 K3WP8WUvYKP1R1T81mOuLmdt0emgsdG0Y/QypQwORtYtzJ9GEWo1aZ2+PpEdECfjsK8CX
	 FOiSjeWi4SxdVzxLQoYxygRtCNE6lg+kmk7TMSCFT2reEQp6TMKcjApOHYnZUoRJPn8WZ
	 eKUdgxGZDQjwfop4XKzlwnFQvvprMzxj3qACWkkyDGBHic5iVcmJ23Kcw7qFxnFnUSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=g2Q9s7RMNeWpcW6ZkkIYUa+Y/Qr4kaBiQvLPfc53Zu8=;
	b=I5L/aopsrKd4Yx0aSpxSwfwYUJEkT7Ve8KHP6oX+oZV/6PksWNYjyiXqsIEEDswrkYzZ
	 2q2Sm29U46pOaZkuFKshwvozkvhkGL7t6Z88q7oR3/YpTaKMbQF5NcVw+S+952W668Zhs
	 lr4gOKUg4iT4JMmTqIi+Ow0snjHZVKqScygl7jcGVa79Z7E/862Y1sNJ0Sa6NtYAZYlh8
	 QPLPES7d7VApTwWIAt9EKwBvSY+5xu1a8l7vYbsS9Sv4ygphsOT6jWdvcW2CVY71bKpiF
	 t20O+d2ovIXM0Du+1vCqxQk1a4IvmV/AdmICOrt7lAHi28vCw5RLWclTLCgWyoFiU1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=fuxRwIQv;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F45B606A32C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F45B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=fuxRwIQv
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so19593035e9.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283521; x=1793888321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2Q9s7RMNeWpcW6ZkkIYUa+Y/Qr4kaBiQvLPfc53Zu8=;
        b=fuxRwIQvb3e976FiXVMdg6SHXixOXVRaowr68nVfAqH8eD5NAp5N9yZfae163nCeAK
         3VirG4pkwprxkCJreXcIvis41yC6wxi7VWOkv+APQpjpUzAM0N++7QQJcsXzvb5y6Ozl
         EjCL2Xg6QcxRyFG8voCKTvgHx6FBsfIwMNHinOlbHx1tFFBtavnBVBB/dWcoXh20jHnp
         o/pH6f7lcEE6v/5O21q+fdCZietQeyCAo7Fm5DglMPsFgNAeI7k8J44sh7SWip7dCaPW
         /29H05Tz0/gRPDACaQVTwMyLLejGxTm7UcbHWs31e3QN8nqz+zvl1F0U6MomISgO9s0E
         ykKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283521; x=1793888321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2Q9s7RMNeWpcW6ZkkIYUa+Y/Qr4kaBiQvLPfc53Zu8=;
        b=zhsNZIs3tlhx1sgXZlbBLUVc86hmy9t0vPscQBoUqvjLYyWXvQj8qmL4Qn+tCjRUA8
         IRaS5VNGUi7Mw6y0yCYSRNxOqOvT90XW/CUaHXXy7e5rO0PP2f3pmLeYvTPYHRWY1EDn
         WGppSBptX0OKxdIOyk34okT4WVRui7Qdsq6Y+lp3MxyM/aG60Vgi0JXPAYKP81/DMJCw
         Kg9RxzzSp3J5oJT1NG3NIK2Z8S6eYl6CJB3RM/GlMDGFOmKFtEXkMBMDJk7neipW0G72
         bvjvnIhVGcvHxtHiUNzXjG3Tzs9/iJcPz3hDTJLGrO/1WVz8DsjAm3hSqzkOtOdyjrKD
         5Hkg==
X-Forwarded-Encrypted: i=1; AKwUvBziMS8AKZz1Ijy0nNgZ5QyyPcIQMAWzfdoKcPHlC4hdOtK8WKD94pWhkMr2GfSN6pw0BhWqoYFKKtWF@vger.kernel.org
X-Gm-Message-State: AFq9FYIJuSUDo6cn0hI1kY1iBzjIlrq4IX4sXUynjcIeGpKzaIQlcsqw
	8J4zNDooP2eH0MbLZXTdEdmTBXfXJYNlJv3wF6tRSOc5szXXzEHmlZ0uPcWevKv2u/o=
X-Gm-Gg: AYBFou3xyoFYAzHXkn1+nVOXrHxR0AOcCfAMkKRQCn/f1Y04yNL16vJ/7j6TgTZFxFd
	JiPcYxKcAFPXR4NOpwNahN19Q0UmIWBEDq6uT7ktCykNsoyffoantujd7AmL1G3gfGkQWgJn3c2
	NveG6MRmv2jRBW1pj0ufJRYxhau6y4vBtKbC7SHF3+fla06netilaKIeOno78S2B5Kem6D4/5YG
	DHEmJJifNhPgqOwWxoYrflexxnDNrU6ECy9OaW7CYkWl3yDsMOAR1ddQMLKkr3jgKIGznIsYyF+
	rn0OC8WF6LkUrXDOD7m8mT3W4FLCL1frxnUK7h7/H1Ny+JSkEN4jbz9UUH7I98imXBfPpYzQAop
	VB8UKqIncJ52gqtakIG+S2CCuXCbzJDRmnCXdoEoXC7B8bkBiQwff7eFLw12lZsYpG2pPoIvyE4
	wpL4nkG5fmitjODPlCXUmbYNYilthuhOKsIdebU9bcXmw7hRtxGqP13k6eIgs+lTGmVwpg3ey0R
	bnEKp8Lanu8nuQqO0MFLyDRfMrJBttSiOYGzv3tM7UL5R7fZ5OARRmGLE8MHNbnx1dVd0j/yEVU
	FICbG79lfaZskhYQcxFApcSl6vCuSwbVUaLwB0uF3nC6CE0RrAFL520Jm9tX6yeoeIqlrm2plF2
	J9yrR
X-Received: by 2002:a05:600c:354a:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4a9662a0c02mr123628385e9.9.1793283520731;
        Thu, 29 Oct 2026 07:18:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:40 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:23 +0000
Subject: [PATCH v7 02/18] media: sony-starvis2: Reorder link frequencies to
 remove lookup
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-media-starvis2-v7-2-b33a1332fdfc@raspberrypi.com>
References: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
In-Reply-To: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
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
index e62cde583324..134fececac5c 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -187,25 +187,14 @@ enum starvis2_lanemode {
 
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
@@ -914,7 +903,7 @@ static int starvis2_write_common(struct starvis2 *starvis2)
 	cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
 		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_DATARATE_SEL,
-		  link_freqs_reg_value[__ffs(starvis2->link_freq_bitmap)],
+		  __fls(starvis2->link_freq_bitmap),
 		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_LANEMODE, starvis2->lane_mode,
 		  &ret);
@@ -1177,7 +1166,7 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
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

