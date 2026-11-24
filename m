Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551675;
	b=DOLqI/43bWAmmBU7I4Q19VZjP0WD6WyyY2b/FOC5RC1sANp+ocqEaUMDoDXcTKTDM0es
	 PTCyqqYYm7lOm2YD8SblfuLUJTry7xyj2KIDQV7P1s/vWBslwSfpsNuQc3+5ROjZV9RG1
	 9VqIsIuNCAmd3ted/9wk5WnlUl9i5zivShGpswOthXoTkRXPngVFOZttf+VWUpHDtz0x9
	 S2H9t7gYGX1blOiLPvUE3BdMnD7rLJm4ECajkWPzD7xqGEFveh5GrY4KSzVTMM9QJL1nY
	 6Aot2S07mTzc8Xy5jmLlJ3ixnZExOvuPNWtge8A3pky52HCjN4wqJP5R0sSqzQS+F7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551675;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IJh0gyj4tVyAUuSEvtY7JJfcpLPqqDKXWFndc290fQE=;
	b=JEtGBondoSVhiP+flExK2FLHWbhgSHIla2cJexDJx6tOHRF22knpHDkhYdlxT3oM0vPJ
	 T60NoFqlH3XgcGGrk3A3bz6TLz/nS8N6OmJz9xztBg6ByJgeQF9Kmci7OPrMS3vnvW1QC
	 pTuekjWAY1CDKKVQQsM2HiAoWlhxeVno1/AZDKOKTgAhQUjlzFW/meww9pBucnzXScfz2
	 FAOb7CIU+Clz3NBT5k5rQu+hLhJqUEZz0ldIFuAr2/4mVwMdgGB0ulSn/ppxDefPEnxB6
	 20IvHdEHb1g715RD5L7xwyjOZdllNWZ2SksVrbV0hEE4HQsZaknC03M3WhXibMwa4Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F6ssbANC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJ0d7Bok;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A38C606A330
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A38C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F6ssbANC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJ0d7Bok
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXZsw2306936
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IJh0gyj4tVyAUuSEvtY7JJfcpLPqqDKXWFndc290fQE=; b=F6ssbANCVPTVOG72
	EKoURmpc+mvCputi/bjo0yyQXvf/+rGxUcga4jEuO0JEyOJdL/x3JwkHLgmsUlwg
	FPuXy7zYY/N1Ib0CIhXnczuV318Feaw4fXHfJZUtp6PskgBEdOqcicWZP94wy/3K
	8+qL5SFJ31FGpAS9zlWeigaA3kI6hVO4EoIZurWVX264ZIuot8+kFnK6arPtfP32
	Kul/B8HGsdCgpThB5Op63FVpRc7ZSG7wakyxpyXQIX0w9Hoca9nrl+O78hLTdTpl
	4ifp8J0b9GDyThFidr+pedmXGRd49B9QnH+sfQV/2tVGSiueREBP7NsjP/DulcrW
	1XHg3A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxk9dfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:21:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3869865a304so4539401eec.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795551673; x=1796156473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJh0gyj4tVyAUuSEvtY7JJfcpLPqqDKXWFndc290fQE=;
        b=iJ0d7BokKXSAtrRJzI8YyHoaoWukQkcFngDvKDzD0OD6txCzgtiJqo53aghUlH1BA4
         AGKxRRMNjOE3116QmHc3Xy+oLzGzyVdXRdYe/3AXHuXhvEIZ6gBBgl8Qb6A3smThTZfZ
         5mB+KBdNMItSyqoDGRaBrb2DyklGWxMILpUAuKq4T6KS/MmuKshsPkdjS9/AfGT8PVlf
         +XGIFDtZ7vyzThObkx3e2QYGb2oRETTQjP57MVSVuihgBK5qfKgwcsx0f6zbo77sfqtV
         juQ1tJ2rstufYSj8XtkFX/2C/gfrl2zvZJV4jC1NafthdBuWLTKNSYQ2CaBc1jKEeWhX
         FFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551673; x=1796156473;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJh0gyj4tVyAUuSEvtY7JJfcpLPqqDKXWFndc290fQE=;
        b=2kT8w+Gi5eqveG0fLhtvlm+s+15H4Lls7V+C6rSTCYXTbhjvVDJvQxgDUhHuQL5BGR
         zZESbb5FP30BvFynUz/0V1YexmldiwZx1Wi0x5EmPAtXP4/1DfFv3wOic3L5i7800RtH
         PPrKOfDjiVv6LJHRh2dMKc+rXumXkaU/lrdj7X3IHnbqIeZRraNnrFJHA/4ZSYSv9boR
         bHk67ZL9ZuYQwpwTZmBWEWYrmoKoiRnkLnm0vEs7xtsvvvUYxO7mSSXvrhVnAA7BxC6V
         VISON7cg2VXeaEMf58hPdPdTbTeuhvVzLwwobxX185ddcYbcQThOrDaGLsgSbm7eekCi
         pYxQ==
