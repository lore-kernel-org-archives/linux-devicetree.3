Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A69231F996
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161532; cv=none; b=BpM+sW87VYrCU2xf/ZxkndEibcZ+LUWZdl2Iou6UHBDUgwv9QvPQmHtXqq+THwiCO09wsMyU8ua5OkspQTPN+ywRZ+Ogd9/D2kH3WDbxAOuQlH2R7i2T1cmrMfQQGwCVSdAXQOYeRUf5LjkImmixLw1JGkkuA2B5TnPdKwARI6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161532; c=relaxed/simple;
	bh=sVtABILvw16qFz0vsPNzwxnwBDnnPVxUFUJl6PcCho0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jg05C/hG7FI82p5IrzAIBPhEw2zs+V3e+9w2LCRiBAowWGTP/KddipYNEzPTQ9P1Oevs5uUxT55c+jRKcV8je2Hc3F9UBi6O7SrUHBhs6ccrmNNmJF9FkyOgzjmor3A1TRutHCytImEmj593m+8hiTBFjoZwCUsGIe4PH3ZcjIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2ViyXPz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KK/lajgp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2ViyXPz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KK/lajgp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlWNq3663456
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7CaSux/07UZ/WNWh/01IaYJpnFO3EliCgL6mAg9sbiA=; b=U2ViyXPz2W04Fa2b
	6x3Ueyj5p2MCUhBRW+d8cgdaGYMqYvoFk2IOs4pPh7xXirNhCG/BVqlaCjK2tKd0
	UexbelIYSq8WmH4o9azadZywRQ4EtzKAG+fbxGirn5K/Jk7dm0jdM6qnZ2dJI6HX
	BUiwQZmMtylbTe+bt4qCsG35E2uhqK8JyLq6nF2PQHKwqmR6fAXEIAwMezB8tHGL
	LRTUN3hj/cLCYIyhF0iVB3DVTq6yQD23w6yF9lgUIGL8bYjH1go7LNl7QkFSOwLl
	hPWg49YjPcBF4ty1OJ8eeK6jooKanjpOp7eCUs0DLRAMLj3tsrkI4liLmgOlQRct
	ckmRwQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp2ashsuu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:12:10 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c860544c077so6024807a12.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785161530; x=1785766330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CaSux/07UZ/WNWh/01IaYJpnFO3EliCgL6mAg9sbiA=;
        b=KK/lajgpcdnlaI4bpQgVH0RoLn7HomiE5DtIiy0A2S8aG7wIKGhf9tue7/LUT2D8Lq
         oXuWg3li+jp2IE03AErlK7kqKbs6kNRQ/jW/cUe9pAFaWkRIBEVL73NcpnYS8t+toVDF
         tnDdc6FS5q9EEil4rktVpq5GrklYIYz2ixmirqImBuJ+4RXOOvDmua829WcGbpU3S++d
         GkXhrUf/ZA2skCZQYDkaPizgwN1XmATXRmpNoZEjMyYRqQbUB3svGuSqb3pyh4tUpEiO
         bEFE0lvlnDtTNThGGmYgD+7e5yVUufFaJM3vJL3KbLJaJdwkkavrnOt9uOf+7A3layHE
         ZMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785161530; x=1785766330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CaSux/07UZ/WNWh/01IaYJpnFO3EliCgL6mAg9sbiA=;
        b=edtXVpo3sBzuhcuTYirlQ4Nq03Os/5SWen/0S04QcB/YSStvOeYebhqer0zIE2jH+y
         Ld9V5590pE7NJzj4b8wbnTncvhz4hbUgcz5bA99uY7FPE+l9kVQ/nF8VA0fVE/4H+d+F
         AyTXNr05a/F8jTvou1iRevDLCv+Pu9Go6ZUr23TpkeHSUtvf0g6YVkzrk2IPnOFE8A98
         flCg9pZyr/hFXvjg/eXP9IeViLzY0fKa3vlFfd5PepGTNRWKP78Ywn4YCwtl8/nYVIDJ
         QsWnWuqUvSd47TFKNDooZLG7Url8UUqsy02xuM2S8wkXUteJ1oD0dDcn+t7E3gtueZDX
         XQGw==
X-Forwarded-Encrypted: i=1; AHgh+RqomUq16gAHZHiLzAQuViNCAM/pN0a04jYobxJH2RFSzV3gsHbqmZ7aR/D98sPtQhyu28CqIUg5T8Fj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2MLkMIztBATHFb8RMWw7dm1F1kMBUXdteIGN6YaqMEpB0x9Yu
	Jg6Nx7ajsCAP3LWOuklcbDKn9JY8NOlYmVI5j+9rIDvLFkeWtRQCkkHLdK8WRRDG2On2nAnKFwN
	gQu+3JPIPDKG0a1tSABSz3qfr2nB8PH2EP6o5W4BTZQ9I6ifMjG4hQxhQkanWa28h
