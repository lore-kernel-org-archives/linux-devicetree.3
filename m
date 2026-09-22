Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA3349158D
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102711; cv=none; b=pvUzWcOyW8cIdL04oWVBfTCGUvsHx1/5X0AxtpuJALke1Hn3esCBcE2f9uih07pfZ+HT9aY3o4CzJPVQd5YsPG2Ua++ESfaftAp2zPUdP10JNG/RUcfgrSlUQpxqVVX4aEXPFzUymlvCe18ALkQdN3V0ceJb7rOdwQxGNm8yqPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102711; c=relaxed/simple;
	bh=1Q4uvfDk4TliYmTHYv2Ve5KSV0agU3eXHSIiw7O5VGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J9PBrFt1pirynl8/P4eHE9LeF0KRH67z0rvu9Dce1x6RLkDUPV8bZuV1VJrBieud1bmANqKrFro4s4jXNCNGAmrv6maOBn6sI65HuOJgOugpcPkmxmWfo7dGsrj2P/AOuR5h2TaYs/CddEbdHImAV30vPfCaZZN6dKQ5mnRIho0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HC7Cx9nc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AfMrm9un; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HC7Cx9nc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AfMrm9un"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI79lv1024453
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bre1XGDEQBs
	b9HHiSPNRvoWE3fMANV820bNftGvNCDo=; b=HC7Cx9ncz0mEjr1+9IbG8KM9sv4
	+L9JiNKuJMq4rC0/o1fyRIvvoFPoN/74WUdOp+Yoe+kqTa2E7z12cF8NVAJUt+ZS
	rgxbggAjXvvnQh3q1s6iJaJ8/N9PJVV5R2ee97ozLLx5ttBfsNWKFMlvwaBABsf1
	DUNHwzzbmkV+CPXKkenukCIZElY3ZaRkFsme/HQ9LIRof6rR74VLzWkoukMs6pR3
	gLt+Ei7nZb+Di/09F5EyQTQtA8RXji7XAb7b1wAivhZZuLsfC11SDSnbtZN6nVu+
	5mw4bg/9Dtk9wQOIWHI18HTfX8NIq5xu1eJs5bOUo4nz1XSWvCyNqmxTYsg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkjbuqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:45:03 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c98fd65daaso200636e0c.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790102702; x=1790707502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bre1XGDEQBsb9HHiSPNRvoWE3fMANV820bNftGvNCDo=;
        b=AfMrm9unS/yVCCbqVdOjJ+ZT94laTMIFmVa/GbiAAlXTruWUXK8RCL+rsxCJ0PLF9K
         sZtgOjWiSsSsOdL2k7ZNl+Ft1ebYxWfN2kfmoEtl6FUu+P8yk+FR3IlwffArah/wA4/Y
         fVvQMriGDLLlT4m12kpTKEUZFkKsViLF+ukKBVPGzbNEPNN1acByLeM0It1vy+juukLv
         gi1K/U88wUB0IZVcXQ5whZX3Y+T1VTuVHmkixd5w+o82kjLedNJAONT4fa5A8/t5fp5r
         VmAQqvfGxp1nfTcuc80eiMm9BfgVeYfoAh8ptY5Sn48fIQ2i9XMPSYzVqw5EpS1SWMrM
         VpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102702; x=1790707502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bre1XGDEQBsb9HHiSPNRvoWE3fMANV820bNftGvNCDo=;
        b=wNALsmXmcIl4T+/v7Kl8UxotaJC/fySajgbILdTpp92qa7poFmr0rGAiPyDqyQanoy
         2iRnvB42IctUOASfO4wehOt6SrTUc1rqlohDRlXgKAE05Wc5/crGj3G8cea4cc3yUrKM
         DSC98UlkHfDcEIT/1JD8fUFSW8UGNzCiZnEL/mMj/nm3eoJRem8h0YTLdt49GtA9zdNz
         oyElMe9KY4j5RasJ4AmPYEq/UHovlyvfVP9TtTLu/COmp5BIYyjoMNigTIr2dI+As+1O
         tHj3va4aHC/PhbVBj6PrvWfcPJyWjE7z4dJ7K/P3/bIT1gQb4dKts7R0cVd/GDnbOWKt
         ektQ==
X-Forwarded-Encrypted: i=1; AKwUvByVwkGouUkajy2R/72IQT6m1fwmGUTpC13Bv7EbOOMBIHoHKKZgpB3K7XGKBwvIRRwtuISgRLo3SD8g@vger.kernel.org
X-Gm-Message-State: AFuF++lao4fet80Ger5zNtzJiFKeKnHVBVqVIrlOXSDK8AJ1a0JjbcbU
	E94eru5RTSviBJonemVJM41SEuZ1bbfA9v9mJjYAcH1lGCXWo+u7YZ/6agqMgiuCeTZAE4qY2yM
	bj3D/Bu+n1SoOiIiqYlUNt9LMv3aYKp371lXAa5gsX6N6dt117L1P9WGRRPJbvmkl
