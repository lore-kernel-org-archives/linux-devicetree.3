Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337634;
	b=mGVF2sdH6v99+Sp2jDp22hcQDpXHJOZLk/68K+yl5lMta7a/2Y957Jdenvs4Nzt0+2h3
	 KT4PGQetjlo4JtV3ukQVU832KPeyy87HXZQmelNePJEQJfYsyQkAjDBSi2ygw9PyXS+yI
	 porM2RGfNKolSppKiPncmfJO7zCSL2QrKeLSN8eVp6ygw44VpkEY7qKkjiSn0M+XTbhcn
	 g/vZMeJ06j3RePkkWy2Vcx1sYyu9HFgVDsEC5P9Tlb86jYgeH5gRLH0//++tICi3Ez/6C
	 TrsjHEbN4u5YhEwN3qBXDEYCQQonuomJerP5YtqLhGa0yJY7o0llGBkxEUl3SC4k69g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337634;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=3pk5DW/V6VeFLnQOE3OY9sAFDQ/PzjxAc+hYqzj2LB8=;
	b=dBeK9FpstTG6jUV6BXjXLlGL3XXqjVR53yO/39rXc83I63bS8sBmHVPA/RlOrLDZkYvP
	 ty/2yFjzQPX0tRdvWCtbyXZfs4EiC2O/p2GUoxisgUyXNh7OM32VpaPwJNC3lE6llWG0b
	 qKFSrVLKpj48VXj/YwdgCU1lP0MhL7U15gRg+WWuO6WPc/6BGTpYhTz5GuHg/xibB2VJm
	 Q9mXRVCv+sEaL4OGe3COeQ9vzqQvfWn5oH89kv7Lb5eCrLSkXg8leALfYPfU0UC4kyQLB
	 DbiiOld368dtC1bAp2aHOsjzgUHkoqB06jr6UTulTBZSI6rzQeZ2855uATqJKTeiBHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="fL6oOHl/";
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA739606A31C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 19:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA739606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fL6oOHl/
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b0b3754f57so1438409a91.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:07:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337633; x=1794942433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pk5DW/V6VeFLnQOE3OY9sAFDQ/PzjxAc+hYqzj2LB8=;
        b=QhIGqiGwIQnj/kI/26P970sxKzFnX+zVai1G7SDxkdqz+HkECBjgvwaBmT+YmGQxpz
         Sc7e8eeMcvqCt5DOIJXVWK7rGKLq8v25ZNGLstgQXd7KQ+yDvW8OHo8GNeB363QS2kcj
         S+XNYlJ4rmw1rjk7Pt+jHE/VvMI+g/6YiS1kWwJ4TO5gf0nXBZOs5CwJ/ikCnnC9w6sp
         qu3kZOG1GAnLa78FFp0I8jsSO/XSY8p04YcyPozBiHXNXPgq2XgbA7CmRhdD0airhxe+
         ACkRV8lkz+cffGazIqpPgQRMrbNRnoNKpE06hR0dun3UYDhgBjiAnpsZ/YVcUl7gvgUu
         Hrrw==
X-Forwarded-Encrypted: i=1; AL+hErG8g+GgTRN0ZhdqMi7caQXwrRdi6OgpOkttBM1kF1wh4awjNOc59fzUjuXBKmLYkaQknAKLne7NXjft@vger.kernel.org
X-Gm-Message-State: APuU4Z80KWWtN890pajnZIrLzPCJ/5qH6DwMB3+FBMwRjGg5O3LuLGCY
	5xjB++dV1uwpjaxltHj/cStMlTm5V/o71UqGxn525a4HoXbLBOxUBh4Fy3D5ZS2tBWXYotPP4sm
	noV98OUD+g5HOWA0neaaUP/j0dkHtY9vN/YHp+jji8Ng91IA0mUuU2ucPxf4sAXmh5p4N1oWxsP
	wLx2CKF9lbZeLguyV6biIQwAc7wp4cMzl6Iclj0/YU7gBWTakDWg0SzCH7XBa+Ov0GWtL8u2DNw
	Geax1uKSGWcL7Sfxi8xQw==
