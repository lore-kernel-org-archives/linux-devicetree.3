Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE3A3C1F21
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 12:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762648; cv=none; b=kbsinJKN2oweSqCtfuP8N4GppvhXwKGTQxsAqzJU531mRY5PHRNNe+4vgNsSxurSlueCCQPGpInBcvJafG9VWmgjWUSvTOiKA0q/ACui6+vBxIt2Ehp/zFiIQRgJqzetSKQING6SYPlLobUC2QFt5piD1W9GQLs4+OPfmkjaTgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762648; c=relaxed/simple;
	bh=DcIPXR/xIFPytsBGJRYa6g9YSH+zqLKVAKufUlxLhYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BDP+WnhuaoxLcxbr7FUCkcpsq6EUk5Wo5nsk6KasI1OKv763r5xA51zyPXAl647I1jUFex1ftCJn5Jx75cH5RWottvyNbyhYGlaZ2LRyQGrH4/PWyvE0LyXVrcZu9t0OPoYPDZsvNxPXLNGuyhTRP/t5Kfq1Mf+kIXhdZtPXOM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9O0Crni; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kQ0v/blL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9O0Crni";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kQ0v/blL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeYfl1717897
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 12:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rAvsMuwZV4ckNzcq8kycV+c90RKc2YlbhdiothPSIhI=; b=P9O0CrniShmq3Pj3
	iA3WD2SZI1Hycq79Apgxw1n9nuht/0Fgw+utcmQggHJkn2eiqsVoJY1qSiV5zEgb
	LLF1lBFVB2vtjBwsIpDrIvlCv5tL+5Vsw3HWBAn/9v3pMn+NiOKf6m31VUtp2qDb
	XR6oSmqq5fhg+QpNWHXbrEB9LlYmmpVEi4pvP9NfiBRCjyuGC/pzUXOYPklNnAj9
	p5Bwce3oS79TsLxZnX5MZUjSVz3AuXSpKb0eg70Z1a85XSHCMDNWJ7TzVR0al0DY
	PvkY099ekYKVzFO+8YtJPwF2lfxAAVa/TVTMD91m9C90j/40wPOiABA6llH9PS7l
	QUB8Tw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57y7hg4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 12:44:05 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-63126f42441so548082137.3
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 05:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778762644; x=1779367444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rAvsMuwZV4ckNzcq8kycV+c90RKc2YlbhdiothPSIhI=;
        b=kQ0v/blLbx5M43ZmBcW74qtw+3/ERmzs7cr8EWbA1TxmSTkNoHw1u6VsxpfLKXTQKA
         8GJ1cz/rSB0aJNMjRaIp22IqwK9sTEvVVcMqNEuGHeYQdicPh0yzTRAqlrZYQCsvFkui
         ZRNN8p5cmPG00yqupzkRcWcAd37dvwNxqkcVT2LWRpjjHNGf6PTxRcW6P32bBsrbdI8r
         H3+QxOjaf8ejaMagu7Nv3s+5MhwCKwPpcTkDNPoVwhouf9cfDxoj0GGeB6GlMwqO/1t2
         FiStzh46OhQQjVAH82SdGr7+tvc7IjjlraXSaA7J9bM/KP1fk4wD3abelKmnL9IG4+M/
         95bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778762644; x=1779367444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAvsMuwZV4ckNzcq8kycV+c90RKc2YlbhdiothPSIhI=;
        b=Peu2RJXDK5JhK2jkgqmnI5HSwu1Zdxb3rZ4DQl7VkeodaX1V3PSiwS3MBupP7zVwl/
         B3C/dTXDqwYgNUYKmst6LZFHLc9Txcsa/z58a/bNHPzHPTgG2oT8q+DJ+kQV0YAFrGYP
         VESLBfy6FaDOk8p0l5MTdTGGkv7eRwTf6YmBiZQkutv8i+qmJjjPQp0z/+vED8No4Tdy
         /LX4zmJS0Ik/sBVVlkfN1Q+xH0/vNkf/s7kCtYXAZK9oqXETYlCZRJQ/1cN9P4w+q1yx
         930YqVZOFRcdKCdzz2Um0W7P6hyl9zHLLhewsIXjCkEneQtF9hhiddGqXHApf06ta3Qi
         zwKg==
