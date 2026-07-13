Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6473B19B1
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931573; cv=none; b=g8YmjmPbZz0JNMGS8f/+YPJAZ8K9rHMqDOM3yb3rBPhQ3rclMFPrBsuCqe5afriVz0xiPdzkw/Xdsh83HWwwr+OOx72nGZe7doUyXWfvbVjyaY6oFvkT1bezhfDGG//iOqkvi3sHrF6Ccf3WWuayCgjA7WnYsRqYCqViOM9WEgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931573; c=relaxed/simple;
	bh=izT7iG+kaH0m4tu0+8NdueVzy/iX/EoTNiE5/rPw5JY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ojqI9cOurWBoLFlxkH580aRg1OnadMfyPilVIU68Eae5FdO5Gm6ZCkRVw0umr7/fVcR0o3Q0lFkj47KCW8hUIVJkd+8MdmmT75Rmwkh+fqBBV1zu/IpYZJNkkyl+Rq2QrLv0QDo14TnGtlSETMvpbJHkIXBnqMWcBABdGYXYIeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oHw0H6+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CygGUTYw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHw0H6+J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CygGUTYw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7YmXP794265
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	orA8N+rUfuLziWiAdmDsk+WxJbTynnYWZ3oIdn7j9VA=; b=oHw0H6+J5xZGv9/H
	cYcjHa9QkeP6GovccH1Im00OpuN2zO2QZqbmUty7t0bcfod0fATzhPRkxGOaJluZ
	hSncl3RP84NXmP3QuVXOCVSLydo0nVawL9QgU+VEL/LxgsQvjA9hVWzwiwi6xcop
	9fWbCIwmscuPBQwP+w0zQL86A2egMhXtiT77aF2hQM//tnk5GxBfWCeguPAbQ2td
	Y5p92RpyFWZLJAbzC33iBy4g4ocLkODhi84WnoxHmGnlzIpteIiyCf4YLqYEA+6s
	4DCBpp0kLOJSu3Y5Z/lZesngIuC/e6CuA6rfl2rcxOd2vPE7s6mCRnJ+OUxxJnhI
	RMAiHQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn06mf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:32:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f0ed4fe79aso68567206d6.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 01:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783931571; x=1784536371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=orA8N+rUfuLziWiAdmDsk+WxJbTynnYWZ3oIdn7j9VA=;
        b=CygGUTYwOLXTWaHIPdpd60eKRw5/2KHxXhOIXtbD7hld9d8KhwW7LBFiJ412nDXHUO
         m2kzXGsB8deVT1x0cnYZT0/EBr6OARNluMqXtONFw9ege+1tzBYqj4VVYBJ7R1odgNdg
         RXAj0SQC8wYqM5+4Q4n6oCHkHmJ0EbUBAmpFmmytR4aEir3ykg9SDCgvjMkK7Sqi0PzR
         yV4BjcOnGTJic+Z9n385bll4PN7eqUeOPe8TuR97ff/FcCDJk3K6XW+jPiJnstIX0NB4
         2SUdowMHA2mDt49NxvDwEXDk6TyFA99nWoBDJl3b6FBinyP+VyrB3CZMs9d8NzVX2A8S
         BbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931571; x=1784536371;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=orA8N+rUfuLziWiAdmDsk+WxJbTynnYWZ3oIdn7j9VA=;
        b=eF/Pfn7VJcBEEjKu3FeerCT7dW3JAKtyzEjuvKgfBGh1xVxvq4gyMJNWo+NeZiJ/7/
         pyA+3FWXo2TJuweHeik71NngxGTLV6dzOAu58EwXL+rhw6T3xr/7qntqfzGf6pOKBHPX
         pO08xs3RUxPHA4VkP01bTNyAnIfe+0CtYYdVxPDfSRsRjR5K9Nf/rfNeLVce/A7s4Aw3
         HqigJF3uTz9N72Gcbo0p05e8FCDNFf0uEz7yuqPs0IpwcmiqaED+TPIETlFTGvWUA4Zy
         owvt0OxXpf3v+qaTP6GwchXyCdVnr64A8U+GyxTCftwxUMw4MxO/ap9Am/uDz85NZm5t
         z+dg==
X-Forwarded-Encrypted: i=1; AHgh+RoYxyF7p6zoX5SZFhD12F0OO8gE7eDgxQgVRv4aIvrlnq5RygsxoWJtMKrtVFZaDdamdP82e/ZJJqlm@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf8/pdRiLktOs7CZR6G/mAbBU5tpeZ2fxXFRxbJoC9PCX1Y0Lq
	sdTZLtJOzfY6l6c2V+4MIHzHLwH9KyKzP38rRVuEIIT0TmIIJVO2F4HYRBsBfdH3kUIHiYWrqVc
	j+ZJmfmAFw3ub8My9vppnwFUV+YJx4jUC2ZBR17NXhpMVLhLxT5cy5XDwb8WvNfZk
