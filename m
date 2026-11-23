Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452874;
	b=sOq1fCGE+gMbKvyeyKyB5x1TxI3GCu1g+fspbtQWmtwcn+QMhMzUAhi4v+OIQyu/0UCO
	 Dg4qe3raY595nc1i53zufJZb1QHK7SjoAA1XDy1+WgxWb28tcYkYinNVrjPrSaoeyrS1U
	 rqsBA/195iJXNMEZpxcXJMgR4ySwzEFmnXSHBJJokzDbJxpQ6bnhglWJmJS6ptx0n/1LI
	 sQjez8DtoCSGXuH4Uw0a2rnTZ32vgnMPeMqdEs5XFPZUoh+NzxPIBp7PFk06EJdtGb+pB
	 xU6O39gqEUF0o9Y8dB68bELqUFKFM6gpi6C4B+bGeWbfFVo766qSG+SqNqR25Tmp9IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YRMha8kezy82Lb7FBCLkHRd6Bd/GNI0Qqhk8lamcaMQ=;
	b=XDyBekxzx6iPuhtYZdKUQ95y1WS/RD51bri5pysD4nHBOgV8RR6Jyee57mceCsTRhEnZ
	 rRbJszRaaREGcTOvDugjt+JyGORKOHRBdeTUq2y9bzKiPMZ7Ff5l4ErTrZ0rDzOR25Gnt
	 CMz4jkj/AAun+gTly/Q3Wl85pKd0eINoBCOs+/vaVAMIg2kqnlStCDOFx3sqowRZhyECL
	 XJldi7r10mHGdtjFgSmGS4/kFb2l3XO9WYw00CGfXtRBKpK4F9auIflkLJDNz2L/mwmBt
	 gmC23NLndgS3P3tRBnsqmQsZD52dsMrhSggf/JdPHnXOKfgKIuBTPgnrCDZ4W8soRVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aXPKM/S3";
	arc=none smtp.remote-ip=209.85.221.175
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753B2606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 753B2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aXPKM/S3
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5eac7220e9cso1328021e0c.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795452873; x=1796057673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YRMha8kezy82Lb7FBCLkHRd6Bd/GNI0Qqhk8lamcaMQ=;
        b=aXPKM/S38flefNKGTptTtuMYnOiOkoGm8ZN9Rnhdn+Jyb3d7ciCDFkndBnvC++NWOn
         bYVaVcJgFBsk4PhWaHrcqSWr8C33Kel8/7Mm+RETdPhFFiV4KoDvcDPqXS4L1HwgIb1t
         WFtTepftqNcFksNx94VMDKEawcymO5Vw9sqqb8ea6NaWYZAz+gd6YVbLmpWr9YO6VwXR
         zrVZp9F9ktbVND5CLgwDRAjXd/w5YYZOCWqR1dQhns72ssJgGD6E8+xWzv4J6DrMP121
         0UnO7Sc6HatDBP2HQmNU/NM3WGO18QcQKYDHC68ALxnAmYzzD+zI+RYRcaOEk+gWQnNV
         KkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452873; x=1796057673;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRMha8kezy82Lb7FBCLkHRd6Bd/GNI0Qqhk8lamcaMQ=;
        b=AuTWhNxIbiRaXOF4cd51g60RsYjHsfM3cYbkuJ7zwA/WtgrL0PpMjaxGAGjgtWk2OF
         /xaTp7a9EfVC0/Ug/GdMFM6dachi6JuTWFcOqtangTGfL76DperI0MbzluypezsRQmwe
         G6iJ3yncCLUNj+oVED7P/roAczaRZ2vVeVeh+RSNVdlUpKQ0C3PfUzxa2rCXd6GEe9LW
         R2NQfVPtZ3wLfBJqzWJeREB5KArFrUhC+CkAxMYmQA2amqrAwKxB8jA7wbvDjv0zwhAY
         Nmn1hqNAJPjwIUwZ3gCbjrHg9OFB/Rv2Tp+G/4MWJIUZWR6eFRYz3KM3H9MZDARcEQNk
         uaBQ==
X-Forwarded-Encrypted: i=1; AL+hErEOj24C/JE7XdmGVy45VcwnsSZkGne7wbiWrWVB76bcxIXcGq9UKaaIGlNtw9V37fSzhefdh8FMU745@vger.kernel.org
X-Gm-Message-State: APuU4Z8n+W4HWGCQrAwM+bQz8cXrXetBdex8tnrp2y+7IO+ZoH/g+5Mb
	YgPymOwl4CuVh87olpdP/LYOR19rSIZTUOL/S/jBf68S4Van73kJUq6z
