Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6783E3C68
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 13:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946209; cv=none; b=F1hFQSavJSK1BUWiFvObZXoXtMk9+w1CC6vy4I3BQOnkEcbk7DMUoaerPe6ZJ2GBsroYTcekAX0x+3cWBRsLjzgcJWoORQ7H400KTZaFQ1cOGy2/w/KChLeb609YMjKJmcRn2k3yrRWPGDUfMW5I/hidpVCVssolvnu6CNDKaic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946209; c=relaxed/simple;
	bh=/w0aJOH+xoiyalrUqU9wOK5XaE/NxE7TbLjMkHrYZPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dNPDEceJRI93aOUuZ6WzdgzZmmH+x/xKOLGTOKxeNXr/GlKEO0HKmh4IvwWT3D3YHuvanm1piO3wIyOf/VjV06QQRM+3+k3Q9KfbSwIjj3tkmRWvBTKmJeovP7L0Y7iths4axhDSshs1bj+jz9p94GHodmBIlbnPWpBJcQN1cuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tjm1nM9N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MyMymbCi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tjm1nM9N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MyMymbCi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nQsZ344037
	for <devicetree@vger.kernel.org>; Fri, 2 Oct 2026 13:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PTzWQCCMyGuhdhfBCadmrc99Mjjl12xgtOGe4mlucRc=; b=Tjm1nM9Nix4buFrY
	zqDLpLqiHm/TvHkLYNjx4aRNMz/3Vv6r7wbe0p9YoqehkFfUcwh1v4ncX/guAvnV
	cNDo6RWkw2fqWv1tiOolR3FbWncymWxwTK+eGWPmr+pjBaw4xXph7KOOcld+vPQP
	y9tTm76RURgLTx49hDPebNyG3AYnvPULH5M+TlR2bTPFp2eK9L72V1Edn1z3/8Tl
	dCUTNPXibgdWyNPmOS0g+MxOoIPYDEmQW1UrbnZbDkC3b6EAGqoLgD+20jaGCtCK
	Kwrs4o5XtKGVpyszJhareqYD4FHn5oyrGMl367vDbef2hb59km7UP+0d8lkAs2AU
	X9DH+Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1rvqckmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 13:03:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so170370eec.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 06:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790946202; x=1791551002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTzWQCCMyGuhdhfBCadmrc99Mjjl12xgtOGe4mlucRc=;
        b=MyMymbCiCtD6Xhjt3HpmL1FC3xqVVsjeppZ+Foid+9+K42lWzZF4h3ol6EVVJ5zN4m
         N/UdDjpAXrrBdSF5ziVNmZ6GaLFCFTFb+nzJBgDlI+zKptVcvPBbzIVPJymi6M+o1luC
         9cOm1BsertXTIrT8SzAWweUd9vHWHkSAPiXGzbU4etRW1bFhdOPsekvluW1VROWsTJij
         OlrvAQvbpJvjT/nPGT9Nx6aG26MyXXx2co2zSNmz17id7y/EmWkCFGEmFpDN3FJubRDW
         /FndYdNVmkdR+V2A3IhEAkYA58FoS5+x60ADiY2trnu1tqGhaljPL+Cn97M6kciTsqJW
         5sYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946202; x=1791551002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PTzWQCCMyGuhdhfBCadmrc99Mjjl12xgtOGe4mlucRc=;
        b=IIkALf7NGdu+dsW43XCUvV1s4D7j/isw2ODnreLGZWogRVVn54PvLAhI2t1fFdatqt
         /bffunEsq2Yt7rjwMOzXuUk6F7fnS/5GlZWuKlrlmdd0fPIkIcC2ARGy1PKe7Fsk2MPQ
         APkFutDEWQLqg6DYuIAcWbK/VdDp8xMbGJvkWzgT8Mf1b/Ij0hsmMRiBexQucA3Oyx2g
         5XL25bahzxgj8EP8vGwpaeVsQ1soGPutyO1u4uhZsibhdz96S/F5jmkhmWo9l3kvRADA
         tm6RhI5W77Y5U2RSiw8ASnxqpbiyT51yTuzBB8u65AEV2CRdpC45R2EFlRkEgq55zvT8
         og0g==
X-Gm-Message-State: AFq9FYK3npUDkXP3P9HJXRySL6txdGWdXK6ZiBSmoCvMrE+/9xtYlDyA
	yO/9yi93CmiGL01LgiOtUcGPcpSBfsAOdUkQ8Uzu5jIhXOlgMpdAFozzd0+IAE1XQNZwuT4ufOI
	wRrbkVco0zrcr8Xu1xfacl3avSsJn32RCBz0CB4ZdSJUg1wnsclj/gcNK8yHUWIl8
