Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FDC3E023F
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774945656; cv=none; b=ikT12nov2MfXMc1UPkX80wLKroOhj4iKxVR4lRbWfevA4OHp8qLnflfcJ1CGccYYSWmCImwmnfOiClCIBpQQj9KC8xZ5OIBFM12pQfpFH6Vr85fusYmBv00mk8T06h+CEY2B3dY3pYNDOYwb5TIHnVHr6sLbDB7Ke/fdGhTuQDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774945656; c=relaxed/simple;
	bh=kKKriipUH+u55ee/pJmVJsjEekHmyqx3MqIpuZqRg58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MeVYB/LG+pK5f7MFM6uXVj/etFSSWZvX1U8/bBBQTh4Cr/sGdM9hndH4s/utfIhFtkj/9ofrhuS2BSgAQxcA0SjAg330obOp0S6FbHfCxpY912ZrliydO3KkLU1xkFGRS1I7AsY/R4HkCZQfZ4/on22R7ocp1FNqJg4e12UeOTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lBdD7ozU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NDgfrfEX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lBdD7ozU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NDgfrfEX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6mZXK2391396
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jwSL7BBBHmJtf0E/zB/kUQT56TKlSg0bDSjBz4GFIvM=; b=lBdD7ozUbSAVuDuy
	PCyd/t+QUc/SYlPd6JM7WztVYvMQtdqh9X7IVUB3a0aJa+oyrj5ghDTTUv8pgiA7
	bnNC3vTSATpe5qsMv+SI24vU/NB0ezFlnn2MktBg31ZuKAy2pNqLntoDd7L9FJ1t
	L2sV8sLBJaW8W0SOT98alRl3Xfokn/JTVRJvBVOq7Hy6zn2M1/SdIyZWWp1/EHLb
	tMZ6SgdfpTiGZxCbP2LI9lnjyRL+DQgv5c1ZmkcevkAYDOeCOxQ/n+cVMualYYFl
	Dvc1nXr9JLRR+9k3TcPMIPZRWIjYrxZABs7w89h98WWaAoGNcTMwWcfqGnw+Gibl
	0jJqRg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7ue7kjqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:27:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cfe29579d5so210503585a.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 01:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774945651; x=1775550451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jwSL7BBBHmJtf0E/zB/kUQT56TKlSg0bDSjBz4GFIvM=;
        b=NDgfrfEXYESFHQE/aNKT61xkShz+w/pOcSOXEg8sQAaw8vuahP2WWdi/dmsCYMX1fS
         DTxlOW8eTqmaamWE/aqDLecsMx+HC1SOn3KWyBlsiolz258ibsrpszdjna2+WxbxtaOc
         zYSD+ZgrmTGyAa9vSC9wBeHTjFyRDPbCCY/q7rrUjp/o5wh9K/0Wq71CWehlsOzGC1R1
         wH8ohqbCOqqC8iaZY8hGKHPwnGf9dwtqOpcHDJwDVkcMQo0Kx6f+Os8sE/vFaDv0MZLy
         0eSWsE9cNyvnvFNAXZ70odF9kZEIcS/VrInMCe/Ep0XNcc2pOgH+7a1DRAhzw17/qczr
         ursg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774945651; x=1775550451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jwSL7BBBHmJtf0E/zB/kUQT56TKlSg0bDSjBz4GFIvM=;
        b=bVueN0OagPC1r/+qZ0clGpmhuxhbZRw15Oyg7PEoTCszCOmRCR67EEStBvUM6ru2pH
         twbMI2IlBuyDVHmSIdU8+T6TSmEftU+mgJppcXKjRpAwDMDTRampqknfXP2dXmDZzK2H
         Rx7qjxU2ANZVDeI3xz6za3cigZEVZ6g30jWgnc//6FGlENIpbXgb+tirquxdUj0RLFV6
         Y6++hO+0vuBypi3JjQ/XaHPKkZnz/ASenEajrwTjWlySaHudas28mqzn+BdNzDvk2pLe
         7sP4hhk3l6EGC0YxSnheE5GRZNMDcfZDNVzSQ22AA0XJjzbf87HAeQEGZrlZv4abHqbn
         ug2g==
