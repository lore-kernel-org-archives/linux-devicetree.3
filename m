Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792688336;
	b=EdMbl/5OCa7nZaJIKWKUdsJJW4EEjlfpYOUrOXPmxs0HWJoslQkM232gvbCy2NGUkqCE
	 WD+YvZ/XMpgMH6wluGHYYIXAwd5V5L0TFRg87yrc7jSHHb+UfhH5fKqBmdqAZOrYDxeFz
	 1qKOI4i2kKJ90kt4MvOjXU17T1Ati8wfaqnfJCjQH6itlqJJSVwohP1vT3eomqYLHr+ik
	 2DG6g0xzf3lFOo7UtBtvR4qaQfaX9KLbBs+zoHGlyJcB/rTp9zx9F/5QS7dy1PWoxZW6Z
	 oMdAvRgmkv0O/qAvcxFPSAMnLarsk61VcZbA9yTTSNYjJWysFbM7xDJZFQITfClF2fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688336;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YiVig7SZ1LCNZalTMVQzyQL7vcBxu71OJRi/ySqVcbQ=;
	b=xnmgqLLwHSZlNgiq1khYH9dc6OOXLPnPqhkUw2Sr763TKztlYHdO3heoURebEeWDjAI4
	 nj6YV4iH9lMwSMq1iswj5E2jrdPM0Epdz+lrPLRtEMGri/yqNKmP9spy/mkBUXfHG7A7A
	 08OTlQy9O/HKQ60iCOgjDLvI+Tm0I7bgtQ9jkFAukmO5h0wTNwzpirXGOpeLXuWD55C/7
	 BwFY0G+K1dOIwpZREoaMCMdnME0hT5LjujsAVGHSmIKdddot5blCEfQWwML8Tw5sQ3aaq
	 LsqkJa0WMArK8xms/NYyC/v3HSmubsIi282JgcDcBJV46k/8blm9k/xhQ82eJ1RDcAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oPekVx9R;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XEhpsg7u;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A44606A328
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 16:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70A44606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oPekVx9R;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XEhpsg7u
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MGl5O04105756
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 16:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YiVig7SZ1LCNZalTMVQzyQL7vcBxu71OJRi/ySqVcbQ=; b=oPekVx9RGSzP/DJp
	MDeMyhK0kCG6i33rSJvwbiRJjIor+XfdtHbiVekJs93q5ZK7FoNUZtFVp6Y7MNFs
	GpNi+zhS2iTBb7e1wDsF7OxKEzEGlOXmmJTX+elyf54iXrTDEetlWZ24yFi76daL
	WaFTdBfXSR89kLQOuVF29gmGO4FUthClfbGXs2UJqPavCQUOGhs5P8YZZ9JXqUzu
	blJ0o+XbDCQNJT3AcxN4L402/px/xo8+SzEqW8wGHN4tfYxIyqsBHorNT88rtXei
	N39FOfhp4WY3KZupB1qIpt1++4/uqLGg/BKDAD5+P5v2Exf7Jj9MKkTc8aVX/nmQ
	oivbHg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahr1hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 16:58:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad91787a1aso33469a91.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792688329; x=1793293129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YiVig7SZ1LCNZalTMVQzyQL7vcBxu71OJRi/ySqVcbQ=;
        b=XEhpsg7uGs/gqr46TilqqFBGotDw3kqAddhZ1LNB3BqjA9pgPpUhG2MOlMIDjHfwRe
         TiJIxosKMYylaFg4e8+oFEuf4TKqT/J20yqpZOgILvlphRHRshz8D60U3Iw6Nn+Lcrro
         tM4u4CSx58rCVV3V3ZKapXeBcHyXfsJb157oBs62LCOSoEhLPIQIv4FKKc4FRTaklHcL
         deRi0fmEazaQIEn22UOHzC9KtoQERunH3bQsF7DI1Li2JM80VjJPOHoXaVmZPce4X8Me
         IWkyL6hXjkDskQEBjRQNUsHsopCsAYe1OHBxZtJHM7mTBSX/s+HuiErnOOpp3Cn53zJo
         RoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792688329; x=1793293129;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YiVig7SZ1LCNZalTMVQzyQL7vcBxu71OJRi/ySqVcbQ=;
        b=eamwjuB+dhbo6cF47YXoMhSQblGImZEg0u5PgOSW3FNVofj9XZhUCqi3mp67VUqDq9
         PXeXotB+/908vKWYyD4YOgR7ReguiTfek8kooVT/zYKnHuFQV6VMkIki4q0gl3iIklOs
         EUbzDqVywnkSgCfWGZOSvsMUt/fiU0SMXIGc0guom3X7ZXdjFa2knk6uAPrc5yD8mwJv
         doLbuSaM8cA+H2hWl34O9GBTygdB8RMEYY1/H9kdxlx7KLP6fCgQHONOUuYeDMVH2Glw
         hPyNhn6snLcOZkfmKEtVCBzvjfim3Rx/1ilCPe5I9ux4ayoJ7Szine769QsaLF5/hYE7
         xBag==
