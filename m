Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F18147127C
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962048; cv=none; b=Ig9wdp5Xm0JoZCnKCWwHYz7z4V7EokeKUDbuLIEwus/RDoTOyezjhB4nX7JSnqtDG5i04EjqpDz+6lN0UIJLz2pLW3GhCpXiWs7ZeKWRXma+AV93FkV5S+CBYZQQcGD8U4JBdaG3ksUY/dipjEwVnPihtKgM/Q4AkJPNTnDJUMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962048; c=relaxed/simple;
	bh=2+ue94dCmSYfAFt/squqruj5hYpfGvLZ625Z0fOQRfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EUbPKu7LKsVWeTYjIcJhFTYMxEOF+GC3SgL1E/MWN4dtmUm/WaOITD6sCySSuQ3bN1TJkOZfcHV3/nyEZ4a5ub5MWuew5GVVdVaAyCD4ojeukjxI/38hjfd9D5+3dc8nQL5JFGpeED6NSSdBSwYMMjK6Wp9Jm7biVfMEV9FXMpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JYqvlNGd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zng4ZgGn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JYqvlNGd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zng4ZgGn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E100Fi2873874
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w8A/v1ScPhnPL3wg2XzmpvQmBVh7gCGcc/ddSXg+qT8=; b=JYqvlNGdbSkKupvU
	cb9t1+dgmj0aiWB8a2Q+KhxcX7UtsV2RF4XYYtqTeVyH7245e8ixc3jS0i9N1mLC
	PQAiYJLDbjKWxc7GI8tLpVUGeKmDnHw5LRDFTuHSAKhfXDfOv6h1MOyXrJ5PdsuW
	64uclrpTFrYt58BP3CC7Lw4BY2xsUUynJA4ivW6cgtlMefqAp43hWiDFly8OxTyL
	9Ka9yZdOxceJAK8tVY7DdLPbdZ2eGzUeisEE3Lx5hzBuhCpv/srikxNGhF/2hpiP
	QiT/PBqHVSPYUy7AUZMPnjjvLKun4z9pOX5Il7S51Ey+lH7Bb2YJFN7tbloGtEcz
	JM9Q9g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphh921-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:13:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac76132001so301370a91.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 00:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791962038; x=1792566838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8A/v1ScPhnPL3wg2XzmpvQmBVh7gCGcc/ddSXg+qT8=;
        b=Zng4ZgGncdq03xJH5qzFPmp4Y2iUctVWNMhRy1Ho0u7vvyc5sgDbur1wNw9McNJxP1
         vD6mPTkXkkBHbc6jzh9KSDzjnQhDLqa+b3wF+yqCDK0tzBQ/Y6JS55OWwr8Qa9KGaek2
         B73nQ5j/3tOi6Jp40IzqW9P6H8d0hye4EGiuwtb2VpoF/UC4bfb23Mf2w2+f84laf540
         hTHnkm4x4Fggci2+5DbMcT1SAFS2R3kExNTUkC0RnZl0Q5GbtaEa/85f0bPql5Hv8ei5
         Oo7XhYYaPqyd77AfBiPPQAObP6FER6skTD+2HjXnLnA4XQdLwlJZtrn288XO/Lt6PpHT
         pPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962038; x=1792566838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8A/v1ScPhnPL3wg2XzmpvQmBVh7gCGcc/ddSXg+qT8=;
        b=Yc70MmTk55A7q9htLZcyy3oklqAFoveZ3W4b6dfExhz7HeK+Ed1goc842n66b2Sdub
         rLkuGkMQN4CE2Pgo489VBX7OCsylvc/fZ3ZWSb6M4m0kAZWJ7O0yexIvQgz32bgnS3t0
         eRjd+z+dgY4LCpjg2Nw5uDZJiGbq00KykrIvlVm1lbzDomfXookTxkYizo25sBO8vkM6
         r2S9Fc8Le6IBhbw1ZZrO1usHrWgOAoL9WUErSBXQ7oc2rcWDTykCdatgxd4CxSGOLRP7
         Mu+RBxNyzyX2P1ZL4XuPqSRtaszEW/+zoeuz6a6HPcg/p/qmBRCCHpkwk3S4YKNh2EkM
         GOHQ==
