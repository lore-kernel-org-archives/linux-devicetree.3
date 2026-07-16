Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2B92E62A9;
	Thu, 16 Jul 2026 02:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784169497; cv=none; b=BRiabWgOfO9wOWSWC9c5hFOIa1zIhsp5wDvXaUzG3gyOCE8+aT/Ld0cMSIPwgie1Zz4nIbmE+NiBgpstmKtBo/8vvCl1XmJ7uuj48PNt+jW35448gG2eS7d+bI8y2U9SX4j/ELstLIXi0AAIHChNb9SPBh5pZUmiTrYQs6iuWmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784169497; c=relaxed/simple;
	bh=TR7P+7s1hWF+zweXy9ygfEIc7YmzDEyZeOv5BFftv+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jLDWYN6efP8syB7T9R3ekWs8JhmqBsDp6BJtslR8X0DihBLMS6hBNgSVDjMpadUvGDNJabswfCfyL1HdYlqPgBpWEX3iBBRhd9iRytHlEw9QKCsn+PmnzdmubQTVPSfU3bVIe4Y5bpTwpHeox1AMzfakWV4Xhm0dfjljk16hMM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=f/iKjuPF; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="f/iKjuPF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1784169455;
	bh=h6HJYox9pjsu7D+WxxtCFI7bQevscRFctE0K2RAPCoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=f/iKjuPFEOg6ZjLtF50U4Rr4j2o4MK6eEKtwdc1W2/j51l/MlM1K+Gf0L8XFZ4tuA
	 fakIDBvTRjfAZcNMA91w1gcaWU+pZHSTrlMoLftTxnulcsxuAqi+VHpaQydqfa4oWJ
	 Az94cVVD4pMT2rzsN8RQThE5MMx+1LhKAB5UaX3w=
X-QQ-mid: esmtpsz21t1784169453t2bc251fa
X-QQ-Originating-IP: e5uKEcDJEh2J+NJ7ntGAroYkYCGrFbbh2XFgADslxmk=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 16 Jul 2026 10:37:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4361493915900171409
Message-ID: <1264B2EBE5B03819+5664aea1-9f12-4eee-8f8e-807f785435a1@linux.spacemit.com>
Date: Thu, 16 Jul 2026 10:37:27 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] rvtrace: Initial implementation of driver
 framework
To: Anup Patel <anup@brainfault.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, anup.patel@oss.qualcomm.com,
 adrian.hunter@intel.com, alex@ghiti.fr, alexander.shishkin@linux.intel.com,
 andrew.jones@oss.qualcomm.com, atish.patra@linux.dev, conor+dt@kernel.org,
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
 <CAAhSdy2sfwaBQVif_N_Gk3yMs+0kqO-_PsDTicSNZW_Pez6Lbg@mail.gmail.com>
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <CAAhSdy2sfwaBQVif_N_Gk3yMs+0kqO-_PsDTicSNZW_Pez6Lbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: ObHOzcPUfVZajYK49a4vgxNB8nqHLaVqcukrjrD/9NcXly7k9CaTL5o0
	754Mry0A/CQSK3eqBXRsvFLoqkRw8JE5Gd70EfCzpWfkwueiOZroP8aqvUTVVhl4cUSS2Wj
	hILCmHXdpMQK5lxoxVS6OTm7du9yqM9APrWecjEvX05sT9xg8LSJQC2mCCMFkvp5hxx/qf2
	sH6oC7xUtR7Xz/n0/LLbKsBrLJTvAKgypkWUJ8l/tzhCb9bW/hlrlPw7pPDEzGBO065ViOA
	5eAsMVWcd8GapnoTjWy4OfYS6LZUEsnr+52BRs/+X9w2QMJ+jbghQXfQyM/ejEunIPSc/05
	5YRnjfAEYjiMkSGARHA+an+QKhdZDaRF0InSBM/AIzdcKWr4ZIuxhbqWoovnv0HleRrsNzC
	7zG6ILLfXv5Pz/TUdUgpSVkTJmin1msIUCMorf5vKdmB7gmOl4FIkMuUUid3oCZlPwSKTu0
	BNMQQEpOuRjGHDTB7ee5YVnTBgXSrmCTohT5ArSH7Zv24ND39u837me6UMUE4ct5ZmZ/Obj
	eVXNbJ26xhz3CdbucDmIMBCJvxNr7uYYqXD6nqeEZZC25O0S+6o4R2wNbxaEItbczFgJkSN
	Qdww+rpGIJ92xOZaovbfZYEDj4DmZqigJsWIVJmyF1DBZRMFW8SRa7RTLrk44KKk6scfWMr
	ZNe9eshCV+qd49yl7oztQzNVA9JyhOFERhV4QRdp2kujcwLhb+J5Wd3inZO7VlEh0ECG/Nj
	yzoBMk+DT682UQblDegE52NZkdA8t43FCMh5G8WRwiysXLlQxndRv1skqyjCBFZmrWCzIUG
	AVsd4Xbc2Pqlxc8VGZzCczzY/gYJNTIJj5l8WwUuBtVznsM2KpWGqFRyEsKwpDprzn8wdA5
	+sy0ThiAJ851BtpFukzkhx79PFufWV9bThHpKs2NYxhLwewOEWgpLdkLbRTTDfePqELNF0M
	lLwuWRlnLYQeZWdWMK+IJpYeqLGKtiFYDOFKGlaf6FnCF8Qt5EHCZFitgwTmI6rGf/YoKe3
	BsH3XGkzwaS+/HbzBjuIjCemaBviOR7+Pfq3+Ghw==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0


