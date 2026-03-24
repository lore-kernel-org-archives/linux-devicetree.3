Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F3136BCF5
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348743; cv=none; b=tPlLnVcb+jGX+yossMhWjo8xNZIZ0SdnnaJ7JC7V+ViVnqKwPzsSo4e91S+i5PhWzRpFG/dJP2sUoLSAtjXPUQG50XhYMkjaM1E1H9u6NvBM6+9jkhOF297rz763yOfGUHh0zIprzx3qTD/p5h6195CSWqXKPGe753e0CAiEYm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348743; c=relaxed/simple;
	bh=ji4Q4buCdBt/nwjhvDAVS5p5y2cqvZ0ye4owGzsxLNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HHpl+sTR8qIcqqpECIp3mqelEGxoZ8BBJC57dq9L3A8oW5AaZncnoyc/0Kq/mo3VBOP7z1cQuu8dnYAUV22xKSrVUX4StcYj0WuIiX3bbjyUd+EUcwCoTgCT1r0OKt9MPvX3nfTlyEBDKQ/nAxAq3esB7SxsSFRtYJlbsNb8l3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R2cu2WVj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+j5YDmI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R2cu2WVj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+j5YDmI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9RUAp3934853
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Pmh8hicjiF4UT4+vCZbMqrok0SPFJ1WtADq/O2gJng=; b=R2cu2WVjlP+Du0Nt
	ros+fY+qR8U+RzBh48yb0XWOgahE5pIcU/cs3QuM6dLyVTyVCrsIXe2Z/ytj9utO
	m/NIfyJS1e1W+DgUFxUPAEC4NH1K9nuQgZiAkNdMjYkPoNZMeJ6VdfXx9e56JWfC
	HiFsMQmYdA1HGwmGP+5lAZHbxy0zx0bZoUFHYckNnZmkvqrhfsNAVs4tdAnjExMo
	j0ltUtb5ljiwmFV2+XRliThNOC7hNMmC3SUeHg3L4w6CewB6jhqHsJcRG6mwFzGU
	6y5rPmaXGzw99D28IWEoxLYFXwQhxTeAf881z1qBdnnLAuamlAHIf4mh6G3Nm1vT
	uUawZQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0m02m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:38:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8299499d587so898719b3a.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 03:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774348739; x=1774953539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Pmh8hicjiF4UT4+vCZbMqrok0SPFJ1WtADq/O2gJng=;
        b=X+j5YDmIvKQrxxOu8zwNG8BZOpMa7GhKbI02n+mpMFScNCjuP/Y2NQb/zPPblkpQli
         yE2RC2BWX0+OCwKtCHy2gQXpO0aicKHP+UyqI2G1LwLK5ET2JRpLS1p+XBtVqdQsBIMo
         DR4VC3Hssds8b4rqJEEIOoGhht3ZL8lGnCMX6BHCDLSAeTTkDOFUcfclGL5SxKuvA9tH
         17p2tvhzU6hEM57hje+26OuUAUyGLwYvJVyVeBRhR2u9GHFnHp8HgnWlEyod13TRLa7G
         pUj7X5ZcKNLqh4DgmiLMboPCKceCYguiNigkZLJwUywjASNNtABbM1es+p//4PE6X8xQ
         SWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774348739; x=1774953539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Pmh8hicjiF4UT4+vCZbMqrok0SPFJ1WtADq/O2gJng=;
        b=PoMC6KMmWvwYS0I5GyIXZ3dF9DLv8LKmtiqRqh7cq9yY6+TH8xviPYzk84sO/QpQJl
         QejaR+/VpFNp8iF805Yt/w6oImHU+Za9KZQyoLlMTJwivgiVRiDa4B/X1daLpfNfK3kH
         sketnAf/Tgbwt2GaaqmnNHDXPvHrLiHWzjCpKkph4JCTx0yLWvEOZAOzarC+W7g/D/7P
         UFfHykth1TPbqSx+zlRwqUULHzi4WYiO5vbJSpMfoiiJAVjaMStXSORnczDYYCG8Kqud
         L/RKOfKC758udbu4v1cBmoLdowGx91qew3i3f/fb9vBIyYOz4AOBvrkFFnNPT/dVLiAs
         TM+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+sErQFkSHJHiPr0fYYRNepRELSo8oeLS4X3pP50TJelwgQoIxOijU/gg3nvuO/YSrna5avNxy1NIH@vger.kernel.org