X-Forwarded-Encrypted: i=1; AFNElJ9Aqg9QkgKzMAqPnumfmLNvXjkQHMXw9qd8lolRvHD2ZbbvH4RmhQkoF+B3csYFL92pXy1qZzN6vSlo@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzado10PTWnajqdVe16awZL0XrztzYgMBlz8yVUMsWaR4X6gnY
	lF4hX00V1MOLQAo7wP+NlIDfOYHIpkVXhS+xsrkEMopspJqK0kN1tgn4IOc1m644f4BCurmmDYY
	SwxWQx3kWEFiWHjjnKS60SfwNLUpzy5K9KlcDNSnl9rsQu+0VGH8dl53dqbAUD0Ji
X-Gm-Gg: Acq92OFea7eCrWxWCjlNKag9l/HOjP0z+donj9MJgSrT4jogx1dVOWWSLqfw1U9+Smq
	t+rt0IVpAPmkLgBMVVx9NjA5iF40aVp1LNcCY2MWyFOAcpBPLar48PwnKfJ/BJPpBRFebCQEqRb
	FZiMLT6hspQfueaTaTzLTMZ5Lzm0hEyyN1S1Waxcu4RucKh2l6UpXmEghuLX4smj946Ksj2A2Ck
	KG64182WGpUZtFT1vKRpz49GNHt7044zHC7UYbjGdfQtNJGI9H+6Ov2+wjLALr7RVgX5YLsQnhm
	YV4CnWkGOdv5H0e0V05ClX0rdM62ZUcaGZFx7eBoFAfQb9XCt/Xi8B3m0wTfUXTDNwB+3QTn3Is
	/nByjnVSTCpHkIHhud+j65QtU1fbZ0+0l6dWSEwzKQzFWrIPV8bEWTgaI2GqbnMojf90T+M6ky4
	JYXcmCQB0qfCDb+w==
X-Received: by 2002:a05:6102:308e:b0:631:3ccc:42df with SMTP id ada2fe7eead31-637750e0095mr1201547137.3.1778762644573;
        Thu, 14 May 2026 05:44:04 -0700 (PDT)
X-Received: by 2002:a05:6102:308e:b0:631:3ccc:42df with SMTP id ada2fe7eead31-637750e0095mr1201528137.3.1778762644167;
        Thu, 14 May 2026 05:44:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c24178sm87039266b.15.2026.05.14.05.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 05:44:03 -0700 (PDT)
Message-ID: <f0cd7431-acc3-4468-a2ce-7e44a915472f@oss.qualcomm.com>
Date: Thu, 14 May 2026 14:44:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm64: dts: qcom: kaanapali: Add qfprom node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-4-13e1c07c2050@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-4-13e1c07c2050@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KNSikyceGMooeklwPbbTIAxHRFs_0Jl7
X-Authority-Analysis: v=2.4 cv=UY9hjqSN c=1 sm=1 tr=0 ts=6a05c395 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=_Tv7ClR51sp9MY50WFAA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: KNSikyceGMooeklwPbbTIAxHRFs_0Jl7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEyNyBTYWx0ZWRfX/fB3d0FnPDjd
 h8N17S7XmNkNZInaNYK3a9KAgoMABYnrCbCr/Rduxd6EACMfmAkGPuOhJepp0TnFkwytNKqREsq
 dFHWhBMPrNaWeKUiLqfQTJ+g6k0QTIhBlBmdmbiBDzlnAJ13Hc9J15Jco6TbzIPyIzOiu3L2BES
 oC09MN73g1yZps2lVnwkmWvXuP4/iktrAnPMz5nUu2LB92Dw+VsrJnchXFdl+JwBZBA7T6gFtB+
 rRIB6FTwBWQRkGVm1F0jEy1ZiUaAk88UQt33B14+0rtN2BIlD4iXrBVvo0rtRsvEHIw23EEtK41
 bCsO+qteWbIxWOEp8IvCmzlRmXEXGctrgLru+FPwtQawyfB3tcF2Jn/yeei3jt3J+4mJm3v5TZH
 +F4kGArHDrS6sBUxur67Oed1dbpRV4D2snybk2pz34GM2tbFEUir5zM75hFoirISMhogz0zd9I4
 ColjZT37sNrPGxlvL4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140127

On 5/12/26 12:23 AM, Akhil P Oommen wrote:
> From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> Add the qfprom node and gpu related subnodes on Kaanapali SoC.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
