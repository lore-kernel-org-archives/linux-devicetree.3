Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3AC3D9534
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031210; cv=none; b=bloCFrptX+NRkHMFRCtPcp+5bkGQ2NP2tCtFUtehpkU2bxjBoBMxsPEkxbvtwvNN2BTq51JYRnv8v/1RpLJINnQ3OdNP8jh7vwmTb8ry5XeOBJGUwJhtFn/tRM0BrU1DJWFxUicKdXpBpbeWp3V0l2OnGYJQn2+XDrlSuF+kQyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031210; c=relaxed/simple;
	bh=90EN1N7rNxt1YrZEpVX6CSLWyT6yYoLzsNNHcvGqQGM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=I3FnFgBhLogMo/oPzIAdS6QnXkocmacFCvOOWgAeqOkv1SSOLbK4hc3YAXOiLavf9Ey0LAyV+3Udlhoe3XMO6prkdBVSRmlWtzdfYvu4dtMkU4WFKyx0M4oTAUKZekkQDf5h00Kx1kDECs4rgt0JSaoWlgztcOoRz6dAj+kxMJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oTOeLjW7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UuGmQh70; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oTOeLjW7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UuGmQh70"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ENVB7f596302
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lOpJV0LCTFxPG1xszFrudkgMcOhE/etRnFGNtQ073ig=; b=oTOeLjW7Lp45vET3
	TmQEWfIwDTMDK4Mb0jA/xUx27Mg9MFHSa4/td8YIZxmnGN9v/Z62XhqpbtqL0lcw
	LOihwMKX1nZmOokD+b3weMmaJ6esH6NKPn5R2XbbIjCOxHRDlfeUh9iwR2RqxPTM
	H9Cgz1B04mbnpPbcYcBtufRpBWLGoCTOH4oH5STITPSETgfmuj+VSead5MOrs2bK
	92aIAru+uGO2H5gegDrawvQ3Tto5nlF2Surb7LxoOh8Ys7EqYrokl0YEki9o9lDO
	Fi4RDryahVALm6Xkejvp5Xjyvy+qhmNqCf2T9rUCfB6pUkefZ+aQ95n0lejAHEtF
	eqMlJQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdergxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:26:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so1382369a12.3
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 19:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792031207; x=1792636007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lOpJV0LCTFxPG1xszFrudkgMcOhE/etRnFGNtQ073ig=;
        b=UuGmQh70kPbgCLyEaK9eXaqLXa/If4MbzmHjR96ZMsfJDASHf1sNiQGPn+bKhSW0gA
         8yrIbc1XgOjanDBtN9leWFeuuVXjYggx+d5jcKGY06JYbQUUCe3X4UqckzX7LLAqNigX
         Ae228bV7L54MsqV5WyRnedgFkLi5sJYcpsI4Ehl6rPqdwsa5iYSc7VS1T+OwiY5W/mQS
         4TjMHJfl+8/dmI5v9tztt2P2a/IIMxV8fp7UhleEaLYUDKd1hjs0hK400/m1RyskjfFT
         7vvtmqpCweLbGVfQKZaV+It6EQ1zukH0LLdN65SZpiJS8EHWxsgI08w3iwwu/7gv1Px7
         nw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031207; x=1792636007;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lOpJV0LCTFxPG1xszFrudkgMcOhE/etRnFGNtQ073ig=;
        b=fs3c0oECOvNuZzTyM8w+P50IhtYRp352rnErkithCBrTRWKuED7aa6DamS6vOpqXIx
         ZH3nrFsGi9vasBRw1pacRaNAkhi0Wlp6B8KZM3ibRahgsDNGPFg1e3+NwdLwmQqdS1NC
         e24cOrFwtSqyRKmMrJUskGLBht4gWFszsrcSIwoaOWN/5vQGDkqrjXfUQ+LZ8NGXo9Gn
         80gAMh9ouR+ouaJbuFar/d9ftFOFfwy2CxnhMKNHsvz2iMR6mZEPekWXtQW4Iw7bo/4k
         KoS//uXV967VEJQeHyCiwxHVSS/qXU9U28RNBACIjCQItnJXx0kxKKgJXN6jk0ne0iQ4
         ncxA==
