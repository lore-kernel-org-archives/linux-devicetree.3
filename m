Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF372580D7
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 05:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780722244; cv=none; b=iqONqkWU2W3oQaJqLv1hGg5XLlnXLGe26QdKFt+1ldlRXu4RQJtHXUGIEQP4yRlcQZagVDqSsfNZ3OiMy07NmZcqSBP1Ia2OiltiY6hAlSN54mjZIq0F7L8+X5HfhSnhvMMaq0FGdV8nl3pOnfIx3NR8a5L3TN2hiUEU1AeNw0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780722244; c=relaxed/simple;
	bh=263QfBY5Zp+gfX2SSDrodQXz/EAIY/aQ/Pr5s0xl9+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sIAZV9Bs9FtHzHDhRQHrqT8CgkURyHl4kBLEDZ6keV5ciqdRMbMai5DFTknUQKLaAIfvrEVnA378Jncuo9NyysU1eMFzyqBZ8TIpACTz3r3ncrbUlz3zbY+5YzDGUpiXrN3cl8bjM/XIfm7M9BiLdvBDWsXinTK0CjM50Rg4Q1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net; spf=pass smtp.mailfrom=pardini.net; dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.b=GZrsoX1z; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pardini.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.b="GZrsoX1z"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6877c719cb0so3408667a12.2
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 22:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1780722242; x=1781327042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ad3Risuri9Oy23ttuXXObF+tJAD6dYgEl+kDhesPP88=;
        b=GZrsoX1ziTdDLcdmOAsCHNY+OeE3e5tdgZDTirvyA8VQdLnrB0uiVrpcwwBCPpiH8E
         56TTq067Mz7cq3cPfUcoDPjmyBuTkVKUvdjb4cFjhwjC3TblyCh0ymondJHKqduCiCCT
         YjAdydm+f96c14j8w1y3vGy6sh6tcr/EEZFdfmFqZwWHTG08z5kdLubGIHS1PDl89oEC
         GbWxqWWc6JxOcLtA7R4rBvZneI1qRMLBKqITxDluKzE17ugE0txz1Cf1j5Nocdm1/EN2
         7L0hVwxnfJOIquakxQ5Tyn0x+84uMVWVt641klWNDZKC58IJMzOxDPn6rE+Wvl9R+sc9
         BIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780722242; x=1781327042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ad3Risuri9Oy23ttuXXObF+tJAD6dYgEl+kDhesPP88=;
        b=fteZqs5r2X644FGCMh0/Te04qUwiuU6kapCFZEqtoMwCstrxXx/QlEYdj6PiD20VUa
         9jh+DvGLoGnf6t1Mszi0NKJomJDCpM9mAp1XD/XBb8hEdxKB8VKMlwk7RZ2tISEWwiqo
         JCurPK6g/5HI5sM0TRSmQm1muAMev600sHi38JJp7hW3jgKIXFZ/i9b+YilthaXI3NGs
         TBVP8zi2KeGLWS+ut+PSJS2gbyPMV5+DlLTLkaEwNGWsja5OS+tYPBW8Sn2WyEaDcOaD
         FtyqrUBzvF3nCjjmbf/C+znEJbv1cKs64UROBQJ0oqo9HzYQgv4RICoSPPSWQXk+R/b0
         AVdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8V+2/C8lgF2v9xwsIxDFDKcX3ZEl2Ou5zoKCtH/gs4nSB9GQQBvOfe2KqJHjjQIWpSrfwCPGzUTHmT@vger.kernel.org
X-Gm-Message-State: AOJu0YyqCNSm3cSb5rcV3T8b1NhKYaYuNKCtcYR1azEeAQ+t2peKusAD
	3vqE1/9vqafSDGW14iMrpAp+J6YtOiGuRzraqG+021FoYt7U3zvY5S3y2GRjMPCa0w==
X-Gm-Gg: Acq92OEZKc3FFV+1kS7Qy/F+gLLoWxqaayFVfBxzbJT2SbK55qZn/arlIi7+0y1fC5L
	YmcBBK49JUFI86Fl+3dJwqmn3IjEeJqnUk5WBZ0MIkG8aAGMnA3IqHY8LgxPVkEVKeo/RPbDuRW
	6FU+eFAXCm3ETP2iAXiqBe8aE53yBVIWB05eukWreBcb3o3wRb5maO3nXl1O6JbEL7GRZT9LDL1
	SlpjNnxlrpmDgp376jVa6LC6X9T2wcyMzmBkPtOfQnaSUbOc6qJrqamMPs9k0Ks0qn0i1DNfSka
	KfSGf4yjbgrwNJnjmQON6i2P2VSmKwCtP9CRag06ihn7Ie2YIHj3NjLSZ47N+PiafloKgadG/MF
	Zcl+VCdmRuhUMnuwJN4aoCSVeanmM0uGTy+wVCY9ae6HB8v8KOxaoYKrQCey90HYxHu8wYWxC9V
	mRsBqbS5isgFQw2K4bMFs7eujL331Uvu8fce2tzubhobxvn1wGGRd88GkvnSROe/AgfvDEybFmf
	+ZEMp79lK9hExgm/yUj1M2o2uzjZN0pWA09G1sqOZeyZfsxEMziKGPQfTL481zBuMi8l1TYo7sq
