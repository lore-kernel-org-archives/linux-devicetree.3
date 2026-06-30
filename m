Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07363419303
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828980; cv=none; b=IAuGHKI0lh8S8hAWpZqT/X0R8gRr62+t0d/coQf5HXqt5n4uM3xyBmI9M9mKPqFGZvwcAQW8vVGRtSYG+hz3WaE08pOLLlndZn3tDGCOrFR6SnBbwhYPJzHh5bJpPlvcT9UUeWB1rEH4DhPiShXlAt65SalUj/GELQj42cWXjyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828980; c=relaxed/simple;
	bh=BIhbtLTCuL/PsbBo7bkGtYH7eIpUplVqs0upazLRnDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FTFhtOZ8dCkUBrRwn2efwXTMV8Zfqi+R4LzxNe/BpNU1yPRL9pOPFu8QWIwhpwDI3+xGC5XIyMOSHWoxEZwamqTX9CD1LXUP2Xwu0HXfjfCJ5deNnbwCqwFPoYhaM9gBZlg7RTPxWYgFNa3A1x+EjiTksMu11ACFU74lUZhvqFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jAjhfMZ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FFzFYvZG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jAjhfMZ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FFzFYvZG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDMU22217106
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JStmruWEm2i+T8q7mcjNz5amoIiti9X5qtUv4Cl3j4U=; b=jAjhfMZ6op01ueNr
	Vs893PlDvIYcGfDo9Dx2HeGWGX874Sjg+pnUnFP1Ej/neiC9xlWR5St3KxTqP+eh
	1naV+eNK3eI2Y9x7Dw+J9KooUsZzw/EfL80xUzOnTGxa/lbAeaQcWfoHsLwDk+lA
	9LVjMhjaoeaYwkO1M3GAxyLYGZrIRnixp1/ei1243owW5Vw0RJA0SpftKOVLYHPU
	f7OwymOBMfESYc0sBH/jshFHpTZRFY9aWPjCsBMWAu/qhaiF0ortD6sytqiCh7nL
	sJLFYooJ7ublkfjcOh55hAlT2LpMBtMJ98G3VbGPokHncKuyIauyd2Ol6SXLnrIq
	Gkhrdw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f43vfk3j7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:16:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e21552dso36808985a.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782828977; x=1783433777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JStmruWEm2i+T8q7mcjNz5amoIiti9X5qtUv4Cl3j4U=;
        b=FFzFYvZG3aCtZbVd5MLv2lTajT0AuwjmXfyt92tlFgOLh9a7NATXtzQ7pmaxeTZwue
         hVFZH15FdntdWLwVwtfzCrwUptTk/DeCM3krSl+rn4RYgJQJcD7Vvjm/pkCExIj1hP8Y
         XVxDHjYFdR+JFTHVY/aWcEne7VpjhIwVWPw9T/zEqrWvesQFTsGdqQmnd3AwGDSxXYqk
         gjusNkXKNtB9ioP6bnw0USzDkWPuLcKBE1Q90fJVIDKIqt6cNJFp4bTtAJ4DkHZxxhKn
         uEI0gPlhTWYsBBOg7ThxreRYZuYBrv/uIsP4GmhByBh/l4eQ+ItSYaGyHff3xzqTWOb7
         h9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828977; x=1783433777;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JStmruWEm2i+T8q7mcjNz5amoIiti9X5qtUv4Cl3j4U=;
        b=Ba8XoVvQvNhpWm/cX5DsrAYUyQkRvZrOUOzvmGWHVajEQTxYUJHLbS+Xgav5+kbdYx
         zdUB7fyAuVrujRh1WodNndMuY42J74LBFUM5kpZPZO07MkIVQ9x4jVYlAVLRHkyzePA/
         0n434vX/OBJmPDDs8ONHQVTsuw09rZd8V6a0Tn7WiAmPS2BPoIHoGAjgq/FJEq3FYidX
         2I7yvzo5OnIBA7n/malZhL3XLL27vxNet+HsIU9jkyYAab/DsodM6n8k2TMf3SV2M4t8
         930ZhCis6lnWwHRsBp9oCQLxoqm7EhUiF/6FSFIK3ltPWAyvLYq9g3WDw30IQ8KdvxlE
         M4aA==
X-Forwarded-Encrypted: i=1; AFNElJ+OXdgI4X57FxktU7ieyv1nGhDzigYy//mv+PLFQzGHTrfZdPZep3OcXYgxsaLTDLhFfi9pJShUTrHn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6ZTpZwGJVVzbwvPaPqJjOBl9M0hPWbSwq3gxX8kS2Nnk0Fb3M
	t4l5a9TX8YDC+sJRzh1CXRGH1DUfNdaiNx9NruHjRbyPUD27BswVfNaWPSTdmuO6sx2X+AflNNk
	5KCi4tPgJCFVaZ3gdN6oDsTSMfHhP4yOaCJnZxWytV54usdlv5IRuCW8x7B1PaCgi
