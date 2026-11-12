Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458354;
	b=bOcNOpOY+HTxYBnq4g6wQiNNANVD5+PcUWU6Ija9LJch8Sca0RQmnL2ES/QDKJUEYj9B
	 BGr/C1/rOIti+urFQ5lZXHS2i1yztA94btGoa+QRXHXzcrkRrdyIzo3L+atKpVv4ojTl7
	 H6mo0GOFbN9hDeohiQcS0PKOzgu6zCCvUJ2XCeLJrQnitern/DHvzkDXjlNMsE3qkYQ4n
	 TMyUalTetLpaTiYvy9blcVF9RctettmU+Bpu2pGOTqWSLHiHULNcSPynbn4YENsLkQ/jQ
	 BEOyUDo+MgquEsr9eLOUoF/IcMBrhKXr6zxuVFwVay2T0kVJ7eZ9wWqWMQj9g1rznQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458354;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fxy6sGdpDXgQryJhvgb8rDWmqWihFOMf7jh1rczOCM0=;
	b=frUqWmWfah/YKqT4IRVCZnthxz53pS8scp2EQSErZ6aWXmWhnMVAF7AB6CQuAGTLQNIx
	 FMBcCjzGBKlAHlUveJ15pfTBwcX2EYG3NvwfNUnqw42j/JO8UIPGDa/ORqdjq7yuzjR1M
	 WQ70+gtV6cpiIGuzaKCzovY3hl+Jk5WGkojXMnJri7KGs8/vfuxKiZvna4m12JEDoPvNl
	 biq8BsUm9tLc1bJtEucU0fnaDeSImhhytBqsep0Ml7xQ7Jk1QPFqNy0xdQ2KaNW6MxFxa
	 mh1pn/QtNjItgS7MA2SZLVT18R9HfX9LijRAGqPowpiTwgOvHg6SEL8tLNJFjfC+vjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=biVp2lgf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bsnpPw3n;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A0B606B68B
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68A0B606B68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=biVp2lgf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bsnpPw3n
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zd5R3061536
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fxy6sGdpDXgQryJhvgb8rDWmqWihFOMf7jh1rczOCM0=; b=biVp2lgf6UWmyZkq
	okXODcS8qJkPmULCFJh0VFXYy6GqCtbvxrK6ntX3mhVpontbvHvcbp1D/Qx9Qx0y
	bPWn2ZdUrmIPnrogRi/mS1cbMDWENKrXkzTSSqLQM/kC8ohRDYWjERynTT9eXXKj
	pdkrLaahZx9V3hi6hNL3ndn9jLGiZ97QhL4nRJXk2ggNNsDb9zBc77r9PlFmPbT5
	jrspiypmSV5Rv3/QZNrvln5LGmRWM0ytQymznsBmFBVO69NXd4GKafXWdEFEPd6L
	NZBWVoWkF84LFrKjg+nrCVgzO6HeRbAuu3qpWLie4ljxdIqv3FbWPp7x1bQ5pJg6
	65Hmlw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m39bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:39:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7249749eec.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 20:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458352; x=1795063152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fxy6sGdpDXgQryJhvgb8rDWmqWihFOMf7jh1rczOCM0=;
        b=bsnpPw3nTRfBkTK6lZB3ky+YGLJuuf0ki9K1be1sr8u5L8b+C0jdcWQMsRH+44n0ns
         oeCQrxHmjmIk2JVqOzInpIxzuoPC/vw6cxTtsq9xGZB5yrkOte69yRtyLCBaxhcu2YR7
         Pd80NqAlvqcKeP766XU0IxA4mJEeYa924vvkfKH8cPBUx53VS0WW+9XAMJ3Xyildw6aD
         V+fqlJadBwKBVtFBtVOVTIm0nTJLXn+aeO2SIH0Ldz6KqPq2uOyz82h+K01LJxKyaNdg
         xQXxW8YReku6DUxeP2zgH0EnVE8DDTqsuj05uOkAa+rV1MaJUFoa9+dZRSG6RChstByj
         tN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458352; x=1795063152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxy6sGdpDXgQryJhvgb8rDWmqWihFOMf7jh1rczOCM0=;
        b=Dl8acZesdkL32EbPKa9RI4ON+NtGpWUmYmJt/I6dKomexWxdlcBCe0eW3KLvLD285Z
         pkEet6WAQq7MCo67TyqNHY3YcvK7XZ2hVpWGh9Z69SOAmdQJWjI2TrbhMlgVbQ+qbr4K
         jG8ZydU8nO4FrVgpPQLIyQQ29BiZdTt9q+EU61AzwYzw7PHUk+IixcZTrVrJ8iY8raTu
         6LlRAzj5B8FAyNKmt8U4Dc/L+QViM4AupzVurtKoxOa9z01cbQQW50DAQXgxTiRsU7lW
         jpHAT3vackwNn+hr6zGnRVNiokJmkNI/zbdUl5iqeT1Ry1Pm8LNJRplkeAsVu7rjMArC
         4Huw==
