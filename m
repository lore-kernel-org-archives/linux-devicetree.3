Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612873;
	b=RsZbTGgt39CN7GAsdjq2qGK7Uu9K8oAVDPlxeAAcdl2MXh4DxC8bLyfODFMXxXXUoiw7
	 El6WQBcC0Yywv65U+Nd+QlyeC4GHdFYOr6btXtvsURUphAtxKRev+X9lE4JW1yTeo54zR
	 cti9Q72LPsA1duXuCVIa7SSePsVpCWn/pNSMJ6qKKoRp5ed4C0btxEh0AaShEwX+IWxOg
	 PJQ+DspUUKnZPeiMHa0bhxAuuvU0LWFqBWFFBCEf2W1l5lSKkFUhuh1u+uCmiHVY3w9nS
	 G1L8vdn94Hc75iWKgYBu1z2kElUzubgKSOuJ1JdcMOVBKOFot1JECLYJ92JaLlgW+MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612873;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
	b=sIqmnPuB4o9zOMQfwHvevrIdWOaTq7Dx31V1GSIMYGF51qlq3d9SZ+jmJ/AApyGfkrMR
	 /9bveGLT018VP/+2emLVYppOoFey3lAukWiLjLRd14JEGnyAlrNhJjR6gqXGGHASeD13P
	 JPnrGXkr4UAVIpA0H21OcSimk0btEE2L1eTGgpL7Krkt4a5+CAnT1Z0AsXi7f3UD8u55l
	 UP4Z9DdBGu3JWVMMsdeIbi9WnkHheUuqtqNHGqchUNFcFxsMPV0wtVUUfB8OrQizzB54F
	 qssVV+oGIzRdc2PzUCzSRTNvrWrPT+S1pHQ/mFA4z3EScu1Kq3tV4WdEdUNF7Vbg4jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c60ltpkN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZQSO5Q1l;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81964606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 09:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81964606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c60ltpkN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZQSO5Q1l
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A23a2466164
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 09:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=; b=c60ltpkN2CjgXaiR
	LE/HImbNGg1TmZ6HFXIpg06HGEsPeMxmTEnciQ6RPcaq9NZHq5O0SW5H31VDrjir
	cnbafERiEa+nKkKhhZGqvnTS72Ie/3b1eqVH3jar5nGiUOGk3j2idwTV5s3ZwzyQ
	6xFmMM/2KTgTUzyrn0Y3PUUZbvrgnz/NPu15AT1+R7Lk3UCaf8oJmNuUvOBOAvcm
	hH+5XLguFWFIW0OjBeBUHfBH1xnrXTi2mFaQ9ASdWnO2XDtoErgvrjnoHXFA9tCH
	OyrGtodN6qZAIqyfMujRxMI1QDoRvcJGRRsYeB8/hSKirlrO2hU1kn5SzQ2EpvJM
	mVlrSA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rh5xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:47:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so6267019a91.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 01:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612872; x=1794217672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=ZQSO5Q1lY0GY0T6xdQcrv03Zg43AxzQF9QV6H+FZNi9O0+hoQdVr/QxltuJ6z5Sx1h
         SAH3xU9jHOt3LSjsG4l7Bow5lnXGBMeLvBqkHlitovauSeFyu7O+nXF5zJaw3OP3m12K
         23qVhsJhdvN/xBfRoBiIDY5FqU3NJTAkzu5w2J1OlBHYgmufF28J/d9Ld9UgZKM4OEPe
         EJKHgwow/xubnVYBWJBRpIaok7PeSHLaPwcxmSedbUKnOP2pAxpFNaD4G8utDgTkw8Gp
         i2RZJABrUjblwFQcLh5NYJtKKm9zvY3XCMmnTx7qyijiAsVsIfnhaVPnG+OeP1iBVk8o
         FCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612872; x=1794217672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=nXE2F8CoV2226aer3WCPf6qmtV4cg8UTSUeXc++UbTr1GbcfTMNnUAr5Sg9jOGwAq6
         m4FiW0OOKummkVgnw5wDZtk4jnYqGMG9d64L4HIkbbwafVaQiaSAMv3/EwHsSvXCDijv
         /KI/uiGhQt2E4v8a269sdDq01vc6G/I0zRwgNsoOu+1vVvgT4lIywJz/1HZIvVSpzsiI
         SCj4JZdQI45Y+gftP07MJGYSDuGeIr3o0jGc90ig0Lc5aW0cJ10hazxAsYxdoNm67nex
         BYQj0ixY/TisFk1v2ZlcY+/6lcfPIzsALfO8Zrjsjc9ptSlUIku184crkfJ3HONDa32T
         Nyng==
