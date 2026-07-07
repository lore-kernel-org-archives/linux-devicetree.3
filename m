Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F30E1E51E0
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 23:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783466587; cv=none; b=n5EbQIoCW+pxK2D3TWYaNQrNHBcyvuvDJUSpaxbAvV3GP3mRm1s6wpyJ2222rAW6u3Xkpb9BqABqfg3PBV75EkFHm6QTJXIoOtuJlrLkYxuWGRyLCOK72AZyjm8FxcPTsiF1+VDUA4e56n7i/I79qQzId6Rm8IRs0TqJ2RWmUXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783466587; c=relaxed/simple;
	bh=SJa3pQ8h3Kv91gDuryXySxmy3NsotB0qcSocnnfjDdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cuDvQliYe4Psh89xNCsRwxTbFX/VIr+YAvu79HpNoxz6iBs2+oIVSy1syot6qW0kBd96LBLCp+AZlKDV9zPZV8MEDJl1MXVR2WMe2p3wYlzbDIlsftxKyndjGupOTBIKMEdeFKQ0HtyYsDeZMskjppCUblZWOyTq4EUTRZ5H2PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JaKmF/A4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f40nOzJR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JaKmF/A4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f40nOzJR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667McmRK963190
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 23:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3qcPbC/1smoMIhS6pthmDany4hLubp0OaErXI33GxI8=; b=JaKmF/A4ybzL+k84
	G/bjkBIdnWPmluT5B6mXJIwZzA2RsAFLCXR+yPPxIH/P87FdbvYoG+6rxj/j9Ll4
	LlpInFwxRGbInHqT/2lLPiD5e0j2FuET8bBs5HZubWoSuckejgJ0XKZWwMTRqCkm
	sIg4kwvSrwSlpiwRgl8YvVFHUrE97z3q9z9U3YtguPlt2+8dmvgzUvTrsHTRDh3h
	azbJchmeIpYpW1rV6yyh2ch07OsnP3xrwrtQJK3bGkbpYVBStqHPOyTgKsnlGKMR
	Q8jSsJwSmqUHUNW12Lvsou9f/n5TmM1Z4L1O6LNmNreMufl/jbhFWzFaeAq+r++d
	2d+yMQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep3s8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 23:23:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9fe2607511so26548a12.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 16:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783466585; x=1784071385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3qcPbC/1smoMIhS6pthmDany4hLubp0OaErXI33GxI8=;
        b=f40nOzJRKt1oRlDRH7BraqpGq0Cr5NTHuHJuM8iJ7qOhL93OR4wkmBhkUEf1mXMJ9o
         E+tynEawlwz3XUi/ugytlQeWMVi4ptXOSgnelJ9wP+RI3YOAwLvAGKYv6bGREgbcNIVH
         lfcS/+yLjHWzbQe+kHWP0SgHmm00I52hGdVrUPqFrOWTOhF0mCUNDG0XuIlL0dJ0BvGu
         wZfVdYahCc5MEVRlCozdy7uEwCWWBQnY+u6/T++BAdRMmBnYlCsbBQbttFcyKxhq8HkE
         JxsyH8Kfn1Bl3lVUg6jA1Sl5YMf3A/uFxu8udEAk3uDynXNYipv101qHnAr1DXTwYuDY
         wuQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783466585; x=1784071385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3qcPbC/1smoMIhS6pthmDany4hLubp0OaErXI33GxI8=;
        b=m6JlSMqoh0aG6LStCcv5Zp+OmHQTm6PXtzO6p1jORKIoza8jGhZsSSuB4dTMn9Cm7L
         7xrD4DskzsDh/LMGzWsZ2uVhn/oqynZWX0DJ9XSiw654GQ2y9Gn7ZEy5sNzVTPy6eGlv
         LrAx1ZYI/rJtONqKVD6C4XqGuHzC7yhC+VwiYNf7RrIU6C+fPQ250zTRdnJJinCEQTu6
         ObetQJ33/ThNNEMB0oCOiMPLb/TafReyrCF1doYjh14I9A8DjdxSkoq1eIwtFVb7DH1e
         OEoneU+SY6KbDOyyQKXrqzjNLfJTeeDGScQBz0cZauHfaK2KviLCHF9/Y+5QXKfLL9d3
         iG7g==
