Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07068382F12
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 09:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777627126; cv=none; b=auzo4WdPKey7RNxv71GTlPfKQdufX54PQwxZCRsC8Ee09LJofPC4aG7sl7S5FWvy6kdLHd6jusni3+Atgor277EgV2dhJnwmSHy/kLtRN/LkmkyZDw6w5cLi4qPtW4Otq7bTvGbnIcM5TPxlRq2HzUPhFSfPTJ7HMtHOD2dN6GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777627126; c=relaxed/simple;
	bh=XcfJhcCYTkjzBCvg/Cxuww7QqKifGaagi9xIyyI67cY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nQc7xqwZqyxyXbnMwHFimqLfNOvLJxbBUuRM4UHx4WSLjcZUQ78h/X2KtukRORmt7TFkelhX8xrHmWK1+17FWKS/5spWPx+XeNN378zQM9pf64Zpqc4nE8oSr5Mg3ZEiuR0fqlekpCoY2cs0pei2ae5KnumVTJl09F1RuEE6e/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=UmFMgQ38; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="UmFMgQ38"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44a786a9a35so321562f8f.3
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 02:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777627123; x=1778231923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZnuErBRIZTrfkelR+38i2qfJhgtaQ07JLYCEdmx/1ig=;
        b=UmFMgQ38nVJ/7i+khKEJsxD3GRutbNe3PNGcY5YY/XzZs/AE2Hp9KL50iJ9hPe0S1W
         NlwTiiQ7eYOMW/uRpxKHacoOu8xkBe1f0bur6yjdfIuCUTvEAMcMBXZi2zVathZbyIjc
         qW0GdJPpqhGq5dAGfL5gEh9D5hKTBantio369Yh2ThDrwHpFEzQgLXHfw9nBUKxyu0mD
         cmuNxQVO5CRhaKrxOcjyK8rVzAE2JIowROne/CiskazjT8W9iGu+cP/+rEPBAdsInZkn
         TFfWO8PHzgRYjqxFiLQzYUBw225rZrDdcRu5bR9OOS/tHShTVQhokAkAVzdHNLuAKLv+
         Q6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777627123; x=1778231923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZnuErBRIZTrfkelR+38i2qfJhgtaQ07JLYCEdmx/1ig=;
        b=rfnj2tQeygvVZ30dQAZTYZctfl0bXpL4ebWBWDPUfniHnfa5oDe8j3Mkkeo1wqHU84
         2o+3u8YqMS5a2bE66PUYzD+UvRrpoubVDbtfD4VljJLDA/mLcWG2eriVPn4DQUok2fAa
         55zYEkmoYWf+XK4VPu3J3MpJ7Stil+Rj3svnqHJU3UE+IaJ4TcXP1tyGFwREicvk+Qq8
         D3OHR7MI7FZgvVvMdjkupZdSCFZR16JXqmR2Yoe1yrT9YIKzThktg8ghrtmr13Mon7ee
         /sokcYfBmCmgRHfTtT2Si9+mWpos41ktt+H6cQl6cqjyxVCrIRgktoWkOgMEXIrz3l70
         0JFQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/HOn3dbRjrZcsRY9dbWANrh09kCS438RpxzM6p6BBDNE+nb+7BLgzpkKZ4FAZqX/1bA3XZIUMX9hF@vger.kernel.org
X-Gm-Message-State: AOJu0YyWnToz0iEsgef9Tp6LCVAB8mE6LcqPhOHYXwYCgz8iD0a2PZMr
	RzZydAU/bBNEQgXs8NZITZyVE8sh1uwUbf4jKsLpZCRL8aBeNh8F7qetXFuH5ypw9BQ=
X-Gm-Gg: AeBDievsgvfv23V3FCUrahlsQjwuI+OFqFDbYXDrXgU/VKw+zUksGwSXYPKfsZMwV1u
	G2u/nfdIzEAwHTqz9DLGZIZkTW5hQSsAjjtywZJkz+/BNGRNWkB/emSqlDL5bgpk/vv0l1xD9cs
	TdkAxFvlMGJzJZOskOVjTK4jbe0VVoSHrS5aFgAYpDWj/oh6ScsxH1GT7Jt7W9Mt03ZWIwyq3hR
	Oo4b9O+yAsFVRHltRi25qUqSxlLWe/qgvrZ0+QYY1WXvTZZsoEG6DWt9iHZLMLhY7QieXpO1zy/
	0ZesCqhYIBVpDLwPJA/Flw1PTXXgP1k/oH2KcaxtzzL4Dj0vY2Wt8HCAWZmv95sRNZuGpGzXtbL
	M8yMEE7mvtc5CoQELdbf8EIcFqFCHtuTzl+H+r9axwxH87VK8mCoEKxehPcHQUoz8WaHNcwb7Gd
	GHjVUi7HeZlWUpsCbEQe96bi4ZUOYUVNq6SMDYuVxVS6l2wNwjm11Al7N2+rth2SkcwRH8Wz78c
	2VzmjAL
X-Received: by 2002:a05:6000:22c2:b0:43c:ef4f:79dc with SMTP id ffacd0b85a97d-44a857c070emr3502853f8f.8.1777627123520;
        Fri, 01 May 2026 02:18:43 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b76fd0sm3820787f8f.35.2026.05.01.02.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:18:43 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 11:18:33 +0200
Subject: [PATCH v2 5/5] arm64: dts: qcom: milos: Add interconnects to camcc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-camcc-icc-v2-5-bb83c1256cc3@fairphone.com>
References: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
In-Reply-To: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777627112; l=1001;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=XcfJhcCYTkjzBCvg/Cxuww7QqKifGaagi9xIyyI67cY=;
 b=RVgZP6zl4igJW2UZF4EhCIuRsywJ8TJPAYhxRoM9TMx2tC4OgST/C3rBNwMdp80Ll37kF/tYZ
 MYGuDVYg64VBfwf+ZTJzwnsyd0MuFm5A68MD5NmQcV2KBVshRvgGaqL
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The CAMSS_TOP_GDSC inside camcc requires an interconnect path to be
enabled, otherwise the GDSC will be stuck on 'off' and can't be enabled.

Add the interconnect path so that this requirement can be satisfied by
the kernel.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 4a64a98a434b..80208bc33730 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1923,6 +1923,9 @@ camcc: clock-controller@adb0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_CAMERA_AHB_CLK>;
 
+			interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

