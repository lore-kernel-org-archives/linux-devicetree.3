Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612714;
	b=QWr+eod/380099avpyDqNiYIosltvQ9khC+CnX8V9oUwZ8NaRFEM4T2d0HAbGoYHTvqa
	 H3boVIhKRISV1j6MLqBc0PkV8pkAdXSawcJ/aHkTjlX0arGFFtC7T9sJoe6RRCLG1HkGY
	 RoadwJ+a0AciEbDxwO6apnOA2k32xfmEL+YxrkuZF5vttwMC1Gm37uccEh5JVPbRDjRaB
	 oTex4ZpA6K3u0Ibc8R1BVHDeldCDzzj9SJTCJa9wXBxYaZAayELuAskuBpXKepGZ5iS7L
	 5Qygh07cEMdksL7bNuH3J9bNBvw+SNNPuYiUkc5zdbFkEZd5Ilj1kBG+d9+HTo4zAOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612714;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ad9w3TgkoIlbacQPNgPrBSZDlkh+EQgbPxPRDo3ExTs=;
	b=xlrrztMn5CXt492O2VozarXIgsUpH9klYbQ4PTFo42HIFxljPms6ZcMQ1RSlltdC6+QP
	 yh2WM5a5uAo58XMz9dAxT9IugFO+DN8sWbRZh0FjHoVqRh1EEPCjiNFDvGSIqIuHN5k+7
	 bvMAVtRQvYIkgba8mgN9CYSwzFbWWhCt4SXg0AB1cQq9XkcGgnO6jLY410rp/+oJ3pTRf
	 WTlj8urzTM/MVSi7LSqQaF5vjJSES1VpeO2Cr0sRFFFu1u2C8KGgsGFasANx1DXCzisKU
	 43sglTToeul0O3sqipnxPyYEJisTKTRPKIJ7FE4g1qg+B03HeSmHEhSx/1GdpYLVYQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AoISGQwM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VfHRnZqz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45963606A691
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45963606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AoISGQwM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VfHRnZqz
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mCxU4130803
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ad9w3TgkoIl
	bacQPNgPrBSZDlkh+EQgbPxPRDo3ExTs=; b=AoISGQwM+leo+9FKSlOQPI2mNhi
	Yi/0eM7RlEt+R0qAtHQrLrD9AOy2n3G+a+kecau2AuqYIsuMzovRISDAP2b/Lkwb
	ScuJjzOJzSY1rsN4Slx9Dtt3hQ+1iTdaTSxawyclV0gdWzAVwcregxt12u89lR/i
	DrQj/8XTVx2LpACft87JlrQNXVKihUWuoqMnCPNZLx+rQfIlE4C3PmduCNQ8WC/i
	O4pyxfrhHcHp+35c4YBv3CUrUb82OM058ix7Vr71TstYbDa+yojc5DvCit05IRFz
	C4H5+DuNVhkr27FVjpuidId0Hrz2snFyGSH4vJXMmnbubj8r5R3NQtmyl/A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhs0hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:18:26 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99e0b2d9ba4so4532052241.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 05:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612706; x=1796217506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ad9w3TgkoIlbacQPNgPrBSZDlkh+EQgbPxPRDo3ExTs=;
        b=VfHRnZqz4GT5hDSUTNEzDyYYB0PUaZeS+tmUCze4Zxx21c8YnKVCug2/8jYSqB7RWH
         qof9iinujf9Js688j+84VMqmmB0lxUzjPgLLfXkPreriSDod05TfYaAHP5dneD2jndGH
         R6yldT3Wr1XRyFzeYt5XOnBZ9BLznBqzNl7mG8vF7aM7ydWLlPNu8i1h7vqfGZppgPDV
         qx0lexmwsOKIy0265Df8E7ix5L4HCzuBfN2edocLQR4bQ0gq8JElDvEzhA4/+1ozebsY
         C617kx8PLEWBZ3sRK1QQf5Ef8H2jXejIw/2e6Qiz7OTrn5QNc7Dp1ZtVUufPoP6JWv+J
         D2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612706; x=1796217506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ad9w3TgkoIlbacQPNgPrBSZDlkh+EQgbPxPRDo3ExTs=;
        b=xyS9bEuSaGbKzhSMXri9EcR6+weAFSQWfrAjELHHf4puKk+//MTBq6csDSWvZvNWhF
         7v5WLADFBkD5x7CKAXvP68SejFgsQgKlV9EyPT6m97h/t0JDubWRZzQnsp1/7PcaolSo
         4oR++0JRRGJCqmSqhUpyPxrLYa/cjjRPkib4Oocdsml7qg88tHeAGj/PrIWGYVHWsJ2r
         JFRUfFQO5Na5NkSKpRpV133FrQjdi+KiWbWMJQ3bnviUFW6aWOx9Gq/NhiHEJYMPgMrt
         MHDT+HdjerpjzEuTk1F1l8MErjKoD8VofDhtZpZhm27YCqco5gGFEZzantn+AJ6Wb7FP
         eUig==
