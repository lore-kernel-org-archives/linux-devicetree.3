Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690855;
	b=zyyarrS8HDDNOIfvAJ7AnutlgJG8uUVHc5Fxr2yX3+jore1KI24GJDBCHtsKZG2DAw+o
	 LoUhW0qriwKD6Qxwolqap16z4h+P/tQvaTzn5SXFGpSK/GPLcR0j3uwiK3nf9FUdgFA7w
	 ym40sjU7mzRK6tqoN404bYzrrEa/CBO/dPaRt3athV0uqriUKf1OYD8Nubc1td0gQP1gu
	 6e+CH72EuHKv6qGsXsQtEP/C6kdSdPQ+/rPe8DR7QdQ74BHFmlgXZhRnlj+xrWjLInyIR
	 b00WOCsDfSLSc4gpAZ2RdWUn6AaM6cqq0hYh6dszU1RK8heDF/ULdKNGJnyTSZ7i3Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690855;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=lqDNdqh7JWi24rY3vzEqU+LCO6MlMl1qL5MbUIf6AO4=;
	b=vz2pwVTTzRrpbVwhh/L8k8/1MB04pSXlfn/1Yh/f53rwLs7zObDgr/Bh4GRdYQX7L6KB
	 KX81XMHfv+SRjgiHgkEP7LRytVdW3IZf5GH/ddKuNwre4G7u1Ei2XGYHA8WCWRWy+h3Zo
	 YhHOuRh+OI032bLoFeuLa9jVjYquW6i3sp+Dxy5wF34chmz8xsZpyc1BzdasHqYd+be5B
	 Z96ocK9FegT0xhFekMI9bAuCLuA4NOJqBJdaHdl6xcB08sMxrREETm6nU5LIfK8Q1HZyG
	 BJ4t6Zl2bGeiQlUOyMJ5VefwR2japcG4Eg/kvxOgVp2o7Tl+L/1OUotEPFdflbpGL/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BF3606A31B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33BF3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2001dd4e7so575025e9.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690853; x=1793295653;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqDNdqh7JWi24rY3vzEqU+LCO6MlMl1qL5MbUIf6AO4=;
        b=1bC0CS9yr7kLEk1l83DX+rBlAokoLrFZ6kKL1mJebAt6y674B1nn01ojpEoyo/2Bik
         7kr9utvmLhp5HUUPhXRKPJW5GOdPPeGhhTJfNy8E6i6y6OVeUcaLoLFNkqdaJyIm7Vdu
         6Au/4qad8MnvACKZUx3mu6y5uE6abiCKG6GVcDWMtEfw5mSpuW8t0SOyGVJ1i3cmh4XY
         0+s1XjyZwqns1Zi71PXhhSMaHBY35gxZfWdMSGi1HBoq0lXiTUSLbERwej4GM2Kbce10
         xhix0uS9OL9+fUUWc1kk4z3GIYm/6QL2c7rnmRxQlht8ICTVicADUINQGKl9Ffto9O4w
         VDZA==
X-Forwarded-Encrypted: i=1; AKwUvBx07GBeqpjBcrn7F7trkuI6BQtd1CioekFJLYZJ92jKCltcYm8wK4xrXaISg9SfDnFF/CUO/hmG64Mf@vger.kernel.org
X-Gm-Message-State: AFq9FYIpY2NolU9RoyXHD5rJay0rypjKYV+H7DQI9HWH04wlkCygpI12
	y+p85mzxmn20ytKNymdVXIMewsAYPskn3yb8aU5qN1iN4Lxrq1JfgZSX
