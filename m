Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB83A445AE2
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 08:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447067; cv=none; b=TaL8idUb2JE+5EaJTEtFXcSgk7qSfnnzfKvwQ2chEvw116rTzdKE+XV6Q5EBOss1x8dPgUtyBRHxa/OnZRKWv91bpU2t4UHcd6oZq/VqsGw+0BqGp+mWrOKedtgWzmIF5gIjAh1pYGwgT/kHLnyniNCr1fGM3LYDNVFLpWJnXKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447067; c=relaxed/simple;
	bh=DvQ8wWjzAFYX10JuqGOvkohCd+ko4JNFR4il8Qwjgbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kfJw+SVdGQ3eTb77A/ekL1snsTsgdxfQ97p2Bfh+3BUFJtbLTi/wn/6hvnIGuCLVecm5sl8pXjXR6vOp73ejU6jqDWWjbdXGZOHZBX8ry7iTQOzG86kY4Ee+e+5OfL13/xlViQZ3OY7IBsecRBmxqVpaiu3s06/642cMoT/Sv/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CXM/+pF1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DDwNFC7u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CXM/+pF1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DDwNFC7u"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KO9D2167101
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 08:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ilmh++1N7R6
	5dkDcOOtxHaZj9s5Kb/r2ALcRYTEeVlA=; b=CXM/+pF1DGPpnRqE4xlWxFiD8q6
	f4/t4u/5gOHemlS+f8Pv4IY+GUrtoKAgYFdYAiOR1NExyk222fznyjAu+PXO85yU
	OFpkCZvAKS/P2NLWENO3RDo2nza4MDc2yR+ikupPwCEmq28QoJfLqZRcaETQxewV
	JJC3CySS2IvcBhDx/dfbbFyvi0Xx4c+EMgnDEGDmX0lsxbZ5aXWT621+bT5ef68s
	w1G0o/wCTkcJWdRqVC/nQxCq1f1hgyObdpdRZE4fd9sprN1qESZ7l7eLD8XG5sjM
	nzF6RHb4R0OMdAeKu4zfoydJPhJjwJNYQ7QPWy9pJQQaZ6/rBGhmUD9kbtg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2sypn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 08:11:04 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-147be78cd56so18058727c88.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 01:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791447064; x=1792051864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilmh++1N7R65dkDcOOtxHaZj9s5Kb/r2ALcRYTEeVlA=;
        b=DDwNFC7uu8X5ZBlywCowZVf2Omr9cndDTx5ndfEbP8zw1IzpqqMt5/acIlkdPyCyA8
         +K3p+AJ8b1EEX2Qlea1/2LYURp88R9h7y8Nq0X36u8U1gZSLFR8Hv3MnPJbH2cZCQSGW
         33OgfoXzagBgROM+2W8dhrcbA7iXVAFDzhs1z/NNmOjeTA7NaWiJoKGebpc5i8meuNRx
         f2q5oDrtmmraTAUM2eDv5Dxy3ZwCnqxzj2pJ2JBKM3KS+LQI5avCn/09CXrSzeNrB9aE
         7Gd906CuiLYT9CUPokRApGNa269HktjXsevrEZj8GDR3TbKvB/jKcza6OOk8V9+Lnp7U
         H67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447064; x=1792051864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ilmh++1N7R65dkDcOOtxHaZj9s5Kb/r2ALcRYTEeVlA=;
        b=Nu/K4dXTyJxLv75Wx9APY6o/a7Vym0PcN/b0GyvPYv5pEqEUfUSX8X62ctWK/ui4Et
         YOlsFOnaLklzcVPT0mf9zGqsqNSw5GCdHV2x26r5WRdqYbl2TLAOiH1siwwSHoNzHWVr
         1//EpVimSWS9CFYpUO2luNldJxfiU3rG8UUC/jEODNgIDUmo9SQiLvxYx90LVOGvrDde
         TYPnfbxtNH33gnCEiQzXchHUIaKkfDoQQ/J8RbrkLAtXe6g42Ns0089z9KqODY1/klvK
         26x9IAqyasIq23UQ5qCqM5iKk7YtQVpYuGEHx94jzkniHqTqwvMfc43JVYbO+DQxlMXn
         BdYw==
