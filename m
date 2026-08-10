Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3BF3F4DDB
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371692; cv=none; b=H1FdL0rDquMk2q3/ZlwMwRHsMKfkYnyACQYjj8Ee/b0Te+ET/7cEBY69UBAIbHoU9CsNhocOJN1gr3vmhVcLjhz4mZ2AneS2gnAMOm83uxUHeSPRDhoTycZEDWKBbtnWT327+MAnO7DEr1PTH+7/g3P7CrXAYfHaadhPV71iiu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371692; c=relaxed/simple;
	bh=SpxVR6pxx9Ul7PjbKZTHV8Hv8h63JXbsETU+DAVrbVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NWclUqMam3e7YWHycAgCCzdkxhvcas53WO5c9xK9n6H8VoVOkXVk8E3WfhmvitA/ZLM8SQrEGg54ICGeGBCwJPCzbU9L5H+6ZwrAxXUCHnvrMV625kgbL3z7iLYZ583U+RAGx+7WefkB9odt9cBym9YRBKuqTDPqDnn5QbGNwgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-74ab6c88052so543444137.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371679; x=1786976479;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3qt0obc65zslhsJe5ID8EDkS8LtWy0Gpp/1LJUID83I=;
        b=R28QoZlSqMyjTylSrMIJaXcNQJtlcywl0HDdQTCb80cETXZPjY+FuIOMekOX8rEaW5
         EnvrBfPI8sviCy6tlVx8GCFuBzG4n+ipeWJsQVMXOjMWf8DSqJ1vsm+PlOr9sbTmyc0Y
         W790OgFKwo2vr323b9OIKjT/NERYR/X0zyco6ozBhMmsJuxTNwAHyaJatcsAwlfBbTdY
         A2XvhZQNf7FGWh822q9MLHlN/AE+0RGog5L9HiQXUWVAQNJOltGe2QUovGTh+K6QEtmB
         +YNMlWpbRU7ripEbWQGSTqPUfIwzVVY0m95O0xQ0Zp+5AUBCWLeU7HQOJaqOyuqB5Bm/
         noaA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7lyi05LoYyaPBcWMpj1su9nsQ2Qog9eoMxma5GAxW9Zhux7GnamSFyggiaXmLvGewBJuzz7728urz@vger.kernel.org
X-Gm-Message-State: AOJu0YymYGCt4e5kYW85xfIpJ8PyWhuYWMrGrw8PaMmQuzLOZCG5bK7z
	u2MD+jBdikqseihlLOk5BN9Q+zyixSG5jca7zWAzw4d6VYuffTnGwVO2Hzz14mfI
X-Gm-Gg: AR+sD11zNWruaI1tPsRqNMqYRJMnvDTfAz9Bf7noO/BWL1hidvNliT9ciLoa14gOr0w
	yFQ5C+ftp+8M/fF8jJkhRgnLeOiMUXukZyKoK/MW2Om+T24lHuRqnCcTXLLa3OW87/yQ5At6FVg
	SdQLV2IUCfcD4jJZgrTp60d2hY24qV/OKkijb448R2qSNKz7oMuRbFoTGU7pPVTyJD6nnui8yNo
	msaxY7YSWH05jOEVQyJLZAAvn35UQvFZ3VnCHKj0wu+M46o809k13GmALa6fAGFtR/mNIevnA9V
	KN0S5K3CJesUkM0UGnUEWHFQZWYiH5EjqeoNQejvgdSkdjOoEUrnj7XNlGFLEauHOolIBwTRn2f
	13uTlUsi0k3WYxlxFCFPb616P67+Mpj0vH8I0/s54lfl7+edQJYaPI3yXFsfw7VtMj3IwG5wEyH
	paCLs4z9/UGBooJ6U/u/xbAI59nmxOcOmULwdZv7xFwcVbTASQZYQBv+7wFTNBAmQ7ZK59eIWKL
	vlpJK5OtMQttVSa5D7FfKrvK+A=
X-Received: by 2002:a05:6102:3ec4:b0:737:783d:1916 with SMTP id ada2fe7eead31-7642f8bd6d4mr4883272137.11.1786371679364;
        Mon, 10 Aug 2026 07:21:19 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-763fe4da46dsm4684098137.3.2026.08.10.07.21.18
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:21:18 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7466771f1caso575562137.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:21:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp5arbse3J9iU2lWDWTCaFT99pfNNijAdxAe/a51rdKVqf0KVDrb2k7gK7uxszxi7p+PdmPLnP+20xB@vger.kernel.org
X-Received: by 2002:a05:6102:50a6:b0:728:f34d:f410 with SMTP id
 ada2fe7eead31-7642e3908d2mr4413691137.7.1786371678544; Mon, 10 Aug 2026
 07:21:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:21:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXv8rqGGdFjXqBw4RbzHdoy=CAWY0WdRfsvjSccm=kvxA@mail.gmail.com>
X-Gm-Features: AUfX_mzTCV5NDV8QSZzevbAyZcff566ZTll72oycYTZVrDtUDH1idu1vYH_kZ9k
Message-ID: <CAMuHMdXv8rqGGdFjXqBw4RbzHdoy=CAWY0WdRfsvjSccm=kvxA@mail.gmail.com>
Subject: Re: [PATCH 1/9] arm: dts: renesas: lager: Specify ethernet PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Tue, 14 Jul 2026 at 15:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS does not indicate how long should
> the system wait after deassertion of the PHY reset and before start
> of communication with the PHY via MDIO. Opt for the same value as
> used for KSZ9031RNX, which is 300 us.
>
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS row tSR Stable supply voltages to
> reset high is at minimum 10 ms. Set the DT property reset-assert-us
> to 10ms because the KSZ8041RNL RM does not explicitly spell out how
> long the reset has to be asserted, but this at least covers the worst
> case scenario.

Thanks for your patch!

> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf

That's the URL for KSZ9131RNX. The correct URL is:
https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ8041NL-RNL-Data-Sheet-DS00002245.pdf

> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, with the URL corrected.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
