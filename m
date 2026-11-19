Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099639;
	b=dzG4nUkAHwS1bWtkF88STJzw2L+IHUMgGcneVUeedvVuJyBqXGHSr+RMZ224LJk7bEfl
	 rx7mI5lVQ2rEZgnI3JVJNG1jP6fwx7/jFsW0C6JDORYgksHrVDS0nDmm8qFnSo6VAqer5
	 K9tQGP+OPHuSBJTZ5IXuSFx9AYsYqNrpQEsuEA5diffM5wMaLDKFgaLPZICVzdRyPWr1r
	 lG6+GOBantxG74R+KIhZGhxeq9n740Yg4bYNua926biA7sxGgHcXveQCc5LlfppPg69a+
	 ul/FvlB5aQxNXR4fHw9gUBCrSmLe3YEeH/0FL3EWbmt4PP/ByMVuPZY32UU5qaV7Omw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vITMaRYl8N/4FX6Ub/CtOdFIyxibL9pIfaPhRC74PEQ=;
	b=c4s7s+uBGi5bJojLt53GLEUgIluH3eBjsMhqMJVwLsNX2YKnRD47l+RVZ6MHZ5wS7oUn
	 Q8KZLZsqTZb7+MnHAsYCikwiHbvxC81b/KP5VVEwEiHT1yVL/zMLrqBWxGWt6+q2aYIme
	 oFgkE6RPRq/Zn0TeMfnPql97LewaB2QHHVJeFiESZ6fzNKG6Nauy06QCXSPU7acOaaWAA
	 M3j3WuBEqyKu35EnShEz4nLUGpsjZQf9Hqi9Tsy+DtXoW0pajF14hFPZnSxuj30uZOKye
	 /S2qS0VxkDvY7lkS0ZrCvl+Zm7o1LMKmOpLO/vu//tzgdX6OsDBDwA659MY85ttKWHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TrJluSdU;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071BF606A32C
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 14:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 071BF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TrJluSdU
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6ba1e22ff4dso659252a12.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 06:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795099637; x=1795704437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vITMaRYl8N/4FX6Ub/CtOdFIyxibL9pIfaPhRC74PEQ=;
        b=TrJluSdUX+LCPAOrAOhA6LjHqBXkXzXdZYzjMx55+3fdDm8qXlIDbcwPLeFn5iEV8L
         81q7PJ6vKUHawD3zzMlIVK3s0qlUxABF9nlbI1HhyjHFLneVa4qFHXHBTQ30Wd2+GFaT
         N5U8a7+EgH75s8BGxVtnefpvkPJZTUdEf4siNc2UfCxyTzsphHLg2wBwxKJih/LDuApL
         eWknL1aAzPN20X8Bum1bME8KDVnaD0j71ulUclw9QS9pjmPRMYD1rEO0Cg7cEQJUz7M2
         /E2vbBN1hhBaN1oikSCwHN6vsJoji+hAK43fX4HYQaXsr2i5I4wC+SL3M+HaQAYn82fy
         hy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099637; x=1795704437;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vITMaRYl8N/4FX6Ub/CtOdFIyxibL9pIfaPhRC74PEQ=;
        b=TqM7FJcJTcbUUWnYv5tAwOOP39igVDmvze6qIXObE0rWhJ3nfpci5179EPXEVWho9t
         w1m1XBsLIyiLO3Ajd68AX3L8Lgq7FN0W/U8cIGIUa0+zYp46axz7R0s6mguL3a4vJbWs
         dGgVFlhmskd4lXN7UEwbZmUrelpz6twCGbI6ufbK4bWvIRS0tGsK76bM0jTynPYM4ZtW
         8B7wUNxzfAyjrrVIud88vXDUT4E9NG8lT3vGeevHKt/2edH2hdi/se34whoBa8LX8YGp
         TUDe1z6DfH2K74V4JWBwQ9ICtPNgQ2vrjUlrpR7K5Auhw+dmYUci1OwAGkM5LER+kE+d
         RFsQ==
X-Forwarded-Encrypted: i=1; AL+hErE9leeUw2rV/JXQN/gcFOFqauVO36rjr4Bqop34wIzPDfl2D66d4UMVE4pFg/sLUVGnHRiMDhiZzNXq@vger.kernel.org
X-Gm-Message-State: APuU4Z+sSLVS6J27/CJCULA7k+lvadhWuks9u/5v3NqNqhDN/QQBEJZb
	JvbtUm98g9UsivJe6UFkm7e9+SXzbSsgO9SDvs7dN09WX7DsQVuyj2fqRQEifIC+tEXWmtCf2gi
	v6/NuNtJI/g==
