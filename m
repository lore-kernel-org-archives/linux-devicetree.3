Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01DA39D3CB
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591393; cv=none; b=WnBhIpZd/YTlrp2XEZt4waCeHGwS1Kri4YJucuKpB1X0B2pwaue8noBlacGL8z1FPY2PAxg8vFiZ04Jgnr1YH+zAmzyM9ItI/VvYLLx1iIh1qASNX6qprVFFhs0SmLrWTeGQ0EO4Lz9pjN0AcCbKgSBLJ/oLXEEqbdVDFidvIO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591393; c=relaxed/simple;
	bh=nCzaPtOgAzOu6WMMaUkEsvKLphsm8vVsM68gBNmWkoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FbxF2n8VihK6yk4dL5nyY2kZnHOJA0kSddP1AqIL/yebR6G9gF96k/2PGD2W+cApjOJfnrbrTjd+Q6dX0OOOmSnmd9GN9yAx9TV4QwmJkhcpCg1oANT5svcBS94akxCBBivt/7OiXvnYlu0+pikqklWcr0EQi0muNDGn2AwvKSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ctLwxXzc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g049FlUT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctLwxXzc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g049FlUT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB0LKM2186976
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xc0LIbJK2UYdiRG8GdteAjSaAc/1cnapMZKivOv4BUQ=; b=ctLwxXzcIEWxAdTB
	dX3A8s1CUoofPBgIIcM7LOAcPQvwHFgT/jktNG/9W34OMPsDXAaYK50S2CqAezWp
	CuEoBIJcnx3I+QkNqhv2/Hs7M3MpOXoyH6niC4HEakuk92Lze5iHii03RguU47AS
	7JGzjWIOvE3QdVH0IH5lmsZIt6u3umYMNYiKBGkO+lSyN6Ae7a0JtKb2Dso4jtgQ
	HrMzSBSeZwjGJmTG9KkVyqW6cpiY1rUU1cL3tL8HuLvDN0j9dlUCT83R1tp/xACm
	fhgCLktRMau0CgoTn+SLE0fdYdNl60DSQ/Bf4OKHjYHB3ZSnopARELDQfr0F79qG
	tqSu1Q==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0ub2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:09:50 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-696133ef271so9981277eaf.2
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591389; x=1779196189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xc0LIbJK2UYdiRG8GdteAjSaAc/1cnapMZKivOv4BUQ=;
        b=g049FlUTIoTfbDRJ0i5bXZOgc/KxXIVA9TDTmKmeJ0w4uaeQVElnF1xnj8gEAc2NIb
         RE5R2sx+dTz0NK55gfxBPMdrDQhqsWQ95XOjsB0kbiKa2+VJ+bbfcYCUoDt32vuyC2hu
         Rc49N+p4tpy05Wh3r6NtdPstXD07GeMPO/Tvdkpus+1xcBz92Bey2WLnElVuId9OzZHY
         2tejGiEnjAUk8gQorzi0rmNjmXV/hfBv3EXAfYw7J4GhwloJOqLWbpF4EuTw0WmpuCml
         /E/dEOMaM0gZaXI9Wf6Zn8cp3Bz8HsxDAXvNZwT5j2G46AE8vGSIHbdqXEEe2AJEzqzU
         GffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591389; x=1779196189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xc0LIbJK2UYdiRG8GdteAjSaAc/1cnapMZKivOv4BUQ=;
        b=hAqB89hcxjN6DnLx2WdIY/yM3DyNtLaoYbqgT69uhSFgPAdL0Hpepw3RYDRd++gvcm
         HL7iSBTci23UfpSk6Q5JzCIvBhtX4G/uhItV+RJH/KgiyChRjTt/FdXOMhJ2iJDA6+lE
         MDoVPgkSy3mY/VwGnYfNqsfXmvjk/3kNamlxwmKogM7JhdkRF/meioXXurJqUNmWlRJV
         a3oEDA5UEBab6fKjnVm/Q4D4iLdEJlP6cZMbL5KfexCix+gbcZJtxRg1FX1hVwf4TU5p
         A/xgXCan113FUSlzvRbjeHKdUZQ67uUwtwaeKU1VOcbwDJedargP3BV/57PtyrkdJAUt
         o10w==
X-Forwarded-Encrypted: i=1; AFNElJ8Fx5pHamsSELr5R0Tiqgd4TcA+EUWd4kl1ka0TY//Cgjo8Seo19TUsDGzyce4UO44J/17AukWcuOc5@vger.kernel.org
X-Gm-Message-State: AOJu0YxlBJzl3InnQJklKpoL21T4Y5Wi/ISs79fqu2YALqzyrZvKNf/a
	f1h0yQfwxpRbYYqHCz7X9XKFFWtBjTpYu8Cp7Ex0ZX5403Y0FZ9F1RJPPU1ofj+ySdy6ANLmF6U
	S663PmZW34DJD+8d7FBSndwWCiL/fAQh40Ah3JrRZkB5aKw+l6dF6kFB5TnKq2D5U
