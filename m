Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741324BD780
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004697; cv=none; b=d2R1ipUoCwWBlIpAlwxh3xSnBkzhYvPegf61AlgIPSquEogHOCaUQAg4YtzESNA4sbr/nRUXJaE8c3fhCylEHqw7RMddZhqtiHA9pw/D2zjE8OE+MyQCbVA5jKpCZkOifawM+Su71y/LhV3e2N8ILw1BQ08a+VbYFrI8mND0qU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004697; c=relaxed/simple;
	bh=hmtR3W1Y5TWVJ1bZwbC6Y+hbDXaRcvii2VTH1g9vhD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0t8KLUoEKDdTUliT9d8PPAMB3i+nwhciMaJwUH6Wn8ntrzA4IrtYGiGWglZXDn6lR4i1KgeLo8/en4GIPFkb0PlqGlHw8i3ajj4px4SYGRXWPM2UTYOurSKtcRBEWFUmWAfq4m+D/a+lXHrkAABzcgbrn7Kx28U58UbjKC3IHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VH42h8mb; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VH42h8mb"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so2065626f8f.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004694; x=1790609494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hvjZHOpLzp7pP91442UrHRwP2IoVQT4tZJveO/+uSIQ=;
        b=VH42h8mbjunlLvUfhU2MPv3RDsyKFrpag8zJoNlvy9M7+6rpzAE/9WXMBCQrneYpzu
         ikZSAGHbAsNDZGPFK/PVkVG5nbK4uXB1Fo2t/DOa6DYsdhpzM2vIqdbRhDwRWvWwWeO/
         6YyHlWrE3Wcfel9hS7knbE/oH5ILoXC/xpNfcKiUvU8wZ0e/nQiqGB2gz9zG5+/YjNax
         OCYghsovaLMu08OhIhrvfZR+dLpqAe9ZM7ihiJJrcKtAzjKTmqGy5FNZVsbmNSniGOpl
         ps6DZAJ91yCHRmVh+Vo1XhPmZHiB1fcWifDSUvTT3PnWbxESP0ags7zrbJbuWTkzfLRa
         AJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004694; x=1790609494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hvjZHOpLzp7pP91442UrHRwP2IoVQT4tZJveO/+uSIQ=;
        b=01WAIkYrRobccE8BtDB7k8yaEeaRvtCC6lHH+AILRAdbnFAAzupviB8jQrDB/7ny2y
         03TQkhpu453wY4XkH5xkwtIuJnE3TvtsC8a2ZVsP501v5KalhOgfnx5RYF7E8MrKz4Uw
         Pb58jhzwKERV8lT8cMCh6HbaJDVDICKHgnDn/cBtdQ/XMYdbJtoyZoZKUJ9pFWCrHYmO
         E3+Jexty3sCgtpbFgwFLwmLl8X/YKKWqERXBZf32FSo5AVStAc8r5okQog7uCUR6RuGL
         72JfWC1nG7/ejgSk5GL3tgcwxOd0oL0L2HQvPWF/ErAkM6c02g1OoTdErhm5z8g4JtNI
         75+g==
X-Forwarded-Encrypted: i=1; AKwUvBzBwP6hY7vHMoB8dGoZvXYJveRVTji0iSWoqttYKrECZ6wJl/d+mnhU/a9ktoKqsg7NQSpOLUIa4bSi@vger.kernel.org
X-Gm-Message-State: AFuF++n0vIms1zba7wsust9Bol7Hq1Derw/lzKHTiGkgGYVpRyqsKoxA
	OyLqe66ABJSoTVnNLwmsFXECNQ243wLdHwOwhGB8dnIATWs3nJRtGdJs
X-Gm-Gg: AYBFou18TH8NOtyoq31czGnF92J63Ir8rcz2f1QSS3JqvL53aJI13uiSvWLzmn4gJ/U
	/aUgN/iFXMuVIniDUH9NAli7+7Px+ysHo1zKPhYlieI76hblYNtBffuMQc68T4jVKjWJ1dQZX9W
	Pi2gsER4oMWErwQrbzZDxrA07Gx4+eOT/gKWvomWX9H2CArrkL7rM/IhRiVh6X6GRoclNptuP9K
	1GJtod1SvfFJX0L2MUyavOhDUrOOL+3GCGYQO0+/WdL37kTff2OEKSq12h3IS2Tl0xsspYGOx3v
	aAIu7gO8Nbxo8H3JuTaCsJc/4GRz4UvR3sHJqKjgESE+a8Fueh1TACu0fbSZ05cfssO/gWnCwp0
	AduIeFIy+628dgNs+9HSSkxCaOMq1n3sbaiKX/ne2T2OS3XAuDVvRVug2ek9H/QLXagxSnttLq1
	qaSkSZjBTONPQQmmODysHrsZ1a8chS++fwyKbF6FewN4bo4DbJUBv+P7DvW1ZOwxVVDltJx5gQe
	Z+y2Fmh1uCHET9HYqhxCqTqxaMoQj9+W7KQsFerczVfQpnoqL7z34PQjrasHt4FOMxD
