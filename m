Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26753A254C
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 19:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783278875; cv=none; b=dlXIb5rPmRDNtq4VgFkaJ4RAaPvN2RuGBUAGCLPQVqnJ3oRUeY1j2Oie71vgJrQNhfeKQJM+/xPsnuUMaKDks5YaN4bJUKE4N9nI2MoYnB1xvZiboLyz4jMX0SdD439XqTzNree36SIzYT8+GjwoTZImBgRSdcjXPx39jizpCPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783278875; c=relaxed/simple;
	bh=gKbn7DxHBfW8SLIM+L0EECSMebRwKa2NPKVJkQ/QPPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NAeUF/b4KqV2bbO017btGhLsontm/8sSBzdqoGAlgU2qFhjj1CbSkvTJHOlz3mZYib5chO7D8QX8jvu555TOMirR0OwCfmIaussvrLnYAKA20vE24IM1oeWsAoWiyH/8vgf7cAA8lbkiVCdwS8jHEl05qZah4wrFWcnlHfA0T2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXLRzrXg; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXLRzrXg"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso246901f8f.3
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 12:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278871; x=1783883671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zjiz7ZnbyxVfBfvfi0uSyQjszdJNoTxi1eUy+vx48jY=;
        b=UXLRzrXgiUwBX+Yny/lR14o5DlpvbgiL7IyO2Q/RzFrBLkWvspzN4W+d+YWu+i6d1O
         DujGYLG2+2doWgSJMXYb7BDAdmQ1kD1ZIzcls/8S+pd+2z9qdMol/Rqb2zBxJOMRR+2Q
         oThF5ZKvirUCwb5bByfkApqCdihGpDw59DIEg35916/Z29tYCC+FrglJuv3KGmh0vKHu
         CTwduV73ct1bLQqjj6At2KGASmeTjuiESxHfYc65L0F7LYBxLINjr9sNwql+IZ506SKw
         M0bmdFTCa9rumY2XCRw/LhQfToNUGkkskewx0FNpwAsbKU/NX6LlnlC08rXIbn9eADMk
         NhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278871; x=1783883671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zjiz7ZnbyxVfBfvfi0uSyQjszdJNoTxi1eUy+vx48jY=;
        b=YLbBHnG3gPngCTA3LNpAJEq2EnpaOZgI4BEPPTwKqmyqwXOjaagemHfWOHoC9/sKkJ
         k8EpCKeAjmieUSur+cLJy+qlOlU5y41XVypRz5aVfWOBo9+FrXyWhssztXZxTKM2BrPF
         7fQ4Cde/OJID1AeUwz8RVPemVXB65lXx6YB6QYG14716xD9DVlBStm4H4VP9DgtGkCbQ
         DBNi6iJYdIw0PCE4B1QBUkaXq4Ot4YzEKwcniLrwhFBKgvPqOuzN3aZiYIVeBnrydPtM
         wVltFALABjQkbJbuC6k7kMj2xNtSjSUxb+B1BCUmggo+BOpEAsRTXGzJ9x6BlwzIipdZ
         vu9w==
X-Forwarded-Encrypted: i=1; AHgh+Ro1eVry9xgPnY7EEHyzP4zAw9nOHBZCm5iwoHdXs3GyASq/yW8SISiL2TjKk+DvcnhCTuYNWsKPHizW@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ8uQlcBSsPVGwzBV60vI/cqvYeW9F7n8KeJt704vhiOv9rfVw
	lhQghxm7C9l+V4KTwrcJMFcfsRCFfXztQTFzUeYPgG1ROWtszOgZwUI=
X-Gm-Gg: AfdE7ck+xXw6Vm1oiRgxoYwIHzRvktlRjO8Nin6/VSJvJC7VdjdYGkvhgtaD2ymGB+x
	nuWt6ssK6PqmWhvnw8P+pL4PpEMr7iLA+9P0FZQ8Khbvz5aEVfBTQj9vjiW0XSd3eABYh3ULpGb
	IJ0p12yEoZnrg+yWTNSUYSXCdTneBfy/ZkCFc3aUmPgPttP4X7knTSWJNPBYKrqNk3HloxEhDMo
	9B0SjU20jiGYO/CW02vn5zBhMJSQlURXvNioN1oYh2bXsKVavLfwx3Pk4UZ9Eg7+NxfkHQMrsbK
	UaaRPTWlaFX8P6yo4uwy3IpFPc538cnZog6cHuyvXprYa1+z3m7dWhJMpc/yHIfpkphA16bj8XZ
	16FREZo66sZLXjE2LbJ/rWaffEE17izN6UCCuBOhCv8Y1ccWaFHQr2EhWQMnlEBAVf6Qf/ETkcl
	lyPP/CstJ+fQaKOVjCN/imjWuc+d8ahg==
X-Received: by 2002:a05:6000:2c05:b0:47d:df96:c9f4 with SMTP id ffacd0b85a97d-47ddf96cc37mr2857980f8f.10.1783278871226;
        Sun, 05 Jul 2026 12:14:31 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:30 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:43 +0200
