Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391267;
	b=g8/CQk9R42pWpiobL6hvYInqnUAoBiv5EmJswUabEt+2Mu1RHzDxW9nqwv7KkigLmHGn
	 S/z/hVwCaWA3V8CAmuFL++VJelly6qtoS5u863qKQ0cXD8xtQMqSp+9waGu87xZ+zSiuX
	 ZVpYZ4E9SZwjym4C6zJyGkCSnK8ikWLqU1V1Go57TcehCUfMj0CZljoCy0BjjomkV8wjD
	 qhdaJi+05Co0aczGkU0KhCMD6JO4SD6dtCtGI89ej9uw5RpuNCEm/D4NRi4jk/linGMly
	 7oornlo5zcpH/jqpdtkp3GSt62lkXKbgjDYiTkEvM+MrS9cjkqLsOXTlRsBG4SAmxYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391267;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HEpBBwY4m5scDgU0RA4B2noBF/zAsH0ctz5E1VEmcHc=;
	b=n7IkmhHeILpU2GfjFm0Wu3DQSHhh+J3eGrt7/da2YjOF11UONc6Pz8yTNH8FhsXuwg2v
	 XX84gM9R2YPn3ogwKez8PyfodSfQJ2sERYr26T8NbuZVIhIjRVYt4BXwN0tJqOQ2IX24S
	 W+DdC6+bfrp294xtIJdaqYmjbt+fbmTHMdTvVNfNMKaAQ79GZ39aptgFcq1bR3tX3Jvsk
	 IFGjopZErr5fwjvEf4FSiN0rAkJGszDpXWIkLVMi44/sHDtPXDcUsaltl0c6E4V7eF3S5
	 hZEfMTYPV304H0Vi2W2VXrasCamiUrFKSC6rB0NrqLuoGTSkdb8XaMKGhEhU0fpsZ7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QCwbsGiL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRJNyJJ8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA6C60A5BD5
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CA6C60A5BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QCwbsGiL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRJNyJJ8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KNUS1386440
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HEpBBwY4m5scDgU0RA4B2noBF/zAsH0ctz5E1VEmcHc=; b=QCwbsGiL8deVshBN
	cKsOzIJQ73WyK29znFgl01Xga7/uvYUEIct+HpOK+0/5kHTK4MnBex1/1pI0OVHB
	b3mA00840N4d5bldQbmpq6bIpQ7kfD34OgtTDxuzMCz3UGIElEvQ464oqVZPi3x3
	mz/qUwxpTZpN1bnKMimTZr8DtNoXVQJzK7y4z8riN+BRA3x980sapxsOWy2Okjkw
	3jNTZtWfvuPmX3oEkGtYCP5lWJKopTF8cF6yfhcAdGoL7Zlu/yVHsEkq/76t8LVA
	+zpmnJ7I/DP9fhNTxQGR5Ajmb3lLGXtBB3P4XejoWrYygVzjMFxZcQzHxyk39kZR
	5Eze5w==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnma0ef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:01:05 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c55ba309c2so3646294b6e.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 02:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794391265; x=1794996065; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HEpBBwY4m5scDgU0RA4B2noBF/zAsH0ctz5E1VEmcHc=;
        b=kRJNyJJ85biOA/kKJTj60e5iBiRXfByfWAFvSaolxQmJlXBxm04riDm4Z2EzvI0wKg
         6PQA4+MQ/yTHu6OC5Z6NFcCRUsgXR55nss+2gPAEb/j9UOzHWF+zDH7wVn6LBjJPRq00
         PA6a0hWfPHZfVc75pYBIcKMNZ9iiQg9MUtDVOT2rtqFtGjBfQ4Q2Gfc61RZmm0hvjwxA
         Um7RBArQbqdq3BxAH4nmLZlkfE4+D88OTchpT8Fg6VEp8mZjSYnFvz5QaZSQl83Hr+Tz
         dYqUJAdG2rSSuBY2vavkuMWmYGIEH3Ef0u9b393zsbUJUuEG4ritq2T/7sbzfCFbnqVB
         Q39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391265; x=1794996065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HEpBBwY4m5scDgU0RA4B2noBF/zAsH0ctz5E1VEmcHc=;
        b=Tn2HQZZv6GbJ5N911KMqneFWU/rFAiqqcJPLUkGROgLmnf4NAS/f7fU6sCvXQNiruN
         HcteorByExp7TnUCntcOiBGgrfTp5Y/WCuA8ZCae08nKqidxn4uoWcHjfm2xZUX/2o1u
         B1RUYYxvVzeL4Nzw5vWrCtuYPTfvZK27E0qzQeAV17udIE3MEiVduCuVxDJwtXK5ulrX
         y9M4l1o5Df7LoW8P3f9LnFaezCkR2A4jk5pg3np+94XrkbnYdhvGHNp1vMqkFeayD6Rq
         IZlt43kN3i+KOzhSeEqGcG6tkXPvQhVpxmrRURnHdN+JxuKPMmR7cvEBrj3gBeachlOY
         bChA==
