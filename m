Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125003BF673
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280881; cv=none; b=V0FIM9CkRbioTdgpuSi1rWJibqt5M0x+VPEbiblCNMe11vTH2bkHUR7PSgS/Wqw9PYJ73baVFKfBactedh5QLJppDqiOZzjWSVpUyYFyPN356kq2ugAn5pWWamgnel3Zxu8iQ2Rk/6XCOPfyqGExqT7kSfcGfGDsmTTmg/D7PY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280881; c=relaxed/simple;
	bh=axS8o/srj9XtteSbcbZNxaj6dBukKPrDdBZt5pjFzPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/rrAWuPb2EvZMxBmyO0XjZDjw/RadNqn4V1osw96+e+evlKdcJ9B0f69CNPxIwlCfU6iLRW1DdPEGJ3tRsXnn65wEy9i7sCHN5RVwVl4oAPwHERJ3i5vl3XrazEbU0WMzqTQ7YEDqSzxfiSlVSZzHg79PJGcIeN/zjOATKQNwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HKVNZ9Sg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fam0skIP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HKVNZ9Sg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fam0skIP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cH502098521
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ff1f+m9asFggdFlRucXXN3qa7FWyn9GytmMCTpiohMc=; b=HKVNZ9SgpRopGIoj
	27N2CzL8WCIwxl54uLZwrfA30I/2uLVH4FbmmF6QgTFPM56JIjskZqXzWuyn+G7T
	9J3mhGIv8bkmNABEOLcSjwPhg3E4oXZitP6tf5ia86G2CGqV+1bcKEtRzi2qWlIK
	Gx0b8FKeAEBiIiNJeQLJcMmAf5oRgckSrsXCz8GXHiAJyBB+wfONMTva/Qn7GxnO
	fq1+cfAaVSsPCx25ROk0/wkcfFjgaQv+n/vJKCxGmrLKXovQX+OCwBGb5hxeFfhT
	LByed0qkEnOuzwaGI/5mPldvGWfy7Ocp45AjQ2CtzYxKkyYcWyCgHzvBTam/lTNh
	Wu+TEA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6k2n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:34:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ebb599e528so16629886d6.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 02:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784280878; x=1784885678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ff1f+m9asFggdFlRucXXN3qa7FWyn9GytmMCTpiohMc=;
        b=Fam0skIPhBjjrsDz7uXXffG3CSVNYz+HJ0KnCEepqv5SA66rD8cTIgDvGeyGfFHO3k
         /INgHipFOmwXi8JHkX+2wlCsku/Eyh1bd4lnWD0vr3aFFay8VADOYb+IM2CkHzugpSnD
         odXBjjhi25TbzNhsAtztBc1FL7fQ03QK6JrNx7/QNPn7OinvVIUDVHvPg2KQBKbacwMI
         1FLkaxByNPshXPzFXd7mxyzOOMzKqaG0Pftbat2ISiwkOI/j9i7bb3mNs6rkzDe3NZyx
         j3EupJPXkBD3RbRaowZccIymk69JHDaWIfM7eVEivaimZZAuRAKQG+g+paV4KHc7+QqR
         mZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784280878; x=1784885678;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ff1f+m9asFggdFlRucXXN3qa7FWyn9GytmMCTpiohMc=;
        b=dFeLpzAbwD5GjmcVPyEESh8T1PJJMvIfWnn8rSM+2NcAjWYUVy6k3v9MSHkv8exz6g
         7KRrK4rK2IiXPpzPqV/Vnxf0wbbsOD21XiOzuqa3fOHN36JBlKY2aABlSzcbOfxtP3VE
         j3ZtKNP053sIP62JUyxUTcTXEwa6KZyv4zRy6/mvmc6LK1Cli7YZzsvLqRuDNisg1bH5
         dF42CP9N/7p76vlWAp9/ufncXcd50/C5cRPaXy/fmAthML+doSqsb1SGMVkhh+Shusnp
         A1KEr+CQgr7RSqAsK4UDxmlXNhhddLfB91CWOj2RWcFQibxZxNf6VSq47tWLa3Tf0uJh
         lhSg==
X-Forwarded-Encrypted: i=1; AHgh+Rrf7AIo/T71PGxcut5CpWw1pKeNTU5m7d52hM4uxKER/5E/cyxajkaRxXW5tQdjehhc554oev5vhJSw@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ7qBsvi790qiJzaHk+8fSyHpBh5v0rXRiatADrbetkMTI81Xx
	vyiC0NEkvgB80L67hoyi/cb6XnKalGQEA9gnchqQJN5PvMcCphfXrKDSYfnOiRhAd57NwpA9av2
	6kSpOhwLWDLfEe5AdiEmTCHYGxmYQ3HBVcO1YM7c/bPnYNo9Ff+AT6g9RzfRgV2Gh
