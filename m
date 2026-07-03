Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB8A38E12B;
	Fri,  3 Jul 2026 09:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783069282; cv=none; b=YBywZZJdFWl5+PC8z7VwWuh6/XvwFUpQ+YvnPAQDtaT8CV2M4lyXEqJryWUeHhZHEjHt42L4Ql6BqowicweJE854pGbV0APXofRZusKKjsPVcIJ2vkXrbcb3VeHaf9p2fQo99mVHHEMMGs+VyMJ4aV5xM9yEdiCgL83sObmxbPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783069282; c=relaxed/simple;
	bh=RrrmauAQf4cZMagioBXyLu9xRexizpcZ1MKEVQk0U0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rNkgyr/Va/bOLyFv23zyu1D+vEqe2VN4gUk7DxeYRUe7VuydJSwWMJVNrogX6LhJ2CLqG729FyJtRdU7WW6YB51ltxsgU+VIXpXuJwejc7sSBjzqg3ZCQobysFOfjP1Q70sTuXna9ga4e5gL/zCU/pmnT4g4v0E8wL/v2VdsLKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=rXf6EsKh; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="rXf6EsKh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1783069258;
	bh=ACCEUgrf7Rylr7BySb8msq185wHVdSwdN7rECIYWapc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=rXf6EsKhnRNRwEDTiMGCIzJnkKHBwIIBK0VEtl79Q5Nv5C95Z5duGqffJL+IZ2auV
	 WtMo4/dQqmBciVLb95kbyRVjAUNTtRi9KhqmmIP6hgeCGDtXJwH693XNF2USmyI9kk
	 F55b5VGoCAuBfnOOFDNAQK++7VTUfvQFJ5GadYCI=
X-QQ-mid: esmtpsz19t1783069256t01806f06
X-QQ-Originating-IP: n1xI3+mPy6w337/zDxtCYOgr7wkg4ok/SuMAWtj5fe4=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 03 Jul 2026 17:00:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12710147850900718341
Message-ID: <4A32964890BBF288+37eaa5a2-eaff-49c4-8501-2b02736f3584@linux.spacemit.com>
Date: Fri, 3 Jul 2026 17:00:51 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] rvtrace: Initial implementation of driver
 framework
To: Greg KH <gregkh@linuxfoundation.org>
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
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <2026070300-submitter-humbly-833a@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Mjc5Shoq7MT/4EGhXsKs4qSg404ndkgjzrqJlGv9tFS3je0PoKRUwqF6
	WhBJEk0aH+T/bKcPJ5jzK2PDUS2Xf9ZXUq65Qd2cZaJ23yFO1An1rLKOPEMct0dzwZjhAbf
	uYdfnZbr9bW2iKvKv1Pk4uO5vHjVDFgS+xaBZFP4+rVyAKhIY8u4zbaTld254ed7dTEHP8V
	KTEyX9izSLXfo5eRdXmoZE5WdbvY92P09NpDT5f7WrRLalbeoZpuK3noLX7ogXJzOBWAtXj
	WzhfoaM4vb4YxkoLto2WpRY1HsP4cIpONfK7r6PYMpFVeBosqnVZBlY0p+F61HIx7ZrWtJj
	vEgVrfGO5pNg/94E5iGvkfOf+PnY/XOYsZj0xIy5VUXQQAn33LoukgFONR8XOSxaRNoYjxK
	7OAHMDyg7gJq7SIyEDVq9FTPc5wMJDaB2zLf9SRB2lHF6LDW8JgAQRgzOPWHDSnby3zY0rK
	ZPFOCUO5yugBk/jmooST9q/W29LQdIiX28wTjZ7CJdPfLVIi9ZHMWcK9OmEJUZaiDqGlals
	9nrNfIuNrGuFTQtbD2iuP4JTB6IUlCftVqtZKtfZC8LyG4V9+eV932HwWa1LIiq57XHRgXm
	/jNZq6rE1UwVU/odEmp9vf6pMr3TZs171FNkwlUHWaybK5W/AdEwhYAFc2rhqYH1GpZ9NU9
	uU0DQUjAYDMdUrwahG+Nvrr6QGJ+RKhIBltJjR3Ee8R4Tl4oizt4um2kibja2ymoWUTBuTj
	zlEcLicTmQcLuk9Ktv78ESVXM29OqiXr72tHcGbIntZa2p6G18lmsp1jLlJJkQWGoFBf9v0
	CqPKIPwzuGz0iw+Qe/gUrslJfWwyNUppfnhRTgR9lcOGml03GHsK5a5I3bVLIUZgbWqdTH4
	bzfXYx8aw1xJxCp+kVDJkDnu6gMYswRd5P4zUfh0iOy0BOCz5N7Vzt2AsG8fN2dYlndlGWQ
	gW3xdGr1JHhRwfZd5wvll6vz69hfDFROn6dYyIHpUoYBmOKAIANI1bSPjsp6Ou4KwGRrkRl
	262ydHOO0pu/xGhGvXo7CB+QCMyTI9TwOekFE/gABx/cgrD2LPZwGp00q7qW73dKYcviqpL
	L2jnoR2jKkiuYTF473mw06SkbreR6H5sW+7bGHyRHVTVz5v4FVThx5QuWIa53pJJTHwkGXY
	FrN1neJ5U0Y5eYtYh/yUUwTtWlbtbrH2YOmoksKxh0ol3xE=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0


