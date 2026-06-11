Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D6736E47F
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154011; cv=none; b=pjTwu+7YX+L9IMAdRXLEQrsGKQeehRPPeVLfn1NAEOVAW0U6KO6lVgDLjPBXkBscjb1BqxTrotHDzx0ddO3hV01AmBxyGUTpM/uOMPZuEwXuh8BBfiOgqRy5u6reyN4kBq7pl35YwxVe6XccbmBlg+OykKDTdzeflbxVGGny258=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154011; c=relaxed/simple;
	bh=K2PktD81GLchwBUK+zykynZPifY53YubUDY8lpH3JZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L56cLZ+AXIJsRzNNkkWeKLCFz9ZaS4RUuPaL1hNcaC7nn7QHKWogcrkGsuCNTjiUGS2gh73JiUIhbiQxsRDfNHAmdTQhiMeYhQeREC3cn45oflalL+Aq6fgWTaSUMxMW7JL7hZlGIzz6C5YdqbYs9E0aQSOnfvsXPL0Rm8qUNqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nTl1AN3v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mq93a1Ql; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nTl1AN3v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mq93a1Ql"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0Nc1f3091921
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FKFWeqSVdABp3bZUWRkG8UEu9s72wVyfZKzIZbZCsxE=; b=nTl1AN3vl7hKdvRU
	DeZ2hrE4Va1V5535B+uDTR9HFzsYhA+PHcgvdyxVjYyoeDP5RghEhV4f19fU9gwA
	bYiM7LKLrBZ/Tk/Ev3DpTouoL/5g/pkDvSo0L5H9AuQ/Emi34Jr0qcfam175xOE0
	g8AV+LChL8cW46lQJ3ecXxHZVr0SjcSzPJEiASX/qV7+WQf246YRpapzgHI1HEHE
	vikM4S4v2QDKu0GYyemEpy+5m23lfaZ4Bf/PkdlKgOlDol7i8bHyGLg1kpf6U+En
	MY5+rAdD3ybhaWZZo17a5+gdtzanP7OcDtq05+9pIPLbjfKgwd72yFs3WmuqVSKF
	YfGEUw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6v9mjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c20f7581so79293645ad.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153999; x=1781758799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FKFWeqSVdABp3bZUWRkG8UEu9s72wVyfZKzIZbZCsxE=;
        b=Mq93a1QlPZYOh6/ouxxGqMeYsQU6lFDsZ2FTI1Rq4YiFb4Mn+to5S1Mf8oSvHSj7Hz
         BmYvMPKN6VTqNevGBpsY/z7Q5Y3GpWU8XdsDVWw0E7wrbEru9xUDzivSzDPxUcDQ+TEl
         bma63XlorUaxsLRbhy+P7CItri5qCWb7bDUDvb2Oa5DlO4+1O5X1rxsQzrVD2e8O5Ror
         4PbDJwpkVuNE+yrV3/X0dobJ5IHrtxdkjpvYsJBaGoik+LHl2FFXq9R6FimQ2Ou5CVQk
         FBdFKKmo3wwYkiSeHHSu8v3vY25AZro/MuSuL+5gFtRAYxFY6ntD8QkBDyGf3o+OyfTf
         ndnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153999; x=1781758799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FKFWeqSVdABp3bZUWRkG8UEu9s72wVyfZKzIZbZCsxE=;
        b=TsWVt66XehDuhijnKSBFRPdH0zrP2yVXTWnGt0VNlVgnScwrAA00xDr0NFX7Ad/H08
         miiLFFP1uEB3X2ltLqI2tNPNdohfIgs9DB6idlQwr+OS45EQm4VMBcgQmRn1VHnGJMNO
         MkNvqdlTK2kSrBjzbiEgqVxN6nG77X79nUD/I5w8HZfZUbEGYmDcEtwlxaM21wj/RLk/
         U4m0uWN6kwYBln9FMGIT6TZA4c80Ui6M+6LPPzeXN29heG0hCDcPSjsneU4c80fpNr0h
         /U6pFTi5x4C0xCipVMDWgGrlPKjEp+Nq83PJWu2sNWG8TgGEnFvegNxckOrmRxGeO5Sf
         FZhA==
X-Forwarded-Encrypted: i=1; AFNElJ9kHCUBj6RylYei/eUhexmjKGijTzDeX++9tbfh9tNMl1yJFwreex0ZRpYELVPpe07IAn+auuXclOUa@vger.kernel.org
X-Gm-Message-State: AOJu0YzOTa2Cfdqw/L0CL9zHimW+kL7P+GJ56fOQnata9aN6f9oNLQBz
	xAWhS4OdPRz0wiSXTsn/7Z5mHCoejfCT872oXwR+yxhiNdSKY4emqLZVRB2k4qDGGA5KCl8IiVq
	p+aQs6Xzw/X3kXiGneP/BFZq0xURksFGWnHc938wOVB85rhwAtlkNX392C9fzfAqJ
