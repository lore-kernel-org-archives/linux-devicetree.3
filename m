Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B983368BE
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 19:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775331809; cv=none; b=Zj/MXmQqmPTQe7mCD5PgM6PFWUMpoQCDetCOudWNiPxOVibXjDyB5f7eXDHbfzuhN8CLoMw87yr3dxXneJgskMzEAQbQA2zlxB8uxq9HIEzf1uR8mGrrRdRtkDFERWJWqB2e9jcgxEfPZVoU7A8SL39fdHYQRVA/QXqzi1Sm+34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775331809; c=relaxed/simple;
	bh=gskJ8saBgNIWE/qvWa08ln2YOItC7Vi8/Bs2LPRmxbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXgzErkSyZnMSMz4D6mTVKFhakf/Wx3xacKYTEdGt/qBJ7fRIVr3Fzte5Wrn0R6A/o64KOytiBGuuEajrdGRWp6fdA0x6kKAMM6wN+zTRc2y7qEnzlDjqvAq8BIlhJykyeha0uqDGMiFJ32JTr1vv0fU4b/kN7dPcIs7X/+McEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b+V3T6Tu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GswY60rY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b+V3T6Tu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GswY60rY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6340gxDc1345077
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 19:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KTvRBnoQezY+6pRorEeRgttd
	IFDhZPsNJpAbY+tkaqg=; b=b+V3T6TuJdnyChuGEgOBHiWw2zgJN4eil2Zo0MGs
	4Lm9LvPZLxKBkcqVGyVvIh+fgctq4xm2UiBZ6gwyiCyBR+yFTgTjL6EllW4E689O
	has0if9IKSjUIW4gg7ZZqiqsqS5UEYJCqP8VFcbbCuuGvi8+pqjsbHy3BAnsI33Y
	9LtgwQyzuoI5x/INqByQn3LMKbQKoB4QirGbqIWQoJI7BihG1k4+k0I75QlXHEMj
	y5ajEpWIhALj9eZxsQMhBr07/XpEPWAPaVq5OWmlu/AP2PA/Q5mCuntBURQk3JpR
	Lbl97Og8r6OyZWSH+phxYPdHlzm9zszgJ5A3RCNDnu6zYA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4darbfhkky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 19:43:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4987c698so73283581cf.0
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 12:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775331807; x=1775936607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KTvRBnoQezY+6pRorEeRgttdIFDhZPsNJpAbY+tkaqg=;
        b=GswY60rYicDNWMymZKYMawcV8OHiOelLAkbtNb2M0CfUh1vjF/+OETcymZuBDrJhnf
         qHDadtO5nWlEpvU/nGu4/55pneRgIXJmVI+Tu3UGVhXOS4Rw/QJeXumq4xwQS007eiis
         fU8yCC/syoVz9mxeYOFOoSZKN7455fsP0qwiLC+uZTBEOJPz1DExCQTL223IFOr1Y+Nm
         k8cN6WA8rXf3pokAw1s3Sfu355ZY9/g5xyWqAwDZ5aSXLXdL9qDuNxqW9MpEVhOrMLVM
         wASZRnAjSJSwEcZi3XGAV5CVkW0P48mkBXKNaRC5rCMCW3v9jgAF3X7PjUFFfUjft8we
         mYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775331807; x=1775936607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTvRBnoQezY+6pRorEeRgttdIFDhZPsNJpAbY+tkaqg=;
        b=C53LGy3OQuENDR2mbrxjOqUWdVuZUAXR2aTVHbh9J/wn4j0WSCYwWj7vZhs+njVfml
         0Dzxe7zvqZeFIrXiqaV9Q+BoPsQQtK5GXMVMJ9kqGJPFGfAsDQVJd3IATQ5BzGunCXdF
         cxFp6xJsDFHjbbuDzzZtk9zW6aar6gbS6XXgVLoqDXe2V1+ks2XUeQ+yfFLf6TbNnmQf
         D1VszZaWk3EoyuawB22hmQWpcIYXMNbw/TQOB87JUByqD5Mu6+dvzE22kFnK/mhSH+kv
         E3aNA28YtFoOnmQTzC3v8gmT+4CT3vTNwSXKUf+OOzsjxuD/bNfiqIVvIENPPBQULj9Q
         VkUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEOJngyO0RBtkIldoYIYrONstyvGZPOPQDrVNU95ytPmxT1W0+z57B/qzjjqD6EqFUWysM/69Qh/DH@vger.kernel.org
