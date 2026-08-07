Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8250B3C1D7B
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 07:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088525; cv=none; b=fRpQNgIcbLjGZupyJxdrk96vmSf1PPWx1fPrBDd4TalylqwrsDwOtclEHpxZnJ0X3bNXwQC8989DuatEE7WVscmT/QAk49/7tbqcKblGMig9wVS+DkjLsG0I4WM9/pYVAFYRkjVgorHmcGEs+3EEdM3vXHpz32QQCDdIUCKNpY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088525; c=relaxed/simple;
	bh=+XuJAb0+eJRYNbT8f4IondqjkSR2GcP9Tc67eY7pEvQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=H3tnFkltpITrT0qgbsaWpASac4PhT6v27Octn+Ev4XezdBb9B4olzIzdEbgxOIe8EBbPymfenjot7XHRhaDbddn1eG9PJSINaYeoewJOC0g3kX4PpJ7Fvc3EHTA/a7KV6ZM4f3YkptSEwnb+ul8O3sHjmFSqntKpkcmdWWsDFg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=none smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b=AfeNnx26; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b="AfeNnx26"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so32362785e9.2
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 00:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088522; x=1786693322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vE88xC9qkqtMD4KoFRH8UYH0K1SgGXydZFsBBt1JieY=;
        b=AfeNnx26hSXwlG2LNgc0HdpfoigjRVvGOWEUvJNkbP8oW2rdv8OcD8VnX3Ism4o8xP
         gHP9IWjvt03RuCNjHJsyeZHtGM+unFmaCx3P7volHBdA3ZNXU/zoNorGTnJ+TV0EbUf/
         a6kN8ToaFNtPfgJLa0eL5pQQ1XYv8hqMNPpRjUgz2N0EB0ZTj6eTfM6ApWn4MgEMfd2n
         pqsRdgFaDVobsCglNnXqyn08vi17cUpddM1dN7pcvhu6YIShj84PInqAi6TPBbqivUM+
         R9x8PP++MRJqz2T23+GB7P9DyZ1NwZO2pVu8bDluRwqdXznNh/OZmR3hBGxPNEQqu+F3
         pZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088522; x=1786693322;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vE88xC9qkqtMD4KoFRH8UYH0K1SgGXydZFsBBt1JieY=;
        b=bON5icPB8RshOTcJEha3TZCKDGr1z5Md1EkrBlZAKXlHirDxmI50LUADrS1jhn6F06
         PdQjyNIDqkbVek5uDXzM8YYvsBQdT2JLA5+JjveemNpVZ5KkaZOS8oGCJzsCtFOlxrtp
         NrZ4VtV6Y24KUN0JNVA/Xjb/1+reMthyXnOjNry427VW1NayXDdPX/rvZQzko16jLGvD
         X79mkdXyQeOv3miOD3c6au022iepOywz10nLURMk8FNzj9ZmK38YeqK0dwRRUMCJyAax
         dXp0ULcaSVEVPC8ZW56SzMTQd4mfIDpEUtssDsDelU4aHGS0JY0AD09/wad0bD4fw8/n
         zI3Q==
X-Forwarded-Encrypted: i=1; AHgh+RrjDmfoympUiRT+IOk4t96lFDPbnZaBECU0m4KfZr+X40uKxjCoPnSdCpoRMgis3ZCGnsOupAQ9gWbu@vger.kernel.org
X-Gm-Message-State: AOJu0YyhQvapPFXUSgiy0nOxmAvXr4twwzdb2WNxthCcxpTO3U2DWq5q
	v46r4rg5JFNNgNnXonNg87TYciOM4LVHRv7sNwW3EYaYOptdzpRnamFSQQD2Usy9yOPd
