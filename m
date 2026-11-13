Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548047;
	b=vOr+FtoBKeHJ0NqUyR5NzS671l3FcNdWRqo0IbVmkibGApeCM+uY9dPOpMemnkxieU+w
	 NAwAzkJZlZqmyWxbj61RMI4irRnEdw+KFDIPW8poQOxEBuGEZvOTYaCLDSIG9Ctihz66n
	 0Ftgss4oRLBEdR7RQUPoAOmejOS1DDqTK3XSMKnqByZc1jlrKGm+Io6Zwyu1/00yWnDjJ
	 YXbtuL7Py0pM91hU1cIlYKWCmmBGrGPe5XlT3AMX+ts9Jt0yIIFrKwZ9kX7TJfOCtsuMr
	 buueTgFK8H6TEt+nxWkWbFX1eQdjU6pmNJNAEh/3faz/Tk7YQDDbUV0cljncc/giicA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548047;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vtvmwMJ33RWSUNmE5I11asHiWXJILMh26kLEbzoo09E=;
	b=UVfL7b2XBA4agibMwBhB53m1fKTvz7H+lWuNe/h1y6Rp6zlGjEyevjwrqH2E6L5JETOS
	 a9CUtBYt0CNPMbU/t/deNb2KhP7I/CnGhtpF0MjTJjaJYH4avu7PC2iga3VnO/dtIfgLb
	 8OP5PKHirm+VTGVQccxuIxDMEXuPbhFk51IipO3Dft44iVbVZ8buGGq3EpiKkPBmq6rxA
	 HwTszRclazwbp0BGSH4yGpcGah5gX8p/k1Jh3AHdXX6WZX5CByke7XdF7bLB65edVHgI7
	 KeleSXrVRh9Kp/kfILSXNbFcLFYxD7/ArboLJSyJ+7RLaAk/4yZktRvfibgeOga0yQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1PJah0C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iD5FFwrc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1E760A3811
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B1E760A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1PJah0C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iD5FFwrc
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57WX93120260
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vtvmwMJ33RWSUNmE5I11asHiWXJILMh26kLEbzoo09E=; b=p1PJah0CEtUdWkpN
	pnByS5I7/mOuo0ZDI7Hvsu9DOG9ukIw3sDDuisGuJmJ0cnM4HgLj3Uz5WEoJKEnv
	GOp3YF7YwlYQpjd6keOPySolviUmZojfgCQZoCWp9nvG+0r6ebEU90I4NiqEaWUo
	VclKAb4oPLBzEmQGClV7iZxVsDzP/IpkESkyhWShzyFpDcBQoeGAkrAtScuy/aAa
	3DiV9LnFZ8eUfihQM4CwIgrE1ioa88MpoZ7NTGbqQod8X+Io5FWSVdN0+2WsjlEb
	E0ulUCmKRoSfSyO3A25Hv8qdJwRdBzMmbL+b+c60cwV1WhIjFsplTXXVW2OXJCLz
	Jm49OA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgw9mg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:34:06 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-492f39f29c4so671755fac.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 21:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548046; x=1795152846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vtvmwMJ33RWSUNmE5I11asHiWXJILMh26kLEbzoo09E=;
        b=iD5FFwrcAiO2yE0NTXbJTE1NZjsLivUxy4S5Ulmr95lYm/ybIwRoxS2QwH5UCkEgBp
         lEttrgmt9zI6Du6SzOZcXOEMgSJgi1BLnZTKKZ0NO3WbzlPKZcV0BkbKNEWNmjODsXw2
         jBsivLTlQa4N3rQl8XcdAlQoDv9OFcS3jaonoDCEPySNmeK1B7SK607ObxnJ5wR1S1zu
         Wk3qUOOZGj1cSPm+jqEUuAF+7SX+vRvdWx9taQqW3vSqPZvWLgE9Kino7W6cv0TMPaeE
         W0q4Uj6PsuLYClLR0YdLhVVRio1XODQpCPyq4g2ow8NYsitmHhpWAiG7A54XW/BfUVE7
         jqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548046; x=1795152846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vtvmwMJ33RWSUNmE5I11asHiWXJILMh26kLEbzoo09E=;
        b=jHlcwyOr6ufpV8Y2GT8nWjixZGrHxCILT+FNiiXcC094MLU9DPPkZAUn0XdrMi+bkm
         6Y8OBXdvqyMc06GBTK8QgVFeXSsvJb4Ak3ju3m1yKmnaZ/KTlpadZUAbi+QvrAdsZPBE
         ww4WvtEVF1B/0ecVH2h9pR7g4JmvcsKM4Hjea3coK3qwWdfuu8FTFc92XcM1rgCfOISM
         bV27WEwgPTzUNgvBkl5RmvRiTYQEI98LPLBOJGDnt5h9hRk6S4jbXEgTGcWwJx3E/hLC
         uYsfLDPX16N3DfNZU5gXx1iT4W9meKVx1tehlk5DuDQvcagsEE72DTGWK1kY4kf8U1bV
         wiaA==
