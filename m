Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C163ACA41
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 08:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856801; cv=none; b=qyll+2dCZUzXEssh2jUbfU8i7RuvRPpuj8NRtAIi+MhPVE3cw2lX2tyD7ciDVulzR0g/JYDUx3pZq1weW6TXCZNSkX0y9WJbXxmAkhYRd5LlEY4IRTSBTsIx5MroxRTanAfd/g5kdugk9wDKT9AqQtkzOMHoJ8chPGDyr1qnqUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856801; c=relaxed/simple;
	bh=xxMqH+7cUJJ3V8puKUGYPz0SiDAyC+IQiFhBdon4ZKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b3kBEZRzMvdF59i+V1o7V5N0xPH7u8H3aK21rcGWLUPxei0e/AZQ32t/+78QYT1mO7cXCFdirWDSe0cZMeOFA/m8+tWVEsI8lWdYambmX7GJLvlau4CZFp8CTS3ialml0X7OSnBWmkqbccq7Qw6UIbU42I8k8BRwBXlIeZCpZzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mm9l/doq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kasm7Rkk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mm9l/doq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kasm7Rkk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LrY42154198
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 08:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	liMTX+5W1ZhScG/VtPCEXcVGP5PSRJI5VVuw8P97m6A=; b=mm9l/doqRsf8Bc5n
	wAGT9LOAROOQh1pUSyZ1rIGXOuVoDdTqBSZuFjBsS0L1XeH+89x4BxdgpZaKrbx3
	iVR3ajG/3eXLVOoAcN+kESDPCW7w8kEdY5Hsfh3oda6OOKtjDoQQPYKxaWLb4cy+
	nL5VIcrzm6PCUdQnGi2dnfeKovg1d985Z84C3YcAqKUvcbAj4aI35y0aCWqhLC7r
	+gRBgwXk/xZMNDRGywoyR0YMA+ifM5tSprEg+fB4BpaGYzYWXSc47cSNi4F9VDDI
	N1yt4KVYT+uPRUhdNxoxhDGvNLqpIqZWKL3aVZEvgw3KYz4T/qUc4hcOidwt8Ete
	n+gapQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rwjh6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 08:39:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e98e74535so73201676d6.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 01:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856798; x=1789461598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=liMTX+5W1ZhScG/VtPCEXcVGP5PSRJI5VVuw8P97m6A=;
        b=Kasm7RkkOEHrh1QZwq/3buqccc2uKDdXwiqi/rA2dXBCW2pjWw3XjiQrBEdyBzurLW
         2ceiDbCRNhPbuQYFQoYAcnIKpexULt6xZnHUkOHbLDENAzR8F7VUfJSWE4abq1CQF4o9
         gpicHRFUzp4sSpzkQKwV3izSuv40OMMHMwHT2ugD8v6CQOSht5OqV4VnIdzSvO1jRCay
         CiL8PmoACsYdQ25z05sXSOo3SZc/VpkHf1GnucEwHXBE3NOLDyTBGXGTdlsWj7h+P3ub
         VWTVyTs7JfVZWf2kOnEXsbT5aQ8saqQ1UK5+ANLGxSa0ZdulLBa06mNfOHPkUqdXuLge
         LaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856798; x=1789461598;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=liMTX+5W1ZhScG/VtPCEXcVGP5PSRJI5VVuw8P97m6A=;
        b=aWhg52ZRaE2M52vBVV/groJokO8/KJiLMAPnwvRKgtnldoOx8SVXdbaJc91mXoaIYt
         boNsnDmpnnv1OAh7RgV4Jm6Btj3cKq6xeE9PR/1pSEXvz26uDMbtmGSZy6odGEsSL+iT
         psH4wNSd4N+BsDIh5deqN8q2/XHkFCli+PG2/yABzoZQ+YiDjtqJc+HqSiyNaz0UeQUH
         qurlh75As7SvhYQy3OfzO/ToHf3EkOYrqe77LFG3xw8IaCQp2A8Ol7zQQvKKosxBAUfH
         cR9WI2Jrx5QzhIJM6Eh1e7kGrQ+uN5C3OD50M++WXeWfe834kBKBgX8kZolAk+r1EVHb
         Pl1g==
X-Forwarded-Encrypted: i=1; AKwUvBw6pRubAVbt3RhwDa7XH6tomYqzBovMwIbEDsmC4EZVFxIuSNIAg5XjfqBkNcTIcIBJ0TGYxtmrj9HH@vger.kernel.org
X-Gm-Message-State: AFuF++n9g6roh+cbbOt+cQiXgE21n4T21poqWsWhVmFf9ZQIq2zw0bP3
	/BwLohLBo5PtEodY4t2tIltrxXes7ZXk/6C8yJgyrbIE8bTDbo7+vkgvM4XCHI1VDXSMmseTAmX
	nCctk953ur2Ddc7Wpf6+YJKoDvgsd8nqMn5f9SB4NV9eJWrqYi8YjnyY9QzGJ5yaC
