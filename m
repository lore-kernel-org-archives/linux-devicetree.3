Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690472;
	b=K0b3TCfjeutdbQfYEPYF4LUwh2L8dwsa2PQF3AQJmPtWf2LCBnLtPrtobGBnhH42HdC2
	 aGcfcB2BMwDcOFqxOhPsNHznm30yY/A/GVp3dyL0kiLNoF8MQE4qEoxN7+jUUr4+7n6Cy
	 PAA1GCq9USceaTWXLlNwH2xXq7kEfA6ODgjNxI33/b8vtXSRfPCj530v2zFbTeWfmeyQZ
	 wgJZsSsfwCMzggYEEqf/djXF1Cw/ZY8kLpxcJZ0z6EV83SPbrdwJiRyvarsz1rPOhX/pz
	 dDKlapi/k7L/vMvNJwzLTUS6aB8uR4POI4K1td785tNKAH4LHnBa5CCBSHFIXh24+xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=g2Q9s7RMNeWpcW6ZkkIYUa+Y/Qr4kaBiQvLPfc53Zu8=;
	b=dT7QNoZ/0O+kTmyr4Ir1txu9Bb7dS9sp3dh9ZQW7pxesNYRIzekSrzk5Q7aU4tA2yuSu
	 we4g9U/dXaqp/a8ihdjNFVZwChG98lqrzTWmDWk9/JgfOyIJoS7uZWvon36Ey7Klya2Zs
	 SSovDZb/rbC6YVzeWFskhSxRe+AZ50m5OI2pT6HjXPHFts59YbfE/Asi5x4eMP5ViKKns
	 2yj8laSR8G/r+lPOZSlhu+nsHActV9kjoa6tGv6SNVE1gnE5kVIeuG6lWIWmTk+Hgu7f1
	 k8/2wTXrv8R6x8fbo3/Zs7l1RE+5Y27F42BLw56Q1SUgVoouImaVVNO4Yt0STqbA9Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=bgas6k85;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A637606A325
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A637606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=bgas6k85
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e10a70540so38517f8f.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690469; x=1793295269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2Q9s7RMNeWpcW6ZkkIYUa+Y/Qr4kaBiQvLPfc53Zu8=;
        b=bgas6k85plq4qK7o8D+nY+Q1OOUJLT2FZsMDezlnz8GaTMY9Eg3NesEQ8SYQ0/1HmA
         BJPsgtKjU3nFeqc1sZlOiinJI/gMiF+9/JbxChw2ENC17eLFXb4VbBdCSst9+Bens5S2
         S8XpoTXqLee+MDHs6RNM6h1hWSpE68Rwk/5+R6sg2gOfab7t0PWr0+cIgVcYfC+IY4pA
         KeCqH9nuQUbxGWDVeBp+xXiz7lgbkQVQoFX+tIOkci4OSp9u9fU2Mq2flMACj/72nyMa
         Yb63uggzRSgJ0fvla8CP4OMy+P3S/upPLJsCwTXspu8eDfLJ4GBDotIzhRitJLdRSS5h
         7qTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690469; x=1793295269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2Q9s7RMNeWpcW6ZkkIYUa+Y/Qr4kaBiQvLPfc53Zu8=;
        b=I094O57nZE6EMhn+8x8lCwAtmi1SuQciDHiwDHM421RWsH/tfpu+op7Ma3RPjGf2e+
         e5ZF/EQF7i1n1D6JRI3JByRWZ9nWEh22e2yeQ0C3lgM9G6uAoADkaCpVb2DIVhKGWS/l
         zlSijke+t7M6rsGxHFERwNzTBc5PsBob1wvJvEtO74FozntwipcWYWhNUHJcJmuDVD6f
         GleVzimKQKcX2nqqS6JRzJMlFOelj4JKiP3ilaoH9iV05Iti7/0tE9TM84Rz3BGjQDhF
         wszLNAah8dxFZNAZlVTHSbS7yQF4c68/1vYZPSbEiR94gnrDxQ1eKbhAEe4CVXi45/yC
         RFsg==
X-Forwarded-Encrypted: i=1; AKwUvBwE2NJXEp876vbKwpxLwCIL0LXJmf87ei2ea+31QJW59t4ZMi8aczI/EjyVVROx8ppSiDUn3j8/YFj6@vger.kernel.org
X-Gm-Message-State: AFq9FYLJ/ATzmD1CBR74gDeQUYuvl565O/PaWeFHAWUnfpMjoM9Vxcsc
	Gf6GqnPlAHSKuAHI8MKSYfO0SlA21wsk8lsIH3SMK3Dw1blYt/o0Do0d89MEEZ5WqaaXAHN6lWq
	agB3la6g=
X-Gm-Gg: AYBFou3xCjeMat8kXC2SBOa/zBtm8ZjvUCof5cVmZ3XrF9/u/Bm/bChV0MFQQMVGZSc
	sIG9wI1XTOqetxFKIqNZdXdbiL4KG2eHlUIpqyc71hXtOQejd1PsCkyTIweLlGHjJwHwvsyxtbV
	GeskZf9VHlR6rRZTqHgyhkoOvvYYeoRknSKJzBk8ljCgsorm/UQK6LDh4U0jeMeDueetHk92WY+
	uM0klX/rqHhcbyceIT1oWEh/ESO4CmvmATOABAT2KQLAT3rjHE0ku3yqnt23aEAS71rqK/w8Ba/
	Nss2mcOjgzBjLd9LO426N7SpCwYm2dEUwxFKBPbhONXwP5F9+sjW5zX15vW7vuodMi+h+uvYDH7
	U3NEpjlo1dGYxGf/7VJRqrtSlSO5QQOTMDEmp126lTPfOBYtsQN0hNDqCw164X+C+ZfJmR0sblc
	4XFif8FXBKAL64KYu5C5CC2bVio2NAUZqQYt8s611ufDTuMLJkGK+kqGVXC6nF3re4gFOqp1fKv
	JCIQMBYA2HaIdjVlWRtYLCGk2qE1/TVnclg+ovRPJaUSaAVZrBgH6W6vJVpgTbX3EFfuk/4suQ7
	C+asP/TljYdumhnbVTI2riTHFwnwMmE=
X-Received: by 2002:a5d:40cb:0:b0:48c:7037:aee9 with SMTP id ffacd0b85a97d-48e264e01dbmr9492451f8f.50.1792690469507;
        Thu, 22 Oct 2026 10:34:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:28 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:33:55 +0100
Subject: [PATCH v6 02/18] media: sony-starvis2: Reorder link frequencies to
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
Message-Id: <20261022-media-starvis2-v6-2-374343f55fd3@raspberrypi.com>
References: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
In-Reply-To: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
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