X-Forwarded-Encrypted: i=1; AL+hErGZncXvAQJqp3J77aUUzu3orU+UiRX9SlE9n2INxQ1NoCyE98c3eZNvSqxuCRKHmD7snyBZcGJbAYc4@vger.kernel.org
X-Gm-Message-State: APuU4Z/JjfUGg4exgDMrgi1Cq45qa2oGHuan9Y8hQOQiBUgShR/8POYq
	/kd2tethE3A86o327Ifoen09KG+lnpo04pUoy8jdO3KncF/50DjgStx1atC8huoOuqvKKrUR8SO
	V/hCOfNVG+KOR2w7NmdyCuBhlpB9vbC3kdyTidtlVnUBQ88mpHTCUSn8aNEfWtver
X-Gm-Gg: AZFdTZdT4lPlCTLdTgb4uz9FkILVNZqh5MtzQHg8BJH/jiv7q+gj6HC80mJTKihnMjY
	ix0P1N/8LaBvBCbRCDtc9djtsREkA7D3ROBqJNxxCFpQnpYcpRSBdZu72EPv1Ht0Mgr8/jctMhS
	0eZiB2W68RWkw0b0iUAkBWsPEtb8/D/qKPU5CATV868hu5wcQlZUMTT0M1CrITFPUPLc/IKDAuz
	K/qWJHKmzx9bN7zW6Ij2rAxNbV68w0bVpex4Ll2327JpThyPNEQ3i8+6uABeIbUBS27FZuySATW
	09PIcM+TjlqzIMF8uG/WRXQ+47C94wJr1rZfKURi/lVeucg8iMiBrbNt4twRqQiT898OchaxfAa
	3X/sFLinskQKuapapggwmNQ6fRkKxaT0EB+ak1r+KEaT45kfTxjsMaRf64/joRpFjAebCpB1F7r
	8ul5Vo7Wy7rRcYP/bRxOdgV2DesRKKbNs=
X-Received: by 2002:a05:693c:42c5:b0:386:bc42:b5bd with SMTP id 5a478bee46e88-386bc42b660mr4453669eec.25.1795551672708;
        Tue, 24 Nov 2026 12:21:12 -0800 (PST)
X-Received: by 2002:a05:693c:42c5:b0:386:bc42:b5bd with SMTP id 5a478bee46e88-386bc42b660mr4453629eec.25.1795551672001;
        Tue, 24 Nov 2026 12:21:12 -0800 (PST)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm44462979eec.7.2026.11.24.12.21.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:21:11 -0800 (PST)
