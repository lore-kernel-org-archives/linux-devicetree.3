Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EB22472AE
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 02:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790302544; cv=none; b=RE++h/WiYNDu2jSK2805VGO2lnvUioSILxjD5b68xYCA2LaZU4caMBBJD+kxLVr4eh2IOqrOJjQEKjB86+jZbjA1YWhs7rmBRO30gs1ZgwG6DE4HEdPMrB9/+0sbJPeB4QrtJtaLTg9rkKHhODPIYxGoNiXwiUCgWmEyHoYG8kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790302544; c=relaxed/simple;
	bh=VgMW57RZXFMRplMPDkt4YtM8EkWBpLPXc4KI0WuDdx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r8KUxf85end+9pRIiKRa3sAZYpU7WPhwmmqivb012KJaGcFNdt34KImlaDzNYwe0WdyL/x124JH3TPaN2A4UoNdROra30SyZWOz+WTNeIZl1KIGk5c9tyiY7RoWvzjpGYhmfku6WAreAC/iafs/x7fvsCkUwcgn51bQL6gruR6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=cmErwvOF; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="cmErwvOF"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530e28a62abso6914921cf.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 19:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790302541; x=1790907341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+htwMlyXVmeIg6mLkEPL+JS0CurEY9XR8VLPuog5Nk=;
        b=cmErwvOFMCdz2hi9aonzBXGjBGvC23thkU4XAWE/220wIUYvVx7RKHGbZveyj7/tQp
         BlitcD90TZ8KEt/JMbxbidbXElWXdzZIyYgefPmVJ/AWxYIz/wrOZhuubTHTf36i0TmK
         oGzvw9yiJB+tQ+nie5wGeGEXkbSidtHNzDo6pRp003ANKHjVz+zjKeGmlCFuyen7Jf14
         Pp+nx5vcnHEh+USjChIXOtfRCy9DH2atMw2lkWgyBAe6gUZvrc5F5h05kInSwwn/NO03
         86nz91XoeT94GY0agI+txMMnyU7ustudn7ZEgXhBkAumFCZjCnmuDO6/i9nHE/iW3kNG
         Pq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790302541; x=1790907341;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j+htwMlyXVmeIg6mLkEPL+JS0CurEY9XR8VLPuog5Nk=;
        b=Yz6xzHYl/M/l69JmPEtxJDXvaMBCk/uVMI45+Xcq/ULlZjJKZh7LGCzmhG7SNJuZsq
         k13CSPt4Jz2gNwMsVR2pgbwa0Nys2e5dwpgvuJQSZ0BZI5g5bvM0+d3nRlE3D449ok6V
         gdsXizeSstu6e/qXfXavsmt+P2QO6bUGZr9ekRYBeeAJipEzzyaLscdhBnsPZDm+IGmu
         yaJxAL1ovqJ9z+kRGLLPfKQVLhH1UA29mUR1FT//wBhb2JKdRmeKecgvWaELAeX3DuGx
         sRzZTwclJ87ZNQ43V4rhr6j1N9ydDG0D9oVwedbrW9Mp50gqNLvhFIR5DB4rkxbvncbd
         ps9g==
X-Forwarded-Encrypted: i=1; AKwUvBz8MkhTXNq/wFWyjdFrtM9kXi8tioWc4Y2TMfmO9JqAURPMDzVic0Xt3t0Or848jwt1sPoAQBDsUvM6@vger.kernel.org
X-Gm-Message-State: AFuF++mI9m1ZFhQna4/80IX6K4tTzKYzeURaCKWt9NMtbHc1D86cHL2i
	KxDeff7/Pd7aluZLqNT+LPGTGxQnfW/dMBCLdsxaggz9cOZNzLEv1oJEEuXhXrItK5k=
X-Gm-Gg: AYBFou3gfj+KeSHabEzyHA1KjZwUWsamdGa1h6fEsyH2f/PCkFKlAvO4b9IAfzuIOlI
	Nt3tMHdc5PjJd25DQFb5oQCWssm0sbM7ZjUEdUtHNK9fFDEJXDgUn3S4MZoNaXaXICty8RDK+PX
	Fh8fTsEkvq1hCMqjA3dMwhszq4g7I3g07zNXNeZFEO/k7Q6bWLSBE9hI9q566dFYqBR5kGBLaq+
	tNOyBkDxPIpfr6ZUHjKrc4KBU5xMbhjyhykjN+Wp0adb0bPAcf8gl2aim6y4A4QkoOZODLgZIgV
	cbgl793Bf0Nte4GvSUR/h8wr+wF06zDEroDUSVZflN0fcnpTHUfQrpbHDGAOMod3tdHmve35KCZ
	aOVVC8+xj8UH41cEDrOPSdjdIaseTuCM2U8LvXA3SbaymRdeVxMOUrZ2uGoQMVpfFq8EUEUzA7W
	SkCrkbdA19R06qn+w/bNCY6PtyUrVRe2ORsHddYglxmnT/hAZQN9ipTybh/ZmPFu6pn06DM/BCD
	ZWR+8Bbkg==
X-Received: by 2002:a05:622a:1aa5:b0:530:dc0c:abc5 with SMTP id d75a77b69052e-5330dd22227mr14610891cf.43.1790302540784;
        Thu, 24 Sep 2026 19:15:40 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5330beed0easm6143641cf.11.2026.09.24.19.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 19:15:40 -0700 (PDT)
