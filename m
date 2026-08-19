Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D170411A09
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158109; cv=none; b=Dx+TIexryraM+0SP0zvCJxmkVBguoi5Uu67dB+WQa5kFKAPnYUPSgn8Ucf0CXVKSTFzHbNbehKa8Er9o2RgNgz/jyOOOVfu/t4KfRKxdoyO+Nl04+ELiLQfPy12PQAde5MYw9WMiR+f44CKvOTXBUKgMqzNZgdazXjhujAQQOMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158109; c=relaxed/simple;
	bh=FK/YKI032WnFYfbtf+dIqJfVP2pVl3mGpbQL+QMkSJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m0gMAsDHNuGEYbBxBLN2KXhmzLM1JmbV1vTBnyGQ/hfDcyYkZOj1OOW68tPshkAmBeJdk/wfVKwOb+YducMlCKLSbiwYnhas1RnG9yjBvAKkJSlJa6m4q/tmByzw6HEByGq2H+YA9v2mkC3TjBKXXMkbdK+ufzdKbLGI2jjXNbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jw523IqO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ic2wc4LI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jw523IqO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ic2wc4LI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF2PSj965087
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OFgVczgZo7H4OwQ2HcYCs51a3l3OB7VCV1oqx0nuVcQ=; b=Jw523IqOi3DQwL17
	4rvEldBNetWSammTrtbWBqgb5o7uuv4MtBhqHQJnnxYJahBWGVzQuzpnZPAnlBMw
	F3kS2mRogUDOdHazaamgtJJ/C4sUXR/AaP6AyA8PqDRRAhJyaH2zbkBmHkyTGb7o
	XkfLvXtBlPs4Iv5kqPL/gvVy1b+LHYxQzxxKUnx2STc/CmRr6nYnmITgfGtcT5IM
	niListF5ntJ/zb2SzS66QALJhRht0V3bo4Snl0vDiubjrUsGW3fQPepjiHd3a030
	+4E/tlkuW2yDgDBV4MXsG2MZfNrmXHMBTvSrkdqixcD+1UEAIVmWxE5EaahSDmFm
	Lr8/lQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es3gkmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:48:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfd1772d8so2148491cf.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787158105; x=1787762905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OFgVczgZo7H4OwQ2HcYCs51a3l3OB7VCV1oqx0nuVcQ=;
        b=ic2wc4LIKK1KiodDLoBlvwxjIrTgm/q9FLtXWWvPWthmahSfaVKvc6MGvNdTM7YgN7
         ShEAbbx/I57Muj0/aBlGwb/Wur6MsoLIpMQSvPCW8W0E7SrqDquUXwYY2sHP/Rt/x+31
         6/sMR1F5p9ZrGpdU1KagUV9wfMBATOkeDGVGx/aXy57n+wuo/3vtTxoX2+u+GEjq3n2W
         cLFJfogSWwBHCV7Hw2SaPS+own4aZS0u6Q995M1eJk22kVh9W/5vRVRp+1JZYpaTFHlC
         Pj5X/qtazpH4g7hwKR3W6VDApXFJviABQ4B5Ov5BWQVtfSRar/j9jSKUDtzmAFoaneQx
         rU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787158105; x=1787762905;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OFgVczgZo7H4OwQ2HcYCs51a3l3OB7VCV1oqx0nuVcQ=;
        b=pQbQUA2XmhcUyOqw0H32Af8JjCttARyTcWKW08Mhtbis+dtdXprBaQTCL7BqIcLj5+
         ud68fMAioXbVE+VFI5FRmqswKZoh6ESCKuSkHAgDu4ZJTYpDp5Mq/W0sbAwPlR3SKar0
         ug2fPMpUCxBx6XKucuSh3QAqB4Fd8qcrTdsvjBq/U1sRbYysluO92DnIxq5rRBoXKzC3
         wbyrhCZBtKdBCgZs52VA6ICX5xc7AphxSQ+JgCDOWeYIfx+u3oAfeQg56nxawFxGjPd6
         Y75LJ2TcIJTVIDw2IMw0kQeHKWgbztj3ceWP8DeZUWkgIquasiOOP7KLb4NUhv/3hXMW
         rS8Q==
