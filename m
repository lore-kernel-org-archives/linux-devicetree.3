Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338E02E974D
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 15:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785596512; cv=none; b=UJq30+ZLGvQfOpf1udD0/eNlNFFeP15JbdOsUMukF2NQhB0wPqNes1SaxIkkS+RjJieH9qw78yE1BnzEMvQzG4XhUYbS0pXmAiGdv7yg5S6L8pN2TZNnDB7yV/vPXzlHrS7VaD9PLy0oriV8GUs+soyVra5iC5Z5s3cqSum45PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785596512; c=relaxed/simple;
	bh=63CxcD/+g9jKdzcdGWagKK1BYmG1RRRcdAG13rWcZ1g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=e6PLztBE6ocHpnyq/y1lT6AslQFIb3TigXjIl873GtWmQzmofRhHzw1v5dZ/3qaN0SRgdC2zj8FIj6sgTEDN3u+K5A1N5pZpPJU9gkJx9itlqobpyudYc6UngmwWVYoCzwJ02SlXIuiTfjwZCxvy4x0aVI8jP4XCZGQMVmZCCXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b=JgqICPnp; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b="JgqICPnp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1785596458;
	bh=GlHa8qPjAynYqkFOQRk+Tdsy9wM6D184HzODq1buprc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=JgqICPnpJ3GLgSteLnwESfbGx8Z9bA6VDfH5s1HXZclYI/xGhy8FEmBYT12jr2srg
	 8H0m3033gpYV1SxOF4oZhO0x/vx+cku+OxgAD7A4mwBhmBj046P6uVqfFwP1iEEA53
	 8K4B8Osa/SkWufnlq3OvWOtxt/NVlqecjG7tyEwmxCJ/yLEl4yURq89VhMo8VQgFIb
	 jc6alSjewjKkP1JFKyGKr0K4zJfxHDtDUi117ldxaaJmerYkz1M/ILpI9iexZCErcw
	 kXXSWuYoL0RXGPno+ptlgscXuzHTqKjpEQexqvZjjLbwCXVbaWp6pJuDvRRszgkelp
	 uRq7nNQrXDzUg==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 849AFB221A9D;
	Sat,  1 Aug 2026 17:00:56 +0200 (CEST)
Message-ID: <22cf4573-e894-401a-9023-0505c283d0af@freeshell.de>
Date: Sat, 1 Aug 2026 08:00:47 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: E Shattow <e@freeshell.de>
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot
 from SD-card.
To: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, Ilya Sorochan <k0tran@altlinux.org>,
 Conor Dooley <mail@conchuod.ie>, Emil Renner Berthing <kernel@esmil.dk>,
 linux-riscv@lists.infradead.org, heinrich.schuchardt@canonical.com,
 hal.feng@starfivetech.com
References: <20260306171939.84568-1-k0tran@altlinux.org>
 <178526175795.1708098.11834005845749245101.b4-ty@conchuod.ie>
 <a32646aa-446a-4f95-9293-40001aeedae5@freeshell.de>
 <20260729-electable-remake-1b8c94a452b7@spud>
 <b1f10fad-e5ad-40a6-b37b-6e950736c1d2@freeshell.de>
 <20260730-rockslide-depict-5edb03f8efc1@spud>
