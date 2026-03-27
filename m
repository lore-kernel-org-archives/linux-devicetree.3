Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A2B349B18
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 16:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627960; cv=none; b=dFNbc0SuHHrLboj2+zvWoSMvQ7VPogh0i+fzpcT1AgltWJUOi+9cN0yZU53SY8Vg3i9uRnHlQ/S4ufxhOrLGsP8vudnKZeNEZYzwxAoDdYqiV47IiDfvQIiMZzKRWj8ONwDAsXjEBvhVLlHkLOgf7/kOKpT+A1PhvpXq9i4HAvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627960; c=relaxed/simple;
	bh=5cRqSrO9TWRQUaD7bTpD1ZxLquZmqnEMTYi63NVSawg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s4rT/l6UdLLmLjbTYZL7WnbQ4orRscNTnLT2Vw5S1KTzzZV1JSQssdWlXkF6chLr19/Rd0KywBMFrw3pYtigyY1gro21Mq6ztb+YYsmnnHOOiEmn4zdboFx1IZbLeKXv7Qo3dxgo8d32pAhRqZcwUhd5/pAPJVpogQD9f3xmL9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=TD6Y+/Dn; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="TD6Y+/Dn"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b941762394aso347708366b.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774627956; x=1775232756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jDY2PYGbaZfyJpszHkpHZ5M00y7JZRiJojTTA2GybA=;
        b=TD6Y+/DnMebuVJMFs6ASMGZIC9H8GNw5FEEUp7aIBurPXYMaxK24GHd62pgKKSVYVe
         7G0sUpR0A2rC3livq9C4xhj/fKdh9/Z5NG/vrAYixu1I3IiTx+BZQ1UgCmBIRynZdc9M
         C/TyR5do0KPuBY20/7JmQ8qomqkaiMXBYy+DuyLUbsXbOfbBUhzeqIvdF3LEbFsK9KKv
         Fuhj9wXK6GobTdTwMCpHp8VCCyWuVy4P0/3qOgM9ZAqaHEmWnCWTP7CQ+ACd9VYvTnAV
         mNGcaO04Zh9WDyfhhh1BLE5w7ue90FIIVOsmaAh2cIiiDMTY7nXtdnhG2fEnJ92rZ3XD
         K34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627956; x=1775232756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9jDY2PYGbaZfyJpszHkpHZ5M00y7JZRiJojTTA2GybA=;
        b=EtglOERCK89Y9TIVSHmLXqp57FIx+65iiDL9UziuiCyMTHto1Eoz7MN1DL0uwH0akD
         X+8rdqs/ep41Qit5mZA6NqzE2Fm2izeZRQ9RE12WKfaR85NrFSHaSnswXf1+wbJ0BjZ5
         xMbqKeJCl+DXaw3dqNnC1a5xNReG9yo+G4CmiOMgKyKMrZzjveppLlWJDSZqmqB8Obhs
         CQEWsejkXJDel3brCYcw6eyxX4Kj13IlBEX7Mx3Fy/YllH9hE2FEkVv7vRURT05+Lxhf
         83MhL/M0HKK6XCc0HvcBgZHBMz4lP55OAAHoM4hmypkAjEN9mfu2ZXAkvGSy2MiqaTlR
         J0bw==
X-Forwarded-Encrypted: i=1; AJvYcCX3KIdm8QJX4h4Iqhz9drmYcfZtKzP0N9AwNshH1jMP5XdQfu5KfMyqNUfLowG2ai/xWFQX+Y0lCRTW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi7Fj65jT290vScqF8bCRY5+d+8WI2nROOAvGZ1mQtnQ7Sxan5
	D33wzzkroySQLZCDwv+x5ocEjw3YOlzZQgpDLwzf3iSXjrArvL0d/33oie2jPgD8kSM=
X-Gm-Gg: ATEYQzwhbFIynWsMeGUIXzfFJDvLODVTS2y4GQ8X+aBp6rG0nMJLfGoWPYvqND5vZEl
	rbGBb5BH+i833/BP9uQhYDMccJxF/ZAmFZN72jv7XN0DR1TxKkvAfzCWgij3WtAdRckqv0OWJq4
	Ih4KtfJ+SXq5HNN7ewS+0rXpD0GgTHHStMkcFAUfqaTvmhIlrEhZMalBCAsun/MEvzL1PO/5gNZ
	dc9bfUW4OQtnHxlAe+BtLD1CyL+2z9lDc9jr/NaIjmUxN+ILxOh+/bC+l4/tfTpg6pItA6Hli4m
	HY/6vHo2Lhml3WWLq2e0aq0dyJjh/gdlfkzr9oisDFnwUslwC7bTddunyubu0t6HTSUxoWH7ezV
	K9P8eLT3py6dA+udieKojUYsP9PIcm6rbDxlMqcJgNvONsvyLS9Ni+YXoqg6Y0s4zx8XyK5GKlb
	IijH4agplCcOqLfmYHF1uj60FTaMHAtSd9kGzCrWkssLS9xpGTK+2VT1WtJO1vN2XgFX4BFKW2u
	r+U4A==
X-Received: by 2002:a17:907:9306:b0:b98:4abb:cc49 with SMTP id a640c23a62f3a-b9b502bfd00mr209569466b.5.1774627956162;
        Fri, 27 Mar 2026 09:12:36 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm273518366b.15.2026.03.27.09.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:12:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Mar 2026 17:12:24 +0100
Subject: [PATCH v2 5/9] soc: qcom: ubwc: Add config for Milos
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-milos-mdss-v2-5-bc586683f5ca@fairphone.com>
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
In-Reply-To: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
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
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774627949; l=1658;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=5cRqSrO9TWRQUaD7bTpD1ZxLquZmqnEMTYi63NVSawg=;
 b=aIVcCFwLleXDR6BbWbAVLdZGSgSQE3T0zkh07vYu6x6K/HU3SUHpaustvo0IrxX3T00BKLHOA
 f+oyhjM/FIkCWLIqvrDlNpWYSCHXcofk+OrlUQkx6J2XtUJlVtSdlnu
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
2.53.0

