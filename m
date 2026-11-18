Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989015;
	b=KKzUTvo3C5E+SfTEVOnjYM2Qwmv6DNKiocdcem7adNMU9siZG7/nv8odcJe8jrExHgln
	 kA3mLZjbrf6yiqFKlg2mJHJk6hI4VyBoYmWH9+OhuAwWFlgXbbWrKPYF1DyRJk9znDX+z
	 gh++k3TAbf+9yjpLW5KPDn/SwZ7WCKQiweXdWyBdle49Bt3deJVK5s9SyExFWZKydiNRa
	 y6dQ4h0v8511POQO/CnaGonCRgLC5/tz1xGZlgSK8KEZonlqQJtfhwZpTJ7TEiW2THv15
	 61XjjiXoIlIptLgsdlfW10pR6Qg0eB+6s2k2qs8LpF8EHp6nN2kG7+TILW0RbBlBK6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989015;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
	b=OfCZKbBHhA+Xh3WxwDzceEi4AQPb/1xLMj6a+ZADVBjCAU2NnNxIZQn8KTu09z8sVdPa
	 5cVw+5rw3q0PaT/1nXACgPbPYoMNILQfZ+kqqYC3tUU22P4irsscKTPMLOlHRKInIGJzD
	 W0y2VDcNi17Sn4zQqWzmRnXX18l+IqtaVWeb0fmxVKBQ0jsbDCHqFeKk2R1BrkHyFQ3oC
	 j/Z6w8NrrTERRknkMFjwad1tpfmrqgc+GFCVXzRTcJjSpU36wVzO25R31F+l2V+TgXUpJ
	 PFaWgBLBDTEq451RVYqxuPyqc6RihymgW5whIEqWMxoSFrHvX+Ze4hUn//9Zu3N8Ylg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CPnE0Ajj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z8SL/gwL";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35404606A883
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35404606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CPnE0Ajj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z8SL/gwL
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI7ohcD2693684
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=CPnE0AjjmS1OKti+
	jsKcwPsoZ7wslvTnpMnC+xroU+ZLf5jzJ28cCteayLBq+8kKHpBW8OL/FFwJtqzA
	sWnow2ODDb7TyWFSpNQAonyQSzlVleAO6O6F83fp56lQn8v2++HSfZ7/qhc48L6O
	uDPEs1r2yo5DGDYdRr5PJc9yp0umRg4BDNSLrBNw81SzqQfjNwRIYbiJ9AgUm4SX
	bB+ZYwlWwWmhKA/oVnxAbA+E8rXa4vfiHm8jdjkTbDsNkcl2VscFDJAyC2AZa6n6
	JKPV1B/HpSGNHZLQm1xKBjwEaMMFjPWHwTBdRY/vY9P4maveoajbK/ziMlO0/1Fx
	Y2nk5w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8hxdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:03:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so673180a91.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989013; x=1795593813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=Z8SL/gwLauMEuWkbPD22Yro/g8ltM3JqAbtHfcwH+9NsNq7lAqRK1kXVUPzLH9peMX
         z5NRWAHrUqGTv6uj/qDM1iVaqQIT67MDh1cFdVzOSVBt12Jz6g9w059h7WD5Q/j2MpjL
         vNbKIwcIUo29VPHYfFLNE8DL+bBWexuMwZFyv3Gw3Ydp2Tp7+riH9HWaQ+ZMmctHUh5z
         POZKplCwY5e9gaB0qwhQehDPQjF699IroUJx0RVXB6aEHF0vUP7FPGBkyWiHewzA/m4U
         PmUltLE4LfP2IuIb8CVETXL1O98+83Hv1fWYXOtcaqVql8jNfapXK1yX8EQInX/+2j6g
         gDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989013; x=1795593813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=26wKpzEiyuF/Cnnz2IY4bfqYc+WEVHyDtPAELNM7xEk292HOXQuoCWCkknaedV6YBd
         mZ7oD4QRj7o+hhZ6hMc2VE3toZAG90TO7ZzYPJUKdDuu5q/ub/eBF0C2HH0gJHsBXdbs
         aev27+CzBJpRClJNn3BBsmZAVTYhGeSu1O8+qEfIzLkzvGsGcAUKKR+UI2ShQ5gOdBZF
         3+Lqr0STku0GTU9fnNWS1F2k+2Gbhoo4pLqMfqjXN5NAcgLok4Jywn/PEplydy4v+Bmj
         sqUZr5tKuY0PNBvHf49gQ6cdDUmo3o5st7KMwEvwWa6vo/HbXXlLuYWRpi8mH0u/divX
         N+nA==