X-Forwarded-Encrypted: i=1; AL+hErG5AulilnxLJsNY9PXQvfAyCwq/OE2dJu99dcF8VTOld+lpbS4Fr1xfJM1AJIb98aXLI1N55YmJys96@vger.kernel.org
X-Gm-Message-State: APuU4Z81kYav7+6jbc2HCft3O4v+R6mZ803wumcX9IR8QL4Tn6MmADvv
	Cgzxgf5JK+pja3rIp5qoLs360AWy0hpapwjfZv9etr6MgE/NCuHNJSU9lY8ZMSsQZj+mcB9lto/
	YpGCM4Mz0Ndtc+C+9QCst9vfwEn7aji5t9jNgs/rC4G5qXdbVa+KN3fpH+n/AsbDE
X-Gm-Gg: AZFdTZdgUP7De6EIjo1Zs/h8cjeeDZiPrakpl8s7nBnDzBX9WiR6W2PYwj7AVBftmFZ
	g/96KB6D3QgYVEyC8AnGjmEkEYHXCJ7ixM4p/6vlGt7wWGHYHKKzBc+S+IlfMpKSgyNc6nqFp85
	psk6uz6mQ5W5ao4WaOikn6SKJTmIzvdIPafAtEdcU+UbLQRfsvUzKeHImNIoeOIKSxlOj22IBw8
	yX3uS7uGtmou6H27fGjXwnOrAcBsVmnIo9ur8VyW8VKmahKgit3ylc885gWquamVmsDVSNBn43U
	CbWgqnD0I5C3fVdhzVfS+IPqK8Dg22ljjuKu8IwivNkyJqI59XVNCR5cq1AvRI37KwyZtnRumxU
	DZX4OSy2p4F+hcYi+igRV9sU9Ua/hVUSdcsATJlpwfl53QBkkEEqkyh7qZaN+bdPp
X-Received: by 2002:a05:6122:e26d:b0:5ea:e175:b2f5 with SMTP id 71dfb90a1353d-5ee8adf330dmr10851452e0c.1.1795612705653;
        Wed, 25 Nov 2026 05:18:25 -0800 (PST)
X-Received: by 2002:a05:6122:e26d:b0:5ea:e175:b2f5 with SMTP id 71dfb90a1353d-5ee8adf330dmr10851392e0c.1.1795612705104;
        Wed, 25 Nov 2026 05:18:25 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm205035365e9.0.2026.11.25.05.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:18:24 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 4/4] clk: qcom: Add lpass clock controller driver for Glymur
Date: Wed, 25 Nov 2026 13:17:57 +0000
Message-ID: <20261125131757.1163466-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06e022 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=9d4qlcpUcIswrQQTxZ8A:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: kwO0hO8t4TPylOLYERp_3YPDjcI5egwn
X-Proofpoint-ORIG-GUID: kwO0hO8t4TPylOLYERp_3YPDjcI5egwn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX7wPuiZuS3nK9
 o7QHES1kDnRPh7O3u4dP3tC0pc/5Z+9Djns3KUiAVOVSwdD9S1hlYBnuSoOYIWd85S5PuIQQ0WN
 EiF3s7Ogc77FuGxBtS6CXeuEXXKQepg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX4B3McdgZsrvn
 Gst0kOd9sXTc0rU4TKu+kDgTinQ3jyQNWr/O3dNqflrkYDn5ZX/+NtabFzmjgQxUZVh9z7BBe+V
 zkEEXlD9Ci1ySAnceh7PCLEPb2j8mMNcusGxMLhHfYJkDIeDIWcbnjyESch1QbvJtO8U5Ncus57
 TgeG6mAPT8mUqKHEsWRbgQBUuG2TeXYwRBH9QiRG0PSb9E0X0Ba5IXV+rPCwsq3QJR3+AwLLp8f
 I52551xy0F/FQgBSECXcharTBHQO0UHLkX3CgsgkwJQGw2Wjxr71STfCQmKQAXO8thxgMIv/4PN
 o+7h6x2tHLxYaqqu03V47QI0tL8NkKMoRQkwn8Q2zVGF9oHQhPs+5qk+39J263SQg2DndxdxnB6
 +OiBEhSWrDf5dwcXgausWaNfQQ1OYSp69UBvlM58bwr99tVWoK02UVs1grcKE7ZAPVdeaC3Q1zE
 saBgpzJqI9hebbQOljg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250052

Add support for the lpass clock controller found on Glymur based devices.
This would allow lpass peripheral loader drivers to control the clocks and
bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/clk/qcom/lpasscc-glymur.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc-glymur.c
index b7fdd76df2f5..742a88ed318a 100644
--- a/drivers/clk/qcom/lpasscc-glymur.c
+++ b/drivers/clk/qcom/lpasscc-glymur.c
@@ -37,10 +37,31 @@ static const struct qcom_cc_desc lpass_audiocc_glymur_reset_desc = {
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

