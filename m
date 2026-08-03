Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50FE43848D
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 19:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785336; cv=none; b=Wdi8u2Z6z+wjXQ0BIhj2/heJevnTXL84ygjhYUCqXLUxsKZcDcrCWjSTS4RYE1FJFuPQHEiUJNiZ8eLKUGLqBMjMYGqdsGEfo8t8b0tXnSYURLlcsyK8mjBAzHC+OBVCAdVCq9bRvOvbFCg4r73VMbqxyXJ80Vz5w/bupQzw1oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785336; c=relaxed/simple;
	bh=3WguNkZGm4iSMHuebuPta2BUTd4TMeN5FuTqjX/mPxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BKng2AdOPyNvNt1IfNaeBzdnXHLkEzFQBmwE5PAiL0sPon7eMiy94k/0whbEAGcGzVMy4xl03zgbZbSrMJD4nRaqBma8FXOsBEynyFVbjcoAgJ7IXA1g4+ULxkgTtXogZFevXoggMYCrXBx9vG5k/HY52TVIAW1Qx0a2k7v40x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hFnYLUZY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVHm2utN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hFnYLUZY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVHm2utN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673H6h3x1376660
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 19:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NFVdhUyls+AE0wnf4/MLIsuWl8dV3/GGq6FvvGoNI8M=; b=hFnYLUZYesDyjyHQ
	7qkitT1AoWrHEtMnoWpDrhvCpgxCtwkzTcz55lSfGlavhmWG0WLxOaO/Na0gK8aW
	xW0p45E9IgswKt7qiKmmiO/pq5RHGh48HZoD5ahVEAKpfxE4Clz/AzRHmDya1lRl
	ho4gJXJzKGjHmk/pNn3DMyHos9JCl3ahV9mNrulK7Q3XR0urSa8lRfUdnmkUqUWH
	7nBNCud2iF9Hn32OZfgfy8E/d8En8ofbFOxF2ppYZr6wzlSW/r549m3FgulCKQfl
	mVZ8PfqTw+1nkD/96PylkcmThBJdq925UQgmiOZOsXYLScFjbMecUnPDlkkE38Ue
	XrxpCQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3r0mhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 19:28:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso3985616a91.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 12:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785785334; x=1786390134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NFVdhUyls+AE0wnf4/MLIsuWl8dV3/GGq6FvvGoNI8M=;
        b=ZVHm2utNTMJIku20IRk8aQni7I2ZqDp+56FGrsl3x8mNQ3J75NWckfv+WV/BYs04YJ
         3CeNFQUZH0LWkhKOm2hJjXklA1uU4BPI4bljJ7VhgQER+d9XEF9Cp7NJ0DrxA3NOdmMA
         1D/1CkQ9eECkVga/qIoDF9M7j6d/QBzp5gJz7mC7k37dOwMWB3UndkLyYhgmrYAvUIvB
         q7BP9eCpelnG9qB9s5al7B+Dy+DHDrZNyr2Fw18wI/jcMfnRMcnXCjYqzJg121KYoV3G
         uMwDyiKHJhD2Bc9TXWaVOWDkJ7CJKtafjEZMVHi1Famab83pdK935UddnP5DVpeX4+cF
         /60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785785334; x=1786390134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NFVdhUyls+AE0wnf4/MLIsuWl8dV3/GGq6FvvGoNI8M=;
        b=Os+D4v2uA/wTZwDNHvoxNuzhElv5xFIf7qqXKJ/HZGhvwGa/d8awef7s6wyMqnyiPa
         iOOq3vgaK+nMpvaBhgOex/ur7gl4S6WFV0xuFYTDwOuEwxwL9O7hn0jZaJ4aAtsQCPzn
         XwtwWRw3jb7icoqwhf60jaBy7fIJwFLbhaRDvKZE+/pntPqpk3vH6KBQ/nxzt7Ei4fHs
         WT8bimkAJTXDUUrW4fB87s4UgPo1GOvOltWyjKNX2b6FjawixkB/Wm4XAMI4rDWEItC/
         Dq2H9nmfldLWFe8LgGdzgZOQ928W+Y8GBRv+z8BG/2joEqbJrdzw8ld5XdfLQpHf2DaS
         j/eQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp2emMOjZ2+JfD2pGhNkMUkAcN1WTClnDLrJ/RB9Rv9b6OfISoowWLU5b3bWk/i9JhrSOB7V3h5DKba@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8F08SSYxULSjRZn+ULVxpsVk6eYd/Ihxt6wMh0PcnSUIPOw5v
	BUgAwIgEup+CLse4+oRnEIexAZ+BBPasgC/JGgZdom4aajzDtXHXRRAKLKIA2SJu//Uc833Otly
	8bOjrENyAOk7iJkCwSylLAP2x5U4fZYSqBUxKvr1oFT3aA14cEEHjOgNfkOtu4B5o
