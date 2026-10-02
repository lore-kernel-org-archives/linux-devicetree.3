Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAEB1A6838
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 13:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946204; cv=none; b=prTvYsE/O3nW7bQN/6xINXJzgp4Z2ddlWF/3KzzShYgs2eVFnWnmF+1+tvNNGWVW8f8xWdqrL75U2l6udwPZqVCgrkyp3wM2KeLkTbURTZ3s0LajY8BSToTw7MiRCpQDjOFtZUdOAIA+aS6Aetieu0v4s03QnThI2TnSPehYJCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946204; c=relaxed/simple;
	bh=b7PwNKrUTbBjFvlvUJeBMdFvTRE/6fFMDE4OvnZCeS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LVtcBaDcSSyymPkzmJPYfXqcQkO6WI6GZ09yGdBp4iFmfqa1NPPQqJS+OaETW0ti0HxmFPyLPX94nGqXOk4u+CyW+XzWOrGvV/yGnM3DWNKM5xM/2BKGLb18bIEfMxC0cfrCdVyynQptno4xI7lwpdcQ2yaDU9b5QgSK8lYISo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+q85cQa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EBk2lvUe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+q85cQa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EBk2lvUe"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nag6207336
	for <devicetree@vger.kernel.org>; Fri, 2 Oct 2026 13:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqhXceR7YvU9pc3ZKzgyu+8pOAFFFFcPulo//ooWwzs=; b=c+q85cQauWQQgjvc
	KzztgxhxEZehiSS+zIJNvDt2Fi31aOrf1h3fV1hXug+eVtUSGn86w3LcydzMEzyc
	z73aNlgz3dWv4x5PQOvqiPRnRpvnJ9qHVf19jBnOfK9Y5p3O7vZuB7eaqm4vYMWT
	5g9wunBaEmEPQMN8ZWq6jSzM0m0VnVDz7/Z2nNT1I8i0sTwYKiZOJh8XJJdTyap0
	RANbexMiFxanquRD/8GUfLsW1AsJ875JHbqFMmqJ/xNfu29l+PCQrRHTatMgdP2D
	4jSEVDn4QnBECulI00lX2YfmvwqGVHZCOecOHHi0jnYbhZ08crvCuwptOPLVMtJ/
	E7c4FA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1v033jjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 13:03:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30f1b904861so9783995eec.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 06:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790946199; x=1791550999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqhXceR7YvU9pc3ZKzgyu+8pOAFFFFcPulo//ooWwzs=;
        b=EBk2lvUe+YroAfR/LQXtXNGjW/6XeNM3Rx8Yxk4DXPw4u8dTPQ9CMRwgL1//vRnTuZ
         xsHaoo7QLNqOlxeg9vNGUdAzVTE+UyZGp1Nsry1BxHZp1wls5cupBZfDwubY+zhvQrEq
         BOzm04BHgx8GRPYL4B+PljqYrSbjlzSDT0CHhYlsZeSGinXXNq9XQHN3fYoXoekdJu+6
         5erlOehS8c6p9rhwJMJZ76iwWpxXW4Sodo0Nw4T2w3npZOn66c3rRQ0nIp5g1kKz1EY2
         RgKBjRHNCtaMbve+qxyXfS14gFq09s1X5oVJ9KN8jP0eZQe+oqMjQYQnZvA2tUvJKozj
         N2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946199; x=1791550999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqhXceR7YvU9pc3ZKzgyu+8pOAFFFFcPulo//ooWwzs=;
        b=D3Rkx5JDITnHjbLu9pjC4Gz8wisIhUmaExDV/EWyERwjglOGKb3JeIoWHTbg31Gm5U
         nw2XAlueJehNA2dkE2bqhlKkuEeI3DfNFupsBFYyFKN5rdIgI+xKdC9RW/i0QGNMEoST
         dLlYsfKfrkc6A+yuY+4xaobAHusUUL8/ckZ0qDa8ZquLdS+C2pRnN9LyGx7MVuU0YjVG
         Y2VVQwBWxxO05XkRFkqzIKWBTDJmo/BFjuOPnDh8dWetea1RFADt9Z09THgIRI3HcCkN
         140bTAp/E0Y156dx0kbHQWciv8xV/1/JzylrNGVKs/jyf3pI4aFiaizRcnC6XVJkcblf
         DQow==
