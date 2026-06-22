Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5F02DF3EA
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 13:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134593; cv=none; b=Gs8LTHXmjisaVyuMxbzgpYBTK2CMDftJmPB5Cy6u1v5NY7vndlNMgD/ot59k955GjC4uHLNvTFkzN1t913IAJH29ZeWH0HO3kygvFPsuBkEvQS0HBIafTn9PqprcDEZBNAMiui+wYwag4kof6+t/SswPfOZ4AOMkb7tRGVFhP1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134593; c=relaxed/simple;
	bh=vyiHaAQGthQ7vAmdOVzz6QgYwvMNWkcqzr2STeD+EMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LVUTo/tcpJR83rlM+zxcnoT2Iv4dml2rSYlKimv8XHMBEjtbMQgjgxVeKXbuY8kjDAJC5cO7k6t6m/YeDJW10lESRMKAq2JRsLa7/GEqcRYYxfAWAP5xky5qx1difP+B9WX4S3pBg/FlZDfY7KA2EdylLjGmhq5Fk4NE7S7r8Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CXmV8iUN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VurNz34V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CXmV8iUN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VurNz34V"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDGDXS1261030
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 13:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CphGddleZtR7hEzVNCHN3RYvRxeTDa6IKrCwZ8q/dJU=; b=CXmV8iUNNMjpfiwY
	gGasiUzLCR8+U5VzGes7i5Kv5P0noNtoD4UvQrKA9zcUUtSCOrmVsGYshLRK9LLS
	1zhebOrFndOr9zAJR6MWktOQLNj7kY1BH049lBVVvLEgwsMn+LT9pwuvf2NaqBkD
	kVyJIDepXDL7Qun87fY7GQ5V4WuwSquTvmny2eVM6LQAH12rZ7DQcyp0FqRZTxLt
	vYlQRb/x/BVTFPVDbZIBicaFDBPNhVYvT1ZGmSOOdX1Ua1185H9f51ODEyIkHJ3L
	2OfMAVdLV/WgEHyLSoWDg+V8eLnxdADxmO91wpPZ3ghcmQKBWPdegEUb3dZRNFLi
	GM8kEA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3eb8hm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 13:23:10 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a0ea6e29d6so3096999eaf.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782134590; x=1782739390; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CphGddleZtR7hEzVNCHN3RYvRxeTDa6IKrCwZ8q/dJU=;
        b=VurNz34VFt/ENc+ehRr4tgEuaYuHSO37FMTYAEYiHsWyjns+Mm2Jq6P5eGNgfAf8cK
         tfLrO/b0Jp8zT8yeoTRabx2Rbz0cUIev+rw5Ju/F96Eao4HU2QPTr1iO0ntLZLeCFNSO
         6/J6lSzZa+A4dLU4ydHojHK5ujkRi33EzNJZInjA9qUXzWu65IQD4YttaBwAbxkQoJ7e
         wBioKAbCI5Xaz89st/PRZPAVUoUL7qzozNlNHycU0UuDN21wnKRi/mPSl3rIgfTfYkk8
         ocp0fTIKZuV+sCoPa5wKpIFrTSX+lsT6FBdT/g7CU1THMaiIrs1dJaOoDuB3tDkTh/KB
         jDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782134590; x=1782739390;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CphGddleZtR7hEzVNCHN3RYvRxeTDa6IKrCwZ8q/dJU=;
        b=hkx/MZe0NNvvQadC74/V0+oWTtB8Na9jxintKVV6LwoM0McoNNhcqCcr19pMyqkjY9
         XyH5P4ceiCbjMpdWS9j1Z7xab3/6LtTxji629ZvKQiYVnzWPD4XYvG/hlgvoTyIGP0pM
         iVgV584qvpHVRF+lzHR5xb+mQtxl8PYXILPaT/OdUyfw0o8UezMUaHnpiIEspqnAuAfd
         dUP40BL4IvWzZ6/V2IhkGNksHYNpDDvwt+RCsVJvYBe/M8hJ3IqVstihjaAc0IAq3ejO
         wooWkyj2CLD3LtZGAHwdcKUIXmpEr3QgFkBjRGaJKJ9psvDmvRLIMr9KE0DPuhdnP3ay
         Mekw==
X-Forwarded-Encrypted: i=1; AFNElJ+diBM+ROSeJJRZad6Y/mvwvtVhpFUSC1lPnMYH5sPfouZmeLqJ/ElT7rd76ctnXmNXzZNFzizVXsKM@vger.kernel.org
X-Gm-Message-State: AOJu0YyPdC1qXaIN9gYub6P4e+fS4AyNzF+EPFrlnkgDW+U2vyJr3008
	0M+cBllxEWavQmtJSwhNwXEQeMaGWDYC2LV68lI9ibtZcJ/ChRLWWEf+qWqhBSAxJcwhOIZT/0o
	0PRVSwVAetwwC4AU3h+iceyD35RF1NnEG/6ysa0auAfCliFNn5snyJvE8OLKeJGy2