X-Gm-Gg: AZFdTZf7L35evBQ1WyFpkzddRcZfSinusavzUzBWM0La/GSak9l+heJlNEedL9tx0Z1
	DA4zmlo1YwSUcdQ6N6/X774Qt0HlV+Whj8f5PbRcPFOWxy2xIJYmnrnIjDjxkX9HmzXJYzFTXM+
	q74BiXnl6eIgtm4BRy/pSZXzOHK0+C3ykJKviJZjApp3FpwPB429YWeDLTMjTdthU888qDOt0mo
	vCaFlrKhRIsgkFeQDY8kG6TKYim/d+xkpCab7eA6Tjy6Hi4LNphdi6O4BXOvtlse1cdqyKushlR
	lpUHglgG0fC1dnABq4pDWIkfxups61j1PiNtOeaucrOPiIRa7oL22WdNfcGgZkVrXoZzvCRyeI9
	SpTzm6zLMTfCMlhDOVhLgFlgDrbzThWnCodO0Vuu26Pk65HG3hzWIWSz/pX+SVLxkqBo82GJfHj
	al1hZHRGOx9RyxpJ7q9BtkfvXFNlLyy18LFqEdZgaB+yDaWz3vybEGBSbdFMXpDLplL0dXzERAW
	kxKKdJrXGlw/U/6GUgWqZoDA/IXeKnfxBkzW72fzpdg75GisKmPAoJq9SaGy9DEAGBklIPIKPws
	I9BGODkaf0r+XNOli6BESaHakdHuZaGD8lIJIK9GjSUyU3cy51zqsfRxO3eniFK8vAP+yr4h2BR
	2MVFOcAg3Q+p1ZAET3tOwfq1sbmEB15spFhOI
X-Received: by 2002:a05:6122:488e:b0:5ea:c120:4514 with SMTP id 71dfb90a1353d-5ee8af3457cmr6237914e0c.15.1795452873322;
        Mon, 23 Nov 2026 08:54:33 -0800 (PST)
Received: from MaquinaLab.. ([2804:1b2:aa42:30d0:88c6:e1ab:a806:9c3d])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b5a8fd3sm11386824e0c.8.2026.11.23.08.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:54:32 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: allwinner: add Radxa Cubie A7Z support
Date: Mon, 23 Nov 2026 13:54:15 -0300
Message-ID: <20261123165415.69710-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <374d9bf5-5c91-4f93-aa25-f0666802e153@arm.com>
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com> <20261123111547.24280-1-vinicius.eduardo.pedrosa@gmail.com> <374d9bf5-5c91-4f93-aa25-f0666802e153@arm.com>
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

On Mon, Nov 23, 2026 at 1:11 PM Andre Przywara <andre.przywara@arm.com> wrote:
> I wonder if this works anyway with using both the internal pull-down and
> potentially external pull-up resistors? As one would win over the other?
> Can you try how your board behaves with:
>          cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;

Tried it on my v1.11 and it doesn't work: card removal is detected, but
reinsertion isn't. PF6 stays low with the card in, in every attempt (two
DTBs), although it read high at boot with the card already in.

Neither one wins cleanly. The A733 datasheet gives PF6 a 15k typical
internal pull (9k to 21k), so with R59 (10k) the pull-down leaves it at
roughly 1.6 to 2.2 V, below the VIH minimum of 0.7*VCC (2.3 V). That's
my math, I didn't measure it.

I then tried GPIO_PULL_UP and GPIO_PULL_DISABLE. Both work: three
complete hotplug cycles each, plus booting without a card and inserting
it later. With no flag it also works, but only because U-Boot sets the
pull-up (sunxi_mmc.c requests the CD GPIO with GPIOD_PULL_UP in the
2026.01-rc1 tree I use). To check that Linux applies the flag itself, I
forced the pull register to pull-down in U-Boot before booti, and Linux
wrote pull-up back.

Could you try PULL_UP and PULL_DISABLE on your v1.10, card in and out?
"grep 'pin 166' /sys/kernel/debug/pinctrl/*/pinconf-pins" shows the bias
Linux applied. If PULL_UP works there too, one DT can carry it. If not,
I'd add a small v1.10 .dts that includes the v1.11 one.

Thanks,
Vinicius
