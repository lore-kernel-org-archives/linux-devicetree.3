Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EF531B101
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 21:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788123746; cv=none; b=UkGDZh5JIuJbF8nFPSIraMv+AMqWLe2+SiT1bByk084YIliqexMv9J89yvYUp95cVqDwMoKhpcAlPMJJMSdjKsc73K+MgUCQngjNr/3fO6Wnq9V7v76pMZt3Ehi6wNaHdwNrfRzLyM9dPWEomXHKOOY/s2ThX0jiiqeysPub+uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788123746; c=relaxed/simple;
	bh=50CKG97HW6ukTJAn1Vbg9cu6CFplrbUkkI9w170RsGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IDa/nxErmx/PpPaHB/uGzbzVJLpDV54CDCUAMWxb3NjEVcZ8CpCBC69l+pgoBsUAZJyjwvYQn109ythP3lJ/TEH/7mEBfJxkFySOxn4oGRWb4Gv/8JP+tfL47jIoxLd0dNggDEJHDzgkcCOX7bl56lHLfWhs/K+TLvPWgJ2keR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k4MjVYPy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOhK639M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4MjVYPy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOhK639M"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UJK2nl1217218
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 21:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cJYxDR3XE+AeLGY7hd78j2epCFifkxtdtY1uZSep924=; b=k4MjVYPyXeydBvHq
	at/bXQZ30oQmwlvcJs3EyjxFdaHuBsgH2jLPT6yInCITQxU9XW5NUnm+6eykwt7s
	VHiSY2CyKZPIlXHBjTQ3s1E/5q6AbZD7HOZ87XmdXCe9GokQRaWG6KMXB4VMjt8c
	BG632tRyqWWps+rYMHjtj0TmyeJMo1y5tt0XqLemDcuQebXROCM6MRZ/OuNni2HR
	cxnqnkjrLQ/ZoxaQFBF2mwTcW38wTAlNTx+HZPhYGSlBTFN0nusIGemtI0PcDpx7
	ZxK6V4GSkwoC/Z/Z9iEjJ/vxFqtoU9g+cL+Fn8+kqti16WGkv2THxsDRLzNZ9uxW
	ShElaQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqe2bqeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 21:02:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so4878943a91.1
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 14:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788123742; x=1788728542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJYxDR3XE+AeLGY7hd78j2epCFifkxtdtY1uZSep924=;
        b=MOhK639MzPRADb0reiQMyIrRgjgLAb63Ie1SZdOwcheIx7Ax4g0++cZP3DWRHoxfSN
         JWat9xLTX7gAqYn2JjmiS4I7GvRbUwNJCaqAwyLKzDPXn6TBC+orb4z94wxOrfClSQIj
         yuK+S+Gh+9otjPkdHlGKL0DpNz+eSvf1DhpfoXVmrssihJK7pOOi5BGqCYZy4tqmyYxQ
         d1H6nqoe753ws31MY0pEbcRY0Rjgw6dg9Nu7W2OrTz1Y64ELwPOZpIg8CUjx5h69QK7s
         BNUGwiEWSQqPwyLizkbbzw2rq7IJAUp131nFF1ztHZK1TEBvzIGPPT+VirLnnzKVbO7Z
         4+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788123742; x=1788728542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cJYxDR3XE+AeLGY7hd78j2epCFifkxtdtY1uZSep924=;
        b=GRwYjfTIE7g6SGzvx5fAhGPSm00R++As9f5oe40cUDGzK+FDZeZT29joGJIM27B09z
         L9ifCPE2sK/4kE0qQzyofMG6i69EceADNESsqDhmKZWbdatqY2T+iRbNp/+yYkJrHTSx
         iM0mYfO+FVaBvziVreSjeHsLiWmgpZ53UOvesG6nLeGMigLP1+lfLsYyEgnsDNSzcN2s
         1lOqOIx+COR1w7wQ3MgH4K7w8/dKpoMYllx963yQyKf+NuvV2SXuqkwMb8/Th1MlxNCN
         mAqJQ+/wUqcbDocsFD8bVB7TG1Pv9Vd22kly0BSs8xThbuOHO2i6j40z5D4537dKGTlq
         A4jQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRFh0C1Q6gZBt5jn/CRFRfp3f80CnPjC+ElM+0LRCoXrkN2EtZGUUaFEl+xk4e7wwvXUcRqQLn2zig@vger.kernel.org
X-Gm-Message-State: AFuF++mbRXnKoGr4WX7likB5GtCJdloGRF8Yb+sG0fFF8nOcq4IDUfhO
	Cqifmx51KFzXyiBGvxb86TDzR5fwDS+dgHvpKZenpn22YH5+lMHUZfCa5L3Ku0SR/1QzUifoMaO
	+a1ibR8SuTetRyvkpIunE0070uUmRXZ+Qm/d7ZDLxyIJwhH2C0goGgDy5lIQIQGRe