X-Gm-Gg: AfdE7cng+mplCp09SxnVfHk6eUcMJzpA6tl1MkuplOagrwK03V/HeK92D25q1/n9QLS
	CTjs6XFD983dborIeErk2OOuwrXD7Eu4WFjCvDlkVUIkHvlyZYgie2bVDpZ0HDAQTGAH9Nd7QTy
	eRU8Ry+rEpk47pCd2QRMC5HCygo+NIOywbF4mxgnKyOT/iFd2sCXNqxwU2kGKgIvNrnatqCbrB6
	t1IRBufiUaivI7/QV8JSKIvSN0+M/TGMIx36DY6FJ6gOx6WEgUOgk0nZ6hnjpcCwZd9TzZRfRzh
	3hFFG0ubjt/iB1yQdUVob2BgFf02kY1eM3sTQnE83EBwecIKNGmGZxfGGcsrom25Gxloa8vY59G
	/YRsGdCvuBRUqub4hodCEQ4NlUxifns3lPGo=
X-Received: by 2002:a05:620a:371b:b0:92a:d10e:bde3 with SMTP id af79cd13be357-92e62829870mr353026485a.3.1782828977405;
        Tue, 30 Jun 2026 07:16:17 -0700 (PDT)
X-Received: by 2002:a05:620a:371b:b0:92a:d10e:bde3 with SMTP id af79cd13be357-92e62829870mr353021485a.3.1782828976841;
        Tue, 30 Jun 2026 07:16:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d6b068sm138860266b.25.2026.06.30.07.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 07:16:15 -0700 (PDT)
Message-ID: <d4001407-cdb0-48ee-a138-87c94b5dab01@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:16:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] qcom_battmgr: Add batteryless DC-adapter MAINS
 support
To: Bjorn Andersson <andersson@kernel.org>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
 <56a54a34-1040-44ae-92e2-ce65a3d3acb5@oss.qualcomm.com>
 <20260519065938.4i5wot72pfxy4m3d@hu-kotarake-hyd.qualcomm.com>
 <ag-NLvh4ROgTCs_L@baldur>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ag-NLvh4ROgTCs_L@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cRIVbAopmCfq8ep22NEgk2akU3zzb6JG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMyBTYWx0ZWRfX1gFUGVhHlvyr
 nf491ANtO2O5elsTkyRG9e98bMt4yDIKSuRxryZDawnSuBTBbaq/y5Yym9KIGRdfvCx07fo+uBy
 bXnEmcC4C3PQnxdBcSzK5iL//Wuz9UCowc9bSkBUTPhqScZhk9y/bLjXGvpAonwX7q/lVWcGrx4
 91IVG1c83NsQYRoOEJ0zRc5JrFzZgf5oJvnPKqStOQe5DM3YKYuDCLU78odJB1BdYPll8qUUbpF
 FM84N93db/ngXvK8A1zRrQ1SoUVqKPtjvp60MO/c/+hftsE/ZhXlGRGKbycoua4X6J9+cbJxFaz
 wnAxAnf8Sj+bMmbDOs2blYIZq46C7ZncH2YHTukX9+SzqO5BGOUR4PSRRq/TMQHazCWfjgysez8
 aGPFGZOrWobVq373llWP6I9QsZGJxotFkAorKtG5Zo2Tf81kbNZaxmcvIgYtHa+oZBigjxF28LZ
 u9CpDDUz+l4kCu9tg6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMyBTYWx0ZWRfX0Pn89PibIohG
 h3xxHplEQLAQMHK9W4BV0J842StYpVCYpv1uuV3i23xIlAJW403unSsZtHM6lm3w7loShcs81HE
 /8lFTTfnfXLVBV9BpeP9zLo4FA0ygdg=
X-Proofpoint-GUID: cRIVbAopmCfq8ep22NEgk2akU3zzb6JG
X-Authority-Analysis: v=2.4 cv=PcXPQChd c=1 sm=1 tr=0 ts=6a43cfb2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=v7J6KcBBf8EwAPocaPwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300133

On 5/22/26 12:56 AM, Bjorn Andersson wrote:
> On Tue, May 19, 2026 at 12:29:38PM +0530, Rakesh Kota wrote:
>> On Mon, May 18, 2026 at 04:36:32PM +0200, Konrad Dybcio wrote:
>>> On 5/18/26 3:49 PM, Rakesh Kota wrote:
>>>> On batteryless boards powered by 12V DC adapters, registering the
>>>> power supply as BATTERY causes userspace to incorrectly trigger
>>>> battery power-saving sequences.
>>>
>>> Does battman really offer no way of differentiating whether a battery
>>> is *actually* present in such cases?
>>>
>>> What boards are affected?
>>>
>> Currently, batteryless support is only implemented for the
>> qcs6490-rb3gen2(Kodiak) board.
>>
> 
> What do you mean?
> 
> Are you saying that the pmic_glink firmware in Kodiak has a one-off hack
> that no other implementation of this firmware has?
> 
> My Lenovo IdeaCentre (hamoa) doesn't have battery, what should I do now?

I was going through my inbox.
This remains unanswered, and I don't see the discussion progressing
without resolving this.

Konrad