Content-Language: en-US
In-Reply-To: <20260730-rockslide-depict-5edb03f8efc1@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 7/30/26 10:31, Conor Dooley wrote:
> On Wed, Jul 29, 2026 at 02:07:07PM -0700, E Shattow wrote:
>>
>> On 7/29/26 03:59, Conor Dooley wrote:
>>> On Wed, Jul 29, 2026 at 02:39:50AM -0700, E Shattow wrote:
>>>>
>>>>
>>>> On 7/28/26 11:02, Conor Dooley wrote:
>>>>> From: Conor Dooley <mail@conchuod.ie>
>>>>>
>>>>> On Fri, 06 Mar 2026 20:19:39 +0300, Ilya Sorochan wrote:
>>>>>> Add bootph-pre-ram to mmc1_pins clk-pins.
>>>>>>
>>>>>> U-Boot pruned their overrides recently in favor of Linux which broke booting
>>>>>> from sd-card for me and Heinrich Schuchardt [1]. Pruning commit:
>>>>>> 27f617019dd070cb61f2 ("riscv: dts: starfive: prune redundant jh7110-common overrides")
>>>>>>
>>>>>> [1]  https://lore.kernel.org/all/ffdfc550-559b-4c59-9873-3f040fc3bb0e@canonical.com/
>>>>>>
>>>>>> [...]
>>>>>
>>>>> Right, I am going to try this again. I don't think there's actually a
>>>>> valid technical argument against it, since it just affects the stage at
>>>>> which configuration is applied rather than configuration itself.
>>>>> If the configuration is wrong, and more devices don't use this configuration
>>>>> than do, people need to move the node to where they think should be. That
>>>>> shall be done separately.
>>>>>
>>>>> I don't want to hear about the politics about whether or not Starfive want
>>>>> to support it or reverse engineering of binaries etc. All that I care about
>>>>> is discussion of the hardware itself and which boards need this and which do
>>>>> not.
>>>>>
>>>>> Applied to riscv-dt-fixes, thanks!
>>>>>
>>>>> [1/1] riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-card.
>>>>>       https://git.kernel.org/conor/c/42c57c049054
>>>>>
>>>>> Thanks,
>>>>> Conor.
>>>>
>>>> Second NAK to this being applied, again, do not apply as-is.
>>>>
>>>> As you're not interested in the technical discussion, then you won't
>>>> have one.
>>>
>>> I am interested in technical discussion of the hardware configuration. I'm
>>> not interested in reverse engineering of binaries, GPL compliance or
>>> whether Starfive want this to work or not because I don't see how they
>>> relate to the correctness of the hardware description.
>>
>> The commit message suggesting "...broke booting from sd-card..." is
>> missing information or should be clearer i.e. "The bootph-pre-ram
>> hint(s) allow that following the SD Boot mode of StarFive loader in
>> MaskROM the U-Boot SPL will have all necessary devicetree nodes to
>> initialize the MMC driver and continue booting U-Boot Main from SD
>> card". It has not to do with booting Linux from SD card, and is for want
>> of a more generalized description affecting any SPL that filters on the
>> patterns of bootph-* hints but U-Boot seems to be one-of-one the only
>> consumer of this that I am aware of.
>>
>> Placement of this bootph-pre-ram hint in jh7110-common is (probably?)
>> not appropriate, as SD Card is not valid on all boards or even at that
>> mmc device, namely StarFive VisionFive 2 Lite eMMC, Milk-V Mars CM, and
>> requires testing to know if it breaks existing functionality on boards
>> with swapped arrangement of mmc0 and mmc1 with respect to SDIO module
>> and eMMC (i.e. OrangePi RV ? It has been awhile I may misremember this).
> 
> This kinda comes back to the point I was making about it not changing the
> configuration, just the point at which the configuration is applied. All
> boards get this configuration eventually, it just seems to be that this
> particular boot method needs it earlier?
> 
> I'm not sure that applying it earlier would break any boards (although
> of course it could), I'd be more likely to think that having the
> configuration at all is probably harmful in the cases where it is
> harmful.

Indeed the "workaround" I've suggested off-list for JH-7110 U-Boot
builds where deprecated StarFive loader functionality is required has
been to one-liner patch out the U-Boot build system filtering of
devicetree for SPL build. There is excess SRAM capacity on JH-7110 SoC
and it is not any problem of code size. There cannot be any complaint
about missing nodes if none are missing.

> 
> The other thing I don't really get is why the clk-pins node is needed at
> the pre-ram stage but not the mmc-pins node. Surely both are needed? I
> suppose it may be the case that the latter matches the default
> configuration for the pins but not the former? If that's the case, the
> node mmc-pins should get the property too IMO. I've added Hal into the
> thread, maybe he can clear stuff up somewhat in that regard.

More the reason to regard all StarFive loader affected configuration
related nodes as likely that the SPL would need any of them at that
phase. If you're expert enough to know to just hit specific clocks and
GPIO and controller IP configuration without knowledge of the StarFive
loader then I of course accept that determination on whether this is
achieving the stated purpose of the patch to leverage the StarFive
loader "SD boot" method and U-Boot SPL loading U-Boot Main payload and
then from there Linux-as-usual. I do not have that expertise so the
generalized approach is add filtering hints for anything StarFive loader.

> 
>> The functionality of adding this hint is not even possible for more than
>> half the boards, and no new boards will have it.
> 
> Ignoring the rest of this for now, these are the supported boards and
> inferring sd from cd-gpios:
> 
> jh7110-deepcomputing-fml13v01.dts
> 
> Looks like sd on 1

Yes, board reference photos show the multi-select DIP switch. No
schematic available (NDA restricted).

> 
> jh7110-milkv-marscm-emmc.dts
> jh7110-milkv-marscm-lite.dts
> 
> looks like sd on 0

There's transistor logic to select 0b00 or 0b11 RGPIO state from a pin
routed through one of the board interconnects, labeled nRPI_BOOT; not
possible to select those 0b01 and 0b10 StarFive loader mmc modes so (to
the best of my understanding) any MMC action in U-Boot SPL will
originate from StarFive loader non-MMC configuring modes, and there
would be a clean slate except maybe some of the clocks? I'm not sure of
the details from code.

