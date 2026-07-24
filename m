Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4E04252B1
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889583; cv=none; b=oo3pNatCvAXr2h1TZoHR7wKanS55dWtzsIhMIVdo7zya9hr3DCHeMHI7deU6l24N0ah9wqk1pxNvB8MJ+wYx3vaPeOYA8ogHSOllNDRKqMzgrcIkcYr97JEUwzdsD4VKQl/CQAeHZxHWiEfQimfU5q/obtKfL3ABdy3qIsReTUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889583; c=relaxed/simple;
	bh=0YzZDwNOI/onVZdiLZlMM47FfMeGDrDDZthxQwRvTgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BQpFDKYaJgd6MJP1/Rq+ml5/IjM22O9DPNFJWaTqETsjuafRB4v6cof9mvCrmexBkELc4XzN9t/H73ELLPm4ESv6bJfWEarDuHThpEPHGSRLLPd059V7jLWO0jFW9Y8lQUAgJEffSxTz1aAxc9uqeYnRFgTMQma5bhlcKDTqrAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAQdFop8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BLuw9vcg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAQdFop8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BLuw9vcg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADvhO2916967
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N4TIXsfQ0zT
	s/aF6LfD8y7lVY1UMz6f8WLChqvUOxFA=; b=dAQdFop86ntSkWlsPIDiLmlm/SA
	wE9nm9pxDjBFAeFnyYb2tPDNAkvZaFOpLYafoXnK2BlOeTBtrylI+zgH6rcLdzE1
	fBG6/NYL4OEbAHUw2WmPUCT/eV+SI3Uif4uIA3nrByTOse2sC+9Rwdi2U/anGYcX
	XSGA2bSQaahuVH2yK7MeqquSEtQM14sKnR1CInavKssKpdAYYwgurBM7m4ls568K
	8ke/QSYNkdNvFHTuGYt2clw/TQHyztfOj4jIyzDve7UluoOU5PFIlnIjyXwjukns
	DiHOKju3L5g7iJb2+ZuanyeKP5YLOUU7GXqEtN2extMVQYv8YOPasO8CxAA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vkseg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:39:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7131849bso365983a91.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784889576; x=1785494376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4TIXsfQ0zTs/aF6LfD8y7lVY1UMz6f8WLChqvUOxFA=;
        b=BLuw9vcgWWcV1DZTKBEhqKwB+oBzzXUkUTTJtWXs0r8SnUW1ZsXUknu5AIUK6hUDJM
         mhwZ+PGLnD3Mpe8gLCSQ2gUkT+lCORuqDDbJBMjbaubcrK3biSSwSLtjm1dP5EXIxdr9
         79SRFU9URlICJZV0XJgCfNNomrcdIhmS8GvJQO8DjnFpIFi6H3YrMLwQgeBxUfcrH6lN
         Tmexhu2qUL2sd6OVEuGvdz27OUBZmFFVf7LosR7dYIhlAhKNJKB+j2xyHBKP7wigqef1
         WIfccHHgCIkVO39oa03HNn40O0ozr3zo/kAazhO1ZNtK+FgZVsFlFc9z/NaA35JzA2U1
         cIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784889576; x=1785494376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N4TIXsfQ0zTs/aF6LfD8y7lVY1UMz6f8WLChqvUOxFA=;
        b=PhtrvCL5TOlVQ+viH8tL3L82OuFW4Lv7GE9AS3iHD+RVvFWj6QRz+9GqeWHQIDU8Ar
         8Sx3PV9BYtJ8uK3gqSE/nCsmBkNC8F8S/WFcaoxXG+c7ICqR3G6ni5N4DU0vYNQBM12L
         n8zcoS82TUqRtVRGl070vKy8IGywObh8Ml1m+zJ6i9Snt32M8YCXmEYVbt4JMUHZdjxL
         F4yk8m//3qp9CMg14Z9NFdL3UfwxLDi4BSwKlY2b1MhWwuI63QU/o/nFN+x8aFD9Zcn3
         UeuY3vnn953Ru/lbeR0usZ7Hn/tTEw9tE63dELB0CwnXuDIjwpH3XuoH3wW9U/5w09Gt
         RdBA==
