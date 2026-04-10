Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D953C7E0F
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 13:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775829263; cv=none; b=QEf9QFPTo/PUMNZV6IS1ZJZPj8rYkix1DBfAeqkHEN72EBOo3cMV3zwDYInxzIzsiYdqo8/QY85dfC4YfMCirBjq6k4Sv4DXmSKRKn/PrJxXxJqP14wlhQUiYZa+qZVQgQAKdsNFfnh2W4UE1V7qukuhpJVfeLzztCTJh/tPXBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775829263; c=relaxed/simple;
	bh=2R+lxkRSbhH2eU6DX8iluraKn53wKYzhEmboWq6QIBw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=fQ2igj2ROZSsa89v1TxK8JK+YpznSj2XTCdweXunr7gsrazFDT44UYp0qG1npbZFHMWkgmPwRZD9njjkRXRmm6fe4nOWipb0dTk+aRuLBCtRApvYIEQTmVdqdTHVvGrzs6LTgdXwOypPlH1hdozPidwBumyShUXLCWVGXiAwdaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=nmYzTRs/; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="nmYzTRs/"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d5e87a507so1591190f8f.3
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 06:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775829259; x=1776434059; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V4LNMj6lgIltlmZWf+E5PDMda2hOSl/xZGWYEn7LnYk=;
        b=nmYzTRs/hdUNxnFXhgJlItZa2lK3e/SzNdJusp2xT3vjoEz7IqvuNd75LZI+lYyt8h
         +0sl9Oto3nFqA8vWdu7AEoVdxoTTQvIA6iyT0CncIlsYGEJyZak0FrlTyHj59HuPlycD
         lN6EyXjhiBJOPNuFgqiyusR1fdcnOvwjxGMGVKK0sTm/DYHCWvbgNMAR+hj/enAPMCmS
         f6YMUSkP5VI5XjvkEtyLVBs3beqk4wxPlD6gWJ5KYkOt/X1+QJnTqDNV2IsDYnzFr+3e
         aLWqcedB0Hh0LMQmMprDDyyv+2bu+w1yVLFNtfrajHMPRGucqaAML7GbMeK00ebkIvPA
         0AyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775829259; x=1776434059;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4LNMj6lgIltlmZWf+E5PDMda2hOSl/xZGWYEn7LnYk=;
        b=EglEtFwDgDLHZ9wseXG+GxJ5OxIsmOSi0XHZ/b9WIA/6AyRNsaKgmJFwoCeCrJ8gjn
         q7wRfpB6wA49iBBBVnVik3Lq6GizxbQzMn0BtFZrtYKPVy2xobAHFAaUOoLI8jHeOXkQ
         6nDH4mayyAu4J+taj4zZGbdClAmgkNcn6laxAiEs9ssoZXY1RE18VYb77fPLMO3jubGu
         WO3oqxSL4gYgbhlrtZs1nQmJhdyKyBBXi7Rg9Ds8gKHIjUq1e3xfaWWktkl0jZ81d9KW
         ojzanXeJed+LqYbkqDNGjTHwPmSmtJSyuAgJsrbQb/RO1znQN9PVuk1mU3rZbXJvApbj
         ecRQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9KtMCpg4z6vCdPqmlkyjesAz36E7J8pVZb0A7YY0p5hfViYazMiYpUFM7W8vkb/IzwFQxHQ0SZc2X@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3aSPM1W8dKuFPt2i2eeUwVQX9ZBWaQAESGs0dChOwpUzMM3a1
	9ml+EIvQFP7FshMuG/GUochUPWHHxpfCkU6ZgrRGCRp4NyjnF0R4GmGByhzkQrIOYQA=
X-Gm-Gg: AeBDietOIsWT4XVdEJ66Rp0HmlJCLU6td4tWfXde6hcP8Zr5nzRJ8i551y7h0YJ5SFj
	XGhN2zp7fH3HubvdU81GU6/0aLZHut+PX6XEwDWf0FRRPeOYx/v2qDOAdqXUZ2UOjTrgclZCOIO
	8p4ASCHFMu0TvpBsDSrshZB4BCJXNMaPrrMowQM0DKgfQEJBIFMr4GAx1MxawjwfipgZLDbiYzL
	EpDmh9nhkoabrcfDC8MXpApp2vGFdzcccTSoARDG3NVKzqStL49WTwJzsPLUwTa1nebnb4xxjSY
	EZLNjBgPnNjqcodJlfkaM4Qaj5EDdWVdRSdslTkCHRbk+D4ggYpWkZT8i/VZhjRASNqRtNaih/c
	aY0qSkyWI2xOrfsXE1WG1lJVtoIYf9rDItGHuAl3HkZx1+ccjGFjfShVsSpSLrYTe/bvwyZRXdn
	ylpQvbMGLeXcKViA==
X-Received: by 2002:a05:6000:1a8d:b0:43c:fde6:212d with SMTP id ffacd0b85a97d-43d642cd3ddmr4879713f8f.33.1775829259168;
        Fri, 10 Apr 2026 06:54:19 -0700 (PDT)
