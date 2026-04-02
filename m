Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3407427A476
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 02:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775097096; cv=none; b=RneG0yd69J5Tqzp6XOw/QuSiOSioSuK2QMC8/gj3Vca1fihS/3+NTD8h7c1Y4YeoMmyBOVSieA3x362+7+RwpzlTnDuWMFIi9hTf6QX8LZ/naXzz6ORJpHFoqwfCiQh/3nj5Mm/vDZKT33uLcDCVfNYme1RHgltesiMKx5Gt/mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775097096; c=relaxed/simple;
	bh=2a/odLExI0OX80jkw/umt5Cp4KnKvx6Mjd4FhZAIDFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j+hsOwTLYjiWPhhveNwTU+123BATaO7T8jy8+f9LHrHPgBm+o/B023h+QixlkBCgbpNG3prchTxxtg5C8pOePIgaNpdHKL+Nd1KZtVqVJOk0Vb2kaOuFXC9rZ8aTidPG+N5Mt9T+cGCcnKebygk1uG6PKWoE2dWy6SQCPNkA+c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K5gU7t3V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXSjWoC2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K5gU7t3V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HXSjWoC2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4Ff01424683
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 02:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ZEutISPWtTLB6mtNal6uCEIF9hJY82tKMXDVy0zaJk=; b=K5gU7t3V/x0SGVh2
	4njS18c+9bAZC7Wa/m7tW0rpbRj2PALXbI/qcRh17zNagsfWZUBm63huahCJd+4k
	iaLPqzjqCYAJm/6pmr5Xsv2OkvnLFJFxvFDY4giQEeFDCShOkzSf2zaOp00YAGWS
	L8y/xHbJtRDJLiRk6yC4jkyiod6+7mwj5y20Eag511cz/1webOsAYCE1xSeUyi1X
	z16usAfIleUhpvAeSpDaP3YF8fhXlSHGGdnCLN+c1hkM/bfedJKq+nWtdNrA3wib
	u7hmEVcBw8W6gbLyhuJm+1pJ7/Hx+322lra6fNjuiEEygb4wko+6dlSKfepvntGe
	aZpuyA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9511afy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 02:31:34 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-67c30448569so1127072eaf.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 19:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775097093; x=1775701893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZEutISPWtTLB6mtNal6uCEIF9hJY82tKMXDVy0zaJk=;
        b=HXSjWoC2Bks/wIGIBYj7AFVXQ8r7ryfMu9MY1Z7cBPh9YOT2IEPXfoTzc6lFMxYQgq
         rXYZeQAGNymFErHA1V3f/e+zI6pdwedWr0PZCJ4EeWVDzco8ST3BppYWWDgJidhxdE71
         Q99XxJGx4uAbl5ITpkyMo8yWg+io/hUfpVES96gyLkV7dgtuEMiHiqo59HDlkQHQFU70
         j97feelwu/O0kqYs439cHF+CLv0gP1T+SDf3uM+5Z/0PuB6x8CcRSEhSEE+bQGwcw8VD
         3OjXDwU/gSOFnEiMnsoJgnyt45X4oR4PeSfuRl2iZbVaVY/COk3HhOms15T/tzyOQEKi
         KeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775097093; x=1775701893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ZEutISPWtTLB6mtNal6uCEIF9hJY82tKMXDVy0zaJk=;
        b=IO0n+yQSVxiN9zVn3WOcnHMQ5f6diInlCigsmrdbm5fhBL9g4U3S5P7pKdU8HkE1KM
         TLyXDnyq2aMiODLG7MbGrpSF23w2/hQ2g5plbplMuhD4GG9DLF18MrO/vazozcsAuS+S
         LjPFShHplcEQ88fpFiAW4x9JuHk7br5dk1DW/7Ge9uyMunx96Dk2gGeL/S3/PyFa0/+G
         HNngqGK1cM8/8AAxGSPzToZJtKzLg/qg5ebsZU84p2sgIJGJ5IYjLeoP23sXYNoaCahn
         Xiicp+FvXG2fTj83/Lx6oNhrTmJOy9rFVYX5dnLdTeXVdfLbXSc6sFx656AXW6dhnDpO
         PCLA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ50q2qsOqR4rfFjUiIfhLOFRQEbe2IJvMGeRoD/BobudeRtMclYUOHdqKEQHORrtoa86m6auZ/yUZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq6kzScZlUwph+PXCwjXtnne7aeloDW4/+cRsou4cAnqUDbPBC
	1/lU1QJzSJgbgNLbEFtkXLyptNnXoKM14fOf5CUrHrF5y2cA0rNXCT9u7O/YsBt65X6BqU+l7T8
	Uy6jvs2IT4diY1wF33Fw6Iu1/VTRQSunDBRy5Z44hMiEEU0vvoWmwKU2tUG5RQxC5
X-Gm-Gg: ATEYQzzmmRMV9KAeFGUTcWREHqfRUtJCk3MeTUsRpYLRqehBQY7o5c/91r4v1tAIeJ0
	RIAebz9239xixbxQk+QN6W7313ApFuZt/2S1zC/qg768qFlJTLDQ6O4u0/igw2dpLZB5du5D4Xo
	9wiNdkEICcADt2faiIBF/V1zfDfBdVdz5oXtXvI8rj3jz82KJXmuRac+XqNu5tmEvn4RUKyAf5a
	z0CNMsp0OHfY4IM8qNqVgcgxlaFR+Mmzexx8DX6O/ITn1FkYe4lfCgv+siC+CLnGpRZQ4OJYaqU
	XPDnHQJeMhb6EyaPbzjpIcU4BQfF0JonKDiSJpcSXIfk+y0A0+8umapTO5LUcBUbyW0Cd1OLgkV
	FsNJBnw6hV/5N9Cq40HjkxlfQxfb5KFoTpFB4th+r7FE=