X-Forwarded-Encrypted: i=1; AL+hErFIXrLiBXB+ixw73oD9GFbizwqqWtx2IbI9ZZjiW6hrRYkr8KzGrjjiOspYoy0B2a5hAjdTl7Buw40t@vger.kernel.org
X-Gm-Message-State: APuU4Z9vO1hSXQhl5O4KFuh40jHYiD8nOrYWIMF6jG6wFg+ZhqAneOvN
	nPWdtz5H5Dt9itYiwS1ikGr1SYED6GTu3Pj1AgxKG1eDah7GySqRrGZFQEjEn78Sp0KJzJIS1gX
	v9Pq+/CCJAzUCpbudxcJ4xzpEhX5VTFFK1x/kSlUgU1rtEUdDc9laJ2AVcmOKedRM
X-Gm-Gg: AYBFou27f2Yvsb15d8lD+aSpiWLBOy79bt9lWCSr3AjztSJtoiTOZB1vxVw46iQ4fLx
	taBdBBXn496Z0QoD5+tFyeEs3sMDmXP9yNyXkH5H28WJiwTOvCMpyUh5fpjIeQKLzkDjAeBZ+sv
	YRLh8tL4+8JEAJR4NZzH/2d/ewuZTroPRnb45M+hrkcjQnZOPBYCeT7SuGx/PaUi6W3G9886uVW
	mssMVrF4CbCyT0DhVr4e0JLfQ2+sjti1DVVvqX2tTprIg1OPwRaD2ahohrkF3xeQ3e4CH4sVRlE
	LfwPQoTcD2lG2JKtOShDHQoGIWO1zGkY1LuAkKcx2RNP1kg9w5eEc9l9yabkaaIXFLUuofx8QxJ
	57P/3KIIAoQNVV1Ol9/mT/KcaTu8O1r0rMa04OAkIgdW4gs3IFS7SrDzSdd2i4vrokkmBi3Bb+/
	e2vUFJbNSKiiUAbJYr
X-Received: by 2002:a05:6808:1924:b0:4d6:92b3:5c8d with SMTP id 5614622812f47-56b98d27ee0mr1503248b6e.67.1794391264686;
        Wed, 11 Nov 2026 02:01:04 -0800 (PST)
X-Received: by 2002:a05:6808:1924:b0:4d6:92b3:5c8d with SMTP id 5614622812f47-56b98d27ee0mr1503211b6e.67.1794391264180;
        Wed, 11 Nov 2026 02:01:04 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504c276sm4686111b6e.4.2026.11.11.02.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:01:03 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 02:00:57 -0800