X-Gm-Gg: AYBFou3DXtskqiEN09cQTr/k0UlWVxpVKckww8mX6Ab6yV0doL5ptX7wDZ+K/PeWFwa
	lZ0bbg92dO4GxLfMcRVyMy9Q3fjXPi9uCbBsVJf1hsuYFYs1s17dQNnt/KAXubljrThqC39wGSh
	dfMogRAzFS5ix4ZTdu4vfR03sG/9pY3Wraai6V9wkCzHtzP2ldEUfM2VKPrES5vnWes6QnAebyY
	5g6xt+Z8USoQ5cJrKT5j+/xTFLINBuSnRDc4KydMuweOE7dNRSHd0vCF3BI8P1ks2dkZ6a0EJoG
	M+Fb7jt+j3eVJxUFiPi1Im/zsQQ7CUwd2IKwvj8q61YRKMvJvFr2Dmxq/OTBF40EtUduqFzvtLb
	8kbO1CfQY5QlpYmXAmlBEQjrRxSfRr9UKC2TTQtCQSw==
X-Received: by 2002:a17:90a:d887:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-396d0ef8b54mr38328934a91.14.1788123741892;
        Sun, 30 Aug 2026 14:02:21 -0700 (PDT)
X-Received: by 2002:a17:90a:d887:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-396d0ef8b54mr38328862a91.14.1788123741451;
        Sun, 30 Aug 2026 14:02:21 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b49c867f5sm10980013eec.2.2026.08.30.14.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 14:02:20 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sun, 30 Aug 2026 21:02:02 +0000
Subject: [PATCH 1/3] arm64: dts: qcom: hamoa-pmics: Mark pmk8550_vadc
 thermal sensor provider
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-hamoa-sys-therm-v1-1-27108c40fba5@oss.qualcomm.com>
References: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
In-Reply-To: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788123739; l=827;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=50CKG97HW6ukTJAn1Vbg9cu6CFplrbUkkI9w170RsGQ=;
 b=U+69n+LQnCt7imBiaFZ2MNif7fKQgpIEqliVeBgvOatCyXDPiiC+1oTORwRl2ComBwwi86p1/
 m/O3/6PGgJUBtzxf+8XWrff2Eta3awOJyDhiVKRn8TI2u2VA8pQBWIv
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Authority-Analysis: v=2.4 cv=Iskutr/g c=1 sm=1 tr=0 ts=6a949a5e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qs9X68h9gMtM_QVZDb0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: w3BGzTGfTEBtmkfZPP8M9PP3Hwfg-Kkk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDE4NCBTYWx0ZWRfX0BzZkdSUR2Pf
 vadV5u4oE6Eh7k9rG7S4sQPme5H1GpysZ4vL7bIAS0ure5VU8l7jHNFDP2YFZC89AbyL7Kd2DAX
 HAVGdQezzGcnCyvMzA6YtG1LWtnUwCUdWWLoR9PCEgpNpOxL9kWKk5MdDKacWTIhpTQzNOA8g84
 aKWk2kUyhNjTEdZKpQoMso1r7gMxrtgWq97zM1zyzhz3ld5YK5RY0h8dosB6Rs+oArwDo4bOB/n
 7s9XUBmu/lAUCRH+gShCfTvEQP7/CSMoh28P7HhOWd6BqdLZuP5u6t18fBc53fzjrWA5qNvRKt9
 9A1mseQxqkgPP/8ph4tV9fwJxNX+gY91KlEXZUbbBUjf1rF7LqR2Y4pofTzW+fWv4aTg0nmlvoA
 bdCV589LFVtEjJAA5hCkj2QoDsHVpJI6QyYj2EqxWuxse19K+9chL2EcrQztlAl2Cw5v6vAAg8B
 SThodk4yGNbmVL0s8Mw==
X-Proofpoint-ORIG-GUID: w3BGzTGfTEBtmkfZPP8M9PP3Hwfg-Kkk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDE4NCBTYWx0ZWRfXzCRCC6uu+IWN
 GW1jFDAcJc7YfW4BWnLrp/+ME2XJrBV/7yjws1hil5klsko/EnJCn5ndv3yhtldoeVeKX/DAEpr
 kiOoQPDYGv37o/EUv+O6nt+nmTuBOkk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300184

The PMK8550 VADC is typically providing thermal measurements based on
on-board thermistors, define #thermal-sensor-cells to allow referencing
it as such.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
index 17d754d57e18..7fad4a9b92fa 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
@@ -288,6 +288,7 @@ pmk8550_vadc: adc@9000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 			pinctrl-0 = <&sys_therm_0_gpio3>, <&sys_therm_1_gpio4>;
 			pinctrl-names = "default";
 

-- 
2.55.0