X-Forwarded-Encrypted: i=1; AJvYcCWeXuZiCQ2yhxUUfMBaGvV/3WrUc+JhG5nILUwuQFh0s7XISDIP45Ca1yu6xdNsZBWnsEj6HpiA2+ww@vger.kernel.org
X-Gm-Message-State: AOJu0YzNQiqGps4uJ8Mno3ib/RNFKsOtDgyiTs26P05qfu2bLHzSaYrZ
	rjPNAwxE9IvkLhPnygsU705tXpzOTfS4RQuNj2zWRLdUh+sEf5evTg/Rl/FmV9MbQziSs+0GQZt
	VS/1jyH9oHjInqYHdRPoFV51N7hC2SN1yEV8vFsBUlHxzeLMQ2Gk+rkfTUWMuGBz8TosBaR1J
X-Gm-Gg: ATEYQzzjTieo09sSAHlx+7mvLLCbhJE8gQ2S23HJJM3HlQXYAxBJqCYmmgam9xSelyk
	yKtxB9YR9n5jNkUezYG3wyo5oT2w2YAKA71XdfhFAEseGEy3nt48/9v/9s9gn4K0NHE1EGoOzGu
	rzvcU4rfdic/YHRp+T2zFQITx3efRpClpsk9x4MT6tIcT01VGk0JkjdVNdW1/TMvuMVtrpKybA8
	gIz0yRrlo2OS3clO3flkKBDSkdybTXOxk6p9qF81cmaFCMpCsYMdeEUSrqoC4c4K7GSdI+wtmSr
	gmp6kytlgYXQxYZvvV7LekszFYTUsJz5amrrQT8zUAmzEIE2qVarGdOwYB/0RIzQvVfqlV2yzdF
	UeLnUF1UicTvyUXcj6H87rKLGLBxdCsPeNPDhlJQve0weVdwcVa+JQHjQZhAoOd73Szsf88Wele
	u+VcY=
X-Received: by 2002:a05:620a:4709:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8d01c7e1cf5mr1557343285a.4.1774945650685;
        Tue, 31 Mar 2026 01:27:30 -0700 (PDT)
X-Received: by 2002:a05:620a:4709:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8d01c7e1cf5mr1557341785a.4.1774945650281;
        Tue, 31 Mar 2026 01:27:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66c5b0f5c6dsm154411a12.15.2026.03.31.01.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:27:28 -0700 (PDT)
Message-ID: <5f7eceb9-2ced-4836-af9b-ba267070e707@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:27:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Enable DisplayPort support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260330-glymur-enable-displayport-v1-1-1543ad6dac3a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330-glymur-enable-displayport-v1-1-1543ad6dac3a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3OSBTYWx0ZWRfXzA2BdWwN6ksX
 GwrgPvnpvHkdlh58yzlNsNUomAiy6LfxcnO2vV8w4L64rjQUn7tX8i5D89DLU+GUb2wCo+Nnuot
 4qFwYPyDlxeBf3bo3xPmATri9BdU6IyPY/f9CynmFsXirRxxpIr5Qx+3VY3LnV/02JxYeBkWSA5
 Q+9F/U6SaowrdJ5DdITnGuq6P7Hn2zdbUBfc1ZWeumhTfbvWgVVk1BG9o96qqaphlY93uCjH4Cq
 BBb7BfxY6CgvaInep+DPOhh0aUgr0qjRMdtMQEid0YbCM+pZl3D8c1mem/0ZSiDsIXYnIXkQy6D
 wxbFgha8TNtjUKFXemPwnneOUT5wCO3W0zQJRk6DR8nQvMWgOSSBXH++C5wGSQNiC+E+ZSbTSTT
 ZolbcsoCb/w9dtAqh8QqK1ys8aPF7Uxb9PavSzsiN5xUL1knp00nNoyjzfUhwZkQDK7oej6IbQa
 fzM7PGGl6BAthQ1xr+Q==
X-Proofpoint-GUID: 9j0eTIDOjF0G5cQSQLyIWhm1k_luXshU
X-Authority-Analysis: v=2.4 cv=G7sR0tk5 c=1 sm=1 tr=0 ts=69cb8573 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=mgjOwgaqgkQbYHjcbWwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 9j0eTIDOjF0G5cQSQLyIWhm1k_luXshU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310079

On 3/30/26 4:24 PM, Abel Vesa wrote:
> The two Type-C ports found on Glymur CRD are DisplayPort alternate mode
> capable. Everything is in place already for the USB, but for DisplayPort
> the controllers need to be enabled.
> 
> So enable the related DisplayPort controller for each of these two
> ports. Also define the supported link frequencies for each output.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