X-Forwarded-Encrypted: i=1; AKwUvByqDHty0fFhbXDTbcuGWqVWJf7DFFfUOg+v3JqKcEpvRPI0W0FDeFYfHN7hzqAZ02qwmTsvviVlY57Q@vger.kernel.org
X-Gm-Message-State: AFq9FYLmaNM5nhagBo4Vzgxefxq57xmHLEtBqAa+dSdFu7WyORZJzaDq
	y29mJwS2EM+VV3Gk9cgXUlv6JJ33mdP2arnRab04Ggt3Qv+lnPR7AfzmJgATIeVtAhgt1lHXOKS
	lvs4wIXIPTyshSCBAuZ1j2LYV1X/jjVKdbZI7ZfwA+YLByByKkpZWB7VpuVgbbBH3
X-Gm-Gg: AYBFou0FpJgQG+s/XETx0NhJPhbztqRFIFFudNd2h7HUCZ/5d0LgHhjnfdCdBLsH3xz
	va9GjTzmEsTHwsRNjpNNt7UrnEn2maA05xxc/SQfBFDOTwcNkbkrGEHGr0wjvpUC/sBLNVUww4v
	THukLp3qqAfH+TtOnVvJzZmpBVjQMKVofo80l4v+ImQDgxIa99IMV2nPdyps4ALmZhSLZUJ0XfF
	dnI9Py499XoDEsLVdX+/jYig1HNlppxym4ZQP81UPFx0xNXSG2XKS26a0SuNKJARYSv0DF8aFT/
	PbU1hSdJzvrK6T6X+N/9q0Vl6TK4ae0B5jTgSHrA0LCbue07LD2OA7K7Uh8cXiQFdv46hhVoKFz
	MYfP2OHVzan4NMAq6nGHXu595mK4U/QbStqlh9L3D8nIuj6IjOYFDlDmCAB7D62iO
X-Received: by 2002:a17:90b:35d1:b0:3a7:971:7470 with SMTP id 98e67ed59e1d1-3ab3ab20a3dmr11251799a91.47.1791962037952;
        Wed, 14 Oct 2026 00:13:57 -0700 (PDT)
X-Received: by 2002:a17:90b:35d1:b0:3a7:971:7470 with SMTP id 98e67ed59e1d1-3ab3ab20a3dmr11251780a91.47.1791962037472;
        Wed, 14 Oct 2026 00:13:57 -0700 (PDT)
Received: from [10.133.33.145] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac6006376bsm3136909a91.3.2026.10.14.00.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:13:57 -0700 (PDT)
Message-ID: <db1f275e-b97b-4be3-9295-acfb22875afb@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:13:48 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ben Horgan <ben.horgan@arm.com>, Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
 <20261008210004.GA1318789-robh@kernel.org>
 <1d764a3d-7935-4e26-b1c2-92537e1d3811@oss.qualcomm.com>
 <893507ca-b956-474c-9124-92fbfc25e9ab@arm.com>
 <f17e31ca-817c-4607-a680-55ceb12169dc@oss.qualcomm.com>
 <21f0c2f7-48a5-466b-9dd3-170a04e3af9c@oss.qualcomm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <21f0c2f7-48a5-466b-9dd3-170a04e3af9c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jTTFeWQpenXr2sAvzzKz5MUANko_oa5o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyOCBTYWx0ZWRfX/C3qwcYjFFeX
 LT9iqqizKoEFOt/ish2IHBYetZOfWFIBeOSdbNkqxs/DtCKVv95shnW0/GR9G57JW36vklZJIw1
 NMR5PVRRNDXgpDByrvdXH7J2qXS4sn0=
