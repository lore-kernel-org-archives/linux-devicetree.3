Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B049C475331
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390223; cv=none; b=A7v/Ani0aW9ZWmSGwSnFC5MkPuhLBYISu/gCO1mE2uDJ2ph0fD19YpN1SBVN7Wt2fpo8hr2Q3sA1k3wongJgpPt9xu/vaaIziM6+wJj+UfS/J/Nukpj3YYphtC0xAQ6fF9IXSrmaLDYfq72Ow7ob4sg/U/c4/j4SmYe1l+JVg80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390223; c=relaxed/simple;
	bh=gDMpFJWapcnhBZHow5tYWj4u0/ni4AXCm1hEuPmwG5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iwbEtm371DaSh4q3kteYBdY4V6v+8e3l4nq9SbfrZi4Pj9Zv75ISISPRiwXacWBP7kKW3IglO6P3hGZA7UTCCNqeJvu8THbI/DeegWRXAMhk0QkAK5BttqTETfzc5lq7KpuAOJzy9fzkVAjUJZttUM6GPR4R+ixaXK+KRfaiPPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjpOMBOM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+f1fRZ0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjpOMBOM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b+f1fRZ0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ECNfUD432253
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBk697OcXRYhQ5p1XM5h8Xcl5jMkWBXjU8/ArCjrsWQ=; b=TjpOMBOMnolk1QWI
	ZZOYnirI51SSYdlfuFYoNBqQyE+fpwiIqjrgCAUQlDJ9ynT0qGzik+zl6TUX+IM9
	fA/xFsoId+u0LbJ3XV/8UVBrzbZ5gnY5X0AhsM2zPzflqNO0pGFQCAtndzohBN0V
	O8dJzCgZywnRhsQKP32P7FKENyRbSjm4bu8J9gqNHCSb1zkK1OED8jYQxibBM6Z2
	j7YLsRUGhFP6q8JME+g8XKAx5dVOK1x6jw6hHTxJYl7Dv/BoMnPd7CScNcPhD0hs
	yXGRX3WjNYzhBAFrwxTfX/pHGr+74rjpv6eH/jNDukoDNUU9c1TBFKaoeV269z0H
	HzB02g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtg2vt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:50:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939062ecda9so499760285a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390218; x=1789995018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBk697OcXRYhQ5p1XM5h8Xcl5jMkWBXjU8/ArCjrsWQ=;
        b=b+f1fRZ02ERf6o5Xb/LAv2HfBoUSFGxbRGXilmf8222X/McGkujLA+Uki8h26OUf1g
         WCi5P7CwrPoFhj6EBwUB7xJgenQ27KleTkdJQ8IYoeXlbnPtLg7+hriF+dW3Fc95E6xZ
         P7ElaMEijFQdnwmxHxAYctNfxjKsss8Qb1ByNhyClLy7HjcvbU0X5ILllvvzGRjpQMcc
         kDQxeYdJt5IlWiCB/dnu1kM5kEPeq9CZjQisXkZnbXh1UM0/sRXDLEblyT5cNR6dIp2H
         kMGjp92hWn2VoUwM5GfmiMd//DJPsGnu/Tg0iRWqnhgVxF4YrJt+rHOmdKJL0pRK+Tip
         h+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390218; x=1789995018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBk697OcXRYhQ5p1XM5h8Xcl5jMkWBXjU8/ArCjrsWQ=;
        b=OSlz1+A4JNbw59qz6YtFAICIoUjmuZkGLh/6Os52hY9W4nKc0vV8iC0Wkxm8z6uWW0
         LHUaKjUdtJ5R6wBtbl+D65G2XiSNU43PbC6Rm4sLE8KGlf+7/kRloGqPIzGZP4Hnmppk
         I8mSYbivKlF32Fc2hB5RHhOF78b5dSD3OWD0ZdsFfTVdaXfZ4m7AWYGZH/SFezMcPaBH
         cavYu3uGcqV/6FUcj4Nb7T7ZPlTyeytQ0QKDaOEsYnj3ho3LMXRs8KdhHm2VySGF89JZ
         7FGFVok1BG15Br29LE3tbtZCadi2ToayUIsvBw9EpDphCyjwLti898N+le8CgqNdL5oe
         kueA==
X-Forwarded-Encrypted: i=1; AKwUvBzBiZj74fsVxvqNiad7PleMNk/tahPlQkp8t4fWcjV8Uq3/XVei5sMKul2fjTrc7txwq8rED2I5h6EI@vger.kernel.org
X-Gm-Message-State: AFuF++l7esAkXjbO/kTYSyHmLg7ghgf1HSVqOCeSt7CQPkWeVeDdbAsV
	TsrXQ1PXskuFznFUSw+GSYKWnJXeEMraxoswT/3DYK9QP1eVSjhUQpxbAanOItDi9YxtstmRk7c
	h6pJV8hfIaMsOEPU7RQgGBZJ/Us48pDhegTBLoX77xT3cpib0Q46VvT1dodi0Ha1S
