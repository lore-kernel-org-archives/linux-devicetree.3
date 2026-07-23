Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6154D2ED3
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 15:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821581; cv=none; b=ARkWbJRHDGrrY+lOvC48YiucVs5Db4VS58Yii2fMXW/lrhOz+uBdEDKfLPrTjia4hIPlCFvtwoUlm5Z9Uz5zOedPd2o1Jnd2b+jnbF52ove493gUf9aHD80JpVMuoFo7HFkYWBzROJteyvaa2tgs0XDqN1Lx8drmKoNjtIb6r9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821581; c=relaxed/simple;
	bh=3usl21QCEfGlb15Z/9fJV1UfOjLgGDOlhTwfEYuJuKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=els6RYyRondcgYPc1aSRJEoZCgZAA8YgS0q1vPMATwNKeniNhDP9kXQO3WFZgUoTRzASKPpB+BiVdcyL07EKocdvlC1Y7AiGbTJqj0tJyKppyfVB3DMZokvNLHI/xqYRCNt8o+GhULo2mYQsQXLmkSBmKXClNYQpUz2ZEHiaPa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WaTfCP0m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bPAQ5gcV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WaTfCP0m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bPAQ5gcV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvOJw3951367
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 15:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XPkP9ov5gTe+4QVoOYuE3l/K6+RH8/0uUYtuaI2zhTs=; b=WaTfCP0md1kDMiHb
	pGCB+1D2vZOLaLf7GOfqLiEBaJqjD7HG3HyqUdYIh2i7M/l+wFYcLe4SRBgrvRKu
	89VOb/MKvaRkSrFRreuQmNGjQ29IOw94pEQNZG9OsZbPtImJBfQwLRn+1wG8VoBl
	K2nC+UqzvzlxOSIFANquPKPYeMxoaxrWZ7GL6yi5B1GyO9ZI5lxGeHxJIWdAM75k
	b9QZPiZBwnvZN/36xEgKjsmr99mfxsrTFFX+/31T8LL8fUbwtS4D8yaTMIL7KB7C
	R6+CBKDYMzN06brRCihmlSJGKwwZkelSLVJEoxnDf2/TSkebUlOXPbZ/8eCI1783
	IPTrjQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkjnu93cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 15:46:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc6dd43737so18452155ad.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 08:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784821572; x=1785426372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XPkP9ov5gTe+4QVoOYuE3l/K6+RH8/0uUYtuaI2zhTs=;
        b=bPAQ5gcVzZODHX3n54+SnWRjDPQ0xQGEsPw/gkpfCRtD4b6mVm/LyTOrQusI6ahW0s
         K/NPXlbhQQZyIEbiVem6VPQEqv7dp/Zm92WmVspFXljt7lSOE6VlfQm0nhaQSamRSoKn
         MGr2udkAA3QyJJwKMKcuTCu4Y7ZUe8f960vbG2R9a0c2ypWmYKHfIBdcnWMUqZSSM9wd
         IHW1Sg0SteDhdmrOFFkfm55wbwLmaAXz80+nW3/xw0xw0PxHD+bK11xtmXlNFaoVDoIB
         knROwF4bli3bWVBAl9Tiq/1yTBW8YZ5zY7YIulnF6J4XvkXoSvEpxO7arozPj4TPZlRu
         6OaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784821572; x=1785426372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XPkP9ov5gTe+4QVoOYuE3l/K6+RH8/0uUYtuaI2zhTs=;
        b=pQ/RcTBWqyisqOXBvACOyNp9ptlJIdG+CdmdHCNAAvGYVjrU8HUdrgA8XdM9cPEBoz
         6F41OToi5Mt13tR3imn0cVKKdm1Mweq2XmjRJUn19sX267zUh61X3lUfo6DGuC80TJeM
         eNGzvx+ZR4Pxux+6b5tcfrcuG3OQHNBeM44rF+jbGd0phqDY46x/rffhMN/xU9wUDGye
         dV4RFNzp6fnp4Q7XxTYQyDKwV4tp8xKYpllnKYV4bu9IFzB2kOHgq2SQJHBir0xgKEKy
         96pC/ykVHxwWRI2RLxmGAhW0Far7UV57tj7TyPZHML+hppRP/pltSuK0sCeTO8QsbY0a
         +nQA==
X-Forwarded-Encrypted: i=1; AHgh+RpNbc7AGHPSK5YXAEZgnbwelV21+WjuDHDNHZH7DYb55ElgwoUrDJEWZezA4aAsyrmIlGWWNdB4Na+Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yz57TK+IuXd1LMAKb5Ydt5MfO6up+fQOKLjtrpCp/96ENUqWZDS
	vQyKFK1Hr8E/LzjlSoQ0Ka7dgTM/TICjQJ9LIN8m0KMjIVC8iwsM5IN0Mrrk/4fAP0TJWFQttYg
	meoTcMOZhBeZFBhXicA8EvZtreFje3K+ZoOFJFncwFZ3M5u97zKL4n0gmEiWej+iG
