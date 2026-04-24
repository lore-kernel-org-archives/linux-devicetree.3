Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06E73A3E97
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777028953; cv=none; b=BT5EYYT+AxtWGdRFVrJgkSs5l8PxZii9+kJvezfuZp3hLeP01kuCFQL4LiNsZZGRJrEgCZetsb38eTcVieDdTW9gIkJ7hkfG/xuyNEoluFcsvjOTDNjUNzVufWGZ2XHE50SyozQG4tpEa1tSkgmLxvm9769EhYMDM5ei0JZ/8/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777028953; c=relaxed/simple;
	bh=LaFSKdn3fcuxshjr7YM6z36LvDcB10Ec1GAh1mim+e8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NZbLgngHTOK/3SZCfCy3Zx46cu7p+teviXojmkV+u/aLj/e2PADttr5RkHiK+AI5Ja+RADz0lMIRUxZCTXexqUnCeuYA1+1k5mfXLcR407iF42HWzvXLiWEZDG9aCB+yvb7QM86//iKU60udjRB96PZN9ifDrboJHrVIlpiV3Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hv44QqOF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WSNNMIx0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hv44QqOF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WSNNMIx0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O8pBik2710485
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OsNC8a3XtqDbUnvN0mfJ7jfUPjgjexIOw63gLaAHn08=; b=hv44QqOFlq7cPa2c
	tbY/CLH3gu6N1Gbt91XSS9NzKJ9+9Ifwf/adkDnelUlzqJ8uQuHMgK3oV3uZX9nV
	kKpVznRLjqjkUmPsuIk68RJflsmY1fGl3PQnS0WdLrtGZQlgjwO6SzH4ap7LmDtq
	OqEcV7h7Ji8ATHtzuUYLOOCOxy7V9J+YdAahaBVmMWchUY5nU0qdGmss2ZKf/xGK
	CSh1oR/G7lyS048kTp2FMEujrg3Awcf1aaRnEYIAyGRMwwzB4AFGhhwtQttAje5P
	5IFIsALazp9kDtpsen46kG7JLoj1nKrkINVJPzw6cjxa7E3SUAT4/VaJpUa4T+c8
	qkSu4w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqqu9ut1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:09:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8c183c2eso70018641cf.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 04:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777028948; x=1777633748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OsNC8a3XtqDbUnvN0mfJ7jfUPjgjexIOw63gLaAHn08=;
        b=WSNNMIx097wX0kzNdzpQx9sgLk+yr/4SIhcG9mr3R5n/BKg5n2cM8o59IgtXvjtatp
         Z/9cOEINQqMutmVZR8ko9dht7KoOS3AJkccBWX92OH2KJfqjc1TB+StlRYgGb71IdoK6
         vnzsRwET7/jHrMucxsSG844IghTOOEYf987xUkc5qqBErIr7JlefWClWa+vP7WXKsmaq
         oVl35MRQkJiv0l4miFgJmObj7fkqoJcfExucgSa1AdKMPMV/epSenzk1pHdJzA/2pdcs
         ZXQOqOBWFkCvKJnC6j1Ij481qjcaVxyNDhlKRKpctMYpwg6bIkI/SZ6ph0yAr1FJc4yV
         VIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777028948; x=1777633748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsNC8a3XtqDbUnvN0mfJ7jfUPjgjexIOw63gLaAHn08=;
        b=A7xEf6C4GDUx7JHCSzJagqg1LbdEjqpEyOOceINheNKP1gGxdIKUHI5rYNxSHpuwlv
         NN0WiJxoOJRoK8YugEkrfKCGAmAphfWOneUVKPV1YPbsY+oL9QfmmUvh4HnDa35flGXP
         kvXz0zPCI1CzNPdCZ8fzGvE7RviTnYu/OFMPL9Oq/CCE3XvPYZhMQAmAYvh5Y+Ck2aTH
         7RE5eDCBIYf5ejoFU3LAsNlmcTAqbettZATK0tV16JsWzqXMZFVr+FJuPbLfI5FMa0p7
         mmLe+NKnuHiClmZ8XUBNRRaA249QzWQT+9X0XSMf7s0qAjDI0hKhbQ9R/MZwfsmqEL8R
         fOzw==
X-Forwarded-Encrypted: i=1; AFNElJ+6VICiCtKYM/iepml9G0JoWVatq8bPpQUB6kAwmfo9+JQkYRDdxFYOo288X5zly9RQDDRVIv6QVXjM@vger.kernel.org
X-Gm-Message-State: AOJu0YzAEfq4jTttc0E7Yk+qYKeZzpR+fX5q2Q5MsmfPHSu3Pf5rqrMZ
	CzZSQun0COqLhUB3qwHXSOAdA8JjtOynALdBSClwX/CCVeU6SIOTPBfNmVnGFIDys7WxXhLALlu
	+q3vgOTz3pHyN6Fb3xqtnueBiFr4/oo8FLB1cQ3hnF0HMvQTOG3UsDL8pYZUqYVwS
