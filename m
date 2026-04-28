Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE0924A069
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 16:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777395598; cv=none; b=Ry1lhc5hUHX0EsG/te/3RoQvpJ8I5PhYjNHnQgt7mJqGmEvDl2evPj45VcGohM64IiXnmoCaL/gDdQLismzGYkIUQ30jHQV5c9QA2w0EClpHEG+fi8rxDCAN2I4YwwpnJbisB9AnqEy69DG7DU7WIKXMPfPCsqnUrNxMUTz/mXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777395598; c=relaxed/simple;
	bh=zNIqD+u/6bHWR8ZaUGS9o2H1f9iCEtasVeyP2jQ2kmE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VDwpCZzu4dp80/kE0Wlliu7bZ2IpUUHQqyFSawDKclEw0BtZkuZSUGRcqkcZqLP0a9LLm33Nin1FwQjk9sDweWmmwGrW8V4wkSDdeAA0T6FfzpZOyKUlVAwjAeabR/QBu+MWpk9uh3RMTxGnx+nZ8EU3n7qQ58xNU1PIYCxJyeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HA37AWkV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YFBQ3g8w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HA37AWkV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YFBQ3g8w"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SGswuQ2983640
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 16:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aK+fabCdlgnUflnGF0rXROgGil+GCsdH9mAVd8Njjjk=; b=HA37AWkVgZsLXJGm
	InrnDxSRFeZPA8oUL45uqIbte1YJXCT6bS5pHHR0a9eCQFocRV0IGB77VDwCX1YE
	yNxSaHRsWZsjGLyHOkcpi8tko2yEnh8U2r0HoN4Sx9l4UElelGOzqmu+8QgnvVdA
	rIV08u5yygGPOSZQgZrGRDoNDeob2FlI7+FSD4k42D196NCep12ZJ+MpQuSWUF40
	JHUMGg5iAAUObylJCfOlXHxJ6890mEFuvqR0FHGD9OsQ0Z/WWEd7/sq5tg5ZnrCp
	iXTEAouwXsjnXRPjSJjl5+41XsqHejV7RFq3o8oc9f9Ub48C1XilRYms1sm+re5Y
	FtrGdw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1r0n4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 16:59:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b4678c6171so110846835ad.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777395595; x=1778000395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aK+fabCdlgnUflnGF0rXROgGil+GCsdH9mAVd8Njjjk=;
        b=YFBQ3g8wY9gxrBiGr53ZQVWtj0ZuSs9boBrUIYMI+VS2alirOB3kQ7h3fvc0iWYb6T
         PtddgO7keEmC6+xIiipG3UiIzxEkwJi2flD/mzeo1IriSdQHLcWv5qHoAxGkRBLxS1FM
         qis/7hMs8O8SGpDcj0V4XdX75xc17ktO/meOtiqH6M4Jx/DtrR6nJ7Y85HTYvo3QdrtX
         sOFdxdGW9UEgm6y3PA6ZSeOLpGyxuIROT5n30t3+8AmCC01qHTlpmA2bdMdAtrq09enx
         P9Rty4dO9KWkjvAiFjTzTjpmSp4izwIEuyjMyswCURd7zum+AdzShx+I4Sp6vAWb9miw
         yBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777395595; x=1778000395;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aK+fabCdlgnUflnGF0rXROgGil+GCsdH9mAVd8Njjjk=;
        b=IErgwlPazp2HhKNlvQ+A7PB/gUS5duSM6jIHMpvjNQRNGeuq/01LcD6ERqngnRkrwz
         fW0yM19MaPXI7yLTqozswXJgFRsitbKVyTn74A8ah8s8xnwrYAgW+hENbzs1g0sbgy56
         wasxLEVVntoPoJ9nlJS5gOo/SSOhPRKiCabRtRxaR3C8eAhwZ53lqhitoWdWYVLC9/iq
         22rfU5b6FqQJy7J9VLTnb7RBGHHJh3+5a+s/IYSbODljIrjtXjJG5p0qChsAxsNz4FKD
         M0Ur40br8Ci9l/gfYDpDE615UR8ZKnfJxhxZiLydN7Y36TvuurWuSrfqAaigdEgzzuLz
         yceA==
X-Forwarded-Encrypted: i=1; AFNElJ/QkSU4s5h6oteeeQpyNig97o6xW0sIsLr/vEW7mGbhAb0Lmgrw8Up0X6k/zyrFEFMHTT2ucVO/cnNt@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+pWpEWIT4Ju1p6OLO0xRshw/wevSVCw6cMODJhuNzDg+IsxJT
	uR5Oa/nOUl3S7pMjOAiArO2oeMU52fK9naC4ZTje5v8ieiiW5dt+rmTyaj/f07r8n0V1uVbJVB2
	FMgTZodZB+vZ3ejbZk+DdSP07vyMvl9NIylLgk5JlYztca8U5Ru9D0IszqSruDtlI
