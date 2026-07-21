Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCF7472555
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658673; cv=none; b=QkCDfhTtB4D82arUqBSpeX7/WZcRg0f9vWtlf+P1niZQ1iA6C8j/2z8DQhynn9qzvKUjlqi9l1lOFyz1yPBk5RUnj6LmhXk0lISG8tDjcRNSkVuoce+fJ6nOvxww8KBIeYiSz21qFXEAbGN0F0G/EY/Zi3/k6S4vQmvGrkkgTy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658673; c=relaxed/simple;
	bh=ZsiXIxN7mjxCBmh7+NWUbiw/Zk1ew4C2lTBAf0t8BcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MdIeR4gQ6z5haaLiYdF+G/u8lXgyakJFnTQsXgj8oEzShagbvMCPzkV06jPYyvyvboDq1if3H6UNuENTf8TyAcB+ZKyX3+zVfgtbU2Xi1AleP7Z4TlfQbGLHvlVS4Deb1OlY3sR/TaI3EqNgs79fAp04ISwipZywcU4uFsN4iYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YTmTiWZl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PTrUwvl9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YTmTiWZl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PTrUwvl9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2bOE2160267
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+/+2gq6vsf0h3+g0pfxkEjQa4dSpdbC6AVmSU+tWCJY=; b=YTmTiWZlK/HRO09j
	89a3vhb+J4ERVDfwANPfB+aQxmkQKpcWFj6kRChBmiHI08XBWq3ni2r//+YAuHJ8
	fHfqPuJe7jNjRRDJtA6vL/+Sl9nSoZFStcctTL9k6I5Sk92HoWkPdYys6nU9mhEy
	9X1Cyz1fc4dh5r7cFIa4CrRlmYiJ41IGKY2nPGOn6/CTHz6NdAcok96QdgM3tnfi
	H2yS1NNqEkBvx13UZuX0uKoJLkPULWTKuCsNpu2xq2W7EeF8ODej0edlwVX2C/ux
	3y50Wt8l6nHo1EuNvr2eOdi/1aPTVPC/V3dxoQEHIxucrWcP8EieJ2Nzt46CyTTe
	bn8Yjg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c41jyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:31:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so227206815ad.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658671; x=1785263471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/+2gq6vsf0h3+g0pfxkEjQa4dSpdbC6AVmSU+tWCJY=;
        b=PTrUwvl9uApQBjGicOSCR0imHjnxF5p9ZJfVkNkoYkVs6twATlPP21//izJ6SNT1v5
         3B80NsLcA46y3BbUm21i+Y3KLQTXEcxwCVtscKYO1n92lRPMNTVMbhSpARokIy7wrGd/
         NmrEIcQUHORhKzmL6FildQ37MlT2/PFjN65Ku3ZRrgKutLkcFdexBvk3oljCqtcG6UH8
         md28FlOF4ZXisK+TULxUtnBwk0SHU38UsFqf3Hyx2+R3YwCVCy7aqeaDjb3ChX7X9kJ5
         h801ZpQS8jh3hObPIkKa3CLBDpO39V/7SEQofbazP4db9giwYHaya+ujdLkBwRdp0fwt
         uhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658671; x=1785263471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/+2gq6vsf0h3+g0pfxkEjQa4dSpdbC6AVmSU+tWCJY=;
        b=XIVsrOitdi/ea/7hnkGmW2RYDhJy4HG6Ma9NgTobzdeRV+Sb/aZvhBV3iSex0AJ5ni
         bINwe/qKQqNLvEJGDGyjbW3yWpC6UylGJMn+kpM4BVfCf4RtzkVdRWwlmn7eD3wKDDaD
         95jS6fWpTqgOpRNLB7qO1pQnkHjWVAQ8AwTkSf/J4WAm272LISVhjfoQFWxSDdmq14QT
         IxdDfI/pQ8HtCfzmnoGqW4wn8F5ntvRJzo4WGN1Ix5ZVG81XGfQxMjM2Qs36LSIsJhYu
         BQepF+LtCde5jZgH6mKIRN6RoyAR9TaklUvHrozY0A/tfLa2DB1KtxKBSh6gHh/DPtfu
         YERA==
X-Forwarded-Encrypted: i=1; AHgh+RpBYjzEXIVW2/LbOJ8BoXZC7qNk1utrXTZCcbOQ53OFGrBdM08X/GybljbQHQXlLjGYA/bAexEOfamf@vger.kernel.org
X-Gm-Message-State: AOJu0YyyjhAcntJKwNLuHROJlXAErwPa/8Yb38SqvmEfHjs49eXjgJHi
	10i8vq+sRnh7Cegf8UAtjBcilVyrmYJRWFESwaupc1OUbrPXE9oLo57chPxHkjmOEStzXp53/oR
	4MWmI6G3pLCvOF9BshArodxYxlV+5OczoWV8c1nz58x/tK8GoIFNUfrLnXqWUG/7l
