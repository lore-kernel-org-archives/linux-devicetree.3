Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994715;
	b=ydNBWLExSefOlqvG/DxLOCkcugdD5wK+u5+dtOotHCNyj+k6EIyfzWMzm/xzczzxB/Jf
	 pyNnijWElnd3Jb94GewQRBGZ9hRCyHuFdkONcFUUgkrTvr+OcuPUJWBXJuswo2HcDpItY
	 jeZbHKf5LQAy6ZcNm5mYax1IMSpC129pJk7Tb1TRSX36dT1Oaj4Uo2coyX5AKrQEJs1kR
	 rIXR8nh87uqRg6xNi1prgjQLwQwTySrnm5e9bIqWa/srDSr6XSu+sZGYeEMZ7LUoc/6fI
	 Arth0esMfW5ALihuaVv7tcPWacUFGk8e1eXQGOdTQgk08KlkPu6DDu8Ozh6eRqhM36w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=9uDqiU9m0I45FXevXHOe2/irro6MBqjLHqDakyWB+MM=;
	b=wA94gZRPCdKSY6ZL5tzkYYU7yDGRab3A6ENKXoN8yLAXMux8OHafySE/DlziMusx6qlJ
	 cnBcZfFEXx/T2Lj0HCIOmyXozCkQ7SXkqDs6WFzBN8jW1MrxlJfHNzBwZZLrtrJLFcCLm
	 2/ht95ceUoW2UxZk6JD2h5n97HSWmPbwJ3vSBqKPhKywSqZQ2msshNjhUo+1/U44ioFQM
	 Np7LICX5AhYzoQlcm71SXT36p0LXu7FUc5VKeXhS59WD/+Bjo24+3R1ZKC6H617jnW+vw
	 BKdGcf7alqeK7Rbad5HEIfkAJLumsxny5jmtiuT5jaFWU058ZVYiGF4oL1l1437NsNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=N9Dh84hq;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B10F606A329
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 19:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B10F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=N9Dh84hq
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-19305bcb72cso979684c88.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 11:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793994714; x=1794599514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9uDqiU9m0I45FXevXHOe2/irro6MBqjLHqDakyWB+MM=;
        b=N9Dh84hqvF7NaouHGTiQxo5yUnhRZPrGood/HRPGvI94n2FAymdyOkmuHs+cX2k00s
         Ojg76cnlrLMwoKnLry57oy5CjHRZkKLOOHsanyhME8VE28XIru/MhtJPSFeiWnfMXgTt
         RACGj77C8Jbmz/KIawDskDqaDpWRH/nFO9egOUoxfXIu0kbDXsogCKQTcojei5RvZPZ0
         L1Zm+GDTyCFNXQsGnAay4rXtccS3bGGWHFdhyOAPRQojgYRPD9qUaXyd3GmFg0wQHpce
         rp+Ikk1nPrrSK2FFQihUpTcexubikUGumIK1328V/t47KJ6lzTACITNb6Fs1McSMOKFO
         k6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994714; x=1794599514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9uDqiU9m0I45FXevXHOe2/irro6MBqjLHqDakyWB+MM=;
        b=MWkJzQ8HKrO7WE8KaBK1ZQ6Bc37z0qyKA7tmlaUKEnXq8326RkUOh5iZJZ5Y/vsvVR
         9WyfU0ekTSP+FccdMK0QFvG9sJORTvaiVBzjWESTbV0AIt/1bkT6Ddrn9UZotxw6MprG
         S1hly6ZtZNeNC69Pp5npMnhv8VdhHDFcGSGJMkgIrbMRvcCGEQd//L/uZD+2TaNF/Ci8
         ssjvR9dat8TOmqt3p5ERf/Bnq9cB2LVoyRu2+H+GgZIJ/GNNEHWEQhwUcLLZzqq3nxXt
         0oocxWkz9OuACHf+RyTXSvjhA/Cz8jH2Y+46jj++leyxihH4auLSCzizIBVCGgOcepUD
         GH7g==
X-Forwarded-Encrypted: i=1; AKwUvBxFYeJH6I9CFq+i0myZP6TmFn1CDpoOg1gsEUljFgBdrhKVTonR4gDZ/t7OO1LNcWBAE3+o4XYwboXb@vger.kernel.org
X-Gm-Message-State: APuU4Z9EuCE2eDw4H5VJhYDj6t2JZ+pKPwDRl9cnzbCM/NgRcUy/TC+v
	IkTsCNrcT4A0kdP7elaRnR7zXgMcSL7kFsIgTGnyFMYdgeyE3f6/HBOVFeiEFP81suM=
