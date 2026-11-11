Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382304;
	b=maRXaMkf7VD0xgEoluKTqGFeOFQUCGBP9kAP40d5ME1r2eNZiw/FpIRnVO8PTVP530x5
	 0Fr22Evc0GHfV5/ifOTBQBmeh+feH51ZzMf0sNhGJuN86hzcS8IY5sp94WdBScMkPu5ec
	 fjg/lvrSsQ5Os7R2zKr/2QAW6PZug5h35glsEFus4en+gwmSRrodO1S/VuL1QXJ0I8my5
	 1bPy4fc+oP5c7PDr7gk2KBHJ7cLu5hU+ogj9g7zzVZ1oyADhQUBKQbkt3x/HB7R3WQbYH
	 oQSkUsCJ+OKW8uJd55oelEh4oLSmtg/IMpOZ1zLGH7sd8vtel25njv1mrSjEXfCj/sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382304;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CDVD0QzvfAYRnfrAOJQxMdsebcP3KKppr1IXtEF3kVI=;
	b=SDCEFMma+F0Ob7CgaF7lxSl2aL6943EUI2ldz/OMeD8zCYYl8DR1pNbcUYjO+SRu3CAU
	 vEHk75m6I3HZtTl+/pRi2EKiK4x8CPdtEn6x3Zf+MwBEJ2dMQqg098KiW6P2Sordl8bLU
	 2jUU4hjxs3mmFn+IhD8MsQ0UwFgMm6KEEWd53O3p+OK4p86WieYKO+AtVBnAsncO7FYWF
	 b+qDhMwxTnUxtPu/D1PI6qwD1JjQbHJW+FwDhQrEmvihV5aI2e29dPu0cwGgllsbc6n4/
	 uqn+YC2wWnF6l4i82qeQtINsX6/eSH5Xb/ySC8EXZ4rmukiDzYGT3wtrdPl2LZtpqOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UXz+UpGL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q92skLzh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603F860A2602
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 603F860A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UXz+UpGL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q92skLzh
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KPVh2017607
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CDVD0QzvfAY
	RnfrAOJQxMdsebcP3KKppr1IXtEF3kVI=; b=UXz+UpGL67sbdG7Ow4iFGiPbOMP
	aBs0ujVFytXPNFjeW4Mg8ctqvQPDKrWOGENYGy3WZc71+/OfnhwNkpr90IQa8pAy
	znQq86+GlScawpISqhUnQLguxX2uGuswaRG52maayetTJ6T6y6ng7N36kW5FZIP8
	9J2RN72NRVCI0IPDBRFzbPcS7ngbTbliV8Zr5GbEdGBXU6Vte7wQTPm1bQtYkoLP
	roqTzChdZ1QdLIeDirUUZ9uG/k0NMIfExzfGu25Rab1qkfIYGaL8gI2eFxCh9mm4
	d7DDKgoIEh6ChM12fakqWomXemCNAbpGefKq6EM7NFkT4cQ/Qyd+FRHckKA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97cagyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:31:43 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1aa0fb7f157so4723847c88.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 23:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794382302; x=1794987102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDVD0QzvfAYRnfrAOJQxMdsebcP3KKppr1IXtEF3kVI=;
        b=Q92skLzhsbfQIp8UKc9kScf3zPUuutQU3aTNMvGKh/TOy5lGecPMBsfOXNQQIQeS1B
         jKpr6vJchV8BHJQxgVq+icFVRGtI3XyR+EuBS+J4kWzsL/zSU3l9rpYXcffqK2gXNcBj
         KH2WFkFcJD+xAxsoSssLr1CZJblCD3C1iQ+K2dUzd/UU21cOfSaO0Uo+RsqwyTsOcKbC
         MFeytZnkrTSo6kMl7DzOCTfrlQjPZ+cVDNgBf0eHaqaoTyd8lxmRMCrjCV7733fCmHJo
         xVGEeecTasN1ML5prDljHb2FIN0jayHS3QNx5T34afoUTUpLe2QwTJhYvI5idsTe1Hem
         GHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382302; x=1794987102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDVD0QzvfAYRnfrAOJQxMdsebcP3KKppr1IXtEF3kVI=;
        b=hldyrU55f5oFzOXnJ4nBSLaxcedeNQ08Bd52DywCcrzukx2zX4xuiXrF1WiMnXLeqK
         o5ktk0WyqVPVDRossjrMz3+1gL3xeVDl75O4tZGpKsPJQyif2ASkibSxoU8B5Ij0V/3J
         yytoR8VjyVFEqm90avA6Gi8qBiPTEuxUhaTamt6lKTGkUlYUil7eQwIe2KftrLlfWt+5
         D6TRT+2H/taiDd/1eL3QhYywKysi31kcTtQ7sb3nVIGQqOeqjwF9IMWJvU0jaWL86+Py
         YQxjG1yl36j3tQTmB5UL7awJKKiuBGy7fVejnWw/1v73sIqxGtNvUPMEvKVJ7d3WzIem
         QdSQ==
X-Forwarded-Encrypted: i=1; AL+hErFn8r+IbH0//GO6TNBLXWZFA0nrObhuuvTtOUAmEwWIA4uRTuWsTGFcs54QBkPFCZ0iTulRuxkDWOyf@vger.kernel.org
X-Gm-Message-State: APuU4Z80aG0j82QBLKpd0u5HKYGc6Ki0dNZWXABtLdajqA4k09atI5d3
	ioKzyTLG1ddXto7MAbypW5JZhST3wZ2zxc2YvzRnDgx8hWn4dkXAYkcFNXbreREP2ai8bWdiehB
	Bd/ntuC5Ebqjzn9oPlm7dFvlbNDPT8zucrUDt71EJMx4Loic6E1xyt5npCizi0OEQ
