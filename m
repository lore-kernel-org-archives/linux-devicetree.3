Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B980B49362E
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047021; cv=none; b=oXxPyYeWBQjNmwqVS0On8N5gHnd5IruDt0Z66Y7Ve9/dmXjZOuZaodCd8AVJqXOuQ7gsEWWqm9JNym5yenfvxoaeCDuISuATY8+sB+LdDSRh5gbgAZUMZPk00S54bFIe9DzEf7vuvRX1XVDdFm9LfJS+Ik1tjUYyyEfgpIWPimo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047021; c=relaxed/simple;
	bh=92+EwqA/U+DoQXSDLJUSUPw1xZv+ShSp8XLecD6zuv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fg+kV68bRf+I6Oen9DZ2KKE/eMZzrUFHNPbdTOZRm3hcByivb998ul0JWyzsqDK5ZmHk2ng9QGerltI20KTrCInaOotTNHj1ZiWImQCtIT73o463xRMccJomJ7O359MxQW4nlrjR7VJBvkmCa8SlsdTv1BRpx3uIx1GMZvvbdSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EmhjQEIa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gDymK4lB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EmhjQEIa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gDymK4lB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7rKN1087169
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PTuelNOQDOg0Lx+/+7JwWjc6pK3NDtRpCS70MSLolvg=; b=EmhjQEIaiQd3aj5n
	0Wie+Bmxw42oF7H4ZJeXNvyHx1zN994F6cTCMWYXQs8ZF8o1I3LcdRUmBEV+NpEc
	KvkIu2KRDCwZz3v+DpPMXK1X12enpviiT4PSvApzD57D0unGhOKK9ISfiCYNlIle
	UpEFJ0FEqBZ6CriY8nwTWobyzwPIVUIDbE35BxXm0Npgc2hdgi3rHWCk1qgyaoKf
	DCq6E9tYMdVhLgzLJjGXC4qKfzAQAYSCknm22JkkAZwTE3h+mU1CiG9u3UoK+v6f
	5sNukMNIWavgToWWsVnyUwkF1wGHynxdcuK4WsaccYOje4ozeb8HFiCRGS6UHATm
	32DDog==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg43fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:18 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f36427abfdso9597579a34.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047018; x=1789651818; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTuelNOQDOg0Lx+/+7JwWjc6pK3NDtRpCS70MSLolvg=;
        b=gDymK4lBdvO9jF2rM4p8ahAYImjHxcbny3XyoH1nq3t6IYnCEHyWfm/wS22njcK9vz
         FCnTXIF6JxogQgTrIJqGgiKlLySiTbFyGEKoeD56+urmQnITtwiLv/dIH6K0YXnzHNUQ
         bhEZdt7nHrPtTjY10tOh1HaQNHZuwwHfRhRrujX8PM1AmiewHXsEMuKcG0XbsFcH59vC
         XqY5YbuFxa9Eo3OxBni1FbEkFF3YbUImlPvLALoEuYRgJxyLN7bhopqHPpHJynTegBIn
         E3xsJDvQ8jeBVKQfhG0ZclGECFExfRRer/tpCRwfNqbHd6EH/QX7fBgQz3OOvkX1xBqF
         pfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047018; x=1789651818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PTuelNOQDOg0Lx+/+7JwWjc6pK3NDtRpCS70MSLolvg=;
        b=g7hoQdk9PqcnkBulsF+IFxr1bYHNjMVu0c92NDWTkA14mcgxlOf5vsAwg+fOuQ3pYS
         IJ81EHjfeoHEzJcIk8b5baLB7/wTmNCFYs6+xdn8OXLS01KY3HtNr+TDy7PdE+d3RnTI
         8+qW9w9FRJ4paJKi/HZF2LBbVYcfbBd7JewYEqCMqGTQoiSZ0Q3j7bOUBw6T5+mcGpps
         LvtxdkWpwZlYUQmt0CGu3DQVZV5SAYgAhfT06DxyrqQabkYXStP7XGUSyCC/vdskP3ri
         v1TBMs1+r89HZSOj9gm+zaO+eYbfHqqU9UfcW14osm+SrnHhuwob8PsXEc3aE+jZoqU5
         +BqA==
X-Forwarded-Encrypted: i=1; AKwUvBztyLDBT5bQZTQTgfgX0ACC2wHSl+iJdlJE/eUrdX1vxFqnwnHGDEkqTYYM51CfFw36kNbr0LRJf9uf@vger.kernel.org
X-Gm-Message-State: AFuF++lt/rZnn/F4OSx7Baonwj3Sn5vZIG55zF5pd792tIrrHFE7suhq
	E2SOQG+MZDv6ibYdmXtV/Uo56jnfmpC/ylDQdjfHUGK1zl7F44i+ViyvHzDCDbGh6K5XofMqao4
	gMMUoQLKywvlbrpf/1ALIbmlGZReNTgpkmk7L1sKfPFjCS9fMIOj0ySvIqH39tg7c
