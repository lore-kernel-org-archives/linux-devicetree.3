Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9324A3612F6
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153964; cv=none; b=cV7KJDIgcnpZv1u9FLE8U/pRZhTTDaTjztHTtZDiqv1Lwkh/YEq0zSW54uQMsCstJPKD/mSd767KRti7iRGFmm9di8YvVDShEy/QxDsJ9br3MY1dDLTJvXLTXSJMnoKpnK8WVwcXCBBZyL+knznw7CyTvKtu2mR88IbL5TChNvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153964; c=relaxed/simple;
	bh=SnFemOqaJpb3Bo96e1V7TzNicDBNZ9REneIaHNVBH9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bdq63BkHi13vVxTQz126Pz7VrHLY74eAbGNwekb4+t5Z4NuDGFKLneXti9GThxe6jdVQkA9e4rwk3uT9ldQzMvjREJTRswtuuLhXiJ4SXyPXaOtZkWCdijNz52eDspOlxhn3tDikDuFPX3GCAK/SeqV5XUGus0gSy0zneuHRNuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RNOLVVL5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXgcVzJ7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RNOLVVL5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXgcVzJ7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NXbK3202802
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdqOy8M151/0bGRhRV2QiiKDAnKhEQ31U3u1FbotUOY=; b=RNOLVVL5zKrqtDXm
	GPIsl9rjZyvp2XaY6k+Q3Z7T5+k4doNFVwaqZTTpktLLpN5WApl56wqpmcu0Nonz
	uuvSZLPpg4taOtendeIEmfg/Zv9Sx6x/Cu4Z4qmTjBMwX+fn5gS0UltOwnjxe2/d
	cpHx4SvPIKNXPOaBC1d9dQTXwyOgvQL4+iSnHOyjUvUJSFhaAdQuZL3ZQ7nQaXLQ
	vYG5BJ1oYcToE8nmyyQl6/2QIy12Udya2LsW2VTzmNqMKMXbbymXoKnw8/su31e4
	GyZamIdp6oek+fWeGDnRfgQxCjKxcuVnVKX4UsgoK6py6o4N4KuWT61c26WI8YCz
	+GNohg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6thp8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf1845bddfso86071475ad.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153950; x=1781758750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdqOy8M151/0bGRhRV2QiiKDAnKhEQ31U3u1FbotUOY=;
        b=MXgcVzJ7OSGk8GFIcsF2nx2giWcSMRp4kDWYqfxIPXCeD/uJFZZFVlyyOXJiSzw/+l
         RHxxVA7gvOVSTB/SK9CVt3XUhDItZm/E536Tl/fV1EFXlkau3n7iFzMVS9ktoaPYvgPn
         l9pR2ghzY8kd8sgw2ae1e0wfcZxVVOZzMfjHl4ybUMbipLWO9zM0iOxbNkrD9ysVCbp2
         p7ZMDj1yvSGQwqy+FDhddRCqCe+qOlHYtw49EfJiVrvUpbzKSW913Q5vGGzxeEKSxFyR
         CcoWnb8V9zMFN1OhU9LxR3W914lvEouGFW5+MrUc2cVy0s9nSwKhQv5gExUYxXLuFlbI
         Augw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153950; x=1781758750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fdqOy8M151/0bGRhRV2QiiKDAnKhEQ31U3u1FbotUOY=;
        b=sLihBvH2WVZeyPDzYrJzYWsQvxkyieiM37l5XvlVXfcWIwDhesmg6c1GZlsh/QbpUM
         bu3xDTOVlB/Q23C5nLgYCRJNDpnnz8VpwJ11ShJt554V3P1E41wrGcNeuZLgNn1jS1rJ
         TXT2yJAss3CGJNP4O7GWzKOdmpPRsxAtJcNDdp596t8ZloZhdWsd/KCsDhZys2aE/6pK
         2Nj8sIy3sq2UoZ/lLorHDG6jSuO9Fp1G2MpN8eG7l/WaMeHsHiPWJFjZgel1KClGe1D+
         lkwIqpZdPqtK+AHKMC1mdJYDpKL65LXTeZe9y1X4ibvled743KuaoxUC3sY0czqKWXSy
         ECZg==
X-Forwarded-Encrypted: i=1; AFNElJ8JAGOwP5AYPlX97Q8bHrV2VhlLRGAXwKAwVFHBfAd2Xt2MG6D7hdY0TJ0A2N54atEuBfvCjSnzARjf@vger.kernel.org
X-Gm-Message-State: AOJu0YwLbpVsvGMYNHE/IimWJRcZK8nTDqOjkIa+ILYTusaNfx1lNKk5
	0I6dTjHbc6JCnyqEuIgfPN5R1RoAy2azE8trcpPxVlO/5ARNnim7UjEZPnhTUuqbCGzgIjnWqJF
	2ba515+QRQZRlbcCzNQa6lehcXZt5D7JcnfSHK3tKEgV8CAS+s5wZmvWQTtEP8PaB