X-Gm-Gg: AfdE7cmbrd7i3O9cgvw2M/hWG9TCeM13rTD5If+PXiYB6tmuKsf5YhicYwmKOeDMloH
	UEc5t7SCYYLai46qebD+6sy0lDBgtUDRO0m4woam+3pzYEgvq68sl5wQ2cPCTSwGHcH0L+Ijmrz
	agn1mFCshZi9qnRTT0Na7tg2B3HoFSz5+/7YUqBBOaJppq8+01GPFJAWdxugxLLPImh1nF+U/dI
	Xe2Q7pWqjOv81qwF5OOrdc66U2DqI6joVFkZS5ZTFM9TBTEXaky/D/fhb+e3brxBxQBnkYGQcI4
	ACxmmo/SA42bsKcG3zXRjcw2YomkFqbMSWZ8f+x+/JAiDH01IPJc/cE3uY6wkG4oIGvACjfwJBN
	/QwLx/f+syIg5AaUicdPo/eqiPMGF9mTbVVj3skHMEOA=
X-Received: by 2002:a05:622a:34b:b0:51c:88b:d7e3 with SMTP id d75a77b69052e-51cbf0c4b4cmr79278261cf.3.1783931570536;
        Mon, 13 Jul 2026 01:32:50 -0700 (PDT)
X-Received: by 2002:a05:622a:34b:b0:51c:88b:d7e3 with SMTP id d75a77b69052e-51cbf0c4b4cmr79278101cf.3.1783931570178;
        Mon, 13 Jul 2026 01:32:50 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb51af39sm858900666b.29.2026.07.13.01.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:32:49 -0700 (PDT)
Message-ID: <30a35954-4d0c-479e-8918-9f7a3a049a5c@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:32:48 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <7479fb60-e14a-4c00-94bd-ecd5a493bec8@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <7479fb60-e14a-4c00-94bd-ecd5a493bec8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bMSQMAJybO-HjAE-jMoLXPThduIPvRFJ
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54a2b3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-YhuI8MAAc7Bk1R6834A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NyBTYWx0ZWRfX+rEZ+sLWdspW
 aQ9rLC0fRFv0AlsK2OCKSMhxLezPW2FQTSMvE849VS30KNnX6EJeUox+XXrlyHH2en8uNL8F2wW
 ZyKjSUQWPrRxIzhsGI0XLXUrPrbwf0g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NyBTYWx0ZWRfX8vVUkuSvrRkt
 j2298iqtPwHIF36444jhpsixyr9PA6snfYjwz2r5DwxtXMRqYy9oNGD0ndoJzpDLXRgVS4JDi0K
 7TmkVVBgapf6+8US3LNkQQXhgW76e41YFyoyaL8O7GB28YaTfWrAXuUKkL/TRorqMB+Y71Iyqj7
 m9lAMweTdhmSTtIEGvpY0e4+MLigvMhYjBIQnxtCKj0fUfWG/daLeh2wLAmoM+8qgmVyhygdkIq
 pHawAhQLfPplzxh0SF0qSNbaxtE0I9NLd4RcK/yjSbHQHkZCpV2n6IyY5RXoT5enTgf84+Vg9ba
 ISDCcF3XeXykYBRt/3HD2JI2juXkVKGkhebQHW5mgwB1bZtPR7zrA3LXThHQCk5yx4V7oe2FEBI
 /kq5JMRK2YhJBh8KPI82sR1wrGAk9LWrQvxJTF9ZotWZXSm47UBwup+gANVdG9POQlSMqMxonEM
 e6rL+sHwzfnFV7Zzxiw==
X-Proofpoint-GUID: bMSQMAJybO-HjAE-jMoLXPThduIPvRFJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130087

On 7/6/2026 3:24 PM, Krzysztof Kozlowski wrote:
> On 06/07/2026 09:11, Atanas Filipov wrote:
>> This series adds support for the Qualcomm JPEG V4L2 mem2mem encoder on SM8250.
>>
>> The goal is to upstream a standards-based JPEG encode path using the V4L2 M2M
>> framework, with DT-described hardware resources and SoC DTS integration.
>>
> 
> 1. Here was NAK for v2:
> https://lore.kernel.org/all/20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com/
> 
> When I asked to implement previous comments.
> 
> Did you implement them? No.
> 
> 2. At v2-1 version I already asked you to implement comments:
> https://lore.kernel.org/all/c9006b67-aa43-41d3-8b13-f20dd2e544c6@kernel.org/
> 
> Basically now, THIRD TIME, you send the same and you still do not
> implement the comments I asked you at v1.
> 
> I treat it as deliberate action to ignore review. Me asking the same for
> the third time and expecting different results goes towards insanity, so
> let's avoid me becoming insane and consider all future submissions also
> NAK-ed:
> 
> Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof

Apologies for the repeated failures. It was not deliberate. Inline
replies to all your v1, v2 and v4 comments have now been sent. v5
will address all of them without exception.

Best regards,
Atanas
