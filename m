Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283525;
	b=foQE6oVcj3bN8BjirOx4XX2GqEdOawqP3bw6TwzNFDNzjrjWgRs6KuydphX7o9hr0RlP
	 yKOkDmYHEXGJCKiaNmWW24cn3FV/xdydsebI5c9nDBCtqZSVkqKIbJJFBT7jS8s4so245
	 XmKRQpnaKNm7sQGncurPJL1yCE0/TH4x+xGKW1sBQlAsfWFw3xuvaRb/VOY+fXDaYTy4g
	 /+UdIAEaTTFhBgwa4M1FlC22DVCDFYIqef/mecaEK0zVCS0nW4R4ORFrfWgu0JnObaLjI
	 VmKShZBtb65ezylcWL/cAWs1WEaPv0uYwk14wVp+O8BLJpxYeoCs8nXNOncksUF2ejQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=feAclFqGqANXGk5ANej1oUGx0E55rEkA+ZUZcmvKBcM=;
	b=bLjsKGOFPARNjjrnCG1VP61IWW7P1nY1bHh5Y9brnek9pMd79ZP4rFbWhyfbCOR3FvaX
	 pqoGOqL/iiSIDsSlhFE4oy7F3z1eqy4lzJ8dDyscENgrEjncoGAN4wsFK5/9wnQIsQ7lC
	 ewtp+eczwUylHLTOG1e1MlW+ObRaiNCsIDiGveo1b2SwFFmBZGV9Ie2l1QnUVAw2W4eTW
	 BAWDGOBQZQwq75dplsC7Tri0ac6m7dnnYe8crxBViUmGbB5Q7K9N3FH1164Ljs3SX/EDw
	 MIO51S4psWeVG9+mkrfKK6c8NYGCqqWozXPzcy6xoW4zcvBWgKk3CT+B5N6T7i1BgEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=D9bqhAwT;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3457C60A2638
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3457C60A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=D9bqhAwT
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49d05d51553so14687755e9.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283523; x=1793888323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feAclFqGqANXGk5ANej1oUGx0E55rEkA+ZUZcmvKBcM=;
        b=D9bqhAwTjUreboS+Y2SDyLVCsHDfEKR4fwP8eUIlHEaeJbUvJNQd2JxuFsITZLMPRH
         fchxd5hpKCJ+n75TIaWFPzc0xISn1LGkaFC++PLBiX1PogG3ncv9SbIjPDjaJ5IXTkXr
         wLV4ocPUmGnSURInwpLuXkyvlPRUrm4A8CBti4RCyyjqVun+xx9qngRG1B1QjNEEpUK7
         vIikImjy7teud8Qhs7l1PeaOA0DiMRkIB457AM/k1yGUXGSpwZ8ja23QIrrXDqyEYiP5
         ElVVIfyv9A08p5Ov6SpxO2zusLcp0Tv2wBPq/pcKmP4MGDS/vurYAMnr7RHJvhXo2c9g
         KsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283523; x=1793888323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=feAclFqGqANXGk5ANej1oUGx0E55rEkA+ZUZcmvKBcM=;
        b=UniywY1h4Tww8VsyjvvKPleyaLOwlNrCtfhVfLKrsJkTkg0kO3h6SAIhQdGMNk3ccS
         xkhmGv7EGN6R5sK6BaNMTdBxqohGdNKKNLDxwqprBERatkkAWmRHTaTH2GGllHGU5pLF
         NX7UPN6lu8WWigqVFDrV80veLRiAL9grOWy651HtJe0yqtGeF4cMsoZ6aUy0NDGxV8sl
         7hul+lNWH8zDbVBmQl/+g5JSWYXEnw5r48TMBM2I9ifsDaRqTxbPwUcygiBe7pwfr4tn
         ihdZv4mJtA9HfUjse0vfwvZiD0nCUOJGKgyqL/g5/TDrwU5PiojvdTBkOKh+8xfgNn2k
         gyiw==
X-Forwarded-Encrypted: i=1; AKwUvBxSP+/cKV4n0Wmja0ubu3AlSg3EUZBqZQSvqCPPHASEA74CRBS+VEcEO5pITuhwKSedRR02DrIEpmoy@vger.kernel.org
X-Gm-Message-State: AFq9FYJO4Vv7bhU4ugheEbCUfA3bLh8GBjDs64nT8Sa8TcECwpNABfpQ
	2pXjQ/IPnLYQppJYaSLNbQjxQJh+5CsEHddOHSZDIsO7QSFFsdqmvjD9c7jsoi7Tias=
