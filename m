Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5213ECBD9
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013224; cv=none; b=B0RbZ3vnM7iHkq+nhq/RnwpL9ro8EilxTx014Z/O62ihrFbs5OESwpVBdhNMGNMSejLJfYcg7pOuo8OpPjiXFMElecQg6kKDhRKqEJRZV97z4FnCB+FCBg06aWz1MYuy3MrzUQDItYdeKv2g3Mo0sgqU5jeqXtUM4p83a+HM0J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013224; c=relaxed/simple;
	bh=10PpcB6hMbBy/TqJvOjI3AXK8sik4AAVgaMK/mryWok=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Rs8rBVt5e1JDTPRJVN4MG2rBBYDF71lOBs/i60hgZne+HoJJxrgcaJeZ16dpYRtWHLM3EPP9uyMXHupY/DgHZPoxixcDFCSmofTksU2i4SUgmujlq84pnKygUSA5PDT10aksEi1UQbpwOwir+3iblyl4c597/OjoUN6JC8gnL3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jGBahuQg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EZUx+8+d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jGBahuQg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EZUx+8+d"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SwRZ3946575
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hEuXaptqgexcqhUclIgAyN67jw7nwpql9tUfRxxjufc=; b=jGBahuQgH0POE8Qd
	GKNqLLEdWgBN+XJr5C7J8OVKfGw+kHVZ4G0Stzlsi+YtFdathHj3HTLL8RVoFuzH
	FiJPc86m2BQBafWWmUlkHgFGrERjK9yExejjyHCeCHghtb80L+5rx0tUkwp+hCwT
	C9liWCCQmzXr64svBmS4GOagwqqHoMLS0yYewe/O5ZWIiEgVTLwP0ThNaVvXVH5q
	2CagVzwlzWfLAQ87xUWAn/Rvci2GT9TMsrz0FdsnqPknIqAkNf3yMW1TGqAcLt4x
	5k2h/NW496FfZR4Ze4pBctdgsMx7oSe7a2uYorP3vH5tnIxPjIkY6VSpwaudHbso
	s8nu2w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwda4d8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:13:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso68965185a.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 00:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784013221; x=1784618021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hEuXaptqgexcqhUclIgAyN67jw7nwpql9tUfRxxjufc=;
        b=EZUx+8+dFqqsr6NoHhBSMZ1Kp99ZzCIxdNWHrNukyz2jg5K69/L7gCFousLd7xPTiC
         1hhQM6FZZm+gamNGfDPke3ZGgwl4C8O8jwjfv22dJiJL343b9j9DIumzveHS4pgoL5qT
         FKBn/5C/VUR40VeqLzJpd0rFe/wWRHCiv1lXRXg67QitrOHfClc4ZmI7nAD4TdccCbaY
         3y736l6lQS8a+hqgEfT7Zg+kROB16VN5fsT9vxmS/Em81DxUbfwcTabje1ZG8AOOxiLx
         Vtk2h1hOa5fnAz8uRrZpuAylyMlci/eBvRcBiXILfOgDGhaTvUpxrZAqYFyrF9OmzA6D
         2EtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013221; x=1784618021;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hEuXaptqgexcqhUclIgAyN67jw7nwpql9tUfRxxjufc=;
        b=sJonfmCsMUajv7XnODw2Rq5vwnNOhxFyHjuwRuUq+UjAEICJeQwdIjjSB7/uWV6oz8
         bBP7yZdJ/COYIa8esqniv8FDBoMvH/mQHtHkl2NYEvKYE3ldyo+TUWC2IV1yR5X6KyGV
         somttBi2WjYKyauHqiA+I3+jMtMrnE2TH88wqvjKfaKOHW5j2YKHGPowq/DkIsN6ie4J
         zUeoCRccen+5op+uVZ60eEutlwx7onFrTN15Px99hACfbvtF/p/4PhdQccLFKdkR2GKu
         3APUnmWKtx/m7YqicJrgJ48VkqIfa8zIvbFpqKUm2W2mAd4dn0oD3aBfgL/rZnkPHvs/
         1Iqg==
X-Forwarded-Encrypted: i=1; AHgh+Ro5c7oCrt1QIMbrKkjq6OKQOJpOyxhgdX2Bcpj6bfywfSC6lEYlyp47OAmEZ6la0U9Nh7hyuQ7orc9M@vger.kernel.org
X-Gm-Message-State: AOJu0YypBQLzo4GgRooKHxMI/eTZLM1qL//2ZkUhSxWfjCsGqoLw12Uy
	GOkPbKBPF1Qibn37rpU36h2/3zbVWipuTwHQCWv/Ioyl/PO5BtnRxLc/pfZZ6k5c8PbqdpqXATg
	fsE8+fmeRwFjdHOVuJ8oJp5Zt94dD7EnKNVRJRt/Vk7byUiwMLanZlV3AJic3z4E4