X-Forwarded-Encrypted: i=1; AL+hErH4boqYyrmuq113IGA5gIrHVG8ALnOQEoAfDdNMzHziO6D3OamHiOoFztKqZW5Yq/qlt7f6azb/Jp2D@vger.kernel.org
X-Gm-Message-State: APuU4Z/Nar+nHJwEoz9n/fbqzH/LNjCQZyZDWtksB/hzUk0lE2d7iDEm
	VJRcTcEL7oVCt/icneSGW/NTZHlKYDKPhr2LoFksCv81BDhE26mO+s3B3w1ulkFy5/kUiAfNjRU
	ejgssbTn7GJGL5dasaobnkMVD28uILdAwHlsxtQJAdAHMmwvk5zth3DLnRvgV5HKx
X-Gm-Gg: AYBFou38mX3wflIzwK5Y+v8sT8wcL5mb7Fzb4dIex0ntodMPaMjb4UoTy+96JDk6buC
	wpzFGe8QMbBlLiCo/6xojlHffzePsLfHPv3I8Tz1oSQrvJDK7i5Z+56PDFp7MPAn24t6hCaZpiu
	Pw5c1f/85amVBcxjvR1kLLXTl5aR/M08UXmpHhnF2FkTLfCKQRmZ5lxRGYt9E7UKrOwn/eBpGU+
	SuWryxgRbHo2dzsfCX3kZ24/EV122G458+jw7c/pxOn4Bg8WpIVSta0dkOuTSUeo72rDziG1v7T
	uFu3u6m7mOVVY4SHB4QuhlscK/ylydKH6CsQ67CoReRuuE9Fj+RGzNMbknfoiUFibmM0oD1/T0A
	AQ/vZ2uAvfT406Uqiz8rwblOxXX+JQEz8HfBQnggniM4b/jt1yffbtSVqWjhsQRdAbIkISpiIqV
	QeMuFFJp5eJfZVJQ51rOFFmHL9PIa75A87wxjnd5gWyHDViEa3OyyKXwdG7cfR
X-Received: by 2002:a05:6871:329c:b0:4ad:514d:b19c with SMTP id 586e51a60fabf-4afdf49294fmr1673507fac.11.1794548045740;
        Thu, 12 Nov 2026 21:34:05 -0800 (PST)
X-Received: by 2002:a05:6871:329c:b0:4ad:514d:b19c with SMTP id 586e51a60fabf-4afdf49294fmr1673501fac.11.1794548045271;
        Thu, 12 Nov 2026 21:34:05 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:04 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:38 -0800
Subject: [PATCH v25 06/15] media: qcom: camss: Add Kaanapali compatible
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-kaanapali-camss-v25-6-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6a14e cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: YCoSRXLMxek0NEjx9FBWEkPgIKnDmfvI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX00HwZ+Y1Rtpd
 nlY/wcoeUkdEQ5d1x67N1bytnkxxDNkV6gY5BObr5A4zWRoJg+ccvCyGixrkncv9MPwfqF9V2vs
 tHhczD03+8nRqSMmRjRbDG5ZiJaG4945VFCvxQP2yS7gNKgddyQOTh8Gsqrj/M+6NYY5nR0j71U
 Tgw5ogjrkpZIjaXIgb0LbbIF8zCVgQg9+xV7YcAmEAdY4r0o4ciJYMi/i10bUSaGB0kXtAdonmY
 j7w5QrY7MC9quvAmSMBda0i6OeOiw0mrI/ZPuA4UOzrPZlsuy6snLN1D23K+KaNeLw/wLhoDEkh
 o3UqNABVxS2xZwY4PW14NweUwzaente9URoghdHHh2PRkQqaBdUg4k3a6sZjqornCwo1rjDRfbq
 mgV0oATCclsrQkWudU1Sa6Wzo88A0K4qZo+Ng9LYj653OZ+FChiNG4ZmXZ7QhP3YBXHANvfB5DL
 VRY1LyVu6vBioX0Hzmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX29nTj/JgwvZQ
 v4nAzOSCBUYNPdHWZsM3SRU0w6v4BeeGdtWew/Qaeg3Ig80+BQVYaRo4J7C22kXl8KTjagZlhXd
 GVP2PDlkAUrKePci7nsqEVvTECCEv8c=
X-Proofpoint-GUID: YCoSRXLMxek0NEjx9FBWEkPgIKnDmfvI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
private data. The private data includes the ICC paths and TPG resources
and sets the CSIPHY count. CSIPHY resources are not listed because the
PHY is probed standalone. CSID and VFE resources are added by later
changes.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 25 +++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9521301ec972..cd6adf749c6f 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
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
+	}
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -5585,6 +5599,16 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.tpg_res = tpg_res_8775p,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = 6,
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5819,6 +5843,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 431afeb381aa..97fec24e6804 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1

