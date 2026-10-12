Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC1D376A04
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810208; cv=none; b=W3BJfnR/kuIt8ONw0fJ7++hAF6DYBmNXQBOpwseGyh0vHtDZm5u017wS1TpqaDak23u1yDTuBLBk9lialyDWfcqjc2Cb/FPCRBY76ZAp/Eybi5DjF9fVWaYSjLMRO44XStev7W518cxlsN8dwXmpYnOYrbUp6PnChiv0kOPNVZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810208; c=relaxed/simple;
	bh=4eFSyiDmd2ZxmoNE8OwStpaw8zUdwL2aJ3YunvWRUck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qnJedlNaMXomHuIPw5QESGFhUbWZCnsbU4tcV4tUvUZr++BAR7RUl+3Gfn7j0Oz5xIIvyotmyybv1N9hcRUMaw++oTt55g/mPz2BMy8WD6DPLD02i+fQI0Xx9dASNGUwoNk9fkZcXkMmz+Co5U+a9maWsIrvXMTaQHjpuYFC0Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=g/R9S3Fc; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="g/R9S3Fc"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1801450f8f.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791810205; x=1792415005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYh7XnX19z/zJw6PTcI1ox8qC0mffPmG1CPnxaVd2wk=;
        b=g/R9S3FcgcAQjXXAT+UJignK64wo5XbbnC8Dm5URVo6HqXmwnvOqsYrNtQP8bLKrIk
         TXwF0j3nr6Qq8tJjkquntZPKMxZ4AoxzbbuY/LZ8bF/7o+opn7zzHKcnbH8eVQ0+H36n
         TtRFeYYYnmImZY1RagCJfjVI03IJ8dlf/QuGQHVB+lFNEiH6eTIBgWC19Hu6yVe4wsXH
         mhCXiU2V3R+3qfOJoG7VPv3GuNC/oBzQoJEt0ivBbd3guxU0CKURzu7zY27mRUTLFIag
         jvu+Iamm2fg5BNeHBq/iCSu90FU9q3cVXCd9PJ6+Bd25vypOWzMj7ImwXbnR+AmRQ0wX
         zMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810205; x=1792415005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYh7XnX19z/zJw6PTcI1ox8qC0mffPmG1CPnxaVd2wk=;
        b=GDmdXVqDqVQ0QtmRPoupnivu9ONvZpaD4oc2vdbbioPgtMf7xm0X/R1KkufTEMQRUx
         4cEF/VM+8Fl/yRYSpFj4in2BcpfSSOeEnSkzjV+5UHWpvsoTbvx3tTVrQ/5WUzEaqmZ5
         dIs5P3o2B+4XU+H1oyM3uc/xuhGjxT9sQ7lN0XpZK0vNKm+DoxQ9iFyu69wzbMk9BLDD
         o9zfRdttJouoUtbZVHeRbyX0EZgLGSuDXSEKnmYnxwFA2g7HWjuqZ1b87kr9xqk+V17r
         h74Wz+F5ba1+zdZ6uRcuEVq6i4YDA6pPIdbO9iNnvCSY+llcxEqK0fFCTRThjnAchhkD
         c6lg==
X-Forwarded-Encrypted: i=1; AKwUvBw/laEFJjwIniXswuFbnmBzIHSfkYxEP1hjk2VkvzzcdXn8AorAI0gE4uTEynNpFgGWTha3bJG0y3V2@vger.kernel.org
X-Gm-Message-State: AFq9FYInsLCx+qr5yasKQ/or1QCQb5pBDG6+VrB9bugl6VieQW1tpVBX
	yhFEjMm/zwjf37G2LE8mSLTF/a1XFs1tHOF96XqMyV4WyfT0FWxVknytSaqAwH1tHaw=
X-Gm-Gg: AYBFou1H67y2zsZ5m3jRgzvUqH5p+j8taMre04kgO7COvp8wg4QMAlMkHCQFKiASbca
	boP9mannimAJ31H7gs/7KScUE5FUrrqPMAJKcNHeU2OWbbsqGFl31KnOlxtP3BsTIBbtktwuuwS
	mKzZ7O7E9gGoC/p3J09CiGUhTrSEwHfkocLn/ORPoUTNmT0yi0DKrUIc44By6Txl/8LZ8bsOKpr
	FKxwXGq9+JJvN/ABon4OqvIRol3N2kt7XrcVklqYp/xlr+a3oA0CmzSKrl2mkGmIeVGSUqalfbJ
	hr3HZuBcTyBZ8rMC307+FDlCUr0doUJz7Yb3aAJbZXjtBPhXU9hbK976PSRHdONIV2aZCDPfELR
	JALhxzvKIXDdC8jFZ7YFrDmomfnj8MyD9pmG30NJ4/JbxI2uuRgYwp+2/MYpDTMB77t4a+b/Q16
	jRqBmoaMqqTJjDjn8Uakqpvjs3tV1B9/y41SCyFRbbFmrh43NHX3NqSdsKka2JisuTkgZWLqv+6
	fH5XM1eGyqwcxTsqo7S2JFQ36SBHs7FfMekM7vUJ/Yclr1zI2FoImBDF+ViKrQy2YV2dwU70h8e
	DU1jFow41demdpXUrHKXPg==
X-Received: by 2002:a05:6000:4908:b0:48b:e50:7152 with SMTP id ffacd0b85a97d-48ddb2ca05bmr3010994f8f.28.1791810204783;
        Mon, 12 Oct 2026 06:03:24 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abdaa5sm20088782f8f.35.2026.10.12.06.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:03:23 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Mon, 12 Oct 2026 14:03:04 +0100
Subject: [PATCH 2/3] media: qcom: camss: Add the SM8550 CSI TPGs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sm8550-camss-tpg-v1-2-620ab6f151dd@imd-tec.com>
References: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
In-Reply-To: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
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

