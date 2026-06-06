Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD1034A794
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 12:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780749964; cv=none; b=VDpH4LwSaF/bSwsOqpBI5jOCTubScP3NSFIhMH6TXZfDG5VVyOvRNbLmHhOXZ1TV6rtZNgscNrYmxgGLJObPOaPMCsKsYz+su6mks1HD6L9tOPUcRkhjSGM/wsUnnja2hTl10lAf9Dk5tUXK6dJJt+GJ+GPTaOZbcE68Fc0Mppo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780749964; c=relaxed/simple;
	bh=pc8EHI9BMBuc7BjdgJHx1xQ9FLAmDHcccW4NFcZ24vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcHkQB7nTv4J4kR7wamlMI3ufC8Sk+g3HPDx2WRpnZfsB9GOgn/TEdQpMdeil5dgRoF3BeEAw3dJ9Gw6cR7tmFPUIEboPTzm8baDcnJ6JQHYxsBscG85PMwf86qScm0w8STWBWEJaOCWTDAEJ+pTMnRfnTLTxa2rS3sfJ4HHdbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O39W/cMb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bc9FdYUg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O39W/cMb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bc9FdYUg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BEaRK1232401
	for <devicetree@vger.kernel.org>; Sat, 6 Jun 2026 12:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6sg4LNPX/0iFwJxDV4MhwcZf
	2oXBafEdAV38XLdgyTg=; b=O39W/cMbgPpbzRhatwGVYL/obWJp5emy3OG/yGNP
	7ePx2Oa7h9BdYayCcE9AFIqXW4C9adJ4Ej52LSLGEJDHZTGtfnCeKFnmTO+9U3VK
	8hJHWkkLoWsRcrATRKgrLYuW+j/+TfCDS2TfBwRvQeMbvbxm5E6LXdIa8PLCEjt6
	zjBW8lUyyQiO1fc1smz51jo89K7nG9vsLr0QQuAEKaii+vTu0+DDAohFjGZrI6fg
	qJ7KRbznt3Zf+T/+B0NJjU0Ct6l+QcefWoB+3DVnDlimL+O9y3S+B8gs2nqAv9XU
	ve+JCSPpUhUxZivj1wXZF7s5pjAbOr4uL3AzMAWp1qEALA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgrujh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 12:46:02 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963aef8141bso1085446241.0
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 05:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780749961; x=1781354761; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6sg4LNPX/0iFwJxDV4MhwcZf2oXBafEdAV38XLdgyTg=;
        b=Bc9FdYUg+3d7BxZyz5npQ2qA7G1A9sRsSp+riyIHwFHLI6uqV6aanu6uI0Katekp5Z
         bJOSQkP4kUJ7SlT3qTVz6HpbUBwWjSGYL5ob3X1N6A7MoebySzGjgwXxUWkK+eLZYV11
         IDVr8m4EyWO64Wl9NoxvQiLC9Tw3NiufwZPiQSZmV5dsQXX2yBqMdWu3Fq8oOqaiw6Le
         ILPZdxDi3a6nz/VvA7qlf234fPxJJxPOkxgSr4oTxru6NMB3BSsuKRait60cmYhF0EB7
         RUQP+LLemFlbsBMdC9ZSlLJpiGf6bTztL+COYe+DCfXN6ehaU6FOwMfzwskHecFPfhEE
         PBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780749961; x=1781354761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sg4LNPX/0iFwJxDV4MhwcZf2oXBafEdAV38XLdgyTg=;
        b=Cy9ZxrTZ9Rau7cbtoylyMpzY+3xj7Asq/43zOOll784tuAkWZjiyDGipsqiSLbyERm
         jA/42UC8GXQJxUDw/yzz5azZwlN6+buQadiuwjBJSJTvXZ5I0cEmv/mpxDomTT/7btV1
         BnNNhsQFgShJUZs9cyA0r39qInEh7ux4zPHIKfUiO/x0ZgtjPpG8Y7vwF47T4jySw8Ys
         ZwqD8KfOnz7LrCk2XclmqXqNwJKXeMonkwvw0+HhYMN61hZzJP7HlwrZkT/B+k2XnCfa
         x1wnH+IsWFakuHuDcPuB5xgJtWsYpZPdyeKxwOlq9uoeaKVTX+Bf85Jt/r2Ee82S3KFN
         pc4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9wnufPg4FBkr+paOha+gTZeEg1CSlx5q2bsPjPnAGhUhOS7bsay4JXc+GtUhzMfYVsW0P8WOh8znT3@vger.kernel.org
