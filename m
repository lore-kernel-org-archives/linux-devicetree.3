Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DF4379EE1
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782378844; cv=none; b=PJuNAHYPft7k/zgVM9T5fnviTOqDZoFtv4SYJzhbct5YrhqKeIH+vive2WoTxMg+9YGT5EdfIuDHy1wjob5P8FQ8wX7uUJdBgls7wcGwWo2wpcCzNIJXSAiuFU6Oq1y2rZLbPFc3jo14ajWI1kCHxSAcQxoG8TvaHOqGQjhy09g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782378844; c=relaxed/simple;
	bh=en4xdYDW/tnGPMQ48tqOKIrl1OcXtOdwWtGAIvSiC2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WFqZjz+fNTtm3ZW1bc3/a88gJuvsdD7ta1mb7AoW4Brebv5Jcl8jWz9QBjNEd6P/uOuhxRr9pIioixbORxosd7SjhvKRRH+mx1NJsPItjPahupRgmNctEf16wGRShRWUpPXKlrJFF3C2kiLhFck3U8Blhx3yLcanGhwi1jl0IVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c2bZND0R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QZiX15d8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c2bZND0R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QZiX15d8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8q76G1601205
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sOLzOShEjuYgUh8L57a90PA4bqQtCVepg5o
	Kqqiaa+M=; b=c2bZND0RWQHpF3L2dJ0dv6Dl3/QlVETkaQvY/b9FdXJa9Kom8R9
	BbWrwfcKfk3ieyFCameOW+gTBCEcyiptktJA4ejp5h0qeClttyNoj/uSPCevKbWb
	A38KRGhUlJ21NrreRq4GSCuKbRD3fqNesfziYvOsHOPgl4+1+ESUNZAIdjvRPZRC
	UeFl81jiKPh3W8StxFwR0rPgMTleeC/8CU7w3Q6QAi96rlkmpzGlVikRnYWs8mYX
	K3rijrZGYNkUySNqvEu5Aab1TzoyT3OlDDIA0shoVmWJ0Mb1ucNExrZ54lheG9m4
	muZNliyMw104nXKXwlNw6n7LwAMZorO3y4g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0j7dujej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:14:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91931144870so383281385a.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782378842; x=1782983642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sOLzOShEjuYgUh8L57a90PA4bqQtCVepg5oKqqiaa+M=;
        b=QZiX15d8/kCDknm6QNGbZxe8tP6urFQ5DcnTNZ3fmt9GZG2xXKRWMly/vobJk2r7Z/
         bt0R4wdrSnuArMlW7kIha0ntWFjb9oWcPTI1nTY2yHVKnSgG1++8tj3L+mIIq9y0gfKR
         g1qQmQHHcDqp085bid9cGQA97OOq5dqrkFzjEZkHcpPpfsk7y+SwMCspkWCbKCe8OdoV
         l1ZVZqdQ09qnohg60hibWj09u9WOGPFykDk+lJZDhtnuJXGmm7Fz5K2oJHMyVKKCOOsn
         AbUggmW4suKUa8Gbcocs09hcN36bu+Zi1UsZG8pRWaRAHJ5bacQfdXUYL7Kw2VyDVFy8
         C2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378842; x=1782983642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOLzOShEjuYgUh8L57a90PA4bqQtCVepg5oKqqiaa+M=;
        b=jSMmqdTFC4YTbDVS+CrMkVacRtlfyfjqUz9tK+SctRSfz2A0Wdl+cSccQlGsT8/7G3
         /FvB1Fgt9stTh8B56X9IVWJjGpz+q7XefL+tinVepOYpCkxlREWR8+t/XTEcwxWoPF2G
         pQxWuT+8OYgrusRwV7bn8hzyqzljVq0a50Ao9GgUDZcqyddfbPPElIsw0OY+56oIcL7D
         4bGsKZtNO78YnhlJihDqZSws/DDIxCxay9IvZ7+pDv3vBi3A8zMfoL09Rf1Sb1hX5Kme
         NW9fDFek9jy+TwQBj3ZdA5bOw1rsaOAk6ca6qz8pv4m0QyKMhZxTrAYCt18p+X6Fv6n3
         fCIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8TYhofQR/R9E+FnmfIFhIxuV7xVFgBZ2xKcmRGO+Js5jGEj6QTGMdqyTyowvXATU3mmAKH9lV/Dllp@vger.kernel.org