X-Forwarded-Encrypted: i=1; AKwUvBx/y88CnW3lYJyxnYrLxL0w7NvONblGnUnE5PjH/5Gmwa/k4zWxSxHNbR9LJzcqaQlOxFt40Zb0KfVP@vger.kernel.org
X-Gm-Message-State: AFq9FYJX6Cba+wO/iI1hByEyujRE50nMmQkp0tQERGBXYNVpCckw5sgl
	DrMAjhxAenTm9Ue6o8gAHOxxDVpxelLryBMD7R175Se+GMsF/nX0ycc+DaZgjyL0YuTGz2gayce
	8euZLjRLoLtw3AvNtaJGPN/mYG748a2oJuCT7R7zPDs+szs9UsAWaiZ6A/HGlXhn+
X-Gm-Gg: AYBFou3AWPyGWTffZKs3q5DHHgPPzsjFkpMwNe4rLqpXUZL10Lwf1ttEapYikemoaE/
	HnsKy0t2/1AnCAEccKjYKy67z/VN8RwIaA0pEgbivXEsgw9vwbFoxgxkDukRcmMpR03b3AVZcT/
	UmhMHruIw8dajUAJdC6q12FSdNMoYc5/r6IyNm/AB2/audXwzYZ/eix5MZm+01AU8VCPrLA9BAL
	rXksRJ40XAjAEXRFpHa9kiUtdkEWB52eUOI5Tw5uAW196SB3AZtxprEvsRzGweIVwbLAmUYylDL
	C5+qbAvCurpXsGhxB8HWom8yoaYRO9Q8lSpDmdhLDzeFHh6xKKOitv0dqo33ZOkMgopdL+DXaxh
	ZYFQdnVS3YZnwfG6Wm5oP
X-Received: by 2002:a17:90a:10cf:b0:3ab:9c73:12f with SMTP id 98e67ed59e1d1-3ab9c73097dmr8014634a91.24.1792031206785;
        Wed, 14 Oct 2026 19:26:46 -0700 (PDT)
X-Received: by 2002:a17:90a:10cf:b0:3ab:9c73:12f with SMTP id 98e67ed59e1d1-3ab9c73097dmr8014617a91.24.1792031206242;
        Wed, 14 Oct 2026 19:26:46 -0700 (PDT)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac937c4e7asm1203159a91.3.2026.10.14.19.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 19:26:45 -0700 (PDT)
Message-ID: <686fe87e-63a2-4358-a6b9-8b2107b369e6@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:26:39 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: kaanapali: Add CoreSight nodes for
 APSS debug block
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
 <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-3-c2a8c3225a2e@oss.qualcomm.com>
 <f34b2632-840c-4761-bc35-deed96b9405f@oss.qualcomm.com>
 <b410aa8f-c4a0-438b-a02d-765da25dc160@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b410aa8f-c4a0-438b-a02d-765da25dc160@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad039e7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=XsdsdXCq1ZeDsYjCIU4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: YJvVwZdcPM5liYZyGUu8XyXjATV-0Fg9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAwOSBTYWx0ZWRfX3SLUoLBwvdiE
 jHbkgW0QKiDc51obMoO4jD0L7ngQHrkLOQtMvJemkM+K5HbGKfD/DWivMyx7M6QMgz0VfqVRZI4
 PZstr8UYwwHJcVq0C1NvV+ch1hRY75Obul0LYFfAXEyjsrPVDmI3AW3WhVEM84Luo6QGye19T4V
 mG1UAVDZRCn5Pr2j+IzH1FJdT4xJuihPE0Aq6CyBal0mNbodCBksW743Y3naTGm7zwBaJ/yIY3K
 aiwo/SjAxzP0kO47kgAJujn4o4JCTiAcBmrtrgH4hNhQownzNNQ0Sj6lWy4ErtAJrQadEp2a9tQ
 9cgmd62I+K5s5NeKhswEIbvmjE2Qckz8JTk6w4JBZyF4E5QU69rL+KTLMJ9Z2KHlFW6o+KGq2QP
 VuQLTcWTdhZWkiNGeY0jDKaOYIvWGmrVFyHNox2I6CT9qqP3SvCD4bLeVebA5/5I3ErknxU2DbO
 K81bCWVx8LjgDIc/qbA==