X-Gm-Gg: AfdE7cms+XfrvWPdxqzBbBYBJst6YOW434kgNmyp3ERZ9KGl0/vCaqJB+S5Pvvm0/gu
	7g+TCtbbucowGvIZQuo3Wtqn/bePe4+7o/C60c0D6hioyXIv75IG+kB0aPgb5E6GvqMidROHkic
	4qLcso35EVqSSGR1gFq2wi+oRBcGXoO+pEUYiDarTaZ7RI4Fbc0qyA4WCMuiyKPZtLKwMtgWVWU
	RsnV4TH32Y4GTrUTTlSYuL3NIVRhqbMOoSi9XQNslQ9/KATMn3dn0at3PAWqk26W/PoAmlme5vX
	6665P0tP9e+uK1fJIE95X85+jgVtqLKpfgLNg9cO4A8iMHNr7rZocln751Pu3bgF+dQAkwqvyks
	gkOU2WjapPkwyV3GbjpXsIeDiUZxN8MKjdcc=
X-Received: by 2002:a05:620a:6403:b0:92a:228:1bfc with SMTP id af79cd13be357-92ef2af24fbmr918752885a.2.1784013220931;
        Tue, 14 Jul 2026 00:13:40 -0700 (PDT)
X-Received: by 2002:a05:620a:6403:b0:92a:228:1bfc with SMTP id af79cd13be357-92ef2af24fbmr918751085a.2.1784013220521;
        Tue, 14 Jul 2026 00:13:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c166608c3f1sm47370866b.0.2026.07.14.00.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 00:13:39 -0700 (PDT)
Message-ID: <197cef00-cfed-4819-b956-1a94335e1423@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:13:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Fix DSI1 phy reference clock
 rate
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713125837.727632-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260713125837.727632-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3NCBTYWx0ZWRfX5BIqOGQQba58
 AyTyNw8XmhtuZXjXrO8N+FoGrTcB/nNdtLASsiJ+AbKAt56kXF4URXXipEZh0A5oX9PdLB8Ch2E
 pPQ8SfsY+hHtc9n5ig3aABnK5VGrDqc=
X-Authority-Analysis: v=2.4 cv=cNbQdFeN c=1 sm=1 tr=0 ts=6a55e1a5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=m4qzsdtWhx_JNS0JMQoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: f-5K_GU6sTMlVcDo1DbzLf_ON8oCtXFf
X-Proofpoint-ORIG-GUID: f-5K_GU6sTMlVcDo1DbzLf_ON8oCtXFf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3NCBTYWx0ZWRfX7otZ/45LwJls
 6U1aes4sAGFR0DyWEnv6Mxt36riva1IMB3W5vHEbWbcwGD2XnDU2VED/r/ggKtS/2Xk2N16ezHt
 5XeCVHXK14VbQC6W24xq9wF+QsQfTtxXsfRO8xyMJ2mQZw9vORtL9EB2hy6Se7UrhZ9mFmd3OC8
 gJVlvyUvbLD6NIO6lzkWdfIxxHNmmkNJcbh2q69YxrLAqyOASGz6BIm5z2eP+Me5RAxSLJrfCEe
 zszFXIvQmbCP5WhieKA2vfu8kzuwKIVIXPEeFnfxTCZXhidP3R9APz9PgqrBpgC3ZHdPjwelt7t
 qmaqrgBaJoR9Nzv1h89B22OkD6XlQEnSWMOKLhjsapwvsEElH4UlYoT330vKxOhKEN4osln3Mcv
 NVjzBWHsmCqq87VLLGzpLcWH5tCZBmeM4IG9+JOHHBvXdaiaa4sShZR9CxZ4WfJc22YbyArDUx2
 ADYjZr2MDl7Itt4Oigw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140074

On 7/13/26 2:58 PM, Krzysztof Kozlowski wrote:
> The DSI PHY CXO clock input is the SoC CXO divided by two.  DSI0 already
> uses correct one, but DSI1 got copy-paste from SM8750, which had same
> problem and copy-pasted code from SM8650.  Wrong clock parent will cause
> incorrect DSI1 PHY PLL frequencies to be used making the DSI panel
> non-working, although there is no upstream user of DSI1.
> 
> Fixes: 159d252ed800 ("arm64: dts: qcom: eliza: Add display (MDSS) with Display CC")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