X-Gm-Gg: AYBFou0T/mcHs4nCkIm02vVN0DpdWpzpsPAO/p2PW7iPcg2dkFdnU5btPo/uRxHcsbl
	5YD7WLLUiE2MDPTkfh8J9QgRGImWzhuef4EP+wKWygef1ZDZVUuP7mi+h5UPR9GU89JwvzQqL+E
	h/hoXBysYJtraDGgwL0pvL7/CcJX49drKix+wEsbpyZReUbSdvkCkk1Z4mddAZqDtf7uejohFSj
	aPmIdqy/3HeSijKuWGBFTmXtoPzDt8DHygvoezk/o1nmfE2dlvfvefJ7+ZabOduV6abTZm2WVQ9
	XkVviR9agTc6hsIuU3IGxjgwzG+t3db7KvdMaCcYyhCyooj0H1IV+LNCgJ8blxpR3B2Gk199VX+
	vnYvzgR7m/yrNKU10mLos2I/MsFV2Jr17io+YTfQ2eI+AKkmeGcRsTKf+STaebBomnBK1u+QK9p
	otwe7YkJeCSo9vRLrUBxwHEn/h8A5edQKe
X-Received: by 2002:a05:7022:671e:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1b3c0332a06mr2052017c88.27.1794382301904;
        Tue, 10 Nov 2026 23:31:41 -0800 (PST)
X-Received: by 2002:a05:7022:671e:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1b3c0332a06mr2051968c88.27.1794382301078;
        Tue, 10 Nov 2026 23:31:41 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm27220027c88.10.2026.11.10.23.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:40 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 1/5] soc: qcom: pd-mapper: Add support for Nord
Date: Wed, 11 Nov 2026 15:31:17 +0800
Message-ID: <20261111073121.3707030-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
References: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfX/1PAiEmHxjKJ
 exnSzsdMzzja2GXDjufE55OwLNl0aqYYfG1ocZG8DhB3mux+HUBBAyhTIzsbFsFtccP2gC2aAJJ
 lEdPoOSxQfnEZpswU3bUsUBSupc9CXbPbOVACqVOSx/KAIAo96AOiFbFxDtO3A20ZRv2D/rnJV4
 q8IJXxTEicReGrs2dOC17zN3o+fwbDj6heUAQza2TAsy1WCMimpvtRp6l7tak79NHXhGCjUmJ+S
 Ak1UR24V8PE+/kQLB5XcjNLooglfmywG4b9TUh9nUQV3+2qilEcshqqcfKpZrt8CQdutsOoBUsq
 eXAiZnyCdHJdtRWyglJMgk3DTYgav5kcGFmbwXoB7VIjHEfYT+J61LFu8+bZoZseavovwzILdAI
 N0wCWXw2fUXQxpRjEekslKLjT2vmfxCeeKlJwQGpdOkHDkTF6ApkG45OuQGbj1g6QYmKLtZpu1W
 wzGJV5xs2yPJhaEz5MA==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af419df cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=HqhytwvpZ4pInVvSuXIA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: Qug_SHUoA4geaAwF7NMm0TrVXV3uuSdo
X-Proofpoint-ORIG-GUID: Qug_SHUoA4geaAwF7NMm0TrVXV3uuSdo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfXx/FV5yjKunpE
 teq8z8dgg48lDi3AkJgs9W0o713ljCNPbxDkXgKXzrXuOVH/0YYajihCymYPCEsZ1R42ZKZeNDN
 /fcnWOpkhm8f3Fq/Jnurn00KC9EBabk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110029

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add support for the Qualcomm Nord SoC to the protection domain mapper.

Besides the audio and root domains on ADSP, Nord has two more ADSPs,
each with its own root domain: msm/adsp1/root_pd (instance ID 123) and
msm/adsp2/root_pd (instance ID 124). Nord also has four CDSPs, but they
all share the same instance ID and root domain, so a single
msm/cdsp/root_pd entry covers them.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index e38647f3d7fd..0e2b7f4607da 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -277,6 +277,18 @@ static const struct qcom_pdm_domain_data adsp_root_pd = {
 	.services = { NULL },
 };
 
+static const struct qcom_pdm_domain_data adsp1_root_pd = {
+	.domain = "msm/adsp1/root_pd",
+	.instance_id = 123,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data adsp2_root_pd = {
+	.domain = "msm/adsp2/root_pd",
+	.instance_id = 124,
+	.services = { NULL },
+};
+
 static const struct qcom_pdm_domain_data adsp_root_pd_pdr = {
 	.domain = "msm/adsp/root_pd",
 	.instance_id = 74,
@@ -414,6 +426,15 @@ static const struct qcom_pdm_domain_data *msm8998_domains[] = {
 	NULL,
 };
 
+static const struct qcom_pdm_domain_data *nord_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&adsp1_root_pd,
+	&adsp2_root_pd,
+	&cdsp_root_pd,
+	NULL,
+};
+
 static const struct qcom_pdm_domain_data *qcm2290_domains[] = {
 	&adsp_audio_pd,
 	&adsp_root_pd,
@@ -641,6 +662,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,msm8974", .data = NULL, },
 	{ .compatible = "qcom,msm8996", .data = msm8996_domains, },
 	{ .compatible = "qcom,msm8998", .data = msm8998_domains, },
+	{ .compatible = "qcom,nord", .data = nord_domains, },
 	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
 	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
 	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
-- 
2.43.0

