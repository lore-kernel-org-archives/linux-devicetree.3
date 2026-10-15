Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7783550B42F
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057797; cv=none; b=F1UHveBqb59wkMtkoumUJYkFOibk4xOZTJLT7RhYbwcCGTdaEy9sO3DtgPhxtfuO/KVwJhWiRPecY3ot1J4oD/Tq8D0TAxNI5rn7yTX4m57VjlwcbQui8udZ4de+E5pog8iSJNWjW8evnbu8+WwaggXAVLX9rW3dFOdUe+Ahpqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057797; c=relaxed/simple;
	bh=XvgF8W41tbW2lHMVahBlNpldH+YcMd6GhMO1LMhmmQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MWWjXZsi9XIyq4RpQvjRPNfvRhy4RUXN+SAjBuhMjWyozJvX0AxmaASeu9VLQ9jac4RvggqISoTpRvnxYTELQ0iufOTBGxvowj5E/pVdZxop5mk4ylXBX8OBjrQtQwv1/n1KVVG6XdHravERJZTQ6ZobT6iRH+wSPsx4sgzuf3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=eNDcIh1h; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="eNDcIh1h"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48bbb06e746so840853f8f.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1792057793; x=1792662593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJMs8A9Ik9OWOlzlXjQ55DgLEVWbkbVkWzr7Q1/LXyI=;
        b=eNDcIh1hoJ8vA1phnbTk72RnXHYklVjdn3+7LUg0Z/KUaiQUd3SclE63xHRHLsBb1d
         HjWD/iynYwgBM2M9JcSbdw2EPRZB5uT2XqGsmk/H4pUINhWZsMnI0WDcKuvuwZXRcL8L
         Gw/c2TLsQZNvOcRyW/vtAkiry0i3acAU/Vy9AleLCjpMQrF6Xbu90QZR3aNujgvDBhMv
         7TFVIJzS3aTxiD4GHC+TmK6DiXWvwEAQROb3GHu6yKn7rVYYChlNkrfk1S43OeVVzCLd
         v3u6wvATNL2cf8Dm1zgcKYsiFUXnBJiR6CgqNlYEXaLwyXCKD32mKu5uDTOqp9DxeI7K
         ZDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057793; x=1792662593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJMs8A9Ik9OWOlzlXjQ55DgLEVWbkbVkWzr7Q1/LXyI=;
        b=w0Y3Z8GXNMskVBGifUNarXgfWnx7oFlih8KJQyQNRCAnso+lMN6MtRihOKEBhs1BZh
         JESp9orBWoSPtcjwdu4PmH5uDyF8Oe+Csbjhr7w/wbzLXi5CIK7zOznpz3ptZBlNKS/Y
         OXl33Z/xgl1xa28M1+Hmo2VxlSoNb2WflksxQ8gS/RxNEeyQpvN1Qnem9pKwbcLO2FQU
         bFBwfV9ikWktgPnGyj0ccsqKQNANal26cSwEt1EFh/KjQaNoQ1cQclv3Ssd4JsZV2NdI
         wdMjuADJsH0kSOJKsGa1C5dEFb5665hHov8F/eXeXEQ0pKWKYoXmVAwehTJ5qpdrc59T
         deBg==
X-Forwarded-Encrypted: i=1; AKwUvBzFAEcXIPjkvRxbCcvqOxJLnwzMC7EFTlJp+dkIT2terIomnRzKIvBWfyVuz7/4aLvbB/P5WPo4OBu4@vger.kernel.org
X-Gm-Message-State: AFq9FYKF2xHxbEzbjaau4v02hZgG/kjsajIFKseEdvshpqirgEJEy0gu
	ZRp6XcViHeo0w+zkzMgcUd/BaUjgTMLSTEN0Kd4dPaxHfbamZfBuH1TcsWaqtDZjcJ8=
X-Gm-Gg: AYBFou2/roSg/dCuY2F62jw8GS4M+/F09IUoWm3Y/JXseqdNHnKnou9B/RgNSs+kdbB
	EIkgscBj0EsZIoV0cKJGglfRgYIzHEf3J5YOyAKaOIepDZo11I/uRJbAX1x4zHy9xMd8iMTCLGj
	Nlt+LwqcqIr8jgaDrMJJJ2DSveehU6umS/cRZkVZzWSsO1qa5rPNlmfzJfcI3/eFS/+vTFxoc7h
	76AmhaLRyGPOQuTLDfhOwazyite/rcLo828u4k1eevWRPBR/JI1kjF6ILJfdon98XG8FMuiJLnO
	iS84GUHFW029ufHTowmoNaFB4MUTqm+uNRQjYCdzWHFtlnBoAx3DNop8/XQS7E7cofKLPlmMeVq
	QyRhx7lI6XL7Q4CxXZugVWvl99Wi9wq/Eh+w/CCs9iTjCGkYN6FTeG4MSexsTqOK/lbtYc9yfea
	2T0TufcLDuYZYAMrhbH3l6VuHvZefJY6Xezblh0h6VQIN4pf0gxfFTQVBiCJRLl8yOg7YTqVinA
	5+a1SPEw8X3XlVWiwNfKp98hcCAgqt25GQcrl5SuP6gOV8O/96estIyxJ2zha2WXRdyDifCwyOl
	REkeDQpcpFZSVziLl/mMLqMWan8=
X-Received: by 2002:a05:6000:1a8b:b0:488:88ec:59c3 with SMTP id ffacd0b85a97d-48dba9bdc75mr37096945f8f.14.1792057792694;
        Thu, 15 Oct 2026 02:49:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:273c:cd01:737a:1f7b:d586:a293])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc85b1sm16926246f8f.54.2026.10.15.02.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:49:52 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 15 Oct 2026 10:49:31 +0100
Subject: [PATCH v3 2/3] media: qcom: camss: Add the SM8550 CSI TPGs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8550-camss-tpg-v3-2-00fe06a3c557@imd-tec.com>
References: <20261015-sm8550-camss-tpg-v3-0-00fe06a3c557@imd-tec.com>
In-Reply-To: <20261015-sm8550-camss-tpg-v3-0-00fe06a3c557@imd-tec.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

The SM8550 TPGs are hardware version 2.1.0, the same as x1e80100,
so describe them with the gen1 TPG ops.

Assisted-by: Claude:claude-opus-5-5
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 drivers/media/platform/qcom/camss/camss.c | 50 +++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 5128dae79103..70f327484503 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3553,6 +3553,54 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 	}
 };
 
+static const struct camss_subdev_resources tpg_res_8550[] = {
+	/* TPG0 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csitpg0" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+	/* TPG1 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csitpg1" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+	/* TPG2 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csitpg2" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+};
+
 static const struct camss_subdev_resources vfe_res_8550[] = {
 	/* VFE0 */
 	{
@@ -7245,12 +7293,14 @@ static const struct camss_resources sm8550_resources = {
 	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8550,
 	.csid_res = csid_res_8550,
+	.tpg_res = tpg_res_8550,
 	.vfe_res = vfe_res_8550,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.icc_res = icc_res_sm8550,
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8550),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8550),
 	.csid_num = ARRAY_SIZE(csid_res_8550),
+	.tpg_num = ARRAY_SIZE(tpg_res_8550),
 	.vfe_num = ARRAY_SIZE(vfe_res_8550),
 };
 

-- 
2.43.0

