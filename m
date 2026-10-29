Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281990;
	b=ZCOjr/A/PgyCkFx9Jz2/rAGD902SbmGubdJ28mUFWT1EIOPElvnKeKrvaKKAUS/FoXg1
	 7ybUojkx+2SSzCCuu7cNZvHygWb6ojpMvn6wE4xRsluhtN24BFxa+ALq7EkjXCHiS2EXu
	 hNtQ6t8yoHNix2Hypfo+bxg+wrK6URKz/N+zwEEhJ+1z3GFbdZ4Qnor+NuxFbMNr0qHmg
	 URIWDgKiTVK5yW6fauzC0huBKEuv/IhSFiUzGC4ZgWcOjogQNg0PmbxZZ79G7+DOjG8Mw
	 8E2ZkbJodUtNINI5WpoPwqJVufHUpmvCdIjoUq4AUEui/B5OJXUCGSXLI/w4ODiGLhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hqI3xUsD2cNMA3OqjFeaiLeXLoIzktOWAoDJXR6bb7g=;
	b=eacGo1CIqyucSjVHZ+9X0/6W4MX4XURKuT2dmgzKqXZ2iK+wtLLVtx+59Au9RVkEhJbH
	 03G2F4OqHlQYiXYkgX/YxICvu6nPD44VBcrCNdfAK4/AikxVH9NPQhJQ6nSBsQRa/aenJ
	 nTZ7g0855BzfqvfrzTvxt3xJ7JHpqRxQ5pGIi0M017JmEBgPMvA3QRMXLun6w2N4VU6SL
	 VThCXlkJPzA0bpIfJiGl5U/f5W3G9Gs6vigpiPwxcBsc6bS+4YYQ4zCzUIFjx+wGssKzA
	 Sqczh8uJAAvifP9eRwWR03EyiDtU21CJ2m5JH2o0TCLUNSxpgG42lNGmZ21O0NVnF8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XtMRmSyY;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E756606A33D
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E756606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XtMRmSyY
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1600977f8f.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 06:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281989; x=1793886789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hqI3xUsD2cNMA3OqjFeaiLeXLoIzktOWAoDJXR6bb7g=;
        b=XtMRmSyY4kIgLF8Gi8D5p63d/yjBO/9fVq1esnLLoU0GJLrVtihKf/btKMZSRPrwl9
         FKqssf9a5GRgYQO2LaNcgQmORqa/vCW0Qx2EVjJxpSXKEY8H4uOTeYG1RifJkBy1REZ6
         pcLHZEbNNKiW7SnzYzSGqGJlgzQfapSugzhS3I5BcsbKTjTdCLuVxMq6ZirmjVpx2io9
         x3w/4xuaoVc0aw8ildU8T5J3fG5NLULebjOWybvdz3GVRfUgTbwW9ubSiKsxOr5hfidd
         Tg6bkZIOqa85wZNVqvxcLxQkChG7rnTY+OOXeNVHSppOGEbUgjxxZdd4LZuUDhP3XKiz
         A1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281989; x=1793886789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hqI3xUsD2cNMA3OqjFeaiLeXLoIzktOWAoDJXR6bb7g=;
        b=C9PNSOU+9DX4X5BpSWOPKLZw9Li92KPuOrSi7PStCn8QwMtUT0nVVYhOKjMdbeGYx4
         XNknsqSnY3x4bUjNuO+bFKQrxVskSTCP9RqeUDlyX2t6kjKmpRUdaWL9YNmcBmpqqCYP
         fpmabc5yjxuwj8X0PJFKkDpNGXMeQu8FuEfqPSUywaZQediWnHYNtERb3pBKqYAM8XUw
         owLWevgJkrHFlnFsUPOQ+sxnvWT9WiFNYuC8NNoPv3trR15XnU6vJtHpOsz/1Tl31xh9
         /50PBaJM04k6jpRuM7CgF/m+n5uUnm/QM4HgUcwzJNKWL02PGHZ6a2oqWlY36pm7kPSS
         n8aw==
