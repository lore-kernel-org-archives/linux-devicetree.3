Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C5C3CF049
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535624; cv=none; b=hRariVm1Og3r0O/jGVGqvVXhuJ0KQGqw/w+OSzVTO6TGpzlUNIdsf03XVYwzKwXi4Xxvfhj9CUwQ3dCEKZszzyR6d8G3uobsvPnBOue5ofgH3xGszWgvm1ABNQvyx0bNWG/d8HgnXc7ur3jxxovgNZsCxW7gFAMJzSEsPsIrESw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535624; c=relaxed/simple;
	bh=LguZjT7GKeUUgrj51jQx7Dm0HFaF/8/45Y0SLA/wlxc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wbr/KUGsYmiRJfBZsXuz2pmFtqOpp6XNb73hpx4ZUIGUFrW6d17LWf2Tyh4YtlFfz+kjbS659t+KSEI2tPqK4YNGrENPgAAGZm0zaJVdLy/wOT2L4IUbMdUF20+wQNpbj9p2TFcdw38Sg1xlN27RFm01/pMP4wKSzgoaAt0qUPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TgiQ0gpR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A3q6HSE3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TgiQ0gpR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A3q6HSE3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RW8W1520159
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NfCf51RUqor
	XyFdsLGdUkQI+nh5Md50HAkZl5LCPKlQ=; b=TgiQ0gpRl1uVJFXlCuHqBR+t/kE
	0rcRDizbw6p1LpqnEqV16LB5z7n09pK3ru+4QI1V5TyFpm/9OO+DvLZuzq8uisDY
	WYQvxhhXuktnpHzXhIfczeHNAp/n46dyNqgZsUBum/TbZup0TW5LwFnEmRKajTCS
	bFRQ99ldAbk3h/jfRq6lMLZPWiHPOaQuhsNB7bsncDLASXJWnn0QVhUMrxLkxCta
	3CBV/WVqNiHhSumZq9E0o86l66JTG8wlIgMIkUoGI9hMvICIVLKldDJFVWRbWDZr
	DRU6TfBczFXMfKVG/9cQ0CJ/+9MjjfH6/fu0s4Wcmk8iywQqIe6YCRkYasA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2chn51r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:20:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38105cc58e1so2410296a91.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784535619; x=1785140419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfCf51RUqorXyFdsLGdUkQI+nh5Md50HAkZl5LCPKlQ=;
        b=A3q6HSE3n3Kf46HZFOcLEZbfuUhaDhUZYXbhV1gzJiFBXKPI7tcoatP5pjvldMts/3
         XbXZXS657x+SpTEAajf1jg1kAUI+T134fuDogiR2WDnfBdMmohk0dmBjTldRuhtdxWVA
         0/cI63ja8Sckkvkc8yf/Wl0ZfyWzs+cuyDzoiFPc81JFNgPGPol/0syZ1jKaPZuNwUzq
         pLLIAiOD1uHRwfwkAAU/IVCIL6I79nck/pTPlVQDHjSPsnFiXIwXbCqsyfsaLEQDKcx3
         2l5zC/iGy7QqlsXu83TnjXQffi1tZcqKtNC/4vnYGvIl4EF1ROQN3UAl4GsXdfxB8Dh7
         aE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784535619; x=1785140419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfCf51RUqorXyFdsLGdUkQI+nh5Md50HAkZl5LCPKlQ=;
        b=X43dtWlvJwvP5OO07KB0BtU7rB2bBRrDyjnJasT+1wyhFO6E0Bbedb1VWS62PUNen6
         FsMKHe+iebKotiKoV8xZluwfjyB5lqbFoMdE6U9R2v2/Q8q6eZnerWYqfTQSC1d0Bx4k
         fwNt5mTInpz1yPZlx4xEw2Mq2zDo56dl4i8Opq8W3yWO0yhjUl+cj2M4gdkfaD0Z3O/r
         tx+QuUdl9xwM8eTeyRwGNJ30dbPBVuTyVnF6ziB4mJs7EgXBT/vMKGWXiJIvaWkwA93u
         UMs2eNDSzCUrHJtBrwpkO0vK3qfIO1fYB/sJ1hP69czTOQAK9/Xpvf8iWUoDOofbZXr+
         euHA==
X-Gm-Message-State: AOJu0YzBdMsDL5FDHTnpd5GWEjl37HsZblQLrt+H9+aBYcTR5502EEgy
	riZI085L6ltP/zdmVqg+gu3a/uu2bc5iAdm3lihgI2p3iE1dn9d7qw857Rh+ejE+Vw6+qYbtcEx
	9fUAmHPeE3MfPPTmMGe7MElmXV816JTiYAB+C4yo9Gl7R1V3H2wHTm627MIHF1Rij
