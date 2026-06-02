Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4155C306766
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 00:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780360351; cv=none; b=pCXh/SFTPDnJ57/Xhx7XEH0b6E21kfjvf5pZq0jSVEOU6cpHdzdg1EsyGAIynlRocs1J3XC80u4VzDkXiVRFjD8M21Du5oTYX9iW6nJbkOp4X60n7Sb+wt63ZV7eIIue7DqIAJGEvX19kOowUKX6PbZ+JODH24HqL4mUqR+8HHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780360351; c=relaxed/simple;
	bh=Ozl5EeXxBuqxv3EqPkK5t0/LMK4hoJjLCYFpbaWf0HM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VHNf9BA4+n3kcBTtEglXGPAEz2W/nfDD5v5yNxPAwBhXqpybFwn7ISs2krQgJLP87Oqcbd6b5+LeR67AoS44ZBPrcrXycJpHopbITopN8WT39eJwiq6OVOo1fw5W4RxRvgZA2a/h/VsGNcSOPCGmTaz369Zcz0+Hv4IjmbXJo3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RF5BUdts; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ig1jtShE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RF5BUdts";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ig1jtShE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651I1wFp3128006
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 00:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2TNzr3HoHbuhKfUhKh1x8ZLE6HzCcesuUXBRRI2rJng=; b=RF5BUdtsRI6E9o1W
	904ivVSNBmnpNYas655kZN3PDBW70EYP/Sby8yNEiSS2tOR2sUblAwrtpw0llLUN
	VwtApOS0loGSjjwRhSF9CXRLv1VCt3rGAlQ0snP16ohUZeZBF/DRaFEDZq/j18fi
	kv//r4WlIKH8zesiykcZb0TVR5H6Xtblw+l55Lyn0TiG1WMy70r0aCXMunPowop+
	pogw+rlOfUNut0dvzVsKJaOMAx6RWNve35ROV7rudOFqtbZcyEwinAVhaixuIkbL
	y0pt2Qk/4+d5D1UfojPyER0IYB6xex+l4rzul+6Tpx98IF2t5JizfzyWKj5o+/o6
	I/Wg9A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh901375e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 00:32:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304ea42b025so1728278eec.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 17:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780360348; x=1780965148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2TNzr3HoHbuhKfUhKh1x8ZLE6HzCcesuUXBRRI2rJng=;
        b=Ig1jtShEwjNZV4orQRo5UuxQthOX23mXDw2bl1HV/wyejWv+wRD7xXNtdplx0fYFU8
         seKGs1ac8p1W0m7XmiEDQMFFL+u+3++wPc5Ajl7Tow3093ea7kH9uizGCLfU5lvtoH75
         tLMSEpcbLsQ7fbxC8W9fJT85aktKcZEuXxNKwVE28o1o6PrOUGT0OePdWiEeF2ByC7p5
         /lou/PQzLcvJAibVgdS7vpMq5WlgVt8xDpZ8XUGFupvFmjBTO3IdNrFjJnDIRj4V1cM4
         GvGhuj45dz32+hekUzO+2qcWmUqDIFDA8WfJfUdy/7TSCR9hRYktbxsJqbuv2RiV7oaI
         ngHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780360348; x=1780965148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2TNzr3HoHbuhKfUhKh1x8ZLE6HzCcesuUXBRRI2rJng=;
        b=Pzi/d5JpGrIHE6ENkxvGmHrYV6u7BrB5di4BJKbu+AaP9MqjA4G86HYna1zUg3hYmZ
         AS6jSF4QrkwBKg8Y15Q0BtsjZ8jjnNFITGGtzJNEvoxiivnd3jg8YBR0Hio/aAaVQlXK
         qopweFJKwMFAEUNbBHTb49DzRqhNUbUNVjJtMp9ST1gHXCyQGwSgy+/ERhVeRqIm3qe1
         WBZEsgGzkXJZ1m8e7WBJsq+PypbTGgqLXOFrtjbI1uIbe0dTqgfDH/SJvXRpgOA1bV6b
         mxW8TP6EJqZX8mb6o+1aCfIEo0fc+8pE4m3Twj+imrIkAdL8/bPhlxf50lOBdehgunaI
         nRVw==
X-Forwarded-Encrypted: i=1; AFNElJ9LxU8c0amGwlkozPgJw4Bo348HZPxKRwP3+tbAIKxoWo8lAhqPlq2vypdTI2Rrg7wY7T24aEzxNMz4@vger.kernel.org
X-Gm-Message-State: AOJu0YxJL6rzwTd0ApDuQm2O/QhvrpGC1/EefKaltPNK9RZw3foOSXsB
	v4ncy4MjuTamRQO8tw30rwFhUGk/5z3ACa80hSoCW87GS5FaiH33U7HjCuhaRNNfd1MjqMK/0Iv
	myDB8rLMjJcV/KvyasB66RRKUwUWd6v5Lr1YSsNEgtASGlM7vdo+esjEGPsF62NZD