Message-ID: <e6c4fe7d-8010-43b8-a407-157bbc09a619@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 12:21:09 -0800
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
Subject: Re: [PATCH 1/3] phy: core: add generic MIPI C-PHY configuration API
To: Bryan O'Donoghue <bod@kernel.org>,
        Michael Riesch <michael.riesch@collabora.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
 <20261017041733.3946816-2-anusha.nandi@oss.qualcomm.com>
 <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
 <f689ccfe-4adb-41f6-b492-97a48090413d@oss.qualcomm.com>
 <e3d322a0-43d5-4369-bd09-128152f4b233@linaro.org>
 <8741d667-efdd-4e3f-a1b2-2f04255d7c7d@oss.qualcomm.com>
 <3Qy0nxBJKeIHC6U9JocO-BGMDL8rLOkC_xTz4kT1GKMFKf86iv9Jhty6HHNLjO2CNSn6ZjK3G8TAXKLwckkhVg==@protonmail.internalid>
 <e579e40b-9ee7-48ba-92b7-78f9dfffbeb8@collabora.com>
 <fab551bc-5cd8-4ab0-b97b-f808027506ad@kernel.org>
 <P0DcNxFFqRzTkXdjBWhsf9xcIvjwIClQvC2dMKoQDIZGtFv8g9u78e5FJ7-sp7JxcMPiZROgk9a2niaSZwCztA==@protonmail.internalid>
 <773b5d1b-6679-4f68-b15e-022842f5109a@collabora.com>
 <b3adfac5-e9c7-484c-aebd-16c94f41f28f@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <b3adfac5-e9c7-484c-aebd-16c94f41f28f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA4MCBTYWx0ZWRfX1ntj7t6pqcqn
 jVknrxD1bDNTFsgTawQIUy+AeA8mU+TmoZZ+19Qf0f8ltbHLQ+bFjTRFKYfBH4yWtEV5+Wb212g
 Zn+F9bi9fQGmk35na0dQIbhRyElG16t+ZcDvDrb+E4KJphYQV4c7KJ6oR1ceemvM+b/yOHlrWc5
 USg69XDpSeC/Sxz52coFfZoMRXydVhKP5Fv5qZ8MxB88whq4+j6BOa6Fg0aoNSdApDala9oQCdz
 O6B7LQQe6rVPoxFNAo35GlMrcfkx7BDduAGDq3nu0kzu0S2Baip2QjoIZ/2F41ckWgOYGAWicwz
 rmpvrc3r+zCuGUXSEzPEWylP9sC6plIagbysiGAhFkSQQN4/5KGquUpBps/64KC4QFjEufLZeYz
 TOLwf8pEVshfaDqpFFg8QgAItJHtZmWQm5bYHTRYUmMS88pdxZ5mkHcYc5WVqdRjRco98Pnq0sh
 +ZT0OndCX0AKRLgneCA==
X-Proofpoint-GUID: kaAMiJGh9I2QfhbT8aB7azHbecZv1Fnh
X-Proofpoint-ORIG-GUID: kaAMiJGh9I2QfhbT8aB7azHbecZv1Fnh
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b05f1ba cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=lbkA2V-SW6yiuUp8BYEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA4MCBTYWx0ZWRfXyDwGF2Dl285a
 Oy4eHeTjefTZ9Xkc9fX7TJYY/CEcrGQGO1TevTRP673guhPuf7V6N6AZGeG1iEtecxqj3c7g4HV
 Y5MzZ/yZoI7dnLN9tIRJbq4ySIdXoDI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240080

Hi Michael, Hi Bryan,

We are planning to send out a patch series that provides a unified
framework for D-PHY, C-PHY and other supported PHY within a single
driver, while keeping the design extensible for future PHY-specific
requirements and enhancements.

Best regards,
Anusha

On 11/24/2026 4:18 AM, Bryan O'Donoghue wrote:
> On 24/11/2026 12:01, Michael Riesch wrote:
>>>> On 10/24/26 01:20, Anusha Arun Nandi wrote:
>>>>> [...]
>>>>>> The CSID needs to know the symbol rate - so that it can vote on the
>>>>>> appropriate NOC/CamNOC clocks/rails but... does the PHY driver itself
>>>>>> need to know that ? It does not, symbol_rate is not required in this
>>>>>> struct no more than it is in DPHY.
>>>>>>
>>>>> Yes agree. I was thinking the same. We would not need the
>>>>> symbol_rate in
>>>>> the struct.
>>>> How would a timing calculation like in the Rockchip downstream [0] work
>>>> then? Can this table be implemented once in a common helper, and the
>>>> resulting values are passed via the struct?
>>>>
>>>> I am new to this spec so please bear with me, but it feels the symbol
>>>> rate should be in the struct?!
>>> Might be the case alright. We have two approaches we can take. Something
>>> like DPHY which populates just about everything in the configuration
>>> struct or just add stuff in as needed.
>>>
>>> Maybe the PHY does need to know the symbol rate.. In our case on qcom we
>>> vote for bandwidth in on the CSI decoder side.
>>>
>>> But maybe there's a use case for the PHY to know that rate..
>> Fortunately, that is a kernel space API, so not*that* critical.
>>
>> Then I guess we can put the symbol rate in there. If it is unused, there
>> is not much damage done, I would say. Plus there is the possibility to
>> remove it too, right.
>>
>> Just my € 0.02.
>>
>> Best regards,
>> Michael
> 
> An equally valid argument sure.
> 
> ---
> bod