X-Gm-Message-State: APuU4Z82wKoEOtZmN29nBPl2XXAhPjA3aMwFGCH5BUKjfm26CCbSr5tq
	CGaA6tQfyd3CrdZ0ceiYk6oMmXHwHpBN69D0l76juvI6unGPfeuTorhrwH94yOE32EfSRCKtHlv
	13Ap++kpNim2oz17ZD5v5QqcZrFNySF/+7YlhnEyPVuPUe9n+/WU/jsIxeUcsSGDb
X-Gm-Gg: AYBFou3X+hngQvPiC6s/flcwnBOdQeW+x2H2SWXmUMkSZ1JlwHCaBaz0tFuuToV4L1i
	M2qea0DaLpNyhMp32XFf7AcF14flUzC5URbzEXOl0nqC+VUAP5QHjHzTbo4F6kuZGNfcb01eZpV
	C4r28BcFsMWYlnIujpITewNwRWbiJ1ZrOfMaRe9+FYQGCg+UrPc9KyaySUU4UEViU+5836j1kNw
	NVWV6CtwFc1IsRqj3VAXHKoDv8iJpa2qEJb1NRfhz7PGFNcedw+ByXSAPpJYiCVRqSvpv8ozIL+
	moce7777bAO6k+UIIln/GI0dTsCaM7iH20weFxsX8sLh++J0RgQtBtcX0cDuNIPn6lbfb+j6XJj
	Twz5Px4u+eJ/n+/JsVHyDEi3loygPgBffpLdz4zfqdGc900WyLQ+dQ9MKyTYv01HFccGbZnWPgE
	SJZ5Up8wGrOhJLLHklQ4VckoReHsETuPFzA3NSi5vZKLk8M6J00oViufOPv19ZwLhQh74JlhGQt
	asJMwPd+1RP
X-Received: by 2002:a05:7301:1604:b0:376:aa76:6a15 with SMTP id 5a478bee46e88-376aa766a79mr4184367eec.28.1794458352163;
        Wed, 11 Nov 2026 20:39:12 -0800 (PST)
X-Received: by 2002:a05:7301:1604:b0:376:aa76:6a15 with SMTP id 5a478bee46e88-376aa766a79mr4184341eec.28.1794458351554;
        Wed, 11 Nov 2026 20:39:11 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm42344790eec.23.2026.11.11.20.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:39:11 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:08:57 +0530
Subject: [PATCH v4 2/2] arm64: dts: qcom: ipq5332: add support to get
 watchdog bootstatus from IMEM
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
Message-Id: <20261112-imem_restart_reason-v4-2-3c7177529526@oss.qualcomm.com>
References: <20261112-imem_restart_reason-v4-0-3c7177529526@oss.qualcomm.com>
In-Reply-To: <20261112-imem_restart_reason-v4-0-3c7177529526@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: _6cBjdKRxmpPEqOX-Z2uGEO8zZ95EerI
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af542f1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: _6cBjdKRxmpPEqOX-Z2uGEO8zZ95EerI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX61lmUwDFHl3P
 5JK3kQYkwDcYqbNRGXDCTLHyTniq2FxljGaSB2FgYMmYn7L8elFZZiilduffKdCyXtEn2WYPFHh
 T7Jzzr++LWmT1AokQ4H1IMi58nq86r+6vPypuhIVZA52fW4frd7PnMDb42BrmCS3dKMUvSY32ju
 mEqOZQPXXZ7gR10MO0xrMT+M/tsrMd6uGwg32TmlPMPLh32SpIASUuGfkXNYywThww1odNLWNVt
 +9lFfvJpWikwoblb+5c1DAegN+uHDeweIxVChlja2hR8UPBFF1V6eFuWgdTHh4mQUXejlxJmAmH
 5LAI+JiVMZw2qPo5Ho+pAm/oH+f4ocD6s/57HwshQktmU95JjpgHejgIcgnGhJfKZIivdOMAWkE
 +bjo1Qascx/VTyHqzG86FTGWiChNfEr5WyRkMEfAZrEkgoFRRg9inEz4xoBdYwWkzYETl5YRP4l
 doGm3wIZ/V4tsdzCdRg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX/rQu5NmIlWtI
 jVaaNkahzDjV0hm8DCQlXdZUyY6yF9lwnuhM1R3dFIIv07nkO0tXpnxpaAKzU0MHNXT2wQHETnA
 qIhfwj//7aSX1CdJrHY2Cpo+KHOSQJA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120018

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

To achieve this, add the IMEM node. The overall IMEM region is 32KB but
only initial 4KB is accessible by all masters in the SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 25c32e966de9..06e08238a12c 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -493,6 +493,21 @@ qpic_nand: spi@79b0000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5332-imem", "mmio-sram";
+			reg = <0x08600000 0x14000>;
+			ranges = <0 0x08600000 0x14000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7a4 {
+				reg = <0x7a4 0x4>;
+			};
+		};
+
 		usb: usb@8a00000 {
 			compatible = "qcom,ipq5332-dwc3", "qcom,snps-dwc3";
 			reg = <0x08a00000 0xfc100>;
@@ -573,6 +588,7 @@ watchdog: watchdog@b017000 {
 			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
 			timeout-sec = <30>;
+			sram = <&restart_reason>;
 		};
 
 		apcs_glb: mailbox@b111000 {

-- 
2.34.1

