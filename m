Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794257322;
	b=EKiZB9d6O0cq2teTWkhm/epaN/+m08GZiz8zRl63iJgG9vsz8/5mz46lxDxYwY5v5XFy
	 /Gx1NBcZJ6+VLcyc/uh/qJkmyk9Ek1x1BwHqScGsjt21OM5Y1IlxFmOKxW/fR0Ixpesre
	 kyzfBf9v433KNOS/HveFpV02ASeFR5JxmBSrGj55HoJLCvUfqhp2n3ZpmgwWZDAG+9x76
	 +pnmQqC+GGKRiPN57hCIwQPD5EP/kT0Vj1NBdQeQ5o+6QxaUk8aY0QWwnDkxtDW1mWFDZ
	 OxVZ4WnoI+v8/o1wG0Gb3EZb+Fk9Tf+Q6i5McEcNhDsEbanObvwNeRWQURm/pFeE0Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794257322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HCOo5dIuLMc4cgUiAq1BDTXlWDL7LT0CiehKkG4T0q8=;
	b=3WtVGrnzLbj6rFHbGGdaFXIjv/SxF76h6jqEfbPtTOjkCTPVcOVfdcqNqic/7HpDsBCe
	 I3mMJWFEyf3/j2w5Oa7vqde19zGeGuA5WHEj4b1X+86+g/xmvuLB9V0K+yDQQ9iF4KqQD
	 3r0/EccfNA2G772u/2MeyTWoLiIAyC+d/XYdTVdShFpsE78Q2b8G9xlqgw8HBC4pebEE5
	 MnZ0GxGuvWVvA9STzNLBs6JQEoKf2Ba6Flw2rst5gCgreU1fC0BPU4WgGj1OUJaES2Dl0
	 JOORKM3UuYCkbxB/cxh2m/voEWc6VDH0AWZeJ2OP8GOMUiH8wjjbmIISZeRz0gzQq3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=so3wPPfp;
	arc=none smtp.remote-ip=209.85.210.195
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FB5606A326
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 20:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77FB5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=so3wPPfp
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-8b5efadd183so605215b3a.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 12:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794257322; x=1794862122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HCOo5dIuLMc4cgUiAq1BDTXlWDL7LT0CiehKkG4T0q8=;
        b=so3wPPfpPERFQm4A4bCtwIoIR1Jsu5RcDZrhDBzWKWDKsA+g5VFRxXtxHdaNHLSTIR
         aKUyEEDWvKkFyBTMuGNubrJO2poJ/o5nBJEXRjhhBMeg88nK0dVZtVZkC9VCchRk4XfH
         PBN7EKEMeXYVtXeoAsvphZsuCWI0tZIZYjYiLDAjL11AyFZqOpWIINZCfejcJFsTaYF2
         ZWMNZpan/Mv/CGJ6Fghn49fI2p/vDzYGtHfMpYN2Ik2KUALHV/nL/zokN9wgDdPLyHzh
         9k7oV00eN0RCS6I3+45hKpiQ9d77MwEQHDq/JROyGbuda0KNZ+/TNAVdbUHKkp0ENw1g
         CLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794257322; x=1794862122;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HCOo5dIuLMc4cgUiAq1BDTXlWDL7LT0CiehKkG4T0q8=;
        b=UlJPt6cOX43N8tjXvHybQZGgwsKRMfxuxhoiI5G5l73eOx8K3HLPbDO1BfPNw6F3Df
         kD397jBWdagVgMyDj6mtZ3Gyj6egb0EXvba5EVm7EyKCZYRW8vzv9yuV+YYjNsS8O0bx
         /VAqvw0JSAxK31ayqaRrJluge0vJBONiGgCQ6+5xsPDZqCZRVGbExrEq0Ug5SaWZoSod
         14syslxVHONRDSDRcs/KZRfZhjHM5EFlhdFU+1lYRd/Mt1dkRioFSCRvcTbLluhEQEOi
         qlXYAEAsq/BVaDVxqiGLSAXuKkeCTZ+x2j4MIe0KZafXhorUNc8uWjzb/j9ek5N3oz7I
         /r3Q==
X-Forwarded-Encrypted: i=1; AL+hErEjHi3oxrOECPkHMxOI8VB6HqPR6tLa1Yz1aokzNHF1mwtoEjtYKziiHDo7bSwHeYVa/CQh17CNGZv9@vger.kernel.org
X-Gm-Message-State: APuU4Z+bcGQ1FmGiAnw0k6MxHgLBXRJUEQaLZ7Gl2DTWP8iy8qM9uOAF
	sN77y7s6Jbkd1B7SOS/LyMHSFMvMgavm6UxMJUk4XpffW+XHBJ4sk9mJ