X-Forwarded-Encrypted: i=1; AKwUvBwzGroT0qecGWOq98HTXXzoknnHALROOv0Ea5pXfycOTWOxtRq1/BGUfgXy5VS6txvOB+BmJJkM98MJ@vger.kernel.org
X-Gm-Message-State: AFq9FYICQYJbpp6de4aT3yyp5rpP/bYwipeS6w3mL3ZXvtpJHTBRgHYK
	3/CUWQxlOsjSkv70iHsS609gQ/P7ZQ3+JDTAmSceQuEKA9aMFIC/ei7WSnGdT8mmQY+yV0gDxJG
	899Oh2TJCVrwkuJZhyQdK15gVD3/HDtAadhcPmZbu2Jh7clGb/eTER/y7hwzGplvJ
X-Gm-Gg: AYBFou2QNtNxInzIjyKNXBM+bFYdF3pInMywDvk9FpfJScYsqyoGSyq8FIFDZyU5ooO
	wk+N5gdvRqbGPh2Wv/fVLKikuaZniQuKlaoI01h+QghnRIilHgOhkyZrYYimLSA3veje2HM/RhU
	TEQzXZDuHzzmVCCv6urbtnPgNS93r/Z294M4mIwDhpmQi04V1rpgkO4VWs14RcRMJTKxA6cgc21
	RdA78iux1kQoFOL9app8t3Yxxinyb+B76K/OAttMrqpUpaccRQ7s8GrhqV3Irbp6gD1Sth7cvGr
	AwfLl0Fpe5ZG6Vo777Uytk6LbVcO2sPQC5PeYtXbsJptItgl9zetaJf9JFBmkbmLR5l+ZBrxlxR
	UoyYuUlRMs1gM3j8DBCIWB5w0tW47Iw==
X-Received: by 2002:a17:90b:4a47:b0:3ab:1af3:a0d with SMTP id 98e67ed59e1d1-3ad86d1e821mr4444454a91.33.1792688329164;
        Thu, 22 Oct 2026 09:58:49 -0700 (PDT)
X-Received: by 2002:a17:90b:4a47:b0:3ab:1af3:a0d with SMTP id 98e67ed59e1d1-3ad86d1e821mr4444437a91.33.1792688328657;
        Thu, 22 Oct 2026 09:58:48 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.235.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48876ebsm5013445a91.1.2026.10.22.09.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 09:58:47 -0700 (PDT)
Message-ID: <d8dc2c6f-9b1e-4248-b81b-cbbd524233d7@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 22:28:42 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Drop CPU critical trips
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924-shikra_crit_trip-v1-1-730c48fa998e@oss.qualcomm.com>
 <xa4gmzdccrububsmervkbtwqpddsbikubvgsqksypqmx5oih2q@q2hz6tadbmu5>
 <53c6b966-a6ff-4b91-a2b7-d7faee5a6605@oss.qualcomm.com>
 <3a87d077-8b8b-4bcb-9f5a-03920ef3d38b@oss.qualcomm.com>
 <e3de4383-f530-4968-a177-288162cd34c3@oss.qualcomm.com>
 <727ru4mlgn2bf7ta42ww7772mekk6bea7sni5b2h556pk3c6xw@4atjqo2ygylo>
 <194cdf44-059d-4d03-8cef-d674ba37006b@oss.qualcomm.com>
 <crcwoq7atn7pkwt7cryixquqydyxtqezphq4cpq3cokxuxmkcu@axzmbxzf2mwg>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <crcwoq7atn7pkwt7cryixquqydyxtqezphq4cpq3cokxuxmkcu@axzmbxzf2mwg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA2NyBTYWx0ZWRfX72HItouFKvW2
 9fsE1V0C6AN+3Ulra/ctxMYkceVibOjmj7VJ9U8UNwvGa8d4wFu4i5KI1DGiL4fhFeFma83iPOZ
 yqJoFvc1pTT8o/TqeZnOKClaQW2kt1s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA2NyBTYWx0ZWRfXwFgfY+KzhMKS
 WR1+FUtGsfYY0ILomD3gdl3opxzYoYjN/vWV9Kv3bGz0oCFLeu6x9RKY1r6rPfL2vUuBUC5MxUm
 p2YmGZlZVa67kfe0M2IOwx+CpWEIzfmnRwk5GefUzRLi/wB8cOdgv0TtSk7O3Yk4cD0lhrXSeu2
 4OjL7a9Qwq7I8nvg4pt0mS6HIhZ6n1NUG4SBlKhNt5sBlW+6dYL6TxvAwwu8RTEt3LS1Qsj3Mv1
 eDZHAPf3kiE45iO18MYkrWfw6c8g/cjtAfPQlhTVbd57QEzke/Nb/1gvKKEPErrroJaNHaxXnuY
 xQv/nTe8CbmOGVzDqdwMsRnHDV2cho/VH5ckbVx55plzK+CTlMZth796j9tRPtkGKvwFPsmq69E
 urO/2aIOjiDnSABJvIiD+PtGcBcYh2tpfHbhfdf8g9+qj8iJjFlC51TZW7v/BMKN76UjcpC7geA
 dfeOstzLK0kj8qysmXA==
