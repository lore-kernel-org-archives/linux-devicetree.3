Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B00F37C10D
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 09:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233878; cv=none; b=nBTaWvEeSLuwyD5X+zgVFhRIbY77+PQ/K/h0vmF3tNCfBa5H3EE7ydkWiOpZw/RB/aS3DdhEuY99LDQJVdKrCUENi+KhNLVAOMw32XsH7UXQ9kVUghJrCMNGuDbJAJM6Wnn5g9e9R94nDZigHEoHr2PLuiAokjxIUUn+cakxMGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233878; c=relaxed/simple;
	bh=A9+mTcBSQybwQWajAHQd2dDBgtkeNZu/YRICsAQUe1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jgQ9NbpjL3V4dBh6AvW+GW7Gi1IkcSfNxtHi9n5KoEH8yFAOO6dYzGRz7rBrhLKzRpy7q7OJlYG9DpUDtrftyI6umxsXQ9RBXxVfCHAggXa1G2AemFwMCHIRD5pL/b7BpgztO8HGZU0RyMbb7ivw+ZI4z+w/AjkYMKSm9zPGtPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=auGDeqFD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/S7tAFp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="auGDeqFD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/S7tAFp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jG4W257851
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 09:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TtN2Hj23wPRHyv2TVHUkVRACaL0lMfhM10EaRoSVv4M=; b=auGDeqFDFu9eM7Kt
	4qiovqKhg+NZglPDjTnQs6xCz4akTnzidSOj5QdtJIq3RlTvwveUV8sas69segEn
	bRR+yBXgDm26U2kJ2k3El6ovDIAyTN5CFYn+tDmQ4EAG+PmgClay125cEGZ9i6SR
	ILw7gN6utoTbsMbcDX3Li00EHPUz9MsLQ/3zb1pNOsWO9ZMxsXhqjhClqg+iJa7L
	qScB4aLKL0/dzNpGRpFz2bJ6h1x+QqBwL6HxX18t4imrSuNN6+h8mogfGs2h5EHH
	SXDuxpWknzGe24WUHWzK6BIP3VBYzH+9Lgoa3Jdqp/674u+jsfuLkP9UCDBq6V4r
	KM86lA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1auegpgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 09:51:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2cc75e79b97so6690621eec.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 02:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778233873; x=1778838673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtN2Hj23wPRHyv2TVHUkVRACaL0lMfhM10EaRoSVv4M=;
        b=O/S7tAFpn5Thf0vEcvfPVJiJ8CY2ctI+qa0oqzV6nBfAxXTdxHzGvExIOxsjb2zhoT
         LiUs9UblyY+NLKKIEmVPNazj+lfE/kALvr1xgPKGQtsRSGW5XOC/ALqDTZCPuaA29tZh
         t4OD5Mo8Tm7hd5RYnZmrUtJ9uzrmrDCAujvXzuY52LTU16Ef616stiBhiVWkM2DKKNIn
         bWllNLfu092j/ZCCuUGegA0RmNMKehxCoNWSGJEyLLsHQ07Y02edg2gHI2jiYNv2BYDG
         vhb2fcJa26ldrKsfXKZJf2VcR52NviccWqPbZwxgz51SqZPufdX0acXXydUruzsn8e1D
         JSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778233873; x=1778838673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TtN2Hj23wPRHyv2TVHUkVRACaL0lMfhM10EaRoSVv4M=;
        b=KsbwRK/lrgO8scs0c5r0PdKXOJRXkqOzVTo9vefXYsJpDxYNeTWQDM0zZLLeGJJ8Dx
         V9fsqTgLc/z8OpcwTZVy4lh0x6lBSeBeypyAMwi1tbuVx+udaQKX2V4b9cNVpbnzXXSP
         J/QkQ7dEGqK0KELMG5cwlM8BJaE3x1T1s44C4AuzCHHxEj9AtOrFK/gQmt1Dp6dHCPb+
         nbAiXmAjDYDjGmxsmXPAh3dmMNpy1KrG5bYte0K+IXsxF4CBFGyvM0Q8qOCeeei/90zR
         FgbtD5JhbLxY0fk4Xa34qmZZEYMq3LuItM3xnQpBq5JbRjHwhFb+mhmT65p0wEA254I4
         i2uw==
X-Forwarded-Encrypted: i=1; AFNElJ8LHy6/Himhg94LTW1I/f/B5WGUOPvtj8PkxtYyF3bwaIum1ywv7qfQuRXJW7GdgJ2VS+Ix7s8Ag6Hu@vger.kernel.org
X-Gm-Message-State: AOJu0YyCIMJ5m0owRdhVMHc+qqiBKIgw8mYhS+eccbL3bKrM4b0ckmWV
	GatYVQDmPpo6IN/Vtsdc2QWUk/O1zNoEpY+Ww1WWNahUsqbmluqcGgxUmYQYb3dEln9TGpz6iD5
	ILc/1dKfX0bc3vC7gfR7wJHsRl0BcWTqwVhDmP+Q6KNcYX4TCS37kpRv4zg3zTuQm