X-Gm-Gg: AYBFou1DA6OciKkJmxpxIZkZnvIvMNDSwSGu87FKhC8DBHo+Ox00CNS8AyC5tnE6hYa
	ntOGWYp3kBoQ2BeJb0gNGGCPtw1HsIXWJDkehPWZzTxMCwzNkK5JpbsjeNQ2FxeMW3A6ppJGouj
	fNe4boVbQ4tWsD+wRyMGbckmRQ0kvddkGNg9V6taweGY556h3F/wOX3rfpgymTVw8VepdMCRR13
	dgzDdUUlkpvBztpiFMf4SMyM7e6ZgbuElDm8ViG69f83RvThM5StrhTyDjiNwglxOpqmXSQCfB3
	s2Hb9v9BtjpV/5K0p6LR6HHVTfbDZvMY5xzuynMTPFXQsU5Wr7HqqXfDB5R7oQWk1NPPmA5f2UD
	RfiOEcxiI/jST5zzTQrs1eckObnM/uG0FuRo=
X-Received: by 2002:a05:6820:168f:b0:6b6:71f7:ecac with SMTP id 006d021491bc7-6b6fe0b857fmr24917003eaf.32.1789047017992;
        Thu, 10 Sep 2026 06:30:17 -0700 (PDT)
X-Received: by 2002:a05:6820:168f:b0:6b6:71f7:ecac with SMTP id 006d021491bc7-6b6fe0b857fmr24916898eaf.32.1789047016859;
        Thu, 10 Sep 2026 06:30:16 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:16 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:05 +0530
Subject: [PATCH 16/34] arm64: dts: qcom: lemans: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-16-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=2052;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=92+EwqA/U+DoQXSDLJUSUPw1xZv+ShSp8XLecD6zuv0=;
 b=rquWEd5bKu5+Edtehj0m2ryi9gV8ypkPYuuLojnoS3XfFxl5fYvaYuSrtlBMgiua3FOZWIHgl
 4bq46BbnVRTCQFd5p73iU2Z7OOxcTXb1e7oJQ7/HcjLonyUSZiBlVsi
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=Vu62kO2n c=1 sm=1 tr=0 ts=6aa2b0ea cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: G0vU6VdWb_cy0m2Opb_cssBNlDoJzM-h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MCBTYWx0ZWRfXyNgSBQ1HLkWz
 FEqCUVAJLnI0UW+Fj1TEYim34SZVSR2k+/PpE58nklJfpyitzGMbDSiP7gzB3jfjs+ZdnnSP8P8
 uYgm8AuEV+L9jRTVskZYPg0oX1Y6ZTWURcPLF6Ld3L8lH8eX+3N8578K4/Jk20euGfyLr8zA5g9
 GuXCjFiYVLOl59xeG9S+e2ftnjgSBz2H8WuA6yhJ8t0Y5ObcsfZOkPg2UuyCH89r54EQL9CrFHY
 udQTVYEo0iJr3F7JFRv1dETkSslSfdlsNY6zLLJ2Y49Ir19EfWA8xR8NqmL2eGPddfbUeLgmbFC
 xMHWlrma+00feFsUTh96D5ZAcBQ1Dw2kovj5nPT/oPAKmor06cM4WDS8DiGXSy2EIAQdlJBiktV
 WyDIXtce7Z6ErrGmD0sdZPLUz2Fmn5776Zt5CtlHzMTQipBoID3lQ+xUKkH4ktwXe0eJRkZK1Nx
 bNyZHiwDUx/uzBzuq9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MCBTYWx0ZWRfX2ggR/X8f6DbZ
 kqV9UDNll6eP88Ne5fSNP3/taImoclnHIoFTsgl0iqG+2yWFX7pzZ50Wjt3dtgyQ+olSVdT4ZM6
 Y3wbqJHZ7ic1vs3IeydvbDyz7k8ZYE8=
X-Proofpoint-ORIG-GUID: G0vU6VdWb_cy0m2Opb_cssBNlDoJzM-h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100160

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 4 ++--
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index a45485b54a5b..194e114a12a0 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -840,7 +840,7 @@ &mdss0_dp1_phy {
 
 &pcie0 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -857,7 +857,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 144f117ba511..3ecf3d464dd7 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -962,7 +962,7 @@ wake-pins {
 
 &pcie0 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
@@ -972,7 +972,7 @@ &pcie0 {
 
 &pcie1 {
 	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1

