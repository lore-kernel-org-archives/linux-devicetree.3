Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FD03793B5
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694675; cv=none; b=laioclPPtuCJKP7O0WIcbKeoes3ImqCWvu8273KsJyhTUuznIF2sLw+xYBr7iJb+h3kt8FH51yhOSGAS49L85S5voXoMRfK1WlQB26yY4A91XPZaAcN6wZjnZknD9XJrBRiS4w34dm8lun8HmtrCndD4KNPcziIe1ccl7cWybGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694675; c=relaxed/simple;
	bh=abJxTJQHPpctPsOEEhz5AIH65tAnkE/T7tTw5wzbxKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UzooXOmK6UpWlPzCicRT2LgCrrt3zK6nVJRnlfpGCDVJGbN2oFV9eAqwkEFUn1ZGCQOxH83HDpVT49GzSwrooT6H9amlKF66p8bE29294GTTra2C3QeNzuhjDNaao3pPg80XNTBBWszmFSnS9OBa3K20NEYK1wEbti2pZvG9owk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LJDS4R9m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YK88d7Mu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LJDS4R9m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YK88d7Mu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UlOZ1607946
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+CAlI2mC7CrECZNWLB5YtnzVTHMZtiM7ob2HvOlYUAs=; b=LJDS4R9mZSghWY4D
	fHGoHIawVq0Djy1sXXZU0oWqiD2KCPTpelkOU0txt80njTc/hG14s53TyAz4ZkFg
	uQ65qsdXemJFrQcVaxMX+uQ+liwJbKrX5DBwXaaTjSSZitScauVMRtY4DqiWL6Sl
	gyHBncxufhkJ8f8siKowiF+X0MTX+C5a1RivEl9Wwf6jpTTENiwXapwnZKA7uuMx
	X1dXLNM7BvzKIkQon44VwQXlVGcO3yYjjEV21R4Z/mbiGbVk9aV0kPhH3EhY72P+
	z0EVrc5lS6RRytLS6o2A4k2/vMn1qNa+LmoWrIET0tH0OgNHrfN5PfblvhwhDo/c
	moqZyQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef22s7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:11:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-914b9d0162aso63273785a.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 04:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781694671; x=1782299471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+CAlI2mC7CrECZNWLB5YtnzVTHMZtiM7ob2HvOlYUAs=;
        b=YK88d7MuV+zpT+3JGwIkC4qio2zDsvfmcW0+iJes+1eqFQ0NgdfDbxDG9mW9fTX8Wx
         NicwjIkMTJ0lf+Cnjxa4wLnWxrWrO5/2d4v6pYpENAArnRDCvlUOqoSgbyIiiskKeVkL
         PXcifaUyQ1xkb2N731Br1/Kgb+tEllqPhvaFC+O7q7xkLx309EtwIULfuCya8YolBBWg
         tgBYfxhuVTXZVJ7ldkRslDEt5ppmJW1KaUmx02hiGKPYVCTimfLiNvpGmlvGykTJ/4NA
         xjsMZbVN0OfvGHJSWeRHlG/aE6qcK05bODXqiV/jx/g6Rhq1RrMvL0GOjioI8fvQxY1y
         52gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694671; x=1782299471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+CAlI2mC7CrECZNWLB5YtnzVTHMZtiM7ob2HvOlYUAs=;
        b=tJp0fT8zJJkBfb/FDYpbPeQS46QJwdXY3eFvOaf/rby7c0XuXCHs0TMnZ2H21lMD/j
         zaMdPZIthH33CocZq8E1fDYPWrBpWvmfKnL0il0swN4nG6Lsj0yj3bvwEFlfxULmKu5a
         PbhD6SFsOBhMZ5EU6bZq4I8eOtIymc59jMIZ9oO2RZDfsNjLoE/OSW+TLx23uHxyA21V
         kJvTU3A4GVd6av2vR/aoxu1R5aYQpQOVcdJLQEQ7jz+rhi42F1ESaymbBE5zofwRmQcu
         tQsNvuWJCFQeZCZXYhdMc7i0PgAg1s7/c0mUw1LOCeRuGRd0e42NpvAQg3DoeA/36hFV
         ADVw==
X-Forwarded-Encrypted: i=1; AFNElJ+5BD+ZOi7odcpRsnPIrqAf3aUr/Dx16GXmuULMxahKaYFzl4OQiTDqxzpwHb9dyKvJyXhKJCvHjUi6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ZmoJVtpHsTStk1fofMC90R0yifSdnxU6gH/IhfnY+A94GZbW
	LolDnQ+Wa5ksf+MV1uD11yWVEpHlc00DSXgV2gbCeza8VfsIBeyZjFCrAPfDgl/ZZQus2auq9Yd
	SALApM4vMjBunMDAAWADncg6U0xWWZAf8Fw7qFkLbuMXL9/w+3oPjFj3cqZHZ0aE9