X-Gm-Gg: AYBFou3dE98EhQcbD0MY7DZbmVeQrfzKry/n8HwnpotLGVSJZVghXOaK4phWnjWk7k+
	uyyUx3kVSQaLIX7P6x0WRwy5AW7kRCAG+lJKpXUuIpKkari/wEA1dHnUGLJneVqPJNjF8SDakJk
	UAcfgk7SMNNTRj5Wuk5kO3TVJFHh43sWZsqn6omYulIqOw3UFGH2Jl8MRFuoR598lbQRYND26F9
	tU+vHVK4OrQSpkEmgZW7C8UsSN8Q7veMlpD8u+sy33i6wmWslMhMSYwj8uNEFym8Xk49RwjmlVB
	4rgeEBCYfDGHDdoaZL0RXhUyoHoUKDVYrdAgFUxLmYTwF0Gv/OzlipdFHNNRX203ULJEhA6HbdF
	kLwIXStqrE62wFOAqf8J8W1NFTi0/uKOxscdiVCkgnA8nRnIp2gz4Qm7TKgC/C5ocrQES9mvSyq
	6ZD9wZ32PX1h/oVNSjkNS47Z8EoRX1Xcfehc1ESpk1A9dMaXDAg+WKEyjZZpYu0eIKtREHeRDfm
	iIBHICmXziXsRHXudlkl8d+OnOAn5fB4i7r6iFsP98KehPS21EpuFfA+UXyLLnP0pLPtDuJ4HlB
	pbLT2paDMMaYetfGAPkPBphRHchyQb8XqIcdLMM6zoZoGabuNxYfiPQ=
X-Received: by 2002:a05:6a20:7f89:b0:3e2:8c23:4d6d with SMTP id adf61e73a8af0-3f172725e92mr417125637.15.1794257321733;
        Mon, 09 Nov 2026 12:48:41 -0800 (PST)
Received: from [198.18.0.1] ([45.95.212.227])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d7b37casm129038a12.22.2026.11.09.12.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 12:48:40 -0800 (PST)
Message-ID: <9a73588a-f5ac-4c9f-bb83-97224173aee7@gmail.com>
Date: Tue, 10 Nov 2026 04:48:35 +0800
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
Subject: Re: [PATCH] arm64: dts: rockchip: use rgmii-id for LubanCat 4 gmac1
To: Andrew Lunn <andrew@lunn.ch>
Cc: Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20261109191515.252449-1-cyan2254650260@gmail.com>
 <f2663951-aa1a-44de-87cc-8e7b105e1036@lunn.ch>
Content-Language: en-US
From: Pufan Jin <cyan2254650260@gmail.com>
In-Reply-To: <f2663951-aa1a-44de-87cc-8e7b105e1036@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2026/11/10 03:55, Andrew Lunn wrote:

> On Tue, Nov 10, 2026 at 03:15:15AM +0800, Pufan Jin wrote:
>> The LubanCat 4 PCB adds ~2ns of trace delay on both TXC and RXC, but
>> that alone is not sufficient for reliable RGMII operation.  With
>> phy-mode = "rgmii" and zero MAC delays the link comes up at 1Gbps but
>> drops ~90% of the packets; the PHY's internal TX/RX delay is required.
> Sorry, but this does not make sense. 4ns of delay is 2ns too many.
>
> You need a proper explanation of what is going on here.
>
>      Andrew

Hi Andrew,

The old comment was wrong. Here is what is actually happening on the
board, with measurements.

Conf A: phy-mode = "rgmii", no tx_delay/rx_delay in the DT.
dwmac-rk programs its defaults tx_delay = 0x30, rx_delay = 0x10; the
PHY's internal delays are disabled. On the board's direct 1Gbps link:

   host -> board ping:  200 sent, 20 received, 90% loss
   board -> host ping:  200 sent, 19 received, 90.5% loss
   mmc_rx_crc_error:    118

Conf B: phy-mode = "rgmii-id".
dwmac-rk programs (0, 0) into the MAC; the PHY inserts its internal
2ns TX/RX delays. On the same direct link:

   host -> board ping:  200/200, 0% loss
   board -> host ping:  200/200, 0% loss
   iperf3 TX:           921 Mbps
   iperf3 RX:           941 Mbps
   mmc_rx_crc_error:    0

The vendor BSP DTS for this board is:

     phy-mode = "rgmii-rxid";
     tx_delay = <0x1b>;
     /* rx_delay = <0x00>; */
     rtl8211f,tx-delay = <0x1b>;

The vendor configures an explicit MAC TX delay and PHY TX/RX delays.
The mainline RTL8211F driver only supports the standard 2ns TX/RX
enable selected by phy-mode; it cannot program the vendor's
fine-grained rtl8211f,tx-delay. With "rgmii-id" the PHY provides the
2ns TX/RX clock delay and the MAC delays are zero, which is the tested
mainline configuration.

The "PCB adds ~2ns" text was never measured and is removed. I will
follow up with a v2 containing the corrected comment and these
measurements.

Pufan