X-Gm-Message-State: AOJu0YxcuiLfs3UtqskSWt1cvlXz1tLLk6IZh0ZLkSD9eJJXX1LYYupI
	KVriqxNr2hM8J8L1NM5o80WXnZg0/p+rSnzglXxQDauBfEQZ8cJOIIz5L6p4M0vuMVSMW4NIS4X
	CZYM6f0lb633Y9JMLk0G/V7/50ZB1Vw6s3zSCA+sVDjbeLTcPHaVf48+Jg7W4NjAE
X-Gm-Gg: Acq92OFDHZT79F8kt6mJtPLFg/kZcFDnWt7SPhtmdQ+UHrjsJEFMArNigQ8jkRU0uGp
	0ybKh5fhEXdy+mf4YOlbnzbK2jE8+Ho7Z6mBp47g9tHlTxZ+zqqEdNa5UsLIw6/zNHdDAyEESQs
	CnLneF8RDSUcZderujKBZtIHrnSYly8tEWiiryxfKfsK6n2j/gKNfk1utG3gHHRGp3UnW612Xpe
	loiHF3M5iF060fGldOf+Mk5dzkxTnsKZF2FmNREJ+Ob2AQ9re1uQkrmebUDyquxDmaJ2u5wrOc1
	qONow/Z34uabMJXi/BV+At85lHC2HvsWanc4TqTr0ccjfLlMMZAS1K15+Iin28xAPe9xst/KxA8
	UydD+4/SkLCMXf9FeF+kbFk75I1Mfu/DKrznSkj3YQj8CMGQxNx8/9D3Tielmw39aN/7x9/UJYu
	GA5AkkiAgNs7VL+h/vonw7BaEi26WzFJWHDzLk/Kyxob3HMw==
X-Received: by 2002:a05:6102:c08:b0:62f:39a9:ae67 with SMTP id ada2fe7eead31-6fefa8ecab5mr3893493137.17.1780749961341;
        Sat, 06 Jun 2026 05:46:01 -0700 (PDT)
X-Received: by 2002:a05:6102:c08:b0:62f:39a9:ae67 with SMTP id ada2fe7eead31-6fefa8ecab5mr3893477137.17.1780749960954;
        Sat, 06 Jun 2026 05:46:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be2absm30620321fa.23.2026.06.06.05.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:45:59 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:45:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: Re: [PATCH v3 06/10] arm64: dts: qcom: shikra: Add SMP2P nodes
Message-ID: <xzh75zc7mpbqkqwqze3btcrwt4355tnty6k3l6k763f2jx3t6f@ql5ml6hdxkzf>
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
 <20260601-shikra-dt-m1-v3-6-0fe3f8d9ec48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-shikra-dt-m1-v3-6-0fe3f8d9ec48@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a24168a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=YUvwHg7a0UAiIoF5iVoA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: U4f4i6w1celRRIv2eX74nU6VPdoH-lR5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEyNyBTYWx0ZWRfX+V6q3K/xuZaV
 CAEws6Jq2zBNbI2qju7u4T6aPhaycZ4E2ieo7SNLPOX5QMssPX6hNZc7U5SYjyVbWlx1meh648Z
 Z7EhpRPTBI/D3SA2cBuOtAfd8Y1KN3rK2B+AMWWEf7dZPLBM4lNLYSxuliJOUq9dJDRVsG2GNw6
 t4AXRVH8XTZMeooqmtSEsVOn71JOKEQSY3YIOfGixmL0SW8f5WWZ/OpxK6iek+aSGVbGufhKz1d
 UVspgKnS2KW4GJs6uV590JwqI31Dshni5z7XEoJO8EP51Lx81QzZozVKeveGYpLxKAs6OlGprmY
 6BckZ8yF6zahOrJL7D4BE5evPY7Rzzj38wy86PhxyfAe3XM4Lm9h+hLGf+oCBFX/60r8J+xK1xf
 LqCybAtV2YRKMZeZQheW2yUsvBye9UcimPQsjZz7C1uzIv0dNHl8Eg6OvK3+MgtybGeFLxXaVaa
 6k9YLmRPOgeFkZuGk1A==
X-Proofpoint-ORIG-GUID: U4f4i6w1celRRIv2eX74nU6VPdoH-lR5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060127

On Mon, Jun 01, 2026 at 06:25:08PM +0530, Komal Bajaj wrote:
> From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> 
> Add SMP2P nodes for the cdsp, modem and lmcu subsystems to enable
> inter-processor signalling for remoteproc state management.
> 
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 69 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
