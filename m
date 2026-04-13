Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BA83B777D
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776092323; cv=none; b=MCI19Wv6wxthRf4rMv7YsJ1K04gOJj9TqSHjzeBb0ai87BAi5piNYDoYRtwk2rkNscDIcZXkDmC6D/IIrrYIZgBlRJ3A9MWT3ypJcloko/wurvbM18KZSYupAaWsn24Gf5vc2uFff6R9ZWdxzMrgmCFr+vYpVtZqbHV3BoVGF9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776092323; c=relaxed/simple;
	bh=Ncx6OFLdIXtKV3s6Ai5nJ01PifAojhSJnOBqKVomoQg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gQAcjN37jUiUquK6jXKz72oT0Bf7OGQxJ1d+KMSFW0AHGyL4jg8tINHc7b6sN22HoLZat/UiLkK2whlY17ibCVLYBoTUnTCpYnYfwo+GzcaoH/5JsDBnf4m57bU//A9pYrGseoWvaVFu6ICYoWEdpsDrht+hLOG08iKNeC3t1FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=v/5LhES8; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="v/5LhES8"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so27925885e9.2
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776092319; x=1776697119; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J9dPDvYBTw9HdYMdZ/a5T1qVs23laCgwvQcsbGk2Rh0=;
        b=v/5LhES812XD2nzT5c22MhUyUja0EcGQXg64R42g9YO9KfTlqLOO13LUz5qbhH9tJQ
         meOauf77LfikNuNeM4wRq5Ejst6Y30vwlWpU8fnkvxxjfvUuZGqFpMCgs91tSTxxwRlv
         UNvD/ejVsw0fPTadtMVgWk/gSkRY1K90tN/cGmaV4H+2CiJlIILLFYPG9BVl0tj5fuHy
         5ndE1i/nPa7ACQrTiOmfrrfGC7z3GECfGzZKab8qhlIp6ZHMgqXP4ExWuKynsjyHcfa+
         VI9rLNR4bbqSv7/w0QcHcZSgfC0zeg3WeX+37lIxtejUobpAJapo/INaXyB4j1Gf0NLj
         QbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776092319; x=1776697119;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9dPDvYBTw9HdYMdZ/a5T1qVs23laCgwvQcsbGk2Rh0=;
        b=RNoXkoLnzi59fr8k4zdZXzJpalLrVhkeftFy1TqUJAEPAsvG1P0r1V1XpYFP9g613t
         /7qmTmVV0H+VSYeHmCCH9R4H6ERjRs3seuz9s0ckBKtGLV87oetysWqvpq/fY4IlhvEC
         fjwhPWdH+GBnOsx+FkchHej90uGSPh2QC73zrm6ksK2xzWM2DV6DVhpRTBPRKfhQqgwe
         /EWnYkPnwLqARTyDBBamofTD9ueKrsZcXublK6l0/sCNlrqy1wnJpp/ETyZ8Dh87ByG+
         sBiRsWwrmg4qer7m36YVlaUa3iExPLuL0tvIJNeIi0mJSn561vD97v55pu8AuaG4tytk
         Dh0w==
X-Forwarded-Encrypted: i=1; AFNElJ8ZqSIqIDsyhtkrAAuvvhsHJ5E3KpA3ywGclWRJKTx/iDtm1fczzdpsUHlGuOSH47UjDnELcDXXRs7b@vger.kernel.org
X-Gm-Message-State: AOJu0YwaLyy2514Ypip/Zx6dNl71L+0HgYfDd2508sGhbXzQIQhAzIPs
	O9tS8u1930kGYW5+MsanXlblAPOB/veIQiEErYOPitaOYaCrK5XxDLStt+eMFASNTyA=
X-Gm-Gg: AeBDieshgWxEqsAReRp527uHrSHFKzsFrVdIgEGdFrBkl+DvnsODjsPkkO8az9cotbq
	w5XYvzv1wGgauKVhpoPYKzTUlWwpPe6+w6X+Jnp0KNb99Cm5NLXoJ+ZZMaUzVzyHiwApWbcvvTq
	UEwTtAOIapAyKsYfWStkdPlxBVtlDpSaxH0eTSZ6gWXGzWBvSP+Jz1Py8kn32vEHCgd9KrpGiWY
	9Oc1g84GLeWuCvsdBqtgYbMdHh+8HaAPzzEzi33+ybpCHNdjMOjnd6f/yasD7O0JLbam6cvvxZu
	FH34gkQN/Lv/tfj36PxWfw0PIvO5AQhf3AZX5Mu04pdLAminJTl51p6FPTSCzWWXIpAyynsY6m5
	T2nFv45BAIspRvpUY1gZpWUYSTyPMjDNVUKSGF/xAFI3kPkN1TbxSoFfDyZ3Q36T/xVLgKhzlM1
	z+FuaKTVcAOamOYf4=
X-Received: by 2002:a5d:568b:0:b0:43d:6a0c:9571 with SMTP id ffacd0b85a97d-43d6a0c95demr10556355f8f.11.1776092319396;
        Mon, 13 Apr 2026 07:58:39 -0700 (PDT)
