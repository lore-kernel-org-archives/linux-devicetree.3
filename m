Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2634F3F823F
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723194; cv=none; b=uAKR3EHZKm3bojLU1k95SDEuIVMLwsmOpYgxGkhbGlSXKwohgNpIQyaH14gDZrk9Kz873lJN/7OzwfSUaz+DWRvF2jKIXuXhdoBR7HYjYhq8nFLTCQTLaVgNoSkAiDBrDkLWl6fF+W9Cx+ntWXLOIrKGBw3DZN9KYvgvY5vv+uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723194; c=relaxed/simple;
	bh=F3OFBLlj8lAktFcr+xkCCxECEwRA6j6tVLIvdSaQSe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XdmgKU0cLmP/BGq5+VwtRjR0bwddYwIKUGajFVpYNp21Lydqi+3G0cvP9LfUl3MzDcNZtqmiCJWpJ7JT8Y1t0IfrxB76liyD+6vECQkHXsl0IbhljFXt2yaJubJxfxXcltNd0tBSrZDhp1BU2XkDd6hYlFEQsG6VoruTpjBtbqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T1XGg8hW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YsggrJJZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T1XGg8hW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YsggrJJZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8aSkb2368200
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MxKbFO3jZdx0YMVM28FnI1izFIXZoinjwwywDy6J9aA=; b=T1XGg8hWV+HFSMfv
	ZayRu3sTjrhGUa6K+hGv3D8cpX854IbY+g+3K1kEJjx9PhYbM/nKcJXTSEWQTBdF
	KtpLoCpzE4TT4oRoQZuB8FOlEtbzTe7bQzLxawr7FK92zZzcvXx0+6QqixNhgvD3
	n3Evhjco5KhEgQYeM9crVLtLFWnTAZEVG8xlnNF/cICa8358tFuA/q/IEPKHFkWw
	zqtwANNOGtfe3yHk4XjGK2y+jtw2WhR/z6d4qAC1EHj/7Hexil8tvf8KGtxl211i
	WsY8rbmK3yhARXp7f3J9iXpHRKdGsabAUrkNjtcZ7ECLuXKdbOiM0puNFGkwKHsJ
	N+0PGA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgr23n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:53:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92b110673a6so57318985a.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 01:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723191; x=1783327991; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MxKbFO3jZdx0YMVM28FnI1izFIXZoinjwwywDy6J9aA=;
        b=YsggrJJZR10kLnvn+ocnIOjoDS2Mo+A29tXGAPbovxUNC4A4bXfFhslUKDgQPwCNCT
         T5ZceU/T9zormSrrdiaVXhEO0HcXRfpmqMkjtwEwmelmAvZEOPoGS/XszfOtOp3MXBFZ
         ifR0/hjJlHGgggnHrgdVZsUtcs0fejWCMBhwWZAcougqTQPtGMhwdIOAIUcRLYGcGPiO
         L9tIzZHYbX9PK1iL/qf48H7QqX2SbFn/1nhdWbsfmUk9yXjtmu75ZBuc/24S7oFWN96S
         +B04wb5ojrZ2hWmtj2R9yldKjja4r5AtzYBASw+q1NK8bVgafmXmhAYCTJ2nMrl9pXxx
         MKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723191; x=1783327991;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MxKbFO3jZdx0YMVM28FnI1izFIXZoinjwwywDy6J9aA=;
        b=SKkxYOhjI+aH1UBsbr7pfIfic4aPysF+xxRmDIP2Ypv8Zp2mAyZ/R3+lOBgY+X6N0g
         gHoFs7PzCD7xYG6BY1predN6No6nvbICW3AHDpA296mbGjnPTVwsIN2Xa34469Vi+YBY
         pYz2edyQmkhcmLZbtcLZl2DukYaUwHYZqGNQgHBoxEZrVK2+N9eBT1j7+K5nWImKb+BB
         Vq3syupPJszWTXzuWnBczsZkEF3gEXUttCONO4uUiA/Q/9PBlnElNhI5njwiITFkTgqz
         5J+/sHnZJDL0fEMwIR/otwDLX9bTXcmD7O7Uwlo7MOX/1sNZ6Br9PsqSPJXlv4cFXJ2a
         hY6A==
