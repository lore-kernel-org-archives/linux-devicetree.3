Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D8B18D658
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349267; cv=none; b=J9/kKM6Ta2iTTQOtDkUCExwzC0e2oDfBiTHyX8rMggnfq3zKs+vrnzwNYRZ3m5AywOByTzIwmS4zauCLrljtyjlV1WTPd7JrJfIclAfx5TuSp4nka63RP8TaJV2ZGpO+ooTkIsdIL2wreQV+rJeCxIz8C6msJfHbDSPpuhjn7UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349267; c=relaxed/simple;
	bh=vm4vFae9KZ5peWjo+7ETJQKYic+heVZYLQ7TwB1BY34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P45itf5nWU/SUFTKlPCLKzGdy/YivFtYHD5sEgmOxD6cbS81pUhd1Iu/8sc3iL+YbHaaF6MCnGLBW4LnzBmZVFA8ItYdbqlfXOFbktT+Z9EyHpLLfsOyfUcuOM5r8UmhYrn53VcUyF8/DIcoNWw7e1eN99JadQAb04GTSQ3lqJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAfNLS4a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jCfAgllE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAfNLS4a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jCfAgllE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OACJlN1762131
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ONXmRW2mp05oYjjVFdlwD8Q0MPE75jtjxRhE/bOb+IM=; b=hAfNLS4altDF8hya
	jqkl7yyUCNlgQmwtS6TTY46R4SqlwWUNcs+NR03AwfpJ3+iCwUD+mNoF5rAr+LRB
	pM6xTJJ2HgU7ReaCDOwk0zQXeItc6gsohTZBQOCEzD4tH1L48MEeMEJTmIncnVz+
	WwoHJZ9f8jbb3CTpYzWI2Qu/ab5cJY63MRcYd18QL8KRRDtnRmhLeqNVDqZ+up40
	ajw3ySK+wujFj2Raa2wuB5XdjgyK1LA+8WlIwOs8mt9/TZ9EqOP1lKvmpbttYh7L
	UpwcdD4NM5H+0EjMYFwXY3GT7iQHInRn7dxq3PeMLhS65LI4gQw5lwzsQ8fyG7bn
	WKHv4A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f0c3n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:47:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b079b4a8c3so35508305ad.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 03:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774349263; x=1774954063; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ONXmRW2mp05oYjjVFdlwD8Q0MPE75jtjxRhE/bOb+IM=;
        b=jCfAgllE9+A+DH1Qv98HSkeHYYSwMlslH4Mi1c7sQTNVT1eG8q/kxuCdaXJSXbPcs7
         AgwqdKZ2Uo3bi17WzLnEv6+30riyyHnkkiMcwqLLsANb+V0HM1d4/gEciEfzaIYmkCZ+
         2PJthqj3jEuo/5bIOf9ixvv5Lot7RhOxU1ccnmHexOPvgk495WYwGNNpfB+/Zu9/v50M
         qyNFsO5goSr7z7L4tHcwsufCqEzreQi1LlDYwJT2b8xOpzMrK3ae0gqckIGuV2OvjC60
         LM0Fo1UAWPStgTGYeznPTWKLhCVwn4vEFCgw7BEBlNSi1VPfkMz3koqTutKJVJ7fQaTP
         OpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349263; x=1774954063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ONXmRW2mp05oYjjVFdlwD8Q0MPE75jtjxRhE/bOb+IM=;
        b=FOop5sDIQWp+6ZTGpwlXKGU//cSUC3L7YWgK/ZOUSgmYtIb7vgL1JfB4NRZaQrsY6D
         rKlvoytvNA9apTgkjbcuDpQoNGJvoyxOaKZsVSf790eI62ruHE9QKHC5o+rHGsHDl2oI
         HAsgB92Bk2sPijl1vu2f8+HthmnT01wkQr9fqrRD5/yBHX3OO5y8cEnGa/sOTcwlfGSx
         iUPMMysZ2xPh4kcuRZUtcDF/T/6jVwsbBN01IKeJEsyk1uvG1aTw0pMfyDb9YIieiiRq
         GQj9jDFAmxB95Xz4nSQp2T8czbYFuSfShV9Pgf0VeOl65tAlqNOwhK1yKAieGvAPWgB+
         KgJA==
