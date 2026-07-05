Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1133A1686
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 19:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783278875; cv=none; b=mhxLeJz5EhkddiLTgszfa1zQvkf3W7IAeKW+AF1wzYQLkd5GaC810p9c/SvzbhcG3HCP2Z8a2p62A3qu6n/pa7jF+gOy0/YvC89GOfnNh5/PdlhjtPmIgHq1I6EkVY8HkyLx/1e6bsHCzbXZVv6PGzK74zmuotbzC/gD7DNJpLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783278875; c=relaxed/simple;
	bh=lEQBWGFQsawhS3Z+empPXIW4pjOUFPTBX61IJG+8wpQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AZLUG1JBKJJEqegcwgVm8h+Qln77JFXdCt8rzrv+mvs8SO4oMULeeljBts22+5I7aL4KZVZDlWdPjEGFuNphbJ0BMPsqZNGlXDQLRDxuWGUuaDtD8w3/hpk7JQ87HD8Cno0aJcLmbi6cDOBiXi+IjNT82JxFFrTm+XPEFFibXuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyDGPo+0; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyDGPo+0"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4758bd3731bso1540216f8f.0
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 12:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278869; x=1783883669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rBnb62S3pox4azVRKerhjkKWZjHIp9f0CrUrLIrizHI=;
        b=cyDGPo+03Vartu5Br9y8c62Pm+N9J0GGISQQ73YbCNwdeq0rUksNfb2x7d3dRPtr5j
         Zf/xgklxrL7hNvfuoiibqT45GBSU5FEvzqUDT0VN0GkCJRFiWmltYC0ckkmClIHJeYx0
         JJqA+3NaG/D8QiegSYmxbRsUkfy5k21EMFm+IAoeqMSJeljkLyMf4JeUL4ALR0Nko8cX
         UuusVVdKZVpThFZc9TMvHVwwRVuzRvX8lGtoytrjOFgoNwPnVNXdc1ulKwSazvlzzq+o
         gSsZKka68sbJirFHn+FgG29FcYxzFHklxZa+ETfrhbSN6Ok8xS9t4FNYN8uJeXwFq5vv
         GFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278869; x=1783883669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rBnb62S3pox4azVRKerhjkKWZjHIp9f0CrUrLIrizHI=;
        b=o2DfamAeePIdvoXBA/Xsu85GoCnhXeDAy5Hxt0dQ8DJ2sUFE/HGSaGGmZP6OTP1DvN
         yWlbkZv1Fki/6VMd3sRgIXj5g6hKup8miuYr+Sfrpc4pxTEY4kk8wUfualHGkhL0qygC
         QhapNlJXiNAY+uvCITksFKsBG6eY7AwV+TBRcD7vloDIKhFePJ/a20Bbgi45XkcOEiIA
         dBoS6c76qYUxV+D7xXl6NqLWy9z205rJVbUwpTJPX1LcP8m5JZ6sRes8+AzouTF5dmv7
         KkBE1OI0eAY+hZMTjELYWMBUAzibWXf2Lf5vVqqMGlp23oSH7AncacXASzdIk89+TajN
         F8zg==
X-Forwarded-Encrypted: i=1; AHgh+RqgXE88OpJIisu2edUUzecZiw0FvhCvG8yq7QIxrpT7qTOMW9DhWULwunbBntWchnfKKW/afY37DrbR@vger.kernel.org
X-Gm-Message-State: AOJu0Yzit1Kf8IMYxL3xxyCQqtusJrNeTXFiVyFcmaMgjQwZCrYO1Cj9
	j/rDjbQlQb1O5Ilj+FLv2Nr1cNSbI5GxfABLl9qV6CrxtXz/F8RaY+4=
X-Gm-Gg: AfdE7cmwqVatpTckdhztF6GuiS3RKjiTJOTRNTW4UiAooO5FQ7DUl9cfXFZmtVcvHbq
	D+D9DBQ+8dXbNFiKu1Gtp56bVSUegNPINGEInIBwmps09+YP+JJBpe4kwrM4RIx5vviZsBfzXC4
	5ePXBeegq/UYPeOHDeZAyAP0W3eDcsvmMZ36Gf/iXKaY7U3yh+mCGFZuqF0YNORRFTc9A8xCduX
	zYX41DHWIT50g17dm5W02w+um8h+r734rHCPb5rmuE1v+QRdZPwssid/QfDY3cKvmbcmn+y9DTL
	3+ZEMaWyr2DTuJdHrwZrSV6wTphA+f9FY2NnLgsJEmdk3gER7w37Sb4dzG+d3mU88PlNYEF85L+
	LlWpCoZDFsDUFWvdNBa1dczj/W47MYjlJSMRDdj91z5w1jSzURCWJp6V3C3B+wzNHPNbG9iqPkT
	Ca79w+jRxc/SenS9PHGWNGexLSiaaNXQ==
X-Received: by 2002:a5d:4530:0:b0:472:28f2:506c with SMTP id ffacd0b85a97d-4793561c1b7mr10294287f8f.13.1783278869284;
        Sun, 05 Jul 2026 12:14:29 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:28 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:42 +0200
Subject: [PATCH RFC 08/13] HACK: use cb1 address in lpac dtb node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-8-01d50c3e0c99@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=1103;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=lEQBWGFQsawhS3Z+empPXIW4pjOUFPTBX61IJG+8wpQ=;
 b=ghyBtO3mPmOZCBw2AnqYHPShuXdJyTE+gTcOSZ9YU5rU1L9CLwjDKC2Kyv3ZqsOQvXyq+rMJb
 aTedKIXba75Aenv0imb3SDNfjufYxVMYzOkJYRnVags1gnQPFh42M4o
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 44e5f9d4b335..66ea9155e228 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4133,13 +4133,6 @@ tcsr: clock-controller@1fc0000 {
 			#reset-cells = <1>;
 		};
 
-		lpac: lpac@3d00000 {
-			compatible = "qcom,lpac";
-			reg = <0x0 0x03d00000 0x0 0x61000>;
-
-			iommus = <&adreno_smmu 1 0x0>;
-		};
-
 		gpu: gpu@3d00000 {
 			compatible = "qcom,adreno-43051401", "qcom,adreno";
 			reg = <0x0 0x03d00000 0x0 0x40000>,
@@ -4254,6 +4247,13 @@ opp-834000000 {
 			};
 		};
 
+		lpac: lpac@3dc1000 {
+			compatible = "qcom,lpac";
+			reg = <0x0 0x03d00000 0x0 0x61000>;
+
+			iommus = <&adreno_smmu 1 0x0>;
+		};
+
 		gmu: gmu@3d6a000 {
 			compatible = "qcom,adreno-gmu-750.1", "qcom,adreno-gmu";
 			reg = <0x0 0x03d6a000 0x0 0x35000>,

-- 
2.54.0