X-Forwarded-Encrypted: i=1; AKwUvBzK0OGlSwuHA+6+o5yb688x50R7hVrPm9c+Wjxp9paOF+uQt4mW68Ty73KJ8lgfbVWMiynJIPfHw0ow@vger.kernel.org
X-Gm-Message-State: AFq9FYKxkUUNlfmjfCtymOncZEuJE0T64EVmLHNRlU2Q15/Ganc5UuXa
	K7nJ65hgG6fwBI/pskaFbR9sJPHdt85eBotRSOVxgDv4Fq8C7BLN34I=
X-Gm-Gg: AYBFou0m/lZa8ce1J9M+AJD0CGHzPiYdTTmCD0eZrsY9+7v6Ycn+Lb+hQRQLv7Dxa3C
	fyx7EWf1W8LMemRAMaK8WrBQ7Dkr2UrPIwVqJhlLrtgqazNb7DQA4QW2aA7iboPsAfem/Jz4aRB
	qKSX/UsY9hscwZlHtTBTNe+dMn1pnpeyr/fhw+TCL4Y5BdZgS5sQP9p5Og19PV2QXUW+3CibeiN
	7agacQihqIDkrxioiWrFbVMNpBRzfLxmCzLQKt1fJ2FMvrPqLocX2/szalt0y1nI9rz8/pc0oQP
	nmQeeGvG0R57lvz0igPJpej30AA4kyxHscevWW1MFwVeqGY9Sg4LEpePzF0eQ6DkvyMW1EkX+XN
	d5ouRZqALd/6ZN0Qp+vo4DWcOQM7RrDLF/epKzMtn2LP1ZGNwzljC7c/eMyzcPFdo6RG5+JuSGP
	dwQwY9UYH6YfHd7bo+VJPaB3IVnV2BvcWtLTgS86M7IHf3Yx9rWOpCruTr5UxJORQSeT3ajHcG5
	lPQb/IFS36ttl96bEUmCKDaOdzHq55RYMM384taA8Ca8XCSuqr7x9wXP/Q+o5f2+OZrsQ3/hWcl
	DrD2jm1EzivAvMUu8Ob+HnLCaaUnCXAE23rVgDv7Xzal1Q==
X-Received: by 2002:a05:6000:2806:b0:48d:ff0d:cfa5 with SMTP id ffacd0b85a97d-48e5d5e237bmr9297013f8f.47.1793281988693;
        Thu, 29 Oct 2026 06:53:08 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:07 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:41 +0100
Subject: [PATCH RFC v2 04/14] arm64: dts: qcom: sm8650: move smmu sid 1 to
 new lpac device
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-4-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=1186;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=m8LjyZqlFLsxlRip5l3NXkwO7GG8cECPX+LNQd1tpmo=;
 b=ARxR4H9sfFo+nvh8rZ3WMz/5vBOcWptYc4QScQ6BwDzQQ9ZqJR17Rkbis3J/NCOw2T3Y+DXYV
 1uradRrW6R5Bl+J4M4CED5l+9lrrUHdMAtWHma7WA0JnTxjPc/6/H28
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Previously both SID 0 and 1 where associated with the same domain.

When LPAC is not used this is needed so firmware can acces memory when
initializing using the same page table as GFX.

To use LPAC however we need to move SID 1 to a different device.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff37..f47d1dbd06da 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4144,8 +4144,7 @@ gpu: gpu@3d00000 {
 
 			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH 0>;
 
-			iommus = <&adreno_smmu 0 0x0>,
-				 <&adreno_smmu 1 0x0>;
+			iommus = <&adreno_smmu 0 0x0>;
 
 			operating-points-v2 = <&gpu_opp_table>;
 
@@ -4158,6 +4157,12 @@ gpu: gpu@3d00000 {
 
 			status = "disabled";
 
+			lpac: lpac {
+				compatible = "qcom,lpac";
+
+				iommus = <&adreno_smmu 1 0x0>;
+			};
+
 			gpu_zap_shader: zap-shader {
 				memory-region = <&gpu_micro_code_mem>;
 			};

-- 
2.56.0

