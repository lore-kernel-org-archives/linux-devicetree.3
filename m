Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711A53A4524
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776706109; cv=none; b=H4wrINM4VAALN6twVOMeOHGzLcAiI0UZY5vHYHIajQqNv30WmXfJ78CvmZW73f/DgqHllACsgqUlATeqeJUAltbIRimqJcWAeLrx82sNO9cCBxaEkbszJhsAtc+YarrgP90/MpfVsT6sw1E/huGE3ByceU1dz7yJrUh27MPtVIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776706109; c=relaxed/simple;
	bh=UY552z3y8obE9CEbg4drEcr+gXd0WCTjZOc7FcG2UE8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VfQ/z8LnCMlm2FuY8dkByFExMUZA+fnFRENYzz0R9Ojqy45KAOji2AWr3S3V77Xz3hNBdtCatJD+JXyBR8CtnJagP8hKG0rYea2ukuC5MM5SlR6Zz1ljG+JY1UFlA+g9ZWYws+ZhCqUqzrZuF8ipP6VtfX5TwMl+fCj6yOQRivE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OOQic2JO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OUBTiXHb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OOQic2JO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OUBTiXHb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFgs8W084498
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JKDaKyK8qTv
	C9N3FxHWako1QPbw3kAUgAinToGZ5C/U=; b=OOQic2JOgoBb5LDyfFvwo2MOymO
	WxL1Fy3uZY3ebaj2dusAfo0LiWVTDISYzctQTyvCu0P5g/8bhEt6hD65PZihmZly
	4Sj0phoT/LBvRIMKlSRwq0edh4DQSV0wN/vqxFpxedsFvP4xSU/t4mhvEt22DLkc
	4VldjcOy8Fy6REKJkrlWzip/RsIylu8YTaGE6qmfSVsTjyKkd8/aVjTJ8jOLLJKM
	/LY5TCXqPd8Mo11N9s35O6+2cDdr4fBj1WSA/xzhdyO9rwG5UqT95Qdhc14WCHUh
	a4ueMwsZ1wPLVnuH+eDJ+8Bs/HyxNXkSkHfkBBJAZpLefS+S8pHlXQqHKEg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh81hv2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:28:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35fb969a4c0so3813146a91.3
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776706105; x=1777310905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKDaKyK8qTvC9N3FxHWako1QPbw3kAUgAinToGZ5C/U=;
        b=OUBTiXHbM+Xj6wxO1b2c8WtoMOZT9Tu9dhtBO1I67+HnJ88Q7FHhX++srnkbfHg+oO
         Dsx1bbMIw/i0a+5u/AgkNTP8rHzGOVNnX5HYHzCp3fQf94TnZoTS3ofC5oYoNErKidOz
         Pf4hPw4e38bSSpqq4XLiVcHlfgrRjhapbLTZYkb496glUGybqQJATkEGXgN0a7j/oKrm
         fQ0XOXVXLYvl8Q7uw9REWn6bDRtFVdUvwD4JMrX/P7Ad/gIOXDa7taZ6WbwNArujDOXD
         BNEH22Jy/lBX/VkDjaho6zJBTB6lAyjWhSvYD7Uuv5YcyWD0X07THup3Yn1b32kifz46
         hG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706105; x=1777310905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JKDaKyK8qTvC9N3FxHWako1QPbw3kAUgAinToGZ5C/U=;
        b=Oq7Iaf8YCkI699L4n+iSyajf6mhERzTfoSWAU7NcmR6lunNzPQlL5mgnrey85EiCPu
         a3wPY1xsgTL6hj8Ok+wCayEL1VrMewGPwxHycxSf1URqtVEq9a+O7s+2huJ6moNRayQ1
         wCVH0rX5Qr5seSEXDehfQ7gukY6TClhO6suLN2Fh//N5JzV/JLruWnC8uEeRd7Y/YU95
         hXy1/dXaNUZPbsw5lFLKcb0Fde4nLAg980fx7DDF9WYk/lMWmLjdBUeZ6qcV3sqUjKSc
         NYEMNlr/DRuNlu9UxL88r/DrB8kUz09h5i2tK3FxkBVs753Qjlzjue7CtclagU9O8iFC
         Xd/A==
X-Forwarded-Encrypted: i=1; AFNElJ8NEQbXMfnf4dU66UqSqdcsBuCUkY735AYnBBUvONQuJlJkOgclxKdCuXuoG7fjC0u21rz99NIzuII7@vger.kernel.org
X-Gm-Message-State: AOJu0YzNxNkdcWpM1lhj/l/blflyKBO50tCZ7HMlz3fJrXWbf59Bn5k+
	LYIx8beN9WtVs2fz3WWYGkCo8EegV6rquOfZtWBLB6XHDJpAlcJCVKF6LK9Ds4nR0/twxoi4+IJ
	jZM51EC6lMbeV8ztHJS70u7UUsmdX6t8/xEwTL14AmzmNjVgrgM8lGLOjic5RUHEj