Received: from localhost ([195.52.170.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5061fsm7375169f8f.30.2026.04.10.06.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:54:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=6be3ff7f8d2777e4e57718e09ed562d196b76b38ee2a26325068e941d4a3;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 10 Apr 2026 15:54:13 +0200
Message-Id: <DHPIXKPIY6JT.2DWJ2PKTQAOLX@baylibre.com>
To: "Vignesh Raghavendra" <vigneshr@ti.com>, "Rob Herring"
 <robh@kernel.org>, "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Mathieu Poirier"
 <mathieu.poirier@linaro.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Suman Anna" <s-anna@ti.com>,
 "Nishanth Menon" <nm@ti.com>, "Tero Kristo" <kristo@kernel.org>, "Vishal
 Mahaveer" <vishalm@ti.com>, "Kevin Hilman" <khilman@baylibre.com>, "Dhruva
 Gole" <d-gole@ti.com>, "Sebin Francis" <sebin.francis@ti.com>, "Kendall
 Willis" <k-willis@ti.com>, "Akashdeep Kaur" <a-kaur@ti.com>,
 <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 0/7] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
X-Mailer: aerc 0.21.0-126-g9e77103592fe
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com> <CAL_JsqJq=3z7SQX_26MGGRcmysnGHVke8aTwyDCesvOuQjEN+g@mail.gmail.com> <6a4aecff-f662-4620-8572-3309ea6a81e2@ti.com>
In-Reply-To: <6a4aecff-f662-4620-8572-3309ea6a81e2@ti.com>

--6be3ff7f8d2777e4e57718e09ed562d196b76b38ee2a26325068e941d4a3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Vignesh,

On Thu Apr 9, 2026 at 11:46 AM CEST, Vignesh Raghavendra wrote:
> Hi Markus
>
> On 08/04/26 20:33, Rob Herring wrote:
>> On Wed, Mar 18, 2026 at 10:14=E2=80=AFAM Markus Schneider-Pargmann (TI)
>> <msp@baylibre.com> wrote:
>>>
>>> Hi,
>>>
>>> Split the firmware memory region in more specific parts so it is better
>>> described where which information is stored. Specifically the LPM metad=
ata
>>> region is important as bootloader software like U-Boot has to know wher=
e
>>> that data is to be able to read that data and resume from RAM.
>>>
>>> IO+DDR is a deep sleep state in which a few pins are set to be sensitiv=
e
>>> for wakeup while the DDR is kept in self refresh. Everything else is
>>> powered off.
>>>
>>> The changes in this series were suggested as part of the IO+DDR u-boot =
series:
>>>   https://lore.kernel.org/r/814c211f-a9eb-4311-bb84-165b1a69755f@ti.com
>>>
>>> There are currently no real users of the memory-region that is split in
>>> this series. The size of the memory-region in total stays the same.
>>> The new layout is derived from the software running on the r5f
>>> processor:
>>>   https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/exam=
ples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-cl=
ang/linker.cmd#L172
>>>   https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/sour=
ce/drivers/device_manager/sciclient.h#L459
>>>
>>> Additionally the two important devicetree nodes for resuming from IO+DD=
R
>>> have the bootph-pre-ram flag added as this data needs to be read before
>>> the RAM is in use.
>>>
>>> Best
>>> Markus
>>>
>>> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
>>> ---
>>> Changes in v3:
>>> - Squash the enforcement of the memory-region-names requirement in the
>>>   patch adding the memory-region-names, as suggested.
>>> - Link to v2: https://lore.kernel.org/r/20260312-topic-am62a-ioddr-dt-v=
6-19-v2-0-37cb7ceec658@baylibre.com
>>>
>>> Changes in v2:
>>> - Make memory-region-names required if memory-region is present
>>> - Fixup memory-region and memory-region-names conditions. Require eithe=
r
>>>   2 or 6 regions for memory-region and memory-region-names
>>> - Reword and restructure the binding documentation for memory-region an=
d
>>>   memory-region-names
>>> - Add memory-region-names to all uses of memory-region
>>> - Link to v1: https://lore.kernel.org/r/20260303-topic-am62a-ioddr-dt-v=
6-19-v1-0-12fe72bb40d2@baylibre.com
>>>
>>> ---
>>> Markus Schneider-Pargmann (TI) (7):
>>>       dt-bindings: remoteproc: k3-r5f: Split up memory regions
>>>       dt-bindings: remoteproc: k3-r5f: Add memory-region-names
>>>       arm64: dts: ti: k3: Use memory-region-names for r5f
>>>       arm64: dts: ti: k3-am62a7-sk: Split r5f memory region
>>>       arm64: dts: ti: k3-am62p5-sk: Split r5f memory region
>>>       arm64: dts: ti: k3-am62a7-sk: Add r5f nodes to pre-ram bootphase
>>>       arm64: dts: ti: k3-am62p5-sk: Add r5f nodes to pre-ram bootphase
>>=20
>> TI folks, Please make sure these dts patches are picked up for 7.1.
>> There's now a crap load of warnings in next with the binding change:
>>=20
>>      58 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a
>> required property
>
> [...]
>
>> If they aren't applied, making  'memory-region-names' required needs
>> to be dropped from the binding.
>>
>
> This breaks DT backward compatibility. Why is memory-region-names now a
> required item and cannot be assumed as "dma" and "firmware" as default?
> Is that intentional (should have at least had a Fixes tag then if the
> original definition was wrong)?

Conor suggested to make the memory-region-names required for easier
distinction of the layouts:
  https://lore.kernel.org/all/20260303-payphone-pancake-b6068c545bc3@spud/

And a follow-up discussion here:
  https://lore.kernel.org/all/20260313-kettle-craftily-aa087e6b74db@spud/

Also I don't think it really breaks backward compatibility. I don't
think there is any user for it and the previous binding documentation
only refers to it as reserved regions.

Best
Markus


--6be3ff7f8d2777e4e57718e09ed562d196b76b38ee2a26325068e941d4a3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCadkBBRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlNI
+gD/bX5c82CD398I8HEnZJc39F6jPtpkaVpl2P0YheGnP04A/A+ZeGo88XB9ZT1V
/HaA36gs9iIvFQU73v8Wnpl46jAE
=78z7
-----END PGP SIGNATURE-----

--6be3ff7f8d2777e4e57718e09ed562d196b76b38ee2a26325068e941d4a3--
