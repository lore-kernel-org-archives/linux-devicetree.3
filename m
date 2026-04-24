Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E74F3BED4A
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777031122; cv=none; b=YdBtDn9eD0l9pjexhp6xzWtaOpNj6BBH5nmObFL4zYeZpfcERejToj+sLS6CEO8NX0ekE8nq31ddOlJ4ftZii4QRj05+Ng+aLP8Utaj+eCZaID/8XK7SzCZvE3WYE2tkdyDSOZAK/XQCrJXYw2aVRiMqyH0/JZU4JZ+jHgJXdB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777031122; c=relaxed/simple;
	bh=sUwdYkQp1oZ3EzBJbnMVR1gTk663wCA8A8zZnsUbQgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oU8FI+S5p+d1MR/eNQQRcpZ8eYL0qEzdHXmFCmpD2nKTWdiprZLK1TZr9YmH7jlTKgqJGlULQcLNZN5titUR5+MDtKgXKx68+b6c87eBxesceagc5ih5kbAX/TTEi2oP5XnD9kv+AwQesVUNC97LT/KDbbGEbkppoKIpV5ujPpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEErPifd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RFCClEG/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEErPifd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RFCClEG/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OAEsxM2447126
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vKD+oIXo8r5i+72tQbUpEkekMjtbIYtq2yZlf7mfgso=; b=KEErPifdYn4zic/W
	+0SI2Cxb09hK+xb2nh4J1gZerJ3aNlQnxYHaQlbgVa08VCXZ+4T54lQTHE8E487F
	cCSzG0BcBokq8YT3neEZg7zNGhuQlxJR8iVdmo92VrP6mRait0WrN0DJmPMuFfaH
	yjSA4GIed25xK5BkjbDiwWinSrGkrsqst/ZysXd0TZoXuXNBO0hKyZxC9t1JcGL/
	OEQxmiKBTTihMWypvZa9l+Be22bVLesE2xCwtkcIokiB0+B+CY5Y2piY9RdblTSI
	GGmX0WB879Um7NO/Q+CnSgas3JjafGv3s2uw0iEA27A59O2a5BNOU8pikUrxggCf
	QzzUEA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr6kprda3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:45:18 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f6610a6c8so4093996b3a.2
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 04:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777031118; x=1777635918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vKD+oIXo8r5i+72tQbUpEkekMjtbIYtq2yZlf7mfgso=;
        b=RFCClEG/81CKmHqFsOt6QY2wXYctUtpQlM+tmVCUEvHAGBgS5OP+HLP02CR/J4W4Wc
         RIXieG6MTy4jO8snxFB1+HESLChHwJln3tljAYwHjrQwH4VoaAX/TeR03jcxghVVJzTv
         JhSuHhFg8fekWiZX4XAxZ9zD3d3Es5UaQM30Oo6gF+THnnNjsmTCf6fLRGSUgVZl1WuC
         PAelJz+kWCbys0XH7HOOWdo6BV10zKeEDJT1ZtTC/kK0qlnxbqzKXWwoia0qukTMtPN6
         o/dF6tAM8Id+mEsEAPiANaX0eZ4DDZ9mZFWgi+m+73J1cppRJOC5H+T4PYzQ1JrWt+e9
         NzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777031118; x=1777635918;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vKD+oIXo8r5i+72tQbUpEkekMjtbIYtq2yZlf7mfgso=;
        b=e8M1cz/MgcqOW0s1HtPkJT4nHnwyD4a1RCaqO2r5OFu/cbj7/gJZI1CpdQ7rt/rfLO
         Q+rKZxBJXAfDfg7PP8g/mAW/TKw1pIt3ZulqKWsD3lQG7D5tn0iXnNKAngDzwvH6LsZY
         aOtVSxQSnmOLIxxoHTM/0QRMnYWTVQw1TGhPBcbiUCGSBg41ajgef5Ag7oP1bBrdAWbB
         jv2jCSOeea5uLYupFnni9j7MyIOM6YUrQdBpiMUEa9+LTzG89LhgFEfaD1PzYgqpy6l5
         xatfQMhc6SKqF+3UDQQYjFQQAMN3d4hRZ6KkBdY7ev4u2cuvO9drQP50RrPEwHZV/u0d
         3Rgg==