X-Gm-Gg: AYBFou2oxilpIKN/QKni55ztKpdz8YStdlaVZ0Rf7WwtU5tkWBi5Z7dlxoEBf3tNn3A
	HLcSg9xl+VcNLHfzGp2tey1L2olC9M6FQHv2dlSJ/ONe6EE9YVRfnt3pGdnULsurfGiSrcPgb0I
	l1j62whweuyNVNCIR1h0KvQ/UsegnO4oJ4CVo+qOJuzXHUXI8dJadt32OoEP/L7NTBr/xWg/2PB
	KbnLywwuu62CO5aSlsJltTjlZzCWRNqTmn3ZoqtDfwReQis6QUuWRUSprsPvJcaZ5Z+SN2G+9dH
	OsF/BTlZM9QQWBsoLvdJNqDc61UKesLI2Jzz1x08Ofj4v1wZbHYWey51wA6NtjjkGUx5YdbgZqQ
	K9chKw8O0JcDJgjTeB6Fgqyoa/eR8
X-Received: by 2002:a05:620a:2617:b0:939:7683:33d5 with SMTP id af79cd13be357-9398037b951mr3141906085a.19.1788856798441;
        Tue, 08 Sep 2026 01:39:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2617:b0:939:7683:33d5 with SMTP id af79cd13be357-9398037b951mr3141903985a.19.1788856797991;
        Tue, 08 Sep 2026 01:39:57 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm377307385e9.0.2026.09.08.01.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:39:57 -0700 (PDT)
Message-ID: <6380c418-afb1-46a3-837c-582175d51cf5@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 10:39:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] drm/msm: Properly handle msm_ioremap() without
 name
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
 <20260908-drm-msm-hdmi-fixes-before-eliza-v3-5-dcf8956878ca@oss.qualcomm.com>
 <51fceedb-2dbb-483c-8eee-9409ca61b1cc@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <51fceedb-2dbb-483c-8eee-9409ca61b1cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ga8nWwXL c=1 sm=1 tr=0 ts=6a9fc9df cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JWgyNuB4YE4UXSG_TMQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5MCBTYWx0ZWRfX2p8iRfdluisa
 v/Ju9U/5+P1sus47zttNeVI6UHyhk2Pv9UbGwkvFgAu+cGNaRZXCcTWX1+9q8GHwE3zfm+TO/aS
 2AblrDHWL9n8B9Vi/CRunb4J5KJopisaQXqrhNkrs2KEIQBSmVCyWOr81AK1CJr2B8gmb9Tj8Sk
 o5rcgluudtVUkkPDifQVFvayrxZ5poIQywn2E8ino5ZCMpOIYTx+VV6cjdn9NBx5hM40HrcT7Vf
 5W39/Zu5xlAGv40PxW+zwmbIGgkNhPAT8km5VZWgbwgstzVn2Cdu0SMFT5ALfNNX5uyN3q4SGzG
 je7VWvFGBiuf2X6PaJV0wa8YM8mXs2svmrT8BDIq82GW9CMeEXpkpbv+87W3xaDaweJaShYav5y
 gKomMpaHH/l1tU7zJXfaVm3itlTFZlEmXQiV7zuij0Q7tYI9iMAIBOan7OqLFjxB2hJYDPZyC+w
 sFLGuWC/QG71Gg7E9lg==
X-Proofpoint-ORIG-GUID: VpYABGvb82wv8GByUec4euZLbwZJSrlH
X-Proofpoint-GUID: VpYABGvb82wv8GByUec4euZLbwZJSrlH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5MCBTYWx0ZWRfX6oB/KCCx8A2W
 Rk8aj7IfMuPOf6f3yySHjjBJCDSDXzkPES59ekLnnrjgjkr3fBYltBbzyXf6qKl5/W9i02ScdW8
 M2MygDdnRj2XkIh3h6+JSCA2Fa+uuCg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080090

On 08/09/2026 09:59, Konrad Dybcio wrote:
> On 9/8/26 9:10 AM, Krzysztof Kozlowski wrote:
>> msm_ioremap() accepts being called without name of the region to map and
>> in such case maps by index 0.  However error paths still use the name in
>> error message.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/msm_io_utils.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
>> index a6efe1eac271..0a4ac0fc5fb5 100644
>> --- a/drivers/gpu/drm/msm/msm_io_utils.c
>> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
>> @@ -77,7 +77,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
>>  
>>  	if (!res) {
>>  		if (!quiet)
>> -			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
>> +			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n",
>> +				      (name ? name : "#0"));
>>  		return ERR_PTR(-EINVAL);
>>  	}
>>  
>> @@ -86,7 +87,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
>>  	ptr = devm_ioremap(&pdev->dev, res->start, size);
>>  	if (!ptr) {
>>  		if (!quiet)
>> -			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
>> +			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n",
>> +				      (name ?: "#0"));
>>  		return ERR_PTR(-ENOMEM);
> 
> It's odd to see one being ?: and one being open-coded..

Oh crap :/

Best regards,
Krzysztof
