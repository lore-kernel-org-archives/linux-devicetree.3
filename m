Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9FA32B100
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187701; cv=none; b=B9DKjka3tMwwPfQQzSHh+DHX+aHToi/1TF98FD7ZDHA0GENRV6AGihdrmgg8GvorPUGsDbc9UuYdPLoraaL19KanpAiUo+SGAKzoeQjIxXUXPW6SXLLd3kYL3GQDk82XoUFdPGJLbpf03P2PsHvswHhMAikeoMziJxBEk2ir++Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187701; c=relaxed/simple;
	bh=woBdEwaHX80T54ZP+4+AwPFb6N5jfH30MDJZOeEVaJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g96+UaMgK7VPDuBP37xq4vJMaVdicxARswMKiJo50nQXEgmm2jfOgy/QMhr9TBSha2JqmcuPaIroqjYzeSxKVE7hT6T1SEOj5am87gUkCo2WsuxW89hf17MeisNt34bygI53H3lUz5vfaIyYBrXg0dV1+xOV7SM99qQUbTuj5UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eV+rQgC0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ecqGFn+X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eV+rQgC0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ecqGFn+X"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J7sK8h2975689
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJYjcv22h+Q/YGAvKfWRg3NhA6BXwprz8gvA9wNRuSw=; b=eV+rQgC0DLvW0Jh3
	KEPnfpgkwkktKAseIl/Gc8muIg4sSAjzXGQ1jtc8aRl8dmLz6WhYuNj3t2ARZXXP
	7s7nuVYpimJiynH7IwsYJJoL/o7HRT0BwzMv1p7F8nv0qcq2NJMohWtpdsGrWISZ
	TjmaU/zXTihoODsdir1cgUG+hKp4vLHZNFNkqj3ftf6j8WE2BbfQgrRf6sRG7Koa
	mpgoef0UV6NQZKAHn+szmFmZJvWwnK1TiNJ81+AVfDyEWUjMKHkM+t8XJq3op2lH
	RPM7gq0ASI6S6k16GrsNdySVyh9o+RDdeYLUojttoYsxfm1D4UFpjqyf0/aUldcl
	5jTt+Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v4c300-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:48:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d9a6a853bso96821821cf.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 03:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779187698; x=1779792498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJYjcv22h+Q/YGAvKfWRg3NhA6BXwprz8gvA9wNRuSw=;
        b=ecqGFn+Xk+WThuQYzzhYLIUqjNWcL9UZtn3mqDkkb1MzK+Hvy85Bw/VVikqdJMRm+P
         f6DQG6cgLd+EtoBRgTlRL9kSqhTY/SS9R5iS0i4uBUZhyWivtO6s6x+N9IzYG0iVqWgl
         xcXRFtavKvSDk9mwFihYrGHNMga/uHH5GLSnKX76G0TMM5mb53nRK+EeCy8TbEWK1Cnq
         7Jp3xXYEyKxQBFHCL8Wzu0c3wHEU+vAZVJ8ENZAQIpzHXIJb66YjO7E5SayrAMnWNMaT
         8OCVB2JaghjEXv0G3rIonbyOhKQ3I29nEkO6ggOySvRJHQwNWt/2DJQjV1q1QY4aO1C0
         OD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187698; x=1779792498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zJYjcv22h+Q/YGAvKfWRg3NhA6BXwprz8gvA9wNRuSw=;
        b=GykJwIL5hd2Ze4quEJxCg6vrRj5fQ35HB0l50wKBBH57MwCaamZoLQkMRmCTrbfKFB
         c6OlZWgFNavoVibzy5CY8XE/1lCz0D8ibk4m0nSbv4BlbmJ8fHbBV41ZlWlnIBc3Qnt3
         63LNo2BWzDb7l/+zxHB4xoi0vFRSKYAgyUsgX1e8a38cY9cWrqIKH0v48CdAv/O68phF
         IXECiwZwn9oHpLDgJfCIS74r4sTQpXPAIwbqLcrtMVtJMzgioDNbRn9vpAAZ0jT1IUKC
         QpUI3L/SHy68ndNYYaiOQLvJk2u20OKrUCBoXb4ivJXgIXb2rPYpoFP4Un+SJ06iJDUi
         +j0w==
X-Forwarded-Encrypted: i=1; AFNElJ/Vey3DiQsqmuFwKXb+Hvwa/o9XK7O20CjR+3ctpmg2qm5ZmNkKzQ6PlLeV56YCUcEzoekCcqPC74Cf@vger.kernel.org
X-Gm-Message-State: AOJu0Yymeiw346spYA9wCgrTXwoOqMx0YDE4KTaGfR4gJip8TWzWly15
	RATeI2v5FG2Oz/KmVOghsjJ7ea2b0rboyTGafzKb7O4tdFI3bzxIIRhP9bSQwzjqWqipPt2l44+
	Qi2cQm7ZApbgYKvLzOBdWu6htAZdYupvwYQpknHUh79o43DpxAnrPjaZZ7bgpuZ8+