X-Gm-Gg: AR+sD10OSFwz2txRzHTFXxYWljMm9+iTgrJjQEvgGI1/+l7x0bT7k/Q5wjK1X2uPzr1
	5cqg0+Z776NaDBzg51+53okjbYgfVa1sOKQ8QPI6hzkmmuPVqAyi33L+SF5Myw9uKDiytoX01Z8
	FbZR0Rej7HfTHWy1MVUfdeISutJfjG2o6j+/uo9+hd/FmeLzTgxV3Piu/QYrb5gNA21V2aHPJN1
	k17u85tRZZXxpiNbfKoj9L8ukinFm/qO1WNIrdKEJaQ46F3rF4gOj9C9j/f360fqN8NFmvrceVh
	d/XlCA+IzaLpq3XisNZ/OW9dMJfwO5QFq6XCdqCYgJXhJOGyhqQ19s0G3Ms+wNHKLzO2xRNOIV1
	8h8g0OpcaHg5sLK3pPjjRtZO/hXZgtGhKR0hUn9hP8FPGuuGHKV7vyfh2dyX9n75RqrOm21xSUz
	2KTHNW9oNkVPcMtYObHJ6LfweKXWc+KlT+qkXZu1fvjtf0RymScPVG/+YBuE2VE8DW3BIO0bnZY
	fX6NWP22FjAJ3qElqrrRgtOwTUJh+aYgeVthFHJvWOvPg==
X-Received: by 2002:a05:600c:22ca:b0:498:ee7:e40a with SMTP id 5b1f17b1804b1-4994e7d2c19mr225748665e9.16.1786088521733;
        Fri, 07 Aug 2026 00:42:01 -0700 (PDT)
Received: from ?IPV6:2001:8a0:f59c:a900:2600:fba1:8d1e:1692? ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9e702dsm20226525e9.3.2026.08.07.00.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:42:00 -0700 (PDT)
Message-ID: <a42446a5-ec45-4323-b35c-34d882b86a74@osyx.tech>
Date: Fri, 7 Aug 2026 08:41:59 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>
Subject: Re: [PATCH 1/6] dt-bindings: Add Bao IPC shared memory driver binding
To: Krzysztof Kozlowski <krzk@kernel.org>, joaopeixoto@osyx.tech,
 linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bagasdotme@gmail.com, catalin.marinas@arm.com, conor+dt@kernel.org,
 corbet@lwn.net, dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
 devicetree@vger.kernel.org, dev@kael-k.io, gregkh@linuxfoundation.org,
 haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech,
 kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-2-joaopeixoto@osyx.tech>
 <8a1a9ebf-a3ed-4077-aa07-48cc98e071f9@kernel.org>
Content-Language: en-US
In-Reply-To: <8a1a9ebf-a3ed-4077-aa07-48cc98e071f9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/7/26 16:46, Krzysztof Kozlowski wrote:
> On 07/01/2026 17:28,joaopeixoto@osyx.tech wrote:
>> From: João Peixoto<joaopeixoto@osyx.tech>
>>
>> This patch introduces a device tree binding for the Bao IPC Shared Memory
>> device, which enables communication between Bao hypervisor guests through
>> dedicated shared-memory regions.
>>
>> Signed-off-by: João Peixoto<joaopeixoto@osyx.tech>
> Respond to feedback instead of ignoring it. I don't see any changelog
> either.
>
> Last posting was LLM junk so I will not spend much time on this.

Apologies. v2 was sent without a changelog and, worse, threaded onto the v1
thread. Both are fixed: v3 is its own thread with a changelog in the cover
letter and under each patch's --- line. I have also gone back through every
comment from v1 and v2 and addressed them one by one; each is answered in
this thread and summarised in the cover letter.

> A nit, subject: drop second/last, redundant "binding". The "dt-bindings"
> prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
Done. The subject is now "dt-bindings: bao: add IPC shared-memory device".

> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets. See also:
> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830
>
Understood, sorry. v3 is a fresh thread, not a reply to the previous 
version.

