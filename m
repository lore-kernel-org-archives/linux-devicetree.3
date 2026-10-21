Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602257;
	b=m8UFm6UjgXeB9jGEsSR0OzewddM99xd3BIKcmpU6njeLGPUortETL/w13zrHcdlTuBiM
	 zSw18HbB2uggFbMlYFWYIitS/pTHG9rIktnWHXqflnomqseS8QtcmnzCrAiIH8dhd8xSY
	 Ql7Cby1w2068x6XS+Yb0j2N4pFf8hw+//nI/rYQpGK4Rg7pjEohpRvW7qz0AV4Hjx7uI7
	 H32qRfHscuAVHdblp+CTFfSVYb7Tq51xNXXS+gfceOt8W11WHMso0r+VPs5H0FYxH9dZl
	 HI0W3geYaQHPTdD1VXdg/Kup++YnTFeMgVftcXPQBeBvlocrtu7AG9UcNLsq2rcm8IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Jz1PsVKfLByVoOLZveZuQnHIhjOghHzTozlXRwWyQFY=;
	b=MzpJGXrAPWa98QPHk4TfSto2y01nYVBtJ/jiBpMeDHR2jizxMkd4ivFei0bYuMIZtf/U
	 CzR1S8rYrBIY86pPZWXVsjDKIWzZ/QcjV5KDoNaTGDq9aG9IbLXTzZRwa+q4sQUcWMWwb
	 mc81F3LflUeTPhI1aghZulwJRBQeEpn80fURfUKI32r5OjNYaKHfX6ZVEPx184EAZqApN
	 BUFwK+qhE+ZVSmtAKtgKxTV7mIiwxNDZOqvYfHXvTStGHr/zg5O+USK9tNr3EaOFY3EQz
	 SgvvNWqCA8E9v4ACYM9eRb9zyu6Dk0RDT6IjzhUlrulig6TJz+hMIdH9dBdb/CZSBIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XhTlCR7v;
	arc=none smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EAE606A31D
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 17:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64EAE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XhTlCR7v
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso328905e0c.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792602256; x=1793207056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jz1PsVKfLByVoOLZveZuQnHIhjOghHzTozlXRwWyQFY=;
        b=XhTlCR7vSdYc6xYIXY+4YWo5PctxS/eg+nF0tTI68R0wVdyxDVGBrzKBf/vP34pSvJ
         XAznc7rukb2wtB1NqGIS5vQeaCB9MBnXyvKRfs83ldM1IPeXlB79qnKE6vXs3lHq95u+
         ogvPuri41Rl7agULw8/F7KE8DKjinlMy2SkfjdDfTwRNcxWRaoptKoTfhw692uooupYf
         HyD6hwViiseOQyCZWc8633SnsTVBIYggx/vZpkyCnhr6pmhXkmCNT85aqgpnLHEz6cRZ
         Q8nKtiMcg7X/Eu9Xtswr36jVhpGiPY3wkZz7dmRtvVd/clbcMzf2UcmXk+ZgzlfO2ekM
         ucAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602256; x=1793207056;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jz1PsVKfLByVoOLZveZuQnHIhjOghHzTozlXRwWyQFY=;
        b=Zyn5shVmtfyLAGgQBRqKpIOIdW9jugn+RvkyzXGkvdHBw21yvNgbkb8XrC5/usOcDG
         ek72pLrY+X+rxowaF8Q1z23tiqYttcYTHv+D+1aBD2iaZMJbjVdr+VutmDyIfVWv3aLO
         FhKq0UjNvTqKf0uM7mExCUz2W0Xtp0RA3b+OJSbBZQhjPa2af8ea1MrSko6wC6OBxFEm
         NM3CFn0Fqu4rwC6zEPjDyD1ImmYyXMSOpZhTCjeRMPJYpYxqzaArRfYFljUyF85oZ8fi
         Cz2x9M+Wxeftlw3D8vfffgHdBITI9Wn9VPaueZmZQCwl2tiAXjk2JavnbKMZJBRHFUaU
         jOTg==
X-Forwarded-Encrypted: i=1; AKwUvByCiaMLw7Ns+RxKN36OrQCjiaX/rfIWxzQfZ8bZzb3wFBsuF6umAMVu8g5qbVEaGNT359FC5BIbzNeh@vger.kernel.org
X-Gm-Message-State: AFq9FYKJbywP4ylenB04QaOwea9iQ4rKm/qsvZZQt4WE9KP+QVvsWiY6
	cKpFUQZBSqyjBy2MD6HH9ch2spiM+ri8cpzff4u2aX8xeoQxbez871EI