X-Gm-Message-State: AOJu0YyMz9T4HcMMAbQgelaJxnYWhKGGJkwPOIVq3i7KwIEV0/8NJKW0
	D8buYAKkOXm9jSyFex7l/IUkgsRQR/oWBW/0bIPld14dllE4XevpzfyhgtbXtQwYQFUQ4d6qOci
	WTT9dMEAAPj87Fm7r6z7+vOBHmo1SFeyWeToBr1Q9Lpi3mCBJig+t9i9Ep/ABndxJ
X-Gm-Gg: AfdE7clb+TVi7B4eDFUIo0HNPNXeSPm3ogapfUtv8BtuQLumZG/VKe+d0hMQj0GRrSW
	8/OoPoyX9h/Itjx9OVftbMP0w90/06ogpPDVq3xm9tGEopZm63Tg5zag0qDXkLOZtqUc8fn+Yu9
	5rd5B+2o1TL7ZLtZNflruXQsAGbjbHzEpYm0VZ7bnxmi05VihFBIJCh/24H/BV7epKaIskFA33T
	gy9p7cx4AOP9xIJo1v5gDQsrW6XaayDt/I7CAZmG0Rg/8lRMXTFNTEa3RaQK8uPGfDjR9B0LhxB
	+BPoOthe0BOi5Nbp+P9vouxYIwyrvecT37tquXPV94B1G8y3ky53LR61pqSSYCqBML1ghyg8GLQ
	YFrit6N/V9PaCFjSY6LG1Bmo67UI=
X-Received: by 2002:a05:620a:4507:b0:915:cda5:2805 with SMTP id af79cd13be357-9293cec6496mr219778985a.52.1782378841560;
        Thu, 25 Jun 2026 02:14:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4507:b0:915:cda5:2805 with SMTP id af79cd13be357-9293cec6496mr219775685a.52.1782378841129;
        Thu, 25 Jun 2026 02:14:01 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49263f9c59fsm109995015e9.0.2026.06.25.02.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:14:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: st: spear13xx: Drop unused/incorrect usbh0_id and usbh1_id
Date: Thu, 25 Jun 2026 11:13:56 +0200
Message-ID: <20260625091355.107054-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1620; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=en4xdYDW/tnGPMQ48tqOKIrl1OcXtOdwWtGAIvSiC2Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqPPFT9FosOUrlRhQBfDSnt4DVLHwW4qCDda1A+
 Uo8my+67c+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCajzxUwAKCRDBN2bmhouD
 1wW+D/9YvOOw/wE+xXFSqYhV3a4vn8KmLqOon0BYGD374ZsneeujkFUT3wpTStXTE9jL7cAYe7L
 U4Bp0r6GmjHMFKetlfQahrswLjKXadIgDCyx09nk1kg+XOeVS1gpf/2QpuRcNvz0BScK3ofxibr
 vNrmfGlrfMiyWQzGkyf19ed690MkCBiTfAZp5l4R6WP/xce3tKuea3VL9/dt47KRtJ/d8Uo7Z6d
 Hrd+1FdaBDCbOzeEi770gAWNkub4IGeV/d5ZU23l/JfPDT38w8dtL7ahTM42RKV8+HXMUz0NFmZ
 TRCwx3FMLB3TVteH/2TRLHQqIib3yRCEDPUQ4Lp6YozdMUVVUCo22TvaGDcJ+C5eEl90HoHC62Y
 y13VbMl5FJtE+NqDMeETWUMwqf9u06hgmphxCTExbNf6k/LUGTaChrlbEXFlTHnOo+ez+C8c4QI
 n5Sw851wG7wPa6iXvCgb9AMm07dE8jGhENXfXzT0BH41ZjBNA25BqFrswG5nsyuH3qS8SNJwMEG
 ps8S8jPynfzoxAMEMH5ZC7ubJoDiA8e3Kdtv3/9DyTcF/ENgXD/nEpbnmpXgMb/cuGDqZMrqn/G
 Df1Cp0vB2UXSs5ADbIlli4h+td52URoW6qZwjBxD6GFdZSeFiyg6AfywrMhQfScrrRckMZ/4yTP OAaE2/2qG2+Mvbw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZmPFHnUC8hOX2kjY5xZDXlp0KD9Pzl2G
