Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458234;
	b=Ca6I8xCGqisA7bDB+9pmihccf9ubJiT4WXVvn77KAHfU9psMr0jOldqU4X4VyNy+/n8J
	 ZvjNzSZHvUGAVF2eX/u7FXBHirM7EjPjQjwBqiUDZDuXNOmK8xe3UONacxYF0wwEpEZIy
	 bmAd6vraxoobCyguUa5wgBsxxbQNvN+9HZaHtTughfKsdcAyyaT11P3Vo83xQ/hzUEond
	 QTtCX8F8PE0sVFqGQsnTCHBDPDLgft29UIJbYL+hWn4NrTN2zoWG6RpoFPafOfZzVlmv8
	 BR+ZYturzDgayuRflD413ydTS68e/sB1E9kc3u2Ncyd/nQ7dojiZBO9h5yySuKagKgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458234;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3h0TKREiz8XiAIj9Eio+1IUcx3jgk7VkK3TDMns8tw4=;
	b=Zuohasda5q+LoMlaL7bppYb1KwO/dRPyN6q9u4rOiQ84dmmEgh6IP8jeuvZd4SjwMQ9C
	 AzGz8pegoDzR5jMYknulQuX4GcyqxEMpE/SMETyMHo8u6dwjnbuX5ZIYZLfn4IEPmX8oW
	 8g4XRi1TRAb28luf0qSFLhPDZ2sOmwB/O2yghoWh1oTFo88zjJ5TUZd8RTPNXAOBkWsiu
	 NkgDNP8bhRGcFAkz18pcq04nro5BCy7j/7Q5IfG0Lf6oIrYO+465Lr4rFebtIr1wmZymB
	 JtnqQesp6p8Bp1MhiiMlhPz5E3qaOznJHbvzRyMfHSi1iBlrSHm7/+23CXhswQIYBwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ebGcwWpu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XGzksrpO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9525C606B9EC
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9525C606B9EC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ebGcwWpu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XGzksrpO
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZfDC903679
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3h0TKREiz8XiAIj9Eio+1IUcx3jgk7VkK3TDMns8tw4=; b=ebGcwWpuFp0SvaDp
	fWXCaG9EeM5OTnqzA7O3NcYXzaLAywLLiW1/tKlR0rk7/VKPIQ+Vpk/PK/B9ydnS
	RqTEm7ybzl1o29wqVA8ebsOpnuPNLijoWXdrA1ZyeRqAuqkY3iz9uMF8nTN9tnKd
	yeYDnnaWo1vj2V1+Fx+ZwsDE9pxZjp/MhGR9HWG0zKRw2KpZ3+C3ykjYYEJns46G
	+DXa7GROsHEuxhTEBOQsla6f9I1KjVwEZQbGmsa+T7UHdtOMWVibEwW37GH6erTw
	Iv/Q1kjNQHTCJkhhkWSCZ+PZJZsGqdkzq3B4U/zNAvx8KoAAPYuGrlUquuSV1UDW
	yauLaw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1uay9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:37:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375f0fd31f4so2717518eec.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 20:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458232; x=1795063032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3h0TKREiz8XiAIj9Eio+1IUcx3jgk7VkK3TDMns8tw4=;
        b=XGzksrpOPLliIpFibfr92ScTUgXFufO2eCDVDCOlAorCvRVzgLRWXc1UaDFGg0euqz
         wYxxTdRQn+JvXf58JJRF16bSdUO/IRvISVc57noxosTuB1WWoS6G82jDBiaNqCsCsENt
         X7kqHhnFI1DgkLgfjKg8VHDkL8cVVtY0+mv3G9BcCS9uYH+5/dJwJu7X5H69ne3sQBQ2
         5jVHXt0NxQbpNmrshlskQqXmw77Ie3C6fFzDZeSj0gUvDnzzJjabpnQcKk7OB5qZttAn
         +4eEtVUVR4gOsFRM2RSdukyf9ORG5scz9+HCxQE1GpPw9o7pBrqQLqvTStOrscnKhmDo
         y2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458232; x=1795063032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3h0TKREiz8XiAIj9Eio+1IUcx3jgk7VkK3TDMns8tw4=;
        b=R6S9WevaPEmn/S72ECGlOqJnNv7mv1FhgVrpJU3J9L7aSg1+wLNqaiPXmDEwqNiknl
         ySzEy5KPR4TrVhE2TZh2D9vfFPg5AMaXIAuncLxHW/uy6mmp2J8JxofLeeAkhfKjB+uF
         WyDkg0Dcz2NkmUqfHoCkbuovEoWOmcJf1v7FNcCeKKXhRZKQQfFnS3EQQbyiut0mYDFf
         gkPHg0M6woxh4ClV+w300vyo4KAnpvwIobbU2J5W/K+RWKb2AeK9H74YeLjseUV8o7kB
         P/2nsFHjVYjdn6httTuzdicqom/a4WfueLp1H/nClx8mpl8MlDuzZ1lqhrypxG04M2OH
         kSig==