X-Gm-Gg: AYBFou3xvNL3Gd4WnlXSpA212ArmJYBr+HdCt5jfXZLc6Et6p+o4qP5sa3pC4eCUoyt
	VlUPPxOupFxEjja7BHE/LPnhauptb4gTiqROB5kVhwcy4sjF4+tM6OkhjB7N5ODTrS9NvFu8ymX
	H4r1EEE1Sqe9gp4+QzpELc8moYrUtwOP+LgUs33enGPczo74nqm2CxX3k2GbKeTgs4SmmqSBC+G
	LNXBySKW7bz5mxqwoxFxuP6j6WxDJK/TbpBtMRznYVgrILaIAf1/C4PKc0IC6skAJbF/qxvpHNS
	DwnU/OoXA8moMYoxd7f/iym1F6akO5bO+zHbQWTVyyaRbw/QHnKRQNuyt4zICwmU8ajHwpY69Hi
	oinzBK7LNoRv3L6GcDkWvXx5vjL5Zy6wkm1bv9oobq8RxZmMM0hpzZh60hG3ebiY8
X-Received: by 2002:a05:6122:ca8:b0:5c8:2852:36cf with SMTP id 71dfb90a1353d-5c9f159af31mr774603e0c.4.1790102702551;
        Tue, 22 Sep 2026 11:45:02 -0700 (PDT)
X-Received: by 2002:a05:6122:ca8:b0:5c8:2852:36cf with SMTP id 71dfb90a1353d-5c9f159af31mr774584e0c.4.1790102702146;
        Tue, 22 Sep 2026 11:45:02 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm374681f8f.19.2026.09.22.11.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:45:01 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/4] clk: qcom: Add lpass clock controller driver for Glymur
Date: Tue, 22 Sep 2026 19:44:25 +0100
Message-ID: <20260922184425.56114-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VHtmCK7iOfvSPTk4spL5HsrLZawjZXSx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfXz4kgs+1tIL01
 bIQ7iKLy2l15MT/adkhNiG0JICCrupW4CNisVWvbT6+5ziHGQryfNw1yP54eqxCe8fKxujbG2Ys
 gJ4roLDhlEyfTJT4RyCtSz1s7QG9vy/vBzdGOczxVNRbO6cik5femqBXnKto8GgajIZLTT6vJnu
 0KSsXygzDxgCTqWh6vKRVuHlRX41PR1S6/0/a+XRBnWmx3Qhi0hrH5e1AWpt8Tvovb+1M7SgRTl
 to7tcTTJX8OfCzSivHjXcQXIgkEUHvo3qdeslk1M1XvgIii1ufKw6WyjlNfMT77a7qEpGYAAR8V
 etiPcyJhyovJCv3PMJWnNEARGCV2ckHD8pY61/4CUV41chDeRvXQ3L3RZIVT2iQl2BUl/LBwy9+
 lUZEK4FnowQfqdL+3WCg2O2KjHvGyiS8oGYL6DXouwcOjDSMHKanFTx5F0kAsQfknaMoYMOnvmw
 rkDjcTULTGhnpgoSdkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfXyYMHc4cKdF0p
 1P0RUs4pD5oUMmEoKo16KxwZdK+Vf+Nz4QE7gDbYlXDtG/cLvXaB5CtU2TtYOW5zshUqCbA6Axg
 pDRlBxZxn3v/K4LwXLQBg3hH574XytE=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab2ccaf cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=9d4qlcpUcIswrQQTxZ8A:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: VHtmCK7iOfvSPTk4spL5HsrLZawjZXSx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220275

Add support for the lpass clock controller found on Glymur based devices.
This would allow lpass peripheral loader drivers to control the clocks and
bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/clk/qcom/lpasscc-glymur.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc-glymur.c
index 97fc099983b6..782183012d97 100644
--- a/drivers/clk/qcom/lpasscc-glymur.c
+++ b/drivers/clk/qcom/lpasscc-glymur.c
@@ -39,10 +39,31 @@ static const struct qcom_cc_desc lpass_audiocc_glymur_reset_desc = {
 	.num_resets = ARRAY_SIZE(lpass_audiocc_glymur_resets),
 };
 
+static const struct qcom_reset_map lpasscc_glymur_resets[] = {
+	[LPASS_AUDIO_SWR_TX_CGCR] = { 0xa028, 1 },
+};
+
+static const struct regmap_config lpasscc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.name = "lpass-tcsr",
+	.max_register = 0x12000,
+};
+
+static const struct qcom_cc_desc lpasscc_glymur_reset_desc = {
+	.config = &lpasscc_glymur_regmap_config,
+	.resets = lpasscc_glymur_resets,
+	.num_resets = ARRAY_SIZE(lpasscc_glymur_resets),
+};
+
 static const struct of_device_id lpasscc_glymur_match_table[] = {
 	{
 		.compatible = "qcom,glymur-lpassaudiocc",
 		.data = &lpass_audiocc_glymur_reset_desc,
+	}, {
+		.compatible = "qcom,glymur-lpasscc",
+		.data = &lpasscc_glymur_reset_desc,
 	},
 	{ }
 };
-- 
2.53.0

