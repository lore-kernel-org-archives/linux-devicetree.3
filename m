Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792652658;
	b=LXMpbHKNyUYT3R7dsc55CAilr39zX63udSEoovVPVyUc7RBH2VD4w3Wrs8IDhXLkaqTO
	 6DlpwRaRJIvNLPpk3+Bl4WHt+9lCwsteUxg2uk6N2rO3LB2mO5gfpC9ZEk7YwK4xxHWJh
	 G3B1WjQISLbc1sluDTFRU0mAD+B/VuRfi4Y+/unGUb8mExnikzYJhdL9lvpas+2sMe7UE
	 fmXN4L05fxfsCR0uT0YoG5pzVhWItLilUGqk7CTvZ9VOumxEECnNP9VPnmf8Lb/KhZtk2
	 C0Qh8ahVWRkxBXOH5SiCf9l2xYXhCQVSK6ti6YIKF3YALTogFl17hkwp0xtw5ChNg+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792652658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+ByBpVD7FPTufElpNoOF6mqXMOL+Kv6Ik0YaJGkEPtg=;
	b=1I6k2AdoqSSD3OngVGqtpZC8NIstoqmHhletAP01sO7+uk1KcM9n3DRRDIkOlspA1wBf
	 Mtxs7NXGgtlQnp5sv3QjwdVYXYDRnTXueIA/U5gSTKbPQ8V1QlST0gAg+wSeWY94lvTf9
	 bgjSE+/DUHhivtkdhCtJUmOSNEMw1wmw7W76hBXoqznn7Ids+Na+nJe5lMaQeLkFCiYNi
	 Ad9Rl5YEV7e+aU73Qpd2MJDp0Dm4UdbhhtoIMnx0CgVGrDRpmyiMSy9QsfyyCCsPyTDJs
	 gGuw1TZDTR3+sDztCGz7/PnJoy89u3BwWZo3JHHOSLZWMFfn4aqf09OOkDqJ3rOMSvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Zxm/tLN8";
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134CA606A31D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 07:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 134CA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zxm/tLN8
Received: by mail-pj2-f9.google.com with SMTP id d9443c01a7336-2e4a61a2ff9so5392145ad.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 00:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792652657; x=1793257457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ByBpVD7FPTufElpNoOF6mqXMOL+Kv6Ik0YaJGkEPtg=;
        b=Zxm/tLN81+bOKkRrAAinIZ02MQR4no8e9I7iKbNGyWclgLKObP0a4WR0bdm/FdJvog
         TuB0vCM9nv9iLDP3+phYlRaWzu5IJA+N5SajFJvA6+wkiRgBnBJcfWLQtEsNp4gt0dig
         n4zO4gJPLUMS6v7oIkvOp6R9OmrbJ8JDzXwdihuT9aIF+84jstfLi8HlT+VGFp6Ni+lJ
         QchktaS1IXgQzh8+o8Bg3Xp2cEn+yFm4JeBa2El+30tqTWw86sQddRxlhs7fObc9vAv2
         Rw/tWfz38L3N2yHvcJSIPmiVf5r76dEqJOgkzlOMOmnmBqoWHRpohopRV0hBZh+rcTB9
         C6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792652657; x=1793257457;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ByBpVD7FPTufElpNoOF6mqXMOL+Kv6Ik0YaJGkEPtg=;
        b=vBAXWU0+HSO1qwL1+IUt5ZhXc7nllWzIzQ0a2ZXe8M7VICjbkfpRIFnptS6nMZGtaI
         0XmJ2xRM9WicObkglFlCkn/75NpsfO017RbgfvgXLGz+uERvBCY1OjPH+gzEERfA+ass
         Xd3vwhMp09M8m4NmTyDZZ3C3TKQ9RkNLR0RpQLAiAUtNwxA4WogsutEdqETBXNVsQeVt
         iXWtHbo4wIvty4eI/ieRqpVgEyaxUF4HDDqQWG4QfmueqU3gHYraw9rtQktGfuWw8tJg
         skPoEqNhrhI+UQowhVXb2NZ+9e0ZQiVIBEetVHFG/EjX89OAyTiEu7VbX2AP6TRMUWKw
         /W0A==
X-Forwarded-Encrypted: i=1; AKwUvByfmRsOttcIO076uIgJHu1JIwgw3mdpYZcMi61asTO5k0G8CQTZtwTOFBsXpqm2xnaJwkMyLaOFgr+X@vger.kernel.org
X-Gm-Message-State: AFq9FYLVEDxj9kF0F1TVzLmGqmAFDJLxwATi3T6ZnkHVAuQuqfJOJF2/
	5EjWxL/4baYjvymh++LY0/qplbYxsL/0KsqtitqNZrNb+aHUAs7Om5DF
