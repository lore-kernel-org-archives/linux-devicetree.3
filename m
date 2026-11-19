Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795057179;
	b=4sEk4M0g2fvXWKChourZMRJHNLXDreEZtMpUfCfRst6RaauslBgNHpWlH1gzC0VJhOdt
	 7PKRaxOonf72ljC+OZXHsccKaqi7MuNSOMZ98iASQZrJWG/LU8lDDOrsKhsijXyx+8G5l
	 dmhYaorRNPOKzMm8E1NjYpv7cf+Sw5a4llTApa7Qy6gqzINLTQYEkaCxthQqVSQCComKD
	 QqkgB7sZaHf9IFSaQvhsXKZ1rh8Df/r2tuGut134PvJR4ZS+B4o7BdStRikp2t5NRC8/M
	 fzpnn6Lf/V3Bxl5Gxj52AkHqV6YxthKg4LmIQacYmpNQ/6a6CISCyeZGBvjK6rSEysQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=dgQEKlX4UyM3qEC+os6mGzDTqTu5S6FmfBmuaPR6ojg=;
	b=PtPXpV3dr75/Fx7H7tXQWzgthL4HPTIsxZPW/Ong5ht0RJG6Ve7aVJ0ortCsI7ptGXM8
	 b5wLp7B7Zu639ibJ/yD2dkjWyYOhxDwe75e4+C6oIw1lNUHs4dub8QSkEPJyYIobfOdzB
	 HkzxkpBLGI1jM4U4s3pZclT1w/d7e5FTCbMBfMzNeD9RgUjhAoo2pGk5hJpSlfDjW9HxJ
	 AX10ul/lDlaaKnf2luPz0cFjDz9GyPA+ob/9/ECAu9qnQ16nxaWAzGvi6/X2DTQ7RODPa
	 LK9nxq+wEtQfdG+ZEv7CPvxUyPHcO3AXeCSz9nMzlIprd4OOyg1Df0O9ecrW1ShP7dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=gaLeZB99;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EB9606A31C
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 02:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25EB9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=gaLeZB99
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso2647519eec.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1795057178; x=1795661978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dgQEKlX4UyM3qEC+os6mGzDTqTu5S6FmfBmuaPR6ojg=;
        b=gaLeZB99giyKcvhBt0k9cGoxWUHh1ZYVJXsKKk5OLI8ITYP92W3pTQX8L5cxeNLvRV
         ZTVxEEF0zm3xoo5FkOe/niY8F+R5A341r9P0nQdwJEY9hNWyDFwDCKeazH91syjnsBt6
         RN+KAYB1nw4xqzQtZE9VyjOlTtCPXXw0bzf2yUuyRjWbjwK2gRvEHcHu7xSm0autt55q
         OQjTlgGCsWv+NYGTom1YkW8pRdu0rSPgwAoERtpqlEieNZxsoj4Aobu/dj2ojRbFnQBc
         C3ARvW1gsIalg7ZcxKR7vW8QHcL9IHH2SJL8TYA0DYJ/GBCR5HA3pZIBEyyST8EBmQQU
         k+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795057178; x=1795661978;
        h=content-transfer-encoding:mime-version:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dgQEKlX4UyM3qEC+os6mGzDTqTu5S6FmfBmuaPR6ojg=;
        b=g9Fq6GIQW9qLkwkMWxPS7l8OkOgcf/p2PzGSxNMKqQAk4ifIT7RLuFiobYNPGA0AyO
         k6W0iIz3QohFwTgCSvs/HnkltuyQAZqwACPcUSfbwXMiip3mN6k0VZt/Yj9h7FPFQUFP
         U+9heW7fO9jGe/Rd6f3YgnWmJkTT9hZ4ICquapF1HtfPh4gQbeEfr5U/pdGahp6gSCER
         Hi2u9OlRDYdOEdvUM1zRlolz3Y+LMNWWpp2x/PoS3EjLTjCXeHjSqSqMRWEB8zZja4FN
         brPHkmXeuI41AP6LIUWxzLlRh0RkSl8nOsh8v6c32M4VJnXoVz0WOjnOCzlHx04ZGum+
         B4Pw==
X-Forwarded-Encrypted: i=1; AL+hErH+qk5A6Snq+OtZHk2QitIGNxf6D+vKLWbdoKDtvQzfMOVS+NmiSU2f5mGBDJJuJu4smnMuqPWHnYsF@vger.kernel.org
X-Gm-Message-State: APuU4Z8xOfoYqX8HBG1ccuwHkYsK5P3pA844o2+FRmx5acG/270Jv6W0
	Y2zqhfEqAtj4YMwQroD+z55uAUJXWPud/+I3ZffJGcS99hl0pogRsi4D/w6MgpP0VZg=
