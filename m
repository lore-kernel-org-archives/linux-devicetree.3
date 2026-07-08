Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1F83F12F3
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523763; cv=none; b=nL/A0eBU5h7BE1/bZWCcGI0U3J027Zsgv5vrllUEDHTZKvYFvYa68+BKFdPLo6FO8yV/oFv+yxmtv4bw2gcPX+MYrloYMSCHw1F73vU7S4vIB5KsXI+VeK2tcWq1AM2L88UlTikGF6sXaqfzXIdyxt3iImIdjDcdscvYpxJVTTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523763; c=relaxed/simple;
	bh=7HZ/p2qWs0/610chpsEBI7thFDTZBQAfrf5UF3//urI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdFBBYWg2iH6a4Qng7JohOpWZ5SGsLcEEOBJr2XVqLaUTZVqAONATvE/FWZenj2Jx+gDNr6x0dF1E9bWfslx5wWctXESmB+KTi8MUFJ6qnDgYpVgYo5QqIixkHDA9dGLPxtnKIZV6Y6VF0YCainAf6DG7OwcXzPxOHoR/heRDcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b1QuN8NG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kJweCrYb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b1QuN8NG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kJweCrYb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3hLc2727692
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 15:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FPNK0vo7rUMajncS03PJq6/nSh8BMzbk+8fJOLI97tg=; b=b1QuN8NGglJsWzFI
	/5/OWMr0iy45ykbTib6rymqZnggykGKI7MPCQvcCYyMuo6CU7W2dM7tvgAIUyjBV
	6c5mtGi9uby5CqhI49cGSA4KOTAsFVN/WNeepR8mDPxX5Mr5IJPqZ4UYCMHw4eO5
	mCCFRELf1Zuz75R2+02jvLYLCEHJtu+3Tj45B9ED1TpZ7oWFTQ7XkD7Xf7B1UUY7
	of9RAUSqWZxfOhN+x5Lf2Iry7rsZqeARGcYhOwywGz4uA+G0ciLdJ5oiyQzTkXES
	+pTguuAU+a5IgiT+Gr5hrsY8vl444DDJQ1Ng4v75jC+yf19YzzgNe5Wf+6NLvPmr
	taRn3A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9c6ab963-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 15:16:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so1182394a91.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 08:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783523760; x=1784128560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FPNK0vo7rUMajncS03PJq6/nSh8BMzbk+8fJOLI97tg=;
        b=kJweCrYbaNT/4vfy90dbbBVDmrcA7rLH3rL737zCOFqlo/XEzmCpmZINie5SXP+EWH
         OHGiNbHJC6WNXTcTDU4/EQ3sjONhxLHdO29sKcsj1fKQY3zBu2pqIin6pR3w2XPA1wpp
         vXsfcqJPG8vixZvak81aiMVAeYpqYtg0wbHc+HriVQ5gRGqDBVmLTFwWhYiSIXERzMHs
         AoxEMexI09AEXhkq5/NbvjTslqPyHH00B0w62wburP/tUgOysrWle5ButPjkcpvmyzJu
         kDo4NDwMzm1IbLMAnU23CfxSfLMFmaYFTtd+Q01FhV0FW6afHBq9wgJ49ceuCs9jUfmt
         3Aiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783523760; x=1784128560;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FPNK0vo7rUMajncS03PJq6/nSh8BMzbk+8fJOLI97tg=;
        b=kBF2gA7cUkfVV2vflupK2YdDTOG8qDEp3G+7S4wZCuhhyXXcLsAPu7v+06ChXveVLX
         TBq7Hc+XuPT3kCwJBfY+Dw2gG9WznxVRQ+QzwHqIuSKmvFWn35G3h7mpDRsIgkd2erP2
         OPEH33H9PvI1+TnFTNM++YqzplTEEcIQjOVkOwNvTF4fbVkN+oSUDwen6UEai+Dm63wG
         ABuMBvfhM5mK/7mBW/rlkogUT+ggyvkcpCeLgc1wSRn2lvGRTml1qaFfni+6fyn85HtW
         hEpiCdWFhs8tQQvsPYNweRRRyp9KsTe4vIU76rdBeEHEhl/S3ahxysHA3zBCUiLEp7p2
         Di0A==