X-Gm-Gg: AYBFou3imNdhAihtrkqpf6i9FlBKOfh59n6M+w9IYNhhOQrn+twiLHUBFUDzYrYF2nT
	BG62lpgdVLOBN5V0Jey1dSFUzT6RygOHMpWmfOO9hKzQWKSC1FK/9LUAZX80UbikyeU8UuweD07
	29+reLkMISZeHfmG2Z8e7efA+GRRmqEuITGxFw1ovEyf2IYh5k3Gk8O1Vws9O+nZUkDrvMhrsKG
	2thMbLBY0LDSmZlbcuw1KJzIWHgc0+HVi1GSKNkYvXZCo4aOz9zU+6GFhc4FPo3mh/1QHE0fAuM
	GVN5FpQzhcwez5V3OrItPiHCOvUMrFQtcEv6BFUjqHw6Y7xNePDfhJXhG/jaBYIT+D96OrOmYHg
	Yb3IUTQzQKet3aOuxgHStMnEDlcDAadkl5DZ+S8omlbB/0PjIpYEAStXi20LQMp6vuI+s8oumkD
	/DPYoOZ3tGIu2lXL1zsbIcPoQSDC1EtR6adWv28NJ81FQuT7aDagzSWXLlbtKBAoQcLVOoYl7mj
	NH57NDYlu2ktqGfTBFLrudWXj2hebaDSiG/EQRvfbE9mhJEqRQF7KJNX0zbgCmkROm5Q8yuVaci
	7+4yA4iRMFcIHkid3fUWgW53fIzV3qEq6QJZkI3xBPDHMv97jtR1Ykhh7Q==
X-Received: by 2002:aa7:c7d5:0:b0:6b6:ea98:2539 with SMTP id 4fb4d7f45d1cf-6b9095b57admr2564430a12.6.1795099637250;
        Thu, 19 Nov 2026 06:47:17 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88993e08csm2579854a12.6.2026.11.19.06.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 06:47:16 -0800 (PST)
Message-ID: <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
Date: Thu, 19 Nov 2026 15:47:15 +0100
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
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping
 support
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Paul Elder <paul.elder+renesas@ideasonboard.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1795029012.git.geert+renesas@glider.be>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <cover.1795029012.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Geert,

On 11/18/26 8:44 PM, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> TL;DR:
> 
>     Describe hardware in DT, and perform mapping to abstractions offered
>     by SCMI in Linux.

A question on the approach
An SCMI variant DT could mark the CPG and MDLC status = "reserved" and point the consumers at arm,scmi, while the U-Boot IPL keeps the hardware DT.
Since v4, the series assumes the SCMI ids are stable:

>   - Remove dependencies by making assumptions and dropping disputed
>     items, to move this series forward:
>       - Assume all SCMI IDs are stable.
If they are, why not using them in the DT directly?

On partitioning, the cover letter says:

>   - The clock, reset, and power domain IDs are not stable by design,
>     causing DT incompatibilities.
>     SCMI requires that the ID space exposed to an agent (i.e. Linux)
>     starts at zero and is contiguous.  Hence any change in system
>     partitioning (Application CPU core vs. Realtime CPU core,
>     virtualization, ...) may mean a renumbering of all SCMI IDs,
>     implying a massive change to the DT.

SCMI do not mandate that renumbering. The ids start at zero and are sequential, but nothing requires them to cover only the resources of one agent.
The firmware can keep a single id space for all agents and restrict per agent what each one may use, the rest returning DENIED (SCMI 4.0, section 3.2.1).
For virtualization, the spec has the hypervisor grant each VM its resources this way. A new VM then changes permissions, not ids.

With a single id space, a software configuration only changes which nodes are enabled, so one DT per software configuration, a base DT plus an overlay, is enough.
If managing many configurations ever becomes a nightmare, tools exist for it, such as Lopper from devicetree-org [1], which generate one DT per execution domain from a single system DT.

That leaves the missing clock domain, which is a gap in SCMI itself.

[1] https://github.com/devicetree-org/lopper

Best regards,
Clément