X-Gm-Message-State: AOJu0YxfzTD/ELA/xIFdAu6rt+H0wI//2OBLeo/yoRVv3BhnjFFgMRCa
	UBFJnnArtqnIrQ4UniZxF4EOl52O+0XhNLGC65DVyownk+IgIvwK9coGRaTfyTr/PES89dqoI5U
	66mqVP9w7SCXtx/0pSYE99WSBw9bN4BqSXNY7J942AHhNSBiy+oRhaoTu4Ymub8YE
X-Gm-Gg: AeBDievP++waEXFvEOaodUO1+LbP85iDgr26YlaueHoq0/O/RQ1FWRm4KLdRk+Vlie8
	u438Kcpk0ylBn9hyQl2GJ9GQF1zhuzqSevnEA7wExwrzfFnKD6Ipt1XugsranuQRkKF6ApTRH8K
	JJd7JU+iawDY2r9lSXDMMoKT8b8yWv8r5Wop8MnAmGRAXq/8PzTl/eYbwM0Mklgz3vMHkwpn4BX
	BTK7/wkS3emKE9KDTD95XgwvwcwA5Zds8BYpl527BuwzPfpjOOzuaWSOZvizrjMjPZ6iylZIXAo
	6P1Ke55X9Q1yYmCXFuaSS+dKdZtiNYWNtJoqUjBu4t/DNajidfrE1qOPo6avQ1s6x3RVuZGObJo
	UhC/fIt22V8hRJDOn+MYmqZC+E9bC1kWfHfV5Ic3zZk9eIL7CXKMhoVVpVfHcF23POJ0lTdp5TK
	S6d7bhhVA7kBuZq6P0clsDaFxdjSex3+Mohuk=
X-Received: by 2002:a05:622a:8c17:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50d4fc17778mr135996851cf.23.1775331806919;
        Sat, 04 Apr 2026 12:43:26 -0700 (PDT)
X-Received: by 2002:a05:622a:8c17:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50d4fc17778mr135996571cf.23.1775331806511;
        Sat, 04 Apr 2026 12:43:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9cd20sm2286805e87.28.2026.04.04.12.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:43:25 -0700 (PDT)
Date: Sat, 4 Apr 2026 22:43:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: glymur: Fix cache and SRAM
 simple_bus_reg warnings
Message-ID: <3ozgkie2aycnzfvzs2mncipfivqs73bb5en63lorjan3oofxmb@xk34mt4xjrwc>
References: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
 <20260404-dts-qcom-w-1-fixes-v1-2-b8a9e6806e0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404-dts-qcom-w-1-fixes-v1-2-b8a9e6806e0a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE4NyBTYWx0ZWRfX12APgmgRTNE0
 K8JWVm9FvjaNAeCVFrn27t+dBB07ApRVCS5cxPJuty61mOQ5sLdoyVXT2jEGFm+hUM1KU7dkMex
 cy1T2BsxpUCuR+xz4OlIltduuzzE8E3KqfJxoSRbXhA1O9qYt1BmPgc/1g5CUQycQ1vHr/OJxun
 VWzO+JVXyMeZWj8yoSYrB8lxlkddL97e1iKnbOEIK2SrdGmyWgURoS5lVxyqE0rt3otyS9QQ6Dj
 qFChaEfirYwl5Gk5ot39/AlMQsFCx4tcTtC2aMV/95CDNx5OdmHrDj4LNi9RZpcTkxpYz7yhlvC
 bkOWzDfOaBWeM4OxjLuAhIv5nLoEdXsUNvw4+tNx1xkBj20+M+XVOuCA2acF8RqpBAcSS9eKzNM
 +c5RnG38pkVCnk+4293hFlmExt2ca+H1mpWiYmgu9oj/60Flm/ICkTLIxuK3inbTIziglle+dFj
 l908f9OQDkLG0NwVekw==
X-Proofpoint-ORIG-GUID: fT_TwW0mkQDZ5kcKYI0OS6ySG9nr4b-y
X-Proofpoint-GUID: fT_TwW0mkQDZ5kcKYI0OS6ySG9nr4b-y
X-Authority-Analysis: v=2.4 cv=I6Zohdgg c=1 sm=1 tr=0 ts=69d169df cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=cCzoi3UEGlaZAWgPeLQA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040187

On Sat, Apr 04, 2026 at 11:51:01AM +0200, Krzysztof Kozlowski wrote:
> Correct the unit address of cache controller and SRAM nodes in Qualcomm
> Glymur SoC DTSI to fix W=1 DTC warnings:
> 
>   glymur.dtsi:5876.36-5908.5: Warning (simple_bus_reg): /soc@0/system-cache-controller@20400000: simple-bus unit address format error, expected "21800000"
>   glymur.dtsi:5917.23-5934.5: Warning (simple_bus_reg): /soc@0/sram@81e08000: simple-bus unit address format error, expected "81e08600"
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
