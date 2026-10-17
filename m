Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB9D3DF008
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 04:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792213123; cv=none; b=fgQkiu6bfKeCmvPYG75CBPix+Ia4yQczwA9G6qHoFi5X7v7KCT3sryQZM+GKZ3fnr0jDeEy0AbCIJvVLW00TU/7Ur9pqJZaWHXSELrELUkYFWCuLcqgLINsVCRI1dWCOWddfZjxHyAUzAT8wvuscH56J3HM22lzU6O4bXmBVUo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792213123; c=relaxed/simple;
	bh=gUbGpMehdXTAOT2mYSW1dLh9J4F58m2XPrcBI0Gk4AQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TyFw4831/nGynM7y+83QOs2Dvqtdx9iGfJ/vcv8FE8SOWeL6z57pg5afJxNZrA0y1abTvQkDtIErWpbW//hcVx2P/dVMOeXxk6RGgL7CHkjUp3ogiPwjVrpEb2Y4ImY/aCxnUJOGsFN92n/aEkKFTrg4sBbJ0BTf9SFfCn+gSbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OzHRHq+q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ToMtdU0C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OzHRHq+q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ToMtdU0C"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H32Yhv3784311
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 04:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TGJ+GhNnkEO
	Ld2KsiipWAv56syre7ugC3IzB9jrXOZY=; b=OzHRHq+qbBfS3s+Jv/xpFwPPr0X
	G1VwwW6tqkf+6KjhPcaKItgFrJiEq6lCsvKw/QaklHeYRS8sZE8zH/spD3K5DL9b
	E5KpVSffr/I6CXHchGJ86hvF/9BWmraON6KPN8OLumnEoJZPoPV0ocskzIX2eJCY
	vVMHW2xcuR8B2SfswMi0xdNv9CTLsQNvE8xWblQ0+srJ8WWutut69zhyUOv7CSq5
	KEMDhmILHBRkv40vc4zsewWL+RnKf8TRMShK+7bM6CplJe11WtuTsM6EmiIva+DM
	lvulMLYlh/FdZGt2AGF/NvwVqBIEtLc+kk3LhKP75wTnuzjBnxs7ZibObgg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0bgg7q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 04:58:41 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-147be78cd56so2144399c88.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 21:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792213120; x=1792817920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TGJ+GhNnkEOLd2KsiipWAv56syre7ugC3IzB9jrXOZY=;
        b=ToMtdU0CfSk25hCBtzjU28U6HRrDGdr2SbZWGB5eepQ2liNF25II9nRTi6+QrEiDA4
         ZCP3jZygtGOl2zFCOMTz0Q61dga62z12CtImYc+CCJ03S0jFKOxGbcwMC0mNvhdUDUA9
         zwd8mgYw3j9lv12SGYQtuXOHBUC53gmlZe9wcnMdloAwheyigY9Vs3YnSnzv7/SJFhFq
         T2FffIKlxsizNrh+LUEUp52lFOxrwZpzBTkhWrBhctJCz/MdsqIIQKuqFTW6+jHOKqJB
         xTjRJE9ZjLQ0dbAHqdDX94ni75J6xoDK7NM4xwm2oINoN5rVHfg2DVrIJE8pPZ3dFsdo
         J+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792213120; x=1792817920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TGJ+GhNnkEOLd2KsiipWAv56syre7ugC3IzB9jrXOZY=;
        b=ttCM/GfeMdzKVEQjhOdPJbjG+7YGlvCHgQ7H4ukn2MBRrMygyvzZ/hBYrpQ8VHbFr6
         qHa/WCQzx94w7gLXTf0KA5bVKkfMwHD74TQuaNFl8jx8zKY6z15m+v94RnVD5C/HCH19
         TxtD1n21QtzpN+2+eZim9/YjVIwY0/ftQzTFSgcOEDNQNgu9w/QTbUUnTNeq+g3LNmyM
         bTf3dS1zzLQKIxtYCW3oexnNhXE/hxqMBRoEnk07ml7az5B07/ip9mEkTNlTx2RlqFI6
         8shJGwIMKvkUkYqSERVNJt4iYk3eQKAXWWwfGrQ2kOM3M+EByhJXCWHYDcqjAqBz448G
         N3zQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmt9dV6fry6+72z6PGZWLnjKptUmhEfJ+V2xext9uEEEYAvTYxXV/TS/nSk8DuttGq5aDEr04A0187@vger.kernel.org