X-Gm-Gg: AYBFou2KoCkpC3fLIcRbu7OWHAyM2JqDu8B0NpHLPNGPObQlVEEvY9mUSF9r4HA4mRf
	z80ZMhs5DqAepKo/V8dk+8YUsfuKNA+sxjQ+mhTFhZ+XnSfegLS54OY5CellAGLOy8aEioMS3Mv
	6STCl6uDM/LntSM9izKhnmtkQQMUZ+41XkZqkG7y2Rqtjsy2JXezJzsXChhxhaGd/xiWqmGI+rS
	K0dv5T31pWYGqgjEL+JtbsGdAopG0zzszO/kIyQN9Zrh81L5ZC9tLHOmpc5XUiDa+A8zq29eIqG
	CcLCHL0zw5M5JqxvpPDTN1QakbHdwZ7I04LKWUcZnsHDm3i7pKQvIu7j2bZaTTzRq5HkgXZEb1C
	Y4FC2f5e80IHp8J2hlG0SXClhbvyvrWvEY/SMtgxkfBDlSquIlhE52yo6xbRSf118psNi0F0im/
	wnRPGtyDA3QuCj8+3JkIDrjkWEag8Ygtoc2KApl+BKP4fdQBs5jW/xcB+0P6dJlDio9WwZXTNPp
	OUI8OtRmNncVdSTf8TIK2tcXicJgtmv5TuTSxW65VL0jZrMk9pALmbwx/kix6WBPxGjo2rdPsVs
	dRElliUsQA==
X-Received: by 2002:a05:600c:8b45:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4a20a3b7c0emr41739035e9.3.1792690853435;
        Thu, 22 Oct 2026 10:40:53 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2101cd7cesm14216005e9.0.2026.10.22.10.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:40:52 -0700 (PDT)
Message-ID: <74840159-62d9-4d6d-a0c3-b079e6e4da6e@linux.com>
Date: Thu, 22 Oct 2026 18:40:51 +0100
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
Subject: Re: [PATCH v3 7/8] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-8-tanure@linux.com>
 <CAFBinCC8iKESoc2zEXJMEmqk0cwWbVap-a2KcAtB7-KFKO9Atg@mail.gmail.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <CAFBinCC8iKESoc2zEXJMEmqk0cwWbVap-a2KcAtB7-KFKO9Atg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/10/2026 23:00, Martin Blumenstingl wrote:
> On Sat, Oct 10, 2026 at 12:59 PM Lucas Tanure <tanure@linux.com> wrote:
> [...]
>> RGMII needs a delay on each of its two clocks, and on this board
>> both come from inside the chips, not from the board traces. The PHY
>> adds the one on receive. Its transmit delay does not work here, so the
>> controller adds that one.
> [...]
>> +&ethmac {
>> +       status = "okay";
>> +       pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
>> +       pinctrl-names = "default";
>> +       phy-mode = "rgmii-id";
>> +       phy-handle = <&external_phy>;
>> +       tx-internal-delay-ps = <2000>;
> You're stating that RTL8211F's TX delay doesn't work but not explaining why.
> I haven't come across this behavior before and I'm worried that that's
> an issue with a batch of RTL8211F.
> What if the previous/next batch of RTL8211F will have working TX delay
> again - wouldn't that mean 4ns delay in total unless the RTL8211F
> driver is changed?

Yes, you are right. After I understood I had a missing clock I re-tested 
the everything from scratch.

On the T7 the register block with PRG_ETH0/PRG_ETH1 sits behind a clock
gate (the "pclk" clock in patches 2 and 6). My first tests ran before I
knew about that gate: the block ignored every write and PRG_ETH0 kept
the value the bootloader left there, 0x1621. Bit 5 of that value is the
TX clock phase select, 1/4 cycle, which is 2ns at 1Gbit/s. So with
"rgmii-id" the PHY added 2ns and the MAC added another 2ns nobody asked
for, 4ns in total. The CRC errors from that made me believe the PHY TX
delay was not working.

With the clock enabled and a plain "rgmii-id" node, no delay property:

   PRG_ETH0 = 0x1601 (TX phase 0), PRG_ETH1 = 0x0
   RTL8211F page 0xd08: reg 0x11 = 0x0109 (TX delay on),
                        reg 0x15 = 0x0019 (RX delay on)
   iperf3: 940 Mbit/s board to PC, 943 Mbit/s PC to board, 0 retransmits
   0 CRC errors on both ends

v4 drops tx-internal-delay-ps from the VIM4 node and the wrong sentence
from the commit message. The PHY adds both delays, as the generic text
expects.

Thanks
Lucas
