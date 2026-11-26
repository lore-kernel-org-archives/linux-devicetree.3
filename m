Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699482;
	b=XOPoYdHbgo2uSvVjoyw8oCzwRdnzul7a/MUfTNQDSP87+5vM6N5HpXUnVY9zuMxnVyLc
	 RYeiRbIU3PzuA0a8NrR5WUPDEqhz52+uV+e/pu0WzrRCAGzLi2RjpmhHDtU8DSYeGREFh
	 L4iog0XGe0TkjHLI36uwCsbGK96mPRMOwKx07OBe8u6dHclbi2HXm5jlkWuqldFLdewD0
	 vSw6aVrI6n7/o1RQbo4bcN/eXPUQSpavg2iA2sDHyvBZs9pIJ9vLGLQbVHK/ZMKNQJf6R
	 +0VBBunu9J7LCI2Atz3+z6+Fvg0kN+jDwTraez2BMMvrmkNJ6M+sBGo/KEV1C5f4ffQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699482;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+4OdKtBkMlVocSiOViDkwteYw+81H1U7mhaDvSgfyr8=;
	b=ZAKFcvWtuja6/0wHOdZpc8F76XYtDadJPix8YsiVp1i9QLL9b9KINT66mSnGFiKKWHWC
	 cxGGaaLy2wRo7gDRfcmPJMvUFGjIExgD+m9xlOm054BP6o0diO1J4hu5GnJWlCnFXixTI
	 OU8NQyGoZ032CmrchwDRLWchWeH3LPASLVKjd25H5aD0HdyOsPi2P27f7l4suW0toPX7C
	 VLsr6knVwRGF1x6Rt8nSwhT2r9WTpWJy2UpQAYujlvcBSRbwhfV0UxVqwVNGVSF+KG4Go
	 W+WDT+/mcoOrotYYEyv4LdIeDnnefpXm308WDp+yOZR8ZJYzQFOcdYhCTb9mob5nliQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=beU7UKWx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Egf2NSox;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09DB606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C09DB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=beU7UKWx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Egf2NSox
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVTgp2785161
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+4OdKtBkMlVocSiOViDkwteYw+81H1U7mhaDvSgfyr8=; b=beU7UKWxdaaocCBC
	1n85sM1okC5pRja4DCnWzEu770DweE5dR9AL74GOl10/L168x+Hx3VL//I9rvmT/
	K5pZ5MWTmOLsVYKu9tyjnS3qH1QKQ07+CmyUEyPir1TNa9iGFKPsp4aBWjLoQDkh
	E9mnBOoqQOp6iw4Hb4RNz+9v1RF9juX4M+Xb8yFTIVEusso15kxlMbiMpDKhoLmW
	FchvGshxJSQzUilEdtXZSloditLxi0kiaB2uZwIxhJofbd7ywemMbAuuuMod/x1X
	pVaqtlLltn0wipbxL5svFcUfGYay0byTlDyyhEw3qQYRpo3hoMANdzjNFdoaZocS
	T36jrw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfb37y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:24:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89e05d31e54so4860413b3a.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795699480; x=1796304280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+4OdKtBkMlVocSiOViDkwteYw+81H1U7mhaDvSgfyr8=;
        b=Egf2NSoxIbs0yvl91UdP+m97xGB4+dLGulX3Ho7DbOBlXcgooRuHB+1mshso4jczGr
         xqQ16cS1Du/fUYlZQcpKLkYvr1OU21Z6SYMLLZJ9RzUq7FbQA4NvPuGa6zTfd06BEikl
         Xmqy/RSJj6UNr+I5MGeiNn5E1d9FShlp+MQ25ICIYeDOzQVD70sXVSdgl5vdlfSnmZ2M
         SzardfQMO8MLonSbrkpEn1lM8iYM0KyN1lXAMdttGWVUCseOLAT2kVcMBlmsgy4EULcG
         IEQVf5UJDLB8ySjDeG99CEYgmwB05PHwYxvEdnl+a8D8lOO9ubt+u0qlzK5u5VOy69v5
         nAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699480; x=1796304280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4OdKtBkMlVocSiOViDkwteYw+81H1U7mhaDvSgfyr8=;
        b=fHoqqaVx3qeMmleSUJgrjCyOtzWmx/7iTAs3IJ25UaNCObo0ruajOawc56ssCq9PQJ
         bEjbpb3rstEmi+n4LKxvdLWzjQJFCyHlDhG7IjXhzfLrWQf5GD6V541lQ3LVxhVv+q+R
         7q/XHb5lknRovLmbLKUTLsOqEi5dkecDQAljicWbLEEo2YnvFUP4FS8uHEMAvcwSrXfj
         piBgKUD+Oz+QDxG85hKMtJ42er8E5PSZp7xM85O6OZ/4+J29c22LLOFyq6sEOotw1KL4
         H1E0WQPZ2+w2T4mOK1fsosLuyzgBVEasFxRwPlt5GirHe12WzlSN+K6NqD+T+la84jl5
         sG0Q==
X-Forwarded-Encrypted: i=1; AL+hErH0YcL+hfBlLRobhOSPg1GHT7sxVmPXE54pN3TTlZ4NUsT3o2HRz/OJO+iqyG6wJJbmywjA4DNJvB+T@vger.kernel.org
X-Gm-Message-State: APuU4Z+o9Ecf9Ohky3aFFeXadAVAWzL2aCVAJSusFsQ58woHv3+pSs52
	vMBGnBDtsn8Qf3G04y4lA13q1xDtTi9MZ2aS9uWL5K4A6KlYsrV+FR5rjoa3OP0MLvnFtDagAHa
	X/svrOkEmo/s2bkrJkMDvlMEcuK/yeyxExdJW71THbF39Y6jjMKGf3MZZ+rOk0R49
