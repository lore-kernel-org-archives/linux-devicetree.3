Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0359A3DCD83
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 04:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792213134; cv=none; b=pnrYK/N9H/z9ZeO7o441x9NCiJWcxHGQ/0oWt71RsiwaCf9nIGYe6NLGjhYhcnmI7ou9j/ODyfsg8ps+iDQt9fw97wyMwe5y4ghnsiJL6HeXa3gywbS4UQHJarnb1vP7T1jdhAeqlvPDAn1Woi2F+i0TG2N3Hvlv0SJ2nYWRez4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792213134; c=relaxed/simple;
	bh=2eQRHgppbkcSpMqh2UZLhmC13xrKz1QPMZmh+unhBD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZT7sVSSLW1Mi65gC367Yl8Ph+VpIYrfu/PJLS7WDsjgSsRO1PoqmDU7Ib627+igLg6ACJD71C1qjKJEVbsjQiIe3bhSZRKuSVoBfZ9YjL2EkCgv2/oLpMS8x7EMhcBO1qjlkYN+EdZut1aGbeatzSjdBY3r/9YPlsfPQ+aIp1hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iGUxQddI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YmUGRZaA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGUxQddI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YmUGRZaA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H3Pl5U4134332
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 04:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OGZPLB5j5vu
	z9k8vw17ZLseNAVbY8N/wxsdlErvLb+0=; b=iGUxQddIo8bFvJI6NI9eHLtS9LY
	UJYRGWfSfZfGLZuu1a5lrsO8/LqRGaP/h1Rve9R4xFoNG453TYNzpD5RitgeOo1k
	kQ/3oKonID5mlK63IEVAC9YNUHqcNucQQStJg77rrVZn0yEbLsAwubCUhlCspwDj
	SSNGotio/rSXLqA1n54WTLGFPjel/EMQDLJEacj/uOd4Wd24u2gZ36HeMSDgSWTy
	aucYfbSiDJpIqlfUlIWuhpjehu4KEdImXD6oJ2iQzhMmygN+nas1BONGwcf8dW1Q
	wXcmoS8ZBmyhR4yuLbLnkP6fSD4drJBEC15hfLqN1Ms1At+Z6U96aIj3dAA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc13ur5ag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 04:58:52 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3425098ae4bso2304428eec.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 21:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792213131; x=1792817931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OGZPLB5j5vuz9k8vw17ZLseNAVbY8N/wxsdlErvLb+0=;
        b=YmUGRZaA3pu13QA/8/WvcqL+cVz3wvlLZ+GZ1+Bn/Xnfg8NqRQO/IgUZekGjCDVC2D
         udexI4ItVqjKeeNu1tlagKFZA/evQs9WSwN+k7L8ULjfmQiVOs+X9dHLQgvV9tOXaer7
         OjpRRgP4c22YfaejOGoWoGo/34kmRSNeXqbAg6/YwPNkvc+T5kV6tsNTTmAsekL7vD5C
         I5o0mhvDNPOboN6gmpcw3tiB65FIBGernkGv8DehoHvordB80sFUrvFbjV1MBCrNRpKA
         hQ8/i/s4gN20ZXLiO7D9GOwCfA0VGA9WfU1tKh13GypY/tVzGIDijbnCZJx+F+JUko20
         o9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792213131; x=1792817931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OGZPLB5j5vuz9k8vw17ZLseNAVbY8N/wxsdlErvLb+0=;
        b=amzDvovuWumJgQND4D7rh7jgcLNFBPKwfOc904OkYNJFRzqQjo0R4jHhndgI8A7id9
         cEUYlqrS2KeGu7ch7PbkBBZHLJWJCIHWXhipJWQcQLvWRc/bZJUAaVqPyRcPgYrZO3og
         phTurYPTxfPbgf942XKAoSxXFPujvBpZcOiV71yw9W2+eZCuPeGasHCK5DWFPnMPrRRT
         6dHnwlrwzcsKSAJF60K0yX47v+JQ1iazgfhwWQxiwg88H9vMxWMO1OaV4zDaEXoCIFIH
         a06lru1grTwOMv+Yz8YWQaWdTxreXqsJygT5lvPRYokNvxCEgH5i2nTpSF7QH38aYdNW
         P6VQ==
X-Forwarded-Encrypted: i=1; AKwUvBxG5lFmvecVb8jM6zs5X07vWYCnI41lriVNXAfBpJV+eDwI5XTTrMpr5ieFC995u36I48KN8gtOJM2Y@vger.kernel.org
X-Gm-Message-State: AFq9FYJweXLDR51/32CqKdKm4lT2hhdFgMXS0UHud/C6l2Ul6UkVg4bN
	a3a7p2VLrN4LNfQlWul43Fsypow2LRsnP54q645GreVK71KBYFDXhjyAojyNFhTVoN/oqnut23l
	S9mjUxBtazSFxi6ZJqPhuEePAoqMoXb4Nwu6l3RIXlAi1NTW9wtlmjH5h+GBXN+l5