X-Forwarded-Encrypted: i=1; AHgh+RqIW3o0uOsoPMoBiM8teRaC4RzxJcSQGXbAqXx6QdSQQ6EN/e2H0n0YqHQDM7oaTRbOhRezLlIlLDBQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyEnHenZlE68Dmj0/znm4b/Y+2EnPngCPJxWzU86k9mqLtMadX6
	7NzzlUZ6londONfxmGjkvcVd91PMlLzfay5AdkBsqX9bmTL6hPhoeLG+VZi9KFb4Gm8KAKwyB3n
	0A5ybCod+hBoCHlIjPF3WcrQ5/XBt7p/Yk2O1hEgo4e1af/GoFs1zRDV0FirXCj5A
X-Gm-Gg: AfdE7cksO9LbzV4iEw5EAWgFTjq9AGpNeR08PJQ/QY1KLCKZXCRlzykEueWh8yKnzOh
	K/7jjXy0V9qJQHMApHXXLYkLNdK34NSOr3Eov2vNb8x4vkpCpAo8t429fHdsIU0TO90lEhhl2mx
	VY1NFIG9D8pNKIpx2JMr2fS1k/2r8FDLob/6BRvHubyo+5vIn83C384oSTVxRkT/A3KzsPn9g1l
	8UfHen65CNlT5I+DrtChp+qtYyw15lZ+pe1Kk/iXdsgopomaxYkpteBzzyprQ4fwQgJZ7M5roco
	fx7xz1RH4nV6J6Yq68tGfDni71Mj/xQcWx3RxCRDk08meyQPljDGtQ+YGyLBLwal0Ykg93bro2U
	ipO93YoKEmaCDq6wVZhSYb/MBL3CyX6ZPAxCkvp1v
X-Received: by 2002:a17:90a:ec88:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-387d7270f6cmr8475168a91.6.1783523759644;
        Wed, 08 Jul 2026 08:15:59 -0700 (PDT)
X-Received: by 2002:a17:90a:ec88:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-387d7270f6cmr8475100a91.6.1783523759171;
        Wed, 08 Jul 2026 08:15:59 -0700 (PDT)
Received: from [10.204.66.13] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm18273012eec.18.2026.07.08.08.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 08:15:58 -0700 (PDT)
Message-ID: <cbc1b1eb-0064-4999-b829-2bec451c682a@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 20:45:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/6] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-2-f8588da41f16@linaro.org>
Content-Language: en-US
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-2-f8588da41f16@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfXy4hf9y9+GuZH
 01TvA+8zux2AQxMbZxLjq8v5Gs2RtJj90LNzCSQhYYV+8mRUAQdN0lg/YAU1w10e9EzNGmmsGCo
 9WqzcpA7SynDuVxKPB1TE+mELs1uQWBpGqpM1+GxwgiOg8RbMmFYrlbmUIxVpCp1sf6o7tNFl4m
 0FQlMF/5IeuN3vm6/bl/PDobJ2ctKy4+2z80MnAYuPqc/SpW5lnnctXd1xmLsR8s4O3PUsk6sLW
 2K9b3ZsWfFwiDV5jeIThBeci/4kKYkLaz6hS09aZQVGuQqB7UsB66RWrNQwe+loBtqUteCDvQhx
 njFhiYGRw7rFTW4EzfAji0QWiiqlEuxqrK+uIlKta6ZwM/yNpZYCzxxnKocMbJe1Y9dpJeVjOP1
 pflVjWR7zjDi2LyhehoOgxKvsVKLYfqkmOiX1VN5AbRbdO8obF4JjtONPetFHOU4UNr6J0B4AOc
 SShGhbHXGIvbxaeT4Eg==
X-Proofpoint-ORIG-GUID: KZf4AA1hWWjDGtr__p2WUdN5NNWUW2sa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfX0cYJjWu4gH77
 dPTMwqC8PuP/IiVvY2PkKSu+qwafje4DzXi4xzqTbGV+713jjN6GbPCRxdh8JYzwl5dGnuID9zG
 xbsrmMXJGVBsm7xn/fc8hi0C33FKopo=
X-Authority-Analysis: v=2.4 cv=UehhjqSN c=1 sm=1 tr=0 ts=6a4e69b0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=hdgLcCZjOrcdczLgVvYA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: KZf4AA1hWWjDGtr__p2WUdN5NNWUW2sa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080150


On 7/8/2026 5:36 AM, Bryan O'Donoghue wrote:
>              iommus = <&apps_smmu 0x800 0x60>,
> +                     <&apps_smmu 0x820 0x60>,
> +                     <&apps_smmu 0x840 0x60>,
>                       <&apps_smmu 0x860 0x60>,

I think only "iommus = <&apps_smmu 0x800 0x60>" should be enough as mask which 0x60 is implicitly covering sids like 0x820, 0x840 and 0x860.

Regards,
Vikram 

