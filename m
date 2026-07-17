Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE7F3F6C4D
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289273; cv=none; b=LFM8Q+phsnBuc8F+wKfHE/sTYv0fzFC+TK4qTUfWmlUTuH/0iOlGmLOhY2z9Zzuq1T8gC4/ws+gynHH/SNeozFIRjbhYO97/es+0x83u5Ptj42gu/qvdmSLbB+xg+DJkjZXO30H4hZXIgyPDiNq5nbyJ+0WQeGSvmdD625Gfmyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289273; c=relaxed/simple;
	bh=+l5OI6sgS6NvLbeJNU93THRNb7DucFndFxZGDmmll/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mA2AMB0iqv6K+PEVCWwVdmqd7QoRh+/ILNr4MPv2yF5lkriYoev9H4inQyTlJpCF+ACsfBU3ksYlIP8NIGwn9gnKJDQruaDWvPCP2KQKF33gFRgXFVOkZi7NPAliykL+/+vXvKqsfP9tRshTC+erYbxQNX6rW4wFMihqRPHjRws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjYAAr6Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fI2QSqdv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjYAAr6Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fI2QSqdv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HATNt91388517
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OOEYjx5Bx6rjSqfjaKVsvAP9GEjPTNO9SOwXpNX2H5g=; b=UjYAAr6Yqj0ecQRc
	Yc5s4ZGV3qVMQ9yth9gtJJ4XiSGGN6RuR/XMLBUaaH4kr9BEWSEp1q9dTx6x2g9W
	3gLf1ERTtIDfsmbJXvM6zNMgQnJ5Vsz9E0pPcp6uADlrifECMqEjuiGrIPYMOr2t
	aPy9rExGgdMJNsw4uV4um1TavEHgkrk3Luc5lcfPFw8tvl0JxNa1Tv9lxj/IFMeS
	Lf5+d+5Jo8va4epTlq/iYWWf6iyRZtAxVztPCmJu3voYgiTNn07AphYjhaSapuIk
	b5C16MaX0hBwS45BnLoAH0cwxwYCGU981jLl7hyg661xXDbD//jvAKr09JKN6Moz
	KFC7Eg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9p9584-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:54:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cce14a21faso27713245ad.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784289266; x=1784894066; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OOEYjx5Bx6rjSqfjaKVsvAP9GEjPTNO9SOwXpNX2H5g=;
        b=fI2QSqdvmC3MvAbP94guv+PYLR2pvWNyUER7/96nRXGp0D9b8SEyedn5dVhfgtV3yV
         VpD6MsNNAiCngQKykNVlSR8DC+JkEu+LiYnBiXpBtETHHBSlOJnJwvb4/zUCyef4/Okd
         dYnWjzfBG13eapoTeP9J9Xqz5RQVNC/tA8ZnNYy959SaZWrwaOxjpKrBJNMIItK5QdlH
         f3te9x15Ma6NLkv1hNNmgyfNc/LT+PUXn1gob7jDCgkCw2xHex5Sph1Z5A37XqsaoY83
         ltyEmTsqdSMVDcChWSPWvCq8C7ji6efgcxDAuXq+89aaJCXlktO42ISvgxnzVTaJ0Akx
         jHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784289266; x=1784894066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OOEYjx5Bx6rjSqfjaKVsvAP9GEjPTNO9SOwXpNX2H5g=;
        b=h0jrz4kS6eiQJ5Gl+xbPAcW0v4x9vV8RA8RUgTi3Ixu0PXPLQ6d+qxCldTkHrq2RsD
         YruI2j8ZeAHw0m+wW7VrpFdxwFExdkv4mhGHF9Aitkuq+Yz3FOnxjPwhKcO1//Z5WbQg
         leWRqcjohZqNqU53oLV4H+XcJnck6g/PWk1ElZE9jAHqXsy/2pOIflHjOh4CajrqSr64
         EMvbAPocZUlvzUg7k/VGyOys/63+kVb3joaXI7BAgOPyKD8cxC5NbPI4j6j6Ocnvzdsl
         M5Yyu0mt9C/3apM76ClgaSjHx1aPeHOURYJNLGxn3krw7jEuaTzZn+ScUcCAclB2heXL
         qs0w==
X-Forwarded-Encrypted: i=1; AHgh+RqBR2IjiJgJ29xiYqcE+2qG1Us78GfpHP1JFTgW2+jTCXKObTIVbtvJ2nSwHxvhk8b6J9HDUunVD/ck@vger.kernel.org
X-Gm-Message-State: AOJu0YzMnPskpeRxwKZv5DVk+/S8H0azTATMzYagni1hnpnyQesL31JF
	FnGKa8rhy0z5AVTjUAw/jSX6hWsgaEuwCzgiuhk1Yiv6G+7UI8if/yrisxFz49aA5bOYx9yB8xp
	0l9Zm8ZGAuR4Deq5H5eu/3LATGyPM0vdycejpo4/7te0lo2NmK0ERyiytNV6F271i
