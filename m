Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794786264;
	b=NQ7tnFdBVxqNOrGEv4Z1pAjupPymTJHxP6s6Llawpo+vmzXu5m3Kd6aPguNIySpR8Rn9
	 OsdU2pAr5C47tcE/BxpE5nYDvFOO7oF/lIQde0e1hUgp/LNri2lUfrmjcu9XLvGKADdXd
	 Z/UletvBHYznUm2uvZx3ld9wEt4f8a9cvl2SZE+B+O06DXNiAG1YI/NMnk7yzzFsyc81X
	 RuI3hAx9/iC+el92Zb8JRaqlMb0V+y86toO9qcIsgZyi273GIFXDcADZLvVAZmQvSdM+c
	 TnJlSeHBq/15otk6ie8VuWoDfm4JMPj/ap9XxNpAQKHWiJNxhqDqV/XMyhtXX0xK8zg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794786264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=auof1BOxZI/hueJ3qT4KAJwQ5fheSgQUSxA+iFOzg5I=;
	b=XhTO/qtxDHuRlHbkRQCEpGVrCy70Kk+Wyt6rzg33GzHCRYEtxBNEqhlO3IpFyMeNIKBS
	 kvJkeYlz09h2SC1yqi8FbqYUOWoqEcYeYOaD8/2xU0Pd5KPi9pqPAn3MFP1CE/SV88WYe
	 v0GcMQfpk50UgzhjFz5AURwx8gmL3bHbu0K7m5z0Jsw5X7wnt0TpXeOfp8J5vE4QJsmNk
	 0ExMAJAJodSkSUUHX0YeeN2w6qUQz6F/7ygA8JlUmJrzWPGBOYJQ7k3mZ0NDe+M36hu69
	 YEHGOqJjDS+fs5ja5IBFjKMSinnfsu0hzJW3MWqosZ/dm5aZTHW2/mUF52L46MYloYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KmKhF/c2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10007606A323
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 23:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10007606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KmKhF/c2
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so3341498e0c.2
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 15:44:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794786263; cv=none;
        d=google.com; s=arc-20260327;
        b=ntuduXoG3n+wjgU3KCVseh4CmeRH4hjLKKKUmmDOfsGvLi4GWCsPyT0A6S6VGeL6/5
         /QREbM9ZRkvz0UwWRYfnYBdQgj/Wi6vxeYVF7/9fGOSXRJX+gyx8XtvX2yUbexKLMHzf
         6OcnA107gI+0OzmOowcaFG0eNtzt8jR3DOKLl8FX32sEe4lQfC3ZU+VBBus8uC1RF7+U
         zeRUk99wfOPSxoYRDMM0grnPFNqQF8twzf5bjkqK8FfkJc3l8DfMkSXpHz4de0eGDiXQ
         TTIzpqr/hRiQMUEQYnJ0UZWSSXu22tDkVhc9H/WSUYCp1yWHgcV9h3rGUpIea/bkeImS
         eqAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=auof1BOxZI/hueJ3qT4KAJwQ5fheSgQUSxA+iFOzg5I=;
        fh=J6fh0+Z7RbnE+bKuknJkBr12EfPm5K/T7UK3VYi3BSU=;
        b=EwFp2KlYh3JhtDBqNh7GH7O0WL3LoxwVIFrwjYse71FyJvuWltmMplpawn9qcPzygW
         8j6MFwdexBmQo024NV+Er1C1jZuITfqAFADFP1V9AMBtWRumX5VoREMfwBVbiwyPbIno
         Lm4mtdg4U+hpSjLU/G/H74RM51bMKiEWs3sY0pJ/Wtwj5adj20E0NF2DVn/GdjGgYomb
         yHwJVoPN7kOMMotZwH6qiBeRzDB+yy6sSJgFKBDsqznvirPO+upvF4UlIRTshaACpwvp
         w6fKNmygGX7uIUk0wUCQmC1soqbIp8NLNj0vQlb2QoANy57l64wLhcBHAUgeyTPNY4xl
         Zy8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794786263; x=1795391063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=auof1BOxZI/hueJ3qT4KAJwQ5fheSgQUSxA+iFOzg5I=;
        b=KmKhF/c2nsVjsMO6JaYs+Tmvz0Q5rQed7sqC0weLcOzMxB/w8ZeyHiJfcbiqPVgQJJ
         reXBPdJXfqwXIy4335GuDtevMZKs4tVoOQ8K1tPxIQ1GCTKcKCAMZToHPA0dmr5hrYM3
         R7uXTMKqbGlxFjfaYPtGyrX/dDLIE9TiTSVN6jYhHQUl/30RF9pmYfG4KokyniJqHVwq
         s9IdfBncQ1G/QokaIhbu8vHkhgOQiAMQxufe7yqRRxgGoUXaAoyuB16G7fHFcupbbyS8
         2CK/bkJs0fT5qH3eUCi3XTpIvg6tfA6hUFQOOFhq9l3a9gEsFgrDOS1rfcoBDccfvIeo
         DhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794786263; x=1795391063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auof1BOxZI/hueJ3qT4KAJwQ5fheSgQUSxA+iFOzg5I=;
        b=BSyNSZgRIDax3tHxoOzHS3dzr0SmVoAMYpEPPW4rfW8NTGAuthe5h3d+NHQCbZmamd
         wZ8lKzv90+5sgIIVXdhgoHSOURIx6i653Dq0BorZ0ZuvEobNyCl3goA5o+UV4AOqg/l+
         OUNfkedY/vClpT/uHwcIQpcfBn9lmxj6XwLo9akVaUPaB2t9WqbEYJtSQdqP8uCWyjyP
         30FXnRMBZjDaD2goNhCCDMRGLx2l4B08KVBUE+uMUn5thrS6cKHBMQBl3tjWqlAveMUw
         lYtOqY4qr6U9b8MaK7oAlmnrG7k1ljlqtMmH8pfAOGR42pwIT2MMhR8UGuxS5DhQ8hGk
         3uSg==