X-Forwarded-Encrypted: i=1; AKwUvBwl9Oiz4e4ifNa9MByi9Ym/O8DUpKvJvoLDmhoVu3MOQbBx61CcInXMYePAZ3YBEUDUnWKZ0Lj4l6/3@vger.kernel.org
X-Gm-Message-State: APuU4Z9jdEopHbAhyZvsmIAs3z+xVjM4sAjkK/RCCJw+WXaIaGn+L3UV
	Ikluq02Cm8lQKiRZ6aj+jf4QoVrJwNKD/I9GpWhNGAvauCC6gHX9VgJjnYh1nwGL7zONKav8vV0
	bkBCi7I0yJXbeMu4O/ex6fnG5XDq0YHTnJm5w4X6PF1gM69G2NIYtiJRflmU9cX/l
X-Gm-Gg: AYBFou0Txz5b2pXqCy4KMR2QH+tVtkfFTcEZ+0aFyxJpEiUG04R4sxewfBuZ30jZa3v
	a30xHQPtBIXCk5R4Uesc0BiDsn+inazJvo8GnzMHujtQy6vHLCPYetvZDkawGQK+lAfYqinLus2
	3Rxr6wf4F0q+SQEX09fbkc1EFvv0tP8rvunUVhZPMvxgFiOrv3H5/0mCXeo1i7mxPsvfQ12PVrS
	HtXXF3h1EgAmOGfCSuZxsovCcpCEMcgxlKnNK2FIXGHnhIM625zfm6t2ITJD7ZzuCPgydmdqb9i
	84QOdbOmwtO7J1V6q48K3uCbTMsKJrtfmhtkHn8ctT+Qduu6P5/Gn4gKsdf430VTco6pLvtowdl
	1dFBnqXGTQj1QQX+GfUTt/9LfY8hLnDGNVGBQFCGYAK1kBylJXpgXNfP32qHU3T5IS2B2kvzKhQ
	BGfJmEoZSFcRI6CbCdpI1PEavH/kYYY7eD35s=
X-Received: by 2002:a17:90b:3c08:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3ae89812f18mr8208565a91.37.1793612872033;
        Mon, 02 Nov 2026 01:47:52 -0800 (PST)
X-Received: by 2002:a17:90b:3c08:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3ae89812f18mr8208536a91.37.1793612871588;
        Mon, 02 Nov 2026 01:47:51 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebaac28c9sm5053234a91.15.2026.11.02.01.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:47:50 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:46:34 +0800
Subject: [PATCH v21 6/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
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
Message-Id: <20261102-enable-byte-cntr-for-ctcu-v21-6-231e069b7853@oss.qualcomm.com>
References: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
In-Reply-To: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
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
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793612830; l=1754;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=icbknvjFK2vf4oKtSEHbsU4cH2Y3pwIOC3H2EHr7Svw=;
 b=o45iHlSF0WsHgk3PyUkFhRrk//RjLVAmKOrTibXwQpYiryy5lYFSxxkpsFXbsQNmRGSrSi+cq
 xRm9Iigb9M6CDBxuhsa/PC45EBycsR0Aro0FtYcSqhPCkYw7xmvRxHR
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: PjPxQH50dJRl0dwVB5Bya2vSAF-BIA-9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX8A2E2slcGQur
 +adR3glG581uIimGUez5hY5SyBt+CWO+pa1O7s5k98peDnwVdBoWM8RvUeQcC4m1mg+tH6yqrkk
 uF9kjZ6w/L4EA9wXHLU94k321k65Yvm3yETtIewEPRq02zjhyPyDHV/329CItqIsZIimleHMGs6
 vzPB4vKhEWJeTDpaQa5L7UqP7FzjZH8iAS4sCQ5Y83MS1PIlvhbINgRJOfZgoV+vCLkCqc+wP2D
 4M9gQVr4EiN9dAB3J3icFFEqa3oQrVVd3zQP7jGqBEDOxyYWPd4pvM/I9uVxq5F/9JkA/Bgspna
 ttt8FSz1CFuuzOL2YstKedjfv2ucbWQgnRBSlLj+mffFEcb38YEquHo+gW0S1lBHLzgfW77CaCK
 PZBlF2/b9PJaN2F10RuPKcNd4OVLCm1s0bUn42DaYMNbzXSsjzVcyfAoXPyeJ5qu/o1Yf4pcYaw
 5B8elwBLgZNIVW1ayTw==
X-Proofpoint-GUID: PjPxQH50dJRl0dwVB5Bya2vSAF-BIA-9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX/MRpUhb7re/J
 nDoWT9FlR8fdEpLtgexsvDzJtWxherQOaBK2JzOUZSbqGAEyoMTuRZkKX9TU6gIh9WcFG0Pn7X1
 XE+ruE2wlkXnyaKzGnR6o91wsBw52lk=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae85c48 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..decb404e2ab1 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -49,6 +49,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -70,6 +75,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -77,6 +84,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1