X-Gm-Message-State: AFuF++lU87KEOZGl0GRaIWr8vq/e//eK/M+YEgxxgGbrNO9WDJAkDiSH
	Wwn4JqrR1FnVE9CuR9HH2/Hf8u2yeXFb8UI6SO4j05cjzcA5jB9mUfo0N9TpB28w3L1NMZMvw2Y
	m22Pnw1MMy4BROXey6H+dlgNXHjZ0d4JU8rFDXddZKP3xIGtqWgKuM11z2TR8Tc2A+yEosNxO
X-Gm-Gg: AYBFou2IH5tLIISFMFMBDcSF64yVIAInj4gnMt0fBnRxOwVgYILh3OYYiiLap+j5baw
	5kCc2+2e2QpZDNPnZ8l1+WEx2ChdJ10ok31RuCgtOKifj09nfhVt46nApBdki7vq9bc2Mx03ZUh
	KPiD+F0QSTBqR2oIVK96bDr5WObAl6SqSZIvzVJOKq/9LKhChxyskglzHULaaks0vAK4hK5be72
	/nqr7yta8BMuxppzldrvoF1pKKLRLlZIer9/7zcsx+XqNZJMNQMUL9SnIzBnxCxf1ssxAStgKpS
	qawih1hVZsdq14nIedS2oMNOHDyTiLndlinXX+TEWSNvGU/sM1MdCnr4L/F9TtLgNQZ8L+uvVe0
	EDkmIH7sgTvSuceA+LsnZKxYR809STiZwu39pXBFfRhQvAmB82c9Z9gcww3vhbFzcGr04XbVLJR
	c5n/sNvLn6Kd6zSirkHVHoc4uZIc6l9rtn3w==
X-Received: by 2002:a05:7300:3a97:b0:34d:755b:d60b with SMTP id 5a478bee46e88-34f2199dfaamr2759024eec.34.1790946199000;
        Fri, 02 Oct 2026 06:03:19 -0700 (PDT)
X-Received: by 2002:a05:7300:3a97:b0:34d:755b:d60b with SMTP id 5a478bee46e88-34f2199dfaamr2758880eec.34.1790946196812;
        Fri, 02 Oct 2026 06:03:16 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510752b575sm4217543eec.6.2026.10.02.06.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:03:16 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 18:33:03 +0530
Subject: [PATCH v2 2/5] arm64: dts: qcom: ipq9574: add the IMEM node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-imem_restart_reason-v2-2-61703c6362e3@oss.qualcomm.com>
References: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
In-Reply-To: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX7wZxFFJjB/eB
 g6FNT/ZjxR7NYZbQ3Fthn04BcJ3WL7Z3fYb8SAN0zR6Ph5GpKQOwJh3KwgHLqIVxEXbdprL+yFA
 S1g3FEv9/tVc+re5um5I9qil9ZjxhnU=
X-Authority-Analysis: v=2.4 cv=GqfXaU1C c=1 sm=1 tr=0 ts=6abfab98 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1EpwE-knX81bZyav7xYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: LQ87nVbKJSER9FrRyL8Ukk7N9R-YDIKu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX/23XokdpfjAj
 M7NUgkJ1CgDSIoIQldA3UmYZxoE4hd5Gd9hOrw30zF6XpAL3pFf3DyVNzLPgPs9BSm8C4/PiE7F
 K5zkYQQpjlwzJfiS80vF0KRJuuzZYlY8NSyzmhM8fxJEPyHsMiG5iOCXtT5PmOah9gLszTV8RF5
 xptn1KRM5OaiPgJ2WA5Au7KpYi4D9Hf4PIig9gcgS7r+Sx+4wLUq9UlqbNftzWB6hxts8mOS9ks
 b2KNEUhQRGvR6KCPZ0KCY1LSZ3FVK5IC1fJFsxL6WgXSbUvBOxyskfjW8ADaa42eHfSQQuMx3Lw
 YuZTt+A8BD7qBxYs1wbsCjOhUDKZHmrR486LS3z2A3dZ13HzLeZflndQK5sGjOiF3iMB/cjB2jm
 Nnx/DYcTzI0rvCbZww3h+lkW3Kl3KhA6ga1vv2nj6dwjNgTlcnC2QAjjxefkSTDU0PMxZjzmc6y
 GyvYTzhJS4ks/r4jUSQ==
X-Proofpoint-ORIG-GUID: LQ87nVbKJSER9FrRyL8Ukk7N9R-YDIKu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020051

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 32KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 771a59585645..f7cc6f274ca9 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -757,6 +757,13 @@ usb_0_qmpphy: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq9574-imem", "mmio-sram";
+			reg = <0x08600000 0x8000>;
+
+			no-memory-wc;
+		};
+
 		usb3: usb@8af8800 {
 			compatible = "qcom,ipq9574-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;

-- 
2.34.1