X-Authority-Analysis: v=2.4 cv=NvHhtcdJ c=1 sm=1 tr=0 ts=6a3cf15a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=rKRmnjq100BRpgpmRoYA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfX6XMb8YNULlLy
 8C3KxjiF0xDPO7u0T7DU55H+2Hlty5MmwbHHJyUu7QJpCYWuNz6RGKulKrC5esOsNEC4efJxhq1
 5vOupjlcuCTocEqHSqMlOsbJ3ZfvFII=
X-Proofpoint-ORIG-GUID: ZmPFHnUC8hOX2kjY5xZDXlp0KD9Pzl2G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfXzeuC9UEKtrwO
 lDlUWp0pu93k0XG576/M0Gmb+AKACh335EF0C74qAPg+MK3uzanjOxUb2M/icoGkwlJHGsvvU98
 /FecG3dXZxsUBrJIjnFsDKAN0CiTaxFdgj9hZDaWNK6iqg+bZM1si/EhQYDt4GfUWAmYFKobkoe
 DtQds4pYcFgVRrihePI5GpXKBOHUwkYYk6UZtqovL3PH0CZkNr1vs3MUYTRVReYyCxxHKD3Cni7
 MdamweEIfNAyBLT6l10UJfkdjlC4Z2UyvXvQ+oEq9Ahmz5Da537/qrohZ+LoiXNHrZvXBtCnwH4
 A8O6HyFusrZ1RmctFwMrp5EW6BbcbFD6v0WinLQw/w6ZvgcDiV8RhvgnEJljvTJajknq8o+Dgmy
 30e3Tgd4iTVxIs0WffgZhNFblncn23+Dkn1UZ0ujp7rqPQrD1AXYm3pGZ/ybwc77qVg1cpu5UTX
 9iQcDTSBrCZZjRcSEuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250079

"usbh0_id" and "usbh1_id" properties were never documented and never
used by Linux drivers, thus should be safe to drop to fix dtbs_check
warnings like:

  st/spear1310-evb.dtb: usb@e4800000 (st,spear600-ehci): Unevaluated properties are not allowed ('usbh0_id' was unexpected)
  st/spear1310-evb.dtb: usb@e5800000 (st,spear600-ehci): Unevaluated properties are not allowed ('usbh1_id' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/st/spear13xx.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/st/spear13xx.dtsi b/arch/arm/boot/dts/st/spear13xx.dtsi
index 0bb88f2d4ef5..cf98160ba268 100644
--- a/arch/arm/boot/dts/st/spear13xx.dtsi
+++ b/arch/arm/boot/dts/st/spear13xx.dtsi
@@ -178,7 +178,6 @@ usb@e4800000 {
 			compatible = "st,spear600-ehci", "usb-ehci";
 			reg = <0xe4800000 0x1000>;
 			interrupts = <0 64 0x4>;
-			usbh0_id = <0>;
 			status = "disabled";
 		};
 
@@ -186,7 +185,6 @@ usb@e5800000 {
 			compatible = "st,spear600-ehci", "usb-ehci";
 			reg = <0xe5800000 0x1000>;
 			interrupts = <0 66 0x4>;
-			usbh1_id = <1>;
 			status = "disabled";
 		};
 
@@ -194,7 +192,6 @@ usb@e4000000 {
 			compatible = "st,spear600-ohci", "usb-ohci";
 			reg = <0xe4000000 0x1000>;
 			interrupts = <0 65 0x4>;
-			usbh0_id = <0>;
 			status = "disabled";
 		};
 
@@ -202,7 +199,6 @@ usb@e5000000 {
 			compatible = "st,spear600-ohci", "usb-ohci";
 			reg = <0xe5000000 0x1000>;
 			interrupts = <0 67 0x4>;
-			usbh1_id = <1>;
 			status = "disabled";
 		};
 
-- 
2.53.0