X-Gm-Gg: Acq92OEDWbBsGbxTlEHQR6FedweeKQHtFVNc+Pxe9GfdnwvwPULYOQIddMXeo0l3VvP
	Tc6lI5vHzScIcdjLcmyiHVMwFe8Pt24X65BEpyAFPn9nLfvKKGjuPYviM8ilA9DWNr8SJbdwz1Z
	pyvYxnjyopgXlbdRi+7qZYkU6trqfDaEOBQ0EBscPYLyapLrz34JEh85DxsLOU/ueWYQKZ1o9EI
	JFAVxv/DVwd9EgM4eRMWKFdsMUf5tBL5p7ZzfsRnkdyQ1c58gkVwqqoD8fwRUUZNpeHn5nKqduY
	kSh+pTKevcVZQb5CxpzBob9cXP9wgVMz48II1/jWsq7oQTkpco/zPed2bc2TF679IXqT+hSDuH+
	eTdCe11B2JG72cujS0/kkDfLvWciu9bKsxR7lJ+hLuQSHJVosxhnrWjN0vadcXYBhs0Wxn39d1G
	yGx0C4L7ljHmlr0y7q8iHHzvhnGJ2nl2rqxds=
X-Received: by 2002:a05:6820:1a0e:b0:696:15ed:6a09 with SMTP id 006d021491bc7-69b36a92bedmr7372662eaf.24.1778591389210;
        Tue, 12 May 2026 06:09:49 -0700 (PDT)
X-Received: by 2002:a05:6820:1a0e:b0:696:15ed:6a09 with SMTP id 006d021491bc7-69b36a92bedmr7372641eaf.24.1778591388728;
        Tue, 12 May 2026 06:09:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f3a8e1sm33739451fa.15.2026.05.12.06.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:09:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:09:32 +0300
Subject: [PATCH v5 4/6] arm64: dts: qcom: sc8280xp-x13s: Enable Iris
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-iris-sc8280xp-v5-4-8cc251e83b58@oss.qualcomm.com>
References: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com>
In-Reply-To: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=leB8+LKvE7kUH/wvPz6CoXenJFqROgu4EIFsX585OSg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqAyaUJThxkMm9CqBAf7q4ry5/VCwjdOHKgtWu2
 9R1ztNZS7OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagMmlAAKCRCLPIo+Aiko
 1Z78CACWqa3gELKDbwO2PsumwIg3uHEh9RigHqaLePEIZJM6Fnyb2CY5NJzcxtFKSoJYc9s8mMF
 iKUfaJS22GCYct8j6wk03KJit5/1gYBLceSq02OcoQCA+FQ9zZN2tKhTNowAHG29/BS2LvI5sTT
 VixTMN5fFUdUj2ebuQa7/+6oZ/Zz9E329KzzaCCh+RjtnfyablC7smctocTyZ0qX3vU2HxrdP8j
 C7Zx28h3c6eAXOJyeqW/hjbx/7gleC/m3OfX77gULjwha0AAXo0pIzrSJ58/4vvJtVJPcW8i5Ei
 CW3JeMG3ktbRYER6seYdUvvqC0eKBlGtRpJ51qjgcaCncw5w
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfX9CUeW3vimIHN
 QizZdjVbXK7jICUm5nN5UN4CqmRmxMqXtfVJO7dLx6/5Z0AoEvuAiF7kMyPyqjoTizeJbmIJHlq
 G4Tp/QS/VOqr6W0nrP4Z2Ymr4xnL2ZZkmPX/Ete6FmwoHqG0zaqhjER1C86gj1ACxPN28X+SnJA
 M2vXc9G5ATH1OCT2kpaD+p0syjAJwrtjauYSpAxpiBGggmtGlPr8fAjyZ6NjBE23QW6FhYQ6uCq
 8jgkU+UfuzCNgYSMvlnqh22d51TLiS/Yaw2B5vUObmkLoywIRTjONrJIgYj9xoHXIqGUyPtEcoq
 tXiXdk4ShG9mLMhBaD48rDXi+BJ8r5F7BTgWME1AdDDaaxBgk1gl+DVCThLer0h3bZqaMpsF5uI
 1fG2NTNrstmVCL+z2eQto7hS5mJBDIqVpsOUqgobqb8rre9zldcJJeUxLKUR0xbkMwoem+/r4sT
 iDZwa77ruj4bO/EMZqg==
X-Authority-Analysis: v=2.4 cv=bpB8wkai c=1 sm=1 tr=0 ts=6a03269e cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ie9TG8L8bN-JZtJQupEA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: KIph1mVqHEmj4VkjP-xQaPblWNV2aGzc
X-Proofpoint-ORIG-GUID: KIph1mVqHEmj4VkjP-xQaPblWNV2aGzc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120136

From: Konrad Dybcio <konradybcio@kernel.org>

Enable Iris and point the driver to the correct firmware file.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d84ca010ab9d..0eab03495b8a 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -932,6 +932,12 @@ keyboard@68 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn";
+
+	status = "okay";
+};
+
 &pcie2a {
 	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;

-- 
2.47.3

