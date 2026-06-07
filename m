Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9D72AF00
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 01:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780794205; cv=none; b=nPs9ICRRa6vAGytNuiLCkyo+bdC7pirpCFpfSqSb7i38iHrJx7CDcBD/bcZqjHL/DB9B9aJJAzWndjE2VF6NfF3ptZGpBuSZ0PIeMNjKx5K4QDEfk/bAxJ8qzwLKc/i/loHI3gL8+XtBFLqFAW6Jc2jWHOZcnQ2gSCBKbDpTKKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780794205; c=relaxed/simple;
	bh=V7tezCKTEwZpa11y/H0dMbg03qX0QXGP1XKis3C+aNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P3fF+xl+3s3Hltcj4yckYxLwI+bxuki8iBhtla+yCZQrugnuQpS2HAufzqAFckiHZ+7CP8D9aeNF3HKUXixt12Pfv38K80h4QkfMxFK1Cko6E+odN0favAwN4ZKZKhjavYPvEGrntgeasKhZS1xswJBkqUXW4uzpdpUzn1G+yFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net; spf=pass smtp.mailfrom=pardini.net; dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.b=JfGqC/ws; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pardini.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.b="JfGqC/ws"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6912f4acca4so2397843a12.1
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 18:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1780794202; x=1781399002; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HqAMDji/Y/ZfDPdozsCR+NdaIZJxhg+V9OuE8Iuwqx0=;
        b=JfGqC/wsx5Hqql7fs+BsCvQYlBZMhQ0dLHiNBps2c+/LrK92g8nsLvEO0IHFPMg3dl
         59rqd5zwKfJynEIOqQFO87Whd81MdW4B1AqcNrw1zTcQxCX0ryjokLydJ2NkQGSN/D9w
         +0bcYW8ZP87M6mwGVPDH33S/MLvXjWIlKDlUVluH00EihswRPr12/X/S2403LNPK8cXl
         F59owFAS38NlUIWp88lfczEned9edLNMan3RYy6IrHWWLiCsN4lE5a9ytuqITbjgxMnE
         6qPM+E9sZbcRJHc2qTFtZxF+LIfQMdGPORmp4lT6Szikhr50To75B56qH/Hsa4YYu7Sh
         81SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780794202; x=1781399002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HqAMDji/Y/ZfDPdozsCR+NdaIZJxhg+V9OuE8Iuwqx0=;
        b=s+tiVGoKlUItdVPcj+FqSJ9Y1XccdYA7fpFwNZP179oKVBCS58FzqR9yHymUHtUGAx
         5JchL9Te5rI/0a9MNtgx1p5bfUfRGqexrCoH8CR7qwlh7q7U6mGzpyDY5n0blwn9Qa7t
         L09ZQzpjXoUcRmS1O6iEL3jyrVFeqHeIiq2asW8nuM8TMgAYXwT05oPvfgRxWotMGxvu
         KZVRX0ZUpuyEWQra53OUyIzEfBhHyKZsDSJ/jlB1PqoCKpq8+D8dsnAlQfjnGTAAr2GT
         6PWyThLMqFvPw+Xj+6qX6hwXgJ3krrAhrYrPtdrKuE/QTfqzJedVG641XbSgWv3yhPQX
         IQgg==
X-Forwarded-Encrypted: i=1; AFNElJ+Goom/nL07C2j09NyMyIzA85RTcOg6P6oUH3R9geKXGcv3hc9hiX8xs6aVgqF7hRYsjxy9CKoA+tKH@vger.kernel.org
X-Gm-Message-State: AOJu0YzgGh5EJw5/tTJeQYn6W6b0ReQuS19A+KGWbsUbWUmmTxhm5F7+
	p9YPpxDPg6M5fjNvjydE6r4ycIgazpE2M8BotCuuynyI8f8uqToJhBi+rliWhkhvMw==
X-Gm-Gg: Acq92OFKWuYw2am4Htv4yoXduuopIjnaT8Vtqtcl6Dg2yosZkrGKhT3pHkDjwuyKo3B
	3GMI4n3H5KkcorZa4lMat9QzrfqlY0jnKJJfZXgyuLabqbo68NqDeho/cPASzVni5CwWH1AWk8j
	bfc/D3x5k2EkOZyWJxkRJP2a4agF6ajGzZIGkqnu5TbBbD/ddbXpx/BHaF+3XwJt/aFH+/qirAt
	xpV9RaoP2JQVuoI4Hk35XT/vLMuFUzofFOZKgdexycrXBL2afRgwpjAD/aZVGOSxLXVLgy9ltS0
	T42mbkvTXdK+acc/x1pfHat8d+bjoqY0mmtVijrYmuleY6TmTY2y+O7tOyVIETaPosgDYG5ZWUn
	ZtRnsVM6GoGcnKLiSBToBQs49dxdOAeY/wfC6i6K/bBxogv6vr3+m8DZ4EclEZknt0jIQXTM4eU
	pQHGFlY5iRt/gz4HBO1Dqkka0D/CYXfV6MJ2ddjrKVBlehM4QvZlIRx7jg0JSGm/YBzLrd0x2fG
	LvaLZvTg0SLllnTs+toGQdLuQ56kcmLwpGIzilTQC2IS3xkmf4lUPV11YkmdnlmqnfRbOn7Ks9s
	HxTV
