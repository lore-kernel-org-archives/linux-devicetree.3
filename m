Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDDD21767D
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 01:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774228663; cv=none; b=cCnBthbX8EEQ8nrxL6n55rWFihClsr2drteCl1UqlGgeWLX/zT1r6d/09s1dnS7ibaDxYcJZlItYTvOfskqKhpCdLnAnOXkkdDli0sDEpCL7Em2+DtwsTGA3di/oMSfdQ1uwti3E1yeQooocIMG0BUfjGOm1yWztMkAWRl+5bbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774228663; c=relaxed/simple;
	bh=Ya/NJt7pKVR6io1jC1dQy2DY1Rkbk/XPlKWL7mD+Jmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hW61mCJNmkTJpLVYwhKrefkPDppUsFk5n12N17jWWtyWhTW8+wv527S6AMNp2cMQ5gMXyG0sWGS/BPAt8xCGbKZ502aJiNla0TqKOm+FdM2zgRSMvUR+8mQti6Y0AH81qurbdSm3ZjafwxpGLl+CDGQ7EgH9jKuIgOKLpa9jln8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXk0p3mh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KXMNUYlR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXk0p3mh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KXMNUYlR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MNt1Ic578945
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 01:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wTOuT2RJ0koUSSURaKhqCLIXf071rLm5jfDuWF+MJ1Q=; b=cXk0p3mh9bZFmsB1
	DFxBheHjhCI8KZKQWoagU5+TxwtUFBkzg9tDHefVwD0K90HjMv/1YLDiwOcJR/K7
	s7JzwSeg5SyKctpppNsZm96XN7Ek/DJxQx17vsNjLmVs9lhXMFhPx2ADu9cf8tVD
	t0R7qYbPpD9HPglZIewp5TAU+3aqAak/T4Q4FTcJRF94pR+T8FlT8gCxo7XcZ+8S
	D8mzRFXYVok5TUGu5ZIu1Ows5gd6RJzvRnjX/vuFrWvB9VD4hRW1v+gKncTT+YoT
	HUsy3qmd4Di/ZGF6AA+WTKMlDg4FRTxLiXWS6jhPnErGySYGY8u9+7oIv+HGzQo2
	ZsmXsg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kj1k5tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 01:17:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090e08dcfcso339456371cf.0
        for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 18:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774228660; x=1774833460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wTOuT2RJ0koUSSURaKhqCLIXf071rLm5jfDuWF+MJ1Q=;
        b=KXMNUYlRq6klgzjcJSDlL9fjnoPCIIneQBP86zBQT/y8heuTjLTzXBv/ZyBNEfUKYT
         628WByvZ5aGi+DrCkPwC8Dg+cUd7CCf6lyxowvdkhGk+Smodo9wy2uR7KwGDFfxTWpLO
         fzhvY5VlW/00flOnRYoUiOY4w0mq4De465WkOqx5ikPg8CNB5zdFIH1SS4Yf/KzV8yLn
         5jx4YEYvLBR+8lK2eyAdE/WOJCOoTGeKxD1nC4WH5vLtDRg9Bpx6WaRaqAphA/E/8t7q
         +r/NMzjVOHDe54rWosZXDkkLSOAdmWAJ6atI9m2AZascMb3K8+3lL274Sob44cz7yYS1
         DCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774228660; x=1774833460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wTOuT2RJ0koUSSURaKhqCLIXf071rLm5jfDuWF+MJ1Q=;
        b=ci6HUFR+yNWt1I8t0D/BWJLoe4o4+bTuLQTvLzoC3fBu0zwvluQjOO2HWhUG81i2+C
         XArGYRbLKxMEJ1NAQFqxzcsDDHOnhcGm/bbBk1mvFuOccpK2mC/FTz4ROV5CyPclIACw
         HWuuoqWyMn2/2kd0s3piGqjdO2PwV8i0ommCsX5Wa3Om116SSEgfCDK0pzSvKkH/C96B
         TbuVHpIFDmZj9DoqY8V2Z92ty2RocSjcZ4jRdrP3Bf6W+AV+g2W/KSobha/UguWBO7+v
         KDwxhgK/Rpl13KcI9Uty9JuQUjx+5Ho1Ix0lnL4q5eTEr2z0uJUsbf950tuPsQGDUGsk
         l5Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVzi+S0R8QEzUmNEm1pJqn49F70u+kd1ME8Ci1ElHo+LHAmFAcgNFHwSUSQgg/ajqLKQqrcJCNRnbHs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5KUeZ3ojalwk24hB7ZF4A6B9kT3gg//NyQa5TG4eJEtcYEpBF
	VuS5NWxz74Sf8/Vjcly8piT5ge4xcBluzcqTZghdfl8QHwTbfEYZCZkWXUFYXkbQ+2nA1z1DLo9
	DwcwPX96OiB+6w6D6/qyLRwtYFo9s5o+qQ2E1lD3hb6/dG5h+uL7Zc3PzMZ4Nsyua
X-Gm-Gg: ATEYQzyp9/cCR3507Vw2Q/K9Y3kHOSxyjikvxmVuR2ryA7L6Hg5CgfYXjqu/sq/KK7j
	A4CK6bYWQBb0RMu8PBWLgbDAWS4Wt7j+fKxKS9r2FPGwlyxQQ1+BL94McfJfwvdVjtCDs+5x8t5
	IE0h4wAE2nv5cMigYC3t9L4p9rMBbq80CyvddQ8bkOghmGI+SgLzRLx3O2VYRoJODN/JIm+nARD
	xJ36lTJzKU5m2K+dAxwwsfIMv1eSrFsydBldG55vUEgrGJ2/x312xko/BWs6cp+rjBcozIiuZrA
	d17M3kyzY9l8Jbwz+m1CYbfbyDq5dFfA8YWW2yBAvnv1wqNCrjsyVulMi1H05u3Njd3JjeFkH4c
	4NPZZriukEW7xsyRotBRgk4w1sJ6bQ8p8aDzePccyKMxBj4kUm5oN7uUfOaDhBwF7ivfa5Q8FYx
	3OXQZoGIwZ/fnFTrL94SdPXM9ITWGKQ55pIAE=
