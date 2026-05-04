Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED61038E11A
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 10:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777888828; cv=none; b=leWWF5A+RHj6lOIRPQa6UTw4gLCYBX96ymPYKW7V5rZ+bifC2TomUeJIBhpprwcgJFqam6ZHe/Nn421pQJieW+K3NB9gGZylx2NRYizDcdJ/GTwKu3/ps8/ZRl/bpY02FqfL8JzDRg+5m/kGIKklLdIhMv7Qy24l/6kIIYn3Cr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777888828; c=relaxed/simple;
	bh=VnD9jdvKPvG7glRhxASxKCNThJUBqzwvtoYewjlEsII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ce7TJFMhlUny0cKpjHQo6mrST6XvLksGsntjBJOekWIJfcPOX5MA4mnnuxNEBYgqNrf5Q9o/y3e7+9KTMW7jbtcUOP39uRSrzTjO7gJird6rBGVF2kSdKFDUp9s7h9JHKhGhKLz8x74YMgGreij/fO6Py2t2JEM/sqPB0eWz+Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jK9ut4Uk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fzx26ykU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jK9ut4Uk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fzx26ykU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fTb33894174
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 10:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DDbLe9bSNnTNLNJROEag6joMnDPk6Ll32XnlgfU4CME=; b=jK9ut4UkiXuNJfJP
	uqiPox0nTN34wGmu1N9rVQMUsASvwlAETSChK3S9YBNycrPnrRoUJ5ejm34HFpU3
	kcfuqBXybHGTmttMdpXAQq6NIbkYj6p0ISHj1/ny6MEoqwdE857rPjDT1z8d237j
	v/JuqDfF/0d2JGJPoocGfkwZqnOrl4tRjKFuWWUZe+o5oKiqEHmG7086WiNR36il
	Is9Ree1PUZjY60EZnHDsXzZKBzbt4Ze/M5mRl2Y5g8GfRBfW+B7LzLsWilUi5yLl
	hTyARA9uKuTvMJL2BqcuVkeas5hXaCFLuiQkPAPHZVVtrLyF2L+WtuP1pBSOcj1+
	7oqZ2Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw6mpdf5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 10:00:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50ff051e189so101230981cf.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 03:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777888825; x=1778493625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DDbLe9bSNnTNLNJROEag6joMnDPk6Ll32XnlgfU4CME=;
        b=fzx26ykUS8d/k59/G6V9HFQVaISQ66EzkluIaPBRUSfYvtA+miZNWASpWEdYrkNN3j
         +ZChCQEOla6kOPaZBcalSJZQOMH6UsJXIBEx95yiaFZGwK60mvDoCDIH9bz6tBFVgCrr
         koitB2S32AypEJiamPn0fQuVffnrL48NFWrlU/YyWS8g8XM2qKh7+TOYaPt/GUUfo+FC
         MI2zl59YkVhmcmNQAkHVlcXPxmAw7vF3jJJOLHSCEgiHPBp5LSUpCBd0AXIPLYoQdRwK
         Dh76jvY7GEtPnuA/s7g6JqnNmRCglKZCFKiRXP5W/ntf1vYcP+n4QsJvLqSVHVy1bpl+
         621A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777888825; x=1778493625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DDbLe9bSNnTNLNJROEag6joMnDPk6Ll32XnlgfU4CME=;
        b=LDRL8SLhvu1BgAf6TCBQDSvilTSQZ7ROdCMXeNHBdCltTRf4gCf7q/UEdbRy3cLUJf
         g5FJ43lFCwJF2/64YsmnKO5rHsk4v2bK341niqfPxI6Uh0qeqZ3NPZXEST9ODi+G+7+/
         y2EZ5b6Mr3PwrE4FXZZSzx/aFT1/GLGJAPJ6GE2Z+bIIh1MHHe8BiiqNsTYo5boRHmcp
         +3Dd/dDk2S3Zj1oC+XOXSceAG/NO0uTvbFdF9LzY0BybqoxmYvTnTrQF3HZU+Nt+I0Zy
         HEMj3FCA8qk7JCvkujkB6WYpcxogM2dOX3IM4lJ4LD5v/zpA83c+2lBLMb4duKWnVQNm
         QMPw==
