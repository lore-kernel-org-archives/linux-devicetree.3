Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809661;
	b=uzzs7jHYWPaMB8zwEFH8ES7UKEF+xVGbRKpFxwpC7ZDCfh555a/xcIiF/xV9Vm4wFQnG
	 YdA/xpN6KDtyMGtcFSO5RwsLwsFQw/M7RHTR9hQLlkbm24aTM0dzieNZccmpvLtaRhXL8
	 R2ICmtDjqJPNOG7J6OMIYFfQ4mpZ0vMokrFvcE6RwiTIBJ7eh8rg4xcNCl7ipvP+ZUxT/
	 Vz6UXpzakPiTlHhbOHoHenb6W3OV14yGVQEdD7tkEfqgYLk3L1mhJDr//d0Mwr/q263WZ
	 fdpCcrPixIQ/6f/6X2b6BRJJciayFw3WzFmQbCobiiY6cgP5KSwYRt1EuDRQoE3mLsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809661;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
	b=LLdvGeT8W83BCRFQ+SDPsq//yhP/CjY+4n16rl/hdP229aETyV1aBE2vivfM2VgHMtf5
	 1jxb3f+biJtL01y1r2Aiu9fHtMHukcTBgE8AN+zXCowkbu3nsAtBUhFdj1VE83XCPBFZO
	 XWgNZ6vK4cyTgegmGg0MCCILuKlzAxFA5jKCO470Zw0hzFsg+oDJKe5KoW1v+Y4HI48lT
	 OVdiUnVcIs06lAKG19SPeQrK5UCYJNi8EEBOSL1WDBOmz2MwArYtkXkU3EsZ2OIMcdQ1q
	 BiFuWyMgI/4qNDsUqer/xupjYkdd6LHQ4g6XYgRSroOqujAWLIiH4deaRabFCr4tgWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0wVNYO6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RL6SSi/A";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7FA606A329
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B7FA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0wVNYO6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RL6SSi/A
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LbLG214148
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=; b=J0wVNYO6ILmcjvju
	7iC3wjRXx6HXaui59q8Puaam3pkqhlEF5zwa5AYDOyjyCEiFGLlhKrl9HPdz/iFG
	kj/H+ckuLBaeLmhWksYH010OK0UJ7u2wUEZ5d6C5WdJf9HK4Eu0pdioDPtJA1Yyg
	V+FZXJMssVqyRtmwoRH1YW8UR1yKiJ9ybXB8A4ZBMhNU94Zkv91mjF8W8PJjSWN5
	ylkrwYCcgr4gMA/H/CvIp+KGgDhWbeehIOpS76RBGPXpSB7B1n5ddo/K2XLgAY8i
	yO51/Ip2KLSNgj+BdAORyUMWLJE2+LSnlrNK53OidUYcNqFLzJXzPlD3/cJcrkJS
	fZvsJQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqn6hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:14:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3aed1b64104so5406060a91.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 22:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794809659; x=1795414459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=RL6SSi/A2+TFzFy6N+ysBZg+J/XtOZFAoJksroGz9lXNIItVylW/0G0C/KMZvO1YGc
         4gvyio2fOU0kCF+ADt5H1fDsJiwy18U/Duaw4RAk8iXv38uOyCWT32IAhfXSDrGvZzcJ
         T8eatCQgDTOcXAPJTtpjZZNC1OoUsY1qMFDFmW1TEzd+DPnqHm/Byu2WZFuVNPCTqFer
         77nWCQRbETDiaFvgyC/JUea0ZWhdThS5j+tpo7Y3sJwIC7U0gcz8zQOZXP5Z8sQqJvdp
         yKZL2qzSoJhoYIgmf5dfMCtZJwFDCyu1pLNsx8nVRioh2RvbXazFC6H8G1JAnahk7fcx
         v/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809659; x=1795414459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=ZD+7SxEVkkdiKpA9Wc+ZOxZBdlB9CvYDqsRChz3vjziC7beN0OCmF9BKLwMkHD12YT
         8vi6ka66fw9GxEr3tFOuYjLn7XWLI+x19YHwmPbUk9u9HfcGNJ8dzCnX9vc8qgTckhjL
         hEJp1QTReGV39S/aCHlHoND6OKtv6uIYPj/2FZUJLO0wdttfvv6TR7E5AXR3M9HFRcQA
         V+ET8AP8+ykQbhtsKVpusRCk2pvXsU6+TOr24o4XV5D2ZAqA3xMwNC+wBKOTbE4NTwkm
         8Wt6xr8nNR1Rk7eKXrQVH36bS5uQwfvk7S2w6k9+0tw3D1Y7hW1w9S1n+kdzgSihO0oJ
         +HwQ==
X-Forwarded-Encrypted: i=1; AL+hErHEPtBEG1H6KewrlJY2DfqL13WmKAxodxJVmBv/BKgPi/v4xDeDWD8dLPpJkXoFE0+GK5RFKvYx80xW@vger.kernel.org
X-Gm-Message-State: APuU4Z9rRUbMT1OrTi25/MsZHtFgHuFJQLlRZQfRsRc4wd0iWUY6qzWu
	K/f2sI3JFU1NxuXF6ylg+xvnUHt5zYkCVAyVaBi7TO7izqcYDQRKZ8rBsBS5+mvZwp6fzIxjwyv
	PsQXcOunLCWdamrzE++dF8cS6QWGj+39N8G4AwoOvdF1llCSoqgtzx1niKTHDMDgk
