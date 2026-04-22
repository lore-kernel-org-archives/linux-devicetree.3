Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E893CEB8F
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776855893; cv=none; b=MvewsFJ3q/1lF+BlmqvtvhxhPIIW0UsyYY4YalMm0QvJSO3HhoYdEGgMgJtpWGNhaNMGjFG7i/Vv/+7r6+oSwFBePd8InWZtHYh9GTIIDrHVYhU33yaTNJtJvIzLaFS0WnzNLW8IsgQJ5aMqihEa5XBBThLVeOdwQtx4XM7kFsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776855893; c=relaxed/simple;
	bh=z9lv9+r5ppYRjtDnLSoQ9OQK0S2aqiF1TS2qN+3D6nQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RWfNmlPFgRF1c8Ctns3mOrQITEbcCdgh9mBloV+SHlELVwJvxQY1TzQKDVrQjmCL/l03YEOyhCAiW6g6Di76GjFRb57ExTPsv8RnZSiKhNQwsQA+A5y5QLwfjOYVndHWlcOwNzab/W7QUx+ALcI34ISTu4jMDyMaUFMKDqEtcrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LAYTeyj+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T214GSNZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LAYTeyj+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T214GSNZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAqJIm2209073
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FWXy8OcOaaCu3NIsYMYMqkmcBsT+jSpnay3Mi7lFK98=; b=LAYTeyj+ptuNJaFB
	aRLA6KxE0DbvHbCDFlxnbJ7ybD781xIxypEtyep5OEawh5lYYWIL9DebLpxLW9cu
	d9YHlV6Mc2ZHNps7lS4S+78CKuJytUQyogmGy6tm/pi+Bslq8HPms4YeUlzmueF3
	Jt64oButKmbrr2Dfx6Id5ZXP9AO2nDKoZ8rp+XOypW5eqeLnh7/RBHg3XBN9ZBCR
	BYYkJcqgpIs0lpQv/CY83BbwstZfnbwZZKVc18qtZL62BU8CJlXeKCgQDkNccTxQ
	9iA+agStwJ55CSznWHaWa9zASGS2Ce2x+Htv4PaMLDhqRJGLdazy20b8z/GZlfHB
	wDPHUA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpengb1e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:04:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2ec948174so49788965ad.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 04:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776855888; x=1777460688; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FWXy8OcOaaCu3NIsYMYMqkmcBsT+jSpnay3Mi7lFK98=;
        b=T214GSNZ4cZ5ATz1IqN20jBowEYfD2Mu1DE0SL8ujlAsWTokUv/t0s0aXYg27xS16k
         pW/+NJyMvgQgh7C/BvXO97CdUblTwFAhtMuiCki/hvyz/xr10bw7x1b8lAUaAsPPuc5l
         dA1EAITATLIeMwuAqg3+z/P7FF2vBuud/ywfwSiXrMLoH/7u7/+nalE7HDxf4aw3yD60
         fNTBqwR2jVaaKEGqloHHLfPqbQf96fKJa7zEGoASxotyzrOJLcL0Jw2Dg89VTtdxQdq4
         6YIewLx1YkO/icIdj2l8afMcKqnZSwoWNV5Zfy8KJPD9U4+y+p1e0KrXlwbHpgFyzHs4
         MRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776855888; x=1777460688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FWXy8OcOaaCu3NIsYMYMqkmcBsT+jSpnay3Mi7lFK98=;
        b=pmukIXcB/3ngQzCIHUS9gyQz15vfm71YueCDUys0GQ74i50o7IXPZVYCa9KHuZCjw9
         qV/YgchGQZ8KxGiOeOKaxG/ensqQbyEcoeRe070Y5SfkJe4ovJ55o5wCO0tdwlTkuQz9
         ke5bPnY6n8CTNjJSfqwHCx3BH2ahv/dswqLbSGagm9EiNwPtFOoms/X4dnNNemJ1lhZv
         rBmsw/hQKBQN0qpJ45g72ir6q5YkOnguEGa9zHEfzUT6h+SK4JPeHhzGUUY3MqPRflbu
         fV2+8cDJu7PwDyeRL0ih6lF0q6lEyAwo0/qNc6nOAMzoYPtpmhf2CXUbxZ/OhC16fiBy
         OzRg==
X-Forwarded-Encrypted: i=1; AFNElJ+bnZZu/I4eZyGDbL7gDBp1WaSmufSVE3poXKyBfIE1IOOsJ8HukuGS9XoWY499fIDgTgqCfdGHrfLF@vger.kernel.org
X-Gm-Message-State: AOJu0YxYu+/flvxBCHO9YRu7DJR9zzzgbtK3YBkelcAS6GWLeg4EVyJg
	Gv14aXEnqLfeHjb3+ZL+kOyrjIWm3XnoYVBYfywU8oqHJBTqLSI2ziWCdbXyovPJlIxuJenyoEE
	m7C1QA3gk/5h9adnu45MPU/9aDhBv1GOmvqs1ko7QkrMuNqQ07qtKZbmcI0Phjj6h