X-Forwarded-Encrypted: i=1; AFNElJ/Zcqf05smzAdnyRTcKrCUgIQwHwRiIOYFbUzqG0MrNQyvlYeCE5UOTEGi6/szNb5aapH0pm/f2xtJw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3LtnxbIhg5RHdUWWoA8At9Ik3uOGMmOeTdzf43RQpPoKg6++f
	0fAG28KJbXDOYakxt4mLxvFFR6dZJXbCXv7sr7DQt6KjDhvghz48MCbG+5ZWXp3nPykIzdPJkt9
	YfYZtCn4d9pN9N1WxWcENw2Bno7UlQR7s2tqTkq/CjeO25F82pIckAN27dObEjig7
X-Gm-Gg: AeBDiesZB5UyjOrMZwQx6C8889FuVWcg0jmfPpBSQ+1R/mrU0+T7lQgJB/WH6QWq2U3
	oOoafVi1cJTKhl/rLmrO3VZQwa+k6b+HLCL1awi6Y9zWK1C80v2HlUCq3zXjaDALibrD0LJYhEm
	s+sPUUOlP/jg5a88N1/RBecS7RUhnVOr5mRVxWj3hb22vuy/qFzpePaB8xXBnAyWuB7MQfsQE3R
	hBZvMVNNpuD+g5/thVobE6g5q5HFcUPT37c+D59pUPJppdm1vNUpbOBrmWlyMglCqzn4O5g2zq2
	M6Wm/n/aQRBfCTn34ljPN5GEIVt1z/kfsZfJVqpk5S2S3Eaeadii1vFk5Z6wgBxpRSfY3q0hGmP
	ytEDu9QHNKXLubPNHzAMX7eu7gQBQ4gf55WTampED
X-Received: by 2002:a05:622a:58c8:b0:50d:db76:55cd with SMTP id d75a77b69052e-5104bfae184mr125610751cf.52.1777888824917;
        Mon, 04 May 2026 03:00:24 -0700 (PDT)
X-Received: by 2002:a05:622a:58c8:b0:50d:db76:55cd with SMTP id d75a77b69052e-5104bfae184mr125609931cf.52.1777888824263;
        Mon, 04 May 2026 03:00:24 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f7csm324355955e9.12.2026.05.04.03.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:00:23 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 04 May 2026 13:00:08 +0300
