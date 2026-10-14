Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9F75038EB
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983812; cv=none; b=QYdw8lp9U0skHBPJKLu7WYGFnszvqxMpEpujvrM5CFz3oWOIh1yWiJdRB3jiyPuYxcQSIQeheBZLcBZOODb08WvIFQ9qX1JegIZ3YS7Wgrauv5pDnsaB+5BoWnVUXpIgclOao5C0RVRsWi6+ugGRSzS/V/ffhh+9Ta/DWYorp6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983812; c=relaxed/simple;
	bh=4npBNmQefRJR8xa2dduSk/7pfLxfCk0b5l+Y2SHGdY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l7en1lKwxJIIlKvZ2Tt3xxx17TfCu97fB9x+Bk55awX1F8Dwzuis0RAoslUB22hSrjCC+6M8YJtJQu6zByBp6xcXGw8oGrXd3Ds7EBi/cDFqaB9uhX4zubhLWwhrTyyoeCYzX/pJ0SQ84jjckRCvx8/zMUA4V1e2ckgQldb1y5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ePLoD1qo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ck2bbcvy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ePLoD1qo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ck2bbcvy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBHl1e3951265
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	93+igLrbXqmsFz4NTS+REhHzmDb/+QOuMx8GvI1OmbY=; b=ePLoD1qo8aYjB+Eq
	BSCyJbqRcMYtKATzRMCaEgLzrVsT8eqXcN7htzjwQj5Wtz5tGIDEWRPXeBGnZ98y
	TbtIj7wVHcYdMTXVqiF07GOIhNdlrP5vVT7mGStDwUZRsdKHcY3JdNb+s/zwXHR5
	s3+S5uun+8T3d+UytyB5kyvv4XKtPhdfFw7cClptDONYTDWR0L4PgX3iwZHjjOP/
	X4VCvcfD2nSAW4VPUbyPB6WQbJvt9P0i/vQWYJrFzFe4ksSVMsgS95yXy2aM5YIR
	HTXEmbwQO07lQ9qmx7IcElCuuM+KKLFx1MOxxWyXKioOhIiiB2EAnHDYyUPnFWtF
	TpTcBQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p1rpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:16:49 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5e7866ff61eso68154e0c.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791983809; x=1792588609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93+igLrbXqmsFz4NTS+REhHzmDb/+QOuMx8GvI1OmbY=;
        b=ck2bbcvyZdZHUimgtFkKvmQTT9CBHHXF3WETH/D9R3W/ki0MN5/VxA0/hpzbzHQ0HJ
         KN7lmF6BsoNGkPLs9eac8pneJQFEKO5Tdk+ha74HRhoUF/HgfnirTqHbZVxrAhMdXP8T
         TeFRmhjNMoUfw0PW8Fa4eKxctkq3doUoEHnU6oUy7oyyjYO9JclhT44CdKI/WigLBLm1
         EQkACCaYPLkhgqi0lHdbyGX9bdYXPE03AEhaCKLMfGOHuKOTeQdHjiEbnkqYIxdkKMm9
         lPZs4kQj879wDSyeP7NA9Y8kFHfBXAbwmeXprHvGWj7Zmr8PXJkZHxQDZsiiznbsRkIp
         k13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983809; x=1792588609;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=93+igLrbXqmsFz4NTS+REhHzmDb/+QOuMx8GvI1OmbY=;
        b=bixxLHOVkKO08k5Ynba5p6HkWR6ft1dlWJC1PwfW6MfpOo9hL/SxWUO7aSrozjUF+M
         AjibTtE+pdtGvpyaJ2dcDNO72AJAgbRsnbe7U7QGjQ2XKgYWdsCUj4yDX9EnoGjkyiTO
         OGTIufnnHy00AVo/0msy4VfEX2Nglg2mKFeZLs2wey0YsebWVaWBKZTBR/vqxbY+Cjdh
         r4X6IfVZ1yA0OujIphoNUT10tGhtJEHS/E4AQlM0iUkBM5lYW4FHD2GedOhYOCU0SbK7
         2wfQ8ZG7JerAykAbYD7aEebhZYRh+FzfWzW2bVKy7jifzAAQHkZoaJCXwsiBt/9lz9qn
         nFdg==
X-Forwarded-Encrypted: i=1; AKwUvByLqyYI4b19969TNMn/yyf8tCDN8xNgzQFlPKGMcPp8QOHhR8kqIZXA0cBvIzk5+k2T1FnCbZefTchg@vger.kernel.org
X-Gm-Message-State: AFq9FYJLSc556bx1pJFO2IBmU5JFpQWqVCzz58I3TddPbRy1Do0/myDK
	zjvBy4Z/ZvubRCVRXBXyqRIYapssf2b0n1mnmHxEH/aKxa6ccuuD22WAnETVqfh+O+/e4qfkZUy
	aTENGfQoZmjbqaJAnQKSeMIpUj80g77XFUlHyfo1J+FsGV3fxVDfQtNJwwr4W3duJfTjafB9c