X-Gm-Gg: AeBDievad84W2BzHU299WMSopF2xGScYF1/+aH586xZ3X0CcCbKrXhpiawQuAmEfjci
	PYAy8PSjg5i1XIW4wEm94GLTxWED1qakoUzc/BBBAblOR2p6nu6r8XswEddBepCkEVRJx0YNmJM
	A+eEThgQqOAjmeV+1hkx/ceNTBPlMmDVRZa22HXgqT2X2wfQmtp5HR4cRINVBSNP99ZMOV7s04s
	mEi5Z4SN5MkxNrm5omSuPraN6UZ4rZLTTJuRZh21rFwhpirzFfH9EEa5G4sjn3DuFXzm1etG6UD
	3iUlyNKVdbwa2/n2hUL2XUzX5YTE26Mupt+ZJkIuNilVqRlz5hohfTth3L0t1YpCny3NZ9nB8kq
	YgdvOg2RPXmpCBu/ZHEXuA6t9pHSXt/SEHl9XVd5u0sITwnMo9X/lIHkbC3+m
X-Received: by 2002:a17:903:3c70:b0:2b2:58c7:2ce1 with SMTP id d9443c01a7336-2b5fa02f3famr239283865ad.36.1776855887739;
        Wed, 22 Apr 2026 04:04:47 -0700 (PDT)
X-Received: by 2002:a17:903:3c70:b0:2b2:58c7:2ce1 with SMTP id d9443c01a7336-2b5fa02f3famr239283565ad.36.1776855887265;
        Wed, 22 Apr 2026 04:04:47 -0700 (PDT)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm163267555ad.36.2026.04.22.04.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 04:04:46 -0700 (PDT)
Message-ID: <79926b02-a892-4e59-b794-e8534136fe07@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 16:34:42 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable retimer on USB0
 port
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        stable@vger.kernel.org
References: <20260422093924.2976069-1-prashanth.k@oss.qualcomm.com>
 <6c2c5fd6-c032-4658-9a15-039c77074c4b@oss.qualcomm.com>
 <8cb5e28c-1c6e-450e-855b-32491ee73885@oss.qualcomm.com>
 <3d50f17c-060a-4a1d-b539-1bea9b3e6cd0@oss.qualcomm.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <3d50f17c-060a-4a1d-b539-1bea9b3e6cd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwNSBTYWx0ZWRfX9kLH4h6ny2S2
 1t9sw9JT8dOnnJM23HrBXwF7z0OhLiUOEomXwVPij3zx2cIKfBltkbJQ4f9noAmdEhVVt4SijfC
 7dObJhoSal+QoWHaVU2sEHjZovFaLoUy/2W0bA6nJ3RrpLj8IJdQPSaIQCP1+KaVWze2KyvfmHD
 wso//KK6pM70ksPXTBa0+wq+H7atXg7ubB47b3P/rm4SF9S1LWYA2FOIESq0/6VqRJMCMmIjMYv
 8bw/op5yzCoexgFYAGhQsIQzqoLUK070CjffAAiKzOBqr34XcumYqQYBd/SaGV+pkPp4CzPKslZ
 IbJfIuQKn8Re8jweoE2DTZW8Nr7RrzvPhAVQjKR89QgggXUj8+vn9gbi4sZnGVBvdlXLOR0Op2+
 iKEUOnfcKuZc2PbmnOkyOSAgkwPxYfYLkd56ixV5EGkd56e7iFEB2F1hBCZB/AOZX4cGM5VDMIb
 yJ5Z7TcsHyoOhueN0ug==
X-Proofpoint-ORIG-GUID: QFNArv7AJ9PB3bkivT3dRvCh4FOaULIy
X-Authority-Analysis: v=2.4 cv=RYygzVtv c=1 sm=1 tr=0 ts=69e8ab51 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=tEhQ0zN8AMmkZOfa3WAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: QFNArv7AJ9PB3bkivT3dRvCh4FOaULIy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220105



On 4/22/2026 4:13 PM, Konrad Dybcio wrote:
> On 4/22/26 12:32 PM, Prashanth K wrote:
>>
>>
>> On 4/22/2026 3:56 PM, Konrad Dybcio wrote:
>>> On 4/22/26 11:39 AM, Prashanth K wrote:
>>>> Add the retimer for usb_1_ss0 port (USB0), in order to enable
>>>> super-speed enumeration on that port.
>>>>
>>>> Fixes: c11645afb0e2 ("arm64: dts: qcom: Add base HAMOA-IOT-EVK board")
>>>> Cc: stable@vger.kernel.org
>>>
>>> This is a feature addition, not a fix
>>>
>>> [...]
>>>
>> Sure.
>>>> +		ports {
>>>> +			#address-cells = <1>;
>>>> +			#size-cells = <0>;
>>>> +
>>>> +			port@0 {
>>>> +				reg = <0>;
>>>> +
>>>> +				retimer_ss0_ss_out: endpoint {
>>>> +					remote-endpoint = <&pmic_glink_ss0_ss_in>;
>>>> +				};
>>>> +			};
>>>> +
>>>> +			port@1 {
>>>> +				reg = <1>;
>>>> +
>>>> +				retimer_ss0_ss_in: endpoint {
>>>> +					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
>>>> +				};
>>>> +			};
>>>> +
>>>
>>> Stray \n, but you should really have a @2 port here as well.
>>>
>>> Konrad
>> Can we ad port@2 and leave it empty?
> 
> Why would you? Just connect it to port2 of the connector under pmic-glink
> 
> Konrad

Because the port@2 of pmic-glink (pmic_glink_ss0_sbu) is already
connected to usb-1-ss0-sbu-mux (onn,fsusb42). This is different compared
to other connectors.

Regards,
Prashanth K