X-Gm-Gg: Acq92OGv5McjtGqjpgRMLZjvYW/Ye6fw0bTFmJenRLznG8Bu39pnv6Jx9u1QOQ/nHwH
	3IgX/e1TC4RjMjuNcW2nZbori7DKIF04l9A0VJU9UKj7T1VOjbyfSalcXPtpg7UoNs/74eIvOYm
	5mypTgn0d4IhgPGWtyCAHt7Ah6wkeL5B4lCBoNWjjEFX81nTPOdkZFRaQTzT3z/ULQL2llVBz+B
	AH5igaU5aDqhW+KT1mpdGsHrbP4JE+3Bq6IUPUO/9cSwYZ0bhvH6v739WyM4njPRWzAz/gEfOj6
	aVMTkEV0zfIgEcJc+wQlNTvEofTBMNEy5u9HOo9FjRWRjsiS35bNHEEJqgSNYnnrF+27yJHcpjx
	4XVJ34SFvT949NP4b1P0ICtwXM0NlK8dF4dThCeBrAGgqtT5SIR9tufIw8JNEgpO9nYw=
X-Received: by 2002:a17:902:d48f:b0:2b0:6a22:5165 with SMTP id d9443c01a7336-2c2f005ce41mr14244175ad.7.1781153949992;
        Wed, 10 Jun 2026 21:59:09 -0700 (PDT)
X-Received: by 2002:a17:902:d48f:b0:2b0:6a22:5165 with SMTP id d9443c01a7336-2c2f005ce41mr14243655ad.7.1781153949523;
        Wed, 10 Jun 2026 21:59:09 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:09 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:40 +0530
Subject: [PATCH v2 04/37] arm64: dts: qcom: sc8180x: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-4-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=1599;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=SnFemOqaJpb3Bo96e1V7TzNicDBNZ9REneIaHNVBH9o=;
 b=wr8KSF+6WKoLup1Xs4HpB+xZE/59CMXS2us85n/Jtt8brlMxTeoGU6nXkwO9Y3+SHcKrTK3wL
 tESJUDF9+rwBdvRhrBsk7tjsuNi98Luwbx7X+WK1N3ctfytIi+/WhW5
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX88IRXhcd9L+Q
 PnchvTT+4xOxvskftNtwqJwcji/pZSEgiagMXgUtNtSCvgx8jOVXo9nJcNSHpdGQDtHA2zXi2cB
 DcWM6s8VQQEh0TO98CwvR6F6zhvc0IqRBUkIRANT4FOYBNbmuHIoIx0hAF4gVao0CA06DVJpvNy
 pksR+J56n/vWhP4L0AmorBzvw22lykUiRwt5dpmUH6A9kvJpBBPeShT8bNLCDFuw5G9cKWwCo5Q
 FJ7XD7gN58sOqiJGn4r3YS1xsRmjz4uco7KzPxIe5S2L00dsABy4dKk+Ss/x9oyjkEiIj51HAv0
 5eSI7S7j5GLWu1I+NhRv6xYB7x3DqAcEMR+/LkpjOPpKJV9Ppe3Jef1TkjWWwAmzHH0ux9ciYpE
 ZJVomES0KUaReqhsPmkN+cRwqCh9B/OwyN+NW3zvg6R9Odd7ws/sKYtqzhLCjn5qpoKQTUKTdX2
 +Ct0wtPesib6U4jRNSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX3OnLK8uaVeHN
 Rylqze6VDaD21XxTFZk0Ls2WLvy9uFVaQExGyfA2B5mcOdnuHoTzfuKmZVmil+i48IFVWC8cIAn
 06v8sNVje4MRAOepQUqMPmJxmoNg5S4=
X-Authority-Analysis: v=2.4 cv=AaiB2XXG c=1 sm=1 tr=0 ts=6a2a409e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: QmPB9c_QJxFDohwNHdWvFdEhw9xSrelU
X-Proofpoint-GUID: QmPB9c_QJxFDohwNHdWvFdEhw9xSrelU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 2 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index d86a31ddede2..44bf3db01d3a 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -458,7 +458,7 @@ &mdss_edp_out {
 
 &pcie3 {
 	perst-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 180 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 180 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&pcie3_default_state>;
 	pinctrl-names = "default";
 
diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index aff398390eba..a4644ecca536 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -559,7 +559,7 @@ &mdss_edp_out {
 
 &pcie1 {
 	perst-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 177 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_default_state>;
 

-- 
2.34.1

