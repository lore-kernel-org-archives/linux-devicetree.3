Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB4F31E845
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 11:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774782544; cv=none; b=QxWzkgua0LF6q7H0YZTSMZbIukLbp2gM3mplIgJ0R69BQ0Tz43IxZxnAm/pQE+5J9+8YcTeXMHoOlcToAIcr4iRsPEWNBYCKvw2Tff2Is5Y8/htzmRsjFl18z9u1H7wZab0VnbRQVZ7BrtAgLtmJafHbGC5dz8jJDLgJq5B4hCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774782544; c=relaxed/simple;
	bh=KFdaeW0ZlVAor+j9p5RC5vqD2rFrhuPM6JbqPJDcRTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qCF+qqMXuwW8QJHWt0QjtzFL4n5vNcI3JFf7Mqyl/Xg5C/OJ6izlGWEiCm3xuxZaQi+MewUPg0/lWt5iL6fGjc9LrEnLRwKBgaemogONhHOetv5/imtEG+vIWtpzOWNx/L52bcJXHX8MT974fAsh+ALFNH3PLlyvORPvzuWLvBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WfcPVv9y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KjF3OHjV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WfcPVv9y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KjF3OHjV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAiTd1583059
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 11:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SCjfDWTPSu7BA8044iKcVbUE
	HoU8+6VbM9W4QsjWKY8=; b=WfcPVv9yts14Ft+20iRLnT4rpEyma2BbcYrwjDbJ
	L3Dqe+FHWlp5QQM8Kd6Faux98F3MAE/qNe52c622fFaNbunkmHaFRp8aBQM3O2lJ
	vG5foEvnRRUsGYtcxOvhB8kQO8AmdpOcKiAtNcfFBQgsgwt2RFkVj2qS5XRx8j1Q
	636MNsMXeQRK8A6pluHs93ZHu0NF0F4HydlxqOjI0kqnuTNzHCyYsHb5QGLUppI0
	Va9+9TGFx5Opj0nnc32dKCwBmkotNypaXA5B4N0huebNF9KXNRVyeV/Cz6/twoXg
	bNEDT/Iclu37Q/cBNvdJKI3NvPRaQxOyuJmlkno+2V729Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqjssh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 11:09:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50911c94db1so88125991cf.0
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 04:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774782541; x=1775387341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SCjfDWTPSu7BA8044iKcVbUEHoU8+6VbM9W4QsjWKY8=;
        b=KjF3OHjVrgPqi/1KfztjycwfU/oSfro+FL10POhaAXUdQG5hJx+pJArQ54Z1aHueic
         q/qbpYk4QAQqXMldH/pyZjENhwIq90CZkTlK4hhGdVkltU/HyA71qxKhiCqYNa/BEYxd
         zVJiWGWLhwkF7cUUoIj2/2jo/3CEwdqnaV9SFEGxalFsOyvLCnY77EYKVZFPI5zAKuRY
         7AQ6Bwk7RMOmS/DpsFawswP5lBGw6FjyH/sFFurHDXq2vklq+KcXxduGnq7Few5yib7n
         FiEuHqpo1M9zPtUA/ocMRDG6rSt//7bVJqndSqoeOdyEhUhCzOGnJcO4Z8JHiOm9gixt
         6z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774782541; x=1775387341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCjfDWTPSu7BA8044iKcVbUEHoU8+6VbM9W4QsjWKY8=;
        b=GO6Vi6jstYCzB3recN0JShj/QFLkY4R8K6vNrAeX0zAYHNOypuwUyExWEihysDHWbZ
         JprKLuCMtq7ugRCh0ZHLrbGowWpn3u4tXJZu7qbzk45EDtDI6efmKjwF6jS0Alf9zaiD
         288wc+KMxwvcaw9zTJ5BcisucvVQwJlrjrdfCzxXezi+wUP2cMFiiti8GNDvtz7Yu5K1
         Bp9/Wx7EfZgBC/laSDaiPObB7VLmTmN9n64lAFMm+iXO+1iaOSHpuKr/4aq+7YgziZr0
         X9nSbgnl7FEKy1gMNzplD6rq+0kMxFwzAcR1Sk0Yid7LgP5fvvBEyWQwE+nNJlFwsyAZ
         2CkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn6oTEhgpNZ1z15j0TFxXIwmQbmTTOSuNkPIhAM+UqdTjaonRBnA/zk+nJV87YIi5R2liJrn+L0quN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3kJ6CDXdDFQWX9MuvKuZIGE9SHYmxxNDeDSZGvV/oA9yAuzZj
	SECx50BVDmHnB8tfkEDvse9Z/DSP1fz6WPJ5QlHcG1nXPlb+05lEgs84YVCwgY62FoOWUNsiAjh
	jSbDZ/6NqHuxJmzbGAxXyE42LmNRZBQZUIlPlohqsEaKFHien7++3EIG8VeGYAPwL