On 7/3/2026 3:41 PM, Greg KH wrote:
> On Fri, Jul 03, 2026 at 03:32:50PM +0800, Zane Leung wrote:
>> On 7/3/2026 1:41 PM, Greg KH wrote:
>>> On Thu, Jul 02, 2026 at 04:19:53PM +0800, Zane Leung wrote:
>>>> Hi, 
>>>>
>>>> Based on the current framework, I am concerned about how to support RISC-V ATB and reuse the Coresight component (ETB/tmc/TPIU) in the future.
>>> That is very vague.  Please provide specific examples.
>> According to the /trace control interface/ [1] spec: "The ATB Bridge allows sending RISC-V trace to Arm CoreSight 
>>
>> infrastructure (instead of RISC-V compliant sink defined in this document) as an ATB initiator. ATB Bridge is not 
>>
>> needed for RISC-V only systems."
>>
>> For ATB Bridge, read trace using Coresight components (ETB/TMC/TPIU),  so we need also ARM coresight driver in
>> RISC-V trace systems. Current framework seems to only be applicable to RISC-V only systems, and does not support
>> ATB and  ARM coresight use case like the K3 (K3 SoC contains RISC-V Encoder, Funnel, ATB, CoreSight Funnel, and 
>>
>> CoreSight TMC components). For more discussion, please refer to [2].
>>
>>
>> [1]: https://docs.riscv.org/reference/trace-control-interface/v1.0/tci_system_overview.html#atb-bridge
>> [2]: https://lore.kernel.org/all/20260414034153.3272485-1-liangzhen@linux.spacemit.com/
> So, what specifically does this mean?  Please provide review comments
> for the code itself.

The issue I pointed out is not about specific lines of code, but about the entire Riscv trace driver registration and building a path from source ->
sink did not take into account the application of arm_comesight. the current patch set assumes a rigid, homogeneous RISC-V-only topology.

Specifically, if we have ARM coresight components, how can we reuse them like, funnel (drivers/hwtracing/coresight/coresight-funnel.c) , 

TMC (drivers/hwtracing/coresight/coresight-funnel.c) , TPIU (drivers/hwtracing/coresight/coresight-tpiu.c) and so on based on the current

framework.


>
> We write code for stuff we have now, today.  If future needs change, we
> change the code to handle that then.

I believe that if the basic framework for RISC-V does not consider compatibility with ARM Coresight, once the framework is fixed, there will be greater resistance to future modifications. 

> The only problem is with user/kernel apis, those need to be nailed down
> so that they don't change.  I can't tell here if you are only referring
> to the in-kernel stuff, or user/kernel apis, sorry.
>
> thanks,
>
> greg k-h


I believe that RISC-V tracing is coresight-alike, where have encoders/funnel/sink/bridge+coresight_comp. 
I think we should abstract some of CoreSight's core logic so that it can Both coresight and rvtrace can be reused.
General logic for building paths from source -> Sink and perf_pmu should be universal in coresight/rvtrace and 

future architectures. 


thanks,

Zane

