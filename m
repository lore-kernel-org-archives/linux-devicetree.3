Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0CC1AE877
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 04:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775795170; cv=none; b=cne+JCMJYiR5DBwP2FghyKNQPUsz+8ZS5X0qSJySNw5iWBJ0i7E6yx0EOqXTHVkuARuzVdDb4ozOVHcJYiujFiPTVNlibd8NBbqGucQUHJeoWXKEJoC5cBLBQGlnTkbSF1rg1VM/XMzn5go/BlZk6I8cyRNfWkUd5XwWObdlDfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775795170; c=relaxed/simple;
	bh=V4wUSuWV5Yj8ZviHFpqjcBhwd5DsUzsCPP/vHGseUdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cjpgfa1uJHKpnS81oEQbOm/3QpJRlWUlWCmR7j8HJHtH0QrC38v2UpT3B2OE/59nIEpMJFYiqpUJX75iSLKePCWdOLkNYJs9HvoicjtlfRIT9igZUw0XouvIZUDnXj2cVJPQWUhg37A9r+NQImZzDbarwFe6uZS3pR2kA2gG1vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=km358ngl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JGrdefKU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="km358ngl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JGrdefKU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639IEbaI3352631
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 04:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dEFky4Kb0KlYAKdZcdXNgekS9YRdlktHQ/T8MvozGl0=; b=km358nglaE08mi/G
	ZvE5bWnmvyIPdLi6SZ4dLR/qW0eCX6qmx8RBajSMcM7TpMXJQqWXDrg1+slEqLtG
	6Lbw1vsAFau1JIdzYpywLye3bLXai/rTTSR5MBnWwyNDvDZdM0yKKUCYtxmM+dGA
	5uEUOYOJeyjH1aMdpETrtWNgycn2m6IZREJh5G3WF/+0ZNDEWbEwm/+8OfpzHiqA
	OqQ263Tm558Tkhv9QOTkgcES3A5cOEu+43taRXreCAGMExMoBHR0rXPMRDuUP90L
	1k3PCmsqK5B4KoAjZg/iflu4HfTPVEWaDYXdZ+WUwwd0vSjUZsPatLJ/UhCmH+Ec
	GUGY6g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec1qtw5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 04:26:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d3bea3aa34so346465485a.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 21:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775795167; x=1776399967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEFky4Kb0KlYAKdZcdXNgekS9YRdlktHQ/T8MvozGl0=;
        b=JGrdefKUcwBzv3eh2nNMagVZq5QHOQY2/nx/O22K1QZxjCQxLUa+CJHBY+jYi8C54P
         tJ+sULBKTxC7MarxQRJsrSm/mI7Zkp6q7f6+2gyTw2QOD5IPTNB8kmMlmebmPrbioaar
         0/WkSws6M7xOdgd+BF2csgLv/UaNB30bHDRf786yjMFPUg9zJXN4CSRJf4rkRzlGi2rX
         ri2yyFAXppEacv/XYujemQeT44f/8Uy7pvCE1n65aJFKy7wbh6WMehQQGbLgHL04N5lU
         x2gP2BptOjI3rXVaC5fKknNNA7U0l/cndx5rFaInIwzNi5TAFJasDpFAw7AyL0lYI8GY
         K9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775795167; x=1776399967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dEFky4Kb0KlYAKdZcdXNgekS9YRdlktHQ/T8MvozGl0=;
        b=GcIm52BXvBJ2AedNyWO+Crng9eczAjeYIDgXfA7d/pgYkpPwvKz8SzNoKvOn3RqmIS
         lu5jZvO+4M2MqAsjAY7FGoWqKp7DlLCD2WO58TeFqTAOHMK65x6IA/rzeksbWnD8CXgE
         2Hha5S4SeRDYqtlU7qBLYXM6hdeuAqMBR47hjBWr1n3Hf1y2PVj1lYu0FY3nYuFE4cb3
         +JhpDn85FtKDRQv9sajEiXxtXjNvV50ZrKeI5B4HUCRweDOadIhisuu3QTOg+cVi/drS
         /XroMV6ZdG8ASSit4RVCOPbeAKWKxu0uGyDwCaDbsTsqDQYdH3QGgA4WY3staUqOO3sR
         cFrw==
X-Forwarded-Encrypted: i=1; AJvYcCVERR+aF8kAtXoEXQx2L+4ejlcugmkOQSA06QulQsf/8WT7N0M01/HUed2u3rpReDaHo2zkcX8g/otK@vger.kernel.org
X-Gm-Message-State: AOJu0YxECIZckBjrha49wNSfff5uPdcnxhpEMfa6Yjf7qF74W5Dpif+A
	6RE9gFRK60rUA2wd2qN7dmoJ40tJVESaCRviItylSupXHf/EXG48CBrw8oL1HMw+MxeoWAfWqNZ
	ehSNbW00Cep4GETYWgIILP2six0iUlwOhTGgJK2xw7p9Tbr8HfHNPXG+0g9WQkoPY