>> ---
>>   .../devicetree/bindings/bao/bao,ipcshmem.yaml | 82 +++++++++++++++++++
>>   .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>>   2 files changed, 84 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml b/Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml
>> new file mode 100644
>> index 000000000000..fa91800db99a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml
>> @@ -0,0 +1,82 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id:http://devicetree.org/schemas/bao/bao,ipcshmem.yaml#
>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Bao IPC Shared Memory Device
> Nothing here is suitable for bindings, really. Simplified node for
> establishing channel of communication to hypervisor would be allowed.
> But multiple devices for that? No point. Develop proper interface with
> your hypervisor for all this.
>
>> +
>> +maintainers:
>> +  - José Martins<jose@osyx.tech>
>> +  - David Cerdeira<davidmcerdeira@osyx.tech>
>> +  - João Peixoto<joaopeixoto@osyx.tech>
>> +
>> +description: |
>> +  Shared memory based communication device for Bao hypervisor guests.
>> +
>> +  The device describes a set of shared-memory regions used for
>> +  communication between Bao guests. Each guest instantiating this
>> +  device uses one region for reading data produced by a peer guest
>> +  and another region for writing data consumed by that peer.
>> +
>> +properties:
>> +  compatible:
>> +    const: bao,ipcshmem
>> +
>> +  reg:
>> +    description:
>> +      Shared memory region used for IPC.
>> +    minItems: 2
>> +    maxItems: 2
> Look at other bindings.
>
>> +
>> +  read-channel:
>> +    description: |
>> +      Shared-memory sub-region that this guest reads from.
>> +
>> +      This region is written by the peer Bao guest and read by the
>> +      guest instantiating this device.
>> +
>> +      Consists of two cells:
>> +        - offset into the shared-memory region defined by `reg`
>> +        - size in bytes
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 2
>> +    maxItems: 2
> Drop property, reg defines it.
>
>> +
>> +  write-channel:
> Drop property, reg defines it.
>
>
>> +    description: |
>> +      Shared-memory sub-region that this guest writes to.
>> +
>> +      This region is written by the guest instantiating this device and
>> +      read by the peer Bao guest.
>> +
>> +      Consists of two cells:
>> +        - offset into the shared-memory region defined by `reg`
>> +        - size in bytes
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 2
>> +    maxItems: 2
Reworked exactly as you suggested. The two channels are now described by reg
itself instead of by separate offset/size properties:

   reg = <0xf0000000 0x2000>,   /* region this guest reads from  */
         <0xf0002000 0x2000>;   /* region this guest writes to  */
   reg-names = "read", "write";

read-channel and write-channel are gone; the driver derives both regions 
from
reg/reg-names.
>> +
>> +  id:
>> +    description:
>> +      Driver instance ID.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
> NAK, not allowed. Read writing bindings.
The bare "id" is dropped. The one value the driver still needs is the
hypervisor-assigned channel number it passes to the notify hypercall - that
is part of the guest<->hypervisor ABI, not a Linux instance number. It 
is now
a vendor property, "bao,id", documented as "must match the identifier
configured for the channel in the hypervisor". If you would prefer this
expressed differently (e.g. derived from an alias), I am happy to change it,
please let me know.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - read-channel
>> +  - write-channel
>> +  - id
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    bao-ipc@f0000000 {
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> If you cannot find a name matching your device, please check in kernel
> sources for similar cases or you can grow the spec (via pull request to
> DT spec repo).
The example node is now generic: "shmem@f0000000".

>> +        compatible = "bao,ipcshmem";
>> +        reg = <0x0 0xf0000000 0x0 0x00010000>;
>> +        read-channel = <0x0 0x2000>;
>> +        write-channel = <0x2000 0x2000>;
>> +        id = <0>;
>> +    };
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> index c7591b2aec2a..c047fbd6b91a 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> @@ -223,6 +223,8 @@ patternProperties:
>>       description: Shenzhen AZW Technology Co., Ltd.
>>     "^baikal,.*":
>>       description: BAIKAL ELECTRONICS, JSC
>> +  "^bao,.*":
>> +    description: Bao Hypervisor
> Vendor prefixes are for companies. What is the company here? What is
> stock ticker or website?
>
>
>>     "^bananapi,.*":
>>       description: BIPAI KEJI LIMITED
>>     "^beacon,.*":
"bao" is the Bao Project, an open-source static-partitioning hypervisor
(https://github.com/bao-project), not a single company - analogous to the
existing "qemu" and "virtio" prefixes, which likewise name a software
interface rather than a vendor. I have updated the vendor-prefixes entry
accordingly. If you would rather namespace this under the maintaining 
company
(https://www.osyx.tech/) instead of the project, say the word and I will 
switch it.
> Best regards,
> Krzysztof
