Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432572;
	b=glyOxpls5HZhJwpv69eFnancP3rXgzkkVdwveFe9+omtNtxy1uOQeU/aCCnXlSvcjNaG
	 WYeUO969mvOdUcnBxtcRy9h83XXMvkG1Zk5HZAtwWM5UeuAoB/BVLYFgk8kMCVM9Imr1Y
	 13xi+B8IHZ8QtBI/mXQ0/fKqbfx1AYUtvfEEm3HaXwjbdgbgmNrJxByCnjiAIrwcF0ONS
	 iluzH2YBe2YgaysnTTroEwmSwhiNL2TRTjMavgG9j8ntnVHau6Zq2e/llvQJRGA3g4jSy
	 gStD8+UZN+1Ms+GxA4UxlAhhpKpS9l0udEGHaaM5pWGma/fxF/DpEafuW9ysqk10ZLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wHEXuOSq8IB0JemVzpCJR/4WrOKlizJ3OUREG2wJ9Qk=;
	b=kaccYsqJnRGcmUGc+/cqUgZTH59aCs2sBFSLgpsAeZa8sxYWbZgOZuVSQnVDxlrVYjMS
	 pjyhEYINHzYoEs+WqoiwgyUH9Jo8KbKTLOt+RRUZNRigOsG/3QGBTVr6YPCEqSOu2BdPc
	 y2ihJ7yXYNuRXAaygvDTaB9v3GMWpQtBmLwCWJcrLf1KNoBkpEusnIWU0IAnFEOtbkhxa
	 2Js1/rnwpgaQ2WHKm/SvffxrNyzNwHlIRNlrh9PHwG+nT8sKFRI0ZFhNChW/V/IfpBc8l
	 barDYK6B+P2ECAYstW/Y2SLJCD7AWAsNxQli3r/JMg9cRdRhuZPoSRogiyXjiIsyr9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yf+SMwhU;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6C1606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E6C1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yf+SMwhU
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5ece6c1d1cbso961378e0c.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 03:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432571; x=1796037371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wHEXuOSq8IB0JemVzpCJR/4WrOKlizJ3OUREG2wJ9Qk=;
        b=yf+SMwhUXQdwf3ksRdD6AYU7wddNetPL90dWfhTdFfBWhXvVQozMsBVTaTSZc+L0c8
         NDSI07AXbfg3Vp5k8VGZAnvjjQdyrxTW8uRi6CqVVqTbUB8cLwoe0xaWE8VrL78zWhkc
         ctqvkUTzYgiZmUWGyPamz6TKiDufOYD5oL8FHQue4dzDTqqEUg0rBXPjinREr2EVH0yy
         RhtxzvPl8WcrWkhK6wz5Jiu+Eg7oJGpi2qAwWQ0PvQSudcVUrItq+VFg2YrxfqvkQxLt
         aFefnQpcTCsefUzY7LNI34SUnsnPbuJWJOe+OWyjpcpS9dWSwiWuOmeZrD+LLI6DYTa1
         Ydeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432571; x=1796037371;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wHEXuOSq8IB0JemVzpCJR/4WrOKlizJ3OUREG2wJ9Qk=;
        b=qNlayW9ozDXNVjeb9BvwY39Irw43MAJyPEPmTDA00YpDNJd+pS/Upe62LlEo/trj/r
         HlgFI9AZIlfrz2Czhf2MmtD7tJo12Ew62EdIN6VtbiAvrcilg8pTeFfyUsmgnPbi78VZ
         Pd/ErF3YULJyQ0JgGTCm5LeHrCDXlwJ9zw+jIOXxRF+r58HpN6oL0Kz82+uTEUnFBcBI
         QoWEEyxHheQKIPMu0mKo3seVXm48JuGmIv4SZCX/qJE2KbTztdQEQwgTewPuxOAisCvI
         gKVfkxwifavzLbXOz9CAkVVcl0UbRXaUf+k0aZf5HOvuXlz7c+TXUYdOQ1bSVVEtZ6oD
         zPBw==
X-Forwarded-Encrypted: i=1; AL+hErH82+Z4V39Vog1dp3a3nBQHeYqLvO78eFkRxyJSuqp52Q4RgIDs/6zAVQj3uqBAMkpEh4BKGGBnsRs1@vger.kernel.org
X-Gm-Message-State: APuU4Z9f6tA0s7/XQvBod3XvJp+5IAwdYT9t+/eAzhqQFBKrvKvFPrqK
	kWscw1phUp4ApVE7ZmiU4xw8lXXJ55Cc6hIe4b1fRobOuIl141zI/eYk
