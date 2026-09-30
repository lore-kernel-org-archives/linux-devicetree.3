Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E30492E42
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764786; cv=none; b=s3atEgQs15tUe2Uf3ZB0eXROj/hjz2mi3v4zo3ixp/LIQEtV7HWCP81cIxUGcIk2z2FwWkKSiqkGlgBywqu2UYo1Ly/RRcRSYaeefNyLSGx+Rbs2ew0ysHHfHGbUjiyrL2oDs3MTOzBYZykpjmbV9Hz8f1sAv0VxL+uDfv6Vnlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764786; c=relaxed/simple;
	bh=Mj1IOcMIxhElrq67uOZbR13BSh/iIb8XuN8hD5RzMls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B/kCeilCBADQG41q86BD5C4Ghs/AWY/7dn6VfzGF2xcBJfJsMN8hqUqQj0svRkOVxvwyrlwgcwrwQTXXC6Wf3CFaCQN6875JNW98wi4mLoZdB+fdVewGKe4XcCVjuvhJ5V+60XAN8d5qzIPjc/fznTMoct8LEIRbyAlP5ZbTefY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fLTco5Pe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hs5ernKD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fLTco5Pe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hs5ernKD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dWfF3489199
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NxsDdgmSrXEpefiv4dLm4x7z/LQYERZV07k4WnFvesk=; b=fLTco5PeKrhH7QwP
	/D2Q1oMQ5w0NSRXs4BBCB81BTKRePSuT32S7y6ZIuwUkch3S6ZsEa4zinCyLf28L
	dE0N/rrl1LP8LfzblqA3FOusyhSMUwAaM0EIzt/1fHbeagEzmO8XPmGCJ0TDDFjL
	Zmvvb4w8BlOS0od/vLrXab7Q82xgYDSZynNHU0RcGIzRaFkEw2Hxb47/zyIzeTyR
	CrAi6VozFthWMh/S6HbHycEPDeLFEkFAlN9urLIzrFnHKyOaXMixNTgNVYC/6hus
	O0otWeNhM+s5lTec+i5pIdq3m7yHzOJ1S/hQx6lQlzpI2TT4wcN3y09d8xX7qpwX
	YhARLw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j97uswh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:39:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-915e9e1a5f1so5318796d6.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 03:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790764777; x=1791369577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NxsDdgmSrXEpefiv4dLm4x7z/LQYERZV07k4WnFvesk=;
        b=hs5ernKDbT/BgHdTfnRDeafSV8lYsHOh9l6vZIPFthkO0CxWfjJ3J6Yo84YrBE9+ug
         zq2RfFsQ8Nug4gTDZfTV+a2OZNBYFXoCf40SWDGDkSKanWBHi/lzw1UX/ZarFOHS0seT
         0apmCI//GO5/xKG65d4ta+6EeGE5lbPNlrWkkAUeuh2huEJ7bu2cLbaDlPHGb2XDrJl6
         KCSkOSf3hjrlrglm/E1gwMj+uaJXDTscXLbgqkp7zwKpxAgCz0miVzVqtMEc39olS4IP
         cjpNisEEDXm78ogfbynB4uPtPpGkn9yQSSOoitQ7BqVXQuH9o/ifEOlMOhNuIRMmmXgI
         DLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764777; x=1791369577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NxsDdgmSrXEpefiv4dLm4x7z/LQYERZV07k4WnFvesk=;
        b=j2Faz9wYK6tkoVoINv+6URM3SToeZn/YUitDmwyG6UfMftYYGQosjh6KxRzEWrER3j
         vhWSSMQp4erPAD6vPQA5iLA+A1N0/arNXiiJpUZv5jwddsCVnrkCoTWFCD6f5hX1UGKV
         7en5yg9BVjaXBCTkLieCSGNoIhS3qz9wGpX5lP+1vJElKJETERXK4aLKPFcXXoZo4XYJ
         5pDWrEOvd21NC/ChZgjMehEB7/NBBfg0wNDJHXIsftJvZANUmD3SMi1UG1ynw3ZAJdls
         NnLFYHENtDC7WAf1QhuwA+Kt9isZ0DSl+XpQR8nIFM4Vg5fObtk1tv+DiabX9n2o7le5
         taCg==