X-Gm-Gg: Acq92OGs83oS8DKbkIDz8B8UdgySHlky5epuSOH3zegl8jyzWoUTDQfWpGOKv/ZuaBU
	15H1mDvepjIfGJU/nshwcnwpAfcX6rxhORDBQolxz3k6o/EUcreeOrNYMUYPVm7gI+ddbH49VSK
	q29ifmlQ1jDyyd8rkImb9qL1RV9/AetbyErvKXapAg97GqOyc+j0AghnCWPTAEfiVpRPPuCu1wg
	YVXT4cFiLoNk6hHen27GmIMafga+RplkcjfwXFZXz/ezLDo88HD1ABpQJnm5NWNIhLsCEMls1j6
	tIBvOBFGpDO0j/AjKas5yTA6sMKkHEzYR52jbOWyrmJeIR+PNOr+F2/fCLQ7vjBp47pBG3NeAUA
	cwXOWih2o4wcIGvTA3IgcGbJyjx2PPxQ06+0ho58f26rMi/911NiK3XFkDcJpgE3zWcNejDrfRc
	zrBjCLaY6vJUQ=
X-Received: by 2002:a05:7300:4311:b0:304:cd0d:9ea5 with SMTP id 5a478bee46e88-30734ab9650mr815156eec.7.1780360348104;
        Mon, 01 Jun 2026 17:32:28 -0700 (PDT)
X-Received: by 2002:a05:7300:4311:b0:304:cd0d:9ea5 with SMTP id 5a478bee46e88-30734ab9650mr815134eec.7.1780360347599;
        Mon, 01 Jun 2026 17:32:27 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed563d09sm10070412eec.15.2026.06.01.17.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 17:32:27 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 17:32:21 -0700
Subject: [PATCH v5 2/5] media: qcom: camss: Add SM8750 compatible camss
 driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-add-support-for-camss-on-sm8750-v5-2-dac36a190de8@oss.qualcomm.com>
References: <20260601-add-support-for-camss-on-sm8750-v5-0-dac36a190de8@oss.qualcomm.com>
In-Reply-To: <20260601-add-support-for-camss-on-sm8750-v5-0-dac36a190de8@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=H6nrBeYi c=1 sm=1 tr=0 ts=6a1e249d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gE60Ov1lhapgyOv8Ur0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fHNOtRiTxWxvgu1NIJa5ycc53AZBhWYb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDAwMyBTYWx0ZWRfX26BOq+5ChOXc
 DBWCXuEgmYqua7uLV54UXLkitXk5sMzkZ9C3Rfmu1Msm59gCtT6jiK2JIwIYRm0MHnO6KElhgkk
 lhCehDhXrxdKIFbT2w/4K/B9T90ia4Y+L04uRMDpMurO8Jg1FAVWbwsa78cswdyi2we5OgNDFu8
 NmUP5Ec2pjDCGlwOfqq3H6goif0YmGxyuJcAGrr4RDDhT8qJvfIvl+Xhse7K9sZ8cLAAIuA7jAa
 Q0yzi+pFj88gk06biM3FtYygbjUKQHyp2gmkpv7WCufqldfpLZ/3OfiaXp4BC9acqumMeKYQCS/
 kDYUXDluh4YMT/g9Pbx38dOOvojAhAVgfp7Ju2yGjH8WgUiZQ7Tfg6Y5EXJG4xZPCRYTy38nAl5
 D51ND6fUgqLGBaxwd0UhQTWpQIGP72Wmbj8ySLSRTj+FRZ+0X+HUtLpNEChe3BRY5uTvUWudIfB
 jwDJghsN59NdjHr0fVw==
X-Proofpoint-GUID: fHNOtRiTxWxvgu1NIJa5ycc53AZBhWYb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020003

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
index 8fed46868d62..834f6c1a2519 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4533,6 +4533,20 @@ static const struct resources_icc icc_res_sa8775p[] = {
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
@@ -6082,6 +6096,13 @@ static const struct camss_resources sm8650_resources = {
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
@@ -6117,6 +6138,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
+	{ .compatible = "qcom,sm8750-camss", .data = &sm8750_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
 	{ }
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 2c7a0218a82b..314bd794033b 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -95,6 +95,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8650,
+	CAMSS_8750,
 	CAMSS_8775P,
 	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,

-- 
2.34.1

