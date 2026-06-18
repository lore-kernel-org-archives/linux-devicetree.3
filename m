Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51D432BF5C
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 07:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781767042; cv=none; b=roCTRA+SIsuhdJHjxbom7B9zCGoU2X8OUKeQdo7YsBNI06RSiD8Nb7NCcysOdMxIlzgEF33Z/DZjxD9+vdMKRsd3+2KLRGhhghx5DkjJmOTA1XkGarCG46eDe9DKf3ECSCaHHAyJbZSA68QxBLwrtFMwlUkk6MwwfzYpi3EAhvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781767042; c=relaxed/simple;
	bh=8E5qzq+mZ2iFEEVvuk30mGz2SpkrQKNDsaBE7t3Hf5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eF6BwOuALPyZlRZCC/y+2MRKVFYTJWW0W1AjVIU6VOffrTIwXI+npZK4UprwlL/o5d/gbJLS2/erNGcW7cOtG0/Otc+qgdPen28Kn87SmMGHNdJx9oUfq5QKbBAqlup2k07+wha4Kz4d7dRnUdqCtxgSn7HpY/UHD/YgTrCGAwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UvtMUwOx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ashXPWVl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UvtMUwOx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ashXPWVl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I4UAk33588851
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 07:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t7cu/kThVOp61khadvlTa0ooRt2HujLje7priNd4Ua8=; b=UvtMUwOx+IBw1L42
	6Vx/3Jt9wIEbq1W3cy4jzghi9EIUr2I98o1Xip77t/5rGDmy+0rPIPGnnoOBxFy3
	qKwdu8vlJI9GNln/DNllB1BVC4bQneecQsvu5yga0JMalJHqFQl/DAxiFdn5/3Dv
	VxE/CgMDGRf3OboxAgtogVAfEC6aK5EMUvpczIzOV/6QYcGVhimzs8BhiA2NEU0F
	fxwQaWLSHz6oFLTc1SSzV7P71b03lf8Ds+BrWr8+R+rI1EjGDGRE9c4+j8zcUfGY
	V3E2bkE0kd7GkIzYmaHMk4atgy5EEwF1rjxTMsOthHZScdWFnvMZqxRNmHjVlyyW
	7cVCmw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev12kja7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 07:17:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8dc0a6ab3bbso25402706d6.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 00:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781767040; x=1782371840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t7cu/kThVOp61khadvlTa0ooRt2HujLje7priNd4Ua8=;
        b=ashXPWVl6T+i0V4j0v7sbbJcG1L13M2EoZOcNqScaLbTjSR64EbvjAqYRjwR5/79Ed
         txQNTJ3EF8XJr69FEGa+dI0PmFTDyGzYpk9z5ZwFfUoUyVme7tHg9pYgu8AHbYNp8UsS
         YDTg2VEfO2W/FdfDA3I9ivy5J23R5Fmqf8pBZuBNhiw6Xi9LHq0rBB2U7aiaQSsKG6Pt
         GNqzQiz2fAeBusyupe7PiL46JNIPRWduyfTF5m2lUAXjUmqkzVpNkCdnFgBwnfnsU1ML
         SvepDZfAO2y36JiNee4GABJDHHFmg2GEdq2qWbGdag2tpc8/OZin6yNeYkTzUq3+adWr
         kedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781767040; x=1782371840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7cu/kThVOp61khadvlTa0ooRt2HujLje7priNd4Ua8=;
        b=g9hDMbbdIk7biPyLz6C36Ngz/VC6KXALttVGQuCphp7oGBeHiXFeZnhGKgHJIQiOof
         ZEqF1sz/Xws5GfZ4WbDkWy89omIbWnwAJNG5sUGNfQXTLq7nR+c+HqNJhUD2tenqVqHo
         2ULpK0MKSZObUcYLHX5MJ1XJ4hgtR7WPhdsVmBWItY8zLS8ae+sDgY5Tv/Cb1/AaraFY
         JVhKOiUA6cdJUVn9HtjG23uIH+Yd8wzUL3TV04REKVRWaF8Yh+t3WwuaYOhtzfc4Xw6B
         fjO/hSCtgTEIuwZCQ5Mob5Gbbsc1A3S2rCzBRYj82cNWw1f1D5ujm3Q8tCQY58uH/Y08
         Qk4g==
