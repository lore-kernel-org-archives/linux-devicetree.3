Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A4045A285
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 06:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085619; cv=none; b=JX1IKo7AgJq/H6un7LUlscOdoTPVhDee1AWz3yOD4LCSLz5R/TWR16H20f3GRd1OiFphdd6IpicG4HGSQ6TBC1ISq3lCfpfN/hAN+rkxBcEFcwTIPR8sm8S38SHCVeU+XNLU+FnKjE4CjMc+uqo54Bp7IsGi6XQuLAF+WeO5cMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085619; c=relaxed/simple;
	bh=fCMrPmPUNafBvO10YWswU3IRQXLhDtGia0biGdyfMJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J7vSMyoa3tCGaADMjME7RV9OpAXbsYwfnB81DhyBH9mrn8WJ5Ql/BdL2lriPMPeYkbEgLxADergqXUXFzIqXjH3lreUz93pb4521hdB7FJqjKcIWSo5dekOyRlgzPI6nVw8C5qSjvvlNi8zWCoCCtaFGxe4v4tkxw3po0K1w5HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=akm7XDEW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ax4nnx2v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="akm7XDEW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ax4nnx2v"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770Gd0e492879
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 06:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aEf2DkYlwBhwbK9/Hz1rs3k+ZWcCvcZ6YxQGzJOUpfo=; b=akm7XDEWRLSa+I5W
	rccKD/uFljuXmfh0Vppull39C3+f75bCfTWxLiK8TQu8R0Ks3GGdlAz2aFh2U6P/
	QeVTyawYXQ0z1EjZp+jwrahHNiHZSPJ0VQSs3PYotPfZaD5niDMzylvx/yHHaJ2w
	AoQQoJ0SqHa1UDZ8EcM/9JtomuU8G5OxkEFIamfU1cKo4xo4sWowgh1qFY5QkTkV
	RBo2wgFgyDrDFNxUWe1SHj0/evKGRO1GuvapgZD+MM7lQWxguG3q4TiaJ7pJRf41
	UcTtf7LZxT9q9qZWpPRxFnXYUL0WkqZFma2xwdxYH6s7UIUWmdVmahQfhkco9ryM
	4JbSYQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6rakyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 06:53:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso5200460a12.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 23:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786085616; x=1786690416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aEf2DkYlwBhwbK9/Hz1rs3k+ZWcCvcZ6YxQGzJOUpfo=;
        b=Ax4nnx2vf99HNx9pzKd/m7Qe7JkNvPo05TQNTDvYqahoVO+Xc00OiB6XulscXoTT1v
         P93c/h1t/W1MDmp9TkL5R7yBgKlOxUoIHURLz9uswzKsqtbBIrXwWYi88Nr858qka47T
         uZrTAynaE4wur5/eIDOhsROic9B5b+C94umLSAS+bbPHECYJJXxlle2NE/g2RJeyIs/r
         cdXONgTMWeKtl1MEbXV4P4o6iZcMJIhy6pyoV/DreBQXBoJNcGukP7EfmDS9UD3xejto
         y2b0RKEJxBH9vUI44Bw35k0n8J2nOwafH414JiI+BRHNmUZCoh0raqt4Vd4en5yaIsvc
         0mFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085616; x=1786690416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aEf2DkYlwBhwbK9/Hz1rs3k+ZWcCvcZ6YxQGzJOUpfo=;
        b=dXuajjITdGuqeQrmRdYzbG0dHgqFL9KiIgXo5ZEo/WTbFiIGIK6gyk2CY7nxQQ+d3m
         5a3er7wnRfARAz8Y5laNVwFvCzrHoZHBpecXjyaZ2ilFPKoq+PFHJvrJT6IbHnrjHeYA
         fCHNl170643fm8ldG9TqAiIhFEm2WnQUbGpYR3hupbMx5eBh+WtziIAhmEgZLWT9D3fN
         Nvg69DkZ07xLQD6Nku4Z4ptM0AcAXIsMre7zw4Z+q2PqnT7g22IURUaNcMtMeoCEqJ1U
         bCkyjHhSA0nnjPXKF9lOdzXQz7HguhjeaiITGhnui8k9YXnkTjVOWXnlZ9ikJI39My2u
         9Whw==
X-Forwarded-Encrypted: i=1; AHgh+Rr8Vj9BZUudDTpqS5w8y2nvqnqKxgbp1meRo+warD+/TnXBCUzrBi4qGBazLEGbiyglQQiO6RhHqFCz@vger.kernel.org
X-Gm-Message-State: AOJu0YzVWT7oLtE7d1gcV/1q1lttwe+9hFzSDVlBO8CCJaG1cEsdYsgf
	j8TAKaUk2ft3l6l9nK0ur7CaB+22Jx7SRMz9KPnyw8xATfLY8j/asofbDU+DO2nPwzhAX5x4wry
	mLATtBiYGHUseNMboWhAZM76DKRjMl4yVH6W+pxudClw+JF66RzJanWtabgEEYmZjaNy6a9OTvX
	w=
