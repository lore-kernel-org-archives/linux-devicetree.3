Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6F63F0AA6
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 09:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782898573; cv=none; b=TKAHHa52TmBgsctbXFm8D3IAAUR99zX+NFqnNlTHu0coeIR18TKFxMg5TqHWX7hkEKCEybVr5+4nxAIgSdOo7zZ2WnR9DYHFCPEZRlM9nBIFGD5R/fx906fPOITCO+AXKoV4hbpxl2KhimrBePhE+b/c2yX7WE8X2Y5Lt/8hIlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782898573; c=relaxed/simple;
	bh=mVZqFnycurtuDznERqwMW8/MXoyewmD/ojvJPP6GatU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CvdiWpokxOJ/rRD+/aOCfD4XlfXSwlX1VOjbgFz14UwFE+bn495GHEjDTskFxQlLQBf5b99fgIhbZjp16xbGK3hExXQsW2Hd01SUeAGH5h941ONMAud1Gd5XDjQiwlYHh4GQY2ZtPkbUh+GFtvjQ1J9YMjrnpzGm3iKJixUsFxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gp7+nsgm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3+aF9+j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gp7+nsgm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3+aF9+j"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618GLfB488690
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 09:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K3Bghfts1KMXiRIbApQGUhol7516KKzKEK47Hv6j33w=; b=gp7+nsgmQufQaOUI
	nEYVxB6u8cO17HNLSUbSYugVt+MuNogkKXR/FJhr7kUvSIqX2RF7j4qYDwfKJAPj
	/SIOi3lemw6p4XqFdply/9H7TSWmq+VWGNPM3Olwvhe8jAxHATiNo0ekErjHT5Ym
	S5XTi76DOkP0NiYZjwO+u7TLgCp6LetbwjoWLBuJt6th9fGQ+oio5mnOyqNi6Ggi
	jOhG3ijsfXY69vQ6FIQHrJBBVomdNG4ISR7qUe9A5jRNfta5sXKUAw4GINA9NdD+
	/Jmu4cJW9f+kxttHx5FjkNz5cmpjg7HDSDP4EXPyV2OWEJVw2rOwYhSTPQUHiHJf
	Zpx2mA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy1yfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:36:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1fc94a11so471401cf.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 02:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782898571; x=1783503371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K3Bghfts1KMXiRIbApQGUhol7516KKzKEK47Hv6j33w=;
        b=B3+aF9+jnPsBY0IfWZ6Z0PtJ4LpRk89M5q6xOLnXQZDFo8tK3UIkrh+5SsYp2c7nu3
         8UvSd9630nSGOWf8+dDGcJfW4z3mp+ifHAYNi7E5wnr0jBmUcjvkM9fj1DNQ9wf72fue
         alB/W1Yj1Lh0OiVVwqPjpyKFHhKNDHEU3Y+CKeDC47Qj3qu86UfkPw9Et/1WOAx7Y45C
         AoEscuZuH67IbyUNKDlhqJ0iw/9T0riKKQt7U2xdX/9+4nnJKHpSBdfioIrvfTrrF1pQ
         iMLgl5GBOwGenWaRYMzKX+SyUx2/q7o78R25BS/YmvxV5Zp/zaG3AJU79905Qrm+fXTe
         GaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782898571; x=1783503371;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3Bghfts1KMXiRIbApQGUhol7516KKzKEK47Hv6j33w=;
        b=BSfynALUOEZhPTBzZyf2/QrgrxQTjNzWOF3YqDzOaIi7DJ+bFKtinIqeObHNzTu0Jl
         ZEdzjWBWNTtn6DuVE1+EgedvwPJHh9dX+M7UvwOSO+zE0gg4PciFQf1TwDzsd0/6z4yu
         kJPmgMJhiPjIVEw00Kf+V3M4NEpgjh3l8+1nCw9odtldES00fw4VfrcaQFAKsLqKrF/F
         WdeAHBoJVC44FKlG5dm5GhepVc1MyH9IwyHHQzB0bTHQcBPBGbcfpPUQF28jy2eHx3fk
         EGn+T7odzTHmO1Gc9/2KEpgSfhaXElbEq4Ddy9+uoryFOuDeIVcfS4XwxX8uyspxIPgQ
         +ccA==
X-Forwarded-Encrypted: i=1; AFNElJ8TrSJeNqB6MiRoyi5Fm6nW+KA0zEllJ1NiI4tJg35RzAsYyIJL4OTg2qjicqTxyCFnyL2NzFgib/sP@vger.kernel.org
X-Gm-Message-State: AOJu0YzHtuFU3I1yntKhUa4OmGMLj2ZBkGG2NkooUiGdCa91XPwC1EeH
	2tMBQVVK8qEnwcUtzzWDdroR3v1hSGN9TFFd8+Isp/L+KzxTT2gMyQwX0i53l0z6Vnlx2t7bNWu
	VwuLaUEHsSN9TTTgLoIff6Bi4Mk10+eVm2M2Tv9peJ0NtLqYGaAxV7WNELK/616nv
X-Gm-Gg: AfdE7ckJVWd+0Zy4e9wSl9U6ZAmbXJVod/pzKkfn5K3iFtnuIJs3OzrbPqbo5X+78HY
	qkZmG6efu8hXUwIxMUhV3e127Eb96mtGhp9CSMptoL9IXS5ANECC62bUc9exbOGqiSS/cIyKkvK
	k0Deha2bo76tD5gZJl4r0ZwQlmEjM2hGi9djbemVrGT3L6qSDi5WffA/u+qiT+AvUEsP3ucP7nx
	3vwgx0MRsIHpMkLSNS018aFpwcVdjbOboa8HFD2JwFGj0+wz4AUgOn8my6iW4xIFqbNErlswQ0o
	NCQUKu7sEhwaFEa4j2+0LMQGdL+1ptkZK/hoGMhetAjatHCWLl5A9FaecHYw7NKn7yo2DKfTtiR
	dL9SNdXfPhd5k4bR0A0Vr390NhtgbbDaWpec=
X-Received: by 2002:a05:620a:3195:b0:92e:6071:7cc4 with SMTP id af79cd13be357-92e782ab5demr67630485a.4.1782898570714;
        Wed, 01 Jul 2026 02:36:10 -0700 (PDT)
X-Received: by 2002:a05:620a:3195:b0:92e:6071:7cc4 with SMTP id af79cd13be357-92e782ab5demr67627985a.4.1782898570107;
        Wed, 01 Jul 2026 02:36:10 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cb71sm243963466b.39.2026.07.01.02.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 02:36:09 -0700 (PDT)
Message-ID: <09de0dd0-343a-40bf-a8ce-f28c3624e6eb@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 11:36:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] cpufreq: qcom-nvmem: Add IPQ5210 support
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Ilia Lin <ilia.lin@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260701-cpufreq-v1-0-98656ad20ff3@oss.qualcomm.com>
 <20260701-cpufreq-v1-2-98656ad20ff3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701-cpufreq-v1-2-98656ad20ff3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: g-dmDArgI6lYM2Re0jYDwj2QCTe4eCMg
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a44df8b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=OoMFzGetkEUzUeWJbX4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA5NyBTYWx0ZWRfX94RR/jBAafts
 fiGiAUQQhHjnDYZhtjyG03UXgVG9wURmZDSQjK40p786CoIm+omnhP7AJRDqL4angG+wUuk40nQ
 5qLLeAL9zcacvRCdAF6FdOxSKDMU0ZmTsJRmwFNcYYYZzTSSUvcOng8MwWus/2vz4up/P85ZgOR
 ix4e2q8Y998z3yuk2SKTkq1+1/5ChnCFqO4Wv00CbuMJbwxIJpx2U1hDwVhldBhoJ+fZG3taiLG
 YssfWdZJuF8I15LncaXcaUTZKIJ7uW2vO3B2DRoKNRSeNNDwktSqpzwik2CN9XKKcSc/m14JX2+
 zGRRT+vLgEFI8YyilrLQcnrLugl3ilZB+avJRTafOZQsCZmwMePtLYhhcH/Z3KRCBiP6majOgZp
 WQgy3iZEUxK85WDqMaEU4sx8JBKTaaM9ZsbnC7NJ3BNl/5ye7Rs3cKimtOatXR1jnSyBtHX8Aet
 2aNLZD0p84yofdT/sxQ==
X-Proofpoint-ORIG-GUID: g-dmDArgI6lYM2Re0jYDwj2QCTe4eCMg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA5NyBTYWx0ZWRfX2jV20G6W5F2W
 ZrfHCi8MiEDioMGmOQZ/luo4BgkDuJSuF9yJ9QJIp9IA2XqgrYmj7n1lamuE6fHlKESUe9orwzD
 06GClK4qGqPfuCAWe7/1eWUmjvC9e7g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010097

On 7/1/26 10:46 AM, Varadarajan Narayanan wrote:
> IPQ5210 SoCs expose CPU frequency limits through an eFuse speed bin, and
> the valid CPU OPPs depend on the SoC variant.
> 
> Add IPQ5210 support to the Qualcomm NVMEM cpufreq driver so the supported
> OPPs can be selected at runtime using the eFuse value and the opp-
> supported-hw OPP property. Also block the generic cpufreq-dt platform
> device for IPQ5210 so the NVMEM-based driver is used.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 8 ++++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index ff1204c666b1..284eece9e230 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -200,6 +200,7 @@ static const struct of_device_id blocklist[] __initconst = {
>  	{ .compatible = "ti,am62l3", },
>  	{ .compatible = "ti,am62p5", },
>  
> +	{ .compatible = "qcom,ipq5210", },
>  	{ .compatible = "qcom,ipq5332", },
>  	{ .compatible = "qcom,ipq5424", },
>  	{ .compatible = "qcom,ipq6018", },
> diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> index e6d28d162442..b2aeda7c564a 100644
> --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> @@ -200,6 +200,13 @@ static int qcom_cpufreq_kryo_name_version(struct device *cpu_dev,
>  	case QCOM_ID_IPQ9574:
>  		drv->versions = 1 << (unsigned int)(*speedbin);
>  		break;
> +	case QCOM_ID_IPQ5200:
> +	case QCOM_ID_IPQ5210:
> +	case QCOM_ID_QCF2200:
> +	case QCOM_ID_QCF3200:
> +	case QCOM_ID_QCF3210:
> +		drv->versions = (*speedbin != 0xcd) ? BIT(0) : BIT(1);

nit: checking for == is easier to read

anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

