Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445897;
	b=y1BauIUzZu0VmHlLSTdxytbCGA/kfHjvRluAzi9tLDoZ/4TZOh4QEFfn/PaJ+ctDKdF9
	 rSdow0p30XyH+aCjzW3ua049SO/wek9GGMe0ohXC0rxsDBYfCFfGWNnwf6bT1vMNUrarJ
	 Icke4eKdHnDad4d9+yDE/JMJngVzeS7JSBMHD+GrG8U5w3oBO1yLbAGtBYPUgWQJYMLN5
	 zjhfcv4tW5HTylyqeFjbUktSuICvHsytgHk2AUEd2nQfZA09otXUpreegpjO02tTCVj0O
	 hrGfB4PZFU2Ss/QlrFyC1sE8OectHiTTwDPvVI/imzsmUdBJdbhRV//r6gVvrFzXcPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445897;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LIfePWjFQJh8/rC+L/ZgDno64sd5DgcUdBm59T9ASBU=;
	b=HytP28UoMAvpOsyhE5Izb/a++sP2HiizhhxRWV4xKEJEwQ5qkmxo7h1J/b0tGtPCSKUq
	 vMgWfsHGXHpfhGqYLNNCtF4W7LHbUHffHC2SR7xC9W4iVjNDrfmiGVkArnTI5IXpDkKBd
	 e/LUHliy86gD4LP/ZBxnqjZ3BdTcdoqCR3ufuz77Ca2ggXMYNeypPceKQKrae9pW4BBDi
	 ZxTsCRteCj5ANhsK+/lSgToaLlFdRWPJZAbIDivr3OkUpr3oid4MroafLc/sPEjkvj6pb
	 dYQsjy2dLX7doIxJu7XLT/UpcDT2dwftZK1c1Fd5jmJNI2Kugn32hkw3m/pFomLkg1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o62xQRKE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jMY9gFz6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84D7606A323
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 21:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D84D7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o62xQRKE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jMY9gFz6
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JLaC1T2892503
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 21:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LIfePWjFQJh8/rC+L/ZgDno6
	4sd5DgcUdBm59T9ASBU=; b=o62xQRKEwBqTayFhXRc18GP26keaM0344wrBcb+6
	ddzEapubovvQW+XWoS0WwJj0Qiwzwp+gq+AjOG+Ulnjg8KHStHPTHdP5mhGqrhpO
	frJMuNazXWvNSDszNJ5ytyaiZ9gxkzdKetzn/HL3RUMu/rY0rkDjWkukRy41mxPQ
	Qj6ESj0r0mHLDgkkdchLLsU64qeVnRO4WuHinxrGrhmH96fPo8v0HhIMbMlrwoic
	A1faZqSnjp5uLhPyfKVuL7DRx+j3Varn8a3ixfxAFiO9z8oVQ6aWXkSr1HmJpUQ7
	FJTKVfKJYgn4RgjwlHwFvviTTGzOT+zKy/IP4wHEfWd3SA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdr4a0rc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 21:38:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so748459485a.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792445895; x=1793050695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LIfePWjFQJh8/rC+L/ZgDno64sd5DgcUdBm59T9ASBU=;
        b=jMY9gFz6oVSBVWCJxAWnJYu2u1iT7MQQsB4R+kvfEg7yhGUc9v3BRRpvafR3MAEAop
         VK13ahZtPJWaKy4D5WrHNJB3RS69rYO8dlGqj0XpUtIGVeIxBAh/zTfCpTWUpHPAnYxC
         qWxPd7zvUsl3UP0rhG58z6Ht3wSaW0Nvl8RywZEzW/cH8SrCWZAxb6mi/kmy/D7v3CKr
         f4czSyDAjxWwDsIaqVt1Y0/457gHa/6VJ3FpiyqfWEplzGB6zddTePshBKyCv5RgccLH
         f4e4OZOF2G3pZmyajmG/AjYzfnAwqn7magnEN7WknayaWE5XjbdlUU7mK1B5Ff2N1kUd
         pFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445895; x=1793050695;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LIfePWjFQJh8/rC+L/ZgDno64sd5DgcUdBm59T9ASBU=;
        b=Ep74ygPKuUiJMmxhq0Lu0KEpsMmcJVTNp6sjqfDmlK+g9A++6d/uSvro8GA76bhxPo
         xjpQEQF5tWWxHmiRuMMSBofcrSOo1BpLdk7Q7CGAzm7ogijHVLAt+1yA7/ADHaVFOZXR
         /TdW0WVRVSDZVHnp1nd3UeWs1QaJKD9vhFP0yQIqGobtZwURAfLwvHp2oXcfgo4WfHoa
         fPXDavXD+Owd92kg8CFgvP2O8vmS3yI2rTDwWnO/usKSH1EHVl7oDPQDtUcjM+Q4eVBM
         4cfnyeYzsWQ9d2H+M+sFR7tuIIEGgxIrRRmtWqt69yE4mdqpwUxrPHUA+pKQsK066Js0
         w4ug==