X-Forwarded-Encrypted: i=1; AL+hErEb1pZfkNT9XOoPIKmYqk40YThdJo176bfIn8DqRADxRnpQLthK53KxvzPZVWJ0l5yA5CfXN2Sai5RO@vger.kernel.org
X-Gm-Message-State: APuU4Z8EigDoJ1Gfk+LbU6hjliEn943AB2PGxdQ4cCSr9Rz0lcx3a+e7
	H+CFrJ6lzVLp7d6dQ0mGomz7lBqoLh1xd2ieZVZZQQvWXADR+Jxh61A82cNkyzFOXmW+yiV3jTV
	edJIiS8Y0bKqImRbwUMS+YJk7SzPN6hM=
X-Gm-Gg: AYBFou2wduNt1AIUGSD9DXOGL5Edy+fCSdH79JkdCFaJA7xY/ochRGkTcfJzLzD84l1
	zZQjQuYqXMKNUzXJ2WY6eOptowApP23auYKe3w2hPyO3znUIaniyPyxuEtnxB++KtJeQEVxCAPT
	UP1BL5OCOfqRyrMFEEqXgQpzNbhyMC8pVbpHCQcOppOe4eWqrtfX29+dIAJ3jphBHLgVFf976eS
	hq5OCh92piWE5j5zsFhaF2ek4IiT7g++6nhz1jLTlmICP6PcfOTv6NZSjEneR95NtbFEU5NH0MH
	Y+1JKo6smt85kY1t5bHbUEV5H9FEkhx9J0XC3Ui0ePGsFYktsYduUQ+Sr6u7Oezv0zN+R0diwvh
	rertb6g7MoXmqOBsZaAcyHXX56BK/vbL9MzBA9ZUBQUjSRPpBwgZnTkcicYxoZI059pOxsw==
X-Received: by 2002:a05:6122:488e:b0:5ea:bfe3:6035 with SMTP id
 71dfb90a1353d-5ee34a46807mr3122166e0c.8.1794786263045; Sun, 15 Nov 2026
 15:44:23 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-sunxi-orangepi-3-lts-v3-0-98fef4f75184@gmail.com> <CAGb2v66f5QFECs1L3K1C+1LMXS2KVCVgG_LgAnEuun9YNgHidg@mail.gmail.com>