X-Gm-Gg: AYBFou0wDFhJRjJ1POmHc9aCEXb6kES5JXVGvGLNFTN0mTtZeWerWRYUmdySsi4I8BQ
	PfbgKIaKqPkLYsDuV4uf70KT1QUtNr6OH3d8X1E8DKqe9Q7DS57Y7Ow1W/WuilT70c2tgJ/P1zE
	a0cSpoERh/9R2qg+03beaE9sxeR4+RxAQ17ETG1a18iXAKa6VwpRFKEGw2qvX1EQQnldUPHpZoK
	zAFPeWYpJlvdNkPDlgLwiJYEXCx9TGuXnaySx08hcoPtOtTduCUd4YykqYup/wFGDqsZJc6naEg
	7FeUnUDtgebjqEbqhr7jnzLc5NjjUpUcfaFrC1k3SAs36peznQm6usEop+G93fFV99ldUykk4ox
	w9VApm58vZxtADT+UoWp9CLTknvGhDdVa+s6WjUPSMDCBV+rR4mVQaojveTJJwxJqo3tK2yiEsp
	znMlHriTS10P6lFUqjHn6vFe3pfCmDR3Z8e87hn/cCqrVfjZMJGo9HRmdloKlX5QYIPDp5EmaFS
	1U9i12wSZrrXWG3RFbkQIfXbufKOlV/hrk+F0yq/ZpjQTfIkFkvfOm/Lu3KtR/HLbOd2xG+z8Uj
	XHR4hUAy9NyjmOeFZRU85TpRmMd5Vw/RsrXqMdRdVNQvScymPY83Klaew73yi6e5tYDdpp/lkHT
	KUQKHBbtLydySXYTYrqVsoO5W+g==
X-Received: by 2002:a05:600c:b99:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4a9676d42d9mr119898525e9.32.1793283523465;
        Thu, 29 Oct 2026 07:18:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:42 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:26 +0000
Subject: [PATCH v7 05/18] media: sony-starvis2: Rework 2 lane support for
 higher link freqs
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
Message-Id: <20261029-media-starvis2-v7-5-b33a1332fdfc@raspberrypi.com>
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

With some Starvis 2 sensors, the link frequency on 2 lanes is sufficient
to achieve a lower line time than the 4 lane value divided by 2, as
the 4 lane value hits the minimum that the pixel array can handle.
That can't easily be handled with the way the values are currently stored.

Storing the 2 lane hmax alongside the pixel array's minimum allows the
4 lane support to divide the value by 2, and then clip to the pixel
array value as a minimum.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index b54e1c68afa0..5dcd760c1a27 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -176,15 +176,15 @@ static const u64 link_freqs[] = {
 	[STARVIS2_LINK_FREQ_1188MHZ] = 1188000000,
 };
 
-static const u16 imx678_min_hmax_4lane[] = {
-	[STARVIS2_LINK_FREQ_297MHZ] = 1584,
-	[STARVIS2_LINK_FREQ_360MHZ] = 1320,
-	[STARVIS2_LINK_FREQ_445MHZ] = 1100,
-	[STARVIS2_LINK_FREQ_594MHZ] =  792,
-	[STARVIS2_LINK_FREQ_720MHZ] =  660,
-	[STARVIS2_LINK_FREQ_891MHZ] =  550,
-	[STARVIS2_LINK_FREQ_1039MHZ] = 550,
-	[STARVIS2_LINK_FREQ_1188MHZ] = 550,
+static const u16 imx678_min_hmax_2lane[] = {
+	[STARVIS2_LINK_FREQ_297MHZ]  = 3168,
+	[STARVIS2_LINK_FREQ_360MHZ]  = 2640,
+	[STARVIS2_LINK_FREQ_445MHZ]  = 2200,
+	[STARVIS2_LINK_FREQ_594MHZ]  = 1584,
+	[STARVIS2_LINK_FREQ_720MHZ]  = 1320,
+	[STARVIS2_LINK_FREQ_891MHZ]  = 1100,
+	[STARVIS2_LINK_FREQ_1039MHZ] = 1100,
+	[STARVIS2_LINK_FREQ_1188MHZ] = 1100,
 };
 
 struct starvis2_inck_cfg {
@@ -632,7 +632,8 @@ struct starvis2_variant {
 	const struct cci_reg_sequence *common_regs;
 	unsigned int num_common_regs;
 	unsigned int vmax_default;
-	const u16 *hmax_min;
+	const u16 *hmax_min_link_freq;
+	u16 hmax_min_pixel_array;
 };
 
 static const struct starvis2_variant imx678_variant_def = {
@@ -658,7 +659,8 @@ static const struct starvis2_variant imx678_variant_def = {
 	.common_regs = imx678_common_regs,
 	.num_common_regs = ARRAY_SIZE(imx678_common_regs),
 	.vmax_default = 2250,
-	.hmax_min = imx678_min_hmax_4lane,
+	.hmax_min_link_freq = imx678_min_hmax_2lane,
+	.hmax_min_pixel_array = 550,
 };
 
 struct starvis2_model_info {
@@ -1207,11 +1209,8 @@ static const struct v4l2_subdev_internal_ops starvis2_internal_ops = {
 static int starvis2_init_controls(struct starvis2 *starvis2)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr;
-	const u32 hmax_4lane =
-		starvis2->variant->hmax_min[__fls(starvis2->link_freq_bitmap)];
-	const u32 lane_scale =
-			starvis2->lane_mode == STARVIS2_LANEMODE_2L ? 2 : 1;
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
+	const struct starvis2_variant *variant = starvis2->variant;
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl *link_freq;
 	s32 hblank, max_hblank, vblank, max_vblank;
@@ -1228,7 +1227,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 		return ret;
 
 	starvis2->vmax = starvis2->variant->vmax_default;
-	hmax = hmax_4lane * lane_scale;
+
+	hmax = variant->hmax_min_link_freq[__fls(starvis2->link_freq_bitmap)];
+	if (starvis2->lane_mode == STARVIS2_LANEMODE_4L)
+		hmax = max(hmax >> 1, variant->hmax_min_pixel_array);
 
 	/* PIXEL_RATE is fixed and read-only */
 	v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_PIXEL_RATE,

-- 
2.34.1

