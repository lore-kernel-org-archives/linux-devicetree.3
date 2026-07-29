Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0394A43B4B6
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317045; cv=none; b=Pxt47lFb/K9ay6GebB+XM/VDMArEF+wmSeK5JGnaZwtxEOoNCki62Zp/FRZybvPxx4ptkpLW1FQALatovqMbOZWXnJmnpvjto58X+Bd1jEmnyI4kqGoF7IU5EVDljeii4LxeSkajVVrLAsQNJmygl0srdqMTN7K52ko+kcJHBZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317045; c=relaxed/simple;
	bh=DnaxPBCkYhfPSJslYcQGqgj8hMjnklWS6dZq6za8Vgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fp0ZwacxPIJStRaL0dDxs9Hn5+zrotyVzcELKjlLflAk4dSOq/5S84GBG1NppYmzXYsg5xae2cPkWbpweY7KWYC3jXsgoN03UiFvT5aYD5qFzzdKzhZPR4wZxRua7c/bh/1i5Il+PgFtZ9IF8mVXSK1I07I1uAs3/WuvqNuGX/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a4ZN3zd+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UGW97eiU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a4ZN3zd+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UGW97eiU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7fIf91372508
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VMvaD5ZZHFjIgOBUc3cOIiKm2r4D1cgeWhUvtITUHDY=; b=a4ZN3zd++KWAQDd7
	pv1jh+uZ6MHsZzP4e5+SFn3yZTcIDs+el//r/S5hUlVfdRQpyFsAUvLOGFpVPetl
	V7NTXVNOJWYGFTABjW2ssJptARrEL3uUUG73cy3jQEqoIrPorsqEipLh+s8HGUtb
	cYdLvRrbJsDDWy0uj2ULIZOTG0aBcD6+4NfKDizn4A1086XwAH+em7dtyL+CgSS0
	otP2MLVrFvzegqj4UNDrjPJah+VIAq3EkImslVZX42KtYk2RUVHxstwq9HPCpeaE
	/3gLnlVrPDo9pEO65CKxdO07jIzyqShBIz+zVi4JHyFNKcv2e4JJIyomMQF07FAp
	v+homQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmm8vn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:24:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51e9d892f0dso2172041cf.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785317042; x=1785921842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VMvaD5ZZHFjIgOBUc3cOIiKm2r4D1cgeWhUvtITUHDY=;
        b=UGW97eiUL8vXXoltzoHgyZel4bHnI8hYRaloAbOeJiMXhNfLsTZJCvm14qIbd9kFht
         +7uuGbl1JO6WCRruzl3C3Eq+dGVzskX7ThovQfxVZw0NfJ/IsVlK0JSBVhzOFINC0CpZ
         Ilv1tIYIeguaW9dscppYfDrumKl3k34kzkD5l/+37oZAnl6/NhAErDNtFYcJBIJtcfIQ
         s52uCcUMZ6zKnMQug1bgbUXWxJuSdYaNNpQR3JTXCYRCfVQ/o0Nc7ROHBexR+2qwEAq4
         RS4/gDMx48QGt2JwwXeN1/5FWRH4RDZy64S9276WXB6TWI0aotxDuW3EhHooWPm+HbED
         TMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785317042; x=1785921842;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMvaD5ZZHFjIgOBUc3cOIiKm2r4D1cgeWhUvtITUHDY=;
        b=Iaeo6pJz5dJ/yB1CfOGf3AL/afVwbGO/ny4ATqqY+KNTPkmdoizGIVUaozij1lv5OD
         qF0SvK+cZZeYp6HNSA08be3U5M+mTPDGAR92yTmH9GwXOXkezuNTpxnyX+DWv/ADt4X+
         yUA88U7RMyVz7IzfvzCaAEVRoLrOjawtfG3SMrsTm5ba8JdomPHrETSO1sEwVm2cqnBz
         MVzgK1g/B54Sxp9L1DQF0Ux7y8C+sfLAAQQXif+M4uQSCi+r2KjOD9CAD612d72NwshF
         lJIGfrEK/OwFOBwuL/OtYtnpCjtEMkZmithBw4oikvU/R/Q6UnQlvTXqL2Rn9iJObUC/
         R2AQ==
X-Forwarded-Encrypted: i=1; AHgh+RoOJyBWkSgSsGpygqoWzN8HNIa9e6Zqgybi85YnfvO+8tFMNyQ7lBVGTMmDazLzQNcGcR6W8tRR37TW@vger.kernel.org
X-Gm-Message-State: AOJu0YxYmPzFtFK2+vTCHxopJDXUArtkInZZ2xHrfXRXd352ivlPDAH5
	TOfarsfMzUlS2tXdnhlK97ybhd0gFPiAMkA36nh21rSGjpC1sQZxgHamc4nj4/6wPxy7GS2aonY
	RyLUqNZyZp9G8KyEmiftLDkGE345wCP+Jruv2js8RdWMa49K0xQvv06WP7bWh3//Y