X-Gm-Gg: AZFdTZeIG5359A2lxvbE32fz4D5h5Hp6PiSu99J56wm/kh4gBQbd0Oa+VDVUZM4H3UP
	6XTxzB2DxCgk1lRQOEohlo/IvOliSGYr5nMb2BxjTo56APrtev0EM/sVhXWD6684v3NVy80X94g
	n4cNP4Ey9C7ecTJaDCM2U4sjUCmj0SPjLs+JxEDZwIr8ciMxOPQMa/M2WLKGDaAQGEgE736YCKn
	2aQGmrGZSxDTJS9TjKYnQJYBI8gjfLSw0S7c3kTRnE9una3dZCS8GmPL7UxUMRBhW1YPGTMZF+L
	KdbeArVertWc1II9k1qiwmXRuHic6MZYLqgWro7gcwZeNQ+B3WLJU2q6uX9reWFIsCYbvOutbjL
	AnU49DHFlhqeLcLsAj6IG/f8ATrL07IEPpBbFvJp/wTwhxClqYacMtgbe2WNckTKdErKRVwcnnl
	FkSsEL
X-Received: by 2002:a05:6a20:7348:b0:3fa:f23f:a1ea with SMTP id adf61e73a8af0-4014e35c59amr20846098637.85.1795699479633;
        Thu, 26 Nov 2026 05:24:39 -0800 (PST)
X-Received: by 2002:a05:6a20:7348:b0:3fa:f23f:a1ea with SMTP id adf61e73a8af0-4014e35c59amr20846066637.85.1795699479172;
        Thu, 26 Nov 2026 05:24:39 -0800 (PST)
Received: from hu-gouravk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d03adafsm11232196a12.23.2026.11.26.05.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:24:38 -0800 (PST)
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 18:54:20 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: nord-rrd: Enable iris video codec
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
Message-Id: <20261126-nord-iris-dts-v2-3-bb88dc5832ea@oss.qualcomm.com>
References: <20261126-nord-iris-dts-v2-0-bb88dc5832ea@oss.qualcomm.com>
In-Reply-To: <20261126-nord-iris-dts-v2-0-bb88dc5832ea@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Gourav Kumar <gourav.kumar@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795699462; l=960;
 i=gourav.kumar@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=pHs2EXt3Ly7kxB/mmRHMk/SqMUVWrt28kbSeWVTkUgI=;
 b=QTF9LNL5sLtvowhW26NatXiRfhf4o1XNS9zZzkhM4ntqSq88UeLDZoU8r1Vy7Mv/ez0CqZiXS
 pJo6y32T/jHC5WSqBNisvj2xE0v6zg+B11SiF0UflUtRm405YV5Nn1T
X-Developer-Key: i=gourav.kumar@oss.qualcomm.com; a=ed25519;
 pk=pp/OfJjGYucjyEYKqArAaVDesbfWZ44Dom+QtAdDZ8E=
X-Proofpoint-ORIG-GUID: MmcSi_Nk9gyyamRzRp_bFH1cWDiA5cg0
X-Proofpoint-GUID: MmcSi_Nk9gyyamRzRp_bFH1cWDiA5cg0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfXzgw3atyZWpHB
 DnNgalSl74uHVJrKPOW1z/jATjgz9wDshRlBzAMWv0UA77TSUYi6FFezhBQzFdnZHaQ7gs48HVg
 nF3rm3rgDLBwOzfL5ms+pwBuNJWqeao=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX8ssLQ5akXOnt
 pXs/PxQDCPlNHDslJuvB6XRzm8sYV1T+JhmDbQkk4liBYbipUsrnpBEyLYkWZXxk2DNPUCI2AHG
 Z6QNBjtusXqwPuMYbgNHlSNk0D6ycOa4ZpdzYx0ZqCSLwoh3QDiDDb0LYzrhVyqYmYqemWYgJxJ
 krKunib0GvyxI6OIFukNDXkS5OiVtrAL7JUS7agShLIF2BfNayoUdwF9IMDNe4/2V7c6P4I1j9a
 /DVXQJR8ouvn9aTprK4W98H24oL5s1wY5uVrSBaVVGIsz7Hur+aFIi3GpJbLSai1cHbd2kn8EfM
 qhdH6B4Xo/EZe31IVx3M6yLlYzzl+HwmIM7c2MI3K7o92DZtKAYLtWHQmHgfcJm4DMWfEq40Ob4
 KUKudjfMaoomcgawOPZ23Ny3oVvQ5tqfdS4ctzr7eaFg9SF0tVotBJrCjNFtzMBE1+Eqn6rrNHy
 5GWTI4ELMxbj8ijnhOg==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b083318 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HtMBSpEu5xi8YlTHYloA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260052

From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

The iris hardware block is described in the nord SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Signed-off-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 827d3ba3a2383..cd57aa8b29c27 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -475,6 +475,12 @@ rtc@32 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+};
+
 &pcie_phy {
 	vdda-phy-a-supply = <&vreg_l6a_1p2>;
 	vdda-phy-b-supply = <&vreg_l4a_1p2>;

-- 
2.34.1