X-Gm-Gg: AfdE7cmprRuhnlirotbDJ3eGi7CA/5T9o9uAE23chg4Q/OEVHvEQiJf0U9CE2TdgtTN
	PPFVUtGiWssWv+s5KsxJCgIhHcHaWpjh1CiXC0vC73v07QemrAxpTRkqZa5Qlx68CB+jccEkPJ0
	O1z0AvSzaIQUD8yJioR9aCczppIQC4MXfQ5DzoKG17iPtQK/miV6Cl2FLBQP9tp9uwT+jWeWHTw
	P072KKxO3sRXRuK4KUzB4YTjUmJ74jVvn9odWloVA3mH7yDFaZ/Y2NJgXXlC5wgdgzI8ZRC63MC
	mzc6cmzUoaZKbSCmhby1fYq0Z22CiySt5GiCuFFUckTxkUB9VdhcF0flGkoIBLpef0jy0ErE6yB
	dOiBssOCpRtTCUrgYZDQWeMo+7200IRLfZ8IqzSKg
X-Received: by 2002:a05:6820:1999:b0:69b:5486:e85 with SMTP id 006d021491bc7-6a0d8935983mr10656618eaf.36.1782134590284;
        Mon, 22 Jun 2026 06:23:10 -0700 (PDT)
X-Received: by 2002:a05:6820:1999:b0:69b:5486:e85 with SMTP id 006d021491bc7-6a0d8935983mr10656589eaf.36.1782134589908;
        Mon, 22 Jun 2026 06:23:09 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e4a14d4sm362337866b.7.2026.06.22.06.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:23:08 -0700 (PDT)
Message-ID: <0a6f92ba-de8c-48ae-9025-a7570e53e453@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 15:23:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: Drop incorrect usage of double '::'
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, vkoul@kernel.org,
        dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org,
        linux-phy@lists.infradead.org, olteanv@gmail.com,
        devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
References: <20260622101606.485961-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260622101606.485961-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260622101959.37DB41F00A3D@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260622101959.37DB41F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzMyBTYWx0ZWRfX0FhdkTtfm+Za
 zD/wPTmhr+rtogDgL/pJzRYoUUONqmAN9G8B09YgCmrf+Y/SfyP4CSEA0DDgN1urr7+ViqTzWGf
 xnmmnv0hfnS1BMYse9lOiGZZ8nGE+VU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzMyBTYWx0ZWRfX2kXek8bsR/I4
 qGXgrQJtRMzFgeXSuVrEWKA/7G3kDK6lgAxwGSNzf5WukmoQp5O/aq1fqDniVEmZzS1b51Slriv
 44h9QMGNBj2Y8jIiKxMlPiwzAq5/A2yO//IsfL9FXR+pZvhZg7Ogx6GiEAOVAdbAhAJlTmGhayf
 ezcYEyNkB/OXq4rz7WOSbLoecz9fWPHhYAJIdLldB8sGc1ACO0WAFsnyiWtIgan/PTGwNheQE2Y
 acKWXRHEDvNDZQ6ggR1N/+CsMYyYDo2PfZBPJMQcggoKY2v3hExVXXi9YqNJt8+mjh85rZ34rpt
 56pRcfARRFqJJK+TXpSVimCG6H3/869SMPaNCxD4MygVeUhsEkpxJDdQr3V7Xu0GOeMzC/ZI4/o
 gclc7MMQvytX1fMvVKZInuxmfY0OlWduu7pdSMjOoJZqVDtWsVK4IMa4ioQqEYU9gS+Ke/QEEbc
 /8rvxR7/Zkn2aARZGKw==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a39373e cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=fqWYVyBuAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5ID31NFv_XroeS7ycB0A:9
 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22 a=3EkFFxAVN7Xjp7FSp-fE:22
X-Proofpoint-GUID: 9cCKddYUkIAMzzXYWwmaTnKBiiT_iN-b
X-Proofpoint-ORIG-GUID: 9cCKddYUkIAMzzXYWwmaTnKBiiT_iN-b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220133

On 22/06/2026 12:19, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Unintended replacement of BNF notation `::=` with `:=`.
> --
> 
> commit a9fdd0b065eb5b6394a9c33ffba0fd5194e80115
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> dt-bindings: Drop incorrect usage of double '::'
> 
> This commit cleans up device tree binding schemas by removing the redundant
> double colons at the end of descriptions inside YAML literal style blocks.
> 
> Link: https://yaml.org/spec/1.2.2/#literal-style [1]
> 
>> diff --git a/Documentation/devicetree/bindings/mux/mux-consumer.yaml b/Documentation/devicetree/bindings/mux/mux-consumer.yaml
>> index 9e2d78a78e409..769243a2bf046 100644
>> --- a/Documentation/devicetree/bindings/mux/mux-consumer.yaml
>> +++ b/Documentation/devicetree/bindings/mux/mux-consumer.yaml
>> @@ -13,8 +13,8 @@ description: |
>>    Mux controller consumers should specify a list of mux controllers that they
>>    want to use with a property containing a 'mux-ctrl-list':
>>  
>> -    mux-ctrl-list ::= <single-mux-ctrl> [mux-ctrl-list]
>> -    single-mux-ctrl ::= <mux-ctrl-phandle> [mux-ctrl-specifier]
>> +    mux-ctrl-list := <single-mux-ctrl> [mux-ctrl-list]
>> +    single-mux-ctrl := <mux-ctrl-phandle> [mux-ctrl-specifier]
> 
> [Severity: Low]
> Does this unintentionally change the standard Backus-Naur Form (BNF) ::=
> operator to :=? It looks like a global search-and-replace for :: might


I wasn't sure about that... and indeed this should not be changed. I
will send a v2.

Best regards,
Krzysztof