X-Forwarded-Encrypted: i=1; AL+hErGa2ptr12Utq3YennI754kpr8KRUj7sAxEsjz6/k0Rlr+dMWcziWs/odxx+f1eNbW8xzgNOz1trbs2t@vger.kernel.org
X-Gm-Message-State: APuU4Z/V9KwjQE1pgHGKt/3uJWeBwaJw9Y4pZXeR9Jf8gJzPx6Lb0j3g
	0JlwVdBAjrp2YBMmWQhTRXFp7GtmMHPD0kqlaOwCEWFrnSlkfkyggbEzgt8rIPzjLTm+6bZygAr
	KjZTAufFTnw4VgUebMt11M2brALYZC4b3y7j2S9YzTK8+/AnZUWzGAP7BMsWa7Kc7
X-Gm-Gg: AZFdTZeeJaMptG2qm98Nb/myckx83V9NpCS7dPDsDrEPUJm091t4yC21x3JwZKCNdA0
	YnPgbqxFLJGwDyLAvqW8m7NrfPqiAyjKITVA9U8LV5I4I1k3sjbgFTS8MssjhqBUV2wTTx2QnQv
	ODOp+o618uluy/Jj+fRZFEoJrigmRc4Yu4+06RG1+FYEmNr/LQx4kIO6i7tjKpnXQv8GWMs9zBi
	74c9rzBXCTnYGJXhP1F+U4f0CCW3b+09dYCa7O1L5qmgNZM9SwzFaKDUAApD4OqmzdpEA65uaou
	wI/oSpQjVjOaNaI3bFHNw6o4VXhpJ3yN6UlKLvYQ345XtN0ZyewDNsezGdAh+yTcaYiqjIslcVJ
	iLz4eZ/zR7A9Qng1pxKd4yW41jmGvXAzF9Ciov8AHqsptLFnij7HwWYawvDCwT0TZDXsPoWnZD8
	cw20bTIDsHB5fgM1Sm7Zk0fPlwSNs7U84H+yVW
X-Received: by 2002:a17:90b:5803:b0:3b3:bd07:6646 with SMTP id 98e67ed59e1d1-3b3d07e0c33mr1865345a91.52.1794989013195;
        Wed, 18 Nov 2026 00:03:33 -0800 (PST)
X-Received: by 2002:a17:90b:5803:b0:3b3:bd07:6646 with SMTP id 98e67ed59e1d1-3b3d07e0c33mr1865315a91.52.1794989012779;
        Wed, 18 Nov 2026 00:03:32 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm3004072a91.9.2026.11.18.00.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:03:32 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:02:29 +0800
Subject: [PATCH v23 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
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
Message-Id: <20261118-enable-byte-cntr-for-ctcu-v23-8-67fd9db6bc0e@oss.qualcomm.com>
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
In-Reply-To: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794988961; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5Dgum6JnAYvNy94FsJPuCnHsZTgptoysTqIYu+BN7gI=;
 b=1ShHKwidmmYkWB+xKUgzw/Jw2Y3OUqb+V+xbSEaF8Ffh8U89bJa1sDw3eeoz9H1yx45kKuMKY
 C7yNqqDtpVyCXy4QWjNKDYSswiheVEZlW9MQHcJ8tC5L+NyNOoKN/Ba
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: A5qszDmGCtlHaY38mTA48FaWaqtM27JX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX3v/ljJttzCVJ
 00A3ShYJxiab1V5ECBsKiTrSeBsWQJZLjakCx1uTbzGSKhmF1N+xlRg535rijNLaoFKlFVAbISB
 As7EI9w2jM+Njx8T+Z+rKgFjpA+4qUI=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd5bd6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfXzhI5izoEk6En
 Xlw5/zkKYtVqV0WSry5050qcfhY6fOIG65Pu92UBmaoeJhPROwz3XB322d1tzIrXYsGiMtJPcAo
 mNwOYrU96DTM7wSZG9s7FDZ+FoaiwLLpOAeYUF3UXib0ZmmwH+9Tal/LoqFJJQlYxMaPNR03nnG
 +NELImHbedTBkRWZ077SAxgYMktJdNMaougDR8cOZQuBWxyE32DjAH3n5axwtww3joDAS5dYRjE
 9shCx1HrLpaZmmlfDij2/xYgus6A4gMjbayWG5fmSODmQzr5cksof3roYCksyzD7ZrcUSFJ2MKW
 gH0SpHjtUWaAGOaqAuqT0chbI1IGHz6bUvHunSBa4JZTdaXeThEGpBtqkT3KHnEWlSILhpE8O9u
 eCAhPURHjUJvIxsTKG4c//piy2NKlHRPND06amyTZFmsLVCR1icStn4a9H3wsL53AxFddnMxA9P
 7m96TKzUJuk4babewEw==
X-Proofpoint-ORIG-GUID: A5qszDmGCtlHaY38mTA48FaWaqtM27JX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..852a1142100f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3132,6 +3132,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1

