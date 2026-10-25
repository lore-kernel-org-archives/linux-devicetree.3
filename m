Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792935820;
	b=g+OBIz2qJr6YtOpf2u82qcAg8BxLNbwyb+yOY2BcynSigpSi7HON6+oqBDAm2OOedcEv
	 67+I6wsITXANMddyum16VweCsLUTO0EECioui15RT2fmpa+mHt6GTTlSKOywXprNKuLuZ
	 IfJS/DXTD/15g9ixFR32tRC/b1qJdtZImwxuWHxpENvdpH5HpdOgsTgHN1N2LTSls31Rf
	 yTkYqzEHys4Hg7h6vTrnVcCdubLLFUhGfw1EPC1SWHUd32hUWp0CWPACFuLbXnP8bo8po
	 WmTdRQZQLeut1xIOQoWsAJbellrViBzug96PxG3iSb0J+HU6SsLUZJGB6vdsujRwNyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792935820;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZyVPnIb0kULpM+/plCk3hw12bg0v06X7Bexcn/YYCWU=;
	b=bvkffZIwDEZiK6H9KdCCFSNWxIwl2fx7SwhLt6ZybBBbaGtF3ftQvsQqnYXkeK1YsogD
	 I1HegYpNNIteWbw5ITfjBt99rEG3FYGdgW2qn1WzpKCQxGRPG9PXHKfmZMtQVuvBR3Myz
	 BVL0bUIVJKh+9KfM3sfWeU8Fj9nX/YlsrFmY6MDES9/kGU8xIU3o42a3S8NNO03yrFQNG
	 FxT1+SxtgVSfWvJFWpYVBf+dF3NczLZWrZJQaZmhXcui9Ai45p/Re5+W8vOuQr9w7Bx1/
	 P95D74qJ2kjoasheWzs+5AEMzrpAd55pf9AsJsOToF5ohNlumHh11HK2vmPBSdrVagg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OCo3xtms;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kZW+bZ2V;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCF9606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 13:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DCF9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OCo3xtms;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kZW+bZ2V
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69PClDT4282786
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 13:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZyVPnIb0kULpM+/plCk3hw
	12bg0v06X7Bexcn/YYCWU=; b=OCo3xtmsi814QbP993m3HWiNttysUi+BLzs3Gz
	lLVS+87bYkFS4NKaJGW3iCl1T+m5PBGFe/VE0YH1SINGjZF3owScWGAv6nNUH0u6
	yJDcSOfP9F0EvdcGkat1C2ZxG2EKlLgqxwxkAZ8CKJLwnEC0yyf49w7ugIrX4SNe
	u118TMf0sTdUPC3L2sis8WXjgIWa4hfyUm+BTG20lFdkw/nM10+Vro2QtmdmyqgV
	c1uzo5EtDf1+jFDqzilt1LtWggVcKYn589gqMJSLQKYB12PmbfqQ71e9bp9vqPL1
	bWoJW8zhAro4q8Fv2qmHkpYoNJci8oZrtYsPzr3j1+iYYrWQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmruk5sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 13:43:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c5aef2a74so10883551eec.0
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 06:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792935817; x=1793540617; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZyVPnIb0kULpM+/plCk3hw12bg0v06X7Bexcn/YYCWU=;
        b=kZW+bZ2VKw2KRIspehzJkbD3Bm4PLIJWwMwA2MIuATkeCVCjAAQzZPh/fmbuakSTN9
         UNJJG+FmsBkYTQrqe+tqXh5KeLFrIMy58r1P33ZjltS/a8ry05112juJQnEskv8EpZ37
         JevRI8L8Xet3AQSP309TMzWSq/Phr8Fp1m2mvqnBfnc1jQ4c4zbwZ7RIr7xGDAB8oaN5
         ZkgH+Klx8eotPy2U43QCxZXMNArU0vSFoyccIEAVMFs9qw+xeaAwweFS/pUJMAtea47T
         XHgr+sUlNHmrIRGBkbT8tlyPQ2ZNNJGRRUD92YgWt5tttAIORGdG8eQaFQcqahyfcqpx
         E/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792935817; x=1793540617;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZyVPnIb0kULpM+/plCk3hw12bg0v06X7Bexcn/YYCWU=;
        b=OsP1G415mpDg17F4iBKcyQNrfCKnthOhPk+dATheUFvch9cZVRHC2QZnMeWGAXnyAU
         jBUf/4emh84XPYuX0j0RnbleDHPqNZnvwHtM4aL6EXKiidZVqjRhiDwzt6QmNJE83NN/
         +z4J0AVgJKYgq9U7aWIH09qivxj8LUosDEZZ4z8SC6lFBr9hWMVGICGUBYEuefCsBMP5
         KxwvV9YS2dnmBG/P4ktZaJdyhFCyyauYVWiH0fTDakUtDBf/k1yBUDIYMs2hVdEHYVgc
         DFMv6Sx3YGvvrG68gp2MFfWBADbV7WJXN8MzRQGuUroYOiq5FAEkAysO0d8FTaVIYHbR
         tzlg==
