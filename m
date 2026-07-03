Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEF7378814;
	Fri,  3 Jul 2026 09:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072789; cv=none; b=QCzsSEQLYZ4huAh3ew7p595PIg9Za/WtKS4Lq2sw+vw6dWadckl/lOCKFcU74I0DgLw1H9z6TXQyet5XSw45iJ3Z5E9rhZ+72qsKFNi/KbIY2ae7zmK1CvuON6Thv7ww55iu8TxJXxnlOh71sK+nqd6k6r4WI37bm1hchtjDfQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072789; c=relaxed/simple;
	bh=lRAPNRrf9SXx4z9dhLk337tvdNqy6xswS6CPp6bIVE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e1nLp5Qc2pbs39qtofkeH2WkOrDVLq2JPZNlkkNzOIdm7dtET23Ile6uA1TLd+peoJq5r2lZCfkfs7c1Qpq0V2IYRkyj7+7Jt338CAFzr+FLWM1XnQyGMJ40Ls39nnRtHtMu4RbfijOL6h7LVjy8c0ieFBrU3fE2Jo2lC+uckLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=AyK54OEF; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="AyK54OEF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1783072672;
	bh=7wKH1xnMpdQTYs1GgGEhEsEEfpRsGdlMmEvMsie1aI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=AyK54OEF08ZrxaQE9bv7rQRp2XLdD9ZthtzFfsoezJ3XkyVViT0djjEhdSKDNU7W/
	 Q0xEB4d3k8K33utHxJnK17LAv5zXegrFwdA3t2cOBY/yzCpBRvZSxeNw9igCS3Phqo
	 hOgOTkK8P5f8WU2SvJwUB8VuvWNNzqBImtMqwvE0=
X-QQ-mid: esmtpsz19t1783072670t860bd952
X-QQ-Originating-IP: yQeUo0oBNZiyozxrn5J6mXe/g0vxOwLg8q2rE5Nai50=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 03 Jul 2026 17:57:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1894719642677403996
EX-QQ-RecipientCnt: 26
Message-ID: <D233CE7F52A8953C+2120e7be-66e5-4cab-9543-05591eccfd76@linux.spacemit.com>
Date: Fri, 3 Jul 2026 17:57:46 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] rvtrace: Initial implementation of driver
 framework
To: Zane Leung <liangzhen@linux.spacemit.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: anup.patel@oss.qualcomm.com, adrian.hunter@intel.com, alex@ghiti.fr,
 alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com,
 anup@brainfault.org, atish.patra@linux.dev, conor+dt@kernel.org,
 devicetree@vger.kernel.org, irogers@google.com, jolsa@kernel.org,
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mark.rutland@arm.com,
 mayuresh.chitale@oss.qualcomm.com, mchitale@gmail.com, mingo@redhat.com,
 namhyung@kernel.org, palmer@dabbelt.com, peterz@infradead.org,
 pjw@kernel.org, robh@kernel.org, sunilvl@oss.qualcomm.com
References: <20260429125135.1983498-3-anup.patel@oss.qualcomm.com>
 <BDD9553502347B02+ee3069d3-eb04-4a37-b364-107cf8d0653c@linux.spacemit.com>
 <2026070316-surgery-unneeded-bceb@gregkh>
 <138BCDE3F4A1D624+2488a822-cf77-4155-8492-b8a1c47d5589@linux.spacemit.com>
 <2026070300-submitter-humbly-833a@gregkh>
 <4A32964890BBF288+37eaa5a2-eaff-49c4-8501-2b02736f3584@linux.spacemit.com>
Content-Language: en-GB
From: Mark Zhuang <zhuangqiubin@linux.spacemit.com>
In-Reply-To: <4A32964890BBF288+37eaa5a2-eaff-49c4-8501-2b02736f3584@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: Od6jZKO+x2eu/KM2BHPrr3J6Q76bSwwbvkfaP4v6OAa8rYnImonGH2qY
	CCbubjoqh7jeQAbNVABWR3kRQAGRjLwIOvnXdV8f2wUH4Kqhi+10OJ2fAs/FIzie3fMdS/z
	J2izY9oI95PEc1XNmxlesb1u3g8G5TNqdmdCUKfVifRw9GM2tCC5n5d1YjQm6FWc3USlaW+
	dVj4aVo0TxG91MTgcLYcViyvFnOIfDwkquskvyNaXwpuxPJsND1KoRavVomd7YkCCtR+VAr
	74HjnkZOkhJCRNw0fRRvjiKB6kuV+Pxyp/fCDuUNadtNsA/35dnvLEbKtgifq5Pidr4nwS8
	2IyeBQLcGnCEqudhlwEuyDNA7yMmBzqOGSApZODq0BDc6CDzpPf9RRNpYE220t34/YVGXbL
	MPVqMVA1ySJcBGoaRqPAIOen8IP48Q4RqYEEmfHBna8HszPLyC5czNb0exYRSJBU6auP8Hu
	f5ZUFGhYMPKW24ZbznykwLDF5na5BpUNs8h/zEkqEEM5ymZNeIdWy/xbH5ImtRAlNozICON
	TfKgDYVA58ofm5HGRClVqUGAriL7AeTFL3jjEpMKs19CRCCZtHp+DBwzxtWZM+CO+apsBrW
	SW+H4U9kcf/8X9N3lB3NvFXSCvlPVSro9vZViLPVCVXY8vIvyN5wJVSOX+6Rpxq8OKBtYoX
	Um9XvOG7Qnucl1fvDUWSt4PPSObtgCEUNcLrjxSxek2883bT4z6WGjqOG7sfa10QVuSsdU9
	CbwOBd5Fg9L/BlzBhX8XVPmmvVPgAPBKIS+VQQM4T4jaSS4+V1pylhKVCyqNR9Q/aKZMqal
	+ioPwcZVqo8lRbPjh4V+rdgnbM8mj9rnyaxfNK/uXbk4XufZwOsOnzU119/+TFTaRqZScua
	bIn7Oc3jJ0G9W74gPYTHfTh8sNHvaZ2Drl1U8ek3JNGYq1+9R5Vo5lu52G8w1l4J/KtKwbw
	MsHsOLhkGkGoLD7/B87ntAKVMaLcX6YC88sD1bamqEIjEG90+OftuWYZE2ZDSeuSomCpSlq
	c/C2FIPIFTrpWOtq7Cqi6A7NxvVA0qKTmNUqR78UqHfRzrNUgrQVHDKDOkrcp+QO73OP/f5
	UN+C2bp1TimzZ5oFi12XLVxuC+/XLJ4BA==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0