X-Gm-Gg: AYBFou0xH6a+MVu2EiFh3FVedyTuyyWPgbM5SQXl1TENN2FuYJmw3IZ9vVlcpE4+np/
	nrJlfIHikAhd05ZTanRiotVV/QmaSZmuGDmC1oopLhh7ZrP7aUu/qKfLXpOKH5UOZ3GEmV1jECn
	VSxr8Nbu5LaWTCQR05RFGs3Agty0l9t6hLgfyInMqTQ9g6V9g9hgcEXi44AfO80G5dvZpKwA/RX
	U/aEA8MFbAPD5rD9he8GQWqhAiWhpjIQ78OeOtNUD+XOH+5nluti7xIq37dft5DP0fm3atMixNA
	IwUC90MxneeiOsCoLso+LHEdJFAgzoCIWWXID/d+GF3yzj4QLym2PyyABUDSv4hwLE1r7zF6Ib8
	ibKbVdu4s
X-Received: by 2002:a05:620a:4885:b0:939:5f4d:67b0 with SMTP id af79cd13be357-93a29766649mr345896185a.8.1789390218280;
        Mon, 14 Sep 2026 05:50:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4885:b0:939:5f4d:67b0 with SMTP id af79cd13be357-93a29766649mr345886985a.8.1789390217488;
        Mon, 14 Sep 2026 05:50:17 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:50:16 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:50 +0300
Subject: [PATCH v4 51/52] arm64: dts: qcom: sm8750: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-51-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=gDMpFJWapcnhBZHow5tYWj4u0/ni4AXCm1hEuPmwG5w=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z99RrWtRkAmEqS+3SUBLhnWTdNFd2KpIwrz
 ImDoDhFN+aJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs/QAKCRAbX0TJAJUV
 VhVwD/0cBO7oZN0lN/wkNiy5t0jlMMGSOEGTNF30cWjVGmUlWn/f0HKcWx1zf/9PJ802mrlKHmb
 Eb3sT3obVr6vcC52UG18hDKNFUK+k6jDqWKfodSlEORd9iIv600ucrs1qVDsp7fzB4YASSselmO
 cyDAWlIBwYnx73kFB1DjALRCXjKJ79uiq49hUQYhO/Dmw/0TrPtXUa01aeQeYSH+wJ/NFTAVlqG
 NvNtesIRd8RobVyUkAjFarJ0stKDh/BGWuPuT5ZdW+XCZ47fA52LLzikfmkU7ZFANUPi17l6xUU
 zx6OD/57BuAloRYjxVENexoJa4GFWYcz1F4qU+C9kC/o244qfB6xZ2uqDA8RUGNj4ARBMK+TDu6
 NP14we0P8nqrami8i6s8fQFTOyXMUiFAOjjLQYiobDOs13c2IyGztV4kC9BZWrCFo4XNwYfkmhJ
 +7fYEJVXUZ2qro90p64Kgowm5f3L/pkXt4sM5myDVhOUCMquoeTfrKHxmsPKLgAQdXJjIkpDmh9
 Bo8ch27D0ODG2CMgPmtFEFNgw3iUAC2LIHYMItCT/YgQqXW0DRDw2spcaAE5NpqOxVq/Wml/u8D
 3h5RlOoYw5DL9zfIT1eZNfrRSum3B4BFR6dyoccYGVKc3PNkhmgLfMVhCD+hqJ111ZMeUPCI7+2
 eRyxSeSYY8w90kQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa7ed8a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXxXqjisS1Xcx8
 dlZgt1eBotROJ6MFdIyLpdnUIE79y58Mc5HveWiwceSLoWv9h91Tg4wjvPtcH5gZUBUJr9j2Lxj
 3WiEMl18J0CftpYCMoqgAXrk7XPpnoO02E+18iI4qI965rUP4A/NWhhFZqG0HykE9EHvm9wZdaJ
 V0lRrVuui1aAF6xiWIa1JjqoeMuMg2ylCXkeThAh5bZ1AOaiJrzKZFObjP6/T+ojtSlYvo05yM/
 xgOVzxjTcxD8BYb29hKA3AbDB/+P8bkumZJ3/oehzLHiTapr5m0Svf0y4hSGfX3eDpJW8PKpfbx
 HOq6CNoOFC/jgi4nhkuus3DL+VQR/lREEVS/9kixcRmdotSnBznvYMu5mHvgUPWy75fNh4r2Mzm
 JRlBIb3gyRw2VxXvLZxgjLOCXjkYG2lju7vTSA18c6MLPHDqygy31qIt9pKJWVnbu6M3rqCnEhY
 9dsU0MPu4WFuM4VxfAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXwJO1/Nzv0MCi
 V7y83FOfRjiHnbS4RPVDdR7oIthJfFtaeG8zHSV1/g0cS1tnTnIRKBGBECNF5/aGblWavPWcXgs
 hq41TWNXh6CC4iqDFn0judaaxDfNjG0=
X-Proofpoint-ORIG-GUID: FpdQCo6TaZn-BdB0O0h7D8vf5zsmaNfN
X-Proofpoint-GUID: FpdQCo6TaZn-BdB0O0h7D8vf5zsmaNfN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on SM8750 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 28cf22da854d..b9e943afc510 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -677,6 +677,8 @@ gcc: clock-controller@100000 {
 				 <0>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

