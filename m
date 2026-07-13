Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127D53563E1
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783945910; cv=none; b=TjsYAsxEI6nSTlV9K5zsxwQo6e6JS/L5qtsX+Eq5kFSipZ03DghsDMzANtmbQ7pO1Ni+kFKxHnq/9KFYBSRFNX3lZaIyiK8Fa29+9qOSPKxzTup3bwk8mPMIHrJOglhxcs6Tik+ld0QxMDWBZCo6nMC731C/QYwdhKOr+Sy5B0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783945910; c=relaxed/simple;
	bh=wu624yQ1PRaJUjpRWvM2rsbHe7MgA4pQVrLJfB0H3UA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o3hYBNql8InVKCGbpygSd2PBhRITn42mnX+QQbtk4EaNqo0ukL54VdHp7B+qddpByX2ggSl/ncS2AIVI7GysH+l0ZRytsvOuoVjhi2sCJhwsYnk4hSqzzOjtdZe+o/ycJHdo8JATOVkdJwvyvnQpxgmr0JHnwy3N+R2vXG/mf2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cYyAQ6qQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hpgvf6By; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cYyAQ6qQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hpgvf6By"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDqLj1453593
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jGmSMXv/KbmYATXnM5e7h99Egu0wD40XZ6vSJoVNLvg=; b=cYyAQ6qQrXeI+F6E
	zvy2Z9pMjmmBTVbzypB0rHbtJfZMoVI1MCldEB6BvTlgJUnmtcyoMWLvXsAxoAq7
	oeRUG6Hcq2YbeTNMQkd1n02IjRcJQN0pjcW9Mbb8XRG0A83k92mV4y3uqFmAyNeo
	IjL2Z1+tuRXJhx/d73wtUbU0XFteZ7I7MVfxIS/in+ZFul8FkPqQhoIXHMvSKfpz
	oc0KP6pckMinsqrKxMTt+5c05aOPn5MPYOp1oyd8TLmnho5THIwZVjkq+qOsrwuW
	ABDaSiR+ipMyRUp3RTPscPPbPevpz9ms9AuCVIJaGaYjAnOToqoCL/XBmwvNrRsW
	3urHHQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj01685-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:31:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c19493ac2so43799131cf.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783945907; x=1784550707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jGmSMXv/KbmYATXnM5e7h99Egu0wD40XZ6vSJoVNLvg=;
        b=hpgvf6ByKNM/U65jau4T0Q12lh8kyDmS2fmpmrxYMCG/gxBo5jwaqgIZyMN3Sh2qVZ
         eP7Ni1IO1ebKqry0EJMsVSNaV7wEt46FrcG92DDYx9ngsn3ZnuIDQfhvE9SDMCHfdM3f
         ZLE938RyplmnG1NrP2EaSLp82QAze12V56vPdfq6drDnJ1O42vNhAGl5iVsDdu2b1rWc
         N5OOb8Upy87eNHhwhofh8Ekl3SOruwbUZ8g++CDxJhbyLWqPp8Q8z0l3GwaZ8Mz8sv8X
         8nOvT/lw2NkaV/E/+4QExk/5yqnWrcppE6Ki6uLoUJVvotPMDjKv0ar0CXf9aO5JAm5d
         /xJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783945907; x=1784550707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jGmSMXv/KbmYATXnM5e7h99Egu0wD40XZ6vSJoVNLvg=;
        b=iChpRDYCG4viCZtw+ZHAL5U4G9hD/5hXYs6stnjyqyhghsknyQAZsuzuMV5S7nBhw/
         kOPT84gwgNmcJRaFG79e93vdUFQgpdW7usgZjnEq9kHuRMNsBVbOHlsk2TCjODBzN6WQ
         kVze23PU+7ZVLeulNuI9qHzZ2pf8BOBJpYdWJTS8iDbt63VvH/YoLlY0NrQvMES81Ur7
         Tvmn5GWOTsksopV4HHAd4QbSIn7PtpcslNyA6I71XPm5vLUsYgCAFHeNjziaTlpB9qJv
         l2aoeKVvDJe6r/WTaU06WvxCMKBdpKm/PQ//1f7k5VDZEHmHLCP+QMRXowXTreOAugnL
         PMTw==
X-Forwarded-Encrypted: i=1; AHgh+RqnUx8f6yxDK9QqKMqhRJ235LfdSzCp6tWfW25hmKnVIyTVNCcrPlEgi5Lv0oROzDadSwJpmayWrk+g@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8AwIncs5lV+Rve8Np0KeFO+grK7a0FgvehhxccIc4e70oD1UY
	fBI5xgaFW3RRlu0YW1CZ8X2Fi68cMwWhGgwb5DK+l0gzx3W76Kgrc7fsCklkMdAW8+cgOVQYHDv
	4n7LJMCYl+WHGZjDOSloqtgIiZssBUtNt98E6SZR8tndwlF1qT4tDvt+mPUbMH8dq