X-Gm-Gg: AYBFou0Q5AzDs0f1tQ2ZbNzQQ9y6PQsLd8cq/fABIiFILaGgJchm2vosAxRdCw/j2+L
	pIpgoi5L066WxfYG5FR/x492TwHLwX1w8y1QNvVcxsZhIRwlbVK6WLWJj4AnbL+ZMqWjajug0Vp
	WACOna0CQej1sJ4z/jSSMJPLJ/ZlqfER64aSU6rm3/WypC0J5mcOClyIedh45EJmUF52ORc7MS/
	maEAWOr6u8+d6lN/Jjnwr/4o2RKCZUw/g2+3mwzpn86GzufDIzj6Z6FqNBDstmNE9wPtoLmmAPR
	/6j16euv09tfMeHRmySnOifMFW2Twv65/csNr9BqflymbA7T6RvmWZa8SVz+uqJFPEaepLzea/u
	p3HFYv24G3wdUOo8BBIov0nQqJv7wzHzTeLCAbZAiNtK580EqM7891CIfJMZKx36Aq+c/JgJgYI
	tWYIPlUHPi5xcdlEPA5OA812eDHFT/vJlD4pRc0Yux
X-Received: by 2002:a17:90b:524f:b0:3a7:a6bc:9d58 with SMTP id 98e67ed59e1d1-3b166d36c62mr3229482a91.54.1794337632730;
        Tue, 10 Nov 2026 11:07:12 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b181f6949asm67441a91.1.2026.11.10.11.07.12
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 11:07:12 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so1772388a91.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794337631; x=1794942431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3pk5DW/V6VeFLnQOE3OY9sAFDQ/PzjxAc+hYqzj2LB8=;
        b=fL6oOHl/Zk5wCCmnXdCIUgLgF9ZUJdmzG65ylvmYL66QfpNiNCYZI/v70VtTHsQ7yK
         JJxJIPmGmentKJt38uZH0xe2X8VWQpuJWUOKFTlVpPQfrOigYuLrUwEXn1Y3M71UOYrC
         kPZDL2B+PoMSHuc9JRTqoZPXAhW7IqzhZk7co=
X-Forwarded-Encrypted: i=1; AL+hErEz28dsbdaYoikK17hdw+wcfSOi/CBdlqtxUnL2ecBieDXpE6i47rjoxD/mtiYrm6/AJDKw0pvwIl7A@vger.kernel.org
X-Received: by 2002:a17:90b:3902:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3b166cc1512mr3321459a91.21.1794337631045;
        Tue, 10 Nov 2026 11:07:11 -0800 (PST)
X-Received: by 2002:a17:90b:3902:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3b166cc1512mr3321420a91.21.1794337630434;
        Tue, 10 Nov 2026 11:07:10 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm862880a91.11.2026.11.10.11.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:07:08 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/3] dt-bindings: arm: cpus: Add brcm,bca-smp enable method
Date: Tue, 10 Nov 2026 11:07:05 -0800
Message-ID: <20261110190705.2345733-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-1-4103df2588d3@kernel.org>
References: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-0-4103df2588d3@kernel.org> <20261105-genexis-xg6846-smp-v7-3-rc1-v5-1-4103df2588d3@kernel.org>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 05 Nov 2026 14:24:46 +0100, Linus Walleij <linusw@kernel.org> wrote:
> BCMBCA systems booted through CFE can release a secondary CPU by
> writing its ARM-state entry address to a 32-bit MMIO mailbox and
> sending a wakeup interrupt.
> 
> Document brcm,bca-smp and its single-cell cpu-release-addr property.
> Require the mailbox address on CPU1, which CFE leaves in a holding pen.
> CPU0 is already running and does not need a release address. Add a
> Cortex-A7 example with the mailbox address only on CPU1.
> 
> Suggested-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: William Zhang <william.zhang@broadcom.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/soc/next, thanks!
--
Florian