X-Forwarded-Encrypted: i=1; AKwUvBy/Jf/WvVUwHyiPNRRrKUbcfgC8kPDtKPqoLbg052lj6RccpkMYMGoXNTXn5yDuLTBRlf89MPwdD7aL@vger.kernel.org
X-Gm-Message-State: AFq9FYLergiOgzKI/1aigw3J2oodxKUbb/N5iA5+hr7A7tlB6I3mms/R
	z7n9rKY78wDZIcitJ/Ad6ejnTG/OXWvKiHBt5qjVwm6xsnggklBr97ZQRzGf2IB6R5HlikwGPGp
	Sumz0b9pRkpWZmID/ds0ihesWqDiCk7n+00hFhKpZEUyEU/gGC0GdfyhnDmByUOWy1b5U/DS7
X-Gm-Gg: AYBFou1zgHjf4550t0xUvMl1aM+u2FIKcAca3IaSPG8hrDQTQmB0P2AOT+05JL7aLst
	5el+suhDLNXpPD7mz6S/WWjV7SaIxrTp2JMtyE1h0qSdUQ5obV7XLTJthIIMz66JfNL3B0zs4Fi
	DW8tqL3GfDuN4mXrnxob+ygm4dTi/tXBjcrYKE4V8QqB9Yt/wYK8duYfzBeXERCYmIEWtms0GxJ
	bvbYyUF3NfbNKtv/R65sJNAyeoEzPUxAjp5Kc1MPb3s/TLmYI6B3/iAxummn+KelzpB3VtwIzqq
	OdkpgcI3KyL9PyQhflu9+kzB2CSl5IAjZ0w9dbrBqH1ZJ3Rc/uTXwqmNCyXaGqEdVtHeE7wz607
	gDr34EhL2nyhPg3N4strw/T7pGwuL4Ss4h+pq
X-Received: by 2002:a05:693c:6390:20b0:366:b36f:a9ac with SMTP id 5a478bee46e88-369e861c209mr6836972eec.34.1792935817339;
        Sun, 25 Oct 2026 06:43:37 -0700 (PDT)
X-Received: by 2002:a05:693c:6390:20b0:366:b36f:a9ac with SMTP id 5a478bee46e88-369e861c209mr6836944eec.34.1792935816817;
        Sun, 25 Oct 2026 06:43:36 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ef6a71a4sm14608904eec.8.2026.10.25.06.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:43:36 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Sun, 25 Oct 2026 19:13:29 +0530
Subject: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Add SPI3 QUP core
 bandwidth OPP
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
Message-Id: <20261025-qcs6490-spi3-opp-table-v1-1-d0e0be6ed1b7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIAH3moC/yXMQQ6CMBBG4auQWTtJOwKKVzEuSv3VMQZKB40J4
 e5WXX6L9xYyZIXRoVoo46Wm41DgNxXFWxiuYD0XkzhpvZOGp2ht3Tm2pFseU+I59A8wAvY7qdG
 Jb6jEKeOi79/4ePrbnv0dcf7eaF0/g81/YHoAAAA=
