Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014274;
	b=uWinEImkhcs5mOTNTcZnb6gzlrpUfpH47ckYBFG7mkJTqzu/IMWl4nOgp+rsY/kjhk+R
	 wiYCOzwMbBKVEtQkoz+a57E8s1gcUkx/DTTjy8OqRcfwtS/9vyUAivvNcJf8FSyMJ+e0e
	 RU4Bp+GUdhLWBAYACs1NvqwtUrJBLdaXwPVkgtok+8BjxyQBoLJ9Tp3GhDjmRxe31QJ+p
	 YjhqjAxO3ygKcxuzGsFiI0dQKwNzaBLE9tojRZXMkIbragoGahgAy0Pyhs3I/gFeMxLiw
	 bXXWdjeYDk8xSxbwYvx9WyttPuRNxQg/WSmA0VIkrirKCSC5Zdu2aS2rVCG4hZKHJ9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PN5PQEqoM03ThjwzMKni5i44sYywLhtbqVb5oQyGOvM=;
	b=gK4yLfAuvPl/CRDtK1JLV5TYCllGpVtVFdedS/EYvxFOEulr3IAl6E56A399kns1XYVx
	 WJW+fJ4/Z6YUWPe+9xR9k5z4zut6zuAZd2hqyaXJ5QzjPGvNJbAHJYb7if8bqW1WhIgmZ
	 4sz17hyo5Rpx642TqDz/dWRidBcS3EMHbI3kQRXCvJt48Gy36zkfTuboA9hgf7RdNBFvT
	 HT+Cn91inu9YjEGJtQXNYYJwicULALh5KQLXfRwmf6XQrBLugFg+3+DoJmmlXUgKfIUPZ
	 8ZIw9V/wtrKcTUOrHX4IKFyw0vSQUbEisLbIp5fdF+mpwwWab+KLqnpKKWw5jP2+wYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="O7RW/zIC";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="jx/zhB2i";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A665560A3829
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A665560A3829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O7RW/zIC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jx/zhB2i
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtMkM2009907
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PN5PQEqoM03ThjwzMKni5i44sYywLhtbqVb5oQyGOvM=; b=O7RW/zICp5ljs+ax
	SoMTMgPqRK8nN7vWGWf9AhDVKAWbLURmQdBvAe3JTu56NjBlAdlhECA4qJOZw2FL
	2Wt/4y0vapLJLJSgdwy4dCYK1iKo5D7T+m2IgIm9nzj4TdgDzA3FOPgpZYcw3Pxo
	Is5CuB74z8yz7R1X9cfRePmjk7JXJnn24jNFfEB2LzVdQ3VKlkDW4qGbyB+Crqdl
	0ILwSPkKgCkunyzAHDwFicoJtlVssmo/WznG+dMHxnLKxmIGaxJFOdeZE/u1+XrH
	tY7pZbp/8SCRca9NE2Z/2BZSHXH6vK1T2K1b7HHE2vi1iRA/2dCQ5rW/5EoAjsvb
	dTpP9g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27x518-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:31:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso2392093a91.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 04:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014271; x=1793619071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PN5PQEqoM03ThjwzMKni5i44sYywLhtbqVb5oQyGOvM=;
        b=jx/zhB2ilzFQ8iNmNi3ieTRp16TCFlpanAqsjzkDevrlqtiqHqLqKr2XsbzplX8ful
         PruhOUEK6lf9hDfAW+Se6x3XpJxLZmquFKLUB0j51YMog8/Q1yYBmwgBnl24SMRwEMld
         p7pVxPu31fxta3wv4mqHEN/JTVUE0EwQaKay+SOXfFEEFXPVg8X61dfQoZVbtCGOy1z0
         o9EXESsrZ8WvFcKLVAjjDZOnYzWheqVQOifiivkdishddnkpZLwXkwg3g1tdpuZ3azOP
         0BpIami5z4NtxL06CBAlQxg3D8gl6AqY7kBdKY9/v0V427x7FdPPXMwjpGP/lavr9JUr
         /rrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014271; x=1793619071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PN5PQEqoM03ThjwzMKni5i44sYywLhtbqVb5oQyGOvM=;
        b=PIEU4ER0IWyfujBvZPvB4VAhyGQP6fCc08CYKT+60RJMV8VvT6b2qUqs5iX6ngyTY3
         BjxAjcJSXA1Isw0ZOOR7nmKjLAsOFhV8wwf9VLGoQd80+u7sPY7sTKFnj74ceyAHoXr1
         8adbTtT9u/HAha6mq7wZUyeeA/UxZHcr7no71LPE8ltbX4ZehiJwLact+uB1AQa3rwm1
         qFhoVM3hWZ0k+HuULfjmtcygGRs1s9FNuVaN7FOwSEPERN4w0j/7M9sQ0XCeS4/GUF54
         MSniD7WhSDGcAIWiuJh+EehZ0k8whNXGbF2+As7rA7uGLnfgW8tLD0HnTS4jBsTkWEhE
         Tcqg==
X-Forwarded-Encrypted: i=1; AKwUvBx259f+9QQxlzBSXijxtp9BjLsF9rdLzpRzZ2i9tpOvn2itkvWpU53zvxcwxwvcIJHf9X5TeK0d/yU7@vger.kernel.org
X-Gm-Message-State: AFq9FYKF6qreFnSMjy/3JljXX9pC/zp3YFXSzKjUydIMXlI1hbh3bOHU
	6FnU2aWg5b/zMw5nhG9mmk0EUEK+i1lKnUWApiNfJHaoBWAwIUwdTQAOozO9jlLinwCmzV+SbPr
	evNTllIkpzVHxRPPBi0x3r5gp6IG57rTAUPstVhxTTJxydxmGIAUsvyF1zhPG/KU8
X-Gm-Gg: AYBFou2pSGU9qvbPds1QP8v6CNkTG8KjJM8GA0gmL5+nL5iagjHu/2bTtfTysrnGS0y
	VLauYNctGJIPMelGi7o34cpCq8Kl3zWObJNyJhiGHvjiRp2UhalAiWUtdOjbfA6HWsXfH/b9a+Q
	+l+oYcW7Evyso6KDm/dYarl6KftpXwlaa9bCmBGSJjR7I9A4ffh2D/f7Zlwap/yIUxPZwU9d/ck
	zW0SwiZUhbrF51G3htJQSpETmuhAFFtnuKTgFK3tFKCsaz7V69B0BB+avIr2jEyCYYYx4TVfxrz
	buvRSI5RQlq29YzFoZkcHsli+uGmizABPaZSflzluDeSgbIDYIMkKejbuXeDO26bPJWjUMu1wAp
	5W3wFc8U38bq5EkaBomo8YWA=
X-Received: by 2002:a17:90b:2d86:b0:3a0:9fe0:3aaf with SMTP id 98e67ed59e1d1-3adeae70769mr5826708a91.48.1793014271074;
        Mon, 26 Oct 2026 04:31:11 -0700 (PDT)
X-Received: by 2002:a17:90b:2d86:b0:3a0:9fe0:3aaf with SMTP id 98e67ed59e1d1-3adeae70769mr5826620a91.48.1793014269630;
        Mon, 26 Oct 2026 04:31:09 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:31:09 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:37 +0530
Subject: [PATCH v2 11/12] arm64: dts: qcom: sc7280: Add GP M/N clock
 controller
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-11-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf3a00 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zpsMDwxbIOh_EP-Phi8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 0j1ZjnbYzubx7lv864R_uCDk6jQjMZri
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX3pkcJHmS4EWT
 uV1wuSLFhRuQ8ncQUbKGUIcw5pUl6/1Nvrt/3GKw59946kxvmvAdcpB2RsyBH7+c0Lz3BOEqPgR
 X8y7+HuIGAINo3dDrm3WdVmtamO3kQY=
X-Proofpoint-GUID: 0j1ZjnbYzubx7lv864R_uCDk6jQjMZri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfXzwE6K6HxzlXQ
 tZRtg7FZydOB+g+OCtsxcBgTTulwrPvu+9ShGF047ZJcqAeOpp8jJl5gHP9Dy/DcsPtLljWARv/
 v6b2gliGdpgFHhw5GvFPIt8d3zPbS3EpijrraBdqQvnYi3urdBdpNZNq1ywf7XmvQA7njV2QVMa
 la+roLrpvRrcfQUdTj74FUetmv4MCeFuVMmUUe9gQP3Xk20U9XoUiw+ya0Q33rnQz+PT4QlUmDQ
 viIu0EymvQoIhCOhn8r5kpPXnw3nTyS4OUBL3oZ0TZ7o0f/4MYsJyl46BUEIH3JBGvpCrXk8YVC
 d6zoIUJu5vqGxw8OGtpbnEzQa7j3qxo27SwB8l9bg9qoO/yCTpHyAfFD1arYoj84Nkmyhtt/qQ3
 IbVZQ3b283RfvmZvFoz6QCM2PK8xyEzBq4Niqxurz3bX3eBogPuVFYBW9T8wBigDafM3geI5DT1
 HzBaz3OOgGMS2dIdhMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260045

Add the GP M/N clock controller and its pin configuration for SC7280.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio60.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d2719775b8f5c6a8cef138a93292721..de27a051ee3b0e9046ff97b8e6fe0164985d7b17 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4442,6 +4442,20 @@ usb2_role_switch: endpoint {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm_clk", "ahb_clk";
+			#clock-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&gp_mn_active>;
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+			status = "disabled";
+		};
+
 		qspi: spi@88dc000 {
 			compatible = "qcom,sc7280-qspi", "qcom,qspi-v1";
 			reg = <0 0x088dc000 0 0x1000>;
@@ -6653,6 +6667,13 @@ mi2s0_sclk: mi2s0-sclk-state {
 				function = "mi2s0_sck";
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio60";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			mi2s0_data0: mi2s0-data0-state {
 				pins = "gpio98";
 				function = "mi2s0_data0";

-- 
2.34.1

