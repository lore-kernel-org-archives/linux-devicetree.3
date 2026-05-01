Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BA135F5F1
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 07:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777619738; cv=none; b=O6nsiy+uP350O2PvtD2FkDG/e9hcO1FM1KnEXhDLoM9+wl6VcIFkvd09oZ6pduM1tdhfmoavbywt+t3VXhCNADBBYrMsy1/Yfd49WF2UbleCg2Glb40jvzf/niZoYmHtPdRxJ2Aq1JD3R0xwS8TShWieyaAxRY0fJqO0rukOurc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777619738; c=relaxed/simple;
	bh=M4levVKqvb3E1M9kQrx1UfApgZmV6eS0fxmbvwGU/sM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oq4sI9iqEupxQ6ougkKaT106FZJ5CmppWyLsON2XFoJsj0EadzqElBQG8TQ4igLZmQKrRxaJ7nAQt1y8hqkVoP3/MDU/eBGRhqGrMaW5lBIY5JR3fmMfbWr2gYHzRxqDVZw0jwLfmTzRLm5/7MqcOEUa4HxQuZ5IyYAp8y1fdDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=vDnDCMfV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="vDnDCMfV"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so10647965e9.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 00:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777619733; x=1778224533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOClhrJ15xoCIS1DoMdb7YME2yq0/VJyl12Zk7EZgH0=;
        b=vDnDCMfVj3wqZhNvyAkBmWrcnhsB+sgMWhfTBzDfLo5Bl4ie6Nh3leO3iWn322K9SW
         4E69tYyi8W3G85rJShywSt6+El86zzqLDGN9EvQak4lpQ5WehRnBfmt4LboZKPqxu1pl
         M7JEna65nhNmZbEag7hh7gyZ/C8lfDL3NKgOlWUJezkwl1JxbhA+pS8JXBaPfeqAEfJq
         5PMIPuhskm9p+e7Y/SE43jlZ5J0bWZsainy5qdA7aekSg5+D/m6aNsruThNhgyD/iHuy
         0hV6naFMrz9UFUMqYXoZDv9K4I620L5DmF1eRGYE7hUARrmmTbbyY888nQr1eAqTTD65
         8LWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777619733; x=1778224533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yOClhrJ15xoCIS1DoMdb7YME2yq0/VJyl12Zk7EZgH0=;
        b=SM77TGCTxhAGhvq+5FCa/Rjz6gbfhFzGLc2O7kHnP40s9L3UEKgV23YWrHp1HN8E5c
         pjkgxEjV5bKq7sJwWznZbaWw5GwnYCNyD0gocznOBCW05Crf/NhZChw1WCd+n2JiET7Z
         KTevc+XeeLXet4s3hxru//5c9agO+2Vg042rITihKWB1TcnFv89lgIKeriHxW3i3yvT+
         yrTIGDsFbKzPHdiohnLC6f/xifwuFvprOIGVUBq9D2eO72gHNghEQqtPhupCeOM0dT6A
         zAOBEgD6PD1/yT57SebQWMnTXLCx1uttKCqVXl4bbMAfz3rTcpiaQCbwDMyAIblhnpit
         6wIA==
X-Forwarded-Encrypted: i=1; AFNElJ97DxVtwPu0QVF+ApZBZWH+wpqYjGaLIJTm34jp3c7PssSftHud+4fw2cLArmcN1UROYxmOHGfDcnmy@vger.kernel.org
X-Gm-Message-State: AOJu0YzIQFJINFlwwy143U+bxyI9OGhATBVKTZPOUx8GybuPNuOvdGLj
	TQUwPhXeluYeRKUnvbn4LmWvOMgFsHe40f1DSqVN/XUsmrMxUb4wH4e10O7UPAUXwaA=
X-Gm-Gg: AeBDiesugnxWzpnMDt+72IeqqY0sVqRfvK5YJT8pd7XbeVS22aRBl+FqXeP54kTacss
	nx1G/4yqoh3QZQsYgpXdJBx9uTbVhjKNXi66p5vLRATlch8EFUO+BXulCkTsu5gxkYWw6S5f2uQ
	v5lsvc7qHhddWvowWz8ueCjVVVdyBrMa0TUEZv2Juro4KRa6gd2tIw1sRFYIQ+XcyieTsVvG8EG
	N0jeQsCwNEcj8+qi5xDBsSi+vFjU44HmogzlRdMyTBVOmC/Ai1guY9WkXdgRT7wVQtNGzCtSiIz
	FILUyjCgAOSKcl2ELpLNRQv3FlHC4QJeYEMxxUGiaq4D8+UUIUj4rh/ggmyPbsWorCA6wVz2iwL
	68ASb9T0dlbHjE5d1Ef4Fnkdz/caPvbkKwZd+ClMtwdQ/K6x/4qGDSC281NkfvbHNzh0EobZr8m
	AM8LW6rVOVG4PjpllGw/5tQ+m8beRdONWp4CLUunTpiLPgMknh5RcuquZAE+QamFknPcBPa5zGC
	eukGOsz3Z3eHu9cSnY=
X-Received: by 2002:a05:600c:4e8e:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-48a860758c7mr85960465e9.10.1777619733040;
        Fri, 01 May 2026 00:15:33 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm29668085e9.11.2026.05.01.00.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:15:32 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 09:14:47 +0200
Subject: [PATCH v3 5/9] soc: qcom: ubwc: Add config for Milos
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-mdss-v3-5-58bfc58c0e13@fairphone.com>
References: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
In-Reply-To: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777619720; l=1658;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=M4levVKqvb3E1M9kQrx1UfApgZmV6eS0fxmbvwGU/sM=;
 b=ACM2ohFxIVpVweQ73Py4edYjMY/+UctWWAm6q415d5l1h+x9zkwG1+1YDlS7uWPHXVnGqVgvg
 70I2MgwnnolDWVS0T80Y9qdtwDKYYSlgrRpbeRegXvb76KPmYt8sMpI
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Describe the Universal Bandwidth Compression (UBWC) configuration
for the Milos SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 3fe47d8f0f63..1551f270afce 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -37,6 +37,17 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.macrotile_mode = true,
 };
 
+static const struct qcom_ubwc_cfg_data milos_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 14 for LP_DDR4 */
+	.highest_bank_bit = 15,
+	.macrotile_mode = true,
+};
+
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
@@ -247,6 +258,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,kaanapali", .data = &kaanapali_data, },
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,mahua", .data = &glymur_data },
+	{ .compatible = "qcom,milos", .data = &milos_data },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },

-- 
2.54.0

