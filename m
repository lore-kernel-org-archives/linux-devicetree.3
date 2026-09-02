Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ECB49F10E
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 14:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358234; cv=none; b=tGX8Pf4Y+VNNVkE9nGO0ZfMKKo4Mc+IHULGYr99IidzrlaWilfPknUu4AQxIaTyeCt68sV8AMGfkFivbspimlc/2In6Pcl3BTyeUoN6Jo47hwOmenrEtonD5YRlQOXfv57/s/61j/V6F5w3UTLgJ5WrwDjwuoe0i6q0GOsOPrDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358234; c=relaxed/simple;
	bh=YVhNWY3YTzseoUDSc4+pecJIfHnebROkelxV3G3LVzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X4+PncpyaNbmk8fCIid6WAvStp310TSBbJzCds5tr2vTSKiW1eANNWMrpTVnjqkVwJOhXohvIeqdjsXKQ5EvY7q7viUcztp8sRQmj2E6fXXHxKbqfMnj1S+vOFqizzbyXcFNsQ2w3nVl4omCwfEFuP5YenozWEcrfB7WCvzi6f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oBR/FAQn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OpX0Lk4F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oBR/FAQn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OpX0Lk4F"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CSU5S1388781
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 14:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3JQgfxxt0kxPrE2nrPSq4HoamEoqyDdParOq5552+rI=; b=oBR/FAQnD+5LItQT
	LjbCa2qPYxknSU6ohWgZBqYjF9UcxUlGY1ofyZI05XiF6eTiUnIWITR8sUKinthj
	4Sv2JJm1Q2mqegXocxjUOir8dETJaiWYajwoA5rHHZBxxVWtcXZsES/4kT3sdzUz
	2J5s4Dc4edyhm7eKo9/6uxH1jTQwNpDzfUt2ho14xgPz71EuVyjOXBpQaEyARMmY
	ckuzw2aFHZxwihnOgz3dxKHrUlLNLRLwSza67CFgpFZLLKfcSy3IJGcCQJqM50Qv
	D+oLNYrb6V62bhZK5IfJL2CSTJZU7aSmB7IB+DgjMj3Wm3UUyWnpvkC7e5Qi/lde
	9Rin9A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge435uywn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 14:10:31 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73a1cf1638fso36069137.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 07:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788358231; x=1788963031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3JQgfxxt0kxPrE2nrPSq4HoamEoqyDdParOq5552+rI=;
        b=OpX0Lk4FWJ+ZL0Rr2K/y9K4Qf1H1sN75bJ3xfBqDTq2ewm946D/tieoHroe5skk6ek
         dzp9lSCta8MVT/dSZ8nWvHh+MgxR/FBMqzU95xRRx+8LJs92g1g0yPf0YM9z/sZDIXCZ
         8FlNqJQU2ytP+Mun9ioIu+GsJjuZusyvogIbFV+e1q+7HydrmFJw3gCeyciuTdpiNet/
         //srYsitd/EJVWZ5b9Fqp4t8EAPzifF9pQeQWpzY/aUaDf/yAlIJ+a8xz8y7Nkqhp9Sr
         ElxDx9VPvLMlnLoCHFjTF1ZP3sfnS2P1qvDEgO3cmi/q8R7/ZEkjcG0q+DqpDYlEs6aY
         DgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788358231; x=1788963031;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3JQgfxxt0kxPrE2nrPSq4HoamEoqyDdParOq5552+rI=;
        b=cnD/okyNhT3iTd6kYA+guYkjK1qhLImOOth5R1fG/QsnrUUO8CuHJ6mnn1E8Y3aEBr
         siwQa83GuFaF7b54+8yo/AXcMQrRNq8MOkRWExGm7yeeb0QSm9yuSJMj08vha3YXMvoJ
         rZSbrwJJvQKQMVTinwVZ/VLKGohCCcyLVSoKKmII13PvWzZcZ2E6Dgk8B0D4SyaJIK/C
         Zeghkjx48Xf/0wrVJ/mcKeZ8AmanN+3rMPXy1WPJuCYNv/k3tE9MqFVBxv5aKPTm34wZ
         6UdoS5y9haWnX1G28vq8T9VIImHBuDuetxCSUyzqUj2SksUv0YgHgbTRzTq9KYszWQa7
         4qFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwf5TIZWfWLaEgPYRKkw+P9y6PHN0WvJ9cPPjHpuAFOMwGqfPcgbXAtlzwak24gSIla3TguJKqtUsHg@vger.kernel.org
X-Gm-Message-State: AFuF++keTk+im9+Uzh30dLSAyuSGnQaSgF2e5Vb5OUEGrUYKKTE1Ede0
	3qcBSCEp8qxoyCC5oBqZ0+Vc5smwQ1yIa/uusuLyWpdfthbmezAaZvP4WQQzKDtrpKCDrDrudvm
	NZtv9/EtC8hYKJKu3ySu/jnWoYDJVbWPFIMqyn83paU8oFDYkareuojbyHVGc7WgZ