X-Forwarded-Encrypted: i=1; AL+hErHK3hTFJN/PtbO0g+yUUCjaCBbL3pjAmArHrhOK4D96dYs96TxJedJeoA0YuUajEtxh59q7yh7vcVIF@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ci7bsOr6VL5hBOhKrsI1kZxu42AwCsm9kzwrulDrfTeHLDTAf
	bkIiHaiTTX1kW32nlvtLlVaASTDnZMiRKbu++mz+vl1tBt65ugMCTomNQCT9Mj9iUfJgV3ChnSF
	fsCB+lgTY9zSyMbXKXcqY93g5vmlGLfPI1OgZCUpZYcYFqd8CVOYwtopRokLMhEw5
X-Gm-Gg: AYBFou3Xn8kwEwjzaLHhy56aJri3w8KUi3mZtbXWO0Yfo6RmmzavacxUUKDAmMHUS4h
	7D0hB0JlEyBXEGojPirZ58VdURzDM7aeYftDESoLnqt7tzMaFOLEhjs7a6GAwoEFAYu5aTZAp38
	2p0Df43LR0JJtEVLjCxaljGU1di2ZKcdR0P5nR0V7AOhJbZB3zK3SodScpvjZsft31LKXzbdG6i
	WoOLWwMXGv0rcoKL8e/F8eCfvDxVTn7k3RY0ONlIUS8seMwo95xreFSKTf5ten8oTWr9wmCv1p/
	uPWuFiP44XZE3xwp4kSZEeV7u3pa8wEWNKFwVCZINZRu5z2FejSNLzhZAoyi54WcURmBznU2XGa
	vRqv2kGhq2lD93h3zBwx9IJRD+mxhbK3Na76RU6TRUVU4k51JKec1s0cXpH/XJ4NOAGVMox24aY
	ZnjpREjVpCUh+LGdSFHiyHhyKURPVg8wIIC8Wywm2jRwZRQAAMJudqgJlaQw/EdDBfxF3AzQnHd
	O6l8Lo=
X-Received: by 2002:a05:693c:83cb:20b0:372:33cb:fa85 with SMTP id 5a478bee46e88-37686a4a68amr4781013eec.29.1794458232331;
        Wed, 11 Nov 2026 20:37:12 -0800 (PST)
X-Received: by 2002:a05:693c:83cb:20b0:372:33cb:fa85 with SMTP id 5a478bee46e88-37686a4a68amr4780984eec.29.1794458231548;
        Wed, 11 Nov 2026 20:37:11 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:37:11 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:30 +0530
Subject: [PATCH v9 11/11] arm64: dts: qcom: ipq5210: Add random number
 generator node
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-08-dts-v9-11-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfXxiF01P9tA1GX
 scWPweDPiDeOj7rOwEJSbxyF4oIax8QnY81JliciXDgLqlTAO5zWiHlBM8Ei97rH8MyWGF379aI
 aY6Eoq9RC8bmv4Vv4Fa/noUQ9K59wh8=
X-Proofpoint-GUID: w_rCuA8mYtd6ak83Z1ktJcX_7hNNO0D0
X-Proofpoint-ORIG-GUID: w_rCuA8mYtd6ak83Z1ktJcX_7hNNO0D0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX/Ya0CzAWc2IL
 73Hw4+MsYszBxfv/rTYXLVpyTyqPRT1Uj04ku63UICpNUOtIujCQGGqYKIpqKIsRhMx//bQnw23
 FyyoIUQGXBPfhw70WfGBSWJIknUv98IqklhvrEUWtwaJNCLRrp5yPNT9uB6i80wetTy1BsBDUtg
 T/iNHSVMUxh44K2NIzfiErGy6vSlhC9XqriuX39RguXyoDKls1Kjt6mtuBRkRBTCJCdZq4BpUBT
 J92Xa2++L9SYsKuQR5qj0XY2IMXVM9V9xG9gPKfnU0AUhu1dsq5LtN4i0EFAnasmKlIwvBXVxor
 i33OOLkr7R0Y744FJdyeL0IL2WNQWlgbWPVMlFvaKCyNRym/3FyWLxjDagikM/pcb73Ha2YZS9G
 BwlGfjxGXP+wnyyfy9ByX8uCitYMpchTrG/xdIRg3fLuWfnDH6HCdZ6B2NXPSMDtREte3ONo5wx
 9Id2O5+LmXhAnB9MZsQ==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af54279 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=XHihiHp7Beehtrn9I_oA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120018

Add random generator node for the RNG block present in IPQ5210.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 052c2f3df94d..219b3f3696e5 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -411,6 +411,13 @@ tsens: thermal-sensor@4a9000 {
 			#qcom,sensors = <5>;
 		};
 
+		rng: rng@4c3000 {
+			compatible = "qcom,ipq5210-trng", "qcom,trng";
+			reg = <0x0 0x004c3000 0x0 0x1000>;
+			clocks = <&gcc GCC_QRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5210-tlmm";
 			reg = <0x0 0x01000000 0x0 0x300000>;

-- 
2.34.1

