Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E574A3E5583
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349331; cv=none; b=HaIhQJiFQpO2jLKGDKDepOZ6v0Llf0K8qtoG7vqn6KOU+92BeEuEnzNAh5lV7hA6fzb7gItl9StuogslzKokRl3lh7EqC6+Vldue/OyHR0kW9S/+xaOtszbB2Pl/tXydq7jex15X1zYX7feVQX8jY5HQoJXdNrefnz2uzWQB9nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349331; c=relaxed/simple;
	bh=TIDLuJixDy7nE6oj0Vl00rtDfXrGu4PvCUbC5ZIRtOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QI6sA7lVOqM9FSG7AqI/gnsLlCJqBwB1jRoUC5NPw2iuUOh0nVFAdVeHAUnb4PhDM9rNOxKAMTyHmvSB1hW/EpmgiLciQgBqn+4fn6Sgwl163a8SPW6fmYLjz6j7ooCMPpIAMv+SFt721LrNQzCGQYzQnIsh8zU7gOpGpFNtllM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuJiuQMW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rn5iEzUy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FuJiuQMW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rn5iEzUy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9g8Vh3903825
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GLVuENRko+ibijIwPTOuvDEu/CuRGqmpW5X9Mq+oXc4=; b=FuJiuQMWTeRoiC6d
	IPC9SZ16Yi2AWasuZzvvZERkFxUuG1oX25BZw91cqZ5dZVGDzHD+ChD1RnTYG+aU
	7jARArRqzAAoloXhdLNlPdtOUn0BYX3/BjfP1NyWou5AjSUWBTMh4GD4iL23/pvu
	+B9MdjL11IHsVx0q8lY9BFz6Lk8UOp1kL8wwRUvRtipzWh2djXky6sGdBIl9mwi6
	IG1SjKlPbga+eonl6o/93X+hpjC3yErkIYGlNcQ68LhHx2BW4XA5qZ85VGgj9PO+
	oKoBuSpYTLKxMkGr1kHXlaUpXMcONcwJo6JTnGnQv1oUZlwMvBWpz6Q5tm67KB40
	updIQQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0hgkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:48:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358e425c261so6399207a91.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 03:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774349325; x=1774954125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GLVuENRko+ibijIwPTOuvDEu/CuRGqmpW5X9Mq+oXc4=;
        b=Rn5iEzUyjotMu68IKTHdqbYXeEi61TeWPAb5XSctMrZJcmuY0j5Ge/TOT4F3wE0egw
         qcIqz/RNTdp6rLrdszKfRPYDNxDZjl7FJZ8C1lqmAVUJEJSxIawXrQuvGR+f8Ub/VAxN
         vtQ0HbDbPEFzau9BLJ45bsejdWy5YxwPMC4aYGGetH1WqbTqYCVLWU4OSq0Bfx1zwt1E
         /JrcePfoa2jiHGeR2nWWbDfPWO5NOx7xYIP97PYTW4jFo0r0PlH1Req81hrQw9Us+RRf
         iujcp5wnREiksO9lYkUHm4s/T/5xsMjunMZtpgPPme8cmVh5UWQc+/MyRyqOgxgJNPqc
         XDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349325; x=1774954125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GLVuENRko+ibijIwPTOuvDEu/CuRGqmpW5X9Mq+oXc4=;
        b=GM+QM6JLVcbDHZ9FVKv+nFZLTT5aY6iXfE1GjXIOXt3IGNY0Gz3HaZ81t3X25X4+h5
         tfvNlDv35ozWfHhdddl3VmbcnEN0MGL2899naYSd7wsqPIxADcessCXMrm+6JY5MZTfj
         Tmv6gp01cIiIEoVYjUjHAxMMzAn3ky/0tR5ISU1ZgtDecgkbQSHsKPMClrL5zwMSxbRp
         6yeU4U/TXKFa4DtjuuITPNWOV6tRPjYyOnITIrj9BLz3K/Ly+N+zY8zcHL4SlUWfC9Gb
         wScFAcPMrsrnl0vIuIrgw0ot8opKN7KWK+TnhwjTaqIgRrnNqKLPAK71owl9zzhbnn9O
         gC+w==