X-Gm-Gg: AZFdTZfKGMnoZ/KyWdBFwhyxtLjdoAAHHu5a9hjAMzLKzZNt0mPtPlLnlwoZG1fiOMb
	/2prZQmiZO6jZDsLpmalLaCTQqJyyhycaqNttPb4lJ3oNuUURXnfUyU21P4SiMCyE5dXG5wM/wa
	r6M4Qk2tyoDWPH7HP6AiaVCMAlnQxEAUQwbTtnpmIkimr4Rf0SrYWYAxLvsh5Z0RVDw7UdB2Ivs
	Ne5gkZgSftHc4NBIdf6nR2S8VIVPiI/firmMd7jYaSPVdNTDOezoVw60VUGkTgtORrc/QHoggrO
	vwSByeGA0k/c7W/38SdGm+hCxCKbzTQbsjoMXeJbfnplP34C3BWphr9XWjkhjtZxNTVPshE9Hfe
	0Ih7wUfaU6b0hxv1+V1KldfzjVKAF+n12rDuqucCUS/y2onG/boU6OrIFt9eTPVp491HSJrwsWe
	3x8Dq+Omie6ajCxMe8ZV8xtDz7rfBC8JhusW+ri4Q5+lpF1DFzGB7C3H5TuMlEOhQkxauo7CHr3
	HkD9r3xfQz8Ju4fjkf7PHvgJIpUlx0LX2IEeZzic8iJ0MJep1A+w7QYFzYHZHefMa3seltzKDIS
	BybLNXSGKvWw+LGJqwi5ZcIeanI=
X-Received: by 2002:a05:7301:da01:b0:378:1191:43ca with SMTP id 5a478bee46e88-38280a386edmr3952911eec.18.1795057178100;
        Wed, 18 Nov 2026 18:59:38 -0800 (PST)
Received: from localhost ([23.145.140.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d8015sm11890072eec.21.2026.11.18.18.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 18:59:37 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 18:59:36 -0800
Message-Id: <DMYUNULEK2SL.3XF7JGBDKUWR@nexthop.ai>
Cc: "Saravana Kannan" <saravanak@kernel.org>, "Frank Rowand"
 <frowand.list@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Shawn
 Guo" <shawnguo@kernel.org>, "Grant Likely" <grant.likely@secretlab.ca>,
 "Grant Likely" <grant.likely@linaro.org>, "Pantelis Antoniou"
 <pantelis.antoniou@konsulko.com>, "David Daney" <david.daney@cavium.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 1/6] of/overlay: look up absolute target-paths
 absolutely
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Rob Herring" <robh@kernel.org>
In-Reply-To: <20261118155103.GA2141649-robh@kernel.org>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai> <20261014-nh-of-alias-overlay-v8-1-0f74f05ac762@nexthop.ai> <20261118155103.GA2141649-robh@kernel.org>
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

On Wed, Nov 18, 2026 at 09:51:03AM -0600, Rob Herring wrote:
> The current behavior seems correct to me. The overlay should not modify
> anything above target_base. Correct or not, couldn't someone be relying
> on current behavior?

Out of tree, yes. In tree, lan966x_pci is the only caller that passes a
base, and it only uses an empty target-path.

This patch exists only for /aliases, so whether it is needed at all
depends on whether you want aliases from overlays in some form. The
case is a driver applying an overlay with its own device node as the
base:

	fragment@0 {
		target-path = "";
		__overlay__ {
			m0: i2c@1000 { ... };
		};
	};

	fragment@1 {
		target-path = "/aliases";
		__overlay__ {
			i2c16 = &m0;
		};
	};

Today fragment@1 resolves to <base>/aliases, which doesn't exist, and
the apply fails. The options I have looked at:

1) This patch: a non-empty target-path is absolute. It changes the
   behavior for existing users, as you point out.

2) Leave target-path alone and handle a top-level "aliases" node in
   the overlay the way "__symbols__" is handled, which already goes to
   the live /__symbols__ regardless of the base:

	fragment@0 { ... };

	aliases {
		i2c16 = &m0;
	};

   Such a node is ignored today, so nothing existing changes.

3) Apply with a NULL base. The overlay then has to hard-code the path
   of the PCI device node, which depends on the slot.

I'd lean towards 2 and drop this patch, but I'd rather follow your
lead here. Which direction, if any, would you accept?

> If we are going to improve this, it should also define what NULL
> @target_base means.

Will do, if the kernel-doc change stays.

Thanks for applying 2/6.

Abdurrahman
