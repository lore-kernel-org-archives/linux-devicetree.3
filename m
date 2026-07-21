Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA2744BCAA
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627635; cv=none; b=pgSLTv4oEjxt+J/eAkZQJeliJ+NBNNmC2BRLGU4h41YMvkQs4sEU+klsFFt9+pHhAV8+5lwLoxfv6K6enIHBJS+V9P+41ULh4ZVGF0XBp4McvdPGcJszf4C2Evh62k5tsxl1GMxS776RZSE9i3R6GpNbDRzTMt4ilJQosMLjeAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627635; c=relaxed/simple;
	bh=xpzUbnGjh193lSfK5gZx7kc2XQNv6ufxKPlViYFddTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QlWlGUl3lPcGF8fx+hPJJ2TB+VCyDOm88kfdHvfHmBwQqvV2GzujcHEO0FB+l6ZWFdhPFDUhsgZi8gkcGSxVvP//vTK3un0O1FK4d528lg59V1gfEql868OO6L1rV7rBoLnyjSqp7suh/DOEqXFF/uTEygkOJRHVNTQQgFSa/Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtoeMv+u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b09wLUgS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtoeMv+u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b09wLUgS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L8f1wf568565
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+FZiGElwaCSWHzg5ui6ymy+kLbXQLZQh4fC1+Jp3SCw=; b=YtoeMv+utaxW1Piw
	DPld3BYgCFVJL5zGsD/3NdKhdR208McBGn6bgVxteZ/rs4KYnjLdxlKeucEH/Sda
	H8P9eE2LTTLXzs90eWj0KXa4vKWQH48o/YtGXMtCF8GTsiY2ZlR/U5GhFmfK89c+
	v66UtVOQpDQtbMP0wPGdJ83bG9gjawF7uBfL3O3dW6r0Y+KbVbCsEdBrXk3PUJjN
	ow4oLm1Bhstl7nzZcOON5938EtX9tLnWdVj6wTAImH/BePHeWyQjfUgH302CV+0O
	b8+9iwkROrm79EJIHw80bQVzDq9iftDg8Q4TMJx9hFfnuNKgPpuKe9jrA5eg5tqZ
	11KaHQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvskw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:53:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso15197204a91.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784627631; x=1785232431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+FZiGElwaCSWHzg5ui6ymy+kLbXQLZQh4fC1+Jp3SCw=;
        b=b09wLUgSQGlj8p2PAs4wwjNOa4ChK0pcpL5QdYDMty08zM+/3SjHpDPVwX8fWfbPOE
         eCaWFGtFHF/wT63i4letUJeGYuzDpMIZaauYOWwCkTXEoTsWC4tTbiUKaWgsOH65ooqU
         pNMs4ZLdxS6c9ZC1ic/PD37nIPeG1RyQ8lJFN+iL/yEhG8UsiI0iwJx3xXBygr21/wDj
         3ZIRPyFDTN7bx+4iUQuLZZqlwFEVQZDUuLv3CwNKR1oavEnIWxZU0Zn+lOKD994AHbZA
         VGlCenD6XEv7/3TBbd+codyawrWzSTlITJdDjTmbi8P2BD3G8Cl2KB0w49m7aoDOk+du
         Nytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627631; x=1785232431;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+FZiGElwaCSWHzg5ui6ymy+kLbXQLZQh4fC1+Jp3SCw=;
        b=jMnOeFFsZpMpLlhtuDo6WOhMZcKdGBldvQk6p2mOXpl/k0DZT401cPXwWxyu60SePZ
         UKfwgKkoAeyvuhUHQ7AdQmpHwkCQZgh9U2mgpPmGAP56QOOEa2jzDuaD7DyREy1JzXRM
         5sqV3gT8kBJyZo5qhrDbe28lkjTurkQpp0mhuLh3EvsTjKJjfIeicdYoIhKp2EkHEDk9
         0DSo9k8XFIFp4sMaOGT47lF4+C98fW5PiOzyXTEuWLkUE9W4iqtTRcup5arXZDHePT/J
         xMv1oFJN6h4SOZib8eNDstQbdcFeA/PSFZBPJdQoY255Mgkl+vgOlfHquI//dN/VR9YR
         TyPw==