X-Gm-Gg: Acq92OGqQwqhRPtYtOWkkWuhpb8Tza5da6SnBmvCJLD9W1E6krg2mduB5TSpOhoz20H
	j1Yfs0NbCFuvf6rWlkYwfC5u+JXTZUnnMJn1wGq8M2OFe/X8T/QL5AOcMA832wT2s+92dIM4Drn
	Llt1xioryzC03Hn6tQs7GrqH9nfBa7qnV+6IKm7DFvPbTbJBC8UqiuNCYPCdpyrNrxIP3HaSij5
	tKbWx80+ByPljVuLdhsgttLw8tJsh8swTDkyunBmM8+pP7+khJ6olQuewxBGe/FzzqUbo93sh0z
	zJGMAnc6CEZ4SAC0ac5/JMKDnZOVZZm9/KERkJNZKz0xaM2IlJwvpc5FHhMq//o3uTpcKyJ0m8g
	LlryNHwn4oDkhzic/EtR47vWFCy1Fp8AflMQFhFNfyn8NBk+hGf2z/ZpeKdrzwoHWPjoQ7tx3xm
	Z+AzP5BctR8ZbarpBUx6KkYFK7zGJ/k2atxu4=
X-Received: by 2002:ac8:5d89:0:b0:50d:7aa1:f405 with SMTP id d75a77b69052e-5165a01227cmr255473991cf.9.1779187698393;
        Tue, 19 May 2026 03:48:18 -0700 (PDT)
X-Received: by 2002:ac8:5d89:0:b0:50d:7aa1:f405 with SMTP id d75a77b69052e-5165a01227cmr255473721cf.9.1779187697922;
        Tue, 19 May 2026 03:48:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a59dsm4031413e87.25.2026.05.19.03.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:48:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:48:08 +0300
Subject: [PATCH 6/6] arm64: dts: qcom: pmi632: move vdd-vbus-supply to
 connector nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-fix-tcpm-vbus-v1-6-14754695282d@oss.qualcomm.com>
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2331;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=woBdEwaHX80T54ZP+4+AwPFb6N5jfH30MDJZOeEVaJA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDD/mX5EmXCmzYenUlqenAJkkCNjuWXKTS7fGk
 KZ4tA4YyyWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagw/5gAKCRCLPIo+Aiko
 1X3ECACkeXKR3bKG4xY4b9e76o+zsGsxj8BCc8Mpl4CSpOHf1WaPA/GKwVTgjds6Y/+tIMfUUMN
 dnchufZ/JTNKyWTX/XW3pohL3KnSoZgJIS1wE3sfqJQVKbvTxhxGA03BEora522pFIupaYlzc+3
 NC2gXGt1W1AdL4+fYnl6XxkVb7j+UYnpNZXeLtTY+fzg497DXfmTQWPXOFSK1siNDIcCaSG/R1a
 iajQLU9k1i9tDyyqfIwwzEUxBaVSfV+WBA7070sDMnutGucU/nPn1ymqPAvtTwim6wIPqf5k74B
 IJzYbtjALC/jFHgWxZaVp+YdG47OD93ZsbI5hTGh8LgKLzT7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0c3ff3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=izqt9FH4em4ppUy_EgwA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: hMI26XdC90kVIjGyELLP3H1J0AunFdS2
X-Proofpoint-GUID: hMI26XdC90kVIjGyELLP3H1J0AunFdS2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNiBTYWx0ZWRfX/IfgJEFIWrX4
 3fhITxsYHTesY7B0mMaMBn3yz3lebcK7k04Wk5XGxs950mG05LaeIRO9LRdwBlVi/Z4FTpbYVuB
 nqM+8VFmzHbZehLvOCDdvUPwyKUR4jpEBMGm2ZD1QVU1dnMVu4qDDcml3hSsuHZStPAMCqtv0/h
 wZ/Q/nKeS4YAywzHcsdcHOVhLcNBCR1XKhIvxFkhOMHxR8ZeWmEHft4XuDYIFAmZpopCoucviYw
 +zApdY1wWDR/JZrQmddV2qzjz5xu/ZmWe09rsp8vUIMJjxPB6UNxj1Divx+LtSBio88nDRWKsrm
 op06IrE+INjwdZmNxglJG2gZK6WCaF0+QZWHVBmJrXmO4zDJJ/nwH/Mnrjck5l35MydLpPk3Qyn
 R+fcPt/8XBs9mv3xfY+/1gLsDs0O2ViD0F61mjneo0xCXgtDzDVKdvsVX9Eo/4J4L1BPYs5QltY
 2WjyyTVJPaqwYlUH6OA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190106

Instead of specifying the VBUS supply as powering on the Type-C block in
the PMIC, follow the standard schema and use vbus-supply property of the
usb-c connector itself.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmi632.dtsi              | 1 -
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts          | 2 ++
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 2 ++
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts   | 2 ++
 4 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pmi632.dtsi b/arch/arm64/boot/dts/qcom/pmi632.dtsi
index 8c899d148e46..b0ed35094a98 100644
--- a/arch/arm64/boot/dts/qcom/pmi632.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi632.dtsi
@@ -69,7 +69,6 @@ pmi632_typec: typec@1500 {
 					  "attach-detach",
 					  "legacy-cable-detect",
 					  "try-snk-src-detect";
-			vdd-vbus-supply = <&pmi632_vbus>;
 
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 1203172729fa..22baee407fbe 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -323,6 +323,8 @@ connector {
 		typec-power-opmode = "default";
 		pd-disable;
 
+		vbus-supply = <&pmi632_vbus>;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
index 0edb2992b902..3223884f9cd6 100644
--- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
+++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
@@ -252,6 +252,8 @@ connector {
 		typec-power-opmode = "default";
 		pd-disable;
 
+		vbus-supply = <&pmi632_vbus>;
+
 		port {
 			pmi632_hs_in: endpoint {
 				remote-endpoint = <&usb_dwc3_hs>;
diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 466ad409e924..0f23eaef01f2 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -251,6 +251,8 @@ connector {
 		typec-power-opmode = "default";
 		pd-disable;
 
+		vbus-supply = <&pmi632_vbus>;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;

-- 
2.47.3