X-Forwarded-Encrypted: i=1; AHgh+RrTy14QLk3D39q3ETs4NMNl1pTUxKRgOjtIBPEG4NT2+5rLmIBscdTJxuZO04OwXtY0ejf481SE3czW@vger.kernel.org
X-Gm-Message-State: AOJu0YyoB2JbdefrldyZUCn+8EfKt8hHxLNsML79Aw1XdIkZZTcLhs1r
	3ThXbi8iz6Tiq55MlM0MWQuYZv0ltcYSoaVaMMiajokdDjG5ZijqbyTgqApAaIsE3ppU5lqpFVX
	hLGd3EH/cOOdgV1nBQe/Ktz8kLGOQY5l88NAqYJNOsFpkGqjYa++GHFGQVqV+7vKh
X-Gm-Gg: AfdE7ckYtT/AGQNVeoiF3sqPmTD+uTdzS3H+njrgCTyg9jgLUNwTK0EW8fIG1GhNjoY
	6BV2ChRnOSSh5auLHwJ1ZvE4h/uMh9EHGwfVqnIht8r3hSOdnXzysvftiG3d3B9VsLj5Y9KBoPW
	pYX3Xa2Nv3ru7rsLqbqr6x/V1iCVX6fMKiLjQlNhrWpKUZn1MkIKPDIou3LZuspOFMNhOxJ5Z0s
	cUz78H6vXxqY3ldLOq/k3JZxjVvzbOkiAQxj98M4qq9hsVOUGjcoRJkFtJfAg25kMuODMLm+wTJ
	r1tqmQyP4ulGOKHHyRij1XenybhEIOP/17HsLmg8X0OjeXSy7Bp6sPIN+LXQofSfrz1MwEC1Cpz
	tgq9Cw14SLBe2s5kkMSjHKIuBzzujmK1MqQ8NwKV+rhxt0PAlkCrPJvX2l5S7fTKJMkpR2hSZEy
	4Yarc=
X-Received: by 2002:a05:6a21:3295:b0:3bf:a36c:5498 with SMTP id adf61e73a8af0-3c08ef78172mr8408713637.48.1783466585184;
        Tue, 07 Jul 2026 16:23:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:3295:b0:3bf:a36c:5498 with SMTP id adf61e73a8af0-3c08ef78172mr8408679637.48.1783466584626;
        Tue, 07 Jul 2026 16:23:04 -0700 (PDT)
Received: from ?IPV6:2603:8001:7f00:fc12:b897:54f3:b10a:6577? ([2603:8001:7f00:fc12:b897:54f3:b10a:6577])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm13112035c88.0.2026.07.07.16.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 16:23:04 -0700 (PDT)
Message-ID: <088fa4b1-1b5f-4991-97b4-9654eab66253@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 16:23:03 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
 <cwc6a2d4fasizfe54f6yvpgzkczbygjzkcoo4jlnn6tjaw3pei@m3py42bcnooc>
 <a8ea64e6-1808-43d0-86c1-e71d233f7846@oss.qualcomm.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <a8ea64e6-1808-43d0-86c1-e71d233f7846@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9e-oTTgtQVMNo6WbXo0s5rXjBkx5weIv