X-Received: by 2002:a17:906:6a01:b0:bed:87c:b24e with SMTP id a640c23a62f3a-bf3721513damr453039466b.29.1780794201771;
        Sat, 06 Jun 2026 18:03:21 -0700 (PDT)
Received: from ?IPV6:2a02:a466:4d7a:0:9569:75b0:b281:a338? (2a02-a466-4d7a-0-9569-75b0-b281-a338.fixed6.kpn.net. [2a02:a466:4d7a:0:9569:75b0:b281:a338])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e0280asm654743666b.33.2026.06.06.18.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jun 2026 18:03:20 -0700 (PDT)
Message-ID: <04ef65b1-e28f-42fd-b054-d1843205f67d@pardini.net>
Date: Sun, 7 Jun 2026 03:03:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: net: add Realtek r8169 family PCIe
 Ethernet
To: Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-0-8a8857b39daf@pardini.net>
 <20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-1-8a8857b39daf@pardini.net>
 <b7cc8eba-ff6e-417d-8e74-b3bb24e08a26@gmail.com>
 <26da1dfa-3408-4654-9046-36ed6d57059c@pardini.net>
 <667f64e0-2b3e-41bf-9c97-3562696d3af7@gmail.com>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <667f64e0-2b3e-41bf-9c97-3562696d3af7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2026 22:50, Heiner Kallweit wrote:
> On 06.06.2026 07:03, Ricardo Pardini wrote:
>> On 05/06/2026 17:48, Heiner Kallweit wrote:
>>> On 05.06.2026 13:49, Ricardo Pardini via B4 Relay wrote:
>>>> From: Ricardo Pardini <ricardo@pardini.net>
>>>>
>>>> Add a binding for fixed/soldered Realtek PCIe Ethernet controllers
>>>> driven by the r8169 driver (RTL8125/8126/8127/8168 and variants).
>>>>
>>>> The "pciVVVV,DDDD" compatibles are the Open Firmware PCI Bus Binding
>>>> spelling, auto-derived from PCI-SIG vendor/device IDs, but they still
>>>> need a binding when used in a board DT - analogous to "usbVVVV,PPPP"
>>>> compatibles documented in their own bindings (e.g. microchip,lan95xx)
>>>> so board DTs attaching properties (fixed MAC, nvmem cell, ...) to
>>>> these PCI function nodes can be validated.
>>>
>>> The of node seems to be created by of_pci_make_dev_node(). But this
>>> function is called for bridges only in pci_bus_add_device().
>>> So where is the node created in your case? Did you test node creation?
>>
>> Seems to me of_pci_make_dev_node() is not at play here - that's the DT-synthesis path. For nodes already present in DT, the of_node is bound earlier, during pci_setup_device() -> pci_set_of_node() -> of_pci_find_child_device() via the 5-cell reg.
>>
> I see, thanks. If the matching is done based on the reg property, then I just wonder
> if and where the compatible string is used. Or would the logic also work with a
> random compatible string?

Thanks, Heiner. It seems the compatible is not involved in the kernel 
runtime matching at all (and u-boot simply patches DT via the ethernetN 
alias).

I guess DT-wise, specifying compatible (although not strictly required) 
makes sense since DT describes the hardware; "there's an RTL8125 at 
0x410000" sounds better than "there's a PCIe device that needs a MAC 
address at 0x410000", and having the binding opens up usages of 
non-generic properties, although that would be future-looking.

At this stage I've to ask the devicetree folks: should I simply drop the 
compatible from the DT patches (and the whole binding)? dtbs_check 
passes without it, and it also avoids the checkpatch.pl 
vendor-prefix-undocumented warning. There's precedent: at least on some 
Apple Silicon (2022, t600x-j375) and NVIDIA (2019, tegra210-p3450-0000). 
On Rockchip there's quite a few (10?) boards using the same RTL chip we 
might want to describe.

> [...]
>>> This list reflects just some of the PCI id's handled by r8169.
>>> Any specific reason for this exact selection?
>> I went for "chips likely to be soldered down on an SBC", but that was indeed speculative.
>>
>> I guess I should trim to pci10ec,8125, which is all this series describes? (further IDs can be added by the patches that introduce boards using them)
>>
> Yes, I'd prefer this approach. Considering that RTL8168 has been supported for
> about 20yrs now, your use case seems to be exotic. Otherwise I would have
> such a patch much earlier.
The Tegra Jetson Nano has an RTL8111 described in DT for this exact use 
case (without compatible) for about 7 years now -- I just couldn't find 
it until now.

I'll wait for people to chime in, and later send a v4 either dropping 
the binding, or trimming it to only the 8125. Sashiko seems to have nice 
suggestions [1] on the YAML too, in case we decide to keep the binding.

--
Regards,
Ricardo

[1] 
https://sashiko.dev/#/patchset/20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-0-8a8857b39daf%40pardini.net

