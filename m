Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8BF397352
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778648618; cv=none; b=JejlfE9EzQKtVkQOTUzOCVxLPbfuDGIqDSo6MsAQoPsIWld5I8mMSmW5CaT4hMkf406tdzKndBNUKCWmJOKuNcESf9047QbVMZIPdmFNRFkbhtzS53POZoP5p43AQ2ogqdiYCjQnq3o+8s4APUOSFAGJLMtsLBTRwAV7EmIZH00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778648618; c=relaxed/simple;
	bh=F+4zeyZQRUh8+1D4DZTjH//5aeCfZaop6NwbAXHXMls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rH1ws61KtBeBB6mg6di6wNRKzeEVdtmm6H4jX9fNy9f7oAxVVeT/Ikfn5s6xfDpXHUAat4t1ZAP/FFStAMJX0NTGwY2zEx4i7pCZdfC7kID2HGjJnB69GyJV96wrI/Na9uK2yEDpnTqc6xLGp2gt4OJ+hqu46CHf9dEH07BBPWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Urh/rZ9v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hnVvxsqK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Urh/rZ9v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hnVvxsqK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4pA3P978165
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	912d/SKIOjFeJPU/yJE/6/YSu7q6BfQZzsgrT9goArQ=; b=Urh/rZ9v0TubZEQh
	nKi1t3/mlna+KQdShqQqtB/f3fSB0kNxJJ5G31iqAaSqirPbiQOefQca1oqOIq5E
	EMVpOg1U0NAwrfZ6f4LANDSJKr7V0CLhy3A4DCNzv5OskWdY/afJbie4cMJEkLTx
	C5y3Ec/bl6gf69XH6U95f1u0AWR5oX9/hS3VNsNbdqJ4ui3ds1oXe2nCVCoZEmXm
	V6YI5BpJrlsskRy8jfDXFayef8yVD3cspqaJR008eiNikNvQRZiyKOFe8AlKI+sT
	XJZ/fr57KMmXxv9Jc1cPibNZU6+JunTzPSEJQMKfG0A/OvHabFwtqaGLRoY50ter
	F37S5g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e46s9tkbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:03:35 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c828acf7c1dso4197122a12.3
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 22:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778648615; x=1779253415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=912d/SKIOjFeJPU/yJE/6/YSu7q6BfQZzsgrT9goArQ=;
        b=hnVvxsqKKbNUZ4Ja4YECREZkcduZPjP8FXC/dJLdU3XwWnxOumGPMhpZCBGXvGuAhF
         PSjjGBKoCeRhZENdcq+b8pv9aQTeSvxR60eab/VqjzMHa6RUe+tKpX+dBeFm2XqdrgTP
         fgd2g9EjlYSmYCwM1W8jf/38d/s/XmBF/6bHcsVx4jMabMf9iQshi0IaBsTam99xQ5kw
         NzfxSdf17lWxnBa6Fl2ZCeErV3enoEWeVlAUsUd5AW8ktMxCIl7++nK28GolhjowCwDw
         6/tCLfKs+6yTL6eWH5DFm3yOXjp748dlLvIHTG+S8rrapOb2jTmq5LRZdrRZl6wt5tis
         jUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778648615; x=1779253415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=912d/SKIOjFeJPU/yJE/6/YSu7q6BfQZzsgrT9goArQ=;
        b=oSXjHK0s/o8bJyeryMyMfIWCDogETAy08DU6JiXylfwS6z/ivaifApd8U7GLnoT/ZC
         xyZ33jkx540uQQEE4puC5Nu2PBHupUoXVKpbZgYZBw/afA82YOVEs2fbsnc9SJgJhgyT
         cdIA8PnFWYwTEmlMzBY8BdCl/QLdQSRRDaIeZoLW4wzDvuKmNw3hTEUHHC3lczP7QGlQ
         60sdV5vlfinRM2BQUTtIMifCFxV36whZHTZmrM8u1CnQqtDs2ODWJdrNoNVEc/nF/HXh
         NMJNM81Fd0szE32QykotlNFVU3CiqG2emZmf6VOpwcUrOzQJf22Fd4+y0Kzj8B7f8MH4
         8Vgw==
X-Forwarded-Encrypted: i=1; AFNElJ8T3lYszILom1qLj1yOjTI50hPYNYjArbJFh373Kf9bXWuk/6zCCiNKmwIBCJ6dqhZnyker8K6Nogg8@vger.kernel.org
X-Gm-Message-State: AOJu0YwyFZGR64By1CR3y/gD5czBmcTYsGY2aQK5zUoZrSNZYnWlVU83
	D1o+POwNboL488KiLteLSjip4IxrpX+eDubDPUg5vHSPawXlxmiddhKp+8ID+e9yQGcccimWI+l
	fMcgFrY8mj2a/GvfgwLFOO3zVzYEF4iqQRXoCNO2TNyKjOxZGC6plTsnvA75D3/YblIR/TjAP
X-Gm-Gg: Acq92OGjsxDr5Mbgmi5kWvaqucBQjdMAQUrvJG/swBJafiJnl3JyWA+3VMn8F6WDNYx
	SUtI+XVUeUUgBBgxYa8c5Xqj5cugI568n1vXLiISUs2OXCvB9CmH52xlP0KAH49x+BgjTnho6rH
	+A0RONTGIuGL3qm0pkyOtTgcsWYovF+IL731zaHnj99CyUJugOct+yArIiTfTaR6DHnDsHiUrRL
	NX32iuxnM1m+y5sY+mdM3yckOBjlCLCGKOa6aqO+M5x5xHypoSpDWGha63MYZAfh3QYxWQvxuH7
	gdW9N7XEds3mgF5FIeVvbFGElFnU0NX/rrjWCFydfrGFDXV5pNLOqGuEv/Brmu/els9+BM8Ti07
	ZzqjDUNdCEQUWk+kbeXAbWBaAPn783o4HhuMuOfYBo1qdM4A4YlRX5Pa0aT82oI3RT+GUAZ/GuG
	PQEZoWMVpceloDan75jw7++qb5n9eEH32RG+6kScfrHxE8/xMUOAXJ6SLe
X-Received: by 2002:a05:6a20:a10a:b0:3a2:d838:bfcb with SMTP id adf61e73a8af0-3af83288838mr1728857637.40.1778648614736;
        Tue, 12 May 2026 22:03:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:a10a:b0:3a2:d838:bfcb with SMTP id adf61e73a8af0-3af83288838mr1728823637.40.1778648614274;
        Tue, 12 May 2026 22:03:34 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945c1bsm26328020b3a.15.2026.05.12.22.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:03:33 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:30:32 +0530
Subject: [PATCH v10 3/3] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-wdt_reset_reason-v10-3-cebda08ab1ef@oss.qualcomm.com>
References: <20260513-wdt_reset_reason-v10-0-cebda08ab1ef@oss.qualcomm.com>
In-Reply-To: <20260513-wdt_reset_reason-v10-0-cebda08ab1ef@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778648598; l=1239;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=F+4zeyZQRUh8+1D4DZTjH//5aeCfZaop6NwbAXHXMls=;
 b=8qHnZGc7qKMdN6/XYfo0HLKki1/GMR9Vvr3KsZIDn59c8DlLYbU0MrGVq0PRZ3SxCCwvcoNxJ
 jgUCHqa52M2AP0DeFhqTTwaVTPDurL3fT6fkpNqMYpcl+bf++qGXbT3
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA0OCBTYWx0ZWRfX9QROGQblq+OA
 xtfVwQYvV5ImbEGEzW6t9O9frNbCIWi19AXOjBpMEuoQXSlk9xckbFVTKyG3foP+ymesawpN5ly
 wvdVLUGNJYZXgLwc27h6YmMYjKMq0hwgqWRJG6Ceo1P+AEQ1NFSSj9jIkbS6BqzcTB/AECQxzuD
 lXPcIMYEAnjegYHy/Z+wtOnLPs/FiDiaEgfyKXEvxEfAtvKJI7XAg8ZV1kOjbmhqEg3j+U6r6iQ
 ibIpON5q4m8aoBNne1YpD2HT/2GpFZLGGctdc+PIuRMOEl0anMe4pOtezJq0ctniDVBl743qI+q
 tTrTy9YzCbYOna/cV9xMo2deUFAdCfefLFOZGUlw5N38kEBjXd+Jqqdn4o3TTWigC7xWg/aQOVV
 4G/m6qqxp4VjfE1D0oOW3tLlb5p5LvTM+vQzFcAi4oU0i/19EmyyPzrKudR1nbA0l5Pq9WibA6R
 xUKEZ9O+Aztk57jb3HQ==
X-Proofpoint-GUID: ZV40tqdMjzmCdfKPNRHlInmhzatqhA0t
X-Authority-Analysis: v=2.4 cv=L68theT8 c=1 sm=1 tr=0 ts=6a040628 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: ZV40tqdMjzmCdfKPNRHlInmhzatqhA0t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130048

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 9b8410e32629..33ff00990513 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -624,6 +624,7 @@ watchdog@f410000 {
 			reg = <0 0x0f410000 0 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
+			sram = <&restart_reason>;
 		};
 
 		qusb_phy_1: phy@71000 {
@@ -739,6 +740,10 @@ sram@8600000 {
 
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7b0 {
+				reg = <0x7b0 0x4>;
+			};
 		};
 
 		usb3: usb3@8af8800 {

-- 
2.34.1

