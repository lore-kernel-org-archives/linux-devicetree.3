Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5102344DAE
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328159; cv=none; b=iBParOzyGxzbUG08Mdl1/YS7DnrQP4myWF2TbU1FbKfLYEGplfe89kpXcmrnDqMgOFIwp13SZiDBMlpXvihhDXQVHOxkM0vRv1P3lQl0tddqVdckjAsDdWnuhda7bNFz3pvypUvXdA7ycDfub38K6q2mpZLQ1IL1u5WZQRtJG00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328159; c=relaxed/simple;
	bh=YtU2UMqzvzQG4ISRFsBdCCqeTm7onMpVEQu1DHRBhu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jpO+k8STSepo9EeAdHxZIajMgjX3/FmJ6LdCWwxLOFNgU+cOzFNPXy274GpwlXjkZesPSueXZmKMQSMxkDpRG6h6Osp7Jij1D7HIhMRbEGa9CkbOzW61M8CWk6g1bxrba9lEn+hYRFurCoaWG/rjTzZ42u3gqELk9jX+t/nA7Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l0acE7oW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hK1XNGfe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l0acE7oW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hK1XNGfe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OIT9tj3666179
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oNh0Aukfdy2
	d9exLWVEauhP81hz2On/FlnM4F0GZY0g=; b=l0acE7oWYo4R4FRFi2O8ZboU7fx
	0m8nhCzA8WTlR7v0jrPV2OYo8BZQmk3IQXHsO+Mo6H4F0EceVvIEIT+4yhv9DQMF
	P24xcFgc0/omYWsMVX+2fcyHb/zTWpul/LOo+KXSuFp1qDsrAOLunJEN1k9si88p
	m37mcMDdFpWGWAOzk3OojqER0oyj1JZdcNinabwDfB1oSQam7iHPxphNWKctasqS
	pCBSgrr1CI0i+VwNV3ZDThz6pNBEIXp9jvdJp8M66LVNItEj2uM8LylkdyRF+H2D
	5DcRJMWsFGfeSziUyHlyAH6Slq0dxzvfZxI2lA4YTl+PdvEFEUZvFnDRv2w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0mjbr54t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:18 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84245e2bb00so1295473b3a.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328157; x=1782932957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNh0Aukfdy2d9exLWVEauhP81hz2On/FlnM4F0GZY0g=;
        b=hK1XNGfe3VTfSjvj7OQgBecy+V82aUYsGAhlvVcvQRi5LQEE+l52CP356XaCNydQT5
         jGQZQbdEnxyEEJAOxksvVwsqaWHvjcnhD+4opDVIubQPGg7p+9AUEzpcgvtQ36Zi0P6K
         7duWSfke1F2fZOAkvshck6Fqp8q9qM4VWMucGa2FMGjVDsRbQjnweq/B1HFUzc1/l9bW
         jg7DStX0x7wqr/t0D84j/INnXWzq1tUKG2xshsWNETAgquPl/8HVnVQ0WaY1cLQ07tdb
         pbXusvCXFKrd2xMOUdn+EsozjJ5yHjDBDUkrRqZga3LmwVZ14jlYgAxfEQdXymfqnpOR
         BFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328157; x=1782932957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oNh0Aukfdy2d9exLWVEauhP81hz2On/FlnM4F0GZY0g=;
        b=XFNXz3pVP2cSo9Yj3aPO0Ppkty+MQfu1xCujVbBIALPebk0EsDKUscQyNCXs+8I7AI
         hTaOQAnwKAGdCKqrSu/UX3LZJjaQn6izSdEZcA4SXQWAlWrKsH54OXq2/KJfU/7hxiNf
         jTFk+BkJ9jCts0Tsyd44nwQVkixTp/2vWxgptujSzATCM35DNAFfbWzwTXs8GIuP68OV
         t0ok7vB+Tidg0Toxd1HKhy7ctUGBxzQV8j7XcVdSWWcTXAdbFxj3Sljp9+GQXCj4CJr1
         odxlU3t8BPr1/zFJ/dhB6p3Zn3dWOpZzfZp2m54xC/l3IgZxU3PaKqOCw2+C+7RAy8Ti
         TV6g==
