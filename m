Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C793B489FAC
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452085; cv=none; b=fVuyu37gr+UoPNJQST27IRET2aKtwxyBJZvmVCVVgsxTbG56A0qWE8DGcM8V76JO34O0Qu2lJFJBkDierNjbM5iD2GOTsyMl78wuosRYe1roEr2GurC0MKjxr9S/9020skMikaqN2PiUd6Q+1v0mYYBJSRBiFtboAHn+qgeYmmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452085; c=relaxed/simple;
	bh=qDTPagCMKXfXSQoAQtHPcRyFuFiVXChd3KWcBOa3Mv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mWBrqpPIe+Pu+X3qBLb0BYv6WF6wJlRk/YuMmpRULGv/bVWZnTFfXK/in4+0IcWegf/EhV9endzGDzA2kyKICAl5SwnPc+rqq7orsGJwpdirjTEkK6dNuRa2O/iDZR8LtHi9SP0kB8Qpw5NikUiEqeCqcY7QDcEqTid3+rugON8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ewtkd9Vv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GF49fWzk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ewtkd9Vv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GF49fWzk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KcsH2686654
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 09:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NHzdCrzB5CwJNMDm2rJXhCb7qWjOLhdrunIo0lH9wqU=; b=ewtkd9Vv03MTGYw1
	yJqi99u4KX64v67wjKlDurhKecn+nlTJlKHFcpY5y9zKLUqGTl4KIP4IuYJhZvbQ
	Z+SSJ8secrzcFE5ePquEgmOE6RI1mYGzT8Ajq4yfHkXl9nK6/BWEdzgVQGzQllYY
	QY6pUoLYeiM2d2kIsho1zEJuFiRBDNNYfHSXgy3XfjVJFZnfv96iBGEZ+upHW9XH
	jS2TzYBehdQzEg38TBKCKBieMi8kOLnuNCpYll2XysIdx7+0L2PD5d2U6oEkUiWC
	YPftL/TO3NGVF9qkSSZpuzxQRrBwtiUR3d5uZr0lyTfwXDkf1JCEJeCvinFWQPvL
	giRHng==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe427yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 09:34:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e61a8eb087so18948725ad.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 02:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791452081; x=1792056881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NHzdCrzB5CwJNMDm2rJXhCb7qWjOLhdrunIo0lH9wqU=;
        b=GF49fWzkVOfWOxt80CQeCe60UVV78GoBjHdoZFQPoj+pk3FgL8ICTSxMCvCa0HAXLl
         uTkAlAaHmQ+akMqPordZav3hlatIbZZMxkjteKq+b5gknbVK2pPxzIAW8sM/MU6RGZBJ
         Nf59xIbLFriVR8uzEXnDhGVa9VOGVe/0gGbXbw4Wa+/2/QK+jhPvd4i11cdCJxNLybJZ
         O8KH+J+DHD5U/RUTcyurvR0oSB0J/JiKp1FxTmQRGcTdkiOWC/kPJKAZfDQ60e62OsjC
         c6+ZUkImYuLaJs6JUm/76GXDBHCGewadozrW+PvFOgfw5CKavZDVthbuYjI++NfqVe7x
         XcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791452081; x=1792056881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHzdCrzB5CwJNMDm2rJXhCb7qWjOLhdrunIo0lH9wqU=;
        b=tc1zGvPyR9FxsNluQBGXGMtbOP92mlmL+7m55lgfkCrWLil6IT2qJGNZrs8Z1Gd5Sr
         ivzt7Hn+vrXfg1meb7XqwuTUQb8OfGOuA1wuXlSGRrGnvKRlM81ZKcUO8WM95XdNns8v
         C0S8gfq9+4qIg1/rp6koAjWonPY3OtDQQ4lRpxcuR7Xt7TWRmchWTzlNtbYfJLje4T26
         ZKkR+npbuiaU7Bz0FohTTHvAADb3mpzQIUfYQL91yh33tLDZg9pzoACXNa+FIhq2wyO2
         kflaxwAEliC398vpezC7DfGbxa9Q0KG6OSw3YYsP0jkaMcYQD7Jog0CgGqqlSdW/sFm5
         ECLg==
X-Forwarded-Encrypted: i=1; AKwUvByn6bjjB0ew6r3a4Xkc8wbnT0C5+fNXigrMvXAlexdm39UAHcAlXZMoCz7+vwfMmmafQWOymnCIG2rJ@vger.kernel.org
X-Gm-Message-State: AFq9FYL4TVk/UO+RwHPuqeM51/0wl2dGKPXY/qeUiyv/xlQ7k9ZoJF9O
	dQwulA8cstpb65wy4pW+Z2sOYB7fpbPVdX1Ua9kwXnUq2Lm1+Dh2Ebge+DIWl4K9eUXqD6hkHvi
	Uv9BefKCbu1vDF+vjPjmw8hAfA4+td9JVgkh4Bgi7tCETPimkfzFfNEiRozzzTCH2