X-Forwarded-Encrypted: i=1; AHgh+RoopGtPy8M6xKKCpaA2q2De44liACFOxYnOAUsNBSsAwKuadiiZHtaIw6JVkooxEGGHcD5bZjWs+hSP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx66gzfc5Nhinz0HeK+tazzLjE7CGJ+DuTCLRDt5EW8RCGpsnAW
	VEpMZ3Ajsm+FJBS6rsAolpCD/LdSOXoITtZ0hXs1LFCVLP8lmNf45gOU3Pcj3Xg6yxd88tdFpth
	Y/mCgwBGv8hR/y5oKYBNvB3c/JQgzEDa9qO12m9dJXKPCTAGhHWm/trNg5XPfZf9Z
X-Gm-Gg: AR+sD12hCGM/FSNC4qGdIoS+xlZRtQ04aU5aDEIwYdgD0IiJszayeUh9jzyU1DITWIi
	yuW0T0c6Ic3/4tlQrk/+cR0iJtmjCZmaxAumRSdmWz5PGcjUuYcPEyxA0Eexlc/Hfj63UXNx/0d
	3v1CXVE2q3RLuYGcFSfbCo8pedA8dDAK2wjoaERYZhFiZ+vab+nmfvKIbq3r++NjHFzUAksghZo
	aCWyOhTjOshYGxcJj/3APMMn4qZc/ofS52fXiS8vHIFz6QEZ7D2DwgKzFtby8pC9bM6MJKV4zD3
	uPcYPbRI71CEMbo3JGkffLc4xp0P7ElEvzAuWJDGPxDECtLx0dcQVd7XaaA7/M6wUHCVJwULP//
	KVnrbDmJMxOeuCy4dopvL99KL
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr42780451cf.3.1787158104748;
        Wed, 19 Aug 2026 09:48:24 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr42779971cf.3.1787158104322;
        Wed, 19 Aug 2026 09:48:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1563c5sm1207774a12.14.2026.08.19.09.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:48:22 -0700 (PDT)
Message-ID: <55597b87-be91-4d5b-b3e5-6c075fd239d7@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:48:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/16] arm64: dts: qcom: sm8550: Add GCC CX power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-12-840034124e73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-12-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UIrt2ify c=1 sm=1 tr=0 ts=6a85de59 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nJhpUYXR7LpnGJmJaegA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfXyzQAYs+X666S
 /6fKIcZszke2OocZyvLFuTiH+ws2Dv7SZjScvbmV2mOEd43C8wOYzF+3f/CyM2d7abyBuBXXAyf
 hqjKm+/aVYlh99+XxujRnpHbgn0DYbjcMNBt2gJG3elnMjM724feFV2dRL9qWQVZy8V8eLXp1CV
 HPtcKB1FGaB6bsmc9R5X83FdkGiDmvVG5MLuY/9tJpz4Q2EtdWfdmNqYiL/Cp05sHDePEmfRC+m
 CIaMPJpPAXe6TEDWc+2r33ZPtJfHhLt+r5m2UroyEdLpoPTY+uW3vwv5Bx+4i4Lm0Z1r2Z57TeS
 m1KuIAW2O/Fxy9TdwsYNftOKBd15Ug4aR+TfoprBie674B2XpSlvDCrlWI1E3I4pCvscwBeAM4V
 31caJlq5FjGdbajWWr6gctYLFnbNm2o5567BuvN3hOAMUBH32S2OCVdNHjcCS2/DDJ9m0lU4zGI
 botK5uiqVcCiWu8hmzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfXyt0w07Efgogr
 RylufCIiwt7IjKE89TUtxxtLz6iCYlfdVieoakuL06XBtZpP9ThgSS5xHTCyk0ZVa3iMpygnO6E
 zpwhYx5KSbZyZPGvOkHfg3iOhd7DIE0=
X-Proofpoint-ORIG-GUID: P_CVOPaRjmYbKfJBnmQlcYMVcFipa8Hm
X-Proofpoint-GUID: P_CVOPaRjmYbKfJBnmQlcYMVcFipa8Hm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190130

On 8/19/26 2:51 PM, Abel Vesa wrote:
> The GCC GDSCs on SM8550 are backed by the RPMh CX power domain. Without
> describing that parent domain, consumers of GCC-provided GDSCs can enable
> their local domain without causing the required CX vote to be held.
> 
> Add the CX power-domain reference to the GCC node so votes from GCC GDSC
> consumers can propagate to RPMh CX.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