X-Gm-Gg: AeBDiet2HrFTF7voQZRqjJDqYKjHZJ9RlSjnDqJxZhXgT7/An8hnfjt/nnfJGF8rLSC
	heRzSsjC8b9Q2jM4llj4UppAZ3BZN9nJr3/ELsyE1l2lr5RNRyEEwdKzAahcThYelw0RU4ESSl4
	hklKJityUMjj8jpSsNtYdn3FlMSsUdgdKauj/gYl/ySS1pit4eN0ld964fN46Z9eiaUL0ijRwwR
	0nfAaXLXP9nK86W+X8VWmplPqbqUxwapCXgSzqnt5Vwuyb1L4+HARC7ejs2fLSljnRFih0qBBtC
	1y2jm7a1V6FqCXiS2qbQFMEIc2HOYIaV88qP0cOM11Jt8/SZh1BKoqS0vbWmpXHpJeGqmv6GDDP
	lIRikHPdkWOelsJubiFc8iI9wO00TbKTUvyWINVQTdcJNaP5qreL4VTfwddphxbsdjBcORvDFKA
	ZYatXCZj9YZS5AEA==
X-Received: by 2002:a05:622a:4cce:b0:509:2b5a:808 with SMTP id d75a77b69052e-50e3683910cmr290921931cf.2.1777028948456;
        Fri, 24 Apr 2026 04:09:08 -0700 (PDT)
X-Received: by 2002:a05:622a:4cce:b0:509:2b5a:808 with SMTP id d75a77b69052e-50e3683910cmr290921581cf.2.1777028948047;
        Fri, 24 Apr 2026 04:09:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4517ef3d4sm760703966b.17.2026.04.24.04.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:09:07 -0700 (PDT)
Message-ID: <0710caaf-ec73-4c4c-b6cb-7fe716724f4b@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 13:09:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Drop fake PCIe phy 3B
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com>
 <bgcrs7ijonskkobvidzoldixqy5ctmvp3hdzntsvfpj4wvjfgq@inlchk3nhogy>
 <b0ec6352-164c-4492-a0c1-b29a07e5e7e5@oss.qualcomm.com>
 <dttcqv63qc6igab7zxlg27ckt3irmjnzhjgcvq6oz7ays4q2ld@be5kp4i433f4>
 <5c1f7955-883f-4fa8-a0e5-513a987bd3a9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5c1f7955-883f-4fa8-a0e5-513a987bd3a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qA0RXJaJGVdlmOf4ekr0VfsVYuMhpulN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDEwNSBTYWx0ZWRfX68y57uySE4Pj
 Jxtw6uibCOVovCPYMxx7tInqFr3a8z2whws/S/ObA+iLpvo3AxCH7IIeJ9lONxAisw6WS+STvPz
 WV7QnymPqXGv5dmyDfyGR6/wh1LjbC2TNioKN6OtRVIVDU7G1pUkO65hga/SgL+b+Cro4a9Hw83
 QMNua0UVxCtQqWoNS7Oh1EYevxYysV28euvI1/3XbHKwgYLexRfFrL9OJky9+q13Fp1+PVAL82t
 OX/tiVWMPsFXZ0pcUb0V4zu8m93bwC7dgYYWjL0ncxVX4bTZOQ/FaI1n8sp80/lUb9iMVi8vbVa
 xhR+17uDqHkl0xFVRY1c73fA6dy2UmSXk5NMp9QC+QxbO/cTzmzyA40xsSkmAvJefRSRuVuPdln
 OkajVbrujd8eaE1xio/6tXiEk1mP08K0pGa0UBk0PylAalA9/acl5s1piVdBdveXtQ49iZvUtWq
 10uzh8lzC8BNic2z1xQ==
X-Proofpoint-ORIG-GUID: qA0RXJaJGVdlmOf4ekr0VfsVYuMhpulN
X-Authority-Analysis: v=2.4 cv=QJNYgALL c=1 sm=1 tr=0 ts=69eb4f55 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=sAdhiuySH5Di72lTHokA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240105

On 4/23/26 9:16 AM, Krzysztof Kozlowski wrote:
> On 22/04/2026 22:08, Dmitry Baryshkov wrote:
>> On Tue, Apr 21, 2026 at 08:41:14AM +0200, Krzysztof Kozlowski wrote:
>>> On 20/04/2026 20:02, Dmitry Baryshkov wrote:
>>>> On Mon, Apr 20, 2026 at 03:36:17PM +0200, Krzysztof Kozlowski wrote:
>>>>> According to user manual / programming guide there is no separate PCIe
>>>>> phy 3A and 3B, but one 8-lane QMP PCIe Gen5 PHY which consists of two
>>>>> 4-lane blocks.  This is also visible in memory map, where the 0xf00000
>>>>> is marked as the main block with additional sub blocks for each 4-lane
>>>>> phys.
>>>>>
>>>>> Describing the sub phys without the rest is not correct from hardware
>>>>> description, even if it works.
>>>>
>>>> Is this the case for the other bifurcated PHYs?
>>>>
>>>
>>> There's more? Oh damn...
>>
>> In the previous generations. I think Hamoa had one.

Any PHY with a name ending in -A or -B. That means:

$ rg 'PCIE_.[AB]_' drivers/clk/qcom/ -l
drivers/clk/qcom/gcc-x1e80100.c
drivers/clk/qcom/gcc-glymur.c
drivers/clk/qcom/gcc-sc8280xp.c


And, quite predictably, some PHYs may not only bifurcate, but also
tri- or quadfurcate (on Nord).

> Ah, I did not check the others and there is little we can do there -
> it's released DTS. This cannot be easily changed while keeping DTS
> compatible with users, because probably two PHY nodes will be replaced
> by one with different compatible.

I think no one utilized the non-reference configuration of those PHYs
in practice. Should a device like that come around though, we'll think
about what to do then..

Konrad