X-Forwarded-Encrypted: i=1; AFNElJ9l88PhWP9jl3DY6Ng8cW17lWMDGjv8n+6tERuyc0kjgdHWoEKNkKlY9uUL02dHaUSgT9imRnDgrVKY@vger.kernel.org
X-Gm-Message-State: AOJu0YwIGVeOz5LeCCPqb+OroUcKsBzqrG57yZwFABWRqcUckCD3Gryt
	B/eCcbCCWkpRpgzdMGdbnwgwVwiqTjyM8Pi63UqA7nRnB4AgFEimlz/0zmzlkeI5OxeyMyN8tFE
	R/rzIf43XUEmvalz+geqQXYq+Soqb93Z8nDJvQgKaOI+qV6iM3ZWxeaNTdSZ4v6Qu
X-Gm-Gg: AeBDieuxsOjOcFE3qzgdHNGH+AxaMBYyDcI4KYXH+0yv6yWsF425UHaaB7yHDfzITzU
	+qd3RGO9gO85uAsO7h8YeZayI5W8YQUDKP8XThv/8+zMk2i48nnce/ELe8LOhhJNHFkS+CPhLjc
	/BKRQjAKSgp1QHxaBlgwDsmFrjqNb2kdKpV8MyA7/6+5mxDhAVPQW5KIBKKzA3YwtkS8wZC+PIa
	VPdEpFux/uKHwoqJHRZWvOfDvFrSYM1G3Hj0/CBtWRqF6Gf+SkWZDfEipZjp31Z3RgfauF+NDRZ
	+GcWoNDR7UvGGBrIs/l/lqOH42UhE3tN+EvrkzMSrLxqUQY6snLvIZOX7cGx+MvU2JsTx3HwkAI
	rO0mx3gd99UhpKFi6bioh+vgNigqo2g+1+G9y0r4A7fNyDJKkdlZct088ZpzpIQdp
X-Received: by 2002:a05:6a00:27a8:b0:82f:18fa:1668 with SMTP id d2e1a72fcca58-82f8c91e3cbmr31091213b3a.44.1777031115616;
        Fri, 24 Apr 2026 04:45:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:27a8:b0:82f:18fa:1668 with SMTP id d2e1a72fcca58-82f8c91e3cbmr31091150b3a.44.1777031115048;
        Fri, 24 Apr 2026 04:45:15 -0700 (PDT)