X-Gm-Gg: AR+sD13pxwz0agyb7vjScVEvPq2yUXxouw5tQUsDm+tpT7cI2bF8zmReXNU/TXKb/fQ
	5pV8eqwnljlKw04LNGreuy3B9emZl+qrVr9qEafxrLiOUnZle/5UMIBU/q4/CxnTOQ/GKnLXGl3
	HxpQntcH7dpzDPcJARSHztxVZddl3efspf70iIPoNRbw5iXzuTsNdG81ygvhdI24Wu/S2MlPS8Y
	iFiyeEkGDMzcREWbUZGzoHTgIvhw6OidoNioS3ayESE0uoAaaZhDShsNMHcImmhu364Lhpp/KKU
	jg9fKwTV9EhU3x4mTQ/HHtfkdsUri3NeDQ3UHnAtFui/lsl6dY31nVGynD2pcwJQzpopCBqb0Z8
	qUqFN8lN7kEo/LzVnpa20xQHsLpWZHjq/4ZTn0QC8leI=
X-Received: by 2002:a05:6a00:14c1:b0:84e:2bb:2d3e with SMTP id d2e1a72fcca58-84f5df75147mr1601410b3a.9.1786085616457;
        Thu, 06 Aug 2026 23:53:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:14c1:b0:84e:2bb:2d3e with SMTP id d2e1a72fcca58-84f5df75147mr1601352b3a.9.1786085615882;
        Thu, 06 Aug 2026 23:53:35 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f19842bsm223493a12.4.2026.08.06.23.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:53:35 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 23:53:16 -0700
Subject: [PATCH v2 12/12] arm64: dts: qcom: Update IPQ5210 xo_board to use
 fixed factor clock
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-qcom_ipq5210_cmnpll-v2-12-cce718b8ec17@oss.qualcomm.com>
References: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
In-Reply-To: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786085595; l=1388;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=fCMrPmPUNafBvO10YWswU3IRQXLhDtGia0biGdyfMJ8=;
 b=zPJlTejwSlIiks/S9GRhED1Pg5YBRxh98sLwAUScXZ53SPlbxLbxUTMzkOZwvLodCgXwbG4G6
 anQKjPEKjnBAlDnIFqihtVPf7C1hRVHjV5hWa31Mv84wgfUqvHvn8pA
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX6kZkMUqzNbb1
 7zwkX7/DtTS9Q+U1b9GTBeHPasnlfGb2g263Crz583JmT6GMaYXm/URkynHnfKiKO7M3/qy89bw
 8fRbmut33NkCo98nexP7UJL10XJNMCwI9ImQ4ufNFwdIsomQImDAeFqH+aA6RdbMy8l0eZ8EFkF
 HCLcPA93TNVHr88QkPjqHFQCiiR1QhNPiXi1IUZ0Q35Wmk0e6rUmzo76olH43RBvr2dwjG0hE9L
 wvbqgnnZOaTse8cHZfYkewAXLqIqO2zDQ6HGQnHT6K4tRWoysRSf5DTmMFJAT4WTeo9tf0tyPTK
 zDsUIcRsdmtY22yAEVRm+muP0VmsOPoikAT5pLqfO27gkmrq04hyfSX7hHc0hSgfeZmtzQPDcmP
 FhNCqGVXPPaC/KCSaWKGl0n+PpUEeHEssr65OolY1oIwaAQaD4Mq31rilTosYQsJ7fqqqBnZh/8
 wveIqFWcQzGw2iN6CBA==
X-Authority-Analysis: v=2.4 cv=HPXz0Itv c=1 sm=1 tr=0 ts=6a7580f1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=CPdYy-Otk887xBsD2wUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 5maA0hdYRcez1hWa25NkjDCPIDPObbt1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX0jXPFnIEz6Wf
 +zue6ef5oR50ppr+1JK49OWsPwNzNtqwVM/xF3ZJzzsNn8F1W2OW0rLBD78TMY1hMN8VDVeixcK
 Q3+kZIiCacWIMGbhI7X5xQBxdlWHjRw=
X-Proofpoint-GUID: 5maA0hdYRcez1hWa25NkjDCPIDPObbt1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070050

xo_board is fixed to 24 MHZ, which is routed from WiFi output clock
48 MHZ (also being the reference clock of CMN PLL) divided 2 by
analog block routing channel.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 7 ++++++-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 7410d092814e..fa537633d5f5 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -85,8 +85,13 @@ &ref_48mhz_clk {
 	clock-mult = <1>;
 };
 
+/*
+ * The frequency of xo_board is fixed to 24 MHZ, which is routed
+ * from WiFi output clock 48 MHZ divided by 2.
+ */
 &xo_board {
-	clock-frequency = <24000000>;
+	clock-div = <2>;
+	clock-mult = <1>;
 };
 
 &xo_clk {
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 7025bdd9036e..8f6b37041132 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -26,7 +26,8 @@ sleep_clk: sleep-clk {
 		};
 
 		xo_board: xo-board-clk {
-			compatible = "fixed-clock";
+			compatible = "fixed-factor-clock";
+			clocks = <&xo_clk>;
 			#clock-cells = <0>;
 		};
 

-- 
2.43.0