X-Gm-Gg: AfdE7ckLkTKZr4zNldCFxUTCfKKPwrHhk27ogAKpC714mCxdKt7skplrP2qfLMemI1O
	LRUqEcef5C2W5HXpbaeQQmw8IFp3geXo9s/M9myvcaiCkNn7StwPhtuzVMEL7iaIb25PWhWtF8W
	8GPHoRThCFH8dfgTtAfSiw9+vrn2iforaZ3KV5+MJOGVG2SUlwPWFtnz70FTDM52uwnd06XnZxs
	ICdExvh/Lmvphnk1fCxFAA04tpOMzn22zK8rZPqeWPh5SfCyYyWQeQBKk+hU5ZRyb4K38G/9xr3
	NzknNbAOpj/Bfv/pdo1kzvcJCuGKSMXO6Dsk8zTycMJJLrkn5oWfmEWcBuPdVEnkHXTjOEe9C5s
	c3rruARQfNlyg6E5zkwnvOQ1J
X-Received: by 2002:a05:620a:a119:b0:92e:6071:7cc4 with SMTP id af79cd13be357-930b3f73e4fmr119222885a.4.1784280878357;
        Fri, 17 Jul 2026 02:34:38 -0700 (PDT)
X-Received: by 2002:a05:620a:a119:b0:92e:6071:7cc4 with SMTP id af79cd13be357-930b3f73e4fmr119222085a.4.1784280877917;
        Fri, 17 Jul 2026 02:34:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5fa3asm45991766b.35.2026.07.17.02.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 02:34:36 -0700 (PDT)
Message-ID: <e4a1699e-b2c2-466f-9cd3-aa1073b8e45e@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:34:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom: glymur-gcc: Add missing
 CX power domain
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <20260715-glymur-fix-gcc-cx-scaling-v3-1-72eb5adad156@oss.qualcomm.com>
 <4b543abe-2482-4381-b41e-623cdf5be9a2@oss.qualcomm.com>
 <olkjcrfq5t32gvqgpcqiuyp5jhf72f4piowz6osxhain77f7bc@ggwuk4nz2ak2>
 <316fd37b-9936-4bca-8521-9a11ee65cbd6@oss.qualcomm.com>
 <almBxBhYxTR9n5FZ@baldur>
 <2e9a211d-a877-419a-ba8d-40bfc42e65ef@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2e9a211d-a877-419a-ba8d-40bfc42e65ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5NSBTYWx0ZWRfX+5srJsnp05TB
 qxgbbTlXcP4jhFLOReJrzfk3QyF61359hukX222cmP4b9sOLzgNAW3NuQifTR56M5ficn/APhoy
 LR+oRQEBAB/77DHj2H+le+NG/jgrfO7nlEMpDjU0ljkNd4y1SrixoMCqQWp3m2osFPvVXxOE/+2
 EDMQZJY6wEtDhBLQANKu7aKKuHsBCbIuRufEUQszqKuDaXZ4NBjS1mjlCgsqVlunYpXH5OxqQdU
 8b8YYHYVjAUXN4La34/qaN9HlQr3diCM/avPgr6+nHPbhDX0KisqotgVqrGCoa2wealALdM5oAd
 KL9y01hjVRHgzQjeUxJkQ1rWcCgG069X/TFYTF6wXufThdu5aUJwGbT7ztXNSoNs1JmE87MapwR
 dsy3iYfZ1FUJpEfkSOhBJm71zpjmZB06jmy+YS4+Pj5v95eDOnnbQntii2C6JIEgdiD/M9/4jFm
 CMb3rNXA006HPnOXUiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5NSBTYWx0ZWRfX0AXkzf3s4RY6
 VGiQjJHHq7Z3JzNV0TA8vrDlGs2+NkGDZsitifh0FeJ1b/pJR0hbrLqrzbcdtp0Dmr+WZEolmZ9
 tAT1XV3RbOsonv/sToyxS5zdv/g85Ps=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59f72f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=JlJ7fyL7TRLw1iIcAAAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: RwVPxJhKbNPwkuXkyhYh7h5GG5_fSzUe
X-Proofpoint-ORIG-GUID: RwVPxJhKbNPwkuXkyhYh7h5GG5_fSzUe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170095

On 7/17/26 11:30 AM, Taniya Das wrote:
> 
> 
> On 7/17/2026 6:45 AM, Bjorn Andersson wrote:
>> On Thu, Jul 16, 2026 at 04:42:11PM +0530, Taniya Das wrote:
>>>
>>>
>>> On 7/16/2026 12:52 PM, Abel Vesa wrote:
>>>> On 26-07-16 10:13:48, Taniya Das wrote:

[...]

>> You're expressing this in generic terms, can you please provide the
>> concrete example of what this would look for in the Glymur GCC case? 
>>
> 
> Yes, Bjorn, this is indeed a general requirement for a clock controller.
> 
> In Glymur I do see that CX could drop to retention corner in case there
> is no vote from any subsystem and so it is better to vote from clock
> controller a level above retention using the required-opps.
> 

Is this still a valid concern in light of

Commit 7178817f1904 ("pmdomain: qcom: rpmhpd: Skip retention by default")

?

Konrad
