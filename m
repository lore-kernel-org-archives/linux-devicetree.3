Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483BD39EF2C
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774268872; cv=none; b=c00I1xk5pKQ2+TqLo+PuNQj/39LbeklNsSyRQk4sB1azUxSYG7iXx5f7gfPyTOxTulPurOhIbb4Xf/wF1OHee1oOLU0u2nfuY2WXJSavB7kZSeef12uWQPvuXXr0yCiC8tTGS9clu8yTcQuEat2/1fkKidW8WdsOCQkMC9/1Nxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774268872; c=relaxed/simple;
	bh=WugqA9yyDrviBAh0oWni+13P4SXt1aezRSrY3nIa230=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YOsA8UG8oYl0jNckYY5dmDasSl1dC9AvqX3rDJxn0i8E32wJo0irddmEhNTz0N/TCBbsRBJctBPTZLsAQHrC95dD5JRRlIl+UHAnQu6SaGeNKohGaqOLhv6TBUdv5tRpxZG4e8eKAiCXEEtyL+vTOQF+4Ew2WlaOZf26vSrcYFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oqyXUA+e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D3zaIauB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oqyXUA+e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D3zaIauB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N9cdRP3737909
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n5X6SCCrZlhH0x7gW7E0uH0Hbsvi0PHB4OLS3xzpkYs=; b=oqyXUA+eQddQwFEZ
	F06Q3nB093RH9ixHXHtfqBcpobMOMhWInd0ug2SJgr2WdTffxYbLKocnlvPt+qqL
	mNu2Mm4Fkzk22fqpgQxZklSdL1KIJ5yk99mRutwwC0zHxilhEMM7jO+XQ6PRIO/W
	4zZWydokO2GgcM2AjTGfI9hOVlYzxIk/NPWO2RQGA4jUVzaKut61KI6MQmrJ4pdi
	pAC2bk9rTQpCczMvoFAYXnqEUljesYw0jROycVtyX8kV4cihuSs0ts0IdJFylRTz
	eVJaqDMkapL6y9mDf13idd+rK127kAPZ47i9IIFnjnQEqjbQr0heyMxYVKbc62sp
	/yRX1w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghd6vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:27:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b317c4041so27437561cf.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 05:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774268869; x=1774873669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n5X6SCCrZlhH0x7gW7E0uH0Hbsvi0PHB4OLS3xzpkYs=;
        b=D3zaIauBijrlLssGXrJwTM6S1HsAGoGkKWoyIwGMJCmmlRzSow8WXPF/60ZYwKHULx
         U0X3sFM8Fqcs9Jplnn8q9gv6hoKfCHHXjciUvY8Je33SbOsKs6U1FtmQ2CeP8N/SEq45
         VVZg9xvEIVAHeFHbix+AWzQGhewSNFKORuF1S1JR2UTIoFHpsTt1GlMQkFPOKJGYVXLD
         fXUX3RkuRLdjAul2pnH2q8qvdGoF6HfyloWyRai7X8nPgxDBN2ZW6KEGyGRr9Xg4z0uC
         bcpFEIpaFSq1+yLDVHLaBeHIgwoXkURDLPKRoh9wBb5TWZq98RU2cqNQg7c8mrEcy5hy
         92Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774268869; x=1774873669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5X6SCCrZlhH0x7gW7E0uH0Hbsvi0PHB4OLS3xzpkYs=;
        b=j2WBlv/QvjUTNlIC2tfykBAVTYpQs8PuIdomzq3gW8KQgIIzkYDcdaDTSoRbK2Vh8J
         5Z8mqZFIMPIejPuvXCDVJQvIi96al5d8bethKIsxiBnbOnrKeiU2HUMcbqCp4Xmysh6m
         zifL0OQKEwp+7BjGGPwt//bFxlMlO5ir8lF6d7C+4SNkhyzv3fAh7r58bCbAzfAwlB5u
         BzLtD568/sWOvGP1jFwtmoCxQ02IcKwduioscpy/lknlXRbbCys17ip4qZIPQA+DRBvg
         41kldVwFiLa2JOimHgrn2Cnl4sO/v6Sjouol+PnnO/MVrpCsmDtHvyaT954EGZ0lWCWV
         4Q1g==
X-Forwarded-Encrypted: i=1; AJvYcCUhZYDd+hdtLGXDpWPA2mKMCYVB+HQNtl+4/pKDOBXsyJrE3L8o6PlCrf+6/ycQiQmdj5C/JsE+oITO@vger.kernel.org
X-Gm-Message-State: AOJu0YwYMiwVdqcXGMm3JCoTnKrzCTMq7U31qzfanCRoK6kqJrxF9q1l
	3fNwGvj5glVbPDcT2pFrxYcLgrYYKKEDZFe9JqY7VQYeYp79mTBcVmrb7uTGR23ePDTKFVE7Ur6
	vekqpk9OgiNCj3Q/dMTxsEDdCqyaQceZtER4RQsnpXJDcPTH4nGSnGUZTFOrVoLBq