Subject: [PATCH v2 3/3] arm64: dts: qcom: ipq5210: Add NSS clock controller
 node
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
Message-Id: <20261111-qcom_ipq5210_nsscc-v2-3-7e2c1dda3ed2@oss.qualcomm.com>
References: <20261111-qcom_ipq5210_nsscc-v2-0-7e2c1dda3ed2@oss.qualcomm.com>
In-Reply-To: <20261111-qcom_ipq5210_nsscc-v2-0-7e2c1dda3ed2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Luo Jie <jie.luo@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794391255; l=2069;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=V7tk6aEtOPhfOk+VPI7cIHGev2spKigLOSXp8SeaGFM=;
 b=FPdGwja/I0to/ZmRBr9rXIX0wX/bDKAU1xK3bC9dhG0h/+sBG00vXJCbM1eQXFpMhieJc78+d
 zQqoysUX1hbBKJPSNke8FUNppPMjsVdX2VfHSwBf+OW8jJwOM6o7cRU
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: fmDaAMUIZRQaIZG7ZqRTkNRlwjf1NiT6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzOSBTYWx0ZWRfX6xPGEVq9ALcZ
 ezXWVFomD94zv0+/I6fuPUvd6gSA3KTyoQZeIrGE+II0cTc9Xsf0lUCL/mdbg4Ci8b7DN6631sb
 mdrol3dDD8WY1yVkt0sRlmRtkuqnJLE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzOSBTYWx0ZWRfX+efPLUy+h8kj
 sRJX4i51FOdKkJwQ7Wn+l10Gd/5pX3ZXENoe4jezIpKxLmsQ+45xBoe9b/igsfFpI0N60fbNLCw
 dKCiPDtmvK2yoVw4w4rfZks+36HlX71G8pWU3DGlMfnmK4H9lMaK0ghOiwDduuqyXd0ihbpsJBT
 NPUUksntm1dyRxFRjP7/Z+loMdECi8zAmn5ZjnXJb35GsqvE5S5rT1bK8jzCOc98OMmzp0IBhF/
 kGuIyMUO0MRMMYYVMEgbPvDMSIMpvBoRXD2l9jIsTxQhHukFbsElElKo1HmGFTFi4zJgiXCMeJF
 TmkiIp6tH9V8HHMsRAomfd7YGR+OunMIybXxITDXBIxU8mJS1y3XDK4vc5OgbRAV+OqJQ4vhlmf
 lmbEnhBiVgeEuWBX55Rbgr9Oz7meSESb5DJwFx0aSWoZF7ukcxBmSFLHqR3O0fvgNwCVIud2w37
 ArL85RxOy0a+QATF8QQ==
X-Proofpoint-GUID: fmDaAMUIZRQaIZG7ZqRTkNRlwjf1NiT6
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af43ce1 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6SnK136Pe_QpXSRpRBcA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110039

NSS clock controller provides the clocks and resets to the networking
hardware blocks on the IPQ5210, such as PPE (Packet Process Engine) and
the integrated EPHY.

Note that the CMN PLL output clock names are reversed with respect to the
hardware block they actually feed: IPQ5210_PPE_CLK is wired to the NSS
hardware block, and IPQ5210_NSS_CLK is wired to the PPE hardware block.
Documentation is added in the DTS file to call this out and avoid
confusion.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 0c1ede0f73b2..11915f8eb156 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -331,6 +331,46 @@ frame@b128000 {
 				status = "disabled";
 			};
 		};
+
+		nsscc: clock-controller@39b00000 {
+			compatible = "qcom,ipq5210-nsscc";
+			reg = <0x0 0x39b00000 0x0 0x100000>;
+			/*
+			 * Note: CMN PLL output clock names below are reversed relative
+			 * to the hardware block they feed - IPQ5210_PPE_CLK is wired to
+			 * the NSS hardware block ("nss") and IPQ5210_NSS_CLK is wired
+			 * to the PPE hardware block ("ppe").
+			 */
+			clocks = <&xo_board>,
+				 <&cmn_pll IPQ5210_PPE_CLK>,
+				 <&cmn_pll IPQ5210_NSS_CLK>,
+				 <&gcc GPLL0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <&gcc GCC_NSSCC_CLK>,
+				 <&cmn_pll IPQ5210_EPHY_RAW_CLK>,
+				 <&cmn_pll IPQ5210_EPHY_RAW_CLK>;
+			clock-names = "xo",
+				      "nss",
+				      "ppe",
+				      "gpll0_out",
+				      "uniphy0_rx",
+				      "uniphy0_tx",
+				      "uniphy1_rx",
+				      "uniphy1_tx",
+				      "uniphy2_rx",
+				      "uniphy2_tx",
+				      "bus",
+				      "ephy_rx",
+				      "ephy_tx";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#interconnect-cells = <1>;
+		};
 	};
 
 	timer {

-- 
2.43.0