X-Forwarded-Encrypted: i=1; AFNElJ+2KXDHUmPeSaKDjxOJW/9g/lVd13GZRKiF7OOtmKsKxo3/wEGVgh0CXg1O1msjIU7IvGta4gWM86Q1@vger.kernel.org
X-Gm-Message-State: AOJu0YwKgA7rO2yg9lx0wT/0VDty1l7lzWQicHd4aOoJJuaZFs5CGMye
	cnIXrTMPBUaV+xGEHY4QRxucoh63S2wzDQOOctlKz57swUrZs8v0g/tOeOBp6KaTd44SgqAdhjH
	agYM/RPyKyict8HZGTsaZqKfcE8+cjMQjrBidbnMu4wkWn2gZ0X/aeng6oqVfZByV
X-Gm-Gg: Acq92OE1+iwjZGHAdQK6nScO8LoF47W3Zey4zHPsjRwca3RsF9GCv8MAlTQrsuTD0ZT
	uXpX4ZxlMmon73JFdSHbdBZun2XVTuO39Kq1an1Vtgoc9i2HZqn8in234whS5fiQ9VMhccB49+I
	KqD4LvlryU1tt/y4MqhAfYhrfQkR66fVzqtpymem16YxEvB+Gag+Q8VRHz9SoHzAZWq6qhxbyFM
	i1aJ9/VOl2JQ3P7xNKLQ5VS080DOgo64kMUs4/ar21nwmEv54oR7rUJPcxHEV4EOmxIJzS6kVAO
	sBqWZc2M8vgOg68zD32ginJHCtlmbQ1VCPww53osL9yT5CMjT45Br9y/plVsZ9mVukr+cUGtect
	HLGU7JHgZ6tQLdF/t2g3UkTR36vOKG/f19qF4AVM6Cn2vAUP1C0AjJBBycY4f/+P4zpxCwBggkA
	==