X-Gm-Gg: AZFdTZfbHcZdGfVocQq3oO32O3gIEs3y8Fq0FeeipVpG2NliQ455uDONRWsDjzWr9At
	wgFMl1BJgyglQ7FPKkL33reCTHorP4Sm/QEblr1wTYltT0wukmOKQ2guihiJdZFNt9m9Xxx7rXI
	+lm6/QGEC3kLiwi+ogNhPheeihfbNOJAiJYy9bT/BjkzuGhqhd6qH55KElQM/Q3vdCoUHUwz2w+
	SjP7qpf9FBaD/7xmRrwY58Bx7m755XyaT5bboSWpGeutjOSFh+/wI0SyuxpyxiwMlyjRJx24QQa
	41dg6W+RqDloqNSZ+JmcTB7/+o8+LG73eFhWVJFOLK9AqV6sEnmTStfEbR8qyDHKUvLK8u6LUW1
	ZOdhx/tA42kqEv0inD3BH+FhuiKuC/QhGeH54ADgwjbtxC3LMhjKuCz2WdkJPnyTNLzWyWZ8nlm
	jftmGU+gP8HI0aPPiiwJxgTEviVbuGn2a4ZnDGE4TGSXmq+IHFx/63gLgMFC0YVQkgmvWJWkVDK
	fGomJ6XK7LN+AgOWPCgZht3VMQ7sAV4JBh8r2TtlvPOE/6sQafCQWr5PoXac+5m4aGUY2LfXkW/
	cx0/xDJo/QvqZ/ix9/Ft0DhU+ey9ObgMFpZsT46Io9x1ivL4X70athIEfrW15mtQ657M3aSG1Mu
	/jodMofNqB9bHAt/wbEAMt95eGAZo8lRRl69eAp1ZmOrNCaS6Y7vG+5jaGkY=
X-Received: by 2002:a05:6122:288a:b0:5c9:c60e:3a40 with SMTP id 71dfb90a1353d-5ee8af56a83mr5616946e0c.18.1795432570921;
        Mon, 23 Nov 2026 03:16:10 -0800 (PST)
Received: from MaquinaLab.. ([2804:1b2:aa42:30d0:88c6:e1ab:a806:9c3d])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b4335e1sm10485066e0c.1.2026.11.23.03.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:16:10 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: allwinner: add Radxa Cubie A7Z support
Date: Mon, 23 Nov 2026 08:15:47 -0300
Message-ID: <20261123111547.24280-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAGb2v66nKWdF3AvXDfb07iYVQE5FC5yDkhuutShp+Z-EgFXEfg@mail.gmail.com>
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com> <CAGb2v66nKWdF3AvXDfb07iYVQE5FC5yDkhuutShp+Z-EgFXEfg@mail.gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, Nov 21, 2026 at 12:14 AM Chen-Yu Tsai <wens@kernel.org> wrote:
> There seem to be 3 revisions of A7Z. Which one are you targeting? Or are
> there no differences as far as the OS is concerned?

I'm targeting V1.11, which is the board I have and tested.

I compared the published schematics. V1.10 differs from V1.11 in two
places relevant to this DT:

On V1.10, BLDOIN comes from SWOUT2 and CLDOIN from PS. V1.11 uses a
separate SY8089 step-down regulator at 2.4 V for both.

V1.11 adds a 10k external pull-up (R59) to the microSD card-detect line,
which V1.10 doesn't have.

So the power supplies and card-detect configuration would need changes
for V1.10.

From the V2.00 schematic, the parts covered by this DT (PMIC, microSD,
LED and UART) appear unchanged from V1.11. V2.00 adds MIPI DSI, a second
CSI connector and a backlight driver, none of which are described here.

Would you prefer keeping this DT for V1.11 (and V2.00), with a separate
DT for V1.10 if needed, or splitting the revision-specific parts now?

I also saw Andre's review of Enzo's v4 [1]. I'll apply the relevant
changes to this DT, including removing the MMC alias and revisiting the
regulator descriptions and constraints. I'll wait for Enzo's v5, test on
my V1.11 board and send a v2 with those changes and the LED patch
squashed into the board DT, as Krzysztof requested.

[1] https://lore.kernel.org/all/20261122003932.568c099c@ryzen.lan/

Thanks,
Vinicius
