Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E35041A937
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692767; cv=none; b=urNjNVBYBG+YvUIMOoPmuj4+zSlfM8NfY6cMlH5ppFZ6X3E27l/kwqZjDEXWk6Ogl58G5SUwp7dB9xwCkUNn8gqw1plI0dO2VkxY/YLwL9Ex7CJ6d2630fk5oMXdny2+pmzY7MstWaxcUarLTIuwBSgBJewuUpB9lbioXJB/oVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692767; c=relaxed/simple;
	bh=YcUBetlcsSXeTFWwHSGREMaHV5BuwRS6tuHjLEZyQ0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D8CNtv6uMmRiwWC23zNzhrw4n7wSYtUyjB8o6Dz/FJ9SD6WTzKl796IPCMZEEL9wNAMZ2kJdBk5/JG7JssADtEHJpLio2SNRNMtiMWucOONOQUEW3AImrOfiiMZCKsGiPtn+loD6esed7w1UzQxhpXaBTkqvQjggSC5DPk2l65o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lnISA80p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ceCaKSnE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lnISA80p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ceCaKSnE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4Qe9b3614517
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lEdztFo2bCdgvgq+SmdX/lBDeTodlOJ5UoO+aB0wLTE=; b=lnISA80pp0MtFeSl
	U3EVZCDo3EyOfVDx+/TsveQ+mF0Y80K29xOXOoWi1R5pdsmvKV4nWFDlMdiAPt4E
	GMt8xvH/Q0S3H65lQSunJmrYJRwxhsktGq1WjVY65fbpS3u3xShbRsjdzi1fg0Ms
	bShujkqlCcPu39FC0AhkncONkQw7VNMeuegIvYDp5Z1CUXh/c85OEs4O3FK1E/YA
	llm4S3UPMlKy7CrbyPw4RE0GXSv10BffY/lQc9pgYzxnQCrZPPG51DIN/PB0u1pz
	LaYeHglputGmjijYFnQsjyMiblKDbZVOtqFhF19RwOyHVlKC0HdIjvY2/8oEggSf
	Nt6I5g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1hgy32nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:32:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee894b3d8so13322755ad.2
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 00:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692756; x=1787297556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lEdztFo2bCdgvgq+SmdX/lBDeTodlOJ5UoO+aB0wLTE=;
        b=ceCaKSnEttv/XlCPurC5I+bAMghWymXVtTTKd/L8XNmYE/ndGpmnCu9liQgclQlbvr
         BkoRgsSmMr5kW+8gIyujlW5k83GCQ4ppKI3KrthoHgm4lgbsRTfUGAiVI755ssHv2+Gv
         Zm5NBFuXy7T30rowT6hQsWEO4uIwvdvB9OyikdctgxGw9lncP1To/ab217B9NqpkUGQZ
         xLKDFRx7zRjin20Plh7lwIIkHbzPiVMxlQeXV2zFg65sLJWUSam04aTrafQSGONNBs1Z
         k7oICbRujASh4ODnWOER+ZDGj2fe1prtSP26mDq3fHPAlIM1CG+1kxENN7yar11nfv6w
         qZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692756; x=1787297556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lEdztFo2bCdgvgq+SmdX/lBDeTodlOJ5UoO+aB0wLTE=;
        b=JJBw8VWN7bZ+lB/pik553Kbgucvjq7jW17oRq3nOMCeEkJ5e7tihjlnUoE7ilcr0mH
         aq6ZzsP09J7XGaDDdet7ibh37jqrwdypov+oD9r6OkmPmaX1JmNN22Tdvnu+gKUdiv/p
         RHl6TX9Blq24GN4oIt1dJ0PNYiQpaciy1ZNBKRKWwC9h9P7PI71GupLzP54pwumhFrTX
         a1VaQhQgxuEJxu77b77KWGgofZp9u9wRRQT7fmhmTzUGvBRMWO0ptM1FCF32F3np30Od
         p/nLrlRRoDkRKuL2lXn2qFh1ufZS3Mr/+Z7052mJ5j7pOWkD3s6LbdTodkiGlzetDug2
         ufAw==
X-Forwarded-Encrypted: i=1; AHgh+RrqGKCvtRXFpW0Y1CbA4kbQhik1DegmRuYSpKaYMAwD0WMWdPOIZYL4PtpEP0qQl72iOHKQQnqNBv/K@vger.kernel.org
X-Gm-Message-State: AOJu0YzEifL2VRW7L8413xgtCTF7smTx9DdOtivIcBzw8Fp8T4GFce/6
	w/R736X1+pu5NDueGnpuVcvTg4RMzLhGTUKj4wQOGwZqDx2HtQd+OF7ippTIs9zwQOysJ+VvUXK
	kpgflI5ePgtALE3qj5LXCLW8h2Fx2coWe7rSZJO36DbgXpxO0BNGo8GTMgPpJ0A2L
