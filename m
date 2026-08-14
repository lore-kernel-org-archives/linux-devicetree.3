Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231933CD8BD
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 14:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786717366; cv=none; b=myxAGfU2jlyvOsVAs9Yz4E1cKxDtftMmzA3GRjRJwg60dpDRi9LY9I7ifJGaeO8Dd40e6pdGM2WZDORjFyNFB2pK8aTbfON5SpgbJGuLSfTk9CF5z9YNynN+4Mw6gTF1afzOhNkabW0FSu2CbVZHvQtiVm0tjgQweR8AXYD51MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786717366; c=relaxed/simple;
	bh=dOhqOkzXwdjY7dpH09KEdu7NMOW26jnhkkuPD4V5HAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EReNcs/a9h0kTkWoQT0CsxcCXFGA/pdf1qxqWbaIWWUpp8mL5n4C8+l5oyAn4uGKu+JBMhGQPlX9+Xar3k+kmOoTsO58kyZLXUYILnrMhpLhJ3Dqm2c1RiS5cCPRWPimykzVSjHZP98mt/+/WZG02P79/5YEXii4KELrNqW6uOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Au/47Dmy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kLHlsVwq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Au/47Dmy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kLHlsVwq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EDx60M1536539
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 14:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n6Q5RlWwCynVFlu2s8MiterOx1z4pE2fafLr2ecIEQ8=; b=Au/47DmyhCPWh1kA
	n50EmTpn4YCKua8Q6Jd/zRkOkWrvJkFkT4LpQ5+Oc+eju3hKyLE8g8/XalPyZmXJ
	O1X8CCi1zdy6AttSrqqFt2RTyeRa3bcY3HahyNRMKVmZFsjrHQp7njoFjHW/QvBQ
	3+BhUZsqExn0LujLCY3t1GLdXqYkm8Qy/Qs7FmKXPyj0/Ajo63R2ewZ0eTB+Fjgn
	B4zSpyc/fZ4+Kr1fzQY/2YCnfq04fHwNrXtOLcliGRrAqogiNHTdUiOtDNH257uI
	ZFGXtDtNtXNzEpi8bL0G7WB3OeU3jOvQCDYe9G8HXhww6ekWsr+TCzKRjfN1g4Cb
	TKwvMA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g20tr11x3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 14:22:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so852924a12.0
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786717349; x=1787322149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n6Q5RlWwCynVFlu2s8MiterOx1z4pE2fafLr2ecIEQ8=;
        b=kLHlsVwq/rcz2vGWBzFdXCbxJOIpGSj6csKwBWkbGcD9R6djW9B3EIWWAiE1YwIftx
         emRrJp9BCFA8bk+BroyvALdp8Ub0FBIZEzhu4I9nW1369JA2eJw42H4+JhdCGa+CP/m5
         aGCUiR5iWSRRT8myKqDcD/KDB5GM7t6e2Invll2NBOdPxRS3l5zaAH+Y6Pu5qipREUgM
         5woGk4brIHZy6pULW0XZgRlT61VHITr/c+iKwy/C/C6Mj5Cr8LR5H3vQ8Kf6Ewd1KBTU
         j9w1TSP38lThhXVTYz86fPoUYyewN5Z4J/RVn9YH+Yp2SBjYUSGRhTAtpoiUq7mTCW2M
         3bXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786717349; x=1787322149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n6Q5RlWwCynVFlu2s8MiterOx1z4pE2fafLr2ecIEQ8=;
        b=k0zvvenGjaEh3ly9ykWBXRqtcYjAosk5bsGAp1dj+uKIr/gzPciVuBJxy+oIr8+O4C
         gVB+0qW+T5qLEW4pABWcmzgOQ394MX/GeMVfInLAjCLja2e5NnhKTIyZUNHiqN1VW3G0
         tEpqpxzb64s3htliN5zBLHM3je1GuQDYPajVG4jdpw3zox/+XpZFziAqmD4uIfGfAGtF
         XyZBwNmMYrP8yQPumZVo8p/Z6mpLcYtDOA6zbRXxElmx7DktEpOyvVHbyCpmIDhr+IS5
         +tw/RCtjosX0adt5S9IaLLb6qdgZjSKKU/6Z+vSWWnhjBJ+0RcdNCMU4kHpbPmTrhh+y
         Dhdg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8fkiKlHK7eX80wIUhwRu/hbdj0gScONu1PjSeFU7xvLotE2BT5XHHVYLlDYglGZRY70DEPoykypNe@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn0pSFob0w6jkmLFw4PQldDBb4zg9ijuR17WYRhjXQuPdnBIna
	3HsMkkOmje86rFym7Ts03+nIOhk2UFxJNQ2EYE3GBKgwgf1zLiUsnEmYXg0JqXKkYMD+uEE6ToZ
	vukfz7wy4OXzC8IZiMM0PWiRTg6pzjQNco3Pq5YPsrRkaFOEltQTW9Ts0ZjZSIxBa