In-Reply-To: <CAGb2v66f5QFECs1L3K1C+1LMXS2KVCVgG_LgAnEuun9YNgHidg@mail.gmail.com>
From: Cristian Filipescu <filipescu.cristian@gmail.com>
Date: Sun, 15 Nov 2026 16:44:12 -0700
X-Gm-Features: AclHuK_c04QdNpovv9zvqchoEQGN-Z-QnqhIaD68AYr5MCT9q1wPyZvYN5agNtE
Message-ID: <CAH87RzQRJB7yndzT4fAsQX4mV5h8Q8ksiwY2ruc_zUus8e+yHQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] arm64: dts: allwinner: Support Orange Pi 3 LTS
To: wens@kernel.org
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Sun, Nov 15, 2026 at 3:00=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Tue, Oct 27, 2026 at 7:34=E2=80=AFAM Cristian Filipescu via B4 Relay
> <devnull+filipescu.cristian.gmail.com@kernel.org> wrote:
> >
> > Continue Jernej Skrabec's April 2025 series, adding the board compatibl=
e
> > and device tree for the Allwinner H6-based Orange Pi 3 LTS.
> >
> > Board testing passed SD/eMMC reads, both LEDs at drive strength 10,
> > and five Ethernet interface cycles plus three MAC driver rebinds.
> > Each network cycle reached 1 Gbps/full duplex, obtained DHCP and passed
> > ping; PHY ID and 125 MHz clock-output configuration were read back.
> > eMMC DDR52 at 50 MHz and HS200 at 150 MHz each passed 768 MiB of direct
> > reads and 256 MiB of patterned writes with verified readbacks and data
> > restoration. All reported MMC error counters were zero. Both board DTBs
> > compile and pass schema checks.
> >
> > Codex assisted with DTS updates, review analysis and build checks;
> > Cristian performed the board tests.
> >
> > ---
> > Changes in v3:
> > - Keep green as power and red as status, matching Armbian LTS roles;
> >   default green on and red off without a boot-stage sequence.
>
> The roles should match the schematics, as the hardware vendor specified.

Agreed. v4 now inherits red PL4 as power/on and green PL7 as
status/off from sun50i-h6-orangepi.dtsi, matching the schematic. I have
removed the Armbian-based rationale from the current revision description.

>
> > - Select drive strength 10 on PL4 and PL7 with per-LED pinctrl states.
> > - Move PHY reset to the MDIO bus, before discovery and outside detach.
> > - Specify the YT8531C PHY ID; MAC rebind fails with early autodetection=
.
>
> Why do you need the PHY ID if you moved the PHY reset up to the bus level
>
> ChenYu

I have dropped the explicit PHY ID in v4. Generic discovery now
passes five interface cycles and three MAC unbind/rebind cycles, both with
and without temporary PHY-ID logging. Each run reached 1 Gbps/full duplex,
obtained DHCP in all eight cycles and passed 24/24 pings. The initial ID
reads matched 4f51:e91b, and the configured 125 MHz output was retained.

>
> > - Enable 1.8 V eMMC DDR52 and HS200 after board testing; retain the
> >   existing H6 maximum frequency of 150 MHz.
> > - Shorten the descriptions and update validation status.
> > - Link to v2: https://lore.kernel.org/all/20261022-sunxi-orangepi-3-lts=
-v2-0-70b899252c6a@gmail.com/
> >
> > ---
> > Jernej Skrabec (2):
> >       dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
> >       arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
> >
> >  Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
> >  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
> >  .../dts/allwinner/sun50i-h6-orangepi-3-lts.dts     | 379 +++++++++++++=
++++++++
> >  3 files changed, 385 insertions(+)
> > ---
> > base-commit: 4403278e4ea2f654f8130a5c03eb8b4516a0f201
> > change-id: 20261022-sunxi-orangepi-3-lts-43b92246a8ed
> >
> > Best regards,
> > --
> > Cristian Filipescu <filipescu.cristian@gmail.com>
> >
> >



Regards,
Cristian Filipescu
------------------------------------