X-Forwarded-Encrypted: i=1; AKwUvBxCGQ4+v6llH+q1OhyewMe69Q99LzstKZSHx0ojveTgWmI1U4kMQk1Q1a+on1pIgsPVGpcixaBYIFt5@vger.kernel.org
X-Gm-Message-State: AFq9FYIxhAUYrOkj47PjH63GyMyfE8SFTtWjvc5dmCtd+aGLaLqCMZ5B
	lBloYzByiNsXXfkfcNrvpDO1N+xJYflAaW4rtMK2JBehEKarUupc+s+mIgQSK3FnDmTXo8aDBY2
	FzguoZYoMrTTUNQ0Y/+ViFHFoRgGlgAEVTAFYdMxMTl0hPy/l3lwP+zQz/8Xy2Ec8
X-Gm-Gg: AYBFou28HSnzojUyfXs1ZaJgNnS8zn+5LwG0OwbM5yOf23UvKZ2RUJNZZw5V7wSFuKt
	rZjLLNBOIkx7VOm0UZV5CA0bfxVjFQ6qsWtRK3R/wQFCiZmOLYyMgbq6aL8lDQGD/i8E10QG3sz
	3MRVjYf/ZPEmjU5lpk7dXqUryyc97MNaVzUoKuFGiML7e36pu/Y3YmKXJ4jsdUmbkkIIZkm9mQZ
	HCx3NZz1vRjICR/cZny/YyBdoeHciblntIwRkWkNzPUU8aJCrsymJf6u0Ej/UrnEhutomVAv9Ex
	tHIqiM5IFl088opwLjuaANG6RxJ/HrCgi1jjWfLx/NvMOs9/N7GUxzfIZBwrlwgz7Id2Ct/JU9g
	yiaXNKon3Z5+tXRbcBOe/A/FhgwNgOEtFmfMjOiAj3q/ILLhAY9XVCcRCHJaBGk/2pHmcHLW0xy
	GzBGBMh/LBvWp6
X-Received: by 2002:a05:620a:27d5:b0:93e:c6fc:7f50 with SMTP id af79cd13be357-93f29ba04bdmr1478803185a.5.1792445895058;
        Mon, 19 Oct 2026 14:38:15 -0700 (PDT)
X-Received: by 2002:a05:620a:27d5:b0:93e:c6fc:7f50 with SMTP id af79cd13be357-93f29ba04bdmr1478800485a.5.1792445894600;
        Mon, 19 Oct 2026 14:38:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a533900sm2290916e87.50.2026.10.19.14.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:38:12 -0700 (PDT)
Date: Tue, 20 Oct 2026 00:38:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 08/11] arm64: dts: qcom: sdm670-google: enable adsp
Message-ID: <5bs72nbd44ppib66n2amljtayro2ghnpek2xvdbioz5k265nbk@if7gqck2u6fa>
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-9-mailingradian@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003175659.23536-9-mailingradian@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4NiBTYWx0ZWRfX4A/yIy17UElh
 txM6b935U9YkhhyABTQxLDaD/5RDhPdJWKCK4uu0WmwXDDxTX/a63CnYUW6DhLwod3vOumMp9YR
 +47/pXTvObGtxesMCGAleuCTJdgswuc=
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6ad68dc7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=1DDleCVHwAjOA7h17fsA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: -JaTIY90MJHI1tz9AURqq9y-TfEteefB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4NiBTYWx0ZWRfXwN73apg1tuc3
 QpVvXi6H6NosXywZ70oL5rt25jdLjokdSWz/UkUuFApnVSO1Hbsjzfr2Lf2CWjPoh/f6FVb3WUk
 HI3Pp6SAlo5WDkyqAwRkuCYXFYCVruxDg+1QUmmar/HpiLOdgXL1Dhy9kdVZkdKwsHMkYPRTDsK
 ylAELpDjUODsj0y3TMZ0dC7wBmfX+11GB+tNS9EDwQt0WjEcCrWO+W+K5WQY5xafr/SusOj5oZe
 kdJ/lo2a5Fa2wXYIAV4PXNW0CI1f6YGKJJ2iwXmJB+taTsnBGzDu86HW1qnTZgdnWnSdA4TRwRd
 o4SdG2P9chT5N8eIWcxmsSeG+bCiC6tOKm8UAvILi8sjz3ebsq/mbjkTYNJz2ArWLZTpJDS9wzZ
 W0iWs6a+/ia2Kk7EeWlff+nc0fvLrq8i4O9Wwjquy9beFxarAo6ZXtZeiQzjJBkWq5x8gq5w7nH
 v9yrKQWbKb5ingh7UZg==
X-Proofpoint-GUID: -JaTIY90MJHI1tz9AURqq9y-TfEteefB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_06,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190086

On Sat, Oct 03, 2026 at 01:56:56PM -0400, Richard Acayan wrote:
> Enable the ADSP on the Pixel 3a in anticipation of audio support.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