X-Forwarded-Encrypted: i=1; AFNElJ/re4zttdPKtGFBpFzvC9zA5kg0b7p/ni0V2vQ8+q6vZhRkl4tdT7J+IAARz20Igc3yv9jpgxlNl5fF@vger.kernel.org
X-Gm-Message-State: AOJu0YxyF/vVuyUCXQjj9G0Uu4krIymGbPeo9wy+oPz1HvlrtC/Ov3Dg
	Te5Lb8jZ9a5JeDM7iJK/M0char+o5IvfLKGPBYUUez7Ds+H4WWPsOHPWtafxOJM1h8Y0e6stCTr
	ptEpyYuXzi/wCpIxAJM1XS26Aq0alG4Kz8NN7mUp/HQna+EHvYxVSBHFq0RlrWSe3
X-Gm-Gg: AfdE7cmkdj3m/Dk1Rbm/ig6ZtIrPaF2E/AE/FXCJJnFD1JTVvlgozUyytJbUOdA0PA3
	zbE/48Ma+fs7XQSQHhUBoNibWHraNaT3FZC8RPDUOsCc68VaXDGGOVe9k2M7Ni6Z8RdDCzytnww
	0axqaNzW8tRdPT82SuBO0A+f5vcmZgtsxppHYSJsfkUXwIu1xLgrxgluiT1crAAHmoVsXeStQ25
	8R6p1Dw6AY9g/vbkq+MejoHKxU1UleX4Ba3o4ML9N1EPqcw5wMxuxD2saLfy2cvCfcV4uXu36YL
	xejiPDFiz8QIqi5MZAUh2dAtzQGR/T9CHlEHQ1wtEvWTDfHTg5xR/cNnkB1wHQDgulSJLnmJwqg
	pj9YSmgLcr7ryBudpd4Vc/8LHdGNZPjErDQAWXw==
X-Received: by 2002:a05:6a00:2d19:b0:845:4f2a:16c8 with SMTP id d2e1a72fcca58-845a2a97d8bmr6042742b3a.11.1782328157350;
        Wed, 24 Jun 2026 12:09:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d19:b0:845:4f2a:16c8 with SMTP id d2e1a72fcca58-845a2a97d8bmr6042700b3a.11.1782328156786;
        Wed, 24 Jun 2026 12:09:16 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:16 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 09/19] arm64: dts: qcom: qcs8300: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:20 +0530
Message-ID: <20260624190830.3131112-10-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX8INCYRhhi1uz
 ptqoPd7Tz4AobAT1pZ/UYnSBUJW6om7z5RHh80LwDr2Cn9xTqz7quatlDB7kOjzSlZBvwAuWrAl
 +6RVqrqFjTlpl+DFWrCpkjHAr98t7To=
X-Proofpoint-ORIG-GUID: CfNGQ8FGn7URX7nX3okPCJ97hGm8QkC2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX4dyTnA66SBqz
 EG/L80/fDGDHB4W39goikTnl+BsPM0weHR11FeFlTQWAuUmAVlHZHLFRbCYqNDphkA50i0Nd5UU
 JSgwkKrJih7HkAgU7Sa2MqbKjUsHYprTUaa3qloC1wn4Vr+ME3b+Ii7RRzCRd5AngoTimaqIdgr
 RsvodiRQBam6D4pTZygXI1E4ZXRiPgruW6XrnsFt/OpgUbZffMmj8YQ7etxuP0a8gRirrepm1st
 PJxAKm8Cj/ky+ADCcvuSpGztDn9Hn4/fMNGR4aZrsf4kaqm1DsaVI/MqPsj3SHNqWdmjdA+3Mub
 dno5VeomZwJkpF1hqXNY4QksQuwm4uLy8hW1PIfXqXbCc70O6xS1kAhcASiSHG4GnBQoLt1gQQ9
 pqqF874SBwCgztOPHT6Hy/0B6FPvs2ZTngSMyY0yUmqAH6k7lSxIMoFyUVvsaK41YE6mrlVKQlG
 ovc0A33a27OxSDZxIMQ==
X-Proofpoint-GUID: CfNGQ8FGn7URX7nX3okPCJ97hGm8QkC2
X-Authority-Analysis: v=2.4 cv=TcSmcxQh c=1 sm=1 tr=0 ts=6a3c2b5e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=5sFproqCb5TrlsysifkA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240160

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index e4c8466f941b..a05b8d28bdb8 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -634,6 +634,7 @@ firmware {
 		scm: scm {
 			compatible = "qcom,scm-qcs8300", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -7154,6 +7155,10 @@ sram: sram@146d8000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-reloc@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0