X-Received: by 2002:a05:622a:590f:b0:50b:4984:148b with SMTP id d75a77b69052e-50b49841855mr91549521cf.64.1774228660427;
        Sun, 22 Mar 2026 18:17:40 -0700 (PDT)
X-Received: by 2002:a05:622a:590f:b0:50b:4984:148b with SMTP id d75a77b69052e-50b49841855mr91549291cf.64.1774228660031;
        Sun, 22 Mar 2026 18:17:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2853050e7sm2216150e87.61.2026.03.22.18.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:17:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 03:17:21 +0200
Subject: [PATCH 5/9] interconnect: qcom: define OCMEM bus resource
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-msm8974-icc-v1-5-7892b8d5f2ea@oss.qualcomm.com>
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
In-Reply-To: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1594;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ya/NJt7pKVR6io1jC1dQy2DY1Rkbk/XPlKWL7mD+Jmo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwJSeX1baotwnLbuBujDe1jnKIQvBvRRnSisNQ
 9ELGzx6MR2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacCUngAKCRCLPIo+Aiko
 1Vo3B/9REU/bTIRSQrxK7GSNxOljj7iZ5OrMDOzjAIf8El8TOMsTuQoNyeL3P4jFS22yNMWE30Q
 j7I8wQM926EiRQlR7c/JKS/h0qxOlZ+cWApf/rvzULqRw2oV37SFjXBqxYHsZBd66VSZEf0RJuc
 dAScHpjwQwgveOWBWd6bLsegZD41BcOL5UvA5LSjfYpKUKL4JGsHp4l7abGStklZX8TXHIPACCG
 HmLSw7/dk6I1P9ZV0h8xwQQO7iQuNxBsOv+4n8Ts8vKe14ECwXd0yCGp78KIuJOuZZCeiiqbKoB
 +596xD3xubsn7dlsYHL4C1ih9y4MY50SvjMuTV6EehoWm2jt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: awkIPtPcfNZMxAmGJOHtBAyY1kvTNDcH
X-Proofpoint-ORIG-GUID: awkIPtPcfNZMxAmGJOHtBAyY1kvTNDcH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAwOCBTYWx0ZWRfX+/Xs7B0u06EE
 6oePvcbSb2JcYciuT1s2U3wemoPbGBuVMsK9ZftjR5lJ/pONIgm3rKUYweNb4pODibflaefArZN
 Nn/erw4JUxWgFomJ9Q2X8WWbwPbKjCghGe9j29dVhmEh/Y0FynlVsE2l0SY7c6+eq6Hx+yS8dbv
 UlbN3aTGpoJrzCfr7TxmhwpLEIe2htksWVG0N/zxySqEjC1BBPahQObycZ/5jFqQpI9NNDG2LZE
 WR7dXqW/3rFJdlryIsjRfgkeDxuL8xgDDM7di+K8Xe8Y702h1Rw6/Yy7JAJ/EAtfjoAVQznxW5n
 g8biKXd0c6rDnNbrIffN3qFEVLMCfXjLAPpKGZ4oNbWRG4OCiWrKo7q8Ro95ZaGJ7vhAs3I7r7B
 UD4ISC0en1hGfXmRP4JBqenmbPO1qP5jVkD8lBxaGbLzW7CZwclVlLftZt2pLlRMqPDrvBhNTew
 MUUXjInD4ctkvlHaaaQ==
X-Authority-Analysis: v=2.4 cv=dYiNHHXe c=1 sm=1 tr=0 ts=69c094b5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=zOyvSeg7rOUdy7vhyckA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_07,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230008

Some of the platforms (MSM8974, MSM8x26) require voting on the OCMEM
clock. Add new resource for that clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/icc-rpm-clocks.c | 6 ++++++
 drivers/interconnect/qcom/icc-rpm.h        | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/interconnect/qcom/icc-rpm-clocks.c b/drivers/interconnect/qcom/icc-rpm-clocks.c
index ac1677de7dfd..69846e26f46a 100644
--- a/drivers/interconnect/qcom/icc-rpm-clocks.c
+++ b/drivers/interconnect/qcom/icc-rpm-clocks.c
@@ -31,6 +31,12 @@ const struct rpm_clk_resource mem_1_clk = {
 };
 EXPORT_SYMBOL_GPL(mem_1_clk);
 
+const struct rpm_clk_resource gpu_mem_2_clk = {
+	.resource_type = QCOM_SMD_RPM_MEM_CLK,
+	.clock_id = 2,
+};
+EXPORT_SYMBOL_GPL(gpu_mem_2_clk);
+
 const struct rpm_clk_resource bus_0_clk = {
 	.resource_type = QCOM_SMD_RPM_BUS_CLK,
 	.clock_id = 0,
diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index cbf0a365839d..ad554c63967b 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -151,6 +151,7 @@ extern const struct rpm_clk_resource bimc_clk;
 extern const struct rpm_clk_resource bus_0_clk;
 extern const struct rpm_clk_resource bus_1_clk;
 extern const struct rpm_clk_resource bus_2_clk;
+extern const struct rpm_clk_resource gpu_mem_2_clk;
 extern const struct rpm_clk_resource mem_1_clk;
 extern const struct rpm_clk_resource mmaxi_0_clk;
 extern const struct rpm_clk_resource mmaxi_1_clk;

-- 
2.47.3