X-Gm-Gg: AeBDieviLY+UWtba0+4MAQTGtEfXip0rmS0m3AFQ5KCl1MSw9tsMLMbqonOSDedd/tS
	FePfFwPcK8IczJsR7URyqR6uWhTpXiCeMJPrfn4JMluYDs3VEnXF1a/VeLsAKV3T2PcXZoCpqrR
	9I1Ej2BfG7ATGzYwuFukhGAo+6Xv6DCeFDnWTAJB2OaY4spDlUQHTo1CZQaQTaXAKYJUwdb9zyM
	9nv7mdiFO29REft5i7uvhFx/Sdiqbk+miKPnDAPbxGKa6lDop5O/3xHa+twCgoPCLrFgq/6FaAY
	au1zdVeGnMr/MtyVAqfHeAcSsb7QSnLLr2ZYNFHJ5nsdnR0rr4BkQsoKaU+tXHQ+9c9wVePpO5L
	ywrijtcNiWneEIgqh64im12ck/XuXkSL1pLd4LwAw4+y+dCbyB5tKOe7IrdHDtGWxtwzlinrEx/
	Su
X-Received: by 2002:a17:902:c406:b0:2b2:420a:b48a with SMTP id d9443c01a7336-2b97c4b5815mr39711115ad.32.1777395594727;
        Tue, 28 Apr 2026 09:59:54 -0700 (PDT)
X-Received: by 2002:a17:902:c406:b0:2b2:420a:b48a with SMTP id d9443c01a7336-2b97c4b5815mr39710675ad.32.1777395594081;
        Tue, 28 Apr 2026 09:59:54 -0700 (PDT)
Received: from [10.48.22.70] ([110.224.84.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97ac8cbb1sm29142995ad.57.2026.04.28.09.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:59:53 -0700 (PDT)
Message-ID: <eb34a557-673e-4d1f-ae11-4958e7ef5efa@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 22:29:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Introduce TLMM driver for Qualcomm IPQ9650 SoC
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
 <CAD++jLmxJUPNjXkFi490GSPwB-bHs4tdJmMFwxyCX07N=kxGHA@mail.gmail.com>
 <3f5103b8-ebc5-4855-b032-f20f93c89dc8@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3f5103b8-ebc5-4855-b032-f20f93c89dc8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1CLHGa5ypR3K4KQKB50OCkMlH2gcPDyd
X-Proofpoint-ORIG-GUID: 1CLHGa5ypR3K4KQKB50OCkMlH2gcPDyd
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f0e78c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=8EseveZPm7Dyul5bA9sNTw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zXpjU6M01sBnjy44VZoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2MiBTYWx0ZWRfXzO2NQyhiNrmi
 T5MM8jIgaqJR64cu8ii9SOoJZL8B+qNXC/4dFbB3abnSkK7LjizQK5Rx+pSOrOnbiSdIg8piIiv
 EW/BReHMwWzNuElvoq1bYjwXGWBLYd0WPI/dwjTMoxwfRfhh1HsMXgTjK/tMZKvc5+R3RVditRn
 P74MnPXHNZskVGy1u2w7pouQcS6j6k0WFrvWCbZhQaNka/li5TIdutuihQZD253Gd+Lb8aVSiT1
 p4uZasUFvpZRXZYNAhvZvyMNpOC2Yf1EmbyMa3KNo5e+U/DMWOh6aoTcGNvl5HFp8/Oy9pvBrHl
 ibCqzjsImCgIXkBcb6Tbfox5fsB5Oit83WzYWpe2bGGmdOARzezLSvhZo4GunMABRIGUDndeILU
 FW8klluJ8ksa69BkOX1SMUKZudzefqxXSy3s1ug7HhXGQ+c1LL7mFsUD45tf2nc5QPCbSb8OCTY
 iVxbKZJaxnOZAUay40w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280162


On 4/28/2026 9:44 PM, Kathiravan Thirumoorthy wrote:
>
> On 4/28/2026 2:57 PM, Linus Walleij wrote:
>> On Wed, Apr 15, 2026 at 1:29 PM Kathiravan Thirumoorthy
>> <kathiravan.thirumoorthy@oss.qualcomm.com> wrote:
>>
>>> The IPQ9650 is Qualcomm's SoC for Routers, Gateways and Access Points.
>>> Add the pinctrl support for the same.
>>>
>>> Signed-off-by: Kathiravan Thirumoorthy 
>>> <kathiravan.thirumoorthy@oss.qualcomm.com>
>> Patches applied for v7.2!
>
> Thanks Linus.
>
> To align with Krzysztof's change[1], do you prefer me to send the 
> patch for IPQ9650 on top of his change or do you plan to take care of 
> it when apply his change? Kindly do let me know.
>
> [1] 
> https://lore.kernel.org/linux-arm-msm/3e7b941c-b297-48ea-89b7-e21a51f56acf@oss.qualcomm.com/T/#mb046f22f0c90ed7073e17073dc04daa931e40ee4

Kindly ignore this. Krzysztof sent V2 which addresses IPQ9650 as well. 
Thanks Krzysztof...

>
>>
>> Yours,
>> Linus Walleij