X-Forwarded-Encrypted: i=1; AHgh+RrBBvQHfmoh/mKewMykAA1Yz+Hq4ga2PCmoAqv1Zuya/1zTrbXATyaquX2MEErUNg0kzp5bFeln6SAh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3mexFPA2DRqmdsRFNu0HW+9fzv35jKhHAbYgmp0cwYon2eNwF
	wTVzn4rE0y9Q63VkK2ALlaHCwjVoj2Nutym2cwgUWVJTU3brLFfQNvMPhaDqurAIUCYbG0w1KN9
	FmPh95cs43ITZrPFe2vq4cxyNZy1fxYCUSvBELWrZfk0QrbaXnUIR8XYWecoyuPDg
X-Gm-Gg: AR+sD10fbTuK1TbuQ2yESCHrkZ7g3BUmbu/oeuW1gWUTg7JJgRPtXHESa00NowndW3p
	si1x1kioshMHOd4kS59C8zUXUbmFDAQhS0DOGQIfIz3sWRuvhTe3SbJSM3gjjwjBAeWO0o4RBNR
	uE7l6uXmrvAsEVaO6qaAYt5eT0HsSPiY25d6jDRQ0yycO8RL2SvkvJfXPWxTAv/ZPvh1CJg0SuV
	iehPL0x6W4DxVFcNDj34dO8DbquKAYqa12ptYEFKEt8+wKfDCTIzvgXt3kT88kPWKvEXkC3y0Mo
	kMOwz94DR0PS/IdoTceKdQJX3NJf8BhEM3DS8phsPJEvK1neSa6ZMb/JpwsDfy6F7KO8LBrN/uv
	3tqcRXN7DiPGpSrtSc89VWLmfE3CkeX2r8NTgJFTRDHbQfw469Ywv29XWe3yL
X-Received: by 2002:a17:90b:1d52:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-38ec69575acmr7158876a91.7.1784889575794;
        Fri, 24 Jul 2026 03:39:35 -0700 (PDT)
X-Received: by 2002:a17:90b:1d52:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-38ec69575acmr7158841a91.7.1784889575244;
        Fri, 24 Jul 2026 03:39:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm22495290c88.7.2026.07.24.03.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:39:34 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 3/3] remoteproc: qcom: pas: Add Nord ADSP and CDSP support
Date: Fri, 24 Jul 2026 18:38:48 +0800
Message-ID: <20260724103848.233804-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724103848.233804-1-shengchao.guo@oss.qualcomm.com>
References: <20260724103848.233804-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX6mCgfPvIWxCa
 Z0gJmeWWysV1qi3MnJ21R+VDbAtqfXabciTEu+s3bI0nrhIyu/r6+fwP6rRGq72VczdVJZMrwmn
 4CdAHEqAH70f3d+26FE8t3b5Z8NcmYo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfXxrI2jWRD961m
 fxYZKtclhC7iw9L7fPS9+U0iRHkbtgKv9LDODbQLBCVKjXSbli+UJE7ZUOAa/nP/FOrlljhewqV
 LtGTbyFQXV/HLfA0QgWZ6uhNC4KN4jm4/2zD5Cq33lc1n3FCyttDptelOUHIWA9yXHDiL4n4Vqj
 J9mkw/uTSKvcseLCUU7FZM54XzxHe8Bw5frCfKYl2KnateyMVBjKXme8zYkM5hZGWas0r4LVuWW
 YrtxlYlpbvSvvF2pxkFKLPjFdOYg8D3cOvpsSNToeLwkSwlOro4MCu88GvskvzEvsxlN+/Bfuq+
 2JbQVZTEkn422mJr5NAKZdAsQ3Iktp60RhpT/rR1i3UWuzlgwpVi4jsQ7YerhYmpNLGlUGTsdpi
 d8KJZGtbVwqFT23VHrlBbtaMKjrLQlCl82yD72iZlK91qvmp4cy/VELbDFfopjtQ98Ke7Dc0c6Q
 Ax8cnj+u+j6V1YcJp2g==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a6340e8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=wKDsrv0q4RgBVPAhY5MA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: isi7-HA_-Tuc9VNmF0PmZGsB1y0e1RwN
