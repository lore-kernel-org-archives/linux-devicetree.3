Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A6433CEA9
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 19:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775589673; cv=none; b=hwIDORKPChqiDDhg+3sLyOvhfDEJ1MhLVjlaCvy5e4elJrUfy2xdLyR4y2U3fwpG5Av+frPzRtjbu9vDkjML+HlEuGzi70qYhAUEI2hqye2cSYV9SuJSdJ5F7FX3E4g1GJEggs59N3Z4X3fa7RkKEZm33g6vyzKiNv3FeqpRo00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775589673; c=relaxed/simple;
	bh=q5y/k9WZIypIB3u0gg/0rC6bgmTZvmA+5L5nSV95VYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A3KPdpZ57pyK5klbLDs4EpSarlMXqxM6hfAcSpe1X7ygd7lBJLqKFc6UolEzKU57wiDebYuNok2lHAtYoH6/N+t2Ae9BZYU5VfQNw1O0CMH8HybXsUNfPAoOGg6FUn9D9vYXEVAWoaRlFsNWnXyhv1ZB+DtbZbBc4NeuWmyTzjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0eF0jTx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJXeOKSj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h0eF0jTx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJXeOKSj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637DMZ1K3815569
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 19:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6rgwYZsPuPyDgp1OqiObHlQX0/OsVr8paljJSmYmSXI=; b=h0eF0jTxs3PI5xqj
	fnZdekjuFEQfWxAgBpmNQxZCqu8FuBdQ/aqG37GHH/aEQlsPwBwftvJtEWK+WfQE
	pCpMgx59njRDqQvF7+xROM+pK6Ru6M6U4ebWVXneU+vcKc1Sa6hSckzpUwWkyr6g
	WVcG+T8CHh2h39yYu8TgI+14Gt7HkotYnq8KvGAqYUEdcxwePGc5vbALZnquH6A3
	7NIKHhmetX7IuKEOhCr93cphA20SWeGLMR3RzfuUHuJ9xbNKJ5ajYPgEIsShE+Oy
	5rdfbvEBJm6KCBsECuoC7VGzCoEMbdgSa6ISZOpZHA8dFgKsCIz+wZwjjckYWpQG
	3owGCw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4vb9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 19:21:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b0c30b51bfso117788185ad.0
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 12:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775589670; x=1776194470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6rgwYZsPuPyDgp1OqiObHlQX0/OsVr8paljJSmYmSXI=;
        b=LJXeOKSjMOcE/elxH3/m7/s1AAoAYi2/4ldsreC88h/qPn6QNOSMBQ+TRgCPmx3/9j
         jHfw+k+6VKbNq0CzY3W7B4Zj5XnpymBnB85F/MjM1l6DwWSdBdsWlbkKp9cSF1T6PkSv
         rKg7OlTOdiN31Jvv5JGwBzp6tAdJJLk09dI+aBqMtWRWz2d19uGlV9NWrQHZz72X3swv
         kfYSD8FUbP4YPXkn2zclNp8o89aHnK86BjhtCTGQCbj2FG+Tn+jRlrpRyT8e5m9GzIyN
         KDFogYKjvQfZvxKoRujWHCZnhFkUhxW2r9FtVmRUHDwi3iqiyaasyvoCf4YYSMfUnSu8
         eOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775589670; x=1776194470;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rgwYZsPuPyDgp1OqiObHlQX0/OsVr8paljJSmYmSXI=;
        b=n+WAhhHzT4NPkLrEupJH1UNtCJDxfMoJ7XaSRO7S6IxwOKq0OqQzP6MlRxNlirpwhB
         Smtcdd3qFxuYvDDE19i3ctFZu+AkPrpbkF0Zo/tfZfdF3qLa+GfZs/HQM7JyfmVZQeFx
         nktckTrRHTzMX7UjQypU2a4Pj5l4n2FP15IuxfJNfcUYf6nhIkT07Nh5Eu5h/bSJryrv
         uCPdMZHkm2ifrMv/WvPgznYrt8Iwo8emCsZBGjQ3jJzfCkVnxqvNlK5O+KDKnNYcUzAm
         /JEumJ5eZM7HFbivqO/CdjcbcgQ7CV9mDTBZaMGuJWvFkn8wq8dcmW/BXz7MJTKJmWNG
         dSzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsRC5VP1Rn57Z9uAIAXxshRg65chJh6bTd5xSTelPI438tTMpstNKIQs9gltjWN/yTtQvP5uDv6r/4@vger.kernel.org
X-Gm-Message-State: AOJu0YzI0PX84dDDedxjxXSAa83JV5CXHMoSOdS5jTr7ZgHatNou7gaq
	s6Nge0Ez/YbRqPDVmbkXfdg9L9Jq+EMyAmCBQ6E3/bqfT/D7Noo/BajY21IzpCzlCylPXY3bDan
	g7+tFT8bKZzOKk2ivmuiXmnuQFIh6QwMfxDfDHGQFe7UUSuQmPP/JORzhfNGfcl4I