X-Gm-Gg: ATEYQzxz62ZhiXZwMUtEFnL6QkBDIH1US8boTqJ+/00/eCfeLPZ1qfwYoSpiHGuq8M9
	NqHc4fUfjVYU/0XdZe5P0emaNt4/lc0415O5Es7AhwX16FnADkQqE9BT7LiDH4FNkD6rD4z7CXg
	Vi2Yn8n4PJRX7D9UGAHemBaA2UyVzS458Fg4vxBxmK4cIddkdhEUIy651Djb9WpKk6nJG4DtYd9
	SwRq+RUuBot0a6jM+VDdJTkX4/1ToovL6VTRDNy1CHWsAKwFO7K+6vAo+Zq6IPYrhv0vnyuz/YL
	+kdHXGpYUBWVMXNMcctwEqHFXjCf9f6rMxV1PZe3JQlN4mWsp/pqpmi0lctEaFD4A2CS+zssppU
	RYnoZOfhZTuDYGiVCN0uTKrns67x4eKqFJnSuWzr6Lh0G2/Rmh8iPFTPACApOT4qrhCLUooEqSP
	2QjSo=
X-Received: by 2002:a05:622a:1992:b0:509:d76:fe73 with SMTP id d75a77b69052e-50b373d748amr144814981cf.3.1774268867894;
        Mon, 23 Mar 2026 05:27:47 -0700 (PDT)
X-Received: by 2002:a05:622a:1992:b0:509:d76:fe73 with SMTP id d75a77b69052e-50b373d748amr144814541cf.3.1774268867450;
        Mon, 23 Mar 2026 05:27:47 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983398c16esm487370966b.61.2026.03.23.05.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:27:46 -0700 (PDT)
Message-ID: <632d2e2d-82c1-4e4f-b477-96c5e75767bd@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:27:41 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] soc: qcom: ice: Allow explicit votes on 'iface'
 clock for ICE
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
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-2-e36044bbdfe9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-2-e36044bbdfe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c131c6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=SBCaeXWvHhY2KLIX7PwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: gRg5kkuYrKyZlwjsRY2BDI16wydK0NhM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5NiBTYWx0ZWRfX6xdiXEqUtfhP
 MJX3wIiRoH2kOLos3ZT6dmbwIUtDkg785U/6igJGv6JxtH4D4YewXMl+kQzbY4tWuka6kedSyMu
 vMdhTXu2kNGNffv8FA+pxE1nzxf019ThFPM0P96bbSYAhyOqulhZ0RQq0EFsyinMqncii0PxWEN
 AtSrLOSFYkLNaWPboxwdJD2RWetA0PeDyqv5copVfuac891ySC7KGTjQsZr/xtc9i6xKQvNVlRl
 ehb45JirS/vkMJCpasSsRUtFzV3cDWFxkJwg6H7gcmY47ch9nyFyrdaaL6gybL/CpDdIhk/W6Da
 mN+NXKcUGR9+fjR+raV8fOYAGrscbAnbYH1PhjVpDmDO7eCQrQfOnBWje0UiuuxlBim8NnpfpmJ
 8URKzIUYs4J5+1PU7VvSswwhc6xOfctThnj/8u010FTF/CfdSLWGi/kmmwK5Gyy4t+Ca3Qvh+zo
 OCHx+Ry224bmJ6+I95w==
X-Proofpoint-GUID: gRg5kkuYrKyZlwjsRY2BDI16wydK0NhM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230096

On 3/23/26 10:17 AM, Harshal Dev wrote:
> Since Qualcomm inline-crypto engine (ICE) is now a dedicated driver
> de-coupled from the QCOM UFS driver, it explicitly votes for its required
> clocks during probe. For scenarios where the 'clk_ignore_unused' flag is
> not passed on the kernel command line, to avoid potential unclocked ICE
> hardware register access during probe the ICE driver should additionally
> vote on the 'iface' clock.
> Also update the suspend and resume callbacks to handle un-voting and voting
> on the 'iface' clock.
> 
> Fixes: 2afbf43a4aec6 ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---

[...]


> +	if (!engine->core_clk)
> +		engine->core_clk = devm_clk_get_optional_enabled(dev, "core");

This change is a little sneaky given the commit message but I don't mind

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