X-Gm-Gg: AeBDietyFO7hSjH6gHsVRH2CNMNf4PE6fO+9hb2dCNMtqKQLw7wgx/ezE1zBehNRTBE
	AOl7f0oIHBg5gjDMRkXpu+ttirqpN3N0lVlrE2/R5zjuWQum7NicsbR8/6NEccrAT/Z1xYaZNsK
	kYCC6eELf7d6g3ho77AlGlFC4e8COwhAWfl9yHWSeoolJ7Dz/s7fjLLFauq2BHLzMDDDMWgf9XK
	5bwSdpuMo7L0q9ztiketkwbXJU0XgMXahVDFvcCJPusfxkHgQZaYUUl/sPMBHI2zQlzyJvEMvoc
	zu/UXZgeui8mYlVS4pEyeDBwWioFFCEs91g51+S8k4Ni+AXlKJHliFwvqIzwqOpJMAlZ7hQxiJZ
	apTgYfkfRjoQJ1rqQP7AqcbrS6J7vnnrNZTcb2KBeK9Y8GRaOhTzjlP7wRVCV05c=
X-Received: by 2002:a17:90b:2604:b0:35d:a6eb:197f with SMTP id 98e67ed59e1d1-36140226cfamr14800048a91.0.1776706105201;
        Mon, 20 Apr 2026 10:28:25 -0700 (PDT)
X-Received: by 2002:a17:90b:2604:b0:35d:a6eb:197f with SMTP id 98e67ed59e1d1-36140226cfamr14799968a91.0.1776706104426;
        Mon, 20 Apr 2026 10:28:24 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa17632sm113132575ad.24.2026.04.20.10.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:28:24 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 12/13] arm64: dts: qcom: sm8750: Add disp_crmc node and CRM properties to dispcc
Date: Mon, 20 Apr 2026 22:58:02 +0530
Message-Id: <20260420172803.4124418-1-jagadeesh.kona@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE2OSBTYWx0ZWRfX6LatI/u3DKc6
 8FHeKYJ+S53Oz/XHno3sW+LWIztDsC832sjaI3kSx6fOf3aN92oIwJVBmq/F5znTv6QW3atVum2
 xCmWSSfoloho89we0jQ4Oevu29lAvUdJKyp0JXpUi20kon44l6KN+D0U4dIX93POwz5hV4pXd4S
 qENTGns+XQAVqFtCXHvmuhvCrLD1ZfIKyzbRHlxtyl/KLg74B7Jk5tL3gKr/Fd8y84KC6J87883
 hUJGe5xJvlMZn7upjq600tTIu6gVt89Z/2oAVez5MbODq2M2ieX9xOJTBQtcwuVty/Ko5ZrGJgU
 nKU19WkYZAIX2P1g4mCM/yoV8BOgJaKI7jce13GZn//y8MDoaQxq58sbFhLnDkcgY/MAykA++Uw
 xno3GXb1+SIsbaXpQf4csG/2P32E9rnGDH4Pm1lrdCyfHmanQDSH6RLsU90OVM/TKvRHwEx4A5a
 C10GUZGe6edzZlgklmA==
X-Proofpoint-GUID: mqrupe_lfkZptwVVjcLzyeZzdR8Exz-4
X-Proofpoint-ORIG-GUID: mqrupe_lfkZptwVVjcLzyeZzdR8Exz-4
X-Authority-Analysis: v=2.4 cv=PsKjqQM3 c=1 sm=1 tr=0 ts=69e6623a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Ts-O78zUOEHCRh5K-HgA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200169

On SM8750, some display MDP clocks are controlled by display CESTA
hardware. Add the required CRM properties to the dispcc node so it can
communicate with CESTA through display CRM node and control these clocks
using CESTA.

Also add the display CRMC syscon node, which is used to read the clock
frequency lookup tables populated by CESTA for CRM-controlled clocks.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 5d2c59f37015..0db586b02131 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3431,6 +3431,9 @@ dispcc: clock-controller@af00000 {
 			power-domains = <&rpmhpd RPMHPD_MMCX>;
 			required-opps = <&rpmhpd_opp_low_svs>;
 
+			qcom,crm = <&disp_crm>;
+			qcom,crmc-regmap = <&disp_crmc>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
@@ -3451,6 +3454,10 @@ disp_crm: crm@af21000 {
 			qcom,sw-drv-ids = <0 1 2 3 4 5>;
 		};
 
+		disp_crmc: syscon@af27800 {
+			compatible = "qcom,crmc-syscon", "syscon";
+			reg = <0x0 0x0af27800 0x0 0x2000>;
+		};
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8750-pdc", "qcom,pdc";
-- 
2.34.1

