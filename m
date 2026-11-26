Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725242;
	b=0y9LGeDBfjKAyBPp9Bhivl1qtOtKmcjb+VZ3qvxi4abJWKCOlUg/AcytwopvXcikPmjY
	 XCFF532VKbZoz/CDOOaDNYE4Fo0mceazTALoljCULPZix5Qc1Pwgowlwjo/LVXg3idMNg
	 VpUJsGKkHTljR4+qPvrJAtDfS40X4HnCil5sd17mkobN/m0ke0l69oYjbyuf7E6h1BbJE
	 eG7Im1NcTlIXMGOEK/hz/zl3kkJc9CjaN4LS+q5tldt+tC1eDSPvu3VhI4JvGYFY9mrVv
	 kUUi70N8RTY00ALSvhafC2REOymM79/d9uk4GnIi1q+lAaHAVhEJXzf2OkPQAiRVlnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=sbsvamPXVVsk6WUGKrA0iCW9sEFQvSqMVX1Sf+ynGWM=;
	b=GFgxl4pKvLbvGfXV/ZUx41sIV+OQCPLX76p/3ckNE+BTRf/XUltbYX75Pnxy7cJDJlqs
	 sDHmqyNDteO14d9mVepLcFdkXFqmQjxJxm+s5s2vpVRv0D454ERjifXM0CactRbbPuTQo
	 HxncMhOkQqbXqTX0NTvVUiYG4MdW7M/As4wVkR2rTev9Ab5Sb12Jo2zlFBupecc/M/CTN
	 A0WFLhGrNUTJ30oPs4VCBvN358ALnRt3UOJcKWynH2fZs42Q6gE9swOAgnmqZZc4kXISK
	 Q0GguaVnrlQAR19fXDoUNoF8/DYcWOos90M5YvI5Rc0GR4PZu2rbh2W2xZ1TT/rN9xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fz3HcMez;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D60B606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 20:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D60B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fz3HcMez
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-847ac7ccd85so4171983a34.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725241; x=1796330041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sbsvamPXVVsk6WUGKrA0iCW9sEFQvSqMVX1Sf+ynGWM=;
        b=fz3HcMezGU86xcQBiXAtOQzCmQrdU+nIxnG+Xrqwv4M/D/HCecflXsaHJKFxSLds4G
         A6PKNB1YV200bUo3FtONGIid22PLKAI9AhlA1DweyLX539FRMqybOpNFd9f/hRRvBPrY
         wLdcq7eI7bnyzDQxsftrF9QGG76bNdmjkPYX+43De9adVNwffe0xps3ayGtqwQ4eaq5e
         vPiLS6l2rQUDmTNswPh6xGEcxIJn/PVAlnhpT5BjDE0T459fE+e/ujIN4L4jp+wzQDKm
         yu0NmQqnv9AFO3VdakCzqT0pCdRWkrrKTMfhfNilnbFdjuh+152dPAXBOE3IMjJmgis7
         HnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725241; x=1796330041;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sbsvamPXVVsk6WUGKrA0iCW9sEFQvSqMVX1Sf+ynGWM=;
        b=y1yt8hxFD3zLC1QRcZfuqIEnaz9s891zBxlfan+RcQr/OteQ08ooPgQFWQGWhp1Nm6
         O+YMdiN/ryQ2qeF4sBCo4s2rw0D9lOstuMZBaF3kq7KfZ2XSjAlL5grH0qNKa9ees7QJ
         uJHgQ+1RDOcf/21Xeqq9zX9V9BAV6MGQi1SHVb+X+mHrkjidUFudb+Jiju7U5nQtlrrA
         nfye5gn3Fnw5ipOg7LuDe8dM79DDaMuWPIo3rVzdMPsqob4YwJKj4eLglr62tZIhEImS
         AyNnPa43yXPlZH5TqIiy+vzdrYpkdXyufHOvpPm1qNU+eaaijOogKNRZ80kSBd6uQHEg
         2+UQ==
X-Forwarded-Encrypted: i=1; AL+hErGG3hPD6qIerzWMkxrmj4UpvvFeHaACq2fhSiblvW1uUH6+/kobbwjmcKHHgsE4GlZf7i3eFJuWJLY2@vger.kernel.org
X-Gm-Message-State: APuU4Z8087QV6toK5CSAtNwurh/nMoo3Qlt4jYE9Vo3j1y23GJ1H6DkW
	E1nPVtg8kR1/29vT3aKvPbjH6W0Q6efeekZYH9f7b7h2G7UP9ZqGVfBU
