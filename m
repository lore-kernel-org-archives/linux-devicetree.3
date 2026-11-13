Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575072;
	b=tPAt/MZYKuCB6I8ftjlZXc6XxXlLDSZlPD6KQ1ceVreOb/ZXh4SYcZDAO0AqLF0rQYop
	 uQ2HV9R0vtOnknvxIOU2pUvzFvVOgPQex2/SMIO66AFrxRUIT55b3lqHU25ImTjofGF66
	 hm9AkFdS48dKTo+FzSmld1l1sXtrJl2kjIuRWhPyiH72BSCl934/Cq5PDvjH21eNToSb1
	 ym/tc5pz5oYNBBy+DSsANVkxgDztgmWeqC5NEpxl6IMRYDIHw1zrWzOy7TS5D2alLqzfr
	 Q97p0B5Ox+JVn2tJDQ+tVhwro1UwMHbStm6nIocQZzK6LYK8gMxXA/+3ZHTqPvzI5bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Bko+HUcyhAHNudlJorQZD/sxxlgE8GJ6dUtZz3KykI8=;
	b=Bc9kQDqkLrJHgEKZ9rujCOuEuTTsh6ejV+OAhgqF2zW3GKe4hyJmdmoRqm+oaB26TPkN
	 D7WLLqQHNSomwCT7tl3++JJabssmdyyNJae2hyqKeNHf6ymT1aLCbQ4WP9UBl8wEktdxt
	 R4jTpKvCmkrS1Y4j3b8B+cpfqn4aSbl0g3hXXXcHLsxNdAsNenIAcK8QT0A5J8jDWpIZt
	 /QfBh/0hUUOWxPBA/wSpP5l/HAHmNmaMau/K4gNF7efzEwoAS0jimBrscFIuHhtBH1TaK
	 xGL2+r2bV3pccBLLNcwq0JxUz8Lbtzi1gMuGm6SRP7eDTrqVJBtC6m8sIEJ0PnjT4ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=monstr.eu;
	spf=none smtp.mailfrom=monstr.eu;
	dkim=pass header.d=monstr-eu.20260707.gappssmtp.com header.i=@monstr-eu.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=riqlwF1K;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789B3606A332
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 789B3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=monstr-eu.20260707.gappssmtp.com header.i=@monstr-eu.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=riqlwF1K
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c468bd799ecso180713766b.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20260707.gappssmtp.com; s=20260707; t=1794575069; x=1795179869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bko+HUcyhAHNudlJorQZD/sxxlgE8GJ6dUtZz3KykI8=;
        b=riqlwF1K2vXDVc85Cx4Vu+yVDBUrlGNjjhwTbOurWAExBVWrYUinisAsdtwKCPxpeg
         YH7bT1VclS+1KvJmbM6/JQXvvWljNGC6Qm/XZGiTNoeZhMzU5XY+A+7NlXD7QTy5y+Zk
         Hx8k238FPCaDbkCynQbyT9f3awDslu2qaUV/nojBNTzN54nAYXLqkn0i0+WC0V0f+fZy
         F/1QWWDg4lZ0rUUfdOK+NogA+/s58jdxKywh5j4PtxtGQqfBBFTnUvxWC0pBvatJ+ZdS
         mxHL8U6Tzd7istONQadvhbDv8VBqVdRFmk7bQRL9nwtZAre5tDabQN5eF4qxNEneXRuA
         Is3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575069; x=1795179869;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bko+HUcyhAHNudlJorQZD/sxxlgE8GJ6dUtZz3KykI8=;
        b=t4qTAVwVnnyU1c38+VA0rguG6TUX04pKsKQYZ0sI/dyWWeYRWe19GxSTNwEkkKeFV1
         b1rUeiWdDmm3gksaxG5j0igFoz+VgF5jJoQp5LF6hLFe6g0Z4hxntROcIyUdYq9vTXXy
         7gv1rRC2B308PYtAVm9TR5Sy7WiIn5YZsxs00P0sJGDEkySgrad0r/enN833xJuEjcfg
         lDuGJYcL6W6MsYPaAurzzBcKRA0x+dZdUGBI30/lLa6JbZVuVTWK3jSzz2Mn2uCL8VEZ
         gUU0mQoejY7d/G2e2tti2jFMR1RMerMApcm3PSkl3LOxKuZhABZ6wKKKrgNya1Ov/XSZ
         41vQ==