X-Received: by 2002:a05:6820:a08:b0:67e:16b4:aa1b with SMTP id 006d021491bc7-67fabcd965fmr3002337eaf.53.1775097093496;
        Wed, 01 Apr 2026 19:31:33 -0700 (PDT)
X-Received: by 2002:a05:6820:a08:b0:67e:16b4:aa1b with SMTP id 006d021491bc7-67fabcd965fmr3002327eaf.53.1775097093059;
        Wed, 01 Apr 2026 19:31:33 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-680a63c7fd1sm990215eaf.8.2026.04.01.19.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:31:32 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 21:31:25 -0500
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Document the Lenovo
 IdeaCentre Mini X
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-ideacentre-v2-1-5745fe2c764e@oss.qualcomm.com>
References: <20260401-ideacentre-v2-0-5745fe2c764e@oss.qualcomm.com>
In-Reply-To: <20260401-ideacentre-v2-0-5745fe2c764e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=2a/odLExI0OX80jkw/umt5Cp4KnKvx6Mjd4FhZAIDFs=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpzdUCtaDErh1lAt/kOEShR5fUxyJa8qBiZtMqf
 M3EkZOU8K+JAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCac3VAhUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXmGBAA2J/kI+gf1o7m2FNjWXZVq+U3qkyK3AFwas18MEG
 8E2IB97qmm7MIZTZoauYPpaZ95fYZ0A5u/pQKUw1oKWxVB2J/gNFBIRrghJov7DLGJRPL2RxAcu
 5R4CGvlnl25guQNiTtjzj+kYNDRSm5NhCBLszjCjOMb7OSQzUrrgiJ9tbA/dKVzsBTxaKsJxU70
 rmeqjhCzIsOsqH009r0mrGwXNe4MIK/NukdumfVH73Je1CYBF9A4x0qLySapNZOc3+i875Po2lD
 AQN4FkR3UMDnL77oSLFxtMolOIrT9lokYF/7IobSfxfze6pEKPsyYNTw9JVHHgsPrWP5AIbH1uV
 /CHZEHYFZ3zKwn75RkCNjCBlPMq1vxsmx8ig6F8Qu1uaTbeWUfY1oUYsSdx7ha7xB0z1EQjDBse
 vL+mXtHz07xS/6wB1OIZMJsqVg0XtfXDqjUsmPiIzNDEaOHOCFU6Atyyq1hRJ3eVC9AmOkkzmtQ
 sT8E3LXFaFAuUWN6jXNJ/B983+sbkLDxHhww58gyiwafPcFs2hL5915bMCz1Q+xgAQQDT5jZbov
 mQnP/rDg/9fRlKT7qm8fAE+78jZemnEm9coPf6nVgLa7UJtDPeYgdYO+ZWMsuyVim52CswLHBVc
 sxP7NiLnIHtRuu0P7PpJlDr570SINydW8YjVZRS8X/e4=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAyMiBTYWx0ZWRfXymH4NTc+2FVV
 qit6lbG1SWQIQqX31pff4lbndA1/BLWaQjEr8TdXcCA5WVTnTMxkHdR/tB3thPFbjuOVnOPVTWf
 vM+Lwzct7M4EzjyfYTS0gUtw0AiYB3iZeHFMxtQ/9oDParUH7ONPAptdtFCbdC7A0Ixj+tyLwYo
 M6ZWPAgn4HuYnzDFwwVNxmxhWTRLzl8fi503z2hjZrQc7d8Bc2a4dU1CVdtksamVdRK6I0xJ/V9
 e2QSPft9tThcql9UNxxtHgjrt+ZlmWnusLBHSPRe3NPOINAqYeAOv+t/Cf48iSS5tTV/QH9InT2
 CVj/mVxvK1uubvUiAnjgeewOt/WqJ7UC9uHqHCwIBcxnvcq/h/0InbRqn9tUgXOKVz6U7IftcYZ
 vr3DZL1AT0W1Y+3u+zJr3nu3J9g+Zhq/SkgQiTm7DcLygZ3GRScjI10vNHj+lCH9n4a1XoytExR
 3JLGk/g0o78bzbV8QEA==
X-Proofpoint-GUID: _GA63F8IHY-2BgB7ErRaaiBxbaGLoCau
X-Proofpoint-ORIG-GUID: _GA63F8IHY-2BgB7ErRaaiBxbaGLoCau
X-Authority-Analysis: v=2.4 cv=F8pat6hN c=1 sm=1 tr=0 ts=69cdd506 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=WzdHeGATqTO1y9J2u-kA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_05,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020022

The Lenovo IdeaCentre Mini X (Snapdragon) Desktop is a Hamoa-based
ultracompact desktop PC. It provides HDMI, DisplayPort, USB Type-C
display outputs, 5 additional USB ports, Ethernet, dual NVME slots,
headphone jack, WiFi, and Bluetooth.

Document the compatible for this device.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 8c5fdd320cfcf723b982cf10d886018dbabeb6c3..a7d212d75bff8ff9ccc680ca61ec9a97a091a81f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1148,6 +1148,7 @@ properties:
               - dell,xps13-9345
               - hp,elitebook-ultra-g1q
               - hp,omnibook-x14
+              - lenovo,ideacentre-mini-01q8x10
               - lenovo,yoga-slim7x
               - microsoft,romulus13
               - microsoft,romulus15

-- 
2.51.0