X-Gm-Gg: AYBFou0jjfn6M/SOGQY/+XMtIO5NYr33RebVROyLt5wUqLm/P+IK4NBN9TpTOYyxlKv
	1l8+zsQdEDVc9R55LtWGmHC7Q62LRezqRcTgwhSQJMd+b/JjhqzemxcO/4iWDRYlF+jCHbKKLDW
	r8/mox5wn2eoQUN2hY5nfRkoj6EzPtURtT0AmVyctfkaiN6kH654pxz5yTiwDru9QjpgrA4yEpa
	fTcHZUliYyAZfv2vilNbL2TwcCCNFlWfmbNSJ6f4DxMmUcMmpyd+28zoFuBrmy4t2hObzWUI0LB
	JuQLtRQDM62coRArZhUPcCVizbZCYIMETwHwOATmdON1/iMI9NCp1UDHaKuOsJupDM/GrznRlAV
	kEceD0DacupZ8SqA1Qgr6aQ==
X-Received: by 2002:a05:6122:4a52:20b0:5cf:69d4:10ea with SMTP id 71dfb90a1353d-5e92e15cddcmr2779016e0c.0.1791983808468;
        Wed, 14 Oct 2026 06:16:48 -0700 (PDT)
X-Received: by 2002:a05:6122:4a52:20b0:5cf:69d4:10ea with SMTP id 71dfb90a1353d-5e92e15cddcmr2778945e0c.0.1791983807572;
        Wed, 14 Oct 2026 06:16:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203865008sm1075601a12.19.2026.10.14.06.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 06:16:45 -0700 (PDT)
Message-ID: <ac97e06f-9ce6-4c02-804a-f45ac3ee1bca@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:16:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650-valve-deckard: Add initial
 support of camera sensors
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261002101748.2454305-1-vladimir.zapolskiy@linaro.org>
 <7ff7a265-59ac-4ab3-af14-385fd02fc6ce@oss.qualcomm.com>
 <8d7346c0-1eda-4e48-8df8-926d05c370d3@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8d7346c0-1eda-4e48-8df8-926d05c370d3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfXxzFFu1rmaZxT
 KlzOmS0PCQiDZ3wWqwwq8c2VGA6uXWDp9eR+0hHCkEtlTGdfD8h4HwfQTed1IvsgZL2N2DFseNC
 Y+blHjD18wkeqnS8mKhhlJ5EpklxovY=
X-Proofpoint-ORIG-GUID: _bjJoftoCoTCyX9zoD4s6sWVu1YEcJZB
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acf80c1 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=sgVaJ9zI5xQqhWRQL08A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfX5/rtBsUUKx1K
 btb24AHe/NBbMVWZR7Y74ZR7zn0E4U4fKJ9SbC4nbErGF7jtg3h3LYapCbaG/6evUBO4PDGkbhV
 Y9ULmlu4dESHkfQS0C23Dpade83PH4E+eNXDzllPtyFK4ydBpo7NT3Yb2760QCL3u+VBeNh1nUB
 rn88hBZCsn7rvKaVanBiyxw/Uc8blNjJW1z0bPik4/6bWYqT7Vo/1XG0h5Pv/1gcxuzz+Vt39Na
 nd165ztuUkkizyhq7aT6TamNh79hFSJeiU9cwdXfBRLv3YBjsUVxHZVZsld76LoAleI2sFSBUn8
 TldiRZquXgn9cA3thlPRejWQiIN1i34NGrB24HxdxHA2ov4afL84TT+1XzD+a6ukraRdVM+rsSH
 y1e6LlfVVuvnhulXwvHJELCfBRkYt99rqMB/DBel6D8WwDZWwUFndDPTYzqYeFD+GxkyI2klFGO
 LKjZIimR988CbIkvjFg==
X-Proofpoint-GUID: _bjJoftoCoTCyX9zoD4s6sWVu1YEcJZB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140052

On 10/14/26 3:10 PM, Neil Armstrong wrote:
> On 10/14/26 15:07, Konrad Dybcio wrote:
>> On 10/2/26 12:17 PM, Vladimir Zapolskiy wrote:
>>> Add initial support of camera sensors on Valve "Steam Frame" device.
>>>
>>> The change enables CAMSS and adds description of
>>> - a pair of OmniVision OV6211 monochrome eyetracking camera sensors,
>>> - a pair of OmniVision OG01A1B monochrome front camera sensors.
>>>
>>> There is another pair of OmniVision OG0VE10 camera sensors found on
>>> the device, its description requires a combo mode feature support in
>>> the SM8650 CAMSS CSIPHY driver.
>>>
>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +    vreg_cam_front_left_1p2: regulator-cam-front-left-1p2 {
>>> +        compatible = "regulator-fixed";
>>> +        regulator-name = "cam_front_left_1p2";
>>> +        regulator-min-microvolt = <1200000>;
>>> +        regulator-max-microvolt = <1200000>;
>>> +
>>> +        gpio = <&tlmm 37 GPIO_ACTIVE_HIGH>;
>>
>> GPT points out this and vreg_cam_front_right_1p2 poke the same
>> GPIO (but have different supplies - l2n vs l2m)
> 
> This is exact, same gpio for 2 different regulators.

OK, thanks for confirming

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