X-Gm-Gg: AR+sD10hjqeu7Pw09H6x+5jI2DwE4D8BSUgrbJCvvVuvV0PRTtp7HJcNz2zY0x/KoEc
	roljN1SXRAB5wZvl0/l52oTnEwRXP2erk472PqRMifVPjPBXrbpWDPPt0PubPBauHlkHthEpXlu
	ZBzSdH7OpHLTiGiNDSs36XjRlnjjXYWp1ErIneixT6CJTiXGgjNvUe7Fv7ONsnb7BXA+oQoOPrH
	RaD1chELILAGcRG4g/Lea93BR+m7ZJEYVaSAlxvXuHTr9SzGWsXTqR6EpD0M+KIXuGQLByi+Hu7
	1iNMMRPlXKJMxYnJhuf6lZNzGlIjgfi/AXGpFWtjuwgkSekVVEajTxG3sq5gD1QO9xZHdfxiMP0
	Px2tTSQceimvhnH7eI7RKOKtqX4X5MFL0Zuk=
X-Received: by 2002:a17:902:fc44:b0:2c9:b8e5:5741 with SMTP id d9443c01a7336-2cf349d12d2mr217270755ad.35.1784658670535;
        Tue, 21 Jul 2026 11:31:10 -0700 (PDT)
X-Received: by 2002:a17:902:fc44:b0:2c9:b8e5:5741 with SMTP id d9443c01a7336-2cf349d12d2mr217270375ad.35.1784658669987;
        Tue, 21 Jul 2026 11:31:09 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:31:09 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:15 +0530
Subject: [PATCH v2 10/10] arm64: dts: qcom: smb2370: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-10-febe2805e17b@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658614; l=1071;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=ZsiXIxN7mjxCBmh7+NWUbiw/Zk1ew4C2lTBAf0t8BcE=;
 b=i/SwsAu0fw0RBj27WyxOLBSYkU126RamCKU8adjzYpU57TO4M6xjUiJFN7L29aLLl5gZekBur
 PHM8RZmw001CKh+nwAg7xc/8rthCduiWl6YqLBkRRUmFkQKXkcyBffY
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a5fbaef cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Mdvtvp0LKpy3kcB40AAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: i0fUQsCoGyrqNVWGiYRYwuw0Shgkdnf1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX07biUAI+oOZa
 11dOjj7bEnaxNuivJ44NgFpWcKJlilwy8TTFHzgyznIrADpX9+WHhlDF+/EJxilPK6P3ZLiYT3I
 V+ykGC6x9SVN63oIBkSw2851V32tgjGoMoz6DOBW75jI57jzc2Y7aIUGHWytpcAyTJZWuWW8p4h
 eHjjSnhu5sMf6lVwrPiCvUKCyiXwBD2GauNrVhhfhgF+ZINgfeiHorq2y7OdHIdg0f7Qz7MUm+w
 XURQtScD3BYwkAAMEVwIGwgKmy8nDbNifvCKFgB99IPLcLd6qxCyWfAJ+sFIlbS8BItpnNeM7yq
 YHiwmxXkOowtNWvPX9Tb3p4UXAKJkXD/gbqrx2YJF+In2wRM8EVSh4jf5BSBdIQUFfyYT55VUzp
 PyzzzHfF3XfhK7yiK19FQ7GybG7FFiyU/iM0/+FY/GQOACd6l92M4k8Tt3tcrhU8/xeHOr2O0bQ
 71/3P0fkmPM7ihQ/YHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX06CfjCoRe7kt
 f9PnKa7fJ1YcBwCHfrrF2WjhegBhD+DPch/coMFn2NBwOnloGHTaZVEhbb1d2Q+hNc1dL+F0RHy
 8mkiGWMBToi6E+Zj14AAWmB3OaEzy8o=
X-Proofpoint-GUID: i0fUQsCoGyrqNVWGiYRYwuw0Shgkdnf1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210194

Add Battery Current Limiting (BCL) hardware monitor node for smb2370
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/smb2370.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
index 80f3fdae5705..79b013fa2c11 100644
--- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
+++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
@@ -10,6 +10,15 @@ smb2370_j_e2: pmic@9 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		sensor@4700 {
+			compatible = "qcom,smb2370-bcl";
+			reg = <0x4700>;
+			interrupts = <0x9 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x9 0x47 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical";
+		};
+
 		smb2370_j_e2_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2370-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