X-Gm-Gg: AR+sD11dlme4YkxlWvEFCnUZUCh3+NQa8NjIhTKkBR9664Cv1EzOa98QtetquYBHLwi
	u6gdHa9ls8+yQ4KRgq2qI7Ynquzf9sFWyTYw/Cy7bUk9UuL6CYjY/3KfRcMN9+wcoHvEwmpS6Ce
	TSf47kgZI7OHcc5AmL98VqiqOpODqWRrOn3W2p3lA5QlC9HGs5Og8ovHmmXDqmIlt3746QHT0SJ
	gut0QU3tfNW8cxDmf2j+sCme4j3MpDr4CogpkkTKlAuLTDmJChTS/uHg/EFnpfiSP5DVmVlA5Gf
	V32ICbNDncIlpYeJp3AVIpCxFmywd7IEqJLGevfauep3g5awp8v3dqxTGsTAD+YFk8nMqKCNfHH
	GLVLCrSdNwHqk00OB1bBid4fk
X-Received: by 2002:a05:620a:284f:b0:92b:14bc:7936 with SMTP id af79cd13be357-93302679d68mr452318285a.1.1785317042188;
        Wed, 29 Jul 2026 02:24:02 -0700 (PDT)
X-Received: by 2002:a05:620a:284f:b0:92b:14bc:7936 with SMTP id af79cd13be357-93302679d68mr452315885a.1.1785317041693;
        Wed, 29 Jul 2026 02:24:01 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050bd4a13sm606941a12.9.2026.07.29.02.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 02:24:00 -0700 (PDT)
Message-ID: <dae4c944-4c33-4cae-9b1c-22f9995e7217@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 11:23:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] arm64: dts: qcom: Enable USB controllers on Shikra
 CQS platform
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com>
 <20260723-usb-shikra-dt-v4-v5-2-5b69d9eb0888@oss.qualcomm.com>
 <1dbdd44d-070b-4abc-a79f-3cde09de7d74@oss.qualcomm.com>
 <40f21498-a982-4dd8-a7a4-36da8e647a77@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <40f21498-a982-4dd8-a7a4-36da8e647a77@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA3NiBTYWx0ZWRfX0e23iFJu3CBU
 YPcGoy7P1pAo4dWQZQ6ByXhxb06qAtA/3YOqfJEW2WtsA11D6f5Vaumts4129Z7aFBTP0IQTXbX
 AUUSMWvCIzEZZ0Wyx677DT+A6Dh9D08=
X-Authority-Analysis: v=2.4 cv=L7ktheT8 c=1 sm=1 tr=0 ts=6a69c6b2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-1RbvBRAzdijRCssOkUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: gffko5mV5t94hDFK5fFnxWIaiF3v3T4s
X-Proofpoint-ORIG-GUID: gffko5mV5t94hDFK5fFnxWIaiF3v3T4s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA3NiBTYWx0ZWRfXwoDSJ/DtXLXn
 QiexlA+qvD41pGE2Sv7CP2HHIGtfjxzljr3KL9IT+hnGF/CQrBEzShBOL29T2tLiVjlW6BP7+TL
 J2q4ffpA5P2UtCBOCBZ3srbdqAow3l4sVw2+59hsfW57ncsU6Fn6c3rXKBN1aH7MnYgqddNu83O
 JbbpcbAPKZK5MAAM/tpaFnh6MckRUrY7BkxH4Idi5JDemv7puGb0WYNRyzQ9CsKtZ4fCM35zOUk
 fSXdbhl8JGFzeDG+iRaobQBU0st0/0zlZ/H5ctOej79qHBU4XvahSxz0KQP4F0usEqZ9VCuFdaF
 Mn9JaB9fxOwR2Y7gDS6zomlF59d0HWVGri4VtnUSOykFUwyxZAegmsMYugYyucdRCJ0lmDHcIch
 +sISi+a2tNJmq/XpVQnVfvM6OO4I8zsLYhImDCW3tEaHDL5OWy5lnbVr/32QE/nM/rSjQCOV9i1
 ohSblrHIGn353PsPY3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290076

On 7/29/26 7:13 AM, Krishna Kurapati wrote:
> 
> 
> On 7/27/2026 8:09 PM, Konrad Dybcio wrote:
>> On 7/23/26 12:33 PM, Krishna Kurapati wrote:
>>> On Shikra CQS platform, usb-role-switch is handled by PM4125 on primary
>>> Type-C port and Cypress PD controller CYPD6129 on second Type-C port.
>>>
>>> Since those changes are not yet present, enabling both USB controllers
>>> in device mode.
>>>
>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>> ---

[...]

>>> +&usb_1 {
>>> +    dr_mode = "peripheral";
>>> +
>>> +    status = "okay";
>>> +};
>>
>> $ rg shikra-evk.dtsi arch
>> arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
>> 9:#include "shikra-evk.dtsi"
>>
>> arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> 9:#include "shikra-evk.dtsi"
>>
>> arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> 9:#include "shikra-evk.dtsi"
>>
>> I think I asked either in private or in public, don't remember at this
>> point, just enable these controller once. They are all the same board
>> with the chip and PMICs swapped. Override just the supplies in the final
>> DTS files.
>>
> Hi Konrad,
> 
> Shall I enable all platforms in one patch or in separate patches.
> 
> Reason why I am asking is if I enable controller and phys on cqs platform in patch -2, then cqm and iqs will have controller enabled, but not phys causing inconsistency in those platforms if only the patch-2 would be applied.

One is okay because of the reasons you mentioned. We normally prefer
one per, but this is a bit of a special case, since these boards
co-depend on the same include file

Konrad