X-Proofpoint-GUID: pL6APdFee4tgcYD_PgfbkpWpcFTTVs59
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6ada40ca cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=8wa5AUNoahJ04lRaSfAPWg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NRCdo2LqAGfow365lYEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: pL6APdFee4tgcYD_PgfbkpWpcFTTVs59
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220067



On 10/21/2026 5:36 PM, Abel Vesa wrote:
> On 26-10-21 17:12:11, Gaurav Kohli wrote:
>>
>>
>> On 10/20/2026 6:26 PM, Abel Vesa wrote:
>>> On 26-10-19 20:03:47, Gaurav Kohli wrote:
>>>>
>>>>
>>>> On 10/15/2026 4:43 PM, Konrad Dybcio wrote:
>>>>> On 9/25/26 12:24 PM, Gaurav Kohli wrote:
>>>>>>
>>>>>>
>>>>>> On 9/25/2026 3:13 PM, Abel Vesa wrote:
>>>>>>> On 26-09-24 19:52:32, Gaurav Kohli wrote:
>>>>>>>> Shikra firmware handles CPU thermal mitigation up to 117 C, while
>>>>>>>> Linux CPU critical trips trigger at 115 C. This can shut the system
>>>>>>>> down before firmware reaches the end of its mitigation range.
>>>>>>>>
>>>>>>>> Drop the critical trips from the CPU thermal zones and leave the hot
>>>>>>>> trips, non-CPU critical trips and GPUSS passive cooling map unchanged.
>>>>>>>
>>>>>>> I thought that was the whole point of having the critical trips set to
>>>>>>> 115 C, so that the kernel can gracefully shut down before firmware cuts
>>>>>>> it off.
>>>>>>>
>>>>>>> What happens if CPU gets to 117 C and the critical trips are removed?
>>>>>>> How will firmware thermal mitigation handle it?
>>>>>>
>>>>>> Thanks Abel for review.
>>>>>>
>>>>>> For the CPU thermal zones on this SoC, hardware-side mitigation is already available at 115 C and 117 C, and hardware shutdown is at 120 C. Because of that, a Linux critical trip at 115 C is not very useful. It overlaps with the hardware mitigation range and can trigger shutdown before the firmware thermal sequence has completed.
>>>>>
>>>>> Does the hardware mitigation just pull the plug, or does it signal
>>>>> to the OS that it's about to? We absolutely need the OS to be aware,
>>>>> so that e.g. the filesystem will be synced.
>>>>
>>>> Thanks Konrad for the review.
>>>>
>>>> The OS is not notified before the final HW shutdown at 120 C. There is also
>>>> no useful margin for a Linux critical trip here, firmware/HW mitigation
>>>> starts at 115/117 C and hw shutdown is at 120.
>>>>
>>>> So 115 C overlaps with firmware mitigation, while placing it higher is
>>>> too close to HW shutdown to be useful.
>>>
>>> But having the 115 C one will allow the kernel to take all the necessary
>>> steps to bring the system down gracefully, while relying solely on the
>>> firmware will just kill the system before kernel can do anything.
>>
>> Thanks Abel for the review.
>>
>> On this target, 115/117 C firmware mitigation is throttling/prevention, not
>> shutdown. The final HW shutdown threshold is 120 C.
>>
>> The 115 C Linux critical trip therefore starts shutdown exactly when
>> firmware mitigation begins. Moving it higher also leaves too little margin
>> before 120 C.
>>
>> So this patch drops only the CPU critical trips. Would you prefer keeping a
>> Linux critical trip at 118 C ?
> 
> Yes. Again, we don't want the firmware to crash the system before kernel
> has a chance to bring it down gracefully.

Sure, will add at 118.

> 
> But how does the firmware mitigation (throttling/prevention) is done?
> Shouldn't kernel be aware of such thing ?

LMH hardware handles the CPU frequency throttling. The kernel is aware 
of LMH events through the cpufreq driver’s interrupt/polling
path.


thanks
Gaurav