X-Gm-Gg: AYBFou3LAM4mL4eUxeipxJYl5HioA3sqnVicS7DI51MqB65vjOC7wn3rB20elyXqSQt
	e+c0NnDbwmP8CeZUXZf4I38wjIEq+/RjOZtaFBFCkNowli4SXjjaKhHvNRywTNM7KPRha9PEy+C
	lOpzgtTsTxRlJdRzvaDDtuUUG7xFv4n0yQGnHyt7kyHKBAAusRXvGjybPetAn3J2VWVNeodEvsB
	J5d10JS3wFrAsiDqChc+uqZea7KGTHhX+es7L2Vqd9xt5PORYVkCkqRRm9j8CGNrtDXCZk6eUaJ
	Ybr3WUmcDouBQnpLqjdD7EYOu5J4JMY2t3zzfDpesQnTUGKMRJ35BAUD2+J1sjWZndbNpNl8ITr
	spRq4/Ur6GJZmSv84oqVCGD09muYsdlI9GmMBtRlq0RF4EtSchdbeH9HHFMmzQACCyHRgPtihXD
	Gu6ikjYdZwZbLyknDVfyqlpwVBd9grNVSwSA==
X-Received: by 2002:a05:7300:d10b:b0:33c:13a1:84ea with SMTP id 5a478bee46e88-34f2199d876mr2517943eec.39.1790946201735;
        Fri, 02 Oct 2026 06:03:21 -0700 (PDT)
X-Received: by 2002:a05:7300:d10b:b0:33c:13a1:84ea with SMTP id 5a478bee46e88-34f2199d876mr2517906eec.39.1790946201122;
        Fri, 02 Oct 2026 06:03:21 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510752b575sm4217543eec.6.2026.10.02.06.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:03:20 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 18:33:04 +0530
Subject: [PATCH v2 3/5] arm64: dts: qcom: ipq5332: add the IMEM node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-imem_restart_reason-v2-3-61703c6362e3@oss.qualcomm.com>
References: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
In-Reply-To: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX3KqOfhVHvZ56
 7iFtKaFf+LND12TJcFTm9wWqgrww35+y49eIoCIFHTtk12aeBGZmtVqVxKcc5JzPGRzEw1UGRn6
 +u4WkBb6weYJrQsIVcKOCiJX1dpFTVkIbnZ3wptLdEbECLYWi2Jt1FX6VtcU8TqNxwSPp55yYn8
 bX6QPcDBZ+zylitbYpvVV58cfEd+nhT2yo3/U2DVT3K8osZG1qxSmGxhP+jdm7ptfE1DQaebBgx
 KMFes+qHi6Tmdg3C5n7fO7iougW5nGkKJxXTI89vG71q1Z21N7HdII0RUT8bIUkIee1H7fVd3H1
 MeiTM42Cj2BmCDIlyqPeG41iLGFJZGK3fHrTyOlY769tjTjxW3+XzowPZAW5bpQsv/9fK3ebb3r
 axYKvDernZsR+c+WXCcp8AWLSV5lVRx/f4MWUYA/q07pGkaCI1ezIEkzsgJb0rmVxUtpEtLdf6t
 nl2WEfs1dNroVKjF6Ug==
X-Authority-Analysis: v=2.4 cv=JIauIMKb c=1 sm=1 tr=0 ts=6abfab9a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1EpwE-knX81bZyav7xYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: -GeSnV2U0P2eDmD8P8FwP879mgNYUsrk
X-Proofpoint-ORIG-GUID: -GeSnV2U0P2eDmD8P8FwP879mgNYUsrk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX+PeDvjSRy7gu
 rY7dJn5/o0Tsvqy3e+SVKONF++F4V8/u/3wQtnKAM6+iilRLkn66A0vMDbbl5OiPi+oSPO5TpSo
 aO/ZiKezGNleeyRUSwG/lnAadZhr9/o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020051

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 80KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 74d9de8d7641..3e10f45e182e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -493,6 +493,13 @@ qpic_nand: spi@79b0000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5332-imem", "mmio-sram";
+			reg = <0x08600000 0x14000>;
+
+			no-memory-wc;
+		};
+
 		usb: usb@8af8800 {
 			compatible = "qcom,ipq5332-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;

-- 
2.34.1

