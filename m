Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7467437C0FD
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 03:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788577520; cv=none; b=TiXlFBkniQ6CGt+c6ZrkK6fOqVuSh4wH627HgYZ3kcXyOowLrahcpUJ//G8oEcEljZQasdZMqo5k9/ScMKOJt/yjPPHiSi3gz8005CjjWxdvpJ6wUbiwSZ2OmAWkSehLT+FsGH7czCPYSL5Rzn4alcKEK29QsbHXM+F5FSg8SIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788577520; c=relaxed/simple;
	bh=rxreaSuQlW6s6Kj0djllXV7THEUegGiCKPjGOUpJHrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hasfaBe/fuGumOiT3fqtd9Ml8//0pnuixenU20DcNrZnyLbE7XEurxMzWXlV4yl6QOvDeUnskYIXymD0coLL/r7vuTSwULB4ZS3duOT9h9fwA4IndOaQRJJYFdvsLoE9C28PVuTRVIGXKU2UoIWZuRNz7GLteOW/PAiJtT/LcZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ss93fWjm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PuvjzhDA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ss93fWjm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PuvjzhDA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6852Br6D1414782
	for <devicetree@vger.kernel.org>; Sat, 5 Sep 2026 03:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVA9Ee4d2h5FVxtmuChNaYXSYJO45ZWL92iBFqLOn1M=; b=Ss93fWjmY5uogyHA
	K+bddQUymiuexwiyW7xRT6MSjvTw+XC+qIDB3E5lmvpUgRsyGCS6onf6VVp6UmjI
	oXzN0otV9ZXIILZ8mW+Kw0Eb2ogLelGXaRPp8tp60dpcGRhG8i6dZ/tlbMwLt7WR
	HKABDdf7eHIwJfYyCysazqTr/zetuE4c2g4NLzSW9uRVDDyZo624BfPlPFJxsk8k
	oIG972IZT7qKBQFPPG7yvJZrat77q4+h6zBf8BuSdg35y3zaGq0DjqT4//ARfU0A
	2Qu2Y7BCWYdxhuiV2aG/C6YVflZVZ1Ov6v3ZvVoTaGqySxP/WevmtQvFqO8aZEUs
	lVGPtg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gga3703cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 05 Sep 2026 03:05:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381250979d5so1984197a91.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 20:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788577516; x=1789182316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVA9Ee4d2h5FVxtmuChNaYXSYJO45ZWL92iBFqLOn1M=;
        b=PuvjzhDAQO6CDx8ewbrW77Xust0Lg7QocJKLQzstCSRDVCPOqQut3IcGbgwPHh3306
         7eRPBy2153lVnRk/hGNZelE9j4VqdS3ECPynQQqiThBQq1p2kCmcZ1HNQr5wNn61KYHZ
         eDVvDCbIHhflPQuhZ8vVSi+2IkNH22QaFVUzwjcth0WYy5I9aDIFc9HSGpIE+wMf6NET
         Clk+TOYaF/a9KSXgYmVsz59xaxg/0SL7QczyAB1GyiLT44LYQC++A9k8hqpu2srpiY6A
         MeDgKUplGzBsfa2cqR5Cza+Zpm99qcnnmyYqHNyvLPPAwyxPa4qJCPRejspeF4Crrr2/
         /CyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788577516; x=1789182316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QVA9Ee4d2h5FVxtmuChNaYXSYJO45ZWL92iBFqLOn1M=;
        b=nO6o+MOtUgLVTEPC5N1oZt8UTD6AspVxWGgQg8wWx3ZUNasBOO/Qyj64qihPl9uKrS
         WkE7q4wnoBixkF3HgQiGMlfgGiMt8y48DBJDQtGFt6B5PPDFyBlJKqvV7YLYIjE4uhUf
         oklxWnr+nKIQ/JqbonBqNxJ3W16goEEUpg4XE9FXwEVuYb7gUGyzfZZKTiKkVsajCj48
         ALmbHaBMsZLVr2CJl/D96FH6P+zHKtszIwQZyp5kxnr0ah7w425bvttpsKWkbPx/Bdst
         Nith9NgpEScBYSDJLI+1LrdIIHjOLvXHyBDgZjqL0YhHWCRbdCiBfeoTy5/wLpfPqvOv
         5ATw==
X-Forwarded-Encrypted: i=1; AKwUvByuWKNvV2vmWMJB+VTAiuZUe0kLhpbFICG/2Yj5Ta5EozGsMWHl5Yy92ArpMug/8GRK08ULA/uasJz9@vger.kernel.org
X-Gm-Message-State: AFuF++muoxVhzeltWsWxPKSHxQS2MHK9DLv9brS1NhH6Z1i1Zdt+GvdS
	XRHWtxsfzb1C0wrAW6jOW0TDTwdqrzrbfXI2FUvR38i1vAriE20L35+Mye5JTmxCOboD6RWpiP5
	b6g8n90g/kvubkWrtjBrAtpRZKF0ueo4JEJSK7++VXCFXDtOtcOSxu9HUyCtd7Ktf