X-Gm-Gg: AfdE7cncvtSCaQrMBPLPHa7Ny/dn9m2y/fPnuJ2pZ+LtJZvj5s6paAA872k38Hmr8Pl
	jMweihhD8MuOIpZHdclK41mPB4AwHvkzGCqbmEE1ripUEbLKEQ/Cu76tnBRQ2Y63/HKnKPAeNfF
	lZwSEMWWUfrTC2x3vpO86IQZQVT1nFf02C/3mCFcaAap3f0tivcMHcIv/NANaK3HN4J1Chld06q
	ssa6QM55USAcZbeCsR8x+7+tmrQHIqnEpziVTz+d2+F3oumwHfXi2PdL4Se4ub3qeQokZbZjWd2
	5DURB8aUbGoRFeT9RkxQC53bwChvC6b0zkVxnTyyxpZvP51WgdY4TGDegG5leFssQNSTxQDebCB
	knSqy/ul6ET/W217yNLaZgY2wyQgmufmYAslxR6Y6iGO2bKJ79+ZpcdShqrfLqWVr
X-Received: by 2002:a17:902:d483:b0:2ca:f417:396b with SMTP id d9443c01a7336-2cf1f25625cmr71246465ad.3.1784289265841;
        Fri, 17 Jul 2026 04:54:25 -0700 (PDT)
X-Received: by 2002:a17:902:d483:b0:2ca:f417:396b with SMTP id d9443c01a7336-2cf1f25625cmr71246115ad.3.1784289265376;
        Fri, 17 Jul 2026 04:54:25 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344f12e0sm9481895ad.31.2026.07.17.04.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 04:54:25 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 04:54:10 -0700
Subject: [PATCH 2/4] dt-bindings: embedded-controller: Add Glymur QCB EC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-glymur-qcb-v1-2-aaf1cff84aab@oss.qualcomm.com>
References: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
In-Reply-To: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784289261; l=951;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=+l5OI6sgS6NvLbeJNU93THRNb7DucFndFxZGDmmll/8=;
 b=RfKh523Ab0l83ncEhcfdbOm2e4/vobl4BKPY/AaKThLbkKNor3F6khCqXCaW5hScSHWkqvmVx
 U7ON9wLqz1ACdrDx2CMnAaP99AQEu8O18GGNv9qwFGWY0FBygQZql8f
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-GUID: AKvIoCAIpNIp7oWKjPevC3j8zgYgxI1i
X-Proofpoint-ORIG-GUID: AKvIoCAIpNIp7oWKjPevC3j8zgYgxI1i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDExOSBTYWx0ZWRfXzGpD6LAtoJ7g
 Ucp2AA41Wzaa/DExY9+D1PvJaLqvWwIC4aWOMCHNTA+bdsYUlvPS1a5KzsTZnD1JiMHersYjIna
 i/99GRdBwjCAYfpEC66euIdlz/e47ejN6geN5Ta0qFou1udH0e14QGdGC8arL67F9ND1RpwnTzr
 E7/kKGDxjja67uekPPbT1DMEzZK7n/ZVNJeakexYJRvWwdSktEpODPwWbRnqsAjgTLFA0xyBGfx
 b+GdPGYXtw/Jhn4raKevvCDGthLmGlV57pAwWU+nLiLfclKPT4EeXFOuopU4+/7w1Ys06ZQe47E
 o26a1fY7nXwrSI62UCorpyjFUuTfkAJ87vk52NRFH2itmgRQDz7qHpIvMj9lSKOrm6MdfuUtiBI
 mi0NFieRuiZKknZbb1FHXzt7YvTULjGMung4ziFMw9nRjz+4DwlZcKRGIV3OdVICypqNKCSOBQf
 tzYIPjtWXy2Sxnuznlg==
X-Authority-Analysis: v=2.4 cv=TaqmcxQh c=1 sm=1 tr=0 ts=6a5a17f2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=34zfTHg3cMDFYMdkEaIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDExOSBTYWx0ZWRfX1K/lIq4maqO7
 S+HZf8Zjo1JUjIWVELWOfj1FAL5eNlZD+P6QBDRlo409Uru02i12Eqj+gu3EhMCI4sIy873CtFX
 Ivw8HI+r2rPaUWfcM6J/T7WiSq9y6sg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170119

Add the qcom,glymur-qcb-ec compatible for the embedded controller on the
Glymur QCB. It is the same EC used on the CRD.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 .../devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
index ac5a08f8f76d..de416057063c 100644
--- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
@@ -21,6 +21,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-crd-ec
+              - qcom,glymur-qcb-ec
               - qcom,hamoa-iot-evk-ec
           - const: qcom,hamoa-crd-ec
       - enum:

-- 
2.34.1