X-Gm-Gg: AfdE7ckHxKSTtpn+zrHDIbVi0Fhjd6/U9bDEc3fGXL72GwazZdhOHHnZqxhgLVmfoan
	kDVnOB8m4dWG+AcH2zjnqkv9PvaDOiaQezGEqkz8UxVHEDH7x0ubF37Al471U5yDmsPzo06WrUv
	oJsC8NJSEFUMlp0zWm/m6YlIxUyniXOV3Oc+RunMXuQZDc2PRPrCxiFlTkJma8rk9kWwQILGQyM
	jkwgaeq8oMdCJIRGl28myWf2pgtDRylfIC7vtSgR5PSYHvfbvHrtgTTYvVpd6E7xq4/jDnQqbG/
	R4Tj9yZHTD8PNkiTnPjUHwybF1iuB8DBi3dQBOqTOvQ+qnzYtvTYFIBS+6z7fNxwxWR7lvP3NQL
	3UEx4zdiiGvnO38sD7Ot8/Luv40DAAULfXYH5GQ==
X-Received: by 2002:a05:622a:1195:b0:51c:93b:4f1c with SMTP id d75a77b69052e-51cbf1fd6b7mr81466511cf.43.1783945907246;
        Mon, 13 Jul 2026 05:31:47 -0700 (PDT)
X-Received: by 2002:a05:622a:1195:b0:51c:93b:4f1c with SMTP id d75a77b69052e-51cbf1fd6b7mr81466271cf.43.1783945906795;
        Mon, 13 Jul 2026 05:31:46 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa635dsm2861932e87.62.2026.07.13.05.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:31:45 -0700 (PDT)
Message-ID: <b9540345-63c5-4da2-b761-cf1aafa8286f@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 18:01:34 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
 <71576059-b5cd-401e-b4b0-c1784f24ba46@oss.qualcomm.com>
 <81ac9bcb-65c8-4cd5-bc54-c350f24d06a8@oss.qualcomm.com>
 <cb9b3fd5-e63f-4367-8fba-cd3cd11fedf8@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <cb9b3fd5-e63f-4367-8fba-cd3cd11fedf8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzMCBTYWx0ZWRfXxSSTwIMPDCE2
 9TkOwU8qSyUZvGpztsM6RQk0nVC+y2Zyrt6MirIg1nzOM3rFxHXwtAVlbKIvY/dMp88FV6aPNHu
 a9IKheCp5dSF853i2ZvtPyPOMa07uU8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzMCBTYWx0ZWRfX/CVjlJ2aGK9O
 D4YJZoGKL7hdaNU2qN6hU4wZ0rq7deJqAe6lHKPmfTjRwUG5/vLHQYp+K7/IE8HK/l4iJpM39Rn
 aE6tol3spf8VlD6ZZMedaQCJW1SZ5tm9w1bqxTTZIEzfwgQ7lwPN/a9HI6gOEWCboeWnKGCFCCe
 xN4CDhBLO8BNv4wHH4j9tjBetXJI5f02o661JQeFBdf1WmupUvACLwxjmm+ExyXOi3YsIr1c/se
 NawYN5fnutx2Jwm3JO5BCkj7G+uBK8v812g5mzhXjjYMszdLBwA/A4MJ0kW/xEBm37RAvaqROtw
 P0p7inOS4Tp96bKjYan4oWI9tdWwTeCOGSxBar643VcGWajs0HLGe2bPUPsv9PA3Y0jc3h7ZmK8
 LY8RCaxTGWtOFIj12eaur/evoUZXmjXl3//ctLYLjZl8vdM/G8I+X+0R0TGQAn0UKvCp2cUll8s
 LeKEEmuQtPv5DndLpWQ==
X-Proofpoint-ORIG-GUID: F8LIBp-awFaIj3wSP3Jrm-7o0ForN8-Q
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a54dab3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-Cfwf-izUa4NwULDX60A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: F8LIBp-awFaIj3wSP3Jrm-7o0ForN8-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130130



On 13-07-2026 05:44 pm, Konrad Dybcio wrote:
> On 7/13/26 2:07 PM, Imran Shaik wrote:
>>
>>
>> On 09-07-2026 05:30 pm, Konrad Dybcio wrote:
>>> On 7/8/26 8:25 PM, Imran Shaik wrote:
>>>> Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
>>>> CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
>>>> differs across Shikra variants based on Audio subsystem enablement as
>>>> follows:
>>>> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
>>>> are required to be supported on HLOS.
>>>> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
>>>> handled on Modem, so from HLOS only resets are needed.
>>>> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
>>>>
>>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>>> ---
>>>
>>> For the sake of simplification, can the resets be enabled
>>> globally by default?
>>>
>>
>> By default (PoR), those resets are under HW control. For audio use cases, software desserts/asserts for switching to SW control. Hence, these cannot be enabled globally by default.
> 
> What does enabling the provider node have to do with changing the
> state of the resources?
> 

My bad, I interpreted it in wrong way.

We have IQS variant, where we don't have the soundwire codes, and hence 
the respective clocks/resets are not required to be supported. Due to 
this, I have kept the status disabled, and enabling only where it is 
required.

> FWIW there's nothing like reset_sync_state
> 

Sure, I can keep the audiocore_csr node enabled by default.

> Konrad