X-Forwarded-Encrypted: i=1; AKwUvBwF4ZO0ZkSIuLF+1mV6rGJa+dXK+L4aQclG5+0DW6+dfJiEBtOWJmnmb6MYqc66+3VyqzutJGzzMGJq@vger.kernel.org
X-Gm-Message-State: AFuF++n79/B58Bqqw/ZezSgn2lI0BngVgzvLxJGKzJqDp8OkFlnCa0xj
	qwNtVMQqLrSZUsWht831+f/oJrvYRaTXapt0BX8e2UDhgJy4u+w1Fs1HBHcA4HLQI/bMgMImU/t
	R0wNb4SkRwmsBBwlyq5iKEMdbPizosQYtVOKI2yZLeqryDLTQZpVZjp5jcZJd0BbJ
X-Gm-Gg: AYBFou3kVGbnQXpM/yBjHdgS+NQz1SpFnjK5Gb4gBRtxjO6dn3IOQhhHkdHSt7aiEUB
	jY/20M9DrXutA5fhQ8WT82GwlSIIgj7A6ZKIuZK5AhjzJx9nd7lgwfuFqwAiOHan71oDPdmd7gk
	Y2I/S26ljVI801BXBmkHso8+oaeDz/ofQgOHMoL03gD3cG/bX/tcniF5C8p/atOZPio0lLon1pu
	x6o8pyY6zk06q5u/Xeggbws2nKfN42IM16VYmEvbGXTL6T7uMInpBAFwDOKutlNrxzypsGmUh7g
	3QmZ7u7ij/DgbUnw46+GUtAjhsrLIQeI6mTglm/4hfWecQ1ZYYwUyqhcTsqcfM530hznh5klsJ4
	yEq2d5KCxMQTMRtv16A2Zcw==
X-Received: by 2002:a05:620a:261c:b0:93b:c6ec:780d with SMTP id af79cd13be357-93ca9880834mr131065685a.5.1790764776723;
        Wed, 30 Sep 2026 03:39:36 -0700 (PDT)
X-Received: by 2002:a05:620a:261c:b0:93b:c6ec:780d with SMTP id af79cd13be357-93ca9880834mr131061285a.5.1790764776150;
        Wed, 30 Sep 2026 03:39:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f80f5asm47036666b.48.2026.09.30.03.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:39:35 -0700 (PDT)
Message-ID: <667fe242-7779-4a8b-aa01-19277ff8d6d1@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 12:39:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] arm64: dts: qcom: sdm845-google: Move panel pins
 into common
To: david@ixit.cz, Dzmitry Sankouski <dsankouski@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260924-crosshatch-panel-v2-0-08d5c7bf72fc@ixit.cz>
 <20260924-crosshatch-panel-v2-10-08d5c7bf72fc@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260924-crosshatch-panel-v2-10-08d5c7bf72fc@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mJq3y7nveVzxmIxlTzXKFgGCsyR8xsnD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MiBTYWx0ZWRfX4ZSabXnlUdi7
 k7Vm+acuCQANLIWFx8csH/xefUvQdSnCbC+6I8nyZuzqVhD4l5nlkP/6+PpwDvzm3kZJYSVnYmA
 XzcH0xaXJ5Y5vjkgiO1JuFptrffOUtRpezE9uxwpXO1vzTqAPu4mhdo2wowbzjGcwhQsYho4+s4
 lGHtp1/2nnLbCgRxeOQgdQV0k70ykfvpmRUWGtzlDuR+8mopdlKsGONf0C+td329J8f2pRpaH/1
 4HzSPbtOqZGL9lZvNWrTJhCvplvKZUsR+4Qew2Qqjk8y2EOWByyQwSL4ufqQXV9/7/zgzoxPNY1
 nrQUTnL2iz7o3XPtC/8d5D9tln/c3Kq6/lVsJOhfKIIHU8gtCU3b6Bivb4VUSztidi+XwlzVNi3
 31gLxBc+Stgzebr4KgejqYtmFYct0g2dK+JDgy9Qdzig0b72ztxv+pUJghkJmGalBXl8MJOTn6q
 CwWb2t4RxZ9ZQBS3hlg==
X-Proofpoint-ORIG-GUID: mJq3y7nveVzxmIxlTzXKFgGCsyR8xsnD
X-Authority-Analysis: v=2.4 cv=BPImP1QG c=1 sm=1 tr=0 ts=6abce6e9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=LCudcodfsoFH-Sas34MA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MiBTYWx0ZWRfX3vWc9dgIT4pZ
 4OrDzcR39s3hcsLrfsCrm41KpWrExJahwyjCmuA/bvW2CgWei0rMAkeKveHcOtPpP5zG0utu4+K
 j/YwbglcarWoiP0+ITzoQVwYx3TD7J8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300042

On 9/24/26 4:01 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Both devices share the pinctrl configuration.
> 
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

no real reason for this to be separate but okay..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