X-Gm-Gg: Acq92OF/E1FtfQmpt9jbN2SGBREF82zTJZUbX8MOCQTsMTShAOp4ECNF57y7rh2+P5h
	rYiZONiuXxPbDwNfkfVGPu7U0h5Q/Nat18GaIOxOmtCZIkz44COZzD0HulQSqKqrRwUl5Qci1gc
	WTAORJibwCfPIrYmxUkmXLNGf6CyL/EitxTffFb5rQYPOK/3q9SmAePc/w2a1gVyUewKockOwEn
	twlBLHoL3+ujSYf9VjkW6k9XPup62bfDcLYNmtmhe+7l/L6H1jsuw2WXnIU8jMhAPKSL4ew3om9
	NZ54dyyto3g3jcpw3GG32T/KynhGzNAgmBhpoxEW/4SxR4YkL/euOl/ZolDK9CR07VLQNGLsCxd
	pz+ZusY5Ehkri8eUYwOT/1BgRrd8A49sSiBw=
X-Received: by 2002:a05:620a:4081:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-91d8d5b2aacmr355357085a.6.1781694671485;
        Wed, 17 Jun 2026 04:11:11 -0700 (PDT)
X-Received: by 2002:a05:620a:4081:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-91d8d5b2aacmr355354485a.6.1781694671096;
        Wed, 17 Jun 2026 04:11:11 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6d934sm783135966b.40.2026.06.17.04.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 04:11:10 -0700 (PDT)
Message-ID: <cd0c493a-ac8c-4ae8-ab41-9fc8207e9834@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 13:11:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] arm64: dts: qcom: Add Microsoft Surface Pro 12in
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260609145906.40854-1-harrison.vanderbyl@gmail.com>
 <20260609145906.40854-2-harrison.vanderbyl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609145906.40854-2-harrison.vanderbyl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNSBTYWx0ZWRfXxaXCYmluzVZr
 Dseomc5Q7lg3sIcDabEde2IMQCgGc+jlIpmV0eVHjqI4GlOiijivoMdglkSAdmfZjJy8KUi6wnY
 EY6BythQElafFt6vtVS1p0O/D90y7Ng=
X-Proofpoint-ORIG-GUID: KJgWYGQJ81M62VPcg19CsLtjc6IyYnRs
X-Proofpoint-GUID: KJgWYGQJ81M62VPcg19CsLtjc6IyYnRs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNSBTYWx0ZWRfX+2YDexpdQ0lW
 gDSs1I1QvZwp5p9E5DZitFf23MJqJOh/IyWsVT8z6Bnjn+tZtG+oEDCxMPdjdwAj5HQlxzPBJoW
 fDsGCQKacse1mUVCrHnqvhflgR652kPVhntph5laXi0xZxyw6aFrirrDuBUOW4GAmOyGlIvOeEz
 CC0I/c6WMxeY7wKJDDOW2CmL8Y6AFF2CapMAfJ4sxEJwi0oWxFU8QkF0J8dg+NhWZm4+3zO9+D1
 Vaj5YBh23Ht1XUfSDQ2DaSo5kAute0iw/IWTdLhA7cAAhPByaCp+UJagSELF4ol11EZftgUMst5
 xS3bHRvxQkHsMFR+Z5Rn/Z4OO8Xdzbck5rJji9j8meSA1Sol/zm7mOMhEi5mEfcxFv02DuwUrz4
 jro2y+krPQGRKU6vBbPF9Fov53aiqkg7oU4ZZjjhwHWayoCBJ+9Fd/c6WEhufQ9sDK7hYRrOvbZ
 EhBYI1sBDKSIYU2rCbA==
X-Authority-Analysis: v=2.4 cv=acpRWxot c=1 sm=1 tr=0 ts=6a3280d0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=NJ6gOXVS0vVz-tHME-0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170105

On 6/9/26 4:59 PM, Harrison Vanderbyl wrote:
> Initial device tree for Microsoft Surface Pro 12in
> 
> Currently supported:
>   - UFS
>   - Touchscreen
>   - Pen
>   - USB 3.2 x2 (DP Alt Mode)
>   - Audio
>   - Wifi
>   - Bluetooth
>   - CDSP
>   - ADSP
>   - GPU
> 
> Not currently supported:
>   - Accelerometer
>   - Front, Back and IR cameras
>   - IRIS video decoder
> 
> Tested on Surface_Pro_12in_1st_Ed_with_Snapdragon_2110
> 
> Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