X-Gm-Gg: AYBFou2ZCfUPoSkH95zspIq4qe+j0urChx4eG6cqTR3xay2POky7zSokGgiMaPkvgvO
	4MTfv/6raC0VpC1oDXnoxQCoOkUjWH2xHOHaOMjPhxQi1yfIpr3xGf98zxCY2ipr7opgk8z4cJs
	MHKc+Y+xWTUoqTwIJ1tFS3nKEHr73EqZPm3BgKpptMen2D5GmPKjgRHrRp3fK2zCPpOiGupTsgh
	dnK2Nri7vGcAiWTFUyhp3h/nBNsre9rUXUWA/05ccuPHjuTpz1WcC5YWqiP7Mi/ZB/79THn5rT8
	Idf7KNc4gEa8Tr8S2XuOd+BvHzIHHvo2JsR9f+v5MZNhxl+djcWufY88YA+Wl0HCIqFXkeNYPmI
	L7J0n3rl0eEqZUbKki0QT+6boiH86hgnjAkfaZCu39hlr+jr/tCbnP1h5cmq7o9ajCyvMB7wcTo
	ZXF94/atknZ7iWRi/i0nUpa6Xh0fCdST/gf1IFFgGB4KBbPhoNeO93QXdyH5N5qdVTBLdnzY0lt
	dMTiURWu1NS2STQcj+Y46J2I8bR5ZpuSEZEBNozBC4WcwOWL+PJF1JKmGKIhXQ=
X-Received: by 2002:a17:902:e947:b0:2e9:9bac:2e84 with SMTP id d9443c01a7336-2ea43d3a8e5mr34417885ad.66.1792652657298;
        Thu, 22 Oct 2026 00:04:17 -0700 (PDT)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b43478csm19901295ad.28.2026.10.22.00.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:04:16 -0700 (PDT)
Message-ID: <95f18ef2-8fda-447e-bc64-1732febea363@gmail.com>
Date: Thu, 22 Oct 2026 15:04:02 +0800
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
Subject: Re: [PATCH v9 0/8] kdump: reduce vmcore size and capture time
To: Rob Herring <robh@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>
Cc: baoquan.he@linux.dev, m.szyprowski@samsung.com, catalin.marinas@arm.com,
 will@kernel.org, mark.rutland@arm.com, chenhuacai@kernel.org,
 kernel@xen0n.name, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 saravanak@kernel.org, akpm@linux-foundation.org, pasha.tatashin@soleen.com,
 pratyush@kernel.org, ruirui.yang@linux.dev, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org, linux-mm@kvack.org,
 iommu@lists.linux.dev
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
 <20261021132308.GB3667411-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20261021132308.GB3667411-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/21/26 21:23, Rob Herring wrote:
> On Wed, Oct 21, 2026 at 04:30:03PM +0800, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> On SoCs that carve out large firmware-owned reserved memory (GPU,
>> camera ISP, ...), kdump currently dumps those carveouts as part of
>> system RAM even though their contents are firmware state that is not
>> useful for kernel crash analysis.
>>
>> ACPI systems already filter reserved memory out of the vmcore through
>> their existing path: firmware reports those carveouts as unusable in
>> the EFI memory map, they get MEMBLOCK_NOMAP set in memblock.memory
>> (is_usable_memory(), efi-init.c), and the ELF header builder has
>> always skipped nomap regions; only DT-based systems currently fail
>> to filter these regions, which is what this series addresses.
>>
>> This series introduces a MEMBLOCK_NODUMP flag (suggested by Rob) in
>> memblock to filter reserved memory on DT-based architectures. A new
>> flag is needed because MEMBLOCK_NOMAP can only express regions without
>> a linear mapping, while MEMBLOCK_NODUMP can filter regions that are
>> linearly mapped. Reserved regions are marked MEMBLOCK_NODUMP by default
>> so kdump omits them; reusable CMA regions are different because their
>> pages are handed back to the buddy allocator and may carry crash-relevant
>> data.
> 
> There is little point in continuing to send new versions until Mike 
> agrees with MEMBLOCK_NODUMP being added. You didn't answer him on v7.

Hi Rob,

Thanks for the reminder. On v7 your reply to Mike stated exactly what
I wanted to say, after a week without further objections, so I assumed
the question was settled and went ahead with next version. That was a
mistake on my part: I should have gotten Mike's agreement on the flag
before sending a new version. I'll hold off further versions until then.



Hi Mike,

Sorry for not following up on your v7 question. The reason a new flag
is needed is described in the v9 cover letter:

    A new flag is needed because MEMBLOCK_NOMAP can only express
    regions without a linear mapping, while MEMBLOCK_NODUMP can
    filter regions that are linearly mapped.

Put differently: today, whether a region ends up in the vmcore is a
side effect of how it is mapped, mapped regions are always dumped,
nomap regions never are. Nothing can express "mapped, but not useful
in a crash dump". MEMBLOCK_NODUMP decouples the two, and DT is simply
the first user.



> 
> Also, I intend to apply this[1] before any further reserved memory 
> changes which will greatly simplify the code.

Understood, and it makes sense. It removes the two-pass reserved_mem
initialization and indeed simplify the code, I'll rebase on top of
it once it lands;


Best regards,
Wandun




> 
> Rob
> 
> [1] https://lore.kernel.org/all/20261015082315.56876-1-m.szyprowski@samsung.com/