X-Gm-Message-State: AFq9FYLVbEblXG7Jh2Xl4s2VCvukV3wOxjpOqdiqT7nIRue9cWkecUFM
	CYE74gGo56dHWIvDYw+dtGUAyKsCCfIOOldvAway7Jkyvt8OOn+3ijVDKcdgSQhxc6X0df1FXO+
	VVBTtmXrwh460Ds4kPyBFZXd8XY01KCx4CqzhqEtqLMM+n1TtP3LgHr/hTD9tbpkw
X-Gm-Gg: AYBFou2pRRTHMuo3IebF8eHVk7PCKeMU6ZEF+tykJ+wCiIWRyyQ4NHEO466j1A04l+2
	Ztnv/LX5zIeKRlDYXKJFfpXX3y4IIPBmU434uGNTM7xEBJ3heF7NH7YFl2K3TWMn8YoUFN9jBNb
	NHsuBe/pcr3OU2I8ZUnCdcHRwYI5RAW5YAczzz2dpbzEbahj+bfV8J1jCxV05bZ4bM+w+2+i3lb
	8t/+F+CXdAHP6G3RGkbjzb96QgbcMBXZnuvbBD7Df/uWi3zan42rT0Q4A9hMdhO7FfWwtIRNLz0
	6Bd3NTdkYNrvpuh85pNNijV8F1Kci80jdxYaiUe5A6+Yb3uAw7meZG2zpaGXk8qBIFmDtfOd7s2
	n9A1cqD2G7xvEnsV2YE7+Fb+Bmgdba7GCHShYX49UJANZxAztaihrb+1LHXU=
X-Received: by 2002:a05:7022:ea50:b0:184:ad2a:d1fd with SMTP id a92af1059eb24-1851434f3a6mr2450120c88.37.1792213120117;
        Fri, 16 Oct 2026 21:58:40 -0700 (PDT)
X-Received: by 2002:a05:7022:ea50:b0:184:ad2a:d1fd with SMTP id a92af1059eb24-1851434f3a6mr2450095c88.37.1792213119588;
        Fri, 16 Oct 2026 21:58:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm15203817c88.11.2026.10.16.21.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:58:39 -0700 (PDT)
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
Subject: [PATCH v3 2/4] arm64: dts: qcom: glymur: Add videocc sleep clock
Date: Sat, 17 Oct 2026 12:58:15 +0800
Message-ID: <20261017045817.1506961-3-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfX2JmUVFgKUfBs
 eNmFx4L6+PQxSFMN9k+ap2NlUzZhpkVO4QEEXEn7gycz0thOL5JMfEkZivK+1F/jDdFoRqNQY1D
 AnStpE1ORE/9g8pG8IiTknAiVO2Ctgc=
X-Authority-Analysis: v=2.4 cv=FayiV5+6 c=1 sm=1 tr=0 ts=6ad30081 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=kYVbGFCUSVokFan4DuAA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfXzyK80Sl2nabz
 HknmbnHf+G8LEJ9TIeL1C6ijqdo7rTqtFU0Hk4wdQmomgkt8nWX0Luaq3RL871ezO9bjQZf8nCc
 bA9JutZ1+TOw6R48x2Sr+HLYR6PXWkmwdjggkahyWE7pCfQRgLiB4UdSaIKHIUx6efRamUdEhq5
 gE20uvfpTEkogcF/AWaFilpf8sl7pWsmVyZp66wv4KfIjiRgluHca4cwmJfYtG4uNSP+et8/Kxl
 hJxVAQYwaS8Id/0OVgXvKbe5+M3rbvpTK87tPKWdWZ60qh1shKnpSaNxAOkGjZO/e9mmB6hDaS8
 QdCzrzYn2+no0j9Q545LA03mrbbbckUP3UWr2sGrv21B/5SAxQRNUOHVbLEcw7Z7fK6pqeQ8HN7
 rTnK6ABztyxRtUNAYd7TvWTynHPX77iIRiufxtFJ1NzrN6PcrQCQvLFcy9TIYot350kmuYfTDdt
 fwuUOyYColB5AOGWgRg==
X-Proofpoint-ORIG-GUID: bGvBrE02tqusmRpgpMFFvZgLzvx9Cd-x
X-Proofpoint-GUID: bGvBrE02tqusmRpgpMFFvZgLzvx9Cd-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170019

The video clock controller binding describes three clock inputs for
Glymur: the board XO, the active-only board XO and the 32 kHz sleep
clock. The videocc node passes only the first two.

Pass the board sleep clock as the third input. No functional change,
the video sleep clock keeps the rate left by the bootloader and has no
rate consumer.

Assisted-by: LLM
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