X-Forwarded-Encrypted: i=1; AJvYcCWz4OJhl6lMW5c9oCBX3c1TzgYwodpPnCz1XZLh0aMsxpIqhV77+u+x9VMQ+S3ukPCWDBsqc9YZf6DS@vger.kernel.org
X-Gm-Message-State: AOJu0YyJpbB9e49jV2NMyO988BVvECIzhIZX4vHtUSjVgN6JjEndLmH3
	0vORj8u4zpk8hV1LCVNsVperbSBK0CLkZnll6MZmtVBTUXBKdcvHJK8xpxHi2AYmXJIUFiiZeif
	2G3ImQce8l7RwWyqz3oRMj/WQ11qVghtijesLZipEWEqwpgUmLoxsiHj2PEdP+7xF
X-Gm-Gg: ATEYQzxoc/NVZuffJ3hteRD9KP/E5sBCBRzfIO0G6v7JnVFYTUdd4fEdYjd5sq/4ikn
	JLodyxTQzOa41mW7KSqrzngAJx9NVboXQAzNPRId+S3uaRT89YG0JHtHO0/3Otp3LS8kZp0Ub7f
	XT9QipIMRudZhVM+x5JLiCaNtzDrIdgW3Iu2ktiqI6Xtec2npY9+rP1ZrgUelKnaStUwchmngOX
	BP5hhj3MHBq32HOQhcPq8a+IBxynO+g8i7isM2YOnHNYwwUaRF3x1p7DoSYkGhGTvQaa7hOH59A
	vyOLFYg3/rZawlWQkJ7z3ZCGG64CrzpCbhTw6HtpBGwvT+58yGPXsGhW4FPXzcTW1WHJBxJGN/b
	aFsTyOIzhxyu3+alkhNqEkVishOkBBe/s2XeU+cIdkdFIYp1MzQ/v
X-Received: by 2002:a17:902:d512:b0:2ad:e521:28cd with SMTP id d9443c01a7336-2b0827a92cdmr151443785ad.36.1774349263483;
        Tue, 24 Mar 2026 03:47:43 -0700 (PDT)
X-Received: by 2002:a17:902:d512:b0:2ad:e521:28cd with SMTP id d9443c01a7336-2b0827a92cdmr151443455ad.36.1774349263045;
        Tue, 24 Mar 2026 03:47:43 -0700 (PDT)
Received: from [10.218.44.178] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08351675esm183655315ad.14.2026.03.24.03.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:47:42 -0700 (PDT)
Message-ID: <47d83a5b-78f6-4354-8543-440ea06b8ffd@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 16:17:32 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/11] arm64: dts: qcom: sm8750: Add power-domain and
 iface clk for ice node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-11-e36044bbdfe9@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-11-e36044bbdfe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c26bd0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RcdfdvLsBkETvr5PKcUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: pSX2ugGx19Or9YeqFrXl_C9SoygtzrOf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NiBTYWx0ZWRfX9u3uH5Vmgu2q
 wpiUW9+vb93VrJYuxtE1QW0YqemISLXmUoeHVlnbxc3JFa9zomdwul2PHNnXCAsI6K1Ch54or8X
 4CW13qxXD9VjrWRhKMCBLXazWFhZgDgpB7M0oooDPXjP/BEwu3Abe6QPmaMMK5z1O766u/la2yR
 OqeHuCBnKztvwT6chMn3XoJA5EohaZgON4MeeJRn1LFFQkaEXEcn1mCYkHh8xVx1eGmH/+0zgZm
 rWwwbGUsZWdGrhrEEfKVg9gCADwWC7mT1aRXNsxe1CmFIPF2+zdfrLGfzKSDBuwQ4/w53txRBh3
 cFKRDeA5Yy1yeHH3KRs5tli1QGoiUMBluRdVlf3xs0zrbjs+Y3aj+d7r3nIkP7u1w2+Ez9ZtpY6
 +lTGFt8D3CgX5mHJoNfnGk8Qn8al4FOpHV06Bd49W2YbibhBIC179OFwRoikxMw1hJeFOQM4Prz
 e1IL4KM0xw+inaJRIiw==
X-Proofpoint-GUID: pSX2ugGx19Or9YeqFrXl_C9SoygtzrOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240086



On 3/23/2026 2:48 PM, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
> GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
> sm8750.
> 
> Fixes: b1dac789c650a ("arm64: dts: qcom: sm8750: Add ICE nodes")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>


-- 
Regards
Kuldeep