X-Proofpoint-GUID: YJvVwZdcPM5liYZyGUu8XyXjATV-0Fg9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAwOSBTYWx0ZWRfX0N57+mrknltn
 pR5ppnxowXBHp2Ja54BY583NmJwz8jo6If9sSOxgx8srI9ryMPqJUvNRNcZzpaxbRS3d8O9BMyg
 CVUZbK5mYRRVQBOAXhYPH9cgX6QxyqM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150009



On 10/14/2026 9:23 AM, Jie Gan wrote:
> 
> 
> On 10/13/2026 8:49 PM, Konrad Dybcio wrote:
>> On 9/22/26 12:35 PM, Jie Gan wrote:
>>> The APSS debug block is built with CoreSight devices like ETE,
>>> replicator, funnel and TMC ETF. Add dt nodes for these devices to enable
>>> ETM trace.
>>>
>>> The replicator, funnel and TMC ETF nodes in this block are physically
>>> powered by the CPU cluster power rail rather than by a dedicated 
>>> always-on
>>> rail. Add a power-domains property referencing the cluster_pd domain to
>>> each of these nodes, so their power state is tied to the CPU cluster
>>> domain and the runtime PM core can power the domain on before the
>>> devices are accessed and let it be powered off otherwise.
>>>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 567 +++++++++++++++++++++ 
>>> +++++++++++
>>>   1 file changed, 567 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/ 
>>> boot/dts/qcom/kaanapali.dtsi
>>> index 131fd2a16c54..d9313de53ee5 100644
>>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>> @@ -218,6 +218,110 @@ domain_ss3: domain-sleep-0 {
>>>           };
>>>       };
>>> +    ete-0 {
>>> +        compatible = "arm,embedded-trace-extension";
>>
>> No power-domains for these too?
> 
> ETM/ETE device is the debug device of the CPU, no power-domain property 
> attached to the device and the power management operations relies on the 
> CPU itself.
> 
> I missed qcom,skip-power-up; for those nodes, ETE device should not 
> check the power state of the device.
> 
> Will send new version to address it.
> 
>>
>> [...]
>>
>>> +        tmc@1d029000 {
>>> +            compatible = "arm,coresight-tmc", "arm,primecell";
>>> +            reg = <0x0 0x1d029000 0x0 0x1000>;
>>> +
>>> +            clocks = <&aoss_qmp>;
>>> +            clock-names = "apb_pclk";
>>> +            power-domains = <&cluster_pd>;
>>
>> Is there only being a single cluster_pd a mistake on kaanapali?
>>
> 
>  From psci map, KNP only has one cluster_pd shared among all CPUs.
> 
> Hi Jingyi,
> 
> Can you please help to comment this part?

Hi Konrad,

We have cross checked the cluster info.

The PD configuration for these two clusters is identical byte-for-byte 
and is based on cluster_cl5. I believe this is why they share the same 
cluster PD.

                 domain-idle-states {
                         cluster_cl5: cluster-sleep-0 {
                                 compatible = "domain-idle-state";
                                 arm,psci-suspend-param = <0x01000054>;
                                 entry-latency-us = <2150>;
                                 exit-latency-us = <1983>;
                                 min-residency-us = <9144>;
                         };

Thanks,
Jie

> 
> Thanks,
> Jie
> 
>> The CPUs have a different Aff1 value in the MPIDR register, so one
>> would think there's 2 (also according to the cpu-map)
>>
>> Konrad
> 