X-Proofpoint-ORIG-GUID: jTTFeWQpenXr2sAvzzKz5MUANko_oa5o
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acf2bb7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0BaB_ceHjnLeFdfrkW8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyOCBTYWx0ZWRfXxQ8aEyQZsa+P
 CfBP8Y/IR0kzszYc4Alw/eq5l5onQF/P5P4RquX2OrIpGhLye/WPu0qNR/Obj14Fx90Xs0Uiczb
 da0MOv6lktKp/NAtGRa/E9D4IBHjmBIIWupslq3LOFczUAabKk/GofDpMsg8rZxWHRMFM0RdETm
 als0rH9kT4y3efoQ2z+bbdFw6Do3/cIid4SJRYtNFtOGqPhqoWz90AJ4Mfu3GmDi9AOJExdkdKm
 NEOkXeBHDyEA00hDCDOJq5aJ/VJg13W+NQ3IQL0Ns7vGZWQfmv7OZyURWSOvfoO8rS2aZIpmBYE
 9XFDPu6/VdkS3F8Jsm2D8EBYf/QwmSZiVUazd4EXAaAnB5K9DpxW+f0pj3gxTW/pXdJpOOr3e7X
 MGQQ4wLYKfMEXFiPeHL1TdRs4mZAE3KX50sqTlih3Zc+5wYntyaoNFQFLMbNDnj/a072mc7jdep
 CSrKA0zkE217kI0aGOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140028



On 10/13/2026 6:54 PM, Konrad Dybcio wrote:
> On 10/13/26 12:13 PM, Yin Li wrote:
>>
>>
>> On 10/12/2026 7:27 PM, Ben Horgan wrote:
>>> Hi Yin,
>>>
>>> On 12/10/2026 11:48, Yin Li wrote:
>>>>
>>>>
>>>> On 10/9/2026 5:00 AM, Rob Herring wrote:
>>>>> On Thu, Oct 08, 2026 at 02:41:17PM +0800, Yin Li wrote:
>>>>>> Add an MPAM MSC device node for each L2 cache. Each MSC is nested
>>>>>> directly under its L2 cache node so that the cache node is the MSC's
>>>>>> parent device and its CPU affinity is derived from that cache.
>>>>>>
>>>>>> The L2 cache nodes are placed directly under the root node. The root is
>>>>>> the root of the physical address space, so each cache node only needs an
>>>>>> identity 'ranges' property for its nested MSC's 'reg' to be resolved to
>>>>>> a physical address. The two caches use distinct node names (l2-cache-0
>>>>>> and l2-cache-1) since a cache node has no MMIO unit-address of its own.
>>>>>>
>>>>>> The nodes are disabled by default. Production firmware does not expose
>>>>>> MSC register access to the OS, so these nodes can only be enabled on a
>>>>>> local test setup where firmware permits direct MMIO access to the MSCs.
>>>>>> This DTS is therefore only an example for other platform DT authors and
>>>>>> is not intended to be merged.
>>>>>>
>>>>>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>>>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/qcom/kaanapali.dtsi | 50 +++++++++++++++++++++++++--------
>>>>>>     1 file changed, 38 insertions(+), 12 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>>>> index 131fd2a16c54..b1dcb1e9c570 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>
>>> [...]
>>>
>>>>
>>>>>> +
>>>>>> +        msc@19870000 {
>>>>>> +            compatible = "arm,mpam-msc";
>>>>>> +            reg = <0x0 0x19870000 0x0 0x10000>;
>>>>>
>>>>> The MPAM register length is 0x321C.
>>>>>
>>>>
>>>> You are right, the MPAM register space is 0x321c per the specification.
>>>> Will update accordingly.
> 
> In Qualcomm DTs we tend to use the ""how much register space is allocated
> for this block"" rather than ""what the last used register ends"" approach
> to avoid holes
> 

Hi Konrad,

Thanks for the context.

Thanks,
Yin

> Konrad

-- 
Thx and BRs,
Yin