X-Gm-Gg: Acq92OGMjuFxadYYbDrwmkmJNmzu409XQ9wVp5sswSKWMfcnMsq4V3BMbXfA+9pJRI+
	GNcCetaYkI2JWFH/GpUelRnswX85h+D3JwJosP025mMoqvQY8TVbpLyKy7ExLKd8oSAEWCHv6e9
	n/4gTIV9Uh79cpgRAcgGtVo4fVsve3j341TgLIq9KedsJxDHm4sSlcY76Nwd1VWzix9f6rjosNV
	CoTJOpiV8Z7qw2C0Mw0e7BgCCNf7GRR1eDzYClDplLhuAOWu2dK5qBuskBLuQMB1os4kV4f3EO0
	ugi7YWVz/0NmKF8C9zxjMxxxCzmmx4dH2NZm87EgkQdsVKZoy+znzBIUp0CEeFeb7h8furWLktA
	iEfWrl/vHKZPbffN9YB8IQ50pdkV3kEWAE1q5hw6Or2qJ80hdDN4b/Yuiu7v8RZFclu0=
X-Received: by 2002:a17:903:3c2d:b0:2bf:2b84:c207 with SMTP id d9443c01a7336-2c2f3730df8mr13002525ad.35.1781153998726;
        Wed, 10 Jun 2026 21:59:58 -0700 (PDT)
X-Received: by 2002:a17:903:3c2d:b0:2bf:2b84:c207 with SMTP id d9443c01a7336-2c2f3730df8mr13002175ad.35.1781153998303;
        Wed, 10 Jun 2026 21:59:58 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:58 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:52 +0530
Subject: [PATCH v2 16/37] arm64: dts: qcom: sa8540p-ride: Fix PCIe wake
 GPIO polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-16-2744251b1181@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=1324;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=K2PktD81GLchwBUK+zykynZPifY53YubUDY8lpH3JZg=;
 b=J0Mz6bd08Ehsina8bTt3w2g9X2MUjoj0r3LgV+NfG58iJr6+XjE+vKQ8DEGZp80CWgvi0Snvs
 r4iMEFQralsAiVzYjrmUEENx0s6hyDouThpOD/6kBLwICEWmhnF2O2m
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: n4WCknOjaB7kSopZVH_GFwYwEc1RPLzv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX79bUj5VCvNZb
 2nsfmavzexEAfRSKPnrkO0DsyKrX6DMnuXX4uerhkWIFqF4iEJ+V8m0Q12o9bwru8uPf1ErCKOW
 Uvhks0fj3IyoVJIbQpGEG8oUDM22Ayg=
X-Proofpoint-GUID: n4WCknOjaB7kSopZVH_GFwYwEc1RPLzv
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2a40cf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX9Q9LRu+5GOCj
 e4Ut2yLOxpOBBpvPwMmvHhMS1WkgT0aDSdySjb5VoWoJGxqZK8BOli/8tnD8isy/lAMZVaHt6Q3
 awJgQV94aqmgGFUpR1kNsPLgNdo6yzBrwfeaVlYPYwxHqGER7SzfwrGEfSqRH727eZoeaeOSMc7
 FOGWhYL2qYFoZM8xibl0GvcSWazbzPWoZXMo4IyFZ71mCBfqO1o/kTIFYePkSOyAtYYzoOh7nLH
 +mRDhYC5wBoLkiq8A/NUY2+jFeiIlKzPVttUqrPJ9CurvNTA0yrMhtZlXNikyrtJp7kI7EBQBaZ
 3owi75aJHg805diU/JSOwGWFCXdym9P5glHD/MPfETOuz8z9CdxsbeBznBc7J4m0CF4dXMp5fbm
 YoKFzmYeqXAO4+naSznPGfUQN8d7SKU5pdxhkYU4PwcC0IgvX+OebNDQ9V8dd7I62quRmxBcbou
 H5FNQE7DC5AxPk0ZYoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index 44177e9b64b5..702ae4cd3d0c 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -367,7 +367,7 @@ &pcie2a {
 		 <0x03000000 0x5 0x00000000 0x5 0x00000000 0x1 0x00000000>;
 
 	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2a_default>;
@@ -388,7 +388,7 @@ &pcie3a {
 		 <0x03000000 0x6 0x00000000 0x6 0x00000000 0x2 0x00000000>;
 
 	perst-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 56 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 56 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie3a_default>;

-- 
2.34.1