X-Gm-Gg: AYBFou3gY3eTn6fjV9/tY33gxWshGvaKsmoNguK+bR6fQe+9FoIfFhh86QHV/EIDwVO
	UQkLqsuqQ4H1JzS2CMwyI6jllncDDmbo6rwdIet6kgBhJ/OSG8Fi8YjfljzmwmI3PHCaSjbqb/r
	H0memkMcPhd5/hncKQg+sOvUt13K8WfAmfZjOxCMGEa2yLdNGdxOo/aHbfrE8ZIOLmaF4bR5AJp
	ZGG/7Kf/ed8t+1XChFAmqSzKgSWsLhtjH7ljKD+YOrvizavU1PNlkrMYhDbZW8hvRnQkHAXw26y
	RVtoe2rQGRM8Tkghbshb8DtdMzYVkieObMlPVM6skQAw75yLWe6erujeBIERxxzmozIlEflDaGi
	RCKNQnRpyOOEy/dbrUBUY+pPEtjj2ikx9fYcs6uW91A==
X-Received: by 2002:a17:90b:4e8f:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-39b261ba63bmr14724493a91.11.1788577516458;
        Fri, 04 Sep 2026 20:05:16 -0700 (PDT)
X-Received: by 2002:a17:90b:4e8f:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-39b261ba63bmr14724420a91.11.1788577516042;
        Fri, 04 Sep 2026 20:05:16 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa36b37sm10066268eec.14.2026.09.04.20.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 20:05:15 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 03:05:05 +0000
Subject: [PATCH v2 3/3] arm64: defconfig: Enable PMIC5 Gen3 ADC thermal
 monitor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-hamoa-sys-therm-v2-3-1cb8c958c981@oss.qualcomm.com>
References: <20260905-hamoa-sys-therm-v2-0-1cb8c958c981@oss.qualcomm.com>
In-Reply-To: <20260905-hamoa-sys-therm-v2-0-1cb8c958c981@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788577511; l=1251;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=rxreaSuQlW6s6Kj0djllXV7THEUegGiCKPjGOUpJHrQ=;
 b=iDk678TU7TFAt5gHT58aww9SHykDV+ublp7Jsgl5+M9+wQhRx0q8UIcLPxpzj6tTQl3YiGhjV
 +XFHt6RWwH8B2wp4BMHNhOSvLk6/qom5HfhqcK8rHapLy/8GOKmPrVb
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-GUID: xZTpC7pEyo2_4SUmgAhKQ9ckCqNLMx2Q
X-Proofpoint-ORIG-GUID: xZTpC7pEyo2_4SUmgAhKQ9ckCqNLMx2Q
X-Authority-Analysis: v=2.4 cv=CbQ4Irrl c=1 sm=1 tr=0 ts=6a9b86ed cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=TDjc9THpsqGe-NSjT6UA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAyOCBTYWx0ZWRfX2O/xMGl0a/ke
 WLUv+Y/3CYxGTnFr0ZNFobhi8bjK5SvAQygIxmU+ybIwe7ueUyUrYX2FN35vN0mKaAnmJaxg060
 uagV2Hv1vQawkIaRWFRvgMc94YUHxfs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAyOCBTYWx0ZWRfX3vq6aGNuFYR3
 oAYBbZAjuebpWIIVHo42emitkuoZTf7C4Q5NrUQa/tWVoFz7a6JTFqc3oYlECh52iQRaxA4A2C5
 Jjy4oHBv3LfyAfNwu7Nq2Y7bEpgvOVqHxLUlEPh7buOouTyPgmHo5jvo8PNamMnai3f9SHZRL0t
 XoAMSTmNfQ6odAi5v/PfXs/xl1JUnVY/m5ouJj3r2jwnO6UydQVvUedlQUZtwSE86qM89P5Hygx
 2ZG2zeAm6W6oZw7luG654Wy/d3wd5Ui5Y6O3kDQxXd1w1GkVSuLUiCBbSHP+uILvfC54tUwQKWH
 JifKVvQIH9r48KkH/IgWF+Y6WGfNr8r71vxnZdG/DwkvwLNI4J1I32/yG+hGOFMWnDzvYBYfFg+
 Jq2RX2MlBfapsosA04eLJNwuNK254v2IUHSncrXkzf/7QDG89UvxqeZAv362rMkEAEHevQ+deu3
 +zyznoFBQWvZqtJFFHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050028

All Qualcomm Hamoa-based devices uses PMIC5 Gen3 ADC connected to
thermistors for measuring temperature across the system.

Enable the Qualcomm PMIC Gen3 ADC, and it's associated ADC_TM auxiliary,
drivers to enable these use cases.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..08ff68643e21 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -800,6 +800,7 @@ CONFIG_TEGRA_BPMP_THERMAL=m
 CONFIG_GENERIC_ADC_THERMAL=m
 CONFIG_QCOM_TSENS=y
 CONFIG_QCOM_SPMI_ADC_TM5=m
+CONFIG_QCOM_SPMI_ADC_TM5_GEN3=m
 CONFIG_QCOM_SPMI_TEMP_ALARM=m
 CONFIG_QCOM_LMH=m
 CONFIG_UNIPHIER_THERMAL=y
@@ -1699,6 +1700,7 @@ CONFIG_MEDIATEK_MT6359_AUXADC=m
 CONFIG_MEDIATEK_MT6577_AUXADC=m
 CONFIG_QCOM_SPMI_VADC=m
 CONFIG_QCOM_SPMI_ADC5=m
+CONFIG_QCOM_SPMI_ADC5_GEN3=m
 CONFIG_ROCKCHIP_SARADC=m
 CONFIG_RZG2L_ADC=m
 CONFIG_RZT2H_ADC=m

-- 
2.55.0