X-Forwarded-Encrypted: i=1; AFNElJ9LJU0+8AhpbCX4bPgAG72Wt1cv5sVyK3XVfyaFJSUhuRscQO7bhYORiGVkl0DBKf9IzH7DW0FMO10c@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8bFI1Gg0JSYkn2x338wCopHq92GENJCTubRtQUEF1dQ8bCzRO
	cja/QO4ZuJknzEFJDAqgBuEgfkjS8OyPwId/4Cgd21HySaprHgSu6j9+ln1mHGSn2Yqeb/9DSRV
	ly9khdo6kzBkozQ0/SS966uHxL33OX7ptAs455Evj81TK2VcNB2jr5uwkZEfauO21
X-Gm-Gg: AfdE7clSDGsVEyUQhuRCysmcSGmdZu2uVmBjRa8wA0aaq7fRCwCy5kPY02EloQptpXv
	JC587CBbsNq1qtlfeYpuFbmA1ISyioh5TItTmucyp5nYwMWGcDXD3nPyi8OkJlNIj1lJceNd+da
	54PqsDlYiWPciFz2d9XAiixOjHPrML4T2TtEzH3+GK4bLOczpX1UcEnLCeQDpjGdrLjuU0wCTMY
	VnGWl6nquHnuOpdMC1qcgyh9jpsZt73lJxnmEI+RgbPJk8tnwsTsesDAK0MmIU+K7rVZ4C6glY6
	I+KYEWezoOnLoSeVGS0C/YzfO/b8PNfMtGkfBQUvsjXZnjXvJV0EY9lbkWPCV/OjKIXm10oiUuk
	y3UX7NalAZRZjLQrVf4Exb1eeETHTFI/MGpM=
X-Received: by 2002:ac8:5dd1:0:b0:51b:e991:92bd with SMTP id d75a77b69052e-51be9919641mr61100021cf.7.1782723191349;
        Mon, 29 Jun 2026 01:53:11 -0700 (PDT)
X-Received: by 2002:ac8:5dd1:0:b0:51b:e991:92bd with SMTP id d75a77b69052e-51be9919641mr61099921cf.7.1782723190905;
        Mon, 29 Jun 2026 01:53:10 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05cbfsm739181166b.36.2026.06.29.01.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 01:53:09 -0700 (PDT)
Message-ID: <a509092a-1c65-493b-9df7-c8a89564bd7a@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:53:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] arm64: dts: qcom: shikra: Add A704 GPU support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aditya Sherawat <asherawa@qti.qualcomm.com>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
 <20260628-shikra-gpu-v3-5-9b28a3b167e1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260628-shikra-gpu-v3-5-9b28a3b167e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ueenyWc5iLIVpx2yHEMIstDYLCa-8yqa
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a423277 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX7jqIokWWdkCO
 PjBWvXDhsrVIw7miEpp48XUudqhxNGJbwEwhQBaeZuRGexxQT26RMFkXZMQVShgdi20D843K7I7
 NB0qJPlkfLOupbzeJ1VCTrNnf1yLEP8=
X-Proofpoint-GUID: ueenyWc5iLIVpx2yHEMIstDYLCa-8yqa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX8+HXUr/K9KJL
 EaUOyqGJgg7NLYBpBdb7OF8XpAQ70Xt4rGsFzdKblij/7pt/7WOzB/CAkcIv6BgB0TmAGLc3Z6E
 xmzDeYTSSVDkq5lZFlJb9tJoAd3OwzXOgswi79Hk4n/+o0MutUypJ4zaq/ZpfKQBXvIKCF2Xer2
 BKbZ9DQRRwc+6GPz6r75QDJmW6OxwZUplOKF4O4Ro06fVVy2W/yV6XCtH1JAXaeXIjPkAUXW2Xl
 1atavENAFWuSuumiBDQ1vGn728U/28YIzpal+NqVHksdrYqWhGRTyykJyIeELyqtk4bOBZZncMN
 4cFt3X2SaZGUfq08DXImkJgOkX1Rtsqt5yFn562uGO5KaAH2qvt8ElVwo3RQwMrMFS7+T+EiIA6
 LQiBZvxL/YX+R+io+GP2GxN8ZWXLdYYZR1mEIwiCF3Jih371i6djvYeVi0WGhrK+k8d27cuizW0
 YQ7dik7eC0OskPna+DQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290071

On 6/28/26 8:23 PM, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Add the A704 GPU and GMU wrapper nodes with register maps, clocks,
> interconnects, IOMMU, OPP table and the zap-shader region.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