X-Gm-Message-State: AOJu0YyxIHwj6ohYVzAjot0kquoCEkmnDuPgu8zjQ5+iYcYlz3Pvq3iA
	aqxhb2WUA761Ccafy4gD8JH8SEP415jIh54IgAcyu/zsqStZGvTv9KwDYgH7OsTofx/SqpX1uxF
	ukMt43gLvd00/rxKVO6TAoRdaUWX402wSYJASAkVdlchFFGOZVK1XlczC3mPt26Fg
X-Gm-Gg: ATEYQzwKKvAkxKZTgLudVGLQU1G+75hwhEA9xMzliDO8IvHf9eb3r5hA7IaUDY/FSu2
	OQwiiUts9GH8XRTru+N3pACRPrx26HzdV+7jOicMHsdRFE9z+cOsHjKgAFWpSQq7PxjFjHwbvlN
	utHxWElpTFOLLmeII1VyzxIuNSYk8CHPcX2VV6+C+zbDtgPmYuk5cTlms9y5oT0Ym79Wn9zol06
	M2zw9zO4hNUOAzdmXAmflzFzyc7gq5BfSm0UsLX6ainMOKh9XrhhyYE30wrUZ6337/e64o441SI
	uE0Zd8nZXtJd5ROQ087vyVUlkdt0ARbahQuSrxdldtMlkUnV5Qodm/eyGLxjiYJigZWeGl/9dfh
	akZeP4x9lidOTRFfRjgs0h6hJJHHCIAc2L6cX0/RCMKeGg2F2h2UE
X-Received: by 2002:a05:6a00:1789:b0:81d:dd3a:b8f5 with SMTP id d2e1a72fcca58-82a8c35dcc8mr13802706b3a.38.1774348738951;
        Tue, 24 Mar 2026 03:38:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:1789:b0:81d:dd3a:b8f5 with SMTP id d2e1a72fcca58-82a8c35dcc8mr13802670b3a.38.1774348738405;
        Tue, 24 Mar 2026 03:38:58 -0700 (PDT)
Received: from [10.218.44.178] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040da3easm11603694b3a.41.2026.03.24.03.38.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:38:57 -0700 (PDT)
Message-ID: <e949be15-5d9e-4f17-a970-f8906dcc5744@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 16:08:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/11] arm64: dts: qcom: sm8450: Add power-domain and
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
 <20260323-qcom_ice_power_and_clk_vote-v4-8-e36044bbdfe9@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-8-e36044bbdfe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c269c3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RcdfdvLsBkETvr5PKcUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NCBTYWx0ZWRfX2J4Blx+kSgYE
 mT9GpQhfm61XMmXpIRWk1Au4MpaDQuLo13aQ6Zv90oBA9MpiufiMA/xKio5eLo3adFHrwuRy98R
 L6wDPgDiokTQEgNktDSWlRU8e/MX1Gzq0V16UI+WnOGy8U9BU7VbsAhRuei+VcaXXB+nwkmcJhY
 NaIaiuk6toauojeVl79E650D1/9nnpSLpNdn6gVQ+WfePrcBZLfYQYa+EWPzufKoT8vkM6ISFme
 mEFJD3J0F/V9ADA78/15RXhprOLir3Zsfpt31NRfS611e5ZVTmrakoEPJ7AblADtKbqyxFPr7LE
 6lSNKC9P/TFT/195DVn3RRw+obDeTi9HGbkrA/4gVGN8C3Kr03Dqovpj047WJ4UmtPMajOQxBi2
 YRo90FOgK3aFtILNgoM/pOGVVGGTA7HTrynRSyCYnzoPRJp7yOIh3RAiDdnbp/yBSUauxoJhkD9
 kDXgk2nzBXBZ8fjaAuQ==
X-Proofpoint-GUID: Q6JINboIyG9uf0uDsVYATdYNk_5wvXZb
X-Proofpoint-ORIG-GUID: Q6JINboIyG9uf0uDsVYATdYNk_5wvXZb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240084



On 3/23/2026 2:48 PM, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the UFS_PHY_GDSC power domain is enabled. Specify both the
> UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for sm8450.
> 
> Fixes: 86b0aef435851 ("arm64: dts: qcom: sm8450: Use standalone ICE node for UFS")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep

