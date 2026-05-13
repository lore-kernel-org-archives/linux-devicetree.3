Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3905B436358
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682652; cv=none; b=svcf5x5jDiSdpxtbS/dLOwhO2WqFDE/N/WVYSJ4rpnZy2Alzipj/9QqRVmApOd8x2LngnGgyIlk6Sdsjnu3DxkLU9u9XRYu3RtDMEbYgIqTOtsCAqboJTVLA8cqkEoGp1tCS56yar++OS6TYtQQaFXJHvFRqXND3KHfzu20AytM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682652; c=relaxed/simple;
	bh=9vwn9p/G3SBynF/R6x9abjmpGFFEqEuhbl5fGpI/Xo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QGUybTvosVRnbTNJopw0FE7Q768Ph0yF+OJ/4L/BvxMKxuZtnXnXz62F2bX3REuSHkRRdpkMuwlu0OQZn2QepdGRb/XEzVYNle4UDzWzZMjXbn5pOQ0/JP6cNMwHBlnxcr5DnOozUxx+BXWQky5sB7XLmpoFpJLfflAGnu97qSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZV2cLJMZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eoBz9nuR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZV2cLJMZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eoBz9nuR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAWDJV2321248
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kRdRHlj/4FYDgqpaQppw+iq5ofthvt61GQTIwvPfv54=; b=ZV2cLJMZDRi4atUp
	7gvRykW+ST4ITAgk7scyikVL3gdndFwbo8rKTvUhKXHkmRh/l9CrpfFMY8yQXqfG
	fT9sv3BgWY/Wsuqf8WPUwAkc/+JoL1+oobkfZhbjbqrzfufmDCbHaF2fSMCVmocp
	rmcAijS8MpXPFEyF2JSxlejK06CsckT/SHVM++3DHpn0MHHMBpcl7Slt/x74oKsa
	dRsXBYABpnZuaBFVG4o5QVV47Kd1LSVnr7DLXBmIWFlT8seqt/qaU2Wpm5nQC6M9
	Ge4mMXfPQ5jIZjrneJpkuiyZr+GPzqaZqdGvHV0iuchr69jgVvf+sq5L6y8SRclh
	tYEGog==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hguae4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:30:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83536dc3be5so7389265b3a.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682650; x=1779287450; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kRdRHlj/4FYDgqpaQppw+iq5ofthvt61GQTIwvPfv54=;
        b=eoBz9nuRq4YRspFMGC3/VyVm5e95DLTh8Q+i3IE6zLJfZ19DAl+pbZm5Medftp3S71
         WZWvN6IfuH8x8hrYuDGseh79gV8Q7oifAqhujFxLC0fXwjivOMLESnFTsMiaC8xuaiNO
         HoMa3ZEeNU9Q3ikYQKZut6mOYyNLw85E5c7k8wVT3oAn2G9KR+oIVeVJ+6fWrFKr5fL8
         rukp+lOUJwSTR+9uYpe3O5fMyg1sggXZHqYpbFxYIRarjsOYb6mMwzQCoqDqpkt037n+
         lHXpTAMgUGjrJAY0MtqxTqctrhy5egnTocoEalSPbU82is7S0P+fVwAfVwh/IG2nUMKB
         gmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682650; x=1779287450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kRdRHlj/4FYDgqpaQppw+iq5ofthvt61GQTIwvPfv54=;
        b=JAH6kEIj1oE8XjC2K2gq99JORjAxwLyl/NMKJRrS+9t5JGghCD+spq+JYvdaJayUGA
         p/s1Uh2JmTI6+GAPE7xpXGgOQholLWT4qbou2f7C5rSod7VtvxrLiC3jzjmKOEdGqoYY
         X0KqMSJjgtSgvYIhHTZ8TullpIWFjTkewvA24DVpY5uvvN0VLeHS4XsXcpt8/EiaLEWS
         ntBDy4i+ZRCd/cc0BOvE4PsJMnZqJKUwrneiNU3SFfvyEhqN/iD6IT4Z8Pd0vVDuTKd+
         BxEfNcybTG+fRhGmWoj6swEN/2POuZSQhmRGd8TtYawepkDCcBfyorYX/S7IOhp+M/0M
         aAcA==
X-Forwarded-Encrypted: i=1; AFNElJ/dKbul/Nj3sBjjsOEXIc4+UgMlNQUWZDjH6CXVmg4K/mA5KV+n4WmWbQrrck6SOVyfWtUuEK7o3DAV@vger.kernel.org
X-Gm-Message-State: AOJu0YzN7V1ClMoaDxO9yjzsvqAVGNtlaOYOy18LdCgHAHzCvgTmWCWZ
	8UNJoWrmftNVawGeX5Gpa3r0XPdc1paG7LOzSm8LNA8/SWtfZcQHsbTrt7v2B3JoynKKUy34jCy
	B8dKnrwNmnVKtiqdrOgVNPd46WIzKGG+mOboYTk9Gqw4qy2/HCjvciZ+hH4nLtzHz
X-Gm-Gg: Acq92OGr1xHGm1urxgH0xmPwnvrCkfU9MiOiFqRIYwr5SOZ2J8PLVhoTzz47qsDkRPi
	bi+5jD6gtBCt4E0x0nFEMMqS0++VSZ7BQNpwDSGWqKgxZHEAuiVWzvxWU0RUQE5H5gSEdukcAIQ
	TrCD82auT8kVyg+KGDYxCY3anyT5HJJo6lJ61dce3dj33wIgodWIMwXV0dQod4TLvGthblknqgz
	hP3g+Nk5PhDUanNUUZU4uITsRHLDDlLb2VIiXzuMI7Z7JUjQ9mPuVRyN8PdhEkEUS9MQSCrnxSF
	MP+mghGNv6fVIzrG/QfY9dh5+c9XX6BQpRr1lkV1B5/94tQDCBVV0hOnPkZI8KBGNGtlvPzpel/
	czTU/yZj3dlGqZsQ/1H2QKN+W4wqUhxglKLCAiUu7PvWJgGDtSDAHaFM=
X-Received: by 2002:a05:6a00:22c6:b0:82c:dfea:9e2a with SMTP id d2e1a72fcca58-83f0542d985mr3656128b3a.2.1778682649587;
        Wed, 13 May 2026 07:30:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:22c6:b0:82c:dfea:9e2a with SMTP id d2e1a72fcca58-83f0542d985mr3656058b3a.2.1778682649050;
        Wed, 13 May 2026 07:30:49 -0700 (PDT)
Received: from [10.204.101.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcf16sm31628277b3a.40.2026.05.13.07.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 07:30:48 -0700 (PDT)
Message-ID: <ad875fcf-531a-49af-b58e-575185c12d77@oss.qualcomm.com>
Date: Wed, 13 May 2026 20:00:39 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/14] media: iris: Add platform data for glymur
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-12-7fbb340c5dbd@oss.qualcomm.com>
 <jfypqc5ise7uezog3lwmmrzddbsctir6ze24ma4vp4zgcuwjbf@4443jqib6nxw>
 <b6dc6b32-26ad-6f2e-dfd4-551e7fd0481e@oss.qualcomm.com>
 <wequp7ogk2az3d7yzfxn7wwlr6k5ng2jwrg6anaidseteuwlev@v47yoo4j2gbz>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <wequp7ogk2az3d7yzfxn7wwlr6k5ng2jwrg6anaidseteuwlev@v47yoo4j2gbz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a048b1a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=AkRF1kMk2nwCDGt8pKAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: b1sAL4i_cWh8Ahf-2rZ9csrtYM87GDP9