Received: from localhost ([62.246.35.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7bd2f237sm5888815f8f.23.2026.04.13.07.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:58:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=0a785cbd2c7f90d7885fd7b41f2dd71fdce8ca289150b6b9839827a32df0;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 13 Apr 2026 16:58:30 +0200
Message-Id: <DHS46FH9ZYZB.3BG6HVH832NAE@baylibre.com>
Cc: "Vishal Mahaveer" <vishalm@ti.com>, "Kevin Hilman"
 <khilman@baylibre.com>, "Dhruva Gole" <d-gole@ti.com>, "Sebin Francis"
 <sebin.francis@ti.com>, "Kendall Willis" <k-willis@ti.com>, "Akashdeep
 Kaur" <a-kaur@ti.com>, <linux-remoteproc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 4/7] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Vignesh Raghavendra" <vigneshr@ti.com>, "Markus Schneider-Pargmann"
 <msp@baylibre.com>, "Bjorn Andersson" <andersson@kernel.org>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Suman Anna" <s-anna@ti.com>, "Nishanth Menon"
 <nm@ti.com>, "Tero Kristo" <kristo@kernel.org>
X-Mailer: aerc 0.21.0-126-g9e77103592fe
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com> <20260318-topic-am62a-ioddr-dt-v6-19-v3-4-c41473cb23c3@baylibre.com> <8673745d-aad2-49d3-b3af-556de7037b69@ti.com> <DHPIOTXA81M3.AHBN8M49ENG5@baylibre.com> <c35fea4e-dc22-4314-9c5c-bfa5b880864d@ti.com>
In-Reply-To: <c35fea4e-dc22-4314-9c5c-bfa5b880864d@ti.com>

--0a785cbd2c7f90d7885fd7b41f2dd71fdce8ca289150b6b9839827a32df0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Vignesh,

On Sat Apr 11, 2026 at 4:47 PM CEST, Vignesh Raghavendra wrote:
>
>
> On 10/04/26 19:12, Markus Schneider-Pargmann wrote:
>> Hi Vignesh,
>>=20
>> On Fri Apr 10, 2026 at 6:30 AM CEST, Vignesh Raghavendra wrote:
>>> Hi Markus
>>>
>>> On 18/03/26 20:43, Markus Schneider-Pargmann (TI) wrote:
>>>> Split the firmware memory region in more specific parts so it is bette=
r
>>>> described where to find which information. Specifically the LPM metada=
ta
>>>> region is important as bootloader software like U-Boot has to know whe=
re
>>>> that data is to be able to read that data.
>>>>
>>>> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
>>>> ---
>>>>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 40 ++++++++++++++++++++++++=
+++++++--
>>>>  1 file changed, 38 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot=
/dts/ti/k3-am62a7-sk.dts
>>>> index e99bdbc2e0cbdf858f1631096f9c2a086191bab3..c381cc33064ec427751a9a=
c5bcdff745a9559a89 100644
>>>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>>> @@ -59,9 +59,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c80000=
0 {
>>>>  			no-map;
>>>>  		};
>>>> =20
>>>> -		wkup_r5fss0_core0_memory_region: memory@9c900000 {
>>>> +		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
>>>
>>> There are still references to wkup_r5fss0_core0_memory_region in
>>> k3-am62a-ti-ipc-firmware.dtsi (same comment applies to next 2 patches a=
s
>>> well)
>>>
>>> Dont those need to be updated too?
>>=20
>> I only updated the sk boards as these are the only ones that have IO+DDR
>> support that I know works and need the new memory region layout. But
>> thinking about this, updating the memory region structure shouldn't be a
>> problem for the other boards either, of course I can't tell if IO+DDR
>> would work on them, but the new memory region layout shouldn't break
>> anything.
>
> I am not talking about updating other boards, but specifically about
> k3-am62*-ti-ipc-firmware.dtsi which have a phandle reference to
> wkup_r5fss0_core0_memory_region. Therefore any dts trying to include
> this dtsi would fail to compile post this series.

I am not sure I understand why they would fail?

The current design is to have the k3-am62*-ti-ipc-firmware.dtsi files
reference the memory regions in the r5fss node, for example:

  &wkup_r5fss0_core0 {
    mboxes =3D <&mailbox0_cluster0>, <&mbox_r5_0>;
    memory-region =3D <&wkup_r5fss0_core0_dma_memory_region>,
        <&wkup_r5fss0_core0_memory_region>;
    memory-region-names =3D "dma", "firmware";
    status =3D "okay";
  };

But k3-am62*-ti-ipc-firmware.dtsi do not define these memory regions.
Instead it relies on the dts files to define them. That is done for
example in k3-am62a7-sk.dts and others.

This patch now changes the memory regions being used by r5fss0 as well
as the memory regions being defined but only in k3-am62a7-sk.dts. It
does not change the references or definitions in
k3-am62*-ti-ipc-firmware.dtsi.

So I think including the k3-am62*-ti-ipc-firmware.dtsi file should still
work as long as you have the memory regions defined in the dts file.

Best
Markus

--0a785cbd2c7f90d7885fd7b41f2dd71fdce8ca289150b6b9839827a32df0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCad0ElhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlN9
/wD5Ab5i95liHETc2NOhXhkDKA1xYvzEVvaeIFg98GPhbA4A/3L3/LhrHSz6dGz9
qBvd1F0mm4iVotX0AxZJ4Rm3YZoH
=SQ08
-----END PGP SIGNATURE-----

--0a785cbd2c7f90d7885fd7b41f2dd71fdce8ca289150b6b9839827a32df0--
