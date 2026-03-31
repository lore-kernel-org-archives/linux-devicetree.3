Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EA636EABF
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 05:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774934720; cv=none; b=cUrKK2cgMWDH3h8N9botLiN/NPayJJJYmhjUc4i7FYyuPS6BNFcDHnbHdwPGX3VBj/as17ck7dEOfj40NTC59LtlPxu+ikH66jn8N97xiTtWYVRy2nZj0PH+n9cNe/gAUYGK4ONzn9NQ5bHWTWmbFC9y9icJNZ/Qud3uhzwwBbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774934720; c=relaxed/simple;
	bh=UhvS06E/0zxHH+6YzYwm2XqZemBnbJ44byW3vy0sff8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ffTAfmJAyUzI/CvKkbrMNCFLPVMtN4owgIRQFGozvwwYaoZYeiJmm38W6llxmen+llC+FeIf4XbEEliwuVxivulfU3k6+AhnCSLtqXpv1Fl+XMc4sadFOMM7CEu30l5MjEkGb72E9NHoQRaDiXAK7Wx0bPSZHrHW/T2GxkAQazM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+VWp3JT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kecujMpY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+VWp3JT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kecujMpY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UM6Nx33539560
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 05:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lRzpvodU13mSbiQfR59O+/8VRELzK9xIqeQgF2URa38=; b=Q+VWp3JTr0c06NSe
	iRDfWlfkUVRLurwuVNrDbXxa+BD7xrs/Lwy2qSwgaqwrJIiCiOFmrhPsAM0CgyZ0
	BG75IW+xgO9DQYc/bQ1g9B3d0lRDSTmuHJ3DslFS43vWWkrACebsQUIhQcpQ8Vdp
	O2wuZQwMUSglE4w8DF0a+VUwTSnTZ1OK2h6gt48N7/vXSkRy3+mU8Q6B672WH193
	pvhx5L+q74uwtE/bLfCUg002nFwxllUCIuv8akkOqhU8DBOoUApVhVjlsxMCjcwt
	9u//A4wtOi8dGJKGIMqaFxMM76iwgSvlltfZvU1B/C773PHGNZQa7X+2u+24olVK
	48oOow==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q59uvvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 05:25:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82ce0c07d0cso53846b3a.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 22:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774934717; x=1775539517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRzpvodU13mSbiQfR59O+/8VRELzK9xIqeQgF2URa38=;
        b=kecujMpYKjsmmQ3ZDEtSG9VAqC/8X0t6rT9L1SOyFadAoA4fsyj6mx4vDEjsva5lfM
         e8er4yTh0VpFO9XBo0GOxx81mFZjh+AZC6HYhoo7qzcNcc+sB6A74h8iumz4V4Ure16b
         592RyY/ZKu+ZYtzOQBUDUNF9+ExTFg9PNcf/g+HsGU5gyXSUq3kLvYwwcG09U51qYhP7
         U0AAdk6Z9w1LeAN9wrUvt7COGrmyK0PtpofqBdpgzAU+1wEGu/KrD4MXnM9uxoGR6MYm
         o59lRQe4g3uqusjXz1dITw+laYAb5OwrRPpMiA4ABHe21bhedY3KV/wkB4GyJUIdQMzB
         Orow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774934717; x=1775539517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lRzpvodU13mSbiQfR59O+/8VRELzK9xIqeQgF2URa38=;
        b=Mlplfd9UvS1olpAtrPoH5+TPIOT+9Jl7Jc8UUGJWxMljXq4p6RPN6yiSM5GQKjU5DN
         roJXC10IylImQ0eh8agbKNQ4wpA2BvIZ0IcbXNQASqRVBI7tLglLqLrEAZQ38LLtKcDL
         HRcKjc3T0FpguCm1BXTqHa/Y2V2DJZCcsi4EXP6JO/HLaoonZpM3FAfThaoBvm9Phc58
         vxnj6evJDGx98UF0dEs6ZIuugrwx9Y/LpGBNHBM05MWiG8H+dIcLnFppjdtKGtI6oA5p
         f3Casg1t2OJZhS/Z1Rjq4LxADf8RmUwIOca4CgGsWG0migX26R9/hIc8atbHo8IXTEq9
         IruQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOqEO1ECxKpw3EDzfG8JEoC/tSozD6DNCCD0KsY1ythaUI8m6aeutf9vsQ9d/xJIXmsb1XPXYjzrgV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz19ijbVzu5YtAOiPSpvgFNYAwJf4KRSFf0PwIOIn2MY58LslLu
	85Lhat73zF/bHgPY2aUm9Hl4BuOED/eaPMA7Gyp6Wvc9XVIOiPJRUm1OO/EO/LGauivLxdDJR7f
	VF8mIvl1EQ8Nkdg3mg/4+QRB4KI1pxIAw8xj/OqmHFCvFxTB6u9T1gU6esI3IaCgbywLWtKQs
X-Gm-Gg: ATEYQzyesIKbEUI+BhpaiGGm5+Rvioaq7PYID1ig7Mt8VPf2edba5R5eg+I7+rMvwdv
	7ZLM9HBLMt4j9dLh8wk8no9RzEbFu0yTpe18oLdmSkzSMo9FmPyi9gXQ70/xx4DiulSwP4Kok8C
	EIFQrvc8VncQfPdfWE1wxLWN+3c0a4eErnZd+5AqZ780yFM3MPC2A3YJNFkkQ+E7IYbxXgHEUql
	PHK4xo2iLn/LQqdp4nwzxJfoPaiQBUgvrstUKrtYIEyYAsc+VJdd3drF+JHTHl7oRM7l9OFhYO4
	htGhSOd3lq0EoSoT5wsJsmX8TbsYOXKF/VTedWCNoZcM7hJBKdg0PDcu1iSJ9NRF+ivdRATNasm
	JTeZyw1Fay7goueyZSXpVrV54dQSWKSg32Tgjxl0EH7ujHdVuoHeF
X-Received: by 2002:a05:6a00:1253:b0:82c:212a:906a with SMTP id d2e1a72fcca58-82c9605d1e6mr13802077b3a.36.1774934717232;
        Mon, 30 Mar 2026 22:25:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:1253:b0:82c:212a:906a with SMTP id d2e1a72fcca58-82c9605d1e6mr13802035b3a.36.1774934716737;
        Mon, 30 Mar 2026 22:25:16 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843db09sm10270751b3a.7.2026.03.30.22.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:25:16 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:54:16 +0530
Subject: [PATCH v3 7/7] arm64: defconfig: Enable VIDEOCC and CAMCC drivers
 on Qualcomm X1P42100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-purwa-videocc-camcc-v3-7-6daca180a4b1@oss.qualcomm.com>
References: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
In-Reply-To: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: Fs9pyJ8wdaC6Y-DA_EeqaVo3PaLHdYxW
X-Proofpoint-GUID: Fs9pyJ8wdaC6Y-DA_EeqaVo3PaLHdYxW
X-Authority-Analysis: v=2.4 cv=EcXFgfmC c=1 sm=1 tr=0 ts=69cb5abe cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rO3wVDe-YCVyVCuK1RsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA0OSBTYWx0ZWRfX2n5HBNXueV07
 hIph4ioqpyN4NAmN4s71JwnIccs7aYzZr3A9DYV6aT18U4GmifkY7AsjQkQ/oxo5nYoJzSwmJyP
 MT02RH85n/6fMIygebygweCzob5II2LBF1ddWAsBC6KIPZdLSu0Hz93qRJ7CY3VAQjx0hyPeIMY
 78FAEC7pYc2Wt0sHKmOteOY9ff9ACxgyMd2R7hp0yFrwafmRPjWSayVrIH6qh0Xud0PthEDUJGn
 ud5QYqWyh7oScoIMC3303loTg6auJhrWx7vAl4tSd/ZfR3Mzjz4Lwm2UIK91ZuZgySASwz47UvJ
 8BmQIKm2/PanVfr2CqJmM1faZAvaBYw8Bgic8SdeB1ZjQyQAq/K54YCr4elzugL8omvQKfUZ2g9
 71bD1/SpUtYy0fgdjllQ8I8JJ5QPgBDk0CwV7EOd+edgqUdOaKv/bro5XR3ADZYkYDlpZCcj7Qe
 8ku9V2NLeeZYRS2e+5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310049

Enable video and camera clock controller drivers for their respective
functionalities on Qualcomm X1P42100-CRD and similar other platforms
with Snapdragon X1P42100 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e44e83bc57812aaed21bff1b12d36ae4a373ce11..44dc5da9805ef01b30c39ad2235f9d294515b360 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1492,7 +1492,9 @@ CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
 CONFIG_CLK_X1E80100_GPUCC=m
 CONFIG_CLK_X1E80100_TCSRCC=y
+CONFIG_CLK_X1P42100_CAMCC=m
 CONFIG_CLK_X1P42100_GPUCC=m
+CONFIG_CLK_X1P42100_VIDEOCC=m
 CONFIG_CLK_QCM2290_GPUCC=m
 CONFIG_QCOM_A53PLL=y
 CONFIG_QCOM_CLK_APCS_MSM8916=y

-- 
2.34.1

