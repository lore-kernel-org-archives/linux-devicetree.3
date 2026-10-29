Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282003;
	b=wwGWaIytPlkXC/Q440X9U0Hrf2sZzT5VcgoETANDNpzH6O4aVGik1aw8Wd709UP3R3vb
	 G/6v3BpHFCmCVLiHxQlZSvpnU+FQSe8DWst4o8DFo82SATrzJJpZN+dSiXknJep5Fpj16
	 MPvPECgBMwz/sfHGSsBLjmbzfcg1SQGkL9ssagSz0sIdj7XHB8x7R3CkASn7Sy5gZqmyR
	 nk4O3WaiWPAJ2mqZOTP1NJ2GXF5TLwBfUdrNwO6Ot24soQRu7YqGlNlpeCDYLPohxlaRB
	 rJWkWkLkyjKJ7EKesnTGcGqWHaAUUcLo9ooCMLTWvW4YxYCf9BjDi+YZ/fanata7aYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=F6iyjptvh4HoJM36iNO76ddk9CmJXz5lBV2KpfdHPWQ=;
	b=zRqySKBOLNtpeoq2dn2qoc+5S1VWow8O2jgEIMJSKGXDFvC7G0+N1qaPqlruT+/3HFvT
	 MvWfVsltktzkX4s92BowJtphTqxuvjlg5QYdyGx/XD+c4p6cTTJBe1SDf8MMTq+8Mi888
	 I/1R9Y2y7xSuvDyoAlmgUsTA5TGozZTF2+qcaLiiD0mzbB5CQS1q/bfSiPaFVit4TQIvm
	 ATl8m2dyzl9x2/Z0hsb+Th7N95rkipVRl1S7FM07zrbeYRZyuKNmJiC/6OIUZ/70upXRl
	 U+lvKullGuMkC1wtDuT+1m3VQuIeGEanzJpNrZ1VDUbaLBTSr6jJ5viBO6UZpndB8Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UfFtODtI;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3103760A5BDA
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3103760A5BDA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UfFtODtI
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so20351405e9.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 06:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793282002; x=1793886802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F6iyjptvh4HoJM36iNO76ddk9CmJXz5lBV2KpfdHPWQ=;
        b=UfFtODtI+om2m2VG0IwwyR7Ee3t2Tszhx0rPZbmSS7+GfanhfyAAHbx41uxOjyJOaD
         B977Tjxl82vcQqjpp7OJSJtHz/BUyFtL77KCTVCQoa0ep8TtZmfK2pee8DHorWLJEfxn
         MV/KdNZJrK8mk89XI5+6R0JNgIX21q24FfkWhGzseJ4TRlVXlVT5FcWbsv9arR7SlvBA
         TKOM1bYiHUay11A5D32+YRZMGEfUVUdTifJXzL4DiLkj8fnfnDfWBd+h6/M+DkD7O7Dg
         tBSeYsG2vXoDVCAY+P9UbA04Hzmw0FjvYLo32Sofh4AxszVI08ZAb6Jvl8Mbx5gBrRSz
         IrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282002; x=1793886802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6iyjptvh4HoJM36iNO76ddk9CmJXz5lBV2KpfdHPWQ=;
        b=wroQogzgHbdnWUG2p2eOto+G9K6hsqyuwI/3H3/6O6SrWZRaaHVoI41ay88NNSQ1sq
         sBA1Mk78KuRO1m133NDAYZhpqQ8Zhuj4qoZEhA/2a39p1hDTdvOU2WJzOAsuHI//USzk
         MseRjuPf3w3FLAYZ1Bu8bvOlupx9mpqb1L3mzKhysvmF2pMxomGCaE4yPKckRAnPWT2Z
         HIikTnAmRnEH9TafX48k8MBEyFCIlmN6oh5Oi/72sE4vYHp5h0DzWdjO6XLo+P0jFt5K
         /BtbW7Atjje7PAMMB4+htqtPTRtkYRCuV2+YBDUokLPS892MXISO8PwilI1hWyErXMGT
         cpmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyKTJkVeKFhxRu/mLio8H62qmpjwCo4Q4MjT3xwkhrd5c3YP9GS8+NtszUObmeIsARaajAUVq5hFQ6@vger.kernel.org
X-Gm-Message-State: AFq9FYKGfI7vqDkoHHyPqoQryxBqLRpEuhCV3kP8qSFeMdzINfILAKlt
	fEk9CVuqKyaq36EXU9kViPnE77tFakirGVTwki9WeaGoY4ceynV8ZnM=
X-Gm-Gg: AYBFou2WxyGzvFZLV5BymMl/sluk+Hi1vXRt1r/qnG8gN+zhIKFOYnye42+gXTh9Civ
	DJ8YP+0Vqj9IKayGPFHy9nJMXoJwnGI9aAzl1w035GdMIlHQYq+gfbqKtn+gqmptTJ7Uvk1ptSf
	r8YYUWAcZx5iOx23KTO5+c1edmtPecHHgngBaTZpWDK3HujbWHED/R9yTKO4H708uOXoLb68gTH
	SvOEi3l23Kp0K7rmreHHY/RiWEUavbmxWt0Veg3s5qGSW0SgID9/7maU3pAr75dLgycf1eaW6IV
	E9lplfx2fCnXpig/R+RHhwaFATPR0I0/o5qX+qdVZuAhj0nmcANxKJv7GB5wKTOtWfz99CKaRg2
	EATJlmiKFNbOLF+E4ONXEsvsHGD3d1Ki+eWBsAMbzrEO/VwC6IBnkuXB1aLyM4zUnQ1xpan+pBs
	9B828SLmBgvg2p5+JffRMCTkmm+pmVsfUZlfsZDoNGopzLNcZ98O+PJMLfZot/33duUESvg2dlE
	5oS9dyzUNqz1ru0xU/e56eLclaJM+XOckS4IJr8ut8Hj5PA1NwtzHW7zGDwrboXoEo23dytW9U3
	3PnT1/OH2echAYD5pAzsVZT2z2PfSTnguF5OBLo+e/7UBA==
X-Received: by 2002:a05:600c:19c8:b0:4a2:150f:160f with SMTP id 5b1f17b1804b1-4a967d96ed4mr130087105e9.25.1793282001580;
        Thu, 29 Oct 2026 06:53:21 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:19 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:45 +0100
Subject: [PATCH RFC v2 08/14] temp: add LPAC regs
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-8-a21a5c850961@gmail.com>
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=3442;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=RZEFtq/LXNa59m6pbHJ662cjcscb6GjQIUaPl2ZCGCY=;
 b=Gg0EOPcUOgQpNZut9lNNaoRdNIuSBEJgfuo2weKWP2BE2uB9+coUCffV36k/9B33kt5L/B+7s
 HpwtMjcdQ9CCbIIPIywq4tqFWNV27VuvFgGbiHV02csNFC4O1QaG7Tn
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
2.56.0