X-Gm-Gg: AeBDievKSJJTRFqdLtJAAux2Kq9QdGd8ptE52qK/u/mZ4/y1ld9iRbZ7UyliAP2NisC
	z7DlAm11HvyZzc9kaOq9EPL03RBcfUQj56ZP149HAMHLdPrNWpRpqgACN2jGhJcrvJBe+U9B9CC
	uqbL5/xv7IA+a22jI7YOow4ZaNTRPYdiVXxwSDdpDveaiNUNM8Yl/0ztvZU5I0wW2bSTeclg1R2
	+Rj7kSYWmgl1tiDLCIOKjQHKbQJWlwXSJwGRlPeCIo8O9Av8sUUHVun5NCW22ixsb0yk09UePlg
	Zg2gmYRxu33IcPAXr7sVwlX1WBqrn1fBnmCbWAd9NqjvuGwoyLanw7gqrj0ntby2wF7I0Cc9wWe
	qCa6JEhRi6P+M/835QL+TbRAb96N2Yf5EDX1YcBEAWxo6dClexvopv96sgeOKNUv4C7pSuONvaL
	cb1GsszHnPbTyh
X-Received: by 2002:a05:620a:4588:b0:8cd:9665:9ef3 with SMTP id af79cd13be357-8ddcd8f3ce7mr223448885a.19.1775795167071;
        Thu, 09 Apr 2026 21:26:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4588:b0:8cd:9665:9ef3 with SMTP id af79cd13be357-8ddcd8f3ce7mr223447085a.19.1775795166624;
        Thu, 09 Apr 2026 21:26:06 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb934d8e9sm121757785a.35.2026.04.09.21.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 21:26:06 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 12:25:34 +0800
Subject: [PATCH 4/4] arm64: dts: qcom: purwa-iot-evk: Add camss node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-purwa_camss-v1-4-eedcf6d9d8ee@oss.qualcomm.com>
References: <20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com>
In-Reply-To: <20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775795138; l=686;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=V4wUSuWV5Yj8ZviHFpqjcBhwd5DsUzsCPP/vHGseUdo=;
 b=+/fSDRh0kjqtmsEO04q71jhgtPncaUSiPf3yzSHP+H+PJ1RapKljGchMMhy02a6/c0SKUAYLH
 oRah80KvIePCV38PMBsvI5aExbf1aJ1azxF0EPkqXhA6lRiFwTkX5D5
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAzOCBTYWx0ZWRfXwyewZaN/fdAh
 Qkrm1n+2wtTmFGkTm1sLXtO2PwUypZY7ggV5Vg9C4o+O8DO7MJjQn7VZTMMYD1QH5wRgRiSB9H3
 gcbh6r397e4oZrfG6FTZcGz7vsMv1SJ2TvI4xYFlCvVdjyq7bcRlU1+QoPHk322p+wFot4w3xnr
 BQgrFMG4q3xYysyMC2WJmjRMF3Stq7tEkfH/ycBtfvyTWz66keiG5VRBg1YZTl2yHKUYPsp/A1y
 Znw3SQRzTOjiJKueSm0hEIefCjr5bgHrFmLhXbg6bib36CJ9wGVHTEFRdP56YsXzraT0YwWVlgA
 jKbiEniGQF9ABH/KJroqhobSRZyJ2VI7NfPGzTe19uttMJsTYg68yBkXFuxfVsvjrPQRXWPhWHi
 i42Yi+isOVhHAA0ZmTxQvRspIwxgY59cMy59rwDN+R8utgwg9R5I+ipHujKTwfrGs1VmLR76ZBn
 QfwukyViD4JZjCSV9MA==
X-Authority-Analysis: v=2.4 cv=eOcjSnp1 c=1 sm=1 tr=0 ts=69d87bdf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=fhchRTXZpgtNQ5V_lqcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: j3C6qnX2ODRSQMSF3AyibaDQ8KT4yfUx
X-Proofpoint-ORIG-GUID: j3C6qnX2ODRSQMSF3AyibaDQ8KT4yfUx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100038

nable camss node for purwa iot evk board camss tpg support.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index ad503beec1d3d8c671d3564942a74c484de762d0..eef03f1eb2a950c06294159be3f97169fb487265 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -734,6 +734,10 @@ retimer_ss2_con_sbu_out: endpoint {
 	};
 };
 
+&camss {
+	status = "okay";
+};
+
 &i2c3 {
 	clock-frequency = <400000>;
 

-- 
2.34.1