X-Gm-Gg: AYBFou1VlSGa+XzN5SDwIOxdZggDoCOS0TthQjB7fY5IG0b2C2HbK8PYu9bAXVphLj8
	zd34OzOvNrvHH1l62rd9uQcCJXR28tdhSJac3Aspg0Mw0MF7RncNem9QgXZBiaNBJcaTtnxfdkl
	Lk3ZiRTHLgV4WFlHaxYF/dfZNCpCtoxPbWX3JaSKQCYEYEl8B36/qEBwEx7/svVtiY6ILOSHr2Y
	zudcNc4O4QzR80urR837dbEsyknHrEm3b09Zzqd9QG2JHM3iA4n98gN48xttaaUWuICdyYimfpT
	1Yz0jTSyqU/0/zmwmYGBsjMe0LlJL6EKWbBCgSiOkAj2up4E4eCrLS1+2bjz8Bfa04OCuTKahhO
	cgCPvog3DiX1ycv8EF+4RsE9KPdmKdgV7ftY7gX4DSQQ2jTJUMVHOolXrdA78EjPcrsfqB/9APd
	JL59hxTCsKzA5CRzfnVylD4YpgpUZyU84NSjeZrFatb52zxqor0/3Z3m+ocUmsfQGDTr108ubBy
	4jvOGtFDvHyvWvsxJwzhs3Zn5FJE6iVfLojmyydKPgIlhunvzGf0/IoBkAgH8/ggYcWMBWTID7i
	mT21BXTPVpGp1Q4YQ2sIPNHlh1PwHjfvZwL6PArtTsUNpz7/3xiUB8MsM7KHvSE=
X-Received: by 2002:a05:6102:149e:b0:7cc:9d46:f091 with SMTP id ada2fe7eead31-7cc9d470bbamr602076137.24.1792602256305;
        Wed, 21 Oct 2026 10:04:16 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc924348c4sm3367159137.11.2026.10.21.10.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:04:15 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-serial@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] serial: 8250_dw: Keep the BUSY-safe divisor hook when DLF is present
Date: Wed, 21 Oct 2026 14:04:03 -0300
Message-ID: <20261021170403.2052449-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <atjqZPuAbHDdaexv@ashevche-desk.local>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <cc358c2be6b0b4ea0323e4f694a581ffb667112d.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <20261020104753.28703-1-vinicius.eduardo.pedrosa@gmail.com> <athe0QikG2mzCAtd@ashevche-desk.local> <20261021100049.16504-1-vinicius.eduardo.pedrosa@gmail.com> <atjB-BnXclL3FcUm@ashevche-desk.local> <20261021153732.1978410-1-vinicius.eduardo.pedrosa@gmail.com> <atjqZPuAbHDdaexv@ashevche-desk.local>
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

Hi Andy,

On Wed, 21 Oct 2026, Andy Shevchenko wrote:

> No, just pass that as a 'bool autoconf' to it, and assign those callbacks
> there, while calling dw8250_setup_port() unconditionally from _probe().

I think the autoconf approach works for Octeon as long as everything
dw8250_setup_port() probes today stays under it, including the RS485
detection and UART_CAP_NOTEMT, not just DLF/CPR. With autoconf=false it
would only install the common divisor setter.

> I think it would be less flexible, also it will add an additional branch
> (actually two) each time the set_divisor is called (not that it's critical
> but just wanted to mentioned that).

The idle callbacks have to come from the drivers, since the
dw8250_idle_*() functions are static in 8250_dw.c. Stubs for LPSS are
fine with me.

> I dunno, I prefer just a longer solution, but I don't know how big this issue
> is that we need to backport in that way (and not taking the whole series as a
> fix).

On the severity: the IER restore comes from a7b9ce39fbe4. On the A733 I
saw hardware IER left at 0 and the console stop taking TX/RX
interrupts. I haven't tested this on hardware with a real DLF.

Given that, how about keeping the small fix as patch 1 with the stable
tag, and putting the refactoring after it in the same series? That would
keep the fix independently backportable if needed, while mainline would
still end up with the structure you proposed.

> I have Intel Galileo board that uses 8250_lpss.

The Galileo should be useful for checking the LPSS path.

Thanks,
Vinicius
