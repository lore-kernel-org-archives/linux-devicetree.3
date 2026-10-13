Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF623FE34D
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900927; cv=none; b=Y6rDrrRlRw5hok+9SuSjrJQh1guZJuGVycVw02FmD6aW4C9vGXiN1xBVEgfgalnfycyofZHbAGpy+eZXqF4q7+y9m6eKjLTgVdzphv9sZ1oUY2oTHJJOfi+MF1p+tNi0nKTi/JL6luYPTpGUrcRImzvi08qms5HNwn/st8GWlfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900927; c=relaxed/simple;
	bh=Emg+OkO7QBbwSBpYFEASaSwaBOIaLaMY76HkNKUceGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HJeN5BOCO5wZEFhBrAPyhuVG1S9Ra9czK4mjyB2UMricmCuVaxdzelNCoPDkdh3s2kR0k2RlqEJGH5niR8nGJvGU0uxY8+IJTDTXrLPhBNJQWZtWqn3T+W8nSHB+ecP2kIYJurbZKIF2T4IEOEPkS3YOV8H2srHyoXGTqlyBI8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G/e4UX8j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=biUZuMu7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G/e4UX8j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="biUZuMu7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE3wkM1492088
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8CZVWM1ZfL+i9RUyAbx4kRYDFvtGE4TrDaWJXNG16OM=; b=G/e4UX8jRVF2CpHC
	3h4jFPZQKwnXFfvPH5dPqHXMEZjfKy8EBn02dcvJWCpVNFCEdL/pFB3+5X2bPnbA
	tPfu2lfX3WKYlRmJ4GEu0aHSA/ga9IQCrv0P8aP4V7+1fEMCasaf2NV5qPjMXB2L
	2RnkX+hS75GecZ2Ck9RtBZZXb6uFqcIrOttYGowalTg+UeGwHm8Bi/RrHtGuUPVE
	FvwYXUR0fk8fJGQ0uNgSlfqPVESqmB9WZ4jztgVNQH+JW+oLAuXydN2k9R4jzVdf
	aeTF8FS0O+Z0vjmQ2A1ltiNdc1pdxBX4TXRZRTmuzjXDqPFrO2msiJ+KN+ad/63g
	wtQGiA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9daqte40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:15:24 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c274c15c90so74486137.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 07:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791900924; x=1792505724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8CZVWM1ZfL+i9RUyAbx4kRYDFvtGE4TrDaWJXNG16OM=;
        b=biUZuMu7O7MLxnEbkBkDZzk7cnP+85qIRD14NsVEVcu3etTmUDcGIb4Oisbu+XbzlK
         Vfowls7itgCLQ/6nKORILduHuwmzv7BUEOA4CApPq7MH13v+HDt/30/EwlSxU481P6h0
         N1b+5Ek8CWLEuTPyVHIINWHcTbELQOp5edVzp++PYdvHNdk6QVzIfze/VVirmfCxJByV
         CDE3cZRyeT61kD0r6j3vfWJedTX8ja1RG6YbUINrqOrzeEfgKgqFPK3NBqwMGR1vItMd
         Htxs2qT2z5o0nH31XiEY6IvxxE0gOp/6dKo/iO3uxcXgufdwVCr6P9pjzjBRxGS4/986
         8pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900924; x=1792505724;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8CZVWM1ZfL+i9RUyAbx4kRYDFvtGE4TrDaWJXNG16OM=;
        b=LcmDTTvu4KQb9y7emp589f2/R00dhHD82r7Cbci+k34PP8uZcnqVzGs+krDsOLm53/
         LNZt0+uy1bsC13mbUZMO1umCfZNwsL4HH7nkdfjMHTmZ1cz/M8ZTbIuj6G/8IpFXmPFO
         NqFqFZSYI8bp9aFbNu/rEPi4tKP3wmL1gXUWNKswY0WokotJEXZHaZ0FuPovBIVXxJiM
         6qJQm+ZR3Q/mwHPhyfL8L16X0h67C+aio3N0e7sLOXZkwfDytUNHh8QadSzfHh/btPcX
         T35CGYWAneXvp6RiJ7iV4O6AdAjWSvOCgfXD4Vl/VLVi9fZIlgRK1goy28t8FWVoUPvh
         pzjg==
X-Forwarded-Encrypted: i=1; AKwUvBzn+J7J3+TfxNzEfT+x+3PuiDUC9nWryRdA7vtOOgbuvYEAqFFWwEE6noTxLZrpp2o4QNqGjIeu31qy@vger.kernel.org
X-Gm-Message-State: AFq9FYKf0OGqsNBXC6WIP47PUyQ9HrrtAc/GOdGLlvyPfT2Dv/Ldj+cO
	/cak1tSzh4HdMpEK+45SCsuGXlkU3uziBsiaj4aeYXJGfxLgwEUj+aCQtAzEhDWe1OQpXlSQjgp
	OD9LkmOvmW2HijYPIqb9MK/iwBVpELeb1FskcbT3qVYgv+f02hMGUjwnD5RKCSM3Y