X-Proofpoint-ORIG-GUID: b1sAL4i_cWh8Ahf-2rZ9csrtYM87GDP9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfX7miwmOcq+lra
 KwPli70foCVeHJHh/IaZ5INMtOvQHa2fkgNqj5lpnSwQioxLbZvV7y2v/j6W6zwoouaSJHAvcYp
 k/YgCqhzWGE4VN+7k8E3dT8RrBO2F+1P9kjYnSDF0ZSTdExO6Wpl0c87OTiO5cnlPirXyb+V8dF
 ZJG+p3APINkibHBzQNSrfM1iwSFaVlYMcmvy9tgCaVBUn46t4VfF/b1FYUG/0Q6EWl3B1Lpu7Jf
 xMmEUWFnkmQmO0H0iKYzYz31mj4x9ZirxxaBqfZen8GANP+4Zz6DxKSQJvM+j25cECS3eORQPGJ
 knW1mYU3JREIJVszbyuGphxBDydEcJj+rbMdBAmTqiJs+YkDRhC7pF15pXdPs79ECPIas1WqUV+
 +d4HQgFOqlQsy79g1OQiiIw70EivpnDY7OmN2OBUguNTVgfozolYaDi9vpsIG48/IBAy/+FuN3c
 nNCrgeYebpmec3D5T3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130147



On 5/13/2026 7:47 PM, Dmitry Baryshkov wrote:
> On Mon, May 11, 2026 at 09:45:01PM +0530, Vishnu Reddy wrote:
>>
>> On 5/9/2026 2:35 AM, Dmitry Baryshkov wrote:
>>> On Sat, May 09, 2026 at 12:30:01AM +0530, Vishnu Reddy wrote:
>>>> On glymur platform, the iris core shares most properties with the
>>>> iris core on the SM8550 platform. The major difference is that glymur
>>>> integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
>>>> one. Add glymur specific platform data, reusing SM8550 definitions
>>>> wherever applicable.
>>> This leave me in confusion. Having two cores, each with its own set of
>>> clocks and pm domains, I'd have expected that each core scales
>>> independently. I.e. if the load is pushed to the core0, it requires
>>> core0 clocks to go higher (while core1 clocks can stay at the low freq).
>>> Or, at least, the clocks would be set to the frequency corresponding to
>>> the max of the workloads (if for some reason the cores should stay in
>>> sync).
>>>
>>> However, I don't see it in the code. All clocks and all power domains
>>> seem do be scaled using the common workload. If my assumptions were not
>>> correct, please explain it in the commit message.
>>
>> The OPP core logic sets the rpmhpd level and clock rate based on the OPP table
>> defined in the DT node, where the clock frequency and power rail level are
>> tightly coupled together. Since vcodec0 and vcodec1 share the same power rails,
>> independently scaling one clock high while keeping the other low is not
>> straightforward within this OPP framework.
>>
>> Do you have any suggestion on how best to handle per core independent clock
>> scaling within these constraints?
> 
> This would require more plumbing and driver changes, but:
> 
> 	iris: video-codec@foo {
> 		compatible = "qcom,glymur-iris",
> 		clocks = <only-core-clocks>;
> 		resets = <only-core-resets>;
> 
> 		/* or core@0 */
> 		codec@0 {
> 			clocks, resets, power-domains;
> 			operating-points-v2 = <&iris_opp_table>
> 		};
> 
> 		/* or core@1 */
> 		codec@1 {
> 			clocks, resets, power-domains;
> 			operating-points-v2 = <&iris_opp_table>
> 		};
> 
> 		iris_opp_table: opp-table {
> 			compatible = "operating-points-v2"
> 		};
> 	};
> 

clock source "video_cc_mvs0_clk_src" is common for both the cores. It 
would not matter if core0 is scaled for a specific workload and core1 is 
scaled for different (let say lower), as the common PLL would always 
generate the higher of them.

Infact, going with the approach of exclusive scaling would be an issue 
here. The later core scaling command would bring down/up the corner for 
other core, and could lead to under/over-voting.
>>
>>>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> ---
>>>>   drivers/media/platform/qcom/iris/Makefile          |  1 +
>>>>   .../platform/qcom/iris/iris_platform_common.h      |  5 ++
>>>>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 99 ++++++++++++++++++++++
>>>>   .../platform/qcom/iris/iris_platform_glymur.c      | 97 +++++++++++++++++++++
>>>>   .../platform/qcom/iris/iris_platform_glymur.h      | 17 ++++
>>>>   drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
>>>>   6 files changed, 223 insertions(+)
>>>>
> 