X-Gm-Gg: AYBFou2d6SO1GUHVRidcNNsd3u67+Ti18Trx3m/US7FntVQP1I7NipTxcqJZaMboAKh
	IjEyYUKPyJ0MHubMaa6eEHjkjbv7Rb/PIPyCp/ebD4EOshCJHRwGbGWqTxOAEOQsRyOeoIfKvXc
	4KE+GXPwVSoIPa4JxIaSEZHa/L/+co65j4bk7Su29LEm5SgHbyaVIT4tA57mYdYZa+V4LxXf4w6
	uvp+p+2QZlPAq6DlQjg5675Cwfq7ZLGoVKzMBpN3bobKnQmHPPh6X4yLuNmRSKvLg9giyVXcXpH
	FJ6F+YGqUuHaEr87yxVD/8zNYKzj6BRTqUojKTRuYdDsbfkRRX6Q1FiszmCgOrkPNxANQpoKsqX
	L4yZW6d/RA11onWDD7SXwjidkJzeoA8yosjo9OrG3/1zL+R12kea/+SV+KcdvSaSAL7NSBCCOuM
	YffEPFGJ0rckR3kez6rqQ0PdKMc6q66dCWnKy0auIMUBbtSzICOsUk0yUuVI/03ORoz3Ryt1q+H
	6VFOu6QeDk9px4D9fJ+wwmapO9ZcbJ/FJu5HNyNIBCaIDCEkjQeecT6xh9hWpxOFAQovHMZgppx
	Ns2vH/3RG4HKj64z2rf7igiqkpT8PA==
X-Received: by 2002:a05:7022:c82:b0:143:2968:564c with SMTP id a92af1059eb24-1b25d315d51mr4434155c88.26.1793994713996;
        Fri, 06 Nov 2026 11:51:53 -0800 (PST)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e485ce2sm7568630c88.7.2026.11.06.11.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 11:51:53 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 11:51:52 -0800
Message-Id: <DMOE1TFEAB6G.EC2KYRBTZR9@nexthop.ai>
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Rob Herring" <robh@kernel.org>
Cc: "Saravana Kannan" <saravanak@kernel.org>, "Frank Rowand"
 <frowand.list@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Shawn
 Guo" <shawnguo@kernel.org>, "Grant Likely" <grant.likely@secretlab.ca>,
 "Grant Likely" <grant.likely@linaro.org>, "Pantelis Antoniou"
 <pantelis.antoniou@konsulko.com>, "David Daney" <david.daney@cavium.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 0/6] of: teach overlay code to keep /aliases in sync
In-Reply-To: <20261106132432.GA2551143-robh@kernel.org>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
 <20261105124030.GA1449284-robh@kernel.org>
 <DMNRHQBO1JLB.3IO0N8NYJML4G@nexthop.ai>
 <20261106132432.GA2551143-robh@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Nov 06, 2026 at 07:24:32AM -0600, Rob Herring wrote:
> What I would like is aliases are not supported in overlays (applied
> after boot).
>
> Don't we already have consistent naming on hotpluggable devices such as
> network adapters? All that is solved in userspace. Why do we need DT to
> solve this here?

Netdevs can be renamed, and that is why userspace can solve it for them.
i2c adapters can't be renamed.

I'm also not sure "after boot" is a clear boundary. Overlays applied by
drivers such as lan966x_pci, or for an FPGA on an x86 host, are applied
during probe. They describe fixed, soldered-down hardware in the same
way a base DT would. The same /aliases node gives stable numbering when
it is in the base DT and is silently ignored when it comes from an
overlay, even though it is written to the live tree and visible in
/proc/device-tree.

If an alias is a request, as you said, then honoring it when possible
and falling back with a warning when it isn't can't break a working
system. Today such a request is simply never honored. That was the
regression you were worried about, and the fallback covers it.

If you still don't want overlays to set aliases, is there another way
you'd accept to get stable bus numbers for hardware described by an
overlay? I'm happy to rework the series in a different direction.

Thanks,
Abdurrahman