X-Gm-Gg: AYBFou2CdQVN+PsT5bvmcjR9kVmn7T6N2IA8N+uCa240iUuM0qc5YJYLor3B7pgnSHP
	Wom1T8XNKBn7mxNKVs4kc+MKHUp/vJVz8c8txWAvQw/B9mSbJjib1JmkBcDGs5W+xTwiiVMF360
	4xX85VtzeIgbs1e7WrcTblSvAwPoTB/v7ApfxxW/L9gABwkG2fxw2LQSO/GG4dQ+1L/8+V4Mjlv
	02NKDT0VDFOKL9RZeBnNPZlPX2EoeD6WsgJ3omD21fH7ZPIckE1KbeWZtRiqkC1+rkuB+aSfE5l
	e5XKm9ujked79qqmZNgFIHegdBSyC1yXSwO3hVlpmqt03chOsEml2azahS9QZClyMThtwCpdJ2o
	f+Zxn8WB5cfTuP4cPuEj5wg==
X-Received: by 2002:a05:6122:8711:b0:5e6:6546:84c7 with SMTP id 71dfb90a1353d-5e91f339ea0mr2872724e0c.2.1791900923876;
        Tue, 13 Oct 2026 07:15:23 -0700 (PDT)
X-Received: by 2002:a05:6122:8711:b0:5e6:6546:84c7 with SMTP id 71dfb90a1353d-5e91f339ea0mr2872685e0c.2.1791900923323;
        Tue, 13 Oct 2026 07:15:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde913d0sm3740707e87.26.2026.10.13.07.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:15:22 -0700 (PDT)
Message-ID: <720f7b8f-29bc-4b6a-85f1-34df7bd5cca1@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:15:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8650: Add watchdog node
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261002-topic-sm8650-deckard-watchdog-v1-0-7d7f7d71d88a@linaro.org>
 <20261002-topic-sm8650-deckard-watchdog-v1-2-7d7f7d71d88a@linaro.org>
 <f6febe84-c7c2-4aa8-bb02-5b56c63abc6c@oss.qualcomm.com>
 <8b331c92-ce18-4886-ba87-77b6156cc9a1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8b331c92-ce18-4886-ba87-77b6156cc9a1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ou8yKTitKO8IFWNPtoM5-6LEKjzv25kf
X-Authority-Analysis: v=2.4 cv=FZuiV5+6 c=1 sm=1 tr=0 ts=6ace3cfc cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=A_RqQ9NLQzPOhAJlhEYA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1NSBTYWx0ZWRfX1fE7uTLbE1US
 X5JAuzmwPQuB/G4oNhNCgK8jD17V0yMmt9XFjGlRMsgG5/LVRpNvXPpqrcBa7chnKdIT7itwPW9
 N4jj/Nwzc5SbIAs9osn0nmH0eMSJkiI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1NSBTYWx0ZWRfXw/aJXVHJaQQe
 l4tpK0MVxSkkHyQWTNmdst5LUE9WecCXJ/tLj+yp/a0G2R7HCf1rpGlt22Fek183a+Hggdqk89q
 8upT/fPURj9UC7Anr/Hgf0ih8fPqIbqXq5PD1+1Gh0EVaJHBUfxe4mHT6Q9J8U2QhbI9qAYlniu
 LCnqs+EmFsem0zllCY7vxDhWcy5kcbNyuIwsgXptcvDoEPhia7CpeoqC7DQRgxMqTyr1O41/net
 XwPKPfWWCfki1JGSHIlX/4YMWEzE5OhvjWrDr/E9QjHf0KfKxLd+2OkGwo0Z7sDU1UmQexvi4Xm
 vZKOjNCctCsa8W64pPa3po8+Q2tUeV3hjqnK2itsXzsdjn4piaLlmQ+nCHzhdF13PqEvtoIANEB
 rcH89X9JpYhnWj0Wm7ohGrpr4gq7rcFBc4iCzZqhlEnSv0hgssMytWtfO/yrsufqm+V/hKiKf+/
 fY+cPEQ9BahwisMrILw==
X-Proofpoint-ORIG-GUID: ou8yKTitKO8IFWNPtoM5-6LEKjzv25kf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130055

On 10/13/26 4:09 PM, Neil Armstrong wrote:
> On 10/13/26 11:21, Konrad Dybcio wrote:
>> On 10/2/26 11:45 AM, Neil Armstrong wrote:
>>> Add a node for the watchdog on the SM8650 SoC, the node
>>> is marked as reserved since on most platforms the Watchdog
>>> is owned by the Gunyah Hypervisor.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>
>> Do you have a HDK or something with gunyah at hand? A couple months
>> ago qcom_scm_gunyah_wdt_init() was introduced to handle this -
>> could you enable the node and give it a shot if you have one?
> 
> Why enabling the node ? the qcom_scm_gunyah_wdt_init() will bail out
> if the node is enabled. Here we only want the node to be enabled when
> we are in EL1 without Gunyah.

Right, sorry, I misremembered and then misread

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