X-Gm-Gg: AR+sD11+lzmJb1NxvL5hy7ofQda2TSkAj7lwh6q10w+O9bzsUi6NRMW0EbrXQdxKqwT
	iQJB57ILnKEXha+Gv1Jl6/foeuprdRTl9ibUDWDIYq6l8kwM2RrxYDY6OXSHuWNcPGmhXbGo82f
	YLRiHZOEgnEGGFSkdHIsT3KmrVCYwo9lZt0988mZVC7w1vRsv40s50HlfSn4ui2vLnupHrPmwPc
	hBA5AwR/c4dzwucik6izdIIXWZky18Jbivqx9IGZHvz0jFRSVoxmC7XkH+pRl0n2pCJin8HVJ0O
	L9wUD8+ojM+YYENdFfsI7KOwBd72U7wr2+eGyS+vr824sQQLyvVSOgAPxwaDiE9gBBDT4/9nLVh
	VTYkxdW9OmSSlTfuPdJQOrcXOuuoHoGQxiGCD6tXUsM4=
X-Received: by 2002:a05:6a20:748a:b0:3c3:a9e1:a819 with SMTP id adf61e73a8af0-3cc71fb5781mr7111761637.24.1786717349186;
        Fri, 14 Aug 2026 07:22:29 -0700 (PDT)
X-Received: by 2002:a05:6a20:748a:b0:3c3:a9e1:a819 with SMTP id adf61e73a8af0-3cc71fb5781mr7111678637.24.1786717348524;
        Fri, 14 Aug 2026 07:22:28 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ead105a9sm4895520eec.31.2026.08.14.07.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 07:22:28 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 07:22:26 -0700
Subject: [PATCH v2 2/2] arm64: dts: qcom: ipq5018: Enable MDIO buses and
 add ethernet PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-qcom_ipq5018_mdio_pinctrl-v2-2-ff90d6605d61@oss.qualcomm.com>
References: <20260814-qcom_ipq5018_mdio_pinctrl-v2-0-ff90d6605d61@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5018_mdio_pinctrl-v2-0-ff90d6605d61@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786717346; l=1193;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=dOhqOkzXwdjY7dpH09KEdu7NMOW26jnhkkuPD4V5HAE=;
 b=HLEKBmbpFugGTiraEJLH8a2E1Z7wcsJ2SEnRnl2XdJ4z4XZK3KpiTX4ywOe5+i3upSUz+BG6i
 NiJ5A7Fx2fcDuaF0jKs2gs5RNvBLpp8mJiqdpPO0l1G2Wnrw007irqV
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-GUID: sp1h30Ghyebh_KLmHjbj4oL0TLEj8QDa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDEwOSBTYWx0ZWRfX0n02W2NUPG2l
 wjf2NxfXdUNqLQOsZS3M//Zn2Tcw9DX9F2+GvmhhRvwD4/nnsELnEmmNSBd0jYlGkfYQCpz9Pdn
 qrDRi7KChYBNywCTLazviK+X6X2wRJVG0yHMGRlWc6+mqO4qttqZkyMENRhkv7Oul6kZb4b4eTS
 tpr80Z607PJYObrBmh5YAB/16RnLwetzIedHKn+j7feDFuLiTtGvhQjkhxh+2asdrMbUKi62dvg
 89PjHLuLtzPRA7IYrgZAIqABO4TJdk9W0pJ2kKX9USLJbjoxhpo0Rb5hm83COcUEmSQdBfXUpFF
 +vyi+kqk2ZXGIODR4XkkCVcGnBe/dRoNRutentDIhIKZcbGDUV6FEly3W214ksiKWykKmKvHt0H
 5k/4HmojpEI4ae+CLCUTvLnFg0xW3bYY1UlcO2brj/N9R7fD8xFFbXT5qccOqP/pLZh9wj1L9Zq
 0rVg4oaVfcNXkGjxLcw==
X-Authority-Analysis: v=2.4 cv=UrdT8ewB c=1 sm=1 tr=0 ts=6a7f24a6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=GcT4D4KdeairXD8JEV0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: sp1h30Ghyebh_KLmHjbj4oL0TLEj8QDa
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDEwOSBTYWx0ZWRfX71l2/EuDYEMO
 v+e8ZlkfwVzXhIeyAvPeWCRdfAshgfEHOtT9me6GDx/aQnoVtVq8vm9hTOEp30/f6NGYIOUhzWr
 mvNtd3xSI6/uxbZGdxhe8x7248mxq/Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140109

Both the internal (mdio0) and external (mdio1) MDIO buses are present
in the SoC dtsi but left disabled at the board level, so the board
currently has no way to talk to PHYs on either bus.

The RDP432-c2 board uses the SoC-integrated EPHY on mdio0 and an
external QCA8081 PHY on mdio1 for its Ethernet connections. Enable
mdio0 and mdio1 with a 6.25MHz MDIO clock, and describe the QCA8081
PHY at address 0x1c on mdio1.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
index 33eef92b19b1..aed8359b1931 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
@@ -30,6 +30,20 @@ &blsp1_uart1 {
 	status = "okay";
 };
 
+&mdio0 {
+	clock-frequency = <6250000>;
+	status = "okay";
+};
+
+&mdio1 {
+	clock-frequency = <6250000>;
+	status = "okay";
+
+	ethernet-phy@1c {
+		reg = <0x1c>;
+	};
+};
+
 &pcie0 {
 	pinctrl-0 = <&pcie0_default>;
 	pinctrl-names = "default";

-- 
2.43.0