On 7/3/2026 8:01 PM, Anup Patel wrote:
> On Fri, Jul 3, 2026 at 2:31 PM Zane Leung <liangzhen@linux.spacemit.com> wrote:
>>
>> On 7/3/2026 3:41 PM, Greg KH wrote:
>>> On Fri, Jul 03, 2026 at 03:32:50PM +0800, Zane Leung wrote:
>>>> On 7/3/2026 1:41 PM, Greg KH wrote:
>>>>> On Thu, Jul 02, 2026 at 04:19:53PM +0800, Zane Leung wrote:
>>>>>> Hi,
>>>>>>
>>>>>> Based on the current framework, I am concerned about how to support RISC-V ATB and reuse the Coresight component (ETB/tmc/TPIU) in the future.
>>>>> That is very vague.  Please provide specific examples.
>>>> According to the /trace control interface/ [1] spec: "The ATB Bridge allows sending RISC-V trace to Arm CoreSight
>>>>
>>>> infrastructure (instead of RISC-V compliant sink defined in this document) as an ATB initiator. ATB Bridge is not
>>>>
>>>> needed for RISC-V only systems."
>>>>
>>>> For ATB Bridge, read trace using Coresight components (ETB/TMC/TPIU),  so we need also ARM coresight driver in
>>>> RISC-V trace systems. Current framework seems to only be applicable to RISC-V only systems, and does not support
>>>> ATB and  ARM coresight use case like the K3 (K3 SoC contains RISC-V Encoder, Funnel, ATB, CoreSight Funnel, and
>>>>
>>>> CoreSight TMC components). For more discussion, please refer to [2].
>>>>
>>>>
>>>> [1]: https://docs.riscv.org/reference/trace-control-interface/v1.0/tci_system_overview.html#atb-bridge
>>>> [2]: https://lore.kernel.org/all/20260414034153.3272485-1-liangzhen@linux.spacemit.com/
>>> So, what specifically does this mean?  Please provide review comments
>>> for the code itself.
>> The issue I pointed out is not about specific lines of code, but about the entire Riscv trace driver registration and building a path from source ->
>> sink did not take into account the application of arm_comesight. the current patch set assumes a rigid, homogeneous RISC-V-only topology.
>>
>> Specifically, if we have ARM coresight components, how can we reuse them like, funnel (drivers/hwtracing/coresight/coresight-funnel.c) ,
>>
>> TMC (drivers/hwtracing/coresight/coresight-funnel.c) , TPIU (drivers/hwtracing/coresight/coresight-tpiu.c) and so on based on the current
>>
>> framework.
>>
>>
>>> We write code for stuff we have now, today.  If future needs change, we
>>> change the code to handle that then.
>> I believe that if the basic framework for RISC-V does not consider compatibility with ARM Coresight, once the framework is fixed, there will be greater resistance to future modifications.
>>
>>> The only problem is with user/kernel apis, those need to be nailed down
>>> so that they don't change.  I can't tell here if you are only referring
>>> to the in-kernel stuff, or user/kernel apis, sorry.
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>> I believe that RISC-V tracing is coresight-alike, where have encoders/funnel/sink/bridge+coresight_comp.
> I think you are over simplifying the comparison. At high-level only
> the topology of components is similar between RISC-V and ARM but the
> individual components have greater architecture influnce. In fact, we
> upcoming RISC-V self-hosted trace under development where both encoder
> and ramsink are programmed via CPU CSRs.
>
> The only thing which can be shared is a common trace framework (which
> is very small part of this series) but the component drivers, driver
> probing, perf driver etc will be highly architecture specific.
>
>> I think we should abstract some of CoreSight's core logic so that it can Both coresight and rvtrace can be reused.
>> General logic for building paths from source -> Sink and perf_pmu should be universal in coresight/rvtrace and
> My suggestion is to take current rvtrace framework (which is minimal
> enough) and create a simple "gtrace" framework (aka generic trace
> driver framework) which can be enabled by multiple architectures. The
> RISC-V trace drivers can be the first ones to adopt this "gtrace"
> framework. As separate series, the ARM coresight component drivers
> gradually updated to support "gtrace" framework. This way only
> required stuff will be shared will be brought under the common
> "gtrace" framework.
>
> I will update this series as-per above suggestion if there is no objection.
>
> Regards,
> Anup

I generally agree with this approach. Once this series is updated, I will try to update
the ARM CoreSight component drivers to support the "gtrace" framework, based on 
the K3 platform.

Best regards,
Zane