X-Gm-Gg: AeBDieuEGSWjysSLPMZ7xK4QJesbYFc1SBfeubTXE7vb5YdCWRPqPayX++9k/72q/DR
	PepA9DJprkFY339YbiRSrte6fgG3I2QqpwmfIuAfTkHngDkhgQnHFHh6KfI3uoCzy++Uk84ljgm
	AkuiL+pq8kunCZULQNuIoH9aa4wU/N7m52bm9FySBR8CYzT1/QX9cGD3WbNYY8owmMNkK5B3PzQ
	PCVIFOX1rYD8lshNLClthCYYlRlacUcWwsrF3gz2+ZFn0eMnzS0cKEwFat/h3gN5Z+JMLlQhVpL
	6UrwUhDpeJgvZdne0bh9nxmYpaF3jhXLd2Qzm/KwARauWbNypjMJeFv06QCECuUw8dRvrLIk7Ab
	Ix6bKkfvkgu76Xt7pSDTQjglhCM79MV3HkKT+wj6vz7sLAQ==
X-Received: by 2002:a17:903:22c6:b0:2b2:4310:8d1a with SMTP id d9443c01a7336-2b28188a1cfmr192326765ad.38.1775589669816;
        Tue, 07 Apr 2026 12:21:09 -0700 (PDT)
X-Received: by 2002:a17:903:22c6:b0:2b2:4310:8d1a with SMTP id d9443c01a7336-2b28188a1cfmr192326385ad.38.1775589669313;
        Tue, 07 Apr 2026 12:21:09 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.229.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749ce29esm193875385ad.81.2026.04.07.12.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 12:21:08 -0700 (PDT)
Message-ID: <ade66e71-d24d-4b19-8a1e-951fa95159db@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 00:51:01 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/4] arm64: dts: qcom: Enable GPU & GMU on Glymur CRD
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
 <20260405-glymur-gpu-dt-v1-4-2135eb11c562@oss.qualcomm.com>
 <ui4r3krzvd3i6kjdozhmmueejdqpbnbo5wfa6pwzjolcse3eeg@3u7bdphqv4iz>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ui4r3krzvd3i6kjdozhmmueejdqpbnbo5wfa6pwzjolcse3eeg@3u7bdphqv4iz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d55926 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=oIjhDLspr5RTlLLUpj0f1A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8uCpHmCzy03A3Vi_SyMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: T_LUuBB23f5mWyQv4TJARFm5wAWI7nfE
X-Proofpoint-ORIG-GUID: T_LUuBB23f5mWyQv4TJARFm5wAWI7nfE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE3NiBTYWx0ZWRfX35ILI677qgCL
 hUWGyLhjJ4+Yc3HT2PCjHcD05Oo5MqN+UbcjSyz0YGXYzvMwq7BBdbm3O7dOkS8hV9OMkFqSxjf
 O9dQQvhMpgS0ZXgJSZXqIrDAyhjG/zy1n1I6Okcibt58t78JG3EY78iftJdcifkcAldFdQM94ck
 w+mJ6CMRXvRdJz7KqCx4soBqU4Z92iwYq2jCB/s6PhlE8TwCtQA3MzBy0E2hNG4IpNQ7/HJisPy
 VIiEbH2szUEzyMWb+NNiuSo9kC8Si4YJCGPk/yLMWui1o4OGL+XBrDK4xTdxc/ZtyihLgECHKW6
 Ye7hc4Ix86/ZdxY8p+bgx2BQpN/wkTivvz5iovOXzmZu0Db2CzQ10t/FxC04HHljRAZ0hvrh+N0
 CDYW5NPnRgKDWLnAizkfpQryca2hHWtmvFGcxVZg54lkJ79nzs0wYd+8K4kQ85RXXQH1MJI9t2K
 WGvHQNO9NvzUISOJm9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070176

On 4/5/2026 3:14 AM, Dmitry Baryshkov wrote:
> On Sun, Apr 05, 2026 at 02:33:17AM +0530, Akhil P Oommen wrote:
>> Enable the necessary DT nodes to add support for GPU on the Glymur CRD.
>> The Glymur CRD boots Linux at EL2, which means it doesn't require the
>> secure GPU firmware (zap fw).
> 
> Is this going to be a default mode for other laptops too? Otherwise it
> might be better to keep ZAP node enabled by default and disable it here.

I believe so. Anyway the laptops are hitting the market right now. If
anyone reports that the EL2 is locked down, we can revisit this.

-Akhil.

> 
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> index 51ea23a49b9e..a579df902323 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> @@ -110,6 +110,14 @@ vreg_misc_3p3: regulator-misc-3p3 {
>>  	};
>>  };
>>  
>> +&gpu {
>> +	status = "okay";
>> +};
>> +
>> +&gmu {
>> +	status = "okay";
>> +};
>> +
>>  &i2c0 {
>>  	clock-frequency = <400000>;
>>  
>>
>> -- 
>> 2.51.0
>>
> 

