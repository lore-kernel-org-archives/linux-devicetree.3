Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617586;
	b=byU+N5t0X4szLBc4k/xL/mjU542oV+lz/BU5ZulcFEZQnrt6mI59eFCIykghdZIyZT3q
	 kcz43tjvEHSWlbFoy8ctTyiz3rxVKQ1oXHESg/aS2Gn/ppf5IJlHRd1lQEJjyZY4oIZBO
	 tJp54g4NZb1jxT+CJKinUP5T2N9sXm2VRK4sjPXMZ/reAcEXfnPXvdTLjdtVF3qRjkHKd
	 5hg0G5xTCCqUuqRfC5hfHQvBNTB3iVDkd8M0OGzJe2Oc69CWNgMaQUkLATsknNYImJNTA
	 pTT0I8MsmPew03mFwEd1ZFF0+38vJm+LOsFMFIiMjj1FYWPDD0jPePcQdzH8/p4VfZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617586;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8VexOwUS4nB1TRVAfE4qKBfboYevUooTSYEch1IVOQw=;
	b=TwCb/QHL5ff53aD2Q/OsI8kp6gpWadw+HijtD9TZ1RirNBJs/e0G6EO5Wt+K29q4ULPo
	 02H0QpJx/JF2URiH1eUqE3LKn/8+QRWYgN1CZQ3lLvrgKtxfJsyjjfZHXvcgPxY+CLgma
	 CAKJOYE8ywiczRY9peC534L1VtPbVxxuvc5/MWDowB0b4vpPYLm/Hk5OyKsPOMDFP3OSg
	 g4fzetNEnH7+MkpR7dm3LdpjOlr2bssabMaf6Dj5Tk7Iv+5XkSgq49m3RLKelNxC4iZY2
	 xW69wTmUsVBnGnauGlDML+nOWfIJscnB+hxm/Ibl7Z1VWWEcGXX+SHBvypJOaxbEK0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K4P9gBfN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jRjgPt6p;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FD2606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 11:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4FD2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K4P9gBfN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jRjgPt6p
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A91E4039353
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 11:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8VexOwUS4nB1TRVAfE4qKBfboYevUooTSYEch1IVOQw=; b=K4P9gBfNFfYhga8t
	CbQutxvofJsoWF/CvkeWYKvREfH5CcZEasccFLS3yOtqf+/MKUyPQpEO/osDuM0z
	YjyAwJ1nfay16y63LbsIRRkRwjVZ8BPi3qcBiMBSjtPSObrx9Tg3Kyt/a1+4Kw56
	pI/Zafkf7QTAdF/Hl1gyjq8/k84nwQtA6Jb8xgNC4bSsw1CohiQNdtWzKxDXGd6U
	3BQN+0oOiS0EmZNNlEVPPvoXIrFcB8jVcGaVfpwpHQEdTlTxp6NA0FvTQUB2mQBR
	lXWq2GuoXtCjxJpDlpO06hCPYzv0eI36aWpuWzTC9vJe3yjhjQEzY758piT6ZWhi
	ebFttg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph18te6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:06:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so2099115b3a.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 03:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793617584; x=1794222384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8VexOwUS4nB1TRVAfE4qKBfboYevUooTSYEch1IVOQw=;
        b=jRjgPt6pB4eBnJAZXlx9mc4PoNxxDz1IgOz4jYn3fn6GZXPFRFD4XgFNEYcfArbqzj
         LysWdyz2TmhxmW5j2qO0f4o6ts3sr6w0C/+f80cBAQiKHUE69p5TXqb4WV4Cx8RooAz0
         TzfeCOR5XYmw2YtCyTBqe8lGGbFpBj13bMtKZJ2+hNKwoENiuK0d3qsJBUYSwn0qMXBX
         TClWnz9/6UIOlynYl/LD5s9smJzTclslYQxAqjqBlsDvtLKXDwem+X8PUXWtozMoweZX
         2b2PGSsI5l0uDjrRt4R03Y+x2OEBMx6K4pG5kuj88xPlFGJNGaWjCtCSiQTiw+nPno2Y
         SStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617584; x=1794222384;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8VexOwUS4nB1TRVAfE4qKBfboYevUooTSYEch1IVOQw=;
        b=ZtrM13+YIslF14BLyV/JlV2pjxErZixWF0kypZpVYhpc+DHH4Fpbrfi//IGK1rQxQZ
         iXou8h6cFGl6gV1JiEtA1gMb9q45UYgtb8YWoHIlWnEA92mSp1lyDCeRWQbkcvMlriK/
         g/WfnMRySmETZtnkvmcReR/vZmL6hPkun9TRBX7hM9EiKppElJGBJfCjDmwVo8MDxsqI
         BYYRSGvnrkbzNY6C/eyfI1iaPOf24BsVPLeVdb1Q+0eH41lVDN+IeubB3Pmz9AMVMxDy
         JU5HcfKBQ79/cKNn3WhLnfHS21DVpHJfhbD5kATW1MpgvTy+SnzcDzBMPHlsfmnvUmk+
         8m2Q==
