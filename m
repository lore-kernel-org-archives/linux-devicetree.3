Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A1C483BD3
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 15:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633961; cv=none; b=nkprMM3W01tk9VgOmdmzEVCpCFGEfs5b2CIh3X0iw4F4cVTo3L2PdjZj9F4VqP7Bb4s1IewNR5GER3hNrqXsFETyMd9A2F4YWYMNDOrtJ4W9wHljyJrJY5hiyM/1m5yNy/Qt8Zu8V6sB5ryJ3VgLGmsdebSqiZjVt8gPfYF4MmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633961; c=relaxed/simple;
	bh=5nv+Mr9p5XaUi062nk/bzZw3jZRcU/o4Y1TWhXSnZQQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=k3wFK2aVLqjo5stSXDI4Fd9BA9ppiuf5pyH/jCvTUHltpl/0GC4GQJ/n2+v5UYG8sLSQkqlpFuNx7X9q4YYHM7Mf1ug6yAl+aYPU2MdMSXEb2rDWz2hlXIzN+0pnU5P69LGI/GOrRgV5zMIFl5/ilmVvm+lQsrJ9H4bacRV/nP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=ZppDd1Ko; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="ZppDd1Ko"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so244445e9.2
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1786633958; x=1787238758; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d1VN5J3PqyqZfjhRbif8FIhRVduCGFV2/xR1rtZPKpg=;
        b=ZppDd1KodqQH0MQ7X/A6LFTtS3zOgG7CGzJ2ShUP6Iam9PbzThNddLkJoGck+AwHeP
         ih6Q+LV1YUXKNGt5+LtK00C8iKoDJJTDwhU4nQNDqxs6NmI1Ck804wVzf53xxvxWn/Be
         clAObxq4b0jw6L/ixlbQNzJcbu0ca8b33SaSWERCif42vsF83YoXMXDQgk4DDywupAdu
         5Rl5Kz/o25FoEjiPEHFz25yp57TrE3eIHF9TdfNGBbKjMph2M7rlWIvAi08BwN5bgKRW
         j8PFQYwRJl/OFYylwF5QD4BvcGz+0PN15Tl/4ICb+4tJh6AoF8qQvfH0Q4uhMcoObmnl
         R6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786633958; x=1787238758;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d1VN5J3PqyqZfjhRbif8FIhRVduCGFV2/xR1rtZPKpg=;
        b=gTbE6r4bcDxOI422lz/+opX12U14/i39K/fj4Ee1Ng+/pyMS4qxneXn67tGTSQg4eg
         UMJRef2PUEuHqomQZEj+yu4dd93+xweR0GoKr/OvZgXkkjiaBXhjsbqV6nvPc+gAtbZw
         XO6H3nKLNd/ttXcSM1vquZCywiFMEa0lpPzzxenk0Nu1iJs3ZZFUj/pFxwyQ8j5vU39O
         zjOdkBlDF4+iFXT8KlDg3ytSpuwgzkFbxrR1j5CZ+DYeQIrS71FzXSgbY12vMaprXcBK
         h/p4Jge4AT6YAimV73LP8ZdzzslXWuXVNP50CwFKeNQxre6MnsZ1nUWgquQAAUIzhqJc
         3Tdg==
X-Gm-Message-State: AOJu0YyHOrfGFn2QW7WBXoh3V7yruQD+Q91bUs3qYCbHF0rxWHBfDZVy
	O6Hj9qrCfzedVutkTZyCPcNB9BwqlQWmSEthb6hKevn7OWTYKmmJAuiBk76dQ3yfJ24=
X-Gm-Gg: AR+sD12j4QuaN1BiOLZf3eYxncDMUVFxNaQi3Nu13+5jvjfkAerCDZp+zkXGUuD9w+w
	gKvrXwe1+4ptJzH/M5tewa7a/dKEf8oj8959WIdafPi595SbC6RsgZfIaHvdpQ8ab6qFB07boBH
	eiHzZzPP+JpDDj5QtusxQmSywXqL+i5CKCbcWKW6Q28QbsP0MYkTdRLplcIwU/w4KDdVDDOZWn3
	BwdNFd6z5KCgoR1vwCTQ+hgMLUIZWZ4p7Ys1GixIECHARXQmXiWQz6+UOnoY96y4gftOjM8OeFH
	PThh7y/8W6fTRtCrXdsS73gTAXN6DRXZd5yJiJtTdPCpqKS+kVO+Kqqag4LezZN08uXJyplc3Fu
	SVMMkdHHWUv8iq1mHWV3jHEFtTgSkKqlt3/4LcvIGOkzuPiWR8tE2fdLKIgQHxnI66LYRQVWMwJ
	ylk4pBJ0FuJEAUCOyNKEATl+xz/wsTFZ/6pjg02dJpgy/hq3FIzL+zG9BlED0cXlkyby5AeE+Dc
	YjbQA==
X-Received: by 2002:a05:600c:c054:b0:499:7aa7:eaa7 with SMTP id 5b1f17b1804b1-499821fa293mr61233085e9.15.1786633957761;
        Thu, 13 Aug 2026 08:12:37 -0700 (PDT)
Received: from white-mocha.local ([2a01:599:447:e518:cc7c:e59e:1489:db94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49982121649sm66878705e9.1.2026.08.13.08.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:12:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 00/15] ARM: dts: aspeed: anacapa: restructure
 devicetree for development-phase
From: Tan Siewert <tan.siewert@9elements.com>
To: Colin Huang <u8813345@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Conor Dooley <conor.dooley@microchip.com>, 
 Carl Lee <carl.lee@amd.com>, Rex Fu <rex.fu.amd@gmail.com>, 
 Andy Chung <Andy.Chung@amd.com>, Peter Shen <peter.shen@amd.com>, 
 Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
References: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
Date: Thu, 13 Aug 2026 17:12:23 +0200
Message-Id: <178663394346.25776.3034382955561000147.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786633956; l=966;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=5nv+Mr9p5XaUi062nk/bzZw3jZRcU/o4Y1TWhXSnZQQ=;
 b=ixzRg0WlxQZmgEqHtR0ys1/8RqBVI0WxN6HGIy9/D2QEYFaW0DgxzfXMucvcSaQRuLtVu2tFD
 m+urC0SrqcpAbEpCpR5K/W3yetTllGyFJL3w5MUH2QxUVs6XbsOQVnp
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

On 13/08/2026 13:59, Colin Huang wrote:
> This series refactors the Anacapa BMC devicetree layout to better support
> development-phase hardware revisions (EVT1/EVT2/DVT) while keeping a platform
> entrypoint.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
> Changes in v5:
> - Remove redundant vhub pinctrl-names
> - Use default SPI2 memory mapping
> - Fix dt-check-style strict violations
> - Add Acked-by from Conor Dooley
> - Sort compatible strings in alphabetical order
> - More commit message for ARM: dts: aspeed: anacapa: Add EVT1 devicetree and point wrapper to it.
> - Update commit message to describe both LPDB and RPDB GPIO expanders
> - Link to v4: https://lore.kernel.org/r/20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com

Errors that were introduced in previous commits of the same series should be
fixed up instead of adding more patches...

Tan

-- 
Tan Siewert <tan.siewert@9elements.com>