X-Gm-Gg: Acq92OGvzLBLMJUMgV59L38DivURK6EEpLc7uz5j68Brqt79diB0c+BNTgM3B3a7HOf
	RNAk3epasiLCnraN4QHlZvxufcLGPoQwBxO2kFlq1Cb4EpGRvakBddqisU8dj4pfLHx15DIe4Yx
	rEajs+zggerXbv6fPJGgZQznpgY+dLuQADkC0YEg12vw1es5/wgE2oiD7eJ4GaAHIMa1lWyVMb/
	78yV44PKB17P2URYc46gVZtORvWD2BzEZGFJxxKa+bmsn5xmyexKxNLsHatTGoDqSSi/f+NvOTG
	RiOs4+lHO+2vq1VY7t0LmaMhyfUu7vxk3oDaLwI+zDonKnI5dD/wfHbKEuvT+l2uw/O8PeAJdZO
	dclEUaw/GptS7cp1pCDN0xnUnE3oxuvp39jfiem8porAGUuhcwCkzSoBs5ZDxiT6MLS2+UyyCR3
	9UBCJkXSZ6/s8=
X-Received: by 2002:a05:7300:5727:b0:2f4:3a9c:818c with SMTP id 5a478bee46e88-2f54d678d74mr5935414eec.29.1778233873568;
        Fri, 08 May 2026 02:51:13 -0700 (PDT)
X-Received: by 2002:a05:7300:5727:b0:2f4:3a9c:818c with SMTP id 5a478bee46e88-2f54d678d74mr5935394eec.29.1778233873070;
        Fri, 08 May 2026 02:51:13 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88847502fsm1739323eec.14.2026.05.08.02.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 02:51:12 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Fri, 08 May 2026 02:51:04 -0700
Subject: [PATCH v3 2/5] media: qcom: camss: Add SM8750 compatible camss
 driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-add-support-for-camss-on-sm8750-v3-2-fc6861a65c67@oss.qualcomm.com>
References: <20260508-add-support-for-camss-on-sm8750-v3-0-fc6861a65c67@oss.qualcomm.com>
In-Reply-To: <20260508-add-support-for-camss-on-sm8750-v3-0-fc6861a65c67@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwMSBTYWx0ZWRfX3Jk1qPUGBHdN
 X6dZ45LlchNX4Fqw0VAqc1ZOOHJU6eBfPVNrYI2F6QRFPnm6MiNYzgey2e/h/nIY5YBPPYpVEib
 drVKLKRg5sKzqmsJaTRHOI8gAX6thS1FHyWuFmsSshv/PATGsY/mZhzU9W+EjJA6dOJoGNjaJzL
 Ifiq7CgyAnxP9Rtlb7f5DfcFaMWOjJurGSQeHUiJhNA71jiIDghKfwCko10j/IiQVQzBWDHSL7R
 9OyyaOQCkWYSRdzbaCzpMDeRTQnybZ3g298gpcnehinYu/MEZRY/4g7/gXNXrlRSk3MeFQolZWl
 Hi+SmYcnunXGF9tbhb77QFmjmGsfCW98c7LpnF/Sg09b2yb/IlmcDeKSg8oCpM5Fm2DafWhS4Yh
 Rdq6FfT9KZTWkViYG7LBWe+ULtuAktr3At8Q2yaNntSd2LiwfW3NpeS4/1JsBbf4rQfu1uKOgTz
 nCIk40P4jmSIdn/DZ6g==
X-Proofpoint-GUID: IqsZlXMvAWyOGe6FtZNvEk5TSWPG0_hK
X-Proofpoint-ORIG-GUID: IqsZlXMvAWyOGe6FtZNvEk5TSWPG0_hK
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fdb212 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gE60Ov1lhapgyOv8Ur0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080101

Add support for SM8750 in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 04f04d0c2fc7..3cebce812c58 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4238,6 +4238,20 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct resources_icc icc_res_sm8750[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
@@ -5660,6 +5674,13 @@ static const struct camss_resources sm8650_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
 };
 
+static const struct camss_resources sm8750_resources = {
+	.version = CAMSS_8750,
+	.pd_name = "top",
+	.icc_res = icc_res_sm8750,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
+};
+
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
@@ -5692,6 +5713,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
+	{ .compatible = "qcom,sm8750-camss", .data = &sm8750_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
 	{ }
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 2820c687e066..dafdfe1d3a4a 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -92,6 +92,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8650,
+	CAMSS_8750,
 	CAMSS_8775P,
 	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,

-- 
2.34.1

