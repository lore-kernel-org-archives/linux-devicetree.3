Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511612;
	b=wX8FD7dGoJtV6u0ehoIzZ4NT0YUZG0QtOTlomGXtNjnuFncaEy49BnjvF7ijDeMUJGYX
	 ubjWvquOkeEIe6p6rP78/cjuYuVsG2PsLt9ui9xfatmLFRRQHqcIzKtGRTDGz90SvgDaN
	 Rux69nB6Ut2K9GKnD8nj6ltlSzLuwhUQdZVdXC7JkmzJIMJ27/J0u32RmPCWq7VRa4LNx
	 b5v9Yr4tc2WwJyByVJWEbpzMhXjGSYCcpXbrcCDiGAs7gDD9k56JWiOEwGAox5A8Lt41P
	 jxX2lDeWGBF5cWmRbVDxSOoAnH32b5103xjXL+5lPJKEZg8HuEBzTRJiIc6yo1Rvs5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511612;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PorUwiX90p308WI3naAWjv0o1LYB7za/YPyaLIfmyi4=;
	b=xBBrs730sASBlWbVOsWeXjdd8C649ERThZ/6h+H614xhscRYax8EnhgdY7RAp1lbxpal
	 6TDK5eO4UrAt0XeTl0ygACaAP8MQbNrXyaXiIjKEV8BBoCDo8S80+G2JXA2W+uPi9fY5H
	 iStyYHg+7mhp9ZIXm5k3A6bQCoeNSfxbCQMOfYHh0QTV+JSjYmMoUKlrquhkUYTTry9K6
	 g8M0TkJXSIZBoB/3LhdTChztljyaDJFHwq0j+ux+FyTiSmUteKWumOVO+HuJMUs8GsNLa
	 iYKyooeGA4sDb0RRxdAdL5xORkgHPbkSYRTLi8uZvptBFNQOXOwUfSHryYjchMKd2fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RCK6r2LO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="M87/BK9y";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDB5606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FDB5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RCK6r2LO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M87/BK9y
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5mChd4136028
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PorUwiX90p308WI3naAWjv
	0o1LYB7za/YPyaLIfmyi4=; b=RCK6r2LOI9AyYFjrv7TdZ/xWyLXUxrWOh2ox4q
	4FD/UogyJP66210i7nQCQE5DR+Pd7eRpe0pvSvO3W+PdDSK3tjypitpFPjsNPJJs
	JQNazvMiWduLT2VCaxtII1swhD5xALAF+YQNInDM1HU+5VOWjZq1/r1q8OLz0BCt
	mROSoYEq/8UMhTJhVvg4NgTwBUpIfZuUcqKAJ2KvNNhz4a1h6bgxh3YGP1rwLAw7
	AnP0bc54sM579FEnzfYGa5RmjRrIGn65g6mVdKSxbWkUxoyUSp1OzzvcKiaho//U
	FZ7noZRCG1n/uR4u7iPS2mNwZHWyh3Ree32MizZ3nI2d8Fgg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpgtxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:13:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38531c1a566so3396557eec.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795511609; x=1796116409; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PorUwiX90p308WI3naAWjv0o1LYB7za/YPyaLIfmyi4=;
        b=M87/BK9yYyrqpNWV8xqTRawKmHtuJ0meC/qFzSrNV/TJSO75kjDdlhIHuNElTXHusb
         Tp3tpqxOR73VLX2SnUH3J5Tf4hJB0MljV5/Lcq1s3gH44UC+KoaLL0yC/h1MabxJD/Hu
         8fganaoXLSial2Rbp3xxU9xrztPTFRmE1M23aTLqlyq70kai+ad/kPXOYkqEdvVZptSk
         iv4D3n3r4AKp6D/WsP1bT6cNclO8c44rpNCfxiLdNLHsyO+2HkH0kZlSgicsoPrcw6AM
         6bUtni1rFU6BaunhDTHEZs4CiRMUGc5Kn/no8sHVhU/oeIddK1TpE6CiS9o55aWDam0T
         yGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795511609; x=1796116409;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PorUwiX90p308WI3naAWjv0o1LYB7za/YPyaLIfmyi4=;
        b=nHN4ip9I8r133bmmLA9XEC528T37IZYSXWcMWPdAvuw9LHjZacdNS/Ak+d+nPMOekt
         NhlnSaw/+Hg8lf1KO9N/jVLQtUYXyLKMoJ9HColSftptL/tcDVqlwlqsd765uK5wT/n3
         ud7tif4s88VqbtHCM4lM6Jo9mXWKIV9qPQT4GBrZP++2cci/uwotdAbHg9FtN+H+z+ZV
         lg5nIbNsjs39jvWK2RmStc8iB/cvx8MVlrVAq37cYT9iKMglwmWs3Z3hBB2ETJIDj8vq
         SaI1XaBRIFv9wu9P3YEJuEQ3CxuoUZd65cntu+R2cufjygxZvu11v2bHqii8mX2rZ0MT
         3wRA==
X-Forwarded-Encrypted: i=1; AL+hErFSLNN+C1H8GIi58YHWV8lNA2fUeHpRvMHzd7mx93DIBAumusDmIKj4vsi+2YsanztzQ75FdiL6DEbs@vger.kernel.org
X-Gm-Message-State: APuU4Z+6M6mZ+BRS3RCfTToS7Aw5lFOcxdHvixaIdVXo8x1jT1ngBeVS
	tzSpHyShQVPBj7VeBEgUA+NHxzrTuSHT3ItsI2UsE9m7PLMQ5i9yyTiQQFdCz1BbAFzTaT/GKBZ
	6oZChNphLaIuHuGS3c1+XwCFl+jBv6VgsER7I8JCH8UHt515rTFgro+bSIW/YDr4H
X-Gm-Gg: AZFdTZev2ZKUtjJ6qOQxZlyfBZDt++YC0ysVhHylFgnM/hr0KBQeSHHDuTZLSAWxgHq
	dMpBx0mvF2mLmhtUr/f8AjdtG5iu+CHNNeJa4lZ6NNrdLxtq2HknS3kSLD5Ln6197T1QzmoOyAA
	0JT+ZHlSrEmlpWim6nvJWv5dtgCFtHH56znbPm5Pn2QigFCIXa7TsUcFBpWWsPmGOqYOnl2fCCp
	PymwfYvzemIJ/xuvtlWBNwbStES01EmADLMT0QcsuVV33F0qSlhwb95z8Cqq2hO+kbKdp8p3ZJM
	2+mErhas9ZmGN0tCRn+iHbTR4oVPnR3GCAkDdXfx36pYvnrzFFmomPwukgQRvLjv4U+zbTg0fAc
	o0Zi+etVI1Z44SGYtBlxptwOSJqmg/cWGt/8iE42oA0ZnAiawC8INqTuCt59kFXCt/6dGC9qb6g
	jl5W1tb2ZezAI=
X-Received: by 2002:a05:7300:26a2:b0:386:a415:5436 with SMTP id 5a478bee46e88-386a4155a49mr8420244eec.0.1795511608800;
        Tue, 24 Nov 2026 01:13:28 -0800 (PST)
X-Received: by 2002:a05:7300:26a2:b0:386:a415:5436 with SMTP id 5a478bee46e88-386a4155a49mr8420221eec.0.1795511608303;
        Tue, 24 Nov 2026 01:13:28 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm75674312eec.3.2026.11.24.01.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:13:27 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:43:21 +0530
Subject: [PATCH v2] arm64: dts: qcom: lemans: Enable the Inline Crypto
 Engine for SDHC
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
Message-Id: <20261124-enable-ice-sdhc-for-lemans-v2-1-0bfa9ed6b4bb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADBVBWsC/1WNwQ6CMBBEf4Xs2RJaQV1P/ofhUMoiTaDVrhIN4
 d9diRcyySRvDm9mYEqeGM7ZDIkmzz4GAbPLwPU23Ej5VhhMYQ5am1JRsM0gqyPFbe9UF5MaaLS
 B1RFLbCqDJ9wjiOCeqPPvVX6thXvPz5g+69ekf+tfW+BW6zbaSStJZ6qWGiJb4iUy54+XHVwcx
 1wK6mVZvgIk2T7LAAAA
X-Change-ID: 20261124-enable-ice-sdhc-for-lemans-7949b5298939
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNSBTYWx0ZWRfX1eWNlDp4cN5Q
 vuAgA+Imt9l3oQV69sUyk5DBWPmgteEa3mshXmGeJms0c/uJw2ADvGNZWtE3mIOykQH07GU1H69
 7/qiNo06jp7QcOFv0JZGcStZJeGxJGqMMZmbCEThUsLTStUJF+W0MqqQqdKb5dcn2WSyTXXqZuS
 wNp9DiFXpsCmI76SNMUP1nORh52jBOiHDeyvmUE0jr+Gp2SZcIMVlRg+oGGm+jXibxAM92W8sz9
 01nf5txdPZsP/81qO/tmq9FnPER/psu/l6dbonnckCTN6H5N0tXkVo5xEHwHtcvuCECNUqYHN3H
 JWUgluKQFsCUpnzzX1S47zmuGZrjvDZI9EZ2eNTbe6YijeExJUg0xF7Nj+mADAYYpihjc+6567v
 3Uzw14FjXL+o5eoKhx08aRwSoDtT8wgRP3011troHqhO+0I0sk+zNwJ5I1XnkXDveIVhqi/qcdG
 IYzIGC4vldBwohMTlkQ==
X-Proofpoint-GUID: dbCXsv2QXBRuROLoDdivemVsr5Kwqnql
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b055539 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aDrDLeE5ssBeLXbAN28A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNSBTYWx0ZWRfX3J7gfhhJeQxZ
 9FmPvE95yPa1WKF/IAtMVp7iDvgdQkPFG4yTEkVs6l6KqpsdUjszv+D1XNTffLtJorxSaxqWBSp
 G5/Z0Wd3XARpxw0qAy4/qa3EsRcX7UI=
X-Proofpoint-ORIG-GUID: dbCXsv2QXBRuROLoDdivemVsr5Kwqnql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240035

Add an ICE node to LeMans SoC description and enable it by adding a
phandle to the SDHC node.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
This patchseries enables Inline Crypto Engine for LeMans platform
for SDHC storage.

Testing:
* dtbs_check.
* Validated on LeMans-evk with custom Mezzanine board for SDHC support.

Dependencies
============

[1] Enable ICE clock scaling
    https://lore.kernel.org/all/20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com/
---
Changes in v2:
- Rebase ICE SDHC on latest tip.
- Rename ice_mmc_opp_table to sdhc_ice_opp_table.
- Link to v1: https://lore.kernel.org/r/20261109-enable-ice-sdcc-for-lemans-v1-1-1f25debeea49@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
index 0be39bb9de1e1cdbb7d67a992172861a5a10a05a..4cb3af416a3fccb094ecc3022aa937669a8d4ce6 100644
--- a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
@@ -1651,6 +1651,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 	power-domains = <&rpmhpd SA8775P_CX>;
 	resets = <&gcc GCC_SDCC1_BCR>;
 
+	qcom,ice = <&sdhc_ice>;
+
 	sdhc_opp_table: opp-table {
 		compatible = "operating-points-v2";
 
@@ -1849,6 +1851,33 @@ lpass_ag_noc: interconnect@3c40000 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	sdhc_ice: crypto@87c8000 {
+		compatible = "qcom,sa8775p-inline-crypto-engine",
+			     "qcom,inline-crypto-engine";
+		reg = <0x0 0x087c8000 0x0 0x18000>;
+		clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+			 <&gcc GCC_SDCC1_AHB_CLK>;
+		clock-names = "core",
+			      "iface";
+		power-domains = <&rpmhpd SA8775P_CX>;
+
+		operating-points-v2 = <&sdhc_ice_opp_table>;
+
+		sdhc_ice_opp_table: opp-table {
+			compatible = "operating-points-v2";
+
+			opp-150000000 {
+				opp-hz = /bits/ 64 <150000000>;
+				required-opps = <&rpmhpd_opp_svs_l1>;
+			};
+
+			opp-300000000 {
+				opp-hz = /bits/ 64 <300000000>;
+				required-opps = <&rpmhpd_opp_nom>;
+			};
+		};
+	};
+
 	usb_0_hsphy: phy@88e4000 {
 		compatible = "qcom,sa8775p-usb-hs-phy",
 			     "qcom,usb-snps-hs-5nm-phy";

---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261124-enable-ice-sdhc-for-lemans-7949b5298939

Best regards,
-- 
Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

