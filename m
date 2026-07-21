Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227694D9917
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647058; cv=none; b=mNCqgwVKbQ8p9wv0UmYMVyqAZ3GFuKZVV0EJgDrav3yYS5oGZlD6u5fZP3kzIIMpUWZ/0CUIDXcbDuOVnK/JcoQ8jT39+0CDh1NgSG4nJWg3kucsLPNu9VXdzk72TfV/CwQJXXsOjG8x/cUktYqyOUSb05hKNyatmXNo3vrUT6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647058; c=relaxed/simple;
	bh=ksWxH9dUqIa6ktvuJDFiOH4WRFGsOUuRVYTVhbOHxOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ObSNnKl/DW1tcljRDGC9XOJw2Pw/pzKy+8QhKSFFVTOxv87TVvhAf9jLTqNr9A8ZAbUVNo18mMJqU0yDQxPiG6g5BjQHbQXUS3/u5JTE8DLvB51INaI5N/NC6Isd0NcXfl8sXl9o3XXVWHke33D4axNGXB5AZJgO0WCmWFgW2To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OctVMXLX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3mnwK2z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OctVMXLX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3mnwK2z"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg6Hv2962868
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7woIbGwwNWVT9Bze5l43N6LKy7ienkQG9HWQJ/0XQwY=; b=OctVMXLXfyGj4XbF
	zgdbuyGx3v5fwEoaeFMMZnkI5ggcponb1oOZ2Zk51h8xyJkKvgKpKFSB72GSDeyU
	vSnMU4xQ7ZulRRiFSNm3IkJYBPQjpcNCtpi8aqiGeC9s7t7XyamUXlo8Y5IO75X+
	s3YmZQPC8M7uOs7Q9nSH5nXV6IkmQB1QA/ClYmqXFQb3avVrXD4BQZIYFClRRsVl
	w/Ptj9FeG9SnsEKdwo7rIMaQRDKXiaAl+Yk3UTVhLlJY/F/WPzMXsiafytZPNZHT
	xiZ9r7fEU4bF4zWSGWQb1DQuvvqLFouRdoFPqonqo9NQ46+nSj/jYyBAqtpBHyKK
	TMynmg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nssge2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:17:36 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bfc08e95ebso551364e0c.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784647055; x=1785251855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7woIbGwwNWVT9Bze5l43N6LKy7ienkQG9HWQJ/0XQwY=;
        b=L3mnwK2zJiNXbG+0Hc4Rij1uLqispRruX/giOGX6qO1XDE82xAawmYpD7d9jYOEbZb
         jyIyodGP07S48OvHOCj8i/Cpd4j72fZtcFAqJnORoe/KHMw+818ySIGvuDvRPssrz8BR
         zqacyoNeyklx/n/vJN6BVp9Jiy+ZLW7pBdu18NfldmMakWZFPLFN84WNw+mo36GZomC3
         /qj+Q7ba2ZogCMKz5gpGbyM0/c7cxPHZlETV92LxAdZmsivNOVjFJknJRC4cqH1D6G2Y
         Wfh93ht7U3osX5jI3KN0rU4ENzuKmJGFu0ccA4UhaOyjOvj5j9S4DF3dj1O6oeenbdBe
         yT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784647055; x=1785251855;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7woIbGwwNWVT9Bze5l43N6LKy7ienkQG9HWQJ/0XQwY=;
        b=kfima+40t9n7brvMD6k33vxSqOsEHm18s3JALCUSR317Gp8/7tQv1HOxXLM0fcbdLb
         LEO74SPvbv0jtw4V2kiU0PkBbtyH8YNT15+ogLerFM8QH6DBkpwqbQ/hy9MhYl1zt2q/
         mPbgslYMeFJtFlAwnbLu3EBzDlD11aMqn0PlOFSofHKzfqHmQ8b3UTfI9SI6qZBFRJGu
         jmVzdonvJljM6Or1WnfA95g1Jlx2mcMqlN76CcHd38RWf7OJp/kpTYJHh/Wwa9vuCb0z
         dhdBdegDJBkqoTUKsK+UJiPOvizJTLn+nhf4wXq61KQ96iy9i/QTCyvhbG8wNIdY7EIi
         ec1A==
X-Forwarded-Encrypted: i=1; AHgh+Rrk67r+B0njRZhCKOeTqscHf4ndFoewl+nSEdm6GapUsRtb8yzXBYESOzkzUQ4XlspqdF1XEq+psYMa@vger.kernel.org
X-Gm-Message-State: AOJu0YySsXJ1ZjOUb3LfVU+ejuONPUUF3BMvGKhD0KgVIIhtzuCU34Cm
	2rKDA0Z7FXvCrAtNg45Z8hBoDtxGjgd0w9zlDKKohR5W6VF2uO1VZISymtVqbGN1UpEIe84ALfN
	nSJSNbEAHiIZc9F3gUw45arJl9D32Wz/scNgRxntJfNzDXXu5VtKEWlAGyFD/OFkG
X-Gm-Gg: AR+sD12GNRyvPx/m7u99YGLU3VOWsYqojLQmBJRZJqfsmXPOBHeN+PanDBuv4JIxfPV
	IefoCMXbfXcbOW6a3Cj3q9tEyJ3//tIXvOPAUX73c5fkZaB+3yi8L6L/iKzKVPdTiFmf9rsZgmZ
	80QMkbLZBrAj+42PPgh1P/qCeP2uzYHeMqq1FGJu5uv/zTArFFeEycbTi3r0cdhqkfuiY/5/EnS
	2AxsMBQugFAr3wt6dCQl5qKfJPZNDIm/NXgbMkPk47I+wuzWdiWZrRbx01j/9+9dDk9ETzPug7z
	RW9M+oHnXcTeY2AzjHqx6FuvaeyMHV2Qd1K9qJ0r8+4UWeOttDylrwbOnogqo+47Z0rJv7edEnV
	gj44PQmmtKsNrS541vreVCKUf
X-Received: by 2002:a05:6102:5a90:b0:739:64ad:bf4e with SMTP id ada2fe7eead31-74abc8ce888mr601174137.7.1784647055381;
        Tue, 21 Jul 2026 08:17:35 -0700 (PDT)
X-Received: by 2002:a05:6102:5a90:b0:739:64ad:bf4e with SMTP id ada2fe7eead31-74abc8ce888mr601148137.7.1784647054939;
        Tue, 21 Jul 2026 08:17:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f345b1b18sm8455a12.2.2026.07.21.08.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:17:32 -0700 (PDT)
Message-ID: <c293d9c7-bdb7-4303-80c8-404228c434d7@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:17:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: qcs6490-rubikpi3: Add audio
 support
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: andersson@kernel.org, broonie@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        drake@endlessm.com, katsuhiro@katsuster.net, konradybcio@kernel.org,
        krzk+dt@kernel.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        matteomartelli3@gmail.com, mohammad.rafi.shaik@oss.qualcomm.com,
        neil.armstrong@linaro.org, perex@perex.cz, robh@kernel.org,
        rosh@debian.org, srini@kernel.org, tiwai@suse.com,
        zhoubinbin@loongson.cn
References: <43944722-3eeb-4e02-b3a6-6251d5fc78af@oss.qualcomm.com>
 <20260718094147.413795-1-hongyang.zhao@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718094147.413795-1-hongyang.zhao@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rBQxVL3xD_1JMUQT4s9t_sghCljUpqDf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2MiBTYWx0ZWRfX0FfND4E/ciMf
 vsAujziR5/NCgquPd+ECSgeAHS6IeSfRxcbhJAIud17nYDYvIUg4mu4UcXPbE1cvx6FSGqwwP+S
 cQhWNMNvMaGvfE1xHx2/lBoMFkeI2xs=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5f8d90 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=1V3AF8-yWdl-s1szD1IA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: rBQxVL3xD_1JMUQT4s9t_sghCljUpqDf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2MiBTYWx0ZWRfX/8b65/wQxv84
 DIqZ3/+U5MbVbayLSNzD84XF3KWPYmxPc+v4KuZgnJoePMpzbb5liC+fvqiqMYzDXvDj1k9sbtr
 M/8DqfQl7VPTT7AjOKP/M1KZl/arDu3j+G37u5rruB2Muu6LhtOKyxK0QncSCLTm1t7shR9LZ0t
 fxnz5aOoXkv/geUXfHiCPdXPQUBofVWBbvCD2jLsJrcXP4Vv8wArFRdBrrBXtycNEb23X0y6MlB
 2n+1JwOlxSLlBiduNRqyxKPmqnykSM7IS0ewrnUMSxcl23LrWracqroO6nTA9FFs/YRp979bCES
 5mOYqVYzD8sLJ44MdMVkHUIEupe6HCE6Xle+hG44WvlzCFsEZbzAhScEXSTVtBXD/+y/EE1j3wQ
 Qpd4Qj+0Ws8uhhDoXqviUAIBavbk+U8bCnPtzlAYgMBj7JV4YIpkRpzG/7KpvGaKYXvcllZ2TF+
 9d3KvgsjeUssptV7R0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210162

On 7/18/26 11:41 AM, Hongyang Zhao wrote:
> On 7/15/26 4:02 PM, Hongyang Zhao wrote:
>>> RubikPi 3 uses the AudioReach firmware path for its external audio
>>> interfaces. The primary MI2S interface connects to an ES8316 codec for
>>> headset playback and capture, while the quaternary MI2S interface feeds
>>> the LT9611 HDMI bridge.
>>
>> [...]
>>
>>> +	vreg_es8316_3v3: regulator-es8316-3v3 {
>>> +		compatible = "regulator-fixed";
>>> +
>>> +		regulator-name = "vreg_es8316_3v3";
>>> +		regulator-min-microvolt = <3300000>;
>>> +		regulator-max-microvolt = <3300000>;
>>> +
>>> +		gpio = <&tlmm 117 GPIO_ACTIVE_HIGH>;
>>> +		enable-active-high;
>>> +
>>> +		pinctrl-0 = <&es8316_power_on>;
>>> +		pinctrl-names = "default";
>>> +
>>> +		regulator-always-on;
>>> +		regulator-boot-on;
>>
>> Does it need to be always-on? Is it really on at boot time?
> 
> I think the regulator-always-on constraint is currently required.
> GPIO117 controls the power switch for the ES8316, but the existing
> ES8316 binding and driver do not model regulator supplies.

Please fix that first.

Konrad