X-Gm-Gg: AYBFou3mJmE3zz4eXpye9VuxRkXq1CE+DYUtX5kxSgG/SmP4Y/BBrcG/Ct+EFXmD7Y9
	6t/nP/gGW/J1lYQ5nrNSgV86FAdLfdugIdlHbGWtTD8JZ1E39BAcE0jEvjCmJK+5deenSTW6/3j
	PeNl3gV/qyhOcL0/MnnEx5seu9iAH5g2fep+vBR1sBO2yGm+mBkoSBiCuKLlkHyZmT+inJdKXlv
	QqFsFhH2PDLosvr/amhrRYNxbhgNmF1KwkBL1OimMcEMfGcDnXOyd/VvKp+xmaNKz1Xnl4kbpOK
	X/1Ctble8Yl+D+2QPO7F52L+nyl/bXbWhZ7H+inSmaoasv6RF8ONBR+45uGZlN5ykuY7wIiLCN8
	LUCmvrRIHqi8vxQ3FYHPuUDecBenP5Qz0pfEYtWoI4iMADgGqB3q/Gpqn3vM=
X-Received: by 2002:a05:7022:e88e:b0:185:e68c:904c with SMTP id a92af1059eb24-185e68c9108mr1545657c88.7.1792213131040;
        Fri, 16 Oct 2026 21:58:51 -0700 (PDT)
X-Received: by 2002:a05:7022:e88e:b0:185:e68c:904c with SMTP id a92af1059eb24-185e68c9108mr1545610c88.7.1792213130535;
        Fri, 16 Oct 2026 21:58:50 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm15203817c88.11.2026.10.16.21.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:58:50 -0700 (PDT)
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
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 4/4] arm64: dts: qcom: nord: Fix videocc clock inputs
Date: Sat, 17 Oct 2026 12:58:17 +0800
Message-ID: <20261017045817.1506961-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com>
References: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vgtNLPE_hAjsFIRF-uHniD6JiIz4Ehsa
X-Proofpoint-ORIG-GUID: vgtNLPE_hAjsFIRF-uHniD6JiIz4Ehsa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfX9bcMZItfqRQ3
 2rElideoVfB5G6lhL2w6vcjajnjvgC0Ge7q5/nYRnLJeWGHltDfqIm0nkin8CG0Fw+6D92oLQDO
 k6IzzbQ4tdJOe1Mqx+r74etxHzNNC1M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfX7batj2+R/SBM
 tN6ho3pxKC9VCvP1ZS4z/IzLk8flftZ/qFgQJ3e6u0/GhsIzrXzxC1aS5ESau9HStnq3xe4LRTm
 LSbWOTZXKQr2tsZqmpGYAx7K0HBQvTpT2Wj1YC45wy0Z+2/FMLkv3VeverfokTugzqrf2RcZ6Q0
 CdJpAaYIMgLNqvyt2w9yA+sZwYa8yMd7SMshxnJt3001kIkFJe5m4m3fP+n8LH8GX+HOcjfrafx
 QhC/8FUBUO+WSv2VGlVkYqmj7Yhye9nUFHWNRhTPWN+2VDGJujHpg3mVUwuz63HUfOd3IHPsJRi
 BYa0q8U6Aw7BcwmMu2005tZ/vomRq87aZ/xo2IjFRqPIKglC1yuwNzb/5U2PqGz2grOaDB5HPG/
 qs2fWEC49QHZHCyunS4a/5JBKHnmK9RhBFdfNB5fUV+bEQnF6RvfgVucp6jBRMSZLd+r/SZLyLn
 xXe7dZj/rxW6VfJmvBw==
X-Authority-Analysis: v=2.4 cv=SKzXx+vH c=1 sm=1 tr=0 ts=6ad3008c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=I6E1kIfsyqVcGmBSIt8A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170019

The video clock controller binding describes three clock inputs for
Nord: the board XO, the active-only board XO and the 32 kHz sleep clock.
The videocc node instead passes the board XO and NW_GCC_VIDEO_AHB_CLK,
which is not an input of the controller.

Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
clock. No functional change, NW_GCC_VIDEO_AHB_CLK is kept always on by
the NW GCC driver.

Assisted-by: LLM
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 1ab7d9bc3cfe..62d14be55839 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -886,7 +886,8 @@ videocc: clock-controller@aaf0000 {
 		compatible = "qcom,nord-videocc";
 		reg = <0x0 0x0aaf0000 0x0 0x10000>;
 		clocks = <&bi_tcxo_div2>,
-			 <&nwgcc NW_GCC_VIDEO_AHB_CLK>;
+			 <&bi_tcxo_ao_div2>,
+			 <&sleep_clk>;
 		power-domains = <&rpmhpd RPMHPD_MMCX>,
 				<&rpmhpd RPMHPD_MXC>;
 		required-opps = <&rpmhpd_opp_low_svs>,
-- 
2.43.0