X-Gm-Gg: AfdE7clSC3lJvMXwZHyvss/Y3j7SHP+sTGoW3CTjcWlJebkOApgJsPZGmuS031j/CAt
	J2y8jLXzDv3KYGCzvWkrp2zSZMISmqMm2C4BDoydCEz8FVK+lVY8na1WJ6YD5s86sotJ/BFEnJ1
	/kYwAPd7SyxNH1cyz5Ep7Mp6MRKJRua0ugN01SqRS64aGoEOaOLq53w83tj8Dd/CVRFPSm7V/iI
	tOMPb+UvhfNpQnkZasTZIAKWBOADdyIaw4p7d72G4lknNWzOd4nUoZFxAoCDe48ViVLcdjNrHwG
	9mFMvG998/IP2UVNacR7GhHXi2DbkdprtFDqtOMMrPYjJlhBJ9njDWxm8Hwr4dQ+U8RVjtUzUls
	OTlH6G6rWo+onDbvjZRv9uUw1NAz5RkQ=
X-Received: by 2002:a17:90b:48cc:b0:381:2788:a437 with SMTP id 98e67ed59e1d1-38e4b45428bmr9482083a91.1.1784535618686;
        Mon, 20 Jul 2026 01:20:18 -0700 (PDT)
X-Received: by 2002:a17:90b:48cc:b0:381:2788:a437 with SMTP id 98e67ed59e1d1-38e4b45428bmr9482052a91.1.1784535618141;
        Mon, 20 Jul 2026 01:20:18 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39e0531asm7233688a91.5.2026.07.20.01.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:20:17 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        faruque.ansari@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
Subject: [PATCH v2 3/4] arm64: dts: qcom: monaco: add RAS error source nodes
Date: Mon, 20 Jul 2026 13:49:53 +0530
Message-Id: <20260720081954.1858180-4-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
References: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MSBTYWx0ZWRfX7au2aoJ/g6hF
 FxlptEZPkYnTFg1UL20Cu5iCQDBYYq+qgoKav4aYbhWoUJStWyaQ+i1hSe/W5DLqsYDrDmjuPec
 2ozD80DA32am6GILCXsPV48snaQDPg8=
X-Proofpoint-GUID: NZO9hj-rTt85CUHMNnj8NkxhuSqxzQ3F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MSBTYWx0ZWRfX8y4FyYPK86V2
 hOlm0jYY9I8+SfAH2C4T61OFCmINw0bAtKtdkD3VVICYCMX7aPy4UADJgiaZxXIf7WjKA7t5uH+
 f7003Xxa2wzuT6lCpUg6islqLyX2Q9uN6pWZ7Qe7Ly8Tjm+tw6kHL8ID44mHhEgdSMpJG6a2Jhj
 z+wU7KbA8xZ1rpngPaN7TPsX07vmJvSTuNAM/Dz+4eJs3DzqKnEKTS6ta9X67LftoOApHekGEHb
 PM1U8kJv1Edk2XZTCwlrmkslU70A9aO9d0M1oICOQoGJH9Bbxi3UU9dvLUiQJugVxdyRKXC7txR
 jjf7B3MWkPGaWBt/FvBhEyjbthfghtejPr7dJpIwzQt/0d8wX7/2adG1nttr66ze3dFQqU78ffV
 P3rZeQsxXIMiQcimnDEuuwzFG6QX1mCvU56wsr/Uhsju1/7ZkG+8Rw3ka6zrPodNYaNJFksJUzv
 BfsfPY4zy7OU3sGTxdg==
X-Authority-Analysis: v=2.4 cv=T5K8ifKQ c=1 sm=1 tr=0 ts=6a5dda43 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=hf7YQE2i2jH5Ah-ZJM4A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: NZO9hj-rTt85CUHMNnj8NkxhuSqxzQ3F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200091

Add RAS error source nodes for the Monaco SoC.

Two processor error sources are described: a per-PE node covering the
L1/L2 cache hierarchy using a PPI, and two shared L3 cache nodes for
the two CPU clusters using SPIs.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 64fc0d592282..4fbd1dc9a147 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -724,6 +724,36 @@ system_pd: power-domain-system {
 		};
 	};

+	ras-l1l2-0 {
+		compatible = "arm,ras-processor";
+		arm,num-records = <1>;
+		arm,record-impl = /bits/ 64 <0x1>;
+		arm,status-reporting = /bits/ 64 <0x1>;
+		cache = <&l2_0>;
+		interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "fhi";
+	};
+
+	ras-l3-cluster0 {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		cache = <&l3_0>;
+		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fhi";
+	};
+
+	ras-l3-cluster1 {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		cache = <&l3_1>;
+		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fhi";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
--
2.34.1