Message-ID: <45f41257-45f7-4940-a8af-d12e3669bc7f@riscstar.com>
Date: Thu, 24 Sep 2026 21:15:38 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] misc: tc9564: introduce base PCI driver
To: Herve Codina <herve.codina@bootlin.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 bhelgaas@google.com, andersson@kernel.org, konradybcio@kernel.org,
 abelvesa@kernel.org, daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrea della Porta <andrea.porta@suse.com>,
 Lizhi Hou <lizhi.hou@amd.com>
References: <20260918173003.GA1166280@bhelgaas>
 <e9bd7954-1cec-4ffb-a5b2-2389469b0c05@riscstar.com>
 <20260924175603.2a20e2b1@bootlin.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260924175603.2a20e2b1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/24/26 10:56 AM, Herve Codina wrote:
> Hi Alex, Bjorn,
> 
> On Fri, 18 Sep 2026 12:49:53 -0500
> Alex Elder <elder@riscstar.com> wrote:
> 
>> On 9/18/26 12:30 PM, Bjorn Helgaas wrote:
>>> [+cc Andrea, Herve, Lizhi for of_pci_make_dev_node() quirks]
>>>
>>> On Fri, Sep 18, 2026 at 10:26:57AM -0500, Alex Elder wrote:
>>>> The Toshiba TC9564 is small and highly-specialized SoC that implements
>>>> a PCIe switch as well as an Ethernet AVB/TSN bridge.  In addition to
>>>> these, the SoC implements other functions, including a reset and clock
>>>> controller, an address translation unit, and a few other devices.  PCIe
>>>> BARs provide access to registers that manage these IP blocks, and the
>>>> SoC is modeled using a PCI endpoint bus in devicetree.  This allows the
>>>> IP blocks to be bound to platform drivers that do MMIO via the PCI BARs.
>>>>
>>>> Create a new PCI driver under drivers/misc that binds with the embedded
>>>> PCI endpoint functions within the TC9564 SoC.  Because these functions
>>>> will use devicetree pci-ep-bus to provide access to other IP blocks
>>>> within the TC9564 chip, the main purpose of this driver is to do basic
>>>> PCI initialization, then call of_platform_default_populate() to scan for
>>>> the any endpoint bus children, and probe all devices defined therein.
>>>>
>>>> Because we're using pci-ep-bus, we need to use the PCI quirks mechanism
>>>> to have of_pci_make_dev_node() be called for each endpoint device in
>>>> pci_bus_add_device() (via pci_fixup_device(pci_fixup_final, dev)).
>>>>
>>>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>>>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>>
>>> Acked-by: Bjorn Helgaas <bhelgaas@google.com>	# quirks.c
>>>
>>> Not an issue for this patch, but I'm not sure the quirk mechanism is
>>> the best mechanism for doing this.  It's not working around a device
>>> defect like most quirks do.
>>
>> I pretty much agree with you.  I think I mentioned this before
>> (though it might have been in a private conversation) that it
>> is an intentional act to call of_pci_make_dev_node() for an
>> endpoint (and not just a bridge).  And that's different from
>> a hardware quirk.  You only need to do it if there's a pci-ep-bus
>> sub-node on the endpoint.  (I'd have to verify this on the other
>> users of this approach to be 100% sure though.)
> 
> I agree, a quirk is not the best way to trig the of_pci_make_dev_node()
> call. An allow-list seems better.

We're talking about calling of_pci_make_dev_node() on
non-bridge nodes in pci_bus_add_device().

A separate series I've been posting is updating that code path
so it updates the ranges property even for (endpoint) nodes
that have a non-null devicetree node pointer.  I use the same
quirk to cause this to occur.  But now I realize the quirk
might be intended to create a *new* node, so I may have to
re-think it a bit.
   https://lore.kernel.org/lkml/20260924222444.1351466-1-elder@riscstar.com/


Are there any cases other than a PCI endpoint having a pci-ep-bus
sub-node where of_pci_make_dev_node() needs to be called on an
endpoint?

Could we simply call of_pci_make_dev_node() unconditionally in
pci_bus_add_device(), and have of_pci_make_dev_node() only
proceed for endpoints that have such a child node?

(I haven't chased down all of the PCI quirks that call
of_pci_make_dev_node() yet.  Do the XILINX examples use
pci-ep-bus?)

> Alex, on LAN966x, the pci-ep-bus is not present. The OF node must be
> created (call to of_pci_make_dev_node()) and the lan966x_pci driver
> will apply an overlay on this OF node created at run-time.
Understood.  But the overlay does contain it.

After applying the overlay, the driver parses the node
(using of_platform_default_populate()).  And because of
the PCI quirk, of_pci_make_dev_node() gets called for the
PCI endpoint, right?


So again, is calling of_pci_make_dev_node() on a PCI endpoint
*only* related to the endpoint having a pci-ep-bus sub-node?
When else does a PCI endpoint need a devicetree node?

					-Alex
> The pci-ep-bus is described in the OF overlay [1].
> 
> [1] https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/misc/lan966x_pci.dtso#L50
> 
> Best regards,
> Hervé