Received: from [10.239.60.18] ([106.192.26.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec04448sm27904931b3a.55.2026.04.24.04.45.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:45:14 -0700 (PDT)
Message-ID: <4c3fa710-f61a-4aad-622d-54909190cb9e@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 17:15:02 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 02/13] drivers: base: Add generic dma context bus
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
 <20260423-glymur-v2-2-0296bccb9f4e@oss.qualcomm.com>
 <2026042346-trustable-register-095a@gregkh>
 <06c04947-e72e-679b-493b-e112d693f391@oss.qualcomm.com>
 <2026042422-deem-chemist-8d0f@gregkh>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <2026042422-deem-chemist-8d0f@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cdDiaHDM c=1 sm=1 tr=0 ts=69eb57cf cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=K3jt3zD9TrcZs+Uyli2v9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=qtrQGJdHBaugJqU6AYUA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: -9voRfUtkle8X0kmEiV1jgUnPr32FjJM
X-Proofpoint-ORIG-GUID: -9voRfUtkle8X0kmEiV1jgUnPr32FjJM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMiBTYWx0ZWRfXxXZsyGQyVSx7
 dTL/C5qu0ZsUxFPViInEYw2n1GPhek7BUopYaCQq/3Uwj88Y4o2k9JqALmW8vWaVPrhi1zEp9+1
 2DR04Z6U/2U2/ZQGdrD2ctTB5v/axBk09lzOd2jKYv20LGLovUuKhEDcBaDECto6BtDWc1xAm2p
 K0hxt3C2gavf6adzPB80ZB6YCsMVVVhHJoqz1KamF0987eDSd5SP/YMBeROqem94J9wiaH07KKy
 t5WFq23jl2S7xn737QcT4254ti21sX6F6JM80Ieiit4aZgv3OBuqESmLtmgT3ct0eFKoQPM43Ps
 0VR5nJ3upS/7tyWnUxPa7TIesgw9UdaMemTTTIEUJoyn6ipHmew3m+hdU5ZpoEW2Sl3kMMYQb2h
 cxwt/Qrsw3gMtel2YLmbezZ0zQo6GRwZBIgMSAbx/Qr8GAIs2Q3sHA2QGnZ2zIm2UQT9006Q6AG
 gb1sAaBR4GggkW7fmww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240112


On 4/24/2026 4:43 PM, Greg Kroah-Hartman wrote:
> On Fri, Apr 24, 2026 at 04:01:13PM +0530, Vishnu Reddy wrote:
>> On 4/23/2026 7:07 PM, Greg Kroah-Hartman wrote:
>>> On Thu, Apr 23, 2026 at 06:59:31PM +0530, Vishnu Reddy wrote:
>>>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>>
>>>> When a driver needs to create virtual device at runtime and map it to
>>>> an IOMMU context for memory isolation, there is no common bus available
>>>> for this purpose. Each driver ends up implementing its own bus type,
>>>> leading to duplicated logic across multiple drivers.
>>>>
>>>> host1x driver implemented its own bus type to attach an IOMMU context to
>>>> a dynamically created device. The Iris VPU driver now has the same
>>>> requirement. Rather than duplicating the same bus logic again, a shared
>>>> bus type is introduced under drivers/base that multiple drivers can use
>>>> directly.
>>>>
>>>> The bus takes care of creating a device and attaching the IOMMU context
>>>> to it based on the client inputs.
>>>>
>>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> ---
>>>>  drivers/base/Kconfig            |  3 ++
>>>>  drivers/base/Makefile           |  1 +
>>>>  drivers/base/dma_context_bus.c  | 77 +++++++++++++++++++++++++++++++++++++++++
>>>>  include/linux/dma_context_bus.h | 26 ++++++++++++++
>>>>  4 files changed, 107 insertions(+)
>>> as you can not have a device on multiple busses at the same time, this
>>> makes no sense to me at all.  "dma context" is a bus-specific thing, so
>>> please add it to the bus that you are wanting it for.  It can't be a
>>> generic bus as that just doesn't work.
>>>
>>> Or what am I missing here?
>>>
>>> And why is DMA somehow "special" here from any other hardware attribute?
>> Let me give brief information which was discussed, in the initial series,
>> the iris VPU used platform bus for dynamically created devices and we got
>> the comment/suggestion from Robin to implement a proper bus_type with a
>> .dma_configure callback.
>>
>> https://lore.kernel.org/all/02b3d0f5-f94c-43cd-93af-97cfcf7751b1@arm.com/
>>
>> based on the discussion, implemented the dma_context_bus and used for iris
>> VPU devices instead of platform bus.
> Why not make a irus_vpu_bus where you can do what you want?
Initially iris_vpu_bus was introduced, and it was made generic based on the
discussion,

https://lore.kernel.org/all/20260227-kaanapali-iris-v2-3-850043ac3933@oss.qualcomm.com/
>> Here, the device have only one bus (dma_context_bus), not multiple buses.
>>
>> Regarding the "DMA" naming, the core operation of this bus is its
>> .dma_configure callback, which calls of_dma_configure_id() to map the device
>> to a corresponding IOMMU stream ID. The name "dma_context" reflects this
>> purpose.
>>
>> I am open to suggestions from you or Robin or anyone else, if there is a
>> better or preferred way to achieve this, I am happy to consider it and
>> rework the implementation accordingly.
> As there is only one user, just make this your own bus please and do all
> of the needed bus operations for your devices there (i.e. don't hang an
> "empty" device off of it.)
The reasoning behind to make it generic was to have more users - host1x,
Iris VPU, QDA on the generic context bus, instead of each of them having
their own. Let me know if you suggest to have the iris_vpu_bus.

QDA -
https://lore.kernel.org/all/20260224-qda-firstpost-v1-4-fe46a9c1a046@oss.qualcomm.com/
Iris VPU -
https://lore.kernel.org/all/20260227-kaanapali-iris-v2-3-850043ac3933@oss.qualcomm.com/
> thanks,
>
> greg k-h