X-Gm-Gg: AZFdTZf6TMRFxWhpldezNN3Wp26JDr63PrKT66d+zZm2uWjJlP4iElhnhBs22Y4WP7J
	oryGze6E7xZ6elIZVliv0kcBz56TIV/uUpkw4AMboqRzq/ePPcCHinDb5C2k5q34497K5PWXq73
	3ji9AfSJPm3tmOKxwur6LY9sNWf5A0ZSKMjZZmZBRgee88NMH4U43uFAzJYGMqFaodExz8Ney0E
	LvVBPWzyU32gqxBOmQjxlaXbtVCew1Ui5olwBDAXHdtBC0Lq8slFYJD2v3rkXTDO3YvI4LkdY7n
	+CyE33BNKb0n2ea9OdhxYPnbQg7v7HbaPyAG+V2YK458o9kPfz/iboange8qVVw7E02lR6QBp5h
	DyKvoCk1zHMshv6ddvdAJkOWFMQ5EMH7IkACFNOd+TNIuma+zIMYUy6HpXYJrwf6fDpf+
X-Received: by 2002:a17:90b:4a05:b0:3ac:9176:e81c with SMTP id 98e67ed59e1d1-3b1b0cdb2efmr8498347a91.46.1794809658916;
        Sun, 15 Nov 2026 22:14:18 -0800 (PST)
X-Received: by 2002:a17:90b:4a05:b0:3ac:9176:e81c with SMTP id 98e67ed59e1d1-3b1b0cdb2efmr8498331a91.46.1794809658504;
        Sun, 15 Nov 2026 22:14:18 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm20229444a91.8.2026.11.15.22.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:14:18 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:43:24 +0530
Subject: [PATCH v5 6/7] dt-bindings: mfd: pm8008: Make interrupts optional
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
Message-Id: <20261116-pm8010_i2c_support-v5-6-5626ba17c0fb@oss.qualcomm.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
In-Reply-To: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794809616; l=1342;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=G5Qx+ovkui52zHAz78X3034pPz4pJoesn9ej2vCUqhA=;
 b=rCBCJHon6H5ChuYqrvX1bQDSdX9GNWCh1H5WAFECl0RDZXP0CgRQUQ3kkFoyEGLLRo39/+QWn
 KsXwZ/an8HNDeRcgdRxSxyYX4yUXP8fcAu4l+ns60d2na82HAeTEBUH
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6afa9f3c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Su-V-MYFMjrvs2extU4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX0Bw0YI1mkRdv
 vQeOHxF/6ymolZ/LcPsy6ysoeO1mXrw1C3URjQCss2bB0JpIEmjmtoxzCJIFQeX1YKe+xaRI0Gb
 GLZ9wdtKDQAfJM5rsvnp8Is4EgpWTuc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfXzSfbmzuqsVQj
 i6pTATI2VilfbdJfO243BOCe6tWupOtcISGfEY/cu9BMzfmrkX/uMq45JfH7y9vhHgAEMAaQYAJ
 8p76FVdUP452r0mCes6IULIoSXIfb8vWYOD8doZ8fgavKBKXY8rbzJWRB5ZiP3ZZMXqqEugcS68
 01kYRHf7dbt+MmkdvffTzOppzMg8z00qoPJmJLR8V1R/yg7N0CBWt68MHywRd9Gl0LwS5JITy1f
 Gzerxxx7UH0ZZcvZotsoVkUfsA0CsxRqKDMKLa6QgecpxcQx9AqA9fm9XXK2kbtolzhbzvB1QFR
 4a8E0RL9C5dQ9aD8FzkIr2A3UtXiJ+DyKx+/00gge5ZVTs2OsyW1bRAc4WnYM9q37ikrbp2IHGF
 xIOGXfadC3AAX5VxjcifX+Ri01yomkYvMeGP2VZsuPY2xFWdn71/AzPTBipm7QwhlnM6b4VdgG2
 heWGb4ohBxDXKp1DPFw==
X-Proofpoint-GUID: hIbAcCVbs9-JI5pS9wp2TuKqCrnbOEQr
X-Proofpoint-ORIG-GUID: hIbAcCVbs9-JI5pS9wp2TuKqCrnbOEQr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160024

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some designs integrate the PMIC with the interrupt pin left
unconnected, deliberately. That of course compromises some
functionality, but the core function of programming the voltage
regulators remains there.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 2701aa755f31..3c0febc8152b 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -90,7 +90,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - vdd-l1-l2-supply
   - vdd-l3-l4-supply
   - vdd-l5-supply
@@ -99,10 +98,11 @@ required:
   - gpio-controller
   - "#gpio-cells"
   - gpio-ranges
-  - interrupt-controller
-  - "#interrupt-cells"
   - "#thermal-sensor-cells"
 
+dependencies:
+  interrupt-controller: [ interrupts, "#interrupt-cells" ]
+
 additionalProperties: false
 
 examples:

-- 
2.43.0