Subject: [PATCH 2/2] soc: qcom: llcc-qcom: Add support for Eliza
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-eliza-llcc-v1-2-d7006c899812@oss.qualcomm.com>
References: <20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com>
In-Reply-To: <20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5225;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=VnD9jdvKPvG7glRhxASxKCNThJUBqzwvtoYewjlEsII=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBp+G4xusshIRi2SzPrkoTMN+ltX1kAIntvG7gif
 2eK+I4rRJWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCafhuMQAKCRAbX0TJAJUV
 VutlD/4vw/F+zZLmRvGvdy0xCfWWPhRt6eUtYZ8Wm9t8hIW61rX5erz+qk3vWN4rsIT1W508kDn
 kNPOwjGJeMCEqXkL5Oq0KVTMA+w/r8hxoJSIuw8UD4aVTQzZ5upBMz1q841SkBATi8b4HdLIGXX
 U4dSfV0OBaeKvPvnP0VDDUXE5da433i7BqrjKfbRkLcTrtf7wmINHmNuGN3xdDyogq1Hp00tSL7
 JYvHgjHOM/uvVR3y6yLCgbuLFDl+XCgRgxs5bH+TIwd0firnPOmxAgwI4ew6VOswFIvDoEJJH+k
 bAr8oOQjyPrYAolSMqnKrI0WGm2/Bva05/wlwRKd7MeqXjLAhXczpJIvHU4CB8xv6KQMekYKI0h
 u8a2dPIKaACXXIE/AoGtTJ3oMzYPpSuBdAzZZ5uN9zs9zitLocR+Gn9WTLZu1Kp3h+9sXLguCyK
 pAHreQVKJMx4TgDsHkUCJA/7lpJcj2LTr8yNjLJQfCjKTPT99c6U4M1avtnUEogXNFkkFG/M4ma
 IbPuo5DvS5HgXPDITifE0RzuzWKzDkoRtbv1JL42VOHIqNBltmHzDwxphmOLm7KoTF1fiqojRcO
 b0Idwqh0U/57InHki+f1FBF639apmLvUxQzkDI+W+gtUo1y6b9rtoXE6cBMwxPunqgVK8KE0i2K
 rnoGnPaskm4HLgg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=H6rrBeYi c=1 sm=1 tr=0 ts=69f86e39 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=H1N5wm_QsmpplRD-D3gA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEwNSBTYWx0ZWRfX6PE+lB5aP8v5
 3FLHq08gkZozgHFy43Ss7uKlNzyeX1UYTI3NZZFQUtWjTCOmas9qLJX0sd3meEDbguwOsNpfz57
 n64YtxO4aNGP2pOwFRUSjPifrJtzoY+YVRIwuPiAK5jGi9gt5ygORKhVd/19tIS/21nSW4et7Jo
 oOS8aCicRgCGkBkOPLmb2JDB2HlCN/NINKU6wVZVY+G5thlUMLBFoSn8p5YOqSkXl/xbjpgB25E
 sdPX7s2Zdc8kEDc1B2myr/hE5cYrF9Jkx2CWF2nQ/X3bygOOHhxKtYsNCUux2XR/o8Rt2s0FqmQ
 Hr8/dLvEiX0q82k8FBzXO515kOgVzJNdQVke9wgTI9cFhoWLQco5yTUWTTLkeFaGWmAQ4nOVsbO
 7Ll3DreA8kWfmdubaIb3A80jdoPLauIu/ujnr72HqMi17NZTmjmTU9hg7g0uTzOxYPf1IL9hpNm
 REVb/J/frQizCSIe7vA==
X-Proofpoint-GUID: RIrxWD8qQmqB8jwROaTRH68P7qaXjJGT
X-Proofpoint-ORIG-GUID: RIrxWD8qQmqB8jwROaTRH68P7qaXjJGT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040105

Eliza uses a 4-region LLCC register layout made up of two per-bank base
register regions together with the broadcast OR and AND regions.

Document that layout in the devicetree bindings.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c | 180 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 0161ceec8842..7c05cb3619b2 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -181,6 +181,171 @@ enum llcc_reg_offset {
 	LLCC_TRP_WRS_CACHEABLE_EN,
 };
 