> 
> jh7110-milkv-mars.dts
> 
> looks like sd on 1

Some revisions of Milk-V Mars have the multi-select switch populated.
Most revisions have a button with transistor logic for override of
multi-select switch to initiate StarFive loader UART serial method. Some
have both a button and a multi-select switch. The default in the absence
of populated parts is StarFive loader SPI NOR method.

Having MMC at SPL time seems appropriate for Milk-V Mars of any revision
because the interfaces are wired up and U-Boot SPL i.e. could be
compiled to load U-Boot Main from MMC when originated from e.g. StarFive
loader UART mode, but the goal of this patch as-is specifically
originates from StarFive loader "SD boot" selection.

> 
> jh7110-orangepi-rv.dts
> 
> ditto

I think these are swapped for SDIO WiFi functionality? Not exactly sure,
I never end up with this board to test myself even though I handled the
patch submission with schematic as reference.

It has a UART boot button in photos and schematic, not any multi-select
switch.

> 
> jh7110-pine64-star64.dts
> 
> ditto

Yes, all revisions are with an multi-select switch, and sd where
StarFive loader expects it to be.

> 
> jh7110-starfive-visionfive-2-lite.dts
> 
> looks like sd on 0

It has a UART boot button and a fastboot jumper position which uses the
"user LED" RGPIO3 as an input;  StarFive loader doesn't have anything
about fastboot or RGPIO3 so that specific feature is a vendor U-Boot
configuration.

> 
> jh7110-starfive-visionfive-2-lite-emmc.dts
> jh7110-starfive-visionfive-2-v1.2a.dts
> 
> looks like sd on 1
> 
> jh7110-starfive-visionfive-2-v1.3b.dts
> 
> ditto
> 
> Would you be happier if only the boards with sd on mmc1 got the
> property?

If we're focused on the "SD boot" feature yes I want that to be
per-board, as it is unknown if the errata is a reference layout and
component selection issue or if it is a BootROM code bug. If the former
then that may vary between boards.

I'd rather regard the StarFive loader code listing as the minimum
baseline of adding filtering hints and we can then totally ignore
per-board hinting and testing of StarFive loader functionality and
external SPL behavior. It is configured in the StarFive loader? Set a
filtering hint and get out of the way of SPL re-configuring the same.

> 
> I'd like to say I will read the decompliation, but I look after this
> platform as a favour and I just don't have the time to dedicate to
> understanding it. There's a reason it took me ages to even circle back
> to this.
> 
>>
>> Repeating myself, Hal offered a description of the boot process but I
>> find that does not exactly match the hardware based on my
>> reverse-engineering effort. More eyes should be on this to explain what
>> the hardware does in context of the patch commit message. Are we
>> correctly describing this hardware, or not?
> 
>> The "reverse engineering of binaries" is the StarFive loader in hardware
>> MaskROM that immediately precedes the supposed consumer of this proposed
>> bootph-pre-ram hint as stated in the patch commit message. It is the
>> hardware specifically the functionality that we are purporting to
>> describe. So there it is an excerpt and if you want an explanation of
>> what that all does to save you the trouble of reading it I am sorry to
>> disappoint as I don't I don't understand a line of it. What are we
>> describing and are there more bootph-pre-ram hints needed?
> 
> In theory, the state of the hardware prior to the boot loader stage
> consuming bootph-pre-ram shouldn't even matter, any node needed by the
> stage should be marked with it even if that node matches the default
> state of the pinctrl hardware. What the prior stage is or does shouldn't
> matter, although of course people tend to only add pinctrl nodes or
> annotations when software requirements/expecations don't match the state
> it finds the hardware in.

My initial approach to homogenize bootph-pre-ram hinting and nodes
between U-Boot and Linux for JH-7110 SoC was simple trial-and-error only
adding nodes if they result in getting further along in the boot
process. The questions I had then about "SD boot" and "eMMC boot"
StarFive loader mode errata have only really been clarified by digging
into the code listing of the StarFive loader, and at that not
satisfactorily as of yet. What is all this secureboot logic doing? What
are the technical details of the "SD boot" errata? Where is the
published source available for this GPL2.0+ derived code of StarFive loader?

I agree it should not make any difference what StarFive loader does
preceding the SPL phase for these filtering hints but we just don't know
for sure what the "SD boot" errata is, if it's an electrical layout
thing per-board or MMC initialization code incompatibility. I can see
how we might test MMC functionality to U-Boot SPL with adding these
filtering hints but the test methodology does not involve "SD boot" mode
of StarFive loader as that clobbers the configuration and I wouldn't
know if that's invalidating the testing methodology or not. If it is
specific to "SD boot" mode but then splat over the whole range of boards
untested that just does not inspire any confidence given the vendor
response and what is verifiable.

-E
-E