X-Proofpoint-ORIG-GUID: 9e-oTTgtQVMNo6WbXo0s5rXjBkx5weIv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIzMCBTYWx0ZWRfXzZNLssi8+ST/
 VJAL3G9CJARPJ0Y+rqefu+K+LfHxUk9RmcFD0NwegbTi/3E0p5GBCQLsL3pfifU12LAwbSmrvlK
 mwia5soc2hG4Xf9e4g8hWJUMeIV4GHWfeQ7wCy1kCm2IZwdqJtT5DwryNtogIp5XWMFDmNX7l5U
 uGes61YGuf0VJYYtNdJLZn/NE6GGkt4+GNkhYOKnLIhGh/c5kdFId1dEMYz3wRiK5HWjXAZ45i1
 bortFuKheikaFLz1UvJNx0bhYy9bqGcd+wYDa1mstgXeDR5nZPlaH6uCbgrJfd2sTPHeRX84pi1
 L5eUFrKDUbyk1LHsCcYxwDrdZdo6gNLDgAD9gkx/D8LUbjCJMV59mqNetyKLZ5hPVnt5h34dMEr
 E/uk6FIro+Wk7xJz5FZy8IlcWoCNZUIxOwDtu3Hrgr/qOAhb99+cIA9wMjUTLpLKnXQfhkhaIaC
 Xx89NZPlRwvHXMRKEKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIzMCBTYWx0ZWRfX0ID9UQ3JlBUo
 6H8btFN1P0syKQ69ZQdonwpCcIb/Gb+Vl6lNV+ruK/rHsmIahHTxoukb0ZbMzGedzFyx1Ypb8aj
 nNk+XC4dPRjm6YHJ4NMc720P/WSFKfs=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4d8a59 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=euQb0ivSr0ruaFWTCHgA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070230



On 7/6/2026 2:27 AM, Konrad Dybcio wrote:
> On 7/4/26 2:05 AM, Dmitry Baryshkov wrote:
>> On Fri, May 01, 2026 at 10:06:27AM -0700, Elson Serrao wrote:
>>> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
>>> independent High-Speed UTMI paths, depending on the SoC configuration.
>>> Each path is distinct, with its own connector/controller connection
>>> and role-dependent UTMI routing.
>>>
>>> Because the EUD sits between the USB connector and the USB controller,
>>> it must relay role changes across the UTMI path. In device role, the
>>> EUD inserts its internal hub into the path to enable debug
>>> functionality. In host role, the path remains directly connected
>>> between the PHY and the USB controller, bypassing the EUD hub. These
>>> hardware constraints require per-path role awareness, as UTMI path
>>> roles may differ.
>>>
>>> The existing binding models only a single UTMI path and assumes a
>>> uniform routing model. While sufficient for simple device-role-only
>>> configurations, this representation does not accurately describe EUD
>>> hardware when role switching and/or multiple UTMI paths are involved.
>>>
>>> To address this limitation, per-path child nodes are introduced to
>>> describe individual UTMI paths through the EUD. Each path includes its
>>> own ports description, allowing controller and connector associations,
>>> as well as role-aware routing.
>>>
>>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>>> ---
> 
> [...]
> 
>>> +oneOf:
>>> +  - required:
>>> +      - ports
>>> +  - required:
>>> +      - eud-path@0
>>
>> Do we really need a separate eud-path node? It doesn't represent any
>> particular part of the EUD device. Can we simply add more ports to the
>> ports list?
>>
>> For example:
>>
>> ports {
>> 	port@0 { endpoint { remote-endpoint = <&usb0_host>; }; };
>> 	port@1 { endpoint { remote-endpoint = <&connector0; }; };
>> 	port@2 { endpoint { remote-endpoint = <&usb1_host>; }; };
>> 	port@3 { endpoint { remote-endpoint = <&connector1; }; };
>> };
> 
> I think this was originally born out of the role switch framework being
> strongly tied to a single OF node (because the way they're found is via
> graph traversal and not via a phandle)
> 
For additional context, the rationale for the path-based topology was
previously discussed here:

https://lore.kernel.org/all/CAO9ioeW7O+arR2VdAZboty_cAdtYm--ppMx9RT3nTQpJbTGccg@mail.gmail.com/

Thanks
Elson