X-Received: by 2002:a05:620a:4722:b0:915:8502:f808 with SMTP id af79cd13be357-91f27600dc1mr350112385a.25.1781767039519;
        Thu, 18 Jun 2026 00:17:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4722:b0:915:8502:f808 with SMTP id af79cd13be357-91f27600dc1mr350109585a.25.1781767039081;
        Thu, 18 Jun 2026 00:17:19 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:5ac4:8c5e:b742:f9c9? ([2a05:6e02:1041:c10:5ac4:8c5e:b742:f9c9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c3782sm55095264f8f.25.2026.06.18.00.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 00:17:18 -0700 (PDT)
Message-ID: <61765401-3397-497d-a0ca-e9bf9d76cc6a@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 09:17:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
 <20260610-ocelot-of-stimulating-excellence-bcb0fe@quoll>
 <03d863ee-2caa-41f2-94b5-7332fc930b42@oss.qualcomm.com>
 <d81bc78e-2c1d-45fd-90c9-f7ec462183a0@kernel.org>
 <7f1e46fb-15e3-4638-9930-8abc1dd5a778@oss.qualcomm.com>
 <fcf93e0f-a2f0-4070-86ec-8a34e9344b76@kernel.org>
 <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
 <3cbcaf8c-357e-42d2-91c1-9d1a32c55ed0@oss.qualcomm.com>
 <ae43a691-4879-4bfa-8c7c-1be16945480c@oss.qualcomm.com>
 <9a31bb29-75d7-42fa-b8a8-4155cf85cadf@oss.qualcomm.com>
 <c32e263c-ba4e-4899-a935-e129de0f1269@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <c32e263c-ba4e-4899-a935-e129de0f1269@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA2NSBTYWx0ZWRfX/zg1Gp40jPUb
 zM/Rjn+Hjr6QsbUzETQIgQHLcTlC3Wo5OsTo3z/HmZ2/yVEhIrwlFutpgvdNgzphNmIoIxretlT
 zcWLiFhWzxoBA/V120Cxwl5hp2hi1bqetkcKDHqlIU/ElGwee1l8FZ7uOlaDsfocjISajp+dggY
 LfnRO2GzpAg/z+kj5ekM1A8T7dAUkrfJYyD4PwxO4Mwh6V/cZxSQsK78U7gp6ffnz9RiXINR3uR
 FOO6j1gjQ5nqaBkvFavlcVHYL5FzqFXopAW5dqct0mcy0/JEtxTs7I1a2RG+fqamKjUd3BJwGgS
 Kdp+l29ejjiAqlirM76BQ38j+etQHav5RG1IiFJ8zoXHpp+bIX0ZqW1bvcAoH2Y8yjOQunQ5YQT
 7t4LRBm7CMtBjUBhUzYekA8BGiLloIYShmHFBpQ0LpFjsLBTe6Lvay/4OXEzVMA6XcSF9+x2knd
 ZAVZ6eP+O91YEYTzatQ==
X-Proofpoint-GUID: 78K-9_KX-IfusSblC9z3fEDrPb0ctseX
X-Authority-Analysis: v=2.4 cv=HpVG3UTS c=1 sm=1 tr=0 ts=6a339b80 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kCrNj1x4bCXofucgv5AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 78K-9_KX-IfusSblC9z3fEDrPb0ctseX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA2NSBTYWx0ZWRfX8xpqefvqAkdQ
 /MxhMSvkNtwT83vVHYyJFAnuQFCE7cxGeOu8tA69jUG2FOrG5zgAabVduhdE8NWDefQTFdaVba9
 xMBL5g48voo5m3M4h9GXuPLizRQm5Pg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180065

On 6/16/26 06:21, Krzysztof Kozlowski wrote:
> On 15/06/2026 14:30, Daniel Lezcano wrote:
>> Hi Gaurav,
>>>>> thanks for review, shall i use driver data, which is basically pas
>>>>> data structure like below:
>>>>>
>>>>> static const struct qcom_pas_data {
>>>>>       .crash_reason_smem = 601,
>>>>>       .firmware_name = "cdsp.mdt",
>>>>>       .tmd_names = (const char *[]){"xyz", NULL},
>>>>>       .num_tmds = 1,
>>>>>
>>>>> Is something like above acceptable? and this will also help to filter
>>>>> tmd names as well?
>>>>
>>>>
>>>> How the thermal framework will bind the thermal zone with the TMD ?
>>>> (node pointer, id) ?
>>>>
>>>
>>> Hi Daniel,
>>>
>>> thanks for review.
>>>
>>> With id only, in this case instead of taking tmd names from device tree,
>>> qmi_tmd will take tmd name from pas_data(driver) and register with the
>>> cooling framework with id only. Please let us know if this looks fine.
>> May be I'm missing something but:
>>
>>    - The QMI TMD returns a list of names, not ids
>>    - The QMI TMD may return the list in different order than assumed
>>    - The cooling map index points to the name of the TMD in the DT
>>    - This name is used to match the name in the aformentionned list
>>    - The index in the list and the id in the DT can differ
>>
>> Krzysztof , I don't get why having the TMD names as properties is wrong,
>> they describes the existing TMDs on the system and the cooling maps
>> index points to the one to be connected with thermal zone.
> 
> 
> 'xxx-names' have a fixed meaning in DT by convention - assign
> identifiable strings to the 'xxx'. I miss the property 'tmd' in such
> case - its definition and meaning. Where is it?
> 
> But maybe you just want list of strings, so I am open to discuss it - I
> don't understand the need for this property and commit and property
> description tell me nothing.
> 
> Really, this commit message is basically non-existing. It explains what
> it did and provides that much explanation WHY:
> 
> "- tmd-names (thermal mitigation device names)"
> 
> Really? This is the explanation why this change is being made, why this
> property is needed?
> 
> So sure, describe the problem being solved and WHY this problem is being
> solved that way. Maybe it will fit DT.

Ok, I understand

Let me try to clarify.

When the QMI TMD protocol is initialized, the list of available TMDs 
provided by the service is requested. They are identified by a *string* 
not a numerical id.

We can not assume the list is always in the same order because the QMI 
TMD is a separate subsystem and the interface is the protocol. The 
protocol does not refer to any TMD with an index but its name. 
Hardcoding an index here is not possible.

The name identifies the TMD we connect to and in return we receive a 
handler to use when sending the QMI messages.

That is for the driver part.

I understand for the DT, it is possible to not give the tmd-names 
because the it can go into the driver's data structure.

But the thermal framework won't be able to associate a cooling device 
(one TMD) with a thermal zone because the cooling mapping must point to 
a cooling device in the DT.

Initially, Gaurav sent a description where each TMD was a child node of 
the remote proc node. And you rightfully told us it is no longer the way 
to go as stated in the documentation. And you suggested to replace the 
child nodes with an array with the tmd-names and add an index in the 
cooling map pointing to this array.

The thermal framework has been extended to support this new format and 
associate the cooling device with the thermal zone. This change is now 
upstream for v7.2 [1]

The resulting implementation is the driver gets the tmd-names array 
property. For each name, it connects to the QMI TMD and register the 
cooling device with the index corresponding to the name position on the 
tmd-names array.

On the other side, the thermal framework parses the cooling-map, gets 
the index and do the association (binding).

The tmd-names array property replaces the child nodes and allows to do 
the mapping between the string based identifier with a numerical id.

I hope that clarifies the approach.

   -- Daniel

[1] 
https://lore.kernel.org/all/20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com/