+static const struct llcc_slice_config eliza_data[] = {
+	{
+		.usecase_id = LLCC_CPUSS,
+		.slice_id = 1,
+		.max_cap = 896,
+		.bonus_ways = 0xfff,
+		.activate_on_init = true,
+		.write_scid_en = true,
+		.stale_en = true,
+	},
+	{
+		.usecase_id = LLCC_MDMHPFX,
+		.slice_id = 24,
+		.max_cap = 1024,
+		.priority = 5,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+	},
+	{
+		.usecase_id = LLCC_VIDSC0,
+		.slice_id = 2,
+		.max_cap = 128,
+		.priority = 5,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+	},
+	{
+		.usecase_id = LLCC_MDMHPGRW,
+		.slice_id = 25,
+		.max_cap = 1024,
+		.priority = 5,
+		.bonus_ways = 0xfff,
+	},
+	{
+		.usecase_id = LLCC_GPUHTW,
+		.slice_id = 11,
+		.max_cap = 256,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+	},
+	{
+		.usecase_id = LLCC_GPU,
+		.slice_id = 9,
+		.max_cap = 896,
+		.priority = 1,
+		.bonus_ways = 0xfff,
+		.write_scid_cacheable_en = true,
+	},
+	{
+		.usecase_id = LLCC_MMUHWT,
+		.slice_id = 18,
+		.max_cap = 256,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.activate_on_init = true,
+	},
+	{
+		.usecase_id = LLCC_MDMPNG,
+		.slice_id = 27,
+		.max_cap = 256,
+		.priority = 5,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+	},
+	{
+		.usecase_id = LLCC_MODPE,
+		.slice_id = 29,
+		.max_cap = 256,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xf00,
+		.alloc_oneway_en = true,
+	},
+	{
+		.usecase_id = LLCC_WRCACHE,
+		.slice_id = 31,
+		.max_cap = 256,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.activate_on_init = true,
+	},
+	{
+		.usecase_id = LLCC_LCPDARE,
+		.slice_id = 30,
+		.max_cap = 128,
+		.priority = 5,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.activate_on_init = true,
+		.alloc_oneway_en = true,
+	},
+	{
+		.usecase_id = LLCC_ISLAND1,
+		.slice_id = 12,
+		.max_cap = 1280,
+		.priority = 7,
+		.fixed_size = true,
+		.res_ways = 0x3ff,
+	},
+	{
+		.usecase_id = LLCC_CAMOFE,
+		.slice_id = 33,
+		.max_cap = 1024,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.stale_en = true,
+		.parent_slice_id = 13,
+	},
+	{
+		.usecase_id = LLCC_CAMRTIP,
+		.slice_id = 13,
+		.max_cap = 1024,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.stale_en = true,
+		.parent_slice_id = 13,
+	},
+	{
+		.usecase_id = LLCC_CAMSRTIP,
+		.slice_id = 14,
+		.max_cap = 512,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.stale_en = true,
+		.parent_slice_id = 13,
+	},
+	{
+		.usecase_id = LLCC_CAMRTRF,
+		.slice_id = 7,
+		.max_cap = 1024,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.stale_en = true,
+		.parent_slice_id = 13,
+	},
+	{
+		.usecase_id = LLCC_CAMSRTRF,
+		.slice_id = 21,
+		.max_cap = 1024,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.stale_en = true,
+		.parent_slice_id = 13,
+	},
+	{
+		.usecase_id = LLCC_CPUSSMPAM,
+		.slice_id = 6,
+		.max_cap = 512,
+		.priority = 0,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.activate_on_init = true,
+		.write_scid_en = true,
+		.stale_en = true,
+	},
+};
+
 static const struct llcc_slice_config glymur_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
@@ -4141,6 +4306,15 @@ static const u32 llcc_v6_reg_offset[] = {
 	[LLCC_TRP_WRS_CACHEABLE_EN]	= 0x00042088,
 };
 
+static const struct qcom_llcc_config eliza_cfg[] = {
+	{
+		.sct_data	= eliza_data,
+		.size		= ARRAY_SIZE(eliza_data),
+		.reg_offset	= llcc_v6_reg_offset,
+		.edac_reg_offset = &llcc_v6_edac_reg_offset,
+	},
+};
+
 static const struct qcom_llcc_config kaanapali_cfg[] = {
 	{
 		.sct_data	= kaanapali_data,
@@ -4397,6 +4571,11 @@ static const struct qcom_llcc_config x1e80100_cfg[] = {
 	},
 };
 
+static const struct qcom_sct_config eliza_cfgs = {
+	.llcc_config	= eliza_cfg,
+	.num_config	= ARRAY_SIZE(eliza_cfg),
+};
+
 static const struct qcom_sct_config kaanapali_cfgs = {
 	.llcc_config	= kaanapali_cfg,
 	.num_config	= ARRAY_SIZE(kaanapali_cfg),
@@ -5238,6 +5417,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_llcc_of_match[] = {
+	{ .compatible = "qcom,eliza-llcc", .data = &eliza_cfgs },
 	{ .compatible = "qcom,glymur-llcc", .data = &glymur_cfgs },
 	{ .compatible = "qcom,ipq5424-llcc", .data = &ipq5424_cfgs},
 	{ .compatible = "qcom,kaanapali-llcc", .data = &kaanapali_cfgs},

-- 
2.54.0