X-Forwarded-Encrypted: i=1; AKwUvBz46hFtVuCtIge0cr3pzHGVmiGGQMNrLVyOW/Wq0+lDtR6mX7SRFWwfFR+8C/cjNYz7LxEk1LMFAIlL@vger.kernel.org
X-Gm-Message-State: APuU4Z81N/09bUX5lwXaMdJKepNFYma1KMSgdbmzXvvwyflCVq3SDAUp
	brVbG5tv1nf+EYoClkt7l8moKkxccGFYiJMiykTTPTxOROrtNURKl/2vxMTBpaUt1gZZ3rz/RwU
	kSp2fjjwfN9Bu5g+kRk8Atik4HadvFlkfeKcNv1mEs4JBCGNtPwULE8P+is3Gyu3G
X-Gm-Gg: AYBFou0l20H5AAjUfwity4OSa/CqnNiMJHLpx6K15BmtOKhIJVH03bZFk8m7c/apD9x
	hTiaCLa6alJLDeDzwJheflo+ik9l9SY5HOrgoC0XH0sLrZ11K9Eb2aGGbejgPx6ZTaoka1vF+Vb
	zM0Yad2Hl6r3YkbfjsT4Bv/02BRkVgLdFQTfnMCqOQ4d0LUkyBMk2zF6QhfENqqeKO1Ccr0DoAT
	gAlrxFE1eerw4mhNSGscIYm+5XbXvlp8jsh1AoHftD29lIvyn81gz+g7mvbWIeQAINgeUrBNsPL
	Hm61tMQuyXp0hBEhzXXaKOnRqN0uUAGxkOsUN7kY8gqRlL5uSvmoeo4mKW9u7FdNdUC0kgNv8Hb
	qUDlCisXPtA88+ZZvLf/XJzvX+W7osdgNiFtfOkP7bZ9JgoEiGJc3kqkm3RLibyx+OoeGW6mcSO
	0EFjoipQ==
X-Received: by 2002:a05:6a00:2d87:b0:886:281c:98dd with SMTP id d2e1a72fcca58-8a9beb61305mr7142664b3a.26.1793617583569;
        Mon, 02 Nov 2026 03:06:23 -0800 (PST)
X-Received: by 2002:a05:6a00:2d87:b0:886:281c:98dd with SMTP id d2e1a72fcca58-8a9beb61305mr7142622b3a.26.1793617583012;
        Mon, 02 Nov 2026 03:06:23 -0800 (PST)