X-Proofpoint-ORIG-GUID: isi7-HA_-Tuc9VNmF0PmZGsB1y0e1RwN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240096

Add support for ADSP (HPASS DSP) and 4 CDSPs found on Nord SoC. The ADSP
is pre-booted by XBL before Linux starts, so set early_boot flag for
attach path rather than a cold boot sequence.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 110 +++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 25599d728208..6f3850a3fa9e 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1434,6 +1434,111 @@ static const struct qcom_pas_data milos_cdsp_resource = {
 	.smem_host_id = 5,
 };
 
+static const struct qcom_pas_data nord_adsp_resource = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.dtb_firmware_name = "adsp_dtb.mbn",
+	.pas_id = 1,
+	.dtb_pas_id = 36,
+	.minidump_id = 5,
+	.auto_boot = true,
+	.early_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.load_state = "adsp",
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+	.smem_host_id = 2,
+};
+
+static const struct qcom_pas_data nord_cdsp0_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mdt",
+	.dtb_firmware_name = "cdsp_dtb.mbn",
+	.pas_id = 18,
+	.dtb_pas_id = 37,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp0",
+	.sysmon_name = "cdsp0",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
+};
+
+static const struct qcom_pas_data nord_cdsp1_resource = {
+	.crash_reason_smem = 633,
+	.firmware_name = "cdsp1.mdt",
+	.dtb_firmware_name = "cdsp1_dtb.mbn",
+	.pas_id = 30,
+	.dtb_pas_id = 59,
+	.minidump_id = 20,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp1",
+	.ssr_name = "cdsp1",
+	.sysmon_name = "cdsp1",
+	.ssctl_id = 0x20,
+	.smem_host_id = 69,
+};
+
+static const struct qcom_pas_data nord_cdsp2_resource = {
+	.crash_reason_smem = 665,
+	.firmware_name = "cdsp2.mdt",
+	.dtb_firmware_name = "cdsp2_dtb.mbn",
+	.pas_id = 57,
+	.dtb_pas_id = 60,
+	.minidump_id = 29,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp2",
+	.ssr_name = "cdsp2",
+	.sysmon_name = "cdsp2",
+	.ssctl_id = 0x1f,
+	.smem_host_id = 133,
+};
+
+static const struct qcom_pas_data nord_cdsp3_resource = {
+	.crash_reason_smem = 666,
+	.firmware_name = "cdsp3.mdt",
+	.dtb_firmware_name = "cdsp3_dtb.mbn",
+	.pas_id = 58,
+	.dtb_pas_id = 61,
+	.minidump_id = 30,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp3",
+	.ssr_name = "cdsp3",
+	.sysmon_name = "cdsp3",
+	.ssctl_id = 0x1a,
+	.smem_host_id = 197,
+};
+
 static const struct qcom_pas_data sm8450_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
@@ -1695,6 +1800,11 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
 	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource },
 	{ .compatible = "qcom,milos-wpss-pas", .data = &sc7280_wpss_resource },
+	{ .compatible = "qcom,nord-adsp-pas", .data = &nord_adsp_resource },
+	{ .compatible = "qcom,nord-cdsp0-pas", .data = &nord_cdsp0_resource },
+	{ .compatible = "qcom,nord-cdsp1-pas", .data = &nord_cdsp1_resource },
+	{ .compatible = "qcom,nord-cdsp2-pas", .data = &nord_cdsp2_resource },
+	{ .compatible = "qcom,nord-cdsp3-pas", .data = &nord_cdsp3_resource },
 	{ .compatible = "qcom,msm8226-adsp-pil", .data = &msm8996_adsp_resource },
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource },
 	{ .compatible = "qcom,msm8974-adsp-pil", .data = &msm8996_adsp_resource },
-- 
2.43.0