X-Received: by 2002:a05:6402:268f:b0:68e:4c0:f599 with SMTP id 4fb4d7f45d1cf-68fa4c16b80mr3088882a12.5.1780722241268;
        Fri, 05 Jun 2026 22:04:01 -0700 (PDT)
Received: from ?IPV6:2a02:a466:4d7a:0:c439:8cdb:ad2:c0fb? (2a02-a466-4d7a-0-c439-8cdb-ad2-c0fb.fixed6.kpn.net. [2a02:a466:4d7a:0:c439:8cdb:ad2:c0fb])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6915a637180sm421874a12.26.2026.06.05.22.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 22:04:00 -0700 (PDT)
Message-ID: <26da1dfa-3408-4654-9046-36ed6d57059c@pardini.net>
Date: Sat, 6 Jun 2026 07:03:59 +0200
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
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <b7cc8eba-ff6e-417d-8e74-b3bb24e08a26@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/06/2026 17:48, Heiner Kallweit wrote:
> On 05.06.2026 13:49, Ricardo Pardini via B4 Relay wrote:
>> From: Ricardo Pardini <ricardo@pardini.net>
>>
>> Add a binding for fixed/soldered Realtek PCIe Ethernet controllers
>> driven by the r8169 driver (RTL8125/8126/8127/8168 and variants).
>>
>> The "pciVVVV,DDDD" compatibles are the Open Firmware PCI Bus Binding
>> spelling, auto-derived from PCI-SIG vendor/device IDs, but they still
>> need a binding when used in a board DT - analogous to "usbVVVV,PPPP"
>> compatibles documented in their own bindings (e.g. microchip,lan95xx)
>> so board DTs attaching properties (fixed MAC, nvmem cell, ...) to
>> these PCI function nodes can be validated.
>>
> 
> The of node seems to be created by of_pci_make_dev_node(). But this
> function is called for bridges only in pci_bus_add_device().
> So where is the node created in your case? Did you test node creation?
> 

Hi Heiner,

Seems to me of_pci_make_dev_node() is not at play here - that's the 
DT-synthesis path. For nodes already present in DT, the of_node is bound 
earlier, during pci_setup_device() -> pci_set_of_node() -> 
of_pci_find_child_device() via the 5-cell reg.

Ref testing: yes; with this series on a NanoPC-T6 I get, for example:
/sys/bus/pci/devices/0004:41:00.0/of_node -> 
/sys/firmware/devicetree/base/pcie@fe190000/pcie@0,0/ethernet@0,0 and 
u-boot correctly adds local-mac-address property there which is 
correctly picked up kernel-side:

=> setenv eth1addr 8e:b4:90:66:66:66
=> boot

...

# readlink -f /sys/bus/pci/devices/0004:41:00.0/of_node
/sys/firmware/devicetree/base/pcie@fe190000/pcie@0,0/ethernet@0,0

# xxd /sys/bus/pci/devices/0004:41:00.0/of_node/local-mac-address
00000000: 8eb4 9066 6666                           ...fff

# ip link show dev end1 | grep ether
     link/ether 8e:b4:90:66:66:66 brd ff:ff:ff:ff:ff:ff


>> +properties:
>> +  compatible:
>> +    enum:
>> +      - pci10ec,8125  # RTL8125 2.5GbE
>> +      - pci10ec,8126  # RTL8126 5GbE
>> +      - pci10ec,8127  # RTL8127
>> +      - pci10ec,8161  # RTL8168 variant
>> +      - pci10ec,8162  # RTL8168 variant
>> +      - pci10ec,8168  # RTL8168/8111 GbE
> 
> This list reflects just some of the PCI id's handled by r8169.
> Any specific reason for this exact selection?
I went for "chips likely to be soldered down on an SBC", but that was 
indeed speculative.

I guess I should trim to pci10ec,8125, which is all this series 
describes? (further IDs can be added by the patches that introduce 
boards using them)

--
Regards,
Ricardo