X-Received: by 2002:a05:6000:2407:b0:487:14b6:b1be with SMTP id ffacd0b85a97d-4871e235dedmr14131319f8f.25.1790004693661;
        Mon, 21 Sep 2026 08:31:33 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm25313835f8f.14.2026.09.21.08.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:31:32 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Mon, 21 Sep 2026 17:29:58 +0200
Subject: [PATCH v2 2/5] media: rockchip: rkcif: add a register index for
 the MIPI capture size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vicap-rk3576-v2-2-0a4582e20c72@gmail.com>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
In-Reply-To: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790004687; l=4689;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=hmtR3W1Y5TWVJ1bZwbC6Y+hbDXaRcvii2VTH1g9vhD0=;
 b=7eXfGmHs6sqc5ovi2LozeLD8P+//cq3BdzTNILe+jLO+3z6tcXIFTrq2r7PjL5gIQ0U+4GFP/
 bs+JT9H4zhyDhyWgtywsCyvaCrvhVdn3FYixJeafybxnIvdR7YATVT9
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

The RK3568 and RK3588 variants configure the MIPI capture size in the
ID_CTRL1 register. The RK3576 has a dedicated ID_SET_SIZE register
instead.

Add a register index for the capture size and write it through that
index, in preparation for the RK3576 support. The RK3568 and RK3588
mark the index as unsupported, so the write is a no operation for them
and their behavior is unchanged.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c | 10 ++++++++++
 drivers/media/platform/rockchip/rkcif/rkcif-regs.h         |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index bc9518f8db50..e0acb9049ca1 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -438,6 +438,7 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
 			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x38,
 			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x40,
 			[RKCIF_MIPI_CROP_START] = 0xbc,
+			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
 		},
 		[RKCIF_ID1] = {
 			[RKCIF_MIPI_CTRL0] = 0x08,
@@ -451,6 +452,7 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
 			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x58,
 			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x60,
 			[RKCIF_MIPI_CROP_START] = 0xc0,
+			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
 		},
 		[RKCIF_ID2] = {
 			[RKCIF_MIPI_CTRL0] = 0x10,
@@ -464,6 +466,7 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
 			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x78,
 			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x80,
 			[RKCIF_MIPI_CROP_START] = 0xc4,
+			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
 		},
 		[RKCIF_ID3] = {
 			[RKCIF_MIPI_CTRL0] = 0x18,
@@ -477,6 +480,7 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
 			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x98,
 			[RKCIF_MIPI_FRAME1_VLW_UV] = 0xa0,
 			[RKCIF_MIPI_CROP_START] = 0xc8,
+			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
 		},
 	},
 	.blocks = {
@@ -549,6 +553,7 @@ const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data = {
 			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
 			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
 			[RKCIF_MIPI_CROP_START] = 0x8c,
+			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
 		},
 		[RKCIF_ID1] = {
 			[RKCIF_MIPI_CTRL0] = 0x08,
@@ -562,6 +567,7 @@ const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data = {
 			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
 			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
 			[RKCIF_MIPI_CROP_START] = 0x90,
+			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
 		},
 		[RKCIF_ID2] = {
 			[RKCIF_MIPI_CTRL0] = 0x10,
@@ -575,6 +581,7 @@ const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data = {
 			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
 			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
 			[RKCIF_MIPI_CROP_START] = 0x94,
+			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
 		},
 		[RKCIF_ID3] = {
 			[RKCIF_MIPI_CTRL0] = 0x18,
@@ -588,6 +595,7 @@ const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data = {
 			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
 			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
 			[RKCIF_MIPI_CROP_START] = 0x98,
+			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
 		},
 	},
 	.blocks = {
@@ -759,6 +767,8 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME0_VLW_UV, vlw);
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME1_VLW_UV, vlw);
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CROP_START, 0x0);
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_SET_SIZE,
+				RKCIF_XY_COORD(width, height));
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL1, ctrl1);
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, ctrl0);
 
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
index 3cf7ee19de30..0460e963b154 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
@@ -147,6 +147,7 @@ enum rkcif_mipi_id_register_index {
 	RKCIF_MIPI_FRAME1_VLW_Y,
 	RKCIF_MIPI_FRAME1_VLW_UV,
 	RKCIF_MIPI_CROP_START,
+	RKCIF_MIPI_SET_SIZE,
 	RKCIF_MIPI_ID_REGISTER_MAX
 };
 

-- 
2.43.0