X-Gm-Gg: AR+sD12ohOdLv1g3erGmGAvNsmgLu1AFWgw+5eAKvLk1XXcNMRtZsqPQOnlRScsRLOY
	BYjtIE4KJOMjxUvaDzu8UKW6cKSdhoN97zDLFxUKl47Vi9Fn1dHdjxDWpzGHY47ntzJuoEg9z97
	av5Q83XEDbZGhGIrgxIh84iRp33e2bzk91geq0NJ2Bu6yzT3KRrx1n6Gz7kXpbnQGbDSCWJ/0rj
	HmIt8cRiRzZOyyQHNULZCd+8LrtBTdJF5BupKajIKy8QltMpxX9PTzXyvCY7pmBO5t2pG+hkza8
	SNMia+3de3j19JmHQaKTD8t+s1cfw1i8KigUfN5IOfz1FB8x119RgX6uJHG77ZpwTkb8xOBgteY
	wciHphqxvh3dIX3hh36TAlDA6t7eKVJM=
X-Received: by 2002:a05:6a20:a110:b0:3c3:b5db:d24a with SMTP id adf61e73a8af0-3c67e078756mr8870312637.68.1785161529744;
        Mon, 27 Jul 2026 07:12:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:a110:b0:3c3:b5db:d24a with SMTP id adf61e73a8af0-3c67e078756mr8870274637.68.1785161529263;
        Mon, 27 Jul 2026 07:12:09 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm53438677eec.13.2026.07.27.07.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:12:08 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 19:41:02 +0530
Subject: [PATCH 6/6] arm64: dts: qcom: qdu1000: Add support for TSCSS node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-tscss-v1-6-beed14e72510@oss.qualcomm.com>
References: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
In-Reply-To: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfX9if+5ezQJuJo
 1E4v3jvlk/X7ucYaXdERYWj32mkMG5YNRQJtIJ7Y8hfzlIDkmomPMv3wmDkJEVkSVSDhlaR6YBQ
 +ihjCmLQJdpbbIZO0Uoe5MpMXiUJk/SeeAsY/CMJi2P8zUSH9H5ffEZAqbO/q/5tgaNlX4X2hxm
 frcyYpEpt/AydXBC01Pb8Vb1gwZ7wjgOqDiI4/pSmuNRa5tocAoLK0b4lReLUtUMlX20HV7sEXF
 SQH5pqeCjIVb1EHd0my035fWop6RNCCdHb5nPA+YEhtnz04FZcJAszqizlyuLPrVWQRZFkJ4bs6
 xDuwGut3jrk607lQqLuK63WBpsVA1AdMiuqXKQa86R3YmjxKiMKFhJUUApznj9SmiWGinZUVBgr
 j6m/fxrY4+yH9tF3D6stjJLpkpKASt5B4hXV6QOBDGqfcIrQbUk8I3rQcxhqVdVy9bLdeilONGy
 SBLqecXWmL600t4jNmQ==
X-Authority-Analysis: v=2.4 cv=UPbt2ify c=1 sm=1 tr=0 ts=6a67673a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pCDFdeNEuqTB-y8mxvIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfX/d6c/DqROHCg
 Xmsshd9zNAlfS6QvlCOhRbO0/S2G/7V8SoVn1rB7isRJj7atBLcdEjzCy0eqN7MgVJd8SbEp3iV
 M/AXmtI+5UkpGoBAwMco3I75SRtHl5o=
X-Proofpoint-ORIG-GUID: RDrO7Nr6C_15rxVM4DsxqXENGuJ193ky
X-Proofpoint-GUID: RDrO7Nr6C_15rxVM4DsxqXENGuJ193ky
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270135

Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm QDU1000
SoCs.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 26cc86d12f725682ebbbb9be22829bb7c6be7fd4..8979c18225184a318284131639f24c698e59f166 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -876,6 +876,17 @@ system_noc: interconnect@1640000 {
 			#interconnect-cells = <2>;
 		};
 
+		tscss@1da0000 {
+			compatible = "qcom,qdu1000-tscss";
+			reg = <0x0 0x01da0000 0x0 0x2000>;
+			reg-names = "tsc";
+			clocks = <&gcc GCC_TSC_CFG_AHB_CLK>,
+				 <&gcc GCC_TSC_CNTR_CLK>;
+			clock-names = "ahb", "cntr";
+			assigned-clocks = <&gcc GCC_TSC_CNTR_CLK>;
+			assigned-clock-rates = <500000000>;
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x1f40000 0x0 0x20000>;

-- 
2.34.1