X-Gm-Gg: AR+sD104qklGWIZj1YRnHSeEm1XwnpbhhBkoxzKHgehFMZK8H7cwJdA//NcUFGcdUdc
	e4YkPilfNfPba4ZAoSlmqK4yrv9pUTln36AZkkveq5kLkvUA/g9vAbmpZEQa0nnmtV4l3UY+mQJ
	oKFT4f4i1HFidgr0ZptyHwIh4QSRQlgPrAp1pU03qhYHLMsYQxEB21Cbpsgs0lGAEP7VG2ftVA/
	V/oaep39Lvk78/EZAkOHJp8blrMjp4sRmoNWGWcXy8FperOqfYJbDwm7pf97WjGl3Y9kws2wCmB
	FmuR+fQRtsrYFT9hNf38to8AUjRdSFvS27qNS4rP8Jg3bgJjFGcMw9Cj8LLr4iwtRAXrs1vRHNj
	LbcohgeoKPsC3vs8HQyrHaS3Ku89oDA==
X-Received: by 2002:a17:90b:53c5:b0:38e:85fb:71b9 with SMTP id 98e67ed59e1d1-38fbc3f9aa9mr10635768a91.4.1785785334148;
        Mon, 03 Aug 2026 12:28:54 -0700 (PDT)
X-Received: by 2002:a17:90b:53c5:b0:38e:85fb:71b9 with SMTP id 98e67ed59e1d1-38fbc3f9aa9mr10635738a91.4.1785785333740;
        Mon, 03 Aug 2026 12:28:53 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm38622738eec.1.2026.08.03.12.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:28:53 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 00:58:01 +0530
Subject: [PATCH v2 5/6] arm64: dts: qcom: monaco-evk: fix SerDes PHY
 regulator supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-b4-sgmiieth_serdes_regulator-v2-5-c4bc688177dd@oss.qualcomm.com>
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785785297; l=1063;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=3WguNkZGm4iSMHuebuPta2BUTd4TMeN5FuTqjX/mPxw=;
 b=d433YrJuwmbS9QQ4N+lBBfppRD+KL5aUeBTOD/pkCGHvd5VbqXp/bJWQNrrrF36YuIMt6PWEl
 Q6jVWYRXj3gDSTgtXKmAboNx7Ml5wJeKXiCu+g653Dk1E/nuMxjrz52
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=caPiaHDM c=1 sm=1 tr=0 ts=6a70ebf6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=C72GEnTMbTZ0pNA8GBMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfX2Zy0YIwiP9MO
 qlXyHshdaRGEhS8gRVRdoLGxAsmFl2qZ75sxzOXPo+/uen9vs5OdcV6S+bKc7Yt1lhCmNODiS1P
 6I8SbTaMoeDFrVxBG3KDNoUYv8iSLYU=
X-Proofpoint-GUID: MZ5YIiqxPD3CL1EicaXpWa0BJ3SxDRDE
X-Proofpoint-ORIG-GUID: MZ5YIiqxPD3CL1EicaXpWa0BJ3SxDRDE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfX16bPDqU3hG0W
 iz0WG3jumGyP08oxH+LJqVUlqwwUH5o6tQAdV6M1jt8hgS6ZqCdaA9vWplnefWNqk0Qbi8o8RvQ
 b+LJmA3tqQU6L0m+h7brldLCvd18uontevrh32UYu+9kgC91bxwOQu6dr8FWAwf0nUIBPkpi3q9
 6WaGvj1kvtClNAcm6CiptiCwAJgpsbHO2LgCcoGn8g/nIqnTH9v86MJ3rYzwF2E5Hi364AxdOXt
 BqpfrmtdC0oyJ1Q80VVsLk95aZeD1IseiC8RPoqVWs/Vf+yo5FkYL0nUGvmMxjHrPzzubTdYeL0
 YlqAoRItKhrVC2DuCr5fVzKzBhDkxvyr6t7s16NDGbBvydvg/ptDU32Em2OQCDvAprpVp9Oqpc+
 rFdK3315Z9GorGZj2uacZiz0oBLDZQT5XiVKCCu/JZ0MK6LaGm/w1ji0jfZNyumd8TptGFNPMrN
 uZS1v4ZXbLTiHJfac2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030172

The SerDes PHY node was configured with 'phy-supply = <&vreg_l4a>',
which only described one of the two supplies the hardware requires.
While vreg_l4a is the correct 0.9V rail, the 1.2V rail (vreg_l5a)
was missing entirely.

Replace phy-supply with the two named properties vdda-0p9-supply
(vreg_l4a) and vdda-1p2-supply (vreg_l5a).

Fixes: 117d6bc9326b ("arm64: dts: qcom: qcs8300: Add Monaco EVK board")
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf130564efc2d0159ac0de39126e80..f787e78b35ce48d7544116e4383561b81def8ec7 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -706,7 +706,8 @@ &sdhc_1 {
 };
 
 &serdes0 {
-	phy-supply = <&vreg_l4a>;
+	vdda-0p9-supply = <&vreg_l4a>;
+	vdda-1p2-supply = <&vreg_l5a>;
 
 	status = "okay";
 };

-- 
2.34.1