X-Forwarded-Encrypted: i=1; AHgh+RrNLLXBva8xLU4LDoyrUUKvE8DH6HoLWU/hAT9034QPbkMVdzTO7RiRUs/KLfbpl6Yf3FhPePCoLgZ4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/95Yv2XJiJ0aVTpqXh4hHfLq0iLsPmKJ9rvez18h9++8Hr3E6
	6fy0SmzVWg9Kyml/9VFN3ejiAXdak8GzMj/nnNxYKcmjWMOabkoM21Uah5iLEgbWLeM0//KSY6Q
	q4t/Mt2Hfoa1x0fXKeGE+sxSYuS1QkMw/Nj6XaCdP1Sutu2H3YFAizMS1+HvnngRh
X-Gm-Gg: AR+sD12Wta7XC2ia9TgURf5BdgQ2ZWuyge8glhpzQw+bmu7kFFuePOkLLAdm/Msulbw
	DArp2RKT6Q1sGM0iudnS7k/3tPmK40hJ14juTn29scbxRdeqESJM2U3IZf18Mp8W5uZBVh5V97p
	B98fcAknO2K0Yb88JdkxdVL3sxnn7F5enrU2v7EMUHCACZO8IG+AZRgddsLiH+JITOw1X0OfICg
	oQaDo7VTSjJlpX6BIDB9yTfTqKcDxCxZHAix8oVb92K6gATU8Qh/n47Mw5AHZNpDKYftkl6HR4h
	saVXMV+7N68z0j6twCq/t3aJgO7pPeToDcQw090+eHQNjJQoEc5yjrsEoTK8vpoCs/bP75/ELFq
	E6vYpUd6Oblqi1dhMJ7daRBiRFsI=
X-Received: by 2002:a17:90b:5908:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-38e4b448c32mr19469473a91.15.1784627631447;
        Tue, 21 Jul 2026 02:53:51 -0700 (PDT)
X-Received: by 2002:a17:90b:5908:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-38e4b448c32mr19469463a91.15.1784627631037;
        Tue, 21 Jul 2026 02:53:51 -0700 (PDT)
Received: from [10.92.203.75] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e9234d3a5sm1217787a91.9.2026.07.21.02.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 02:53:50 -0700 (PDT)
Message-ID: <574de566-e594-489a-be43-012fb9f4d906@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:23:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hamoa: Add ICE node for UFS inline
 encryption
To: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
        Herbert Xu <herbert@gondor.apana.org.au>
References: <20260721-devtool-v1-0-ade633accb41@oss.qualcomm.com>
 <20260721-devtool-v1-2-ade633accb41@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <20260721-devtool-v1-2-ade633accb41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FHL93vpKUGpSmnEAtfviVk0mVfzMWuME
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfX6/iKzuOTMGBg
 fDwA82Y+E305NHUQXxbJNTx3jY/N8VLQgeT6X/zeAnIwG4uA+pRKjYn20MN26xOaoDhMwlYwOjw
 /ZE5YzWfxMxp6l8UFXEoR0a9vtZtsZM=
X-Proofpoint-GUID: FHL93vpKUGpSmnEAtfviVk0mVfzMWuME
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f41b0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LSKOxhpK5ssQvjm95bMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfX+B2JvW1aX7+S
 Oqvk7KtMoQ57ZFSdDw3zsHaWqoLA81/IUjZxoABE2TS7R2KYgsFe+Ma4Qi9NV87HHjlCZTzvpeE
 pIQTcqA2z6QgoFiq2uGXUQPg8gJmCftNcCwQC2F04dTr2zBGJfgxVa6htofUsSZw4WWkSJPaHYD
 zZG/FpYCWxF9NH13n0/6LKxiYg12qzs7ttpgJLNPUGa0ivPdp819W6mjnutg1pMRU5yZq81GXzh
 4CYFjG5bGIMlAx2+fWHPXKAHSm5IYW2LiTt8mop4DzK3zWXPTbTvvAPfPcnPa50/X039wK6pnLz
 7gPibxUIiTF8N5rNX+kNXOe9L/KE6I1CkKGYQBuHTeI7mKUrBpSVxMklRYgirQl9jfJ41OUCrQ9
 LuYs8BBHzZfWzdkGBy9ysknHaqsDz+Zr+YEzvxL0eDcDeHRrLwoB08PMqyPXSXf1MYV+ZoJ1WvD
 N1b4SHUeGgP2zJFIk0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210104

Hi Wenjia,

On 21-07-2026 02:52 pm, Wenjia Zhang wrote:
> Add the Inline Crypto Engine (ICE) device node to enable hardware-

Nit: We're not 'enabling' but 'describing' hardware that is present on the SoC.
I suggest we re-phrase the wording to reflect that.

Regards,
Harshal
> accelerated inline encryption for UFS storage on the Hamoa IoT EVK
> board (Qualcomm X1E80100 SoC).
> 
> Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