X-Gm-Gg: AYBFou3P614gb/zJERMxr8J80vDLQ3K+SmRV1jRPlYaqSr46lOcunh3tPFe3j/gUK/m
	iFAVCjLz+8yQIOpGsUQ+2k9ftRi5nNshXJ+fUVApeW1pn/0gWAfNp5P+tBVO6axU+xkeRZJjjiN
	siCuGaMMZHlIVovGHlF4D5bkRJtPT5QQ8ALZkS+R3EtmBw0mGreHYI7uaQM66gs0lThDRN1V4LJ
	N4FN0brGGWYEqfTb7Yc9Xd6+RQtvPXoYc5jRgeDGWFe/hCSDYvz6OWWJyJVdaZh38/a3HKpcV3T
	wbfHx1SD3RnLTPwOKmCJvyFJS/r2ER86Z/tzjgCHDBzKBs5rs7YxKaw7IrLg+/54G0fTZhtvrzP
	e4rEKQiWWqRiRA4pVeiDCRIcRoJo=
X-Received: by 2002:a17:903:3504:b0:2e1:35f0:6822 with SMTP id d9443c01a7336-2e5ffa150bemr49850815ad.2.1791452080623;
        Thu, 08 Oct 2026 02:34:40 -0700 (PDT)
X-Received: by 2002:a17:903:3504:b0:2e1:35f0:6822 with SMTP id d9443c01a7336-2e5ffa150bemr49850655ad.2.1791452080181;
        Thu, 08 Oct 2026 02:34:40 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604a46604sm22029495ad.72.2026.10.08.02.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 02:34:39 -0700 (PDT)
Message-ID: <041edb78-acc2-4832-8500-28db58db1529@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 15:04:30 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/21] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-11-7b47ed6335a8@gmail.com>
 <31d91f44-3f16-4a4c-916c-f4d8107d371e@oss.qualcomm.com>
 <CAHgNfTy-h8m-XBBzW6jSNBz0dVe=vXL6nJ3VOqgMjCbsK_t6gA@mail.gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <CAHgNfTy-h8m-XBBzW6jSNBz0dVe=vXL6nJ3VOqgMjCbsK_t6gA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ypQqOKSCJ5P9Zr1nQdfuf43QcFbcSVdU
X-Authority-Analysis: v=2.4 cv=AbwkjHXG c=1 sm=1 tr=0 ts=6ac763b1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=k_whtCd4PG3F-9RvoSsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNyBTYWx0ZWRfX+xdlQ09UzfQO
 hSc4HZO7G6q/EuHjwdzPdwk/VIFr3MMzYulGhw4Hg0ZwehThonBuYxUcz/3+tZH7PziWcuQGzJq
 /c/x7ISAqzsF+bC7R2hpkrVMMswDLlQ=
X-Proofpoint-ORIG-GUID: ypQqOKSCJ5P9Zr1nQdfuf43QcFbcSVdU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNyBTYWx0ZWRfXzTSXZO+iYCCx
 l3qx59eKKXrjV3gCE5mHLNNefw81i9/QLfw3trm7Tb7WLzC4O3eRSs6XbJypq701P8PqNW8uwYI
 EgE89PPKNR0nNopPWGxQyo1e/B7sdrTZ08/cD6itbdxH217rWDXNPDDc69Xn90b0sX7hDih3Lo9
 IzR+u/96aayHq1pObxRcg29wSYlw4P7c+wpSzaWlVWn8UDxJ4dgxDRGvokNYfiglJ7vIOAD/EO8
 Seg9xevCebQNQpNw3jsCIEJ8Wy0WhSzmRikOlIgASSiUGI6zO4YwnFgNwhjK5lB8Q06Oz0VffSf
 vOD/MTK1N+oa4kE6PQp5X5dFvejdkx5A925tx7cFaerTQtrD1yeby1t5XSEK5RYU5dywvPQzAJm
 nlakIkfE9G04j1bN4VLFiBK9ljormHNtUjFWsOHqBQPvPJxNo+ZSGRMKjP9qSlUsrGT2B1yStAu
 +RUs2AXCMSs090xNUZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080037



On 10/8/2026 2:16 PM, James Calligeros wrote:
> On Thu, Oct 8, 2026 at 4:33 AM Ajay Kumar Nandam
> <ajay.nandam@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 10/4/2026 11:33 AM, James Calligeros wrote:
>>> +&i2c3 {
>>> +     status = "okay";
>>> +
>>> +     speaker_right: codec@34 {
>>> +             compatible = "ti,tas5770l";
>>> +             reg = <0x34>;
>>> +             interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
>>> +             shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
>>> +             #sound-dai-cells = <0>;
>>
>> Both speaker codec nodes reference the same shutdown GPIO. Is that
>> intentional for this board?
>>
>> The TAS2770 driver requests 'shutdown-gpios' per codec instance, and
>> GPIO requests are exclusive by default. So I would expect only one codec
>> instance to own this line, while the other appears to fall back to the
>> register-only path after the GPIO request fails.
>>
>> If GPIO181 is a shared physical shutdown line for both amps, how is the
>> power/reset ordering expected to work across probe, suspend, and resume
>> when only one of the two codec driver instances controls that line?
> 
> We use the new(ish) shared GPIO proxy stuff[1] and it all Just Works.
> 
> [1] https://lore.kernel.org/asahi/20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com/

Thanks for pointing that out. I missed the shared GPIO proxy dependency
when looking at the DTS nodes.

That addresses my concern about the shared shutdown line.

Thanks
Ajay Kumar Nandam

