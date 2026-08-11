Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B3043A817;
	Tue, 11 Aug 2026 10:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786444426; cv=none; b=dvzBkyL/w1ggKjMV1uC4uEoB0x5LO5ULz4kVBb+kVPIfKWrji3JTdyZkkjHOrAD2L3nI7hLdgauLuUKcDlZl65wKaOnRwhtsi7SBAp+Ld4KABJCE6Wk/TDiXw89n2pzWjqtRg974qYDokH4poCSJXFhIxGk1+vuQRLcQBu9B/Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786444426; c=relaxed/simple;
	bh=tkfUvqUEJJ83MD7nFRWU4Es4qrikibI1tNB2TSwulWo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j7nB0PgQocnloXPgzX+sY+Wp69UH+hB8DeD5zZ60NFQDN4utESaTTP+v3wyOBGHQ1q+M5/oJsS4C0akdgRLbbSBMFoGsJ4g5vxc+JERKfLAfC8LWBwAkkCDHMCqLu9LTmkoFRZ329f5/nSUtDVDrRX7dI14TTLOSo5Fj7ibcc24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QDWLU/xt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QDWLU/xt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830E91F000E9;
	Tue, 11 Aug 2026 10:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786444424;
	bh=bTsX1N6QHwCuJeFFe3YjLPIoFhtDQnpbmhVY27s3hsE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=QDWLU/xtCMtBsLDpa7JdYppM374StpI9vCcLBbjQ/c/vI+uy2pXTzQR6jFcaQVrlD
	 MnX1ML4klel13J7YI0ZzKkXsRoWlcKndUtTttWH8/RsZ0tClwwpMvSJBQRG251NCwb
	 pwfk/Hlhzsmvx4YcdQMAdiUk/+mZ7m8O1x4zUNMLcbuYq7CuL0/o3oF3cNnmhSnjuH
	 fVzcZrDP8hniJA7qzdLtmycS08ZWsxHZahH1ta7v0e6G8ujGjhpbAGyosFE2Dy/f+r
	 YlSevHhUpc5060KIpyXVT8Co6HW/9e6qCkiL97s/i1mo8QGR7ikHQozvI/WmtVWW4e
	 1cdZESnLgstRg==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Mattijs Korpershoek
 <mkorpershoek@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add sa8255p high-speed USB PHY
In-Reply-To: <162bfbf1-f8da-4083-96e9-2557688b0072@kernel.org>
References: <20260730-phy-qcom-snps-femto-v2-8255-v1-0-8b8bf5105a68@kernel.org>
 <20260730-phy-qcom-snps-femto-v2-8255-v1-1-8b8bf5105a68@kernel.org>
 <20260804-active-sensible-reindeer-f459a3@quoll>
 <87a4qu2f98.fsf@kernel.org>
 <162bfbf1-f8da-4083-96e9-2557688b0072@kernel.org>
Date: Tue, 11 Aug 2026 12:33:41 +0200
Message-ID: <877blx2bga.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Tue, Aug 11, 2026 at 08:18, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 10/08/2026 16:59, Mattijs Korpershoek wrote:
>>>> +  power-domain-names:
>>>> +    items:
>>>> +      - const: transfer
>>>> +      - const: core
>>>
>>> Here and in your other binding you call these 'transfer' and 'core' but
>>> all other bindings call them 'power' and 'perf'. Why this difference?
>> 
>> Thanks for the question. I had to do some digging because I did not know
>> the answer to this.
>> 
>> Per my understanding, the SCMI firmware (in my case, gearvm) exposes
>> multiple protocols identified by a protocol_id.
>> 
>> For example, power domains have protocol_id=0x11 and and performance
>> domain have protocol_id=0x13. This is defined in ARM's den0056 spec:
>> https://support.arm.com/documentation/den0056/f/
>> 
>> Each USB phy has 2 distinct power domains.
>> This can be observed at runtime from linux via:
>> 
>> /sys/kernel/debug/pm_genpd # grep 'scmi-power-usb0.*phy.*' pm_genpd_summary
>> scmi-power-usb0-ss-phy-pm       off-0                           0
>> scmi-power-usb0-ss-phy-rpm      off-0                           0
>> scmi-power-usb0-hs-phy-pm       off-0                           0
>> scmi-power-usb0-hs-phy-rpm      off-0                           0
>
> What about perf domains?