Subject: [PATCH RFC 09/13] temp: add LPAC regs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-9-01d50c3e0c99@gmail.com>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=3442;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=gKbn7DxHBfW8SLIM+L0EECSMebRwKa2NPKVJkQ/QPPw=;
 b=kVEoEECsDH8lgKuRlOjhb0NLej7gAlbXc+I8b7Z8Y6BmwMTjsJI23i+SxwgE0fdda9uz24tEH
 NoA9v8TbOQcCAGwLTW9/mUY/YNUbybJ8jacr99G3tWrk2UifXc4ttFe
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39416

should we merged and we should sync to mesa instead

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 3349c01646e1..bb49f6a61a9a 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -276,6 +276,11 @@ by a particular renderpass/blit.
 		<bitfield pos="1" name="ACCESS_FAULT_ON_VIOL_EN" type="boolean"/>
 		<bitfield pos="0" name="ACCESS_PROT_EN" type="boolean"/>
 	</bitset>
+	<reg32 offset="0x0B09" name="CP_LPAC_PROTECT_CNTL">
+		<bitfield pos="3" name="LAST_SPAN_INF_RANGE" type="boolean"/>
+		<bitfield pos="1" name="ACCESS_FAULT_ON_VIOL_EN" type="boolean"/>
+		<bitfield pos="0" name="ACCESS_PROT_EN" type="boolean"/>
+	</reg32>
 
 	<reg32 offset="0x084f" name="CP_PROTECT_CNTL" type="a6xx_cp_protect_cntl" variants="A6XX-A7XX"/>
 	<bitset name="a8xx_cp_protect_cntl" inline="yes">
@@ -333,6 +338,11 @@ by a particular renderpass/blit.
 	<reg32 offset="0x0845" name="CP_CRASH_DUMP_STATUS" variants="A8XX-"/>
 	<reg32 offset="0x0908" name="CP_SQE_STAT_ADDR" variants="A6XX-A7XX"/>
 	<reg32 offset="0x0909" name="CP_SQE_STAT_DATA" variants="A6XX-A7XX"/>
+	<reg64 offset="0x0b00" name="CP_LPAC_RB_BASE" variants="A7XX-"/>
+	<reg32 offset="0x0b02" name="CP_LPAC_RB_CNTL" variants="A7XX-"/>
+	<reg64 offset="0x0b04" name="CP_LPAC_RB_RPTR_ADDR" variants="A7XX-"/>
+	<reg32 offset="0x0b06" name="CP_LPAC_RB_RPTR" variants="A7XX-"/>
+	<reg32 offset="0x0b07" name="CP_LPAC_RB_WPTR" variants="A7XX-"/>
 	<reg32 offset="0x090a" name="CP_DRAW_STATE_ADDR" variants="A6XX-A7XX"/>
 	<reg32 offset="0x090b" name="CP_DRAW_STATE_DATA" variants="A6XX-A7XX"/>
 	<reg32 offset="0x090c" name="CP_ROQ_DBG_ADDR" variants="A6XX-A7XX"/>
@@ -521,6 +531,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0x0b29" name="CP_SQE_AC_STAT_ADDR" variants="A7XX"/>
 	<reg32 offset="0x0b2a" name="CP_SQE_AC_STAT_DATA" variants="A7XX"/>
 
+	<reg32 offset="0x0b30" name="CP_LPAC_CHICKEN_DBG" variants="A7XX-"/>
 	<reg32 offset="0x0b31" name="CP_LPAC_APRIV_CNTL" variants="A7XX"/>
 	<reg32 offset="0x0b34" name="CP_LPAC_PROG_FIFO_SIZE" variants="A7XX"/>
 	<reg32 offset="0x0b35" name="CP_LPAC_ROQ_DBG_DATA" variants="A7XX"/>
@@ -1207,6 +1218,7 @@ by a particular renderpass/blit.
 	<reg64 offset="0x0E08" name="UCHE_TRAP_BASE" variants="A8XX-"/>
 	<reg64 offset="0x0E0B" name="UCHE_GMEM_RANGE_MIN" variants="A6XX-A7XX"/>
 	<reg64 offset="0x0E0D" name="UCHE_GMEM_RANGE_MAX" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0E12" name="UCHE_DEBUG_CNTL_1" usage="cmd"/>
 	<reg32 offset="0x0e17" name="UCHE_CACHE_WAYS" variants="A6XX-A7XX" usage="init"/>
 	<reg32 offset="0x0e04" name="UCHE_CACHE_WAYS" variants="A8XX-"/>
 	<reg32 offset="0x0E18" name="UCHE_FILTER_CNTL"/>
@@ -4406,6 +4418,8 @@ by a particular renderpass/blit.
 
 	<array offset="0xaec0" name="SP_PERFCTR_HLSQ_SEL_2" stride="1" length="6" variants="A7XX-"/>
 
+	<reg32 offset="0xaf84" name="SP_LPAC_CHICKEN_BITS_2" variants="A7XX-" usage="cmd"/>
+
 	<!--
 	The downstream kernel calls the debug cluster of registers
 	"a6xx_sp_ps_tp_cluster" but this actually specifies the border

-- 
2.54.0