X-Gm-Gg: AR+sD10ZhLsFr0r/IWRRXdZrNTY7d8S0LFAuhSefS1BwDDJ1rdcB6+JwaY96imiM2NC
	1DSro1LLIk+lhJmup75x3srvbQjRjLNcBB4lFw5ugyp+XSrHlgeowiDAAFenL/oLJqXrbq++EDR
	gUv/FP5So1IxSF04iSgkkCL3asD5HUZP2K+BVEJHT7ODf+rNYu4dLP8/spwMnvclK7H93TP8CD4
	qdp3X6dl9SQJNhYJPOXlSuOESwfDfUxjTCUGolknujU9+FNLZZ+mQq5ryhB7uFJYvioyGDKwcYs
	KgUZqEzxr84FebPk8p4X6r/mDPTitVIMt+3xYTOj6PXbl154loi23JM1l4q+pw0sj4zWnec2zup
	5shzSLy5luprU4VK+kp3lPMa6fKSYpUA=
X-Received: by 2002:a17:902:7c03:b0:2cf:4339:aaa with SMTP id d9443c01a7336-2cfa7435a2bmr33100555ad.12.1784821572129;
        Thu, 23 Jul 2026 08:46:12 -0700 (PDT)
X-Received: by 2002:a17:902:7c03:b0:2cf:4339:aaa with SMTP id d9443c01a7336-2cfa7435a2bmr33100095ad.12.1784821571557;
        Thu, 23 Jul 2026 08:46:11 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd7157sm36242625ad.18.2026.07.23.08.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:46:11 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 21:15:50 +0530
Subject: [PATCH v3 1/4] clk: qcom: common: Register reset controller only
 when resets are present
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-shikra-audiocorecc-v3-1-90b878ae0d4e@oss.qualcomm.com>
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
In-Reply-To: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: hqreByqTy0BGDQ8hqigiF9ZAeICjsL-1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE1NSBTYWx0ZWRfX6Rb4vhXbXuK3
 /TeKWh+qGT7R1vn3Z6leCs4tMRC5StNNh1BFhbxMp5DxahgUPHHXIEDdkCHTh5jChMLCMpb74dX
 9DOUJZo1rjA+KtwErCPDdmqd4oVoQWAAg4nZg8/uEMqijp3lxQ7rJaH5yjYB14JXzOvlWZzLvpf
 cly6CQj9q7M1LjBCJpuezaJ3WG43yNFGbMh9wDGEGVB4JLnswbDCK2Zn4c5uDf+GgEMfPc5AKf0
 N3pNQSWEdMLj2EwCnmG8MYUaDrT7s1x07dmka7bbeyftaTsFS78QnrNYxaiPijhiurvuRXAe5by
 h+4uVaa3U/4BxPNNXNMWxcdj4R7hGjK1JKRZTyJxP/S3Dz53+ZzY5J0tN8eSRJe9jbvYt7KsN79
 gStGKqJHUS5BfDyL49rg5zUaY3Lp/sGmARCSjmajbAvqF66/x/AaJisVK7JhaqjmqdEYAoNPMeM
 uvsXn9T1l28gKQhK/Hg==
X-Authority-Analysis: v=2.4 cv=Een4hvmC c=1 sm=1 tr=0 ts=6a623744 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE1NSBTYWx0ZWRfX3xETo249Ypoe
 mwPpVyP1d9w0YV994IwNp3WAOgI9jII9FgUe1eZHlw2KgeR51DeIcRFM2TWHVCsNgFFxU9PPaCP
 hJpCrFK6Z6DvP8K+8BCWkc/Y4fIgneY=
X-Proofpoint-GUID: hqreByqTy0BGDQ8hqigiF9ZAeICjsL-1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230155

Some clock controller descriptors do not define resets. Avoid registering
a reset controller in such cases by checking desc->num_resets.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/common.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 2c09abaf1d2a15b7fbbbfeb67c03075381185a00..d6ff83045da8f308dcb9c5836af48090323248de 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -359,17 +359,19 @@ int qcom_cc_really_probe(struct device *dev,
 		qcom_cc_clk_regs_configure(dev, desc->driver_data, regmap);
 	}
 
-	reset = &cc->reset;
-	reset->rcdev.of_node = dev->of_node;
-	reset->rcdev.ops = &qcom_reset_ops;
-	reset->rcdev.owner = dev->driver->owner;
-	reset->rcdev.nr_resets = desc->num_resets;
-	reset->regmap = regmap;
-	reset->reset_map = desc->resets;
-
-	ret = devm_reset_controller_register(dev, &reset->rcdev);
-	if (ret)
-		goto put_rpm;
+	if (desc->num_resets) {
+		reset = &cc->reset;
+		reset->rcdev.of_node = dev->of_node;
+		reset->rcdev.ops = &qcom_reset_ops;
+		reset->rcdev.owner = dev->driver->owner;
+		reset->rcdev.nr_resets = desc->num_resets;
+		reset->regmap = regmap;
+		reset->reset_map = desc->resets;
+
+		ret = devm_reset_controller_register(dev, &reset->rcdev);
+		if (ret)
+			goto put_rpm;
+	}
 
 	if (desc->gdscs && desc->num_gdscs) {
 		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);

-- 
2.34.1