X-Forwarded-Encrypted: i=1; AKwUvBw+LU6g1ptmRMpG7OHGPAuHpqGQ3GdLHADrOKvY7624ljPjv3BtDP8vqMEkz6I0rBCH0sBmx9Rqluy4@vger.kernel.org
X-Gm-Message-State: AFuF++nDP6BjFoVeuq9fsnc61yDp3JRzEFS+iXGvwRbxAP6lj8IV1d37
	InhSWKc75lg0IgkGe3vT0d+BS9tIQrQ2Mih1E1i4bWT73VFOwTwi1BqubWeDtl9MtM+FZ76mmbX
	SIMZoDb5IiAtPXjjlWpIXKEOzWjlJ9/m7sfMACTxMRDXFwaYq3oN1+9IplQuWJ2JQ
X-Gm-Gg: AYBFou2EjGVDORxjjRtmb0Tn5rBo3uh4PDo+KEhlDG92kvAknW5I3BGlQ4af69LSLDy
	wT3eJJcb/jLtKJcZZdcTU60lBcePapJd4GtVII/k1Klp+pC4eN6qgrxrgvEzbc8tQfP+cHARiRF
	tIR0rmQzfGJJ/dhYLuYRvc2YhncqbfjAIKwPX+FpSozIvDO/J9+SBC6ltpTLHNyJmoMovwbZ5hp
	wo7so9OFy6ZkyYg2jGdB51h/bhpW/GWPy3+Yw82nKgG0wQl0h0TI5cuojH4A1SnjQEYDCSMEmFj
	FIexLiVHEPqS9lbtfVCQIUwuRDGYb0qfUzYVSpsOUYelAwCU3oAZkmsf3blR60PIVEu+xfnkQDF
	Fv2w7PoeGvLTGO4koT5pTboJElJkEk4KXozkR/97piMo0XWw+U/VKfKP69Bs=
X-Received: by 2002:a05:701b:2096:20b0:15a:9834:73c9 with SMTP id a92af1059eb24-162089f4544mr5396702c88.40.1791447063248;
        Thu, 08 Oct 2026 01:11:03 -0700 (PDT)
X-Received: by 2002:a05:701b:2096:20b0:15a:9834:73c9 with SMTP id a92af1059eb24-162089f4544mr5396668c88.40.1791447062702;
        Thu, 08 Oct 2026 01:11:02 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16166121f2asm14522277c88.4.2026.10.08.01.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:11:02 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/4] arm64: dts: qcom: glymur: Add videocc sleep clock
Date: Thu,  8 Oct 2026 16:10:34 +0800
Message-ID: <20261008081036.3492003-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac75018 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=kYVbGFCUSVokFan4DuAA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: DeRhrKNTt41y6ryvhRrfxKT0iOQHsLO2
X-Proofpoint-ORIG-GUID: DeRhrKNTt41y6ryvhRrfxKT0iOQHsLO2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX3zVzTpCVAt+W
 +NysogEiuUD/Nipkd9ylUvhhV2OmidrOM3tUhtTannGEdr5Opxe6Kcqyy3Et5ZFwt4Dks6NYi0Z
 OBUbRsjezTRkblDP8OgPgN9oanzLXL8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX1uGdYwZJY96Y
 dKznzdVFnn7TJJ9DkbF7kKbURL2LtLrF681VjpBWDqZqYl7HbXkfgO7Hzj6Ea9upylDEHoBWnHe
 /FuvNey5DMXoPwTukg5OXAFpXz/SA82R5JhoH3DFeNbM8wUFjUDgm8b+R1zzvJu5beGi5WG09LN
 r9LZV4nMpM4UsgKj2CNxxFaqTOK/2ReSJK3GjN/XRqFqdd03irIw2B+n3n27C1z9bWdKzxhGUWH
 8SqCLm4qoNHFmjKqkyIyXtvFuTBMdVtT7aHTy68qul0Uyw9Q2m4kHisDUMuPUdKU9865k3WjXMC
 obDr0zf1Fm/zdu42FvUWBMr26AuOST5upfuWf0QMAhKJEUpLldYXEIOkl4czX2iETdIb18LBDvu
 3RDGotOuBlZAa5IS0OBSg4uoXk1mwtwkWu9GGHBJec9qQmysWPID/AUklSVWxasNGsGx+zYjxsk
 eTOva0W7bSjSCJ2dSnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080032

The video clock controller binding describes three clock inputs for
Glymur: the board XO, the always-on board XO and the 32 kHz sleep clock.
The videocc node passes only the first two.

Pass the board sleep clock as the third input. No functional change,
the video sleep clock keeps the rate left by the bootloader and has no
rate consumer.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..b389f953f97f 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5810,7 +5810,8 @@ videocc: clock-controller@aaf0000 {
 			compatible = "qcom,glymur-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK_A>;
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
 
 			power-domains = <&rpmhpd RPMHPD_MMCX>,
 					<&rpmhpd RPMHPD_MXC>;
-- 
2.43.0