On 03/07/2026 17:00, Zane Leung wrote:
> 
> On 7/3/2026 3:41 PM, Greg KH wrote:
>> On Fri, Jul 03, 2026 at 03:32:50PM +0800, Zane Leung wrote:
>>> On 7/3/2026 1:41 PM, Greg KH wrote:
>>>> On Thu, Jul 02, 2026 at 04:19:53PM +0800, Zane Leung wrote:
>>>>> Hi,
>>>>>
>>>>> Based on the current framework, I am concerned about how to support RISC-V ATB and reuse the Coresight component (ETB/tmc/TPIU) in the future.
>>>> That is very vague.  Please provide specific examples.
>>> According to the /trace control interface/ [1] spec: "The ATB Bridge allows sending RISC-V trace to Arm CoreSight
>>>
>>> infrastructure (instead of RISC-V compliant sink defined in this document) as an ATB initiator. ATB Bridge is not
>>>
>>> needed for RISC-V only systems."
>>>
>>> For ATB Bridge, read trace using Coresight components (ETB/TMC/TPIU),  so we need also ARM coresight driver in
>>> RISC-V trace systems. Current framework seems to only be applicable to RISC-V only systems, and does not support
>>> ATB and  ARM coresight use case like the K3 (K3 SoC contains RISC-V Encoder, Funnel, ATB, CoreSight Funnel, and
>>>
>>> CoreSight TMC components). For more discussion, please refer to [2].
>>>
>>>
>>> [1]: https://docs.riscv.org/reference/trace-control-interface/v1.0/tci_system_overview.html#atb-bridge
>>> [2]: https://lore.kernel.org/all/20260414034153.3272485-1-liangzhen@linux.spacemit.com/
>> So, what specifically does this mean?  Please provide review comments
>> for the code itself.
> 
> The issue I pointed out is not about specific lines of code, but about the entire Riscv trace driver registration and building a path from source ->
> sink did not take into account the application of arm_comesight. the current patch set assumes a rigid, homogeneous RISC-V-only topology.
> 
> Specifically, if we have ARM coresight components, how can we reuse them like, funnel (drivers/hwtracing/coresight/coresight-funnel.c) ,
> 
> TMC (drivers/hwtracing/coresight/coresight-funnel.c) , TPIU (drivers/hwtracing/coresight/coresight-tpiu.c) and so on based on the current
> 
> framework.
> 
> 
>>
>> We write code for stuff we have now, today.  If future needs change, we
>> change the code to handle that then.

SpacemiT K3 is a concrete, shipping example of exactly this topology: 
its RISC‑V trace encoders generate N‑Trace messages, which are then 
forwarded to Arm CoreSight components via an ATB bridge.

Documentation: [1]

Given that K3 is a commercially available RISC‑V SoC today, I believe it 
qualifies as "stuff we have now, today" rather than a hypothetical 
future case.

It would be ideal if we could reconcile this series with Zane's 
patchset[2], so that trace works on both QEMU and real hardware such as 
the K3.

The main friction point at present appears to be CoreSight compatibility.

[1]https://github.com/spacemit-com/docs-tool/blob/main/en/user_guide/trace_user_guide.md
[2]https://lore.kernel.org/all/20260414034153.3272485-1-liangzhen@linux.spacemit.com/

> 
> I believe that if the basic framework for RISC-V does not consider compatibility with ARM Coresight, once the framework is fixed, there will be greater resistance to future modifications.
> 
>> The only problem is with user/kernel apis, those need to be nailed down
>> so that they don't change.  I can't tell here if you are only referring
>> to the in-kernel stuff, or user/kernel apis, sorry.

>>
>> thanks,
>>
>> greg k-h
> 
> 
> I believe that RISC-V tracing is coresight-alike, where have encoders/funnel/sink/bridge+coresight_comp.
> I think we should abstract some of CoreSight's core logic so that it can Both coresight and rvtrace can be reused.
> General logic for building paths from source -> Sink and perf_pmu should be universal in coresight/rvtrace and
> 
> future architectures.
> 
> 
> thanks,
> 
> Zane
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