X-Gm-Gg: AR+sD11P2FVo5PW+Hu15oCBaCyy5fZ6UHykBrjh1TGJdNGnL1J87njd1VNRe0asoS3u
	MvB2xFy89QmxyGL9EOIqvDC4HVWU9v6T4AoJvEfagM8Uyf/NhBx9lHpEbKcAak3Dnm2kcodTPQv
	oaPa7wPM6N0weYFFnFj0Ug0H3IQLnzmG97rk65UhcWj1m4d78Zf1wjREJHiegOG21MoroEAxbOd
	x2IwlB7vmtpoiCZHuwQa2Oqk0hiYtvpr58G4vLV3Gd5bJGAMmPSfTWUvOlDD852wSdoGebD6DRt
	WcGVxbOYgCxO5x0M5KM8b3Vl1s94nMzsAUrmrYKSf6TenQy77Syf6ip2SMEB9cxY8cdv+XNtGPl
	SKQUIov1SoGojNlQP6ckwbmNNbEuPWV99WQhl3vC0utF52NYMPQgYizYSJqZJnMx3Q0xZXwBrHn
	Ez0w2iSefDbbq2cluK10tAhrs=
X-Received: by 2002:a17:902:d549:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2d3b0c6832dmr44861575ad.14.1786692756408;
        Fri, 14 Aug 2026 00:32:36 -0700 (PDT)
X-Received: by 2002:a17:902:d549:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2d3b0c6832dmr44860775ad.14.1786692755732;
        Fri, 14 Aug 2026 00:32:35 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:32:35 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:35 +0530
Subject: [PATCH v2 04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh
 clock controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-4-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692713; l=832;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=YcUBetlcsSXeTFWwHSGREMaHV5BuwRS6tuHjLEZyQ0M=;
 b=m2FUOtKrBcO8lDcVtLcayWa7nyzy59baesSptJr8XNM0Qaura5kGzPtzto+lk9HJK0wo93r8l
 uo738BHCf4uAPc/1tAGHJokyJx9v32/xEviKMqHgfKVtEhcUdhQDE0+
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfXyoB5Zu54EWa6
 bMQv8KDvUi+DT9Rh+9syYXUqX547Jv0oDxHBIj5JBErK9zzXGbfKAreU9OV8vex0r1/HjNCJt8T
 O6rfjPJKlERLrQVz1wvGqTQndhftyX7+IkQXIGQ2SkymjiS7rLPLKaxr1XSVLgNhh5rvwoVImiA
 9GIYWudf0SuLePAQNb811J1glE+E/jULHl03eK7SB7HLPsv4p59rHuxfxihN69jRNAQNnyE+jcB
 S5hz3RUFdkh0sa4+neIKpz4Tnhb5I2xSgZbSddgPP5z6EcwuOr4uaMBT0b9ior0CGIJZ7IM4Tlq
 L43gfDAEqn7fFXn0CfCfcecSIqgJ5F1Sr8Lwm9hRUmYBnGF7GN0x4JN34Nqz8uazXJcM4xg00Xl
 AhRUKJxyXVR8ozqgA+HcltaTemmKCV6mcb/4+W0TH594tvf6iVyMYfwktNC1/V0TFGhogUxUoxl
 Lgusceq4lzGpWhgOP8A==
X-Authority-Analysis: v=2.4 cv=AaSB2XXG c=1 sm=1 tr=0 ts=6a7ec495 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VE4QQHX-7aIn0oL__EwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: bTbfMhg3oE34mh5aWzVkj7Ew30A5bQ2c
X-Proofpoint-GUID: bTbfMhg3oE34mh5aWzVkj7Ew30A5bQ2c
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX4nt2xUUSzFNM
 3k/Uz/89aiU236XiNCP+xzUE+HqR8Rb2yDG2X4VtzNKbSLzQj4yYGRlmeuj0//oHNcCDsG5KXbS
 3fTZ42aexBm53+OVU6FD2ewYFsJKHlA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058

Document the RPMh clock controller compatible for the Qualcomm Kuno SoC.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 2b446aca5207..9d521ac9c33f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -22,6 +22,7 @@ properties:
           - qcom,glymur-rpmh-clk
           - qcom,hawi-rpmh-clk
           - qcom,kaanapali-rpmh-clk
+          - qcom,kuno-rpmh-clk
           - qcom,milos-rpmh-clk
           - qcom,nord-rpmh-clk
           - qcom,qcs615-rpmh-clk

-- 
2.43.0