X-Gm-Message-State: APuU4Z+KBUfDwdj7Wo1gYLIgFjcsjnRi3xwOYJiiZ6Sa6zn3ws9tJvfb
	vQyAxwxHtmQu2CBwxVHWiMNKREHCiUW1NsvxV4ktG6zv84+FqcfzimRLP/V2Z9CulQ==
X-Gm-Gg: AYBFou2XY50P4hJ5cd+99nQcTwihNQa+hYPBgTjFDMaX/F89Wv+FxYyoSAEM6h3aYvB
	GBE41gBxApzO/LT8wvHBDfHrUYdTzjFaYwSbZIhF+6AYwtN0IMckLQF4c4MEvwl0kpVAwHlHYFN
	XZ2WTT91Pj6oXI/ySb2gUAnAozmvzNeNP/nOqID9ra4B4I78k883bh2VmGSbgG2Ni0Gf9wc3d9C
	M3ulje/tJR+0Hp0+lkspgkfTPauqTiSLTlYC9IxCqxPT/0i8r1Caas6Ud5T8OWgMZ9dLdFXhlRp
	n2baLAOQyyYG74CvrN/15MyaYZl9RMm6qSBpMIAEhwEllmE1cSTJTPCQ3pOgRKEMjOc1lNk30+E
	1w/RNOBJI3IF8ceZ83Gsx8XN1Je516PC+9dAHOJ3lncb+euJew0pG4mUT/ntBMPKHgi5cgQV2z5
	UUOG+rfTqKzFP3X0KCY4rEXQwpoazYQbBFFATeYOfwD14FAYaX6YGuUKbDQq6LvVtmVGtFa9htI
	57IkImtstmP3TPcDrNAvgeI1QVbEBI8z/9FdTwzBrHbaSndrtqvhAkIkmvjlEE1jXB60IOF+neQ
	AKrHJZveeEQmPOtJsPg18vtmak/XdrwGrUKVSd96BJzSF9HtsVu4u62WBcj0u0pl/jK16W07pvw
	T6N6Y3sjA/n/DH3yi2KI8w+WvUt9AnzTwSVdaBQ==
X-Received: by 2002:a17:906:f5a8:b0:c50:5e90:5ea7 with SMTP id a640c23a62f3a-c5096853f0cmr210109966b.49.1794575069275;
        Fri, 13 Nov 2026 05:04:29 -0800 (PST)
Received: from [192.168.0.105] (nat-108f.starnet.cz. [109.164.53.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7eb14sm91031666b.75.2026.11.13.05.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 05:04:28 -0800 (PST)
Message-ID: <b40c2160-f5d4-43ab-88a1-14cb11bf92de@monstr.eu>
Date: Fri, 13 Nov 2026 14:04:21 +0100
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
Subject: Re: [PATCH] arm64: dts: xilinx: drop unused #phy-cells from the
 DP83867 nodes
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261110-v7-4-topic-zynqmp-dp83867-v1-1-04500475a560@pengutronix.de>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20261110-v7-4-topic-zynqmp-dp83867-v1-1-04500475a560@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/10/26 10:03, Steffen Trumtrar wrote:
> The DP83867 ethernet PHY nodes have a #phy-cells property, but no node
> refers to them with a phys property; the MACs use phy-handle, which
> takes no arguments. #phy-cells belongs to generic PHY providers.
> 
> Drop it, so the nodes validate against the ti,dp83867 binding once it
> is applied to them.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Reviewed-by: Michal Simek <michal.simek@amd.com>
> ---
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso | 2 --
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso | 2 --
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts    | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts    | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts    | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts    | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts    | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts    | 1 -
>   10 files changed, 12 deletions(-)
Applied.
M
-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs

