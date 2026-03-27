Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298173A5442
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602372; cv=pass; b=EeVzfGZLzs7PzLEEMsRbUpZV65vTiqqT5hmSA07Cq2QPwN9VmPdb65z15KFpdosLVOA5VOsLQRurL50tT4/3jfnOFRwRsvXfaLgfPruRI0mKUJi7WxnqR7IbwDwY3VXBujOELEPvC9aN3bKOcGNiq+QifKdKWOwpMRMqpr7tf2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602372; c=relaxed/simple;
	bh=EcbL84R2Ic0MsfVq/sbwk6AErZQ8PN1gKoAXHtH00KM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C4G/mF6ci/jqe/5bGcGLS/thvJy/qcSjbWltuq4147IreO9GZ5Ws5KD+y9M6OUfvbr+uWAUsykoq2CZQzFL9v5Hr5mWvCFIkY/Jr2en69I6oZwAzQb1IlXLNe/sKMtxQWtwjEmMc6O7T4pQa21Iir9X/XGnOymBQmQ2XgibclH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R08hI9NE; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R08hI9NE"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-661cfb9f3aaso2787598a12.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 02:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774602369; cv=none;
        d=google.com; s=arc-20240605;
        b=SdC86l/H2O23cS4D/j77nJ05kinbojW1QYDU0G+v3weY7w2ngrnKlggePawbX+Fe3g
         sy7SdqIDFnWylNX8EphijFRqcPV2OzyLNHYBfL2YTX32syORaKSaeWCwrI1TCwIH/1Hh
         T2iG3gxBCWg8zHIT5lbzjgnFFT8Kb3Mb2cBce2dbqeLt/GGKTPTN59aKogTG0CcciIty
         ihgu7EslkM5G/98o5ApjGi9M9xFvrPrzZMy7Pge621kW9Q77xBb/m2ahZ3DvEMemQCpp
         AFGNLxpmr1jO3d7uLH9TU/8JmRpZO9X6qk4y4pWK1Ewxyg4W5aZb2Udb0U+bwzlm7X5M
         xZKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EcbL84R2Ic0MsfVq/sbwk6AErZQ8PN1gKoAXHtH00KM=;
        fh=Hy9CTLqBX+C7nAvNTgt1hxoWbpHgcMRGA7UdNWnkMto=;
        b=E3ugFYvj0GViTiCwRjLAuxD3Cxw0gCpT5wlIS1ScyA0GSdvt8BWcARQ8nFh8vAwz3u
         vpsbsY4bpXp2Ek7IxHyo1Gc89haon6uSdFfN6B8/W5Yu/3b7f63UkcGhw5/TovGtKH0G
         uIV4EhCKzP3W/dCFgaRRPxOPJ+JO0axoAC1rK6JB471qg8urGOf9WN1zgB2zE+saX+wm
         WVUkDV/be3NIN+4dfLw8V2nDde57/3nw9ntQLwy1snMRyhR1ZFMfj4GX9uMW2O8IzEZH
         9u5S8syqeZysTzlD//LjDpz73lkBqyAk05YbVLve7yUu3vr2sM9NpBdIlm5efs2kOvag
         pBBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774602369; x=1775207169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcbL84R2Ic0MsfVq/sbwk6AErZQ8PN1gKoAXHtH00KM=;
        b=R08hI9NEPkPerub1VwQJ5b55alO4gft/oMT1zd7IH3GJZ/RhSAAMyO+et1EeXlby+L
         JocW+KlYM0fweA/e6akqBGzGyHd0/luPGFxHN1HzYoeGPQ/7VAfpOekDk/HUTGZ63dLb
         XqcBAiSgCfXkbqX1U0R9DvjQw4TXDzsY2rxNVJ6EtmbZNptnM2C7hSUZ6zEsrVQJeFzS
         eW2NjhvVbye1j/kDsqidgpjk6zpUdXthQJWBnmKvVzhTXrjAr1ZOvCsWM5dM85nhM/D6
         Rw+tGDMPz//vjOVllgGNlncYfnOd2ZtHYa0blK2Wua6AB2XLdgbODLZiQzo3ToEaJ5x5
         OqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602369; x=1775207169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EcbL84R2Ic0MsfVq/sbwk6AErZQ8PN1gKoAXHtH00KM=;
        b=X0aOnaHWCbReF5JKMcuiA6fj14jAo5YvrvHNx7AiSH3BHUIemy3dkpPMVrlH7U9+Wg
         T7HHDstUuLnFOPZnoWBnx8nuivEK8jd/HHjrYxtc5lbjQLPl4eCjypOZg/su1vPLU68w
         NP9D2mSwG8D2wghny7W+Q9VzWSYjtcY4Luo30KxnTmyOjmrfzQhBge48jKlcrUGYjzvO
         NGhDn8MSqyuskxhOYeU5bBUQe8TW2wJzswGA0XVoDDJ3HMp0QGqcuWfPhbdTCub6I8QE
         8lU7M00ukeq2ffYgrdLdYEu6r9T0pq8sl7IyzbQlgRSZKsPb6LENnVRJy7Ukc2qfU8TN
         Jqxw==
X-Forwarded-Encrypted: i=1; AJvYcCUrXoRfSKxMY9sFLgzl6KWCGj2oFtIXa6lvK/vrzFe6evOemsh6LU0NNwvuTeNLSfnEuoX+dG2EUbQB@vger.kernel.org
X-Gm-Message-State: AOJu0YwDEgGDdpmfGQvFTnT+Q0tQm59jgv6eT7cdwDgu9EtibbgtDWKC
	E7SsQ+5gG05JKb2rz+HViq6Tyi76oUH0QSrnM9Q9jDn8nV7V2VcSNAEviIMTbl9EGvSbPYDvVQ9
	GO/OUb/WjPPGIWKB9oRsFXK+/gl97q6g=
X-Gm-Gg: ATEYQzzqtJZrkOTK5oDLxm39T5HKrKrz0TcPgOit4kuOqJck11xj8Hs0NPh6SrIjgvW
	oOJh5sZ3Q5S6za5Dp85FhFPb9KtGVUEjyJU/8iCq7SQE5egym5U6piU/V+VGhjsI3JL47sNO/MA
	x4rwfAGy5XEeEuE4fTvZFh3kyL2HLVBxH0MyzgjjMbpylwQG2jT2QtvJIWGMo7SZv1lnrLwmg2X
	C0gdV3R4cIr6wpTeYI5G6u3fo4s/YNYDhPrxdK/cMtx4lKk7Lt8vxsHUojZmNP9LyBoH/C5jw/t
	gReY2eU=
X-Received: by 2002:a05:6402:1d4e:b0:66a:526b:96b5 with SMTP id
 4fb4d7f45d1cf-66b28c5262bmr1098566a12.18.1774602369094; Fri, 27 Mar 2026
 02:06:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320094441.128263-1-midgy971@gmail.com> <177437177535.786081.7519498810130807269.b4-ty@sntech.de>
 <533f27c9-e970-449b-a431-4ba41a566aaf@kwiboo.xyz> <10821700.nUPlyArG6x@phil>
In-Reply-To: <10821700.nUPlyArG6x@phil>
From: Midgy Balon <midgy971@gmail.com>
Date: Fri, 27 Mar 2026 10:07:43 +0100
X-Gm-Features: AQROBzC8CnXSa0u5wehgfkvDz7gqUZpnjqEtux6oaO4slyBrfgvJQHeqANw0iXE
Message-ID: <CA+GS1Y3kiRrTZrS7meaHoSgOaputt3RL9iuHrtKqys4qN+uYYg@mail.gmail.com>
Subject: Re: [PATCH v5] arm64: dts: rockchip: rock-3b: Model PI6C20100 as gated-fixed-clock
To: Heiko Stuebner <heiko@sntech.de>
Cc: Jonas Karlman <jonas@kwiboo.xyz>, linux-rockchip@lists.infradead.org, 
	shawn.lin@rock-chips.com, jonas@kwiboo.se, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Heiko,

I apologize for missing Jonas' comments. It will be done for the next
version as requested.
Indeed Claude works "well" :D . I'll be more careful next time.

Thanks,

Midgy

Le mar. 24 mars 2026 =C3=A0 23:27, Heiko Stuebner <heiko@sntech.de> a =C3=
=A9crit :
>
> Hi Jonas,
>
> Am Dienstag, 24. M=C3=A4rz 2026, 18:15:38 Mitteleurop=C3=A4ische Normalze=
it schrieb Jonas Karlman:
> > Hi Heiko,
> >
> > On 3/24/2026 6:04 PM, Heiko Stuebner wrote:
> > >
> > > On Fri, 20 Mar 2026 10:44:41 +0100, MidG971 wrote:
> > >> The Radxa ROCK 3B uses a PI6C20100 PCIe reference clock buffer to
> > >> provide a 100MHz reference clock to the PCIe 3.0 PHY and controllers=
.
> > >> This chip is currently modeled only as a fixed regulator
> > >> (vcc3v3_pi6c_03), with no clock output representation.
> > >>
> > >> The PI6C20100 is a clock generator, not a power supply. Model it
> > >> properly as a gated-fixed-clock, following the pattern established
> > >> for the Rock 5 ITX and other boards with similar PCIe clock buffer
> > >> chips.
> > >>
> > >> [...]
> > >
> > > Applied, thanks!
> >
> > My comments from v3 [1] was not addressed in v4 och v5. E.g.
> > regulator-always-on/boot-on not being removed and redundant comments.
> >
> > [1] https://lore.kernel.org/all/fec0f25d-733a-4b6c-aef1-2ac51bd15798@kw=
iboo.se/
>
> thank you so much for noticing. Looks like that AI thing is
> working "well" ;-) .
>
> I've droped the patch and recreated the for-next branch now.
>
> @Midgy, please honor feedback in future revisions.
>
> Thanks
> Heiko
>
>