X-Change-ID: 20261025-qcs6490-spi3-opp-table-eae8724e9215
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792935812; l=2093;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=VikVOS7UVUNtPxV/SyOLt07vTrA1qmdxUJpVFVngMu0=;
 b=FP4dkY0t3VMeNsfHXth9EnKf0NyQiqZWgOVvIIVk2I0cQHeliWy5atcJ/6hq37/iiAoSuSnKE
 wdEkbYuaRkJAV//E/2/oQatDKOp64dJta7XFu5FwofRtJCqnGp9BU4W
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDA1NCBTYWx0ZWRfX6z0UVG7n9KFb
 S0rWkTcFC76gKWZRGXllgpe3G6k8VKmsM6Pelcll30uJ8SD4HXWJLUwS/fwRg+AXI8FYfxBEtfz
 g3RanQI0twSHFp/EFsUetZaPt1tdJzQ04dlpUubrk2LRh+Coa8LLzsu05U8rc5mkkSYrm0V6DYt
 ypisMloixuTRVbcW4JVKjonOF0EN5rcPpzYpoVbnDw4nrcNs1G5HQTwWXzYRParBZzXhRBlgyz3
 z4O47tBKJ64GmDgKFzS6w30h1Amxlvi7LVTShpZ8feThvIUmf7Y+bTbZMXr5CXfMfj4LYzYLDIe
 7Al74CgC1VFVZ3T2JKP0D3NMnlH9YUCYkOe8ghnrBHxcsTCT2xP0pQRb0f2+rq558gpi4UCzYaR
 v+4Zi3Bd/rcmz9EuQD8lFC5B3MphK/gNzj5p7sxDuX2gmMPBzrKZiIGx88VCJ0HqhOdy6t9DEla
 AJZbV0olUBO1bG6Ah/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDA1NCBTYWx0ZWRfXwXVloYlo3xiv
 YFRW+ESQimrloRWIxDPADADwW2qyQbnFDwzYLz1Swk5WzzfAGy29s5ybCdd5Mm6ilD1QJSkL149
 znmpbxcxTJ2/HiQKQ2HrnHF8R2zme+E=
X-Proofpoint-ORIG-GUID: ltJZ-EnIcr3iRCK-sRXvCjK5W0-lU1Ha
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6ade078a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zOFECjqJgxj6X-Cpi28A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: ltJZ-EnIcr3iRCK-sRXvCjK5W0-lU1Ha
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250054

Short SPI transfers are sensitive to the bandwidth available on the QUP
core interconnect path. An insufficient vote delays Serial Engine
register and FIFO accesses, increasing command-dispatch latency.

Add a dedicated SPI3 OPP table with the valid 75 MHz and 100 MHz
source-clock and RPMh power-domain OPPs. Add a 100000 kBps average and
peak vote for the QUP core interconnect path. This improves MCP2518FD CAN
payload throughput by approximately 38%.

Limit the vote to SPI3 on RB3Gen2, where it serves the MCP2518FD CAN
controller and its frequent short SPI transfers. Other QUP/SPI instances
do not require this vote, so avoid raising their interconnect bandwidth
unnecessarily.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 909039816a21..bbc16f5cb808 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -85,6 +85,24 @@ lt9611_1v2: lt9611-vdd12-regulator {
 		regulator-max-microvolt = <1200000>;
 	};
 
+	qup_spi3_opp_table: opp-table-spi3 {
+		compatible = "operating-points-v2";
+
+		opp-75000000 {
+			opp-hz = /bits/ 64 <75000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <100000 0>;
+			opp-avg-kBps = <100000 0>;
+		};
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <100000 0>;
+			opp-avg-kBps = <100000 0>;
+		};
+	};
+
 	reserved-memory {
 		xbl_mem: xbl@80700000 {
 			reg = <0x0 0x80700000 0x0 0x100000>;
@@ -1228,6 +1246,7 @@ platform {
 };
 
 &spi3 {
+	operating-points-v2 = <&qup_spi3_opp_table>;
 	status = "okay";
 
 	can@0 {

---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261025-qcs6490-spi3-opp-table-eae8724e9215

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