X-Gm-Gg: AZFdTZeg8/fBjLiC1/fw+jjRX5e0ju0DnApOFh8Vs3016lesjqW0A751Brwl1vl78eL
	2Ork4kUrNmOiFHcPQEYQFJmNWIMemwJTzM8TfaZch9zCEYYIcPM8f7/B2HF7ULFOX3aIDE4e6tE
	sjV0UjdwKu81XM4FIq3G/0LhRK/W47Kn/UOLnHhpRfKdRikvJeY0lij7KPF1ALcJkfkFqu6Og7D
	v7OUy7O4JS6Abqo3izhDMsmkEbbQulGL/t9x4yu/lXWj08U811fCTB8CpSWYmJtOOC8jNbDqVXq
	kmZz3zKnVaBoguP7dfb+iUVD4arxrUnyy/xOAnE7GrzQpjLxmzJGs0Qsw6Km1Ax+3s7Wlfb30gH
	xEoxpa1iG3AtPFzPlF/rimsCGLdqx3DACf7XprHVN+pUvmtSbUVpDCliuIjasRR6nw9mYuDfwCf
	ec0Kv6jfO8agBQOg/Z5cz3oQsc6NytaeGg63FhTLMDBjzxWRxEDQDFluhzg6gmGGvjiVISKm34r
	2tYqmWGGNRZ3bTcJfj7Fm4a2bouK8RLbjv90NZJ94d8eXRdaCTRFW7XAGj6sWADdGDbfKAkJxtD
	kCe2ILFmfuXTMr2HF4rnsgdGHVdgSkmv2CWiskQHmCyAtgXopiii3uwbvWUcLcDvI5/+LC87FaQ
	TpIjxaB8=
X-Received: by 2002:a05:6830:438f:b0:862:aa2b:eae4 with SMTP id 46e09a7af769-863159e9bd9mr23567439a34.24.1795725241022;
        Thu, 26 Nov 2026 12:34:01 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631692f049sm16133926a34.25.2026.11.26.12.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:34:00 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: wens@kernel.org
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v5 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Thu, 26 Nov 2026 15:33:58 -0500
Message-ID: <20261125-a733-03-board@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAGb2v64p4GvDMDKzDLfedDQCexD+=gu3+YxMAt=ARj4bZxR_eA@mail.gmail.com>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com> <20261121-a733-cubie-a7s-dt-v5-3@gmail.com> <CAGb2v64p4GvDMDKzDLfedDQCexD+=gu3+YxMAt=ARj4bZxR_eA@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
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

> "PS" is a separate output from the PMIC's "PS" pins. It is fed from
> the "DCIN" pins and has some internal resistance and a zener diode (if
> the block diagram is to be believed) for some poor regulation. In
> practice I would expect at least a little bit of voltage drop here.

Sheet 4 shows VCC5V0_SYS feeding DCIN. PS feeds the buck inputs and
UP11. I've described the two nets separately and used LDO2V5-INPUT for
the downstream rail. I've also renamed the oscillator, reordered the
regulators and removed cap-sdio-irq and the blank lines before status.

> > +       cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;
> Please actually test this.

On a Cubie A7S with the posted v5 DTB and Vinicius's EINT-mux fix,
MMC0 reported four-bit SD high-speed at 50 MHz and 3.3 V. One read of
the first 16 MiB matched the vendor kernel's SHA-256. The mismatch on
the earlier 4 MiB read at offset 16 MiB is still unexplained. The
EINT-mux fix is now in pinctrl fixes as a256b8c8083e [1].

On his A7S with v5, Norman verified that PF6 reports the card present,
MMC write/readback matches, EEPROM reads work, both LEDs switch visibly,
and warm reboot and power-off work [3]. The v6 cover lists A7S card
hotplug, EEPROM writes and write protection, and 1.8 V SD signalling as
untested. The v6 DTBs have yet to run on hardware.

> > +                       reg_dcdc9: dcdc9 {
> Missing voltage range.

DCDC9 reads back 1.240 V on A7S. Vinicius cites a 1.2 V ELDOIN minimum
from the AXP318W datasheet draft [2]. I've used 1.240 V for both bounds.

> > +                       reg_eldo1: eldo1 {
> Missing voltage range.

For ELDO1, schematic sheets 4-5 label LPDDR5 VDD2L as 0.9 V. The
regulator reports 1.075 V after firmware DRAM training on the A7S.
Do you have a validated VDD2L range for this memory, or would you
prefer to preserve the firmware setting until the range is confirmed?

I'll wait for the AXP318W series before asking you to take the board.

[1] https://lore.kernel.org/r/CAD++jL=xA7eZUeb30xOnCZ8uRy0UE7q8h=8AA4p-tmiBf3Sb9g@mail.gmail.com
[2] https://lore.kernel.org/r/nh-1384c024-38de-4962-9d4f-a0bfb55471a6@google.com
[3] https://lore.kernel.org/r/CqGMQaDysL6l016qtEM8oOEnYUMKACgmwLUbb0wruVAzPcwiqrz00WCOhTrhkVEaZt1YB3xfucXdEc-ZFi-sCPgn69RNqtW0v4Gn_HjQZXs=@proton.me

Thanks,
Enzo