The perf domains for USB are also exposed by the SCMI firmware and are
also registered with genpd:

/sys/kernel/debug/pm_genpd # grep usb0 pm_genpd_summary
scmi-perf-usb0-ss-phy_86        on                              0
scmi-perf-usb0-hs-phy_85        on                              0
scmi-power-usb0-ss-phy-pm       off-0                           0
scmi-power-usb0-ss-phy-rpm      off-0                           0
scmi-power-usb0-hs-phy-pm       off-0                           0
scmi-power-usb0-hs-phy-rpm      off-0                           0
scmi-perf-usb0_0                on                              0
scmi-power-usb0-pm              off-0                           0
scmi-power-usb0-rpm             off-0                           0

They are marked as "on" here GENPD_FLAG_ALWAYS_ON is set in
scmi_perf_domain.c

If we query the SCMI firmware using raw commands, we can get some more
information about the perf domain:

# Get the OPP table for domain 0:
/sys/kernel/debug/scmi/12 # printf '\x04\x4c\x18\x00\x00\x00\x00\x00\x00\x00\x00\x00' > /sys/kernel/debug/scmi/12/raw/message
/sys/kernel/debug/scmi/12 # xxd /sys/kernel/debug/scmi/12/raw/message
00000000: 044c 1800 0000 0000 0800 0000 0a00 0000  .L..............
00000010: 0000 0000 0000 0000 0b00 0000 0000 0000  ................
00000020: 0000 0000 0c00 0000 0000 0000 0000 0000  ................
00000030: 0d00 0000 0000 0000 0000 0000 0e00 0000  ................
00000040: 0000 0000 0000 0000 0f00 0000 0000 0000  ................
00000050: 0000 0000 1000 0000 0000 0000 0000 0000  ................
00000060: 1100 0000 0000 0000 0000 0000            ............

This gives us 8 opps, from 0x0a to 0x11, which look like opaque values.

I did not need to initialize the perf domains (in the driver) in order
to get USB working on my Ride4 (SA8775P) board.
Since the SCMI firmware exposes the perf domains, should I describe them
in the bindings, as optional?

>
>
>> 
>> In the case of the other bindings - for example i2c - there is only one
>> power domain (0x11) and one perf domain (protocol_id 0x13):
>> 
>> /sys/kernel/debug/pm_genpd # grep i2c0 pm_genpd_summary
>> scmi-perf-i2c0_7                on                              0
>> scmi-power-i2c0                 off-0                           0
>> 
>> I hope that explains the naming difference. Please let me know if this
>> is still unclear.
>> 
>>> What are these domains responsible for?
>> 
>> If we take the example of the high-speed (hs) phy, we can see that on
>> the firmware side, the only difference is the -pm or -rpm suffix.
>> When Linux requests scmi-power-usb0-hs-phy-pm (mapped to 'core' in the
>> bindings), the SCMI firmware (gearvm) will interact with the reset line,
>> the clks and the regulator.
>> When requesting scmi-power-usb0-hs-phy-rpms (mapped to 'transfer' in the
>> bindings), the SCMI firmware will only interact with the USB clocks
>> (reset and regulators remain unchanged).
>> 
>>>
>>> Commit msg is pretty useless here - repeats the diff. I can read the
>>> diff but I still do not understand why such naming.
>> 
>> 'core' controls reset, clocks and regulators.
>> 'transfer' only controls clocks. Putting 'transfer' to 'off' is
>> interesting in case of runtime suspend/resume as it cuts the data
>> transfer (by disabling usb clock)
>
> Either the binding or the commit msg should be clear that these are
> power domains responsible only for power on SA platform, not for perf
> (so a power power domain... ehh :/)

Yeah, the terminology is a bit confusing. In the SCMI spec, we have: *
"Power domain management protocol" for protocol_id=0x11 * "Performance
domain management protocol" for protocol_id=0x13

Since linux models both via genpd (drivers/pmdomain) we end up with a
"power power domain" and a "perf power domain".

I will rephrase the commit msg in the next version.

>
>> 
>> Is it more clear that way?
>> 
>>>
>>> And why core is not the first one? It clearly feels like the power
>>> domain thus the main one.
>> 
>> The order is based on how it's defined in the SCMI firmware. It's not a
>
>
> Then core goes before transfer.

Ok, will change in v2 and update the other series as well.

Thanks again for the reviews.

>
>
> Best regards,
> Krzysztof