X-Gm-Gg: ATEYQzwkImrATUOFuipKc6nnvuEYmDQ/ntU5ka4jsXPmHjR1T6LuXPKAirmmTd834HC
	QEvzDoRXSA5E76q4lEwHIZV7MQMTkvjOSdY7pRazRqt6VczDHt52H3MQ68OJQIiRWByxpkO7ZF4
	0wUEZK+ZlwSae+oi+8/0xGHx0Xo1v5htI2woddM0bE7J1ZqLIMfgD5ymTcX+V1Jibbs90VrfdiR
	KvMCoXzMr0P8aegedx5AI2TGII9KRnozF8uosuIq8KsvUFXtnt/qzNx/TcVxmQ3w3IC5PJ9ZzJL
	wivFjqNohWh24w9y0G9OmoN08ji+Dsd7E/Tsdv9ylSK3N3QJycJKICKuDvm48kVY2xJcdNgydrr
	HmXtY4g8RSoxO+rJDc+ePSVmuVNhaeDPS/lbtE7La5P3oEqOosL4mEMEH5A8rPpP2c6hJ20zRTV
	3zLGCecbg0UC8Be8JNWtr8o9oYna0JIZJfYj4=
X-Received: by 2002:a05:622a:64b:b0:50b:4c03:7b88 with SMTP id d75a77b69052e-50ba39c1effmr120235521cf.67.1774782541469;
        Sun, 29 Mar 2026 04:09:01 -0700 (PDT)
X-Received: by 2002:a05:622a:64b:b0:50b:4c03:7b88 with SMTP id d75a77b69052e-50ba39c1effmr120235211cf.67.1774782540999;
        Sun, 29 Mar 2026 04:09:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1403cc1sm987221e87.28.2026.03.29.04.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 04:08:59 -0700 (PDT)
Date: Sun, 29 Mar 2026 14:08:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: enable UART6 for robot
 expansion board
Message-ID: <smbe2ltwykqvlzhryclcm5p7wdhjb72tzuqoramjynrsz35tmb@q6l2osdzflvn>
References: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
 <20260327083101.1343613-3-canfeng.zhuang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327083101.1343613-3-canfeng.zhuang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: -7w_l5POTKfIygv-e4gwhjF8844F0Era
X-Proofpoint-GUID: -7w_l5POTKfIygv-e4gwhjF8844F0Era
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69c9084e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=S3gobNufr5BrtecctxwA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA4NiBTYWx0ZWRfX9Ez2cu2sZDjt
 6lU6oh9o97M4DBwESNroAlUqeGJlD2PpUi75NiDWJSNUnb/xMdIUiG/QCR+Y4OfzFfhT1k/wt7K
 xq48s1SN5tAnTYSxov6lD5yqhWxTb9Q2ezPSP/K9/+Po44EEFqmfRP1bLbQBDmdEOuVHM2sVgX7
 Lx9vBTVNtlb1U+GhxljHq0Nj1fNBwJLnxht0lXMs1F5FBu/2W70C+JOM7s0YSv448OkpBQONGd8
 hhae7Up0UpFCrFwgslc8L1xwpr4Nu/jri5QowkUE1mO1ZPBTXhALNLVDWgvLXxE6dFODo5mf4rR
 aLvdhKvy5ICE2g37CvhaqHAgWQ4qWedb3mxFYXwSQU7x7pwqQQ3MonvJqoMC0F2yXKhTzIFzNSq
 8E/vkNnyxLO+Z2W6A+VKCVQlaPgMcqPWKHDVCCEBziXJK43yonPo0qlLB00Plqxal2TLh9Xbqey
 dMv6CqCIv8SfblpQyEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_03,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290086

On Fri, Mar 27, 2026 at 04:31:01PM +0800, Canfeng Zhuang wrote:
> The monaco-evk mezzanine connector supports a robot expansion board that
> requires UART6, which is currently disabled. This prevents the expansion
> board from exchanging data and control commands.
> 
> Enable UART6 and assign the serial2 alias to provide stable device
> enumeration for the expansion board.
> 
> Signed-off-by: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> index 565418b86b2a..0b26861eac02 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> @@ -21,6 +21,7 @@ aliases {
>  		ethernet0 = &ethernet0;
>  		i2c1 = &i2c1;
>  		serial0 = &uart7;
> +		serial2 = &uart6;

What happened to serial1?

>  	};
>  
>  	chosen {

-- 
With best wishes
Dmitry