X-Gm-Gg: AYBFou0nbsVGrlIBwCwugqdV1EFl+NNkAdeBRSsVUeI7O9i3/puwieu03Q8vct+48Dj
	FYpnBVU0bjPATJ/YGDGDKqVGXY09FJTmjdDuoG5F0m18WB8Kw2uyhHzE2f89aPFeo+UaLB12NeZ
	iANWIyovAZkCUTSe6QXHrnupsC77OMr2QSAPIBc5PPaG39jlr6jCoHcBksxbbQ9MnvRQ64iE/KS
	5aeG637XXmZjmSewO0n7VQx4gzOSKkANJAlxFcFXqiGFaqx96t/tIKmAjVv7/CVVQ+cFVq+PhBA
	VbjscjD3vL7bmefBvq/8VMyqZKqpm6cMRkW/2ZM337ED72zcrSaPLxyWti3v0hNJxp6dkhBRmfO
	dTPSLmUdkInxg9PYXvvLwnw==
X-Received: by 2002:a05:6102:3a06:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-78a1f29d57amr650067137.1.1788358224601;
        Wed, 02 Sep 2026 07:10:24 -0700 (PDT)
X-Received: by 2002:a05:6102:3a06:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-78a1f29d57amr650051137.1.1788358223963;
        Wed, 02 Sep 2026 07:10:23 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b2627fsm601771e87.37.2026.09.02.07.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 07:10:22 -0700 (PDT)
Message-ID: <6af2e860-ba7a-4f86-a0e7-872a312b47e4@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 16:10:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding
 for non-MP controllers
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260828081542.52796-1-krishna.kurapati@oss.qualcomm.com>
 <20260831-messy-ebony-warthog-cfd727@quoll>
 <ce5bf06b-8284-4355-94bb-416a8e34bd5b@oss.qualcomm.com>
 <cc52ff33-3da4-492e-80cd-ba2b1711bfed@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cc52ff33-3da4-492e-80cd-ba2b1711bfed@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyNSBTYWx0ZWRfX3lW6M4A17Hko
 a1ahMYX5zX+NBTB/Eyx3EEOlhholM4pvNH/0AxpY5H0v81ENfqxKQagCDlRT2eQirDOXGctqEtK
 O3P3n5EG+/s6G1c0LAvCXd8kxKKNUzbMWGA/lmpYDhvV/H79OnVeQqc2B2r1bNwVvqmohiBzJhT
 scb6nKZot4cJFBaHlv5DOxYt2UOJbPgNFZ6p1Z1RLBKSdlxSpBCIEDz8yt9QPASdj9BLnHs4VRc
 ULus9zWwXfHf76MRPr92hV8UCqv3bgbuW3Pt/xHWyH5qmnfb1oWoWEtKPDU2gGtkcZxEtaGf4nU
 RMJoSTivcm/+FTn/EuFhiur+Ugm5eqeFtBywJJyzTBRbb05medT3CHlIjzBQBEbTLbgqVRYtRcM
 HTq5n79FX3Lp3LhERSwy6H/5cLcNazcH5xWQcD8xauhnwPS9NSEelYuKP9fozUelRIYMb5yFDNC
 MPLXz3pdMDYHnsiu26w==
X-Proofpoint-GUID: ck97wcXsF76zmX8JncFZ0BZwxSOup6sX
X-Proofpoint-ORIG-GUID: ck97wcXsF76zmX8JncFZ0BZwxSOup6sX
X-Authority-Analysis: v=2.4 cv=JpnBas4C c=1 sm=1 tr=0 ts=6a982e57 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=l1HXmQewNA_p1I5IbwwA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyNSBTYWx0ZWRfX8Nb7jwL9dFnz
 BE8gu+7EfwYAcAdbhYvyBsrzLw4b5KQNLKLkBrcTu2aYKiPJBS6yE7aOCWG1t7XKImN2rCRDOWc
 12H98OKkUOXHUJcx8RIVY5zEbbgF278=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020125

On 8/31/26 2:29 PM, Krzysztof Kozlowski wrote:
> On 31/08/2026 11:03, Krishna Kurapati wrote:
>>
>>
>> On 8/31/2026 2:07 PM, Krzysztof Kozlowski wrote:
>>> On Fri, Aug 28, 2026 at 01:45:42PM +0530, Krishna Kurapati wrote:
>>>> Currently for Glymur non-multiport USB controllers, number of interrupts
>>>> are limited to a maximum of "5". Either hs_phy_irq or ss_phy_irq are to be
>>>> present.

[...]

>>>>                 - qcom,eliza-dwc3
>>>> +              - qcom,glymur-dwc3
>>>>                 - qcom,ipq4019-dwc3
>>>>                 - qcom,ipq8064-dwc3
>>>>                 - qcom,kaanapali-dwc3
>>>
>>> This changes the ABI without an explanation.
>>>
>> As per the harware specification, the controllers do have both 
>> hs_phy_irq and ss_phy_irq. Hence wanted the binding to capture that 
>> info. Will update the commit message accordingly.
>>
> 
> So the change in 99df63d20dabda8d7ae01bcca7cdb1e92110a555 was
> incomplete? Lack of context here is not helping.
> 
> If they have these IRQs but it does not matter, then it is not a good
> reason to change ABI and you should just add the clock as optional to
> the end. Was this binding already released? I think yes.

IIUC the intent of the patch is to allow specifying the currently
missing hs_phy_irq on non-multiport controllers (i.e. usb3_[012]).
Bundling the DT change would have made that easier.

Konrad