X-Forwarded-Encrypted: i=1; AJvYcCVBCv1R94aGiaBl0r7o3d4azsNdwFKQPGhYTPq5QjYIhoehl0JnUBFhU+A7CPkvRL7DK8XX3tH2Bn1C@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq6I+uiJI5ozBEIik6jkoYOE/DWd+8ULYQP/jajg/3F7nekYZ5
	zR8l30F73tV6ZD5R0/ntASL4ZafxuTvKzaItQpPAEQMu917PJ4f66m15QgCmKtms8jDIhJCeqPG
	Z1lHqePVTVpbz5hN6+b2B8TAJrStKmpPeD2Y/T4kzowWXaxGeP+fsde2zS+ctT3L9
X-Gm-Gg: ATEYQzzfBdoJDx+qQUp/3KRFTX/faF2vCZSDYI6nZurPOAK4YDcTx34Mxlh2qxj09YS
	64+FHM2gJTX4opNk3C4C2WhBN/L1lFz0nr9ZezvXH3/IRhdq+kd8tlEQn5vJoSM9M/Z4ZXDwvEr
	EnXU8p5PcxyM5Ufir+sJRTcxTiufa3b8X3tEmlIO/7ZWy1QWZyLFKvFoi+7pUjecjHpq0yAJ5Pf
	K2J1KM6srQPJ2S8xAxagyx+8egG2VP6uBzEYCtDFaXwgYT/P2+BYLwPzGCXR0t+ePi1U0iIRclu
	1ZKs4WHLu9DYDLlDaXiU0vcdp3xibBVQUT4laNNznP8URP1wvvOgR4G65pUcmsvvRo7BraCgu3d
	YgTFKq1cxo+QcjZE0arLHfZV7nhNaNGe0uhb1QRLr803u53tbXHlH
X-Received: by 2002:a17:90b:4c4a:b0:35b:929f:7e8f with SMTP id 98e67ed59e1d1-35bd2bfdf2cmr14076719a91.13.1774349325266;
        Tue, 24 Mar 2026 03:48:45 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4a:b0:35b:929f:7e8f with SMTP id 98e67ed59e1d1-35bd2bfdf2cmr14076682a91.13.1774349324733;
        Tue, 24 Mar 2026 03:48:44 -0700 (PDT)
Received: from [10.218.44.178] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516b96sm180029935ad.7.2026.03.24.03.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:48:43 -0700 (PDT)
Message-ID: <1abe2b24-dcb4-40b0-a32e-94cf5cbcc7aa@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 16:18:33 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/11] arm64: dts: qcom: sc7180: Add power-domain and
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
 <20260323-qcom_ice_power_and_clk_vote-v4-6-e36044bbdfe9@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-6-e36044bbdfe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _ikLQOmezXovo1BqbL5YrctMxA0S--aR
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c26c0e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RcdfdvLsBkETvr5PKcUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: _ikLQOmezXovo1BqbL5YrctMxA0S--aR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NiBTYWx0ZWRfX8FjBW9qMohmp
 dWDbQF4oWOM30xqgwXarwoVGcnkN586vl63kq0eCBO133W95KBTPMKKQhgJ4fcJdqmI8zQqbjv3
 R3DY5HlrOu37HJoK4K1H/nQnlTTIMBq//N4T7RjpUKX47bgqprDcYm96tqWbEJeyn9DFQjcttW+
 AN6GhL+p37sbTOvIkC/WrnUdo4E3GikYmiIHh/BxFCtgNFUqd1UPkQDaS+ppXByh43UgS98M2Dj
 IUqTNrIE2u5QbEqrd3lOAFEtf6yVI2xoNY8BqZQj/mwBebqusdeiUoBy78gz9X+UVDNsVxYnDTh
 uG0o80jFIDnfjNoOi14shh0qTlCu/1QWahiBqkZsxcm1BFNss+l9f8psZaBcfvPD53Pp3rMUvsc
 YAhkct0UqpCECf0cQy9su7ZtdQ1kgy7Vp2mM8Z9IQuLlxn2zeRibOOfhkD8qGUbStA5eTMESJz9
 rQz7VJ2WWUg5p/+58yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240086



On 3/23/2026 2:47 PM, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the UFS_PHY_GDSC power domain is enabled. Specify both the
> UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for sc7180.
> 
> Fixes: 858536d9dc946 ("arm64: dts: qcom: sc7180: Add UFS nodes")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep

