Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EFD258EE9
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 19:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783278867; cv=none; b=QnEC2tMAFXwCtOuIL1qNzKsGs98Cp3HZMGqbILR+7Sf7CaivxAZp6xRB5QyzAOpWVrwNTEgvXWFcOq6nPoX9z6+QvV0TyDuWN5aRPxoh4AoIJkycAuJXBbJGiBnleL8FBjgJF7Fkfl6EgNl6R0dh/6UtJYAy1pB0E5yv1Ki/MfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783278867; c=relaxed/simple;
	bh=W9JuocKrQv+AohpUo+PmkcNR8I1xfDAl+4Cp7RFtojI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pMp7QHsPddGfvFRthDL556prey9T2g4IkL3jSApPf/nBA+nunAhgeFJTtl3rvFMvuRg5vRlCOWczdPPJuuqYHzF92Uj0hBY3TH4r/OU294Y57O2Ap0wPtVsCkLKMLFV96MiHBgcyBvBccoBngSE1JQdS0TKsKz0vwKpPCfjhsSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ByoFrOBI; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ByoFrOBI"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so16772405e9.1
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 12:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278862; x=1783883662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPcQkNch1dlro+P09FAFemSnMdYXsI9mjXSoWgS8Puc=;
        b=ByoFrOBI4Ne3A/5wHKNBzUXt9zETdsx8kIg+SA/lsPNvNqnOTeAzQMx5h1ahWFsWU3
         pZT/w0PaggeSHMa5Zo6bb+9ebIALUii1QPD7FBNofjPo+8pKQ/4saxYF6DatBqKZ2Tz5
         v94FW9WyOFMH9gLi/kpVLI/KSOKUF+RFn9sHzHVSAFa2WHl3CYVRCPAkE/kLQ3AJG9Gd
         Yu1wf21ricConN2v9Jr7zyvMQYWFYNEdB0aUUbaILE9BPBW09Edv/dp1S/ds/VzjXp8M
         sz8AiH3y7hq1mGO82PNzogtdK0zKYY3fS/3md8G3Sz3kL5D2hsc0ewUu7nuEHgRnT1tG
         RAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278862; x=1783883662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bPcQkNch1dlro+P09FAFemSnMdYXsI9mjXSoWgS8Puc=;
        b=WEw2CV9fdnzMC58j5ONGRF8qlX7tbJhb/Cg7mmC5m92J9/hams10vFHodIhMzyIV5p
         O7M/LwIqTedVT485uAwuLVzUsWgIL5qb8tVlYh2QyRGiPqjbPUkKKtVRcs1/5W11rR2r
         jBEhMKkgY9P/xBowaziGxo3TUZeZ2egPYCRQD2mKfCOhe0E83yH5d1iyulv9Aq5EvxC5
         4YWt2x2MjpAbChLh6kJbAIDjSOe73QwEECDhJ6TzJ0N5uKifP8Lx2ipNDwKtcy4CSn6y
         P2+DPj4yCbxhsPCeDa4436nv6nocJ70GSCuOPy6xup/knlEfcGpSjaaXrshlxDWia5Am
         dkbA==
X-Forwarded-Encrypted: i=1; AHgh+Rqu/wibQV72MiEj79YHrab2KCZ8LfWF2exOe+zw/bh2eSSY0jxPic14/SwxJFYn1nluFmfBZf+MsJjs@vger.kernel.org
X-Gm-Message-State: AOJu0Yzal+yDXum86cdMbyTrwAMPXFfyPpk/HHb8DxP0oPMhFtxs2a5m
	HYdrZIAqhM6WYLIVxlUXSpxBHJiuB2GwUBkUJC9Qz94kIMO8OoeH9C4=
X-Gm-Gg: AfdE7cm5hYyU1V0x6v+czv1vIsTqunmHR0ytO+GKvXpTBgnsbKyCU+oriya5vOzZr1O
	LfYShEU+kGAfi+0eniG0iN1syp7O2KJ6HrXWXcU5lV5v6Uc29mvVbIYO+8ylMgSibgT4Fz8T+1G
	GNmmBu5F72OCjuRdn9vfkAYtTlEc8m6TCgcV2YzrU5nuDnnZQVixDTYksRpdaipMU7wy31pgBmR
	J1hSZ3/5RhhDJ1N0AgJNADblgvqf/PpvUjY8x+8RHuByGX4HCROn+JYu4ULS7Q6NeZLuuPF3wf5
	UtNSN5JM27Ha04gJvLjJw6eiH0gwLm3PPNufdByuguipxQ94bavUljTkKSMB3EO1mb69L8Z5UmM
	+RqJL8RNVVlXEudobvBHjd87F0WFG+LirVGhKQG7oiX+dZRj2RqWXtF6fWHBMyRRW/f8sBlfVr0
	kIHBjSbde+j8ZiQ+yt56SmC6qJTETdoA==
X-Received: by 2002:a05:600c:3f0a:b0:493:bfad:9d99 with SMTP id 5b1f17b1804b1-493d11db690mr80342755e9.13.1783278861616;
        Sun, 05 Jul 2026 12:14:21 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:20 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:38 +0200
Subject: [PATCH RFC 04/13] arm64: dts: qcom: sm8650: move smmu sid 1 to new
 lpac device
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-4-01d50c3e0c99@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=1315;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=W9JuocKrQv+AohpUo+PmkcNR8I1xfDAl+4Cp7RFtojI=;
 b=kEwYPS/vxpnj4j1Y93tuTQI1VkpzxodgIkiDcPohzvaSRPC/w1pcsAEP4JHxHA84titeQ5f9H
 M3dIrUAZLjTC7VIAtRzh7eh4qQ+kjl3T5Nk55cOzsLMoPsgmplJk+HF
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Previously both SID 0 and 1 where associated with the same domain.

When LPAC is not used this is needed so firmware can acces memory when
initializing using the same page table as GFX.

To use LPAC however we need to move SID 1 to a different device.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff37..44e5f9d4b335 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4133,6 +4133,13 @@ tcsr: clock-controller@1fc0000 {
 			#reset-cells = <1>;
 		};
 
+		lpac: lpac@3d00000 {
+			compatible = "qcom,lpac";
+			reg = <0x0 0x03d00000 0x0 0x61000>;
+
+			iommus = <&adreno_smmu 1 0x0>;
+		};
+
 		gpu: gpu@3d00000 {
 			compatible = "qcom,adreno-43051401", "qcom,adreno";
 			reg = <0x0 0x03d00000 0x0 0x40000>,
@@ -4144,8 +4151,9 @@ gpu: gpu@3d00000 {
 
 			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH 0>;
 
-			iommus = <&adreno_smmu 0 0x0>,
-				 <&adreno_smmu 1 0x0>;
+			iommus = <&adreno_smmu 0 0x0>;
+
+			qcom,lpac= <&lpac>;
 
 			operating-points-v2 = <&gpu_opp_table>;
 

-- 
2.54.0

