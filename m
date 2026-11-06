Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956896;
	b=1Kmfay3JfE6CkghjqyMM8LppW4q2tOLX9BSE9LGyOuP9OmnTJLdAj+3rn57UG0YazFau
	 BzyYoBBfcUSnweyRhAhFt+fFse1MvOOjrVI3S9tCzTa6qRIhxT4rTfsej5BkM9hgflTd8
	 CNnV57teYlU/WPnCf35q66GLIcKj++HdsBoxzaAlaot1QgOBF7DdMz8qz0hqo2xvRc72s
	 C3spvTK1jDHXp4cc2Q00x90emIFd1W82q9mTVHwAGrSgL32Me5X9SUG/hvk2NC/6YE2Vf
	 b8SyoMn63UA3JavRLTYEucC2qZCfrD6kxPb7G/HHisqKWmTuKnDoES1oxCUWK9omUMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956896;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=p9CTn9l1Lh166Vccf0n53lzY+EaxaipUw/FBxy8wyU8=;
	b=ezafgmy/n8KvlM7alliyMefFbcJ4/gFBco/swFVfeO922411DUIjhHSwWLlSLaLZv8yU
	 vPMTAUi2Fvm/GTOZ/gA3rfu86qpluNSh2GHNd6byK/w3fAfJ/fq3rQa1JRmtkJp+3cVyB
	 HcKoIY3CfN6LPQjj1sOI2lxZBBzj9r06zg8CGctPSOfOcthqliC7YQluh94N+6Pm0ekK9
	 d951/obwHEWoECOLZCY+kqMpWp2kn+ZgNnzPzmnbESJQtfS9Ay0eUiS9Z42izEZW17l5K
	 56bvYKdfHFYxVVJGzOKXRNWA8YtIys0/4Iqj3yAX8vunZJoa11Py38Hk0gnm8vLfu6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z4IlxSFI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dFU5DdQW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CA8606A338
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 09:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09CA8606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z4IlxSFI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dFU5DdQW
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R7qk3243883
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 09:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p9CTn9l1Lh166Vccf0n53lzY+EaxaipUw/FBxy8wyU8=; b=Z4IlxSFIL+pobaJc
	0qjpSlK+alP4nHRIUxD/FVE00iaZ6Ods0VoXZuA3oh3ntw0HDMMNn+CixA+eilUn
	g46G/0iKOFXVOrDoHozqySbsK6KNx/pYhJ47kizVEdispKhyu8T27sMYUeKiVUNn
	K3HNHPPjHLpSvbzx/8rH4VtFT+XxNcLJcXhPHlK6OkOMTXBnCBj89+2OEZkvLSae
	Kb8BXL884j3HGPAsNfOFiAbllQ9MeG6W+8P8uGtVsJHQJa9p7sipABIvAO59iX2s
	efvLDQO/h4fxHVtYD3BMfBq75mBw35FxK4MTvMtqd1CF0tHUzO2ttNH+sZBkk8cg
	m+vZ0g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa220c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:21:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d1353fdcdso1783663eec.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 01:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956895; x=1794561695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p9CTn9l1Lh166Vccf0n53lzY+EaxaipUw/FBxy8wyU8=;
        b=dFU5DdQWbznxAPj+qG80P6QLJDPdchNlYDi8dQ4l6qgBZ7OfN9B+mDOLcdT2/AagTh
         URE7O8yl1EI42gPkyv+ItEJ3HTNbIkYxKPCMiYGM4x0hmgy5iW1GwJQVvr3NDSGf75sh
         D/58GWX2+w7NOQdDtOdIKEEDYLM3hbbBjPJklN3rJ2LZ0CsPnyta74fffbzFn40z8p0l
         1SjbW6b8D0Be3OHPC5LppCUmVaj0jpbdHL9PxGucb5waSZiuMEflZeikj1b58OMafkUu
         g6mZ4xaWq4NrAwWuq7ti5Np/2UpGxiq0eowvweDw1T+crmQUzX7rsDR9RqYaFD7bdJxG
         oczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956895; x=1794561695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p9CTn9l1Lh166Vccf0n53lzY+EaxaipUw/FBxy8wyU8=;
        b=XQTpMaNAVLSOcn7hw+9LPO6C4/EeNLGE5J0H5z0x9QCh8PcSdLCtSBaoUl6m5N/hQU
         mAdKRXCVdclVjGyhLM7j1+PLnx6XTpeGD/LjL5dO/smrX8qIneB85kbHmA0m4o8NoVlh
         wjBZrgVTMTHTZHPFsR36Fwj7/ogDQzqVijYWUFmLkFhcpQ8NLdGHDXU8peiVzmUZ1FAt
         U0sii9ZwvTSs2b1FwVieALT3Dpbl2GxWn5qw7ypYlCVUYHOfIyUADLyxlZrQDST0UUpz
         iY6raA1z/fYe9RaoUUBg0I52JqE2vTDEwZpPe/3O7aVDGPWm41HgV4UYNrOpWJEdUAy7
         FAzg==
X-Forwarded-Encrypted: i=1; AL+hErG317X8ISyqmEYZx33hwjn/B2xAOZjMUVHlE+HZbFrjkWdN13dyEe77zOA8uB96LURMhv7c6EXxX2mb@vger.kernel.org
X-Gm-Message-State: APuU4Z8UTzuIBRdKZTVKWHqBAzY83llEpu39d78lH8cl4gS3MO+NH4NQ
	nuPPueSCx+PrshqnRcbOrpFEEbmaxwJh5CVBvE4Ry4nNkOqBybEQKKb6rbATwbRRx0B3RNSPaib
	6mK24GeQSa8VjGE9sLszFcG/rWdAqcMmBGFrvB7lkFOQnfqggBqzEOaCCH31hhsgZ
X-Gm-Gg: AYBFou1m7uBhnmbRLcfx76mGLrgFrAO6JWLTLYxSxO/MrT5UrSNb53dyj3b8LpCmt/z
	Vzc5EsWa7eFzo+Zk8rx6WKs4Z5l4vlhiRNhAGevKdeHWBT7BlpGwby7/lCF9IfSTJ41Aj7qOkCv
	Tvmu4dQ11JZvRE/S/xboU6Hu2dRV78Fg+ztbqrF7xe60YLiNSGQRJPwc2iJGFkof5SgPLKqbGjl
	LQdxRuEoNA4UinaDXS9czuA34HkRkdngGo3kh7VIdEwAnh99DDjY6sCp+JQBrbJ99GttiF+37Rj
	Fo01E4T0gzSfdSCX89kXxWdFzW5w5KPxVOI+D2wJcf7FJ6piTXAv/NFG1u9RoPaJ05BbCshWWr6
	p/2juTZw70BpiW4Dfreiok/InMNnOSNFAeNN0ebOyQfDC6B1VCCFTDHHeb3owaCA/8w6YpLyN9c
	ljsgVC97GdpAt301AnmeEiAFJrtmpPDBY32iUzBt6R0Lj94taBD/4B+ZGBkAjVnuulthrKB1HtO
	xzpqA==
X-Received: by 2002:a05:7301:795:b0:358:eccb:af7c with SMTP id 5a478bee46e88-36f76a18d9bmr2591669eec.33.1793956894475;
        Fri, 06 Nov 2026 01:21:34 -0800 (PST)
X-Received: by 2002:a05:7301:795:b0:358:eccb:af7c with SMTP id 5a478bee46e88-36f76a18d9bmr2591639eec.33.1793956893978;
        Fri, 06 Nov 2026 01:21:33 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:33 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:55 +0530
Subject: [PATCH v8 06/11] arm64: dts: qcom: ipq5210: Add ICE support to
 SDHCI
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
Message-Id: <20261106-08-dts-v8-6-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aed9c1f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=oTQqOnWIMzOobJ4mAXcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX/Tb3qlriaOLy
 TRRjfaQ4hvtEfhB53KWhsdo0UuBSlGF1/aRF/3US3jZCZtKTRFpwUYoFSKlkURJJCLbqixxEvFf
 2ixhLm14vRy84snMnhsZTuucScr7goM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX7tRAf9SR15Yu
 vZxQYlZeetEawMJFaXnQdNVVxbER2J6eOFB333ewPhYYYr0qUQOR0LZLmpymCaD+F46K8YH4Q+K
 KOqeUuJfX36bCYs+QPWiDYUTA08h0thLfnHZ/DmtZLihyGk6/eyXaQDHkvtq5NO145DSOKc5Lgi
 3mXuTSGCP29gpn5j7sgOJfD5mcEBZXwT1r5Ur5rSLSx484f3KfJTrdd8mr3njENG3AmvIMuxvQH
 3UqRxXABvkSm/qRKOO3CGFZIEW8sRtajcuiPRDg/W4JtjhzH0XJ/dp5OinzPb9FPv3KHGzAIMPS
 gI9Aylnd6bio4AuWod6usiZGcOLM3qD0CLiYlkSCRhmFWGNInQDuBU+q/Zpe6qrQ8umrx4/zDMl
 19A7QgyOEEPf8LYD+3iSrs2k3ljTNk6lRZHFEUL0ZCyobF2HAC16CpdIyntuUHaiK3ebxTldEks
 igIWAZONy3xzkhWvfNw==
X-Proofpoint-GUID: gwrl6HkHYClYr9UT3IUQeqAsDHt65qk1
X-Proofpoint-ORIG-GUID: gwrl6HkHYClYr9UT3IUQeqAsDHt65qk1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Describe the SDHCI ICE register region and clock, and enable CQE support
for the IPQ5210 SDHCI controller.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts |  4 ++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 23 +++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index e5f2f9217f3b..5715022db6c6 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -15,3 +15,7 @@ / {
 &sdhc {
 	status = "okay";
 };
+
+&sdhc_ice {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 6dfc89903d2f..705d7ed48713 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -151,6 +151,14 @@ opp-1416000000 {
 		};
 	};
 
+	sdhc_opp_table_300mhz: opp-table-300mhz {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
@@ -432,6 +440,21 @@ sdhc: mmc@7804000 {
 				      "core",
 				      "xo";
 			non-removable;
+			operating-points-v2 = <&sdhc_opp_table_300mhz>;
+			supports-cqe;
+
+			status = "disabled";
+		};
+
+		sdhc_ice: crypto@7808000 {
+			compatible = "qcom,ipq5210-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x07808000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
 
 			status = "disabled";
 		};

-- 
2.34.1