Received: from [10.218.27.184] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963cf90sm1795605b3a.16.2026.11.02.03.06.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:06:22 -0800 (PST)
Message-ID: <c3de7659-726c-4fbe-989e-148bcd13bc49@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:36:16 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Add EC thermal zones
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
 <e77c0255-6299-4718-aaa6-04f4366fe749@oss.qualcomm.com>
 <5d84ee1b-a765-4d6c-ab01-ca1a06a0e3d0@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <5d84ee1b-a765-4d6c-ab01-ca1a06a0e3d0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 08RFHCT-lCktnNamF6FiPTgAux7ecjc1
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae86eb0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=7-sR13JiO9-Nskhq_G0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 08RFHCT-lCktnNamF6FiPTgAux7ecjc1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX5DyFI3NIJDfI
 QbsjyJGLIShyncMR9D1hUTxDri8VWQ67BxVsWA0tnr1lh5jvW+4BivmYhdt3e6aGEEFsjbtMa6g
 rE6P3JaNB+/9mGD0oRSU3zes+luK36pIN3hivT4RvJG/Z+E7A+tiALAhrWeNvM9nnqkm+Ji5Ftv
 JfoFHZ17SxalVDswnnNv9KPkyT+A2aCIgGcPg6/uD1/MjQB1MEtZ2aOr6o1GhH42IPUyrkoxKd3
 LMHs0gwC+G3gj48WBIhmNQSO/aYGqSvXjkW21+2W4B1FD4LsfqIV/q3UzpeJaq5EjDAGl5Ez3uz
 t0o5YEX1tawI7x4FZrQsetMWzKLmrrFZxJlCJ8ghm68HaxvVziHjg5Uz66HQ4URBQrkBznNyO+B
 Nm7OxnuNmWgTgEWcPH9tlrvxCmlutqVJIKd/Kk8BDxvQ380GWEp1yCdr3ocn+kBZt4QkUDBiQWU
 uI9eJN8LY6bd3wUzz2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX6Kgr8BnwH1Bo
 dklwHfy5k53dHVXu04tHicmYR4ZLXoSg2zUizLFHCNyF0+7hwnNm35Ci2qcjDObxQPa8SljvOcf
 4Bca6DNknOuztl6pufr07E6BsKvw7G0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020044

Hi Konrad,

On 10/29/2026 2:38 PM, Anvesh Jain P wrote:
> 
> 
> On 10/20/2026 1:33 PM, Konrad Dybcio wrote:
>>> Add support for back cover, keyboard, and SoC thermal zones through
>>> temperature sensors hosted on the EC for Glymur and Mahua CRDs.
>>>
>>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 45 +++++++++++++++++++++++++++++++-
>>>   1 file changed, 44 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>>> index e27c697e3170..571c98124a40 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>>> @@ -594,10 +594,12 @@ &i2c9 {
>>>   
>>>   	status = "okay";
>>>   
>>> -	embedded-controller@76 {
>>> +	ec: embedded-controller@76 {
>> "ec" is a super short label, perhaps let's spell out
>> embedded_controller
>>
> 
> Thanks for you review, I will rename the label to embedded_controller.
>> [...]
>>
>>> +&thermal_zones {
>>> +	ec-back-cover {
>>> +		polling-delay = <10000>;
>>> +		thermal-sensors = <&ec 2>;
>>> +
>>> +		trips {
>>> +			trip-point0 {
>>> +				temperature = <90000>;
>> This is *really* hot!
>>
> 
> The 90°C trip value was suggested by thermal team(Manaf Meethalavalappu
> Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>). We are open to using a
> lower value if this is too high for the keyboard and back-cover sensors.

These sensors are intended to be controlled primarily from userspace by 
the thermal governor in thermald, through the powercap sysfs interface 
[1]. We do not plan to add cooling bindings for these thermal zones.

Based on discussions with the tuning team, we agreed on a hot-trip 
threshold of 90°C for these sensors.

[1] 
https://github.com/intel/thermal_daemon/pull/614/commits/7f3dd62353e039957e52eeb40c67ec388d543ebe

Thanks,
Manaf

>>> +				hysteresis = <5000>;
>>> +				type = "hot";
>>> +			};
>>> +		};
>>> +	};
>>> +
>>> +	ec-keyboard {
>>> +		polling-delay = <10000>;
>>> +		thermal-sensors = <&ec 1>;
>>> +
>>> +		trips {
>>> +			trip-point0 {
>>> +				temperature = <90000>;
>> Likewise
>>
>> Konrad
> 

