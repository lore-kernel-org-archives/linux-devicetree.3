Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213513E1D12
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 12:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661796; cv=none; b=XiE0wN9n56cFDIMGHMZBF66O4/y2HL8yFceE4FuRR0gtzCbEq79t2ZdtC2wlmN10Vpg3gfXqYZtjVuuC5m+mUUHnTHLopDn4FI9QCVjHV48voFJr+ZkV2+t98s0hLH6Mnl3wzQA+gF8ycImNoWw0n+nz7LkN49Ui8SzXE4n6Kts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661796; c=relaxed/simple;
	bh=qKVDN6780BM7FpRbqGfcw4sKV8utIJkRbQ4/Bz1H7P4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=p98PktM3ix3uuM/gfuwqTkE6w4hGNwSTr9W9IPK7Fsm2GQjKLXxpTiIcYkdHcmOkgchzpItDehY8JdNg/h3LGwmQxUXxT86tAUOJ99zcb8gyx3bIbDuUDBZKBnDmD6SxghUX1J5KUqoIDFpTpw3Bakio8kFmP9S2uOO8bv++Zss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SqnJZgC1; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SqnJZgC1"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so8590343a12.2
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787661792; x=1788266592; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TFI3yyLn9l19QnGbVm2do/qnURFM3qOYJajHXsZKIRI=;
        b=SqnJZgC147cZbd0pL1z7QmhHQI7+KZaTx0W2FH8XBE6xxM/6ufA0Gug0sJJCKa4HoU
         OBo9AL60XoKUISpziK7GrM8Hv8n7KTqzbFBLjNUGDXB1bnL78X1kYMU3cgPtS8bAmm4i
         0dujfNZ5vf1UuaimYSEZA3LvAyyJWWAsrAFG7hA9kcol/TiFBlDcXD/sVORNonFekRe0
         euHfKgs1xslAZ0VszYgcudSDBVi6f/GHoJfMGekk4YjDxcpusIwTwQTu2wH840GB/Y15
         ZMfi/qbFTomhl4gQLCCe3DzkRUAqCC9UoiPRmKxlFnveRy0ZBYVbKO543Q7zQXmL+TFy
         BbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661792; x=1788266592;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TFI3yyLn9l19QnGbVm2do/qnURFM3qOYJajHXsZKIRI=;
        b=ZNuw45FVuHgI5psXIPTqYm64pTDR0z4YqPNwfK6yK+dh2F2FjpugPypdpqyiEm4Al9
         ay76UP+ROT9qNUWig9/bYL3bpCQHMyomrzp/qNYhk89ZXNPMoXjcaZb7EoXcweU8IE4M
         RWUCKV2kCQQUqMIF8rWSN7P9oWtx/iLZ0eM/sRn8uJl0FGw50Zzf6PgVXPXmJquSmUm8
         C8ffNsnRdrb5xNYT+OwccohCNA/WyvU7KYKVnKJACVBG3NdGD5hRiA7dmagmuIn7Jo2b
         LkOopltSm0sRgGWlXOGBtwhZKlaEB3yAZ0SQpGV1BQI5zRksVVE5y9GqwnpGqsBSNVtN
         hWyQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYco58CrI9y9N2dUJ9Zq8pPbP4c+efP2cUa0Ax5S5UroNvXC2feGJy59cfO8UjeHVfZ2Sb8UP9GWr2@vger.kernel.org
X-Gm-Message-State: AFuF++n1Hx11NhXkIbmuoPJBK72ALvtq5s0/h4identhq46iA7bivkzC
	Ow0zMtApE7h7lVXEGEJL29CI1R2wyeXGiRTXfJYb0J6/YrJ19HH5fIR5HmH/Vxqjhm0=
X-Gm-Gg: AR+sD11R/McU7MHmRr/9xX5U2JtUPWaKersJeP1OzVB/l7xbxTfk875mqSCcIJAj+53
	Nic2RL50p64zllahJrLHbqP5GSFt57CtL2QqqVuRDSVIP9ypXvRrev0YpwLCqHxrpDoanCZklrS
	LBJjqXl3bhMq6cwC3Za84lgHchawpy/G+9G9jdmi1B3Ei6+n0VQO+5Ln6qidlW7HA20xtJ79Kgo
	tYXqudkEYov49Zo3WFHshU728QF0WXGbTMGOmbNvQimbBmluamOTw9hrxQSQt9csYN+hrAUdHAP
	8wGB6IGG4GwLRVoNFakW7Yd059ZBhsZzWNbgOUpoPMLNWkvxirMPhIv9VH6LmuAW/jb8HNad5sF
	q1TL7k4vkkckoVlFGfG+Q3OYFnvFHSftdrDkv/e2bBhj4ln5SRY3TQm3EoEN8YQt42FFBvrWmIv
	8p1QVNXcS+2mZLmwQ0tfwkOn+a7MmyTcM+XQ15m+8hy4/xF6euvN0+ew+A
X-Received: by 2002:a17:907:1c27:b0:c21:382e:9a38 with SMTP id a640c23a62f3a-c2491c2a110mr2907599166b.2.1787661792297;
        Tue, 25 Aug 2026 05:43:12 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:489b:7642:1b32:84d6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f809bsm1943085966b.41.2026.08.25.05.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 05:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=14a369f1291804ff25a36242752313e74f8647a8095442ea6e38a796f654;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 25 Aug 2026 14:43:01 +0200
Message-Id: <DKY17OVPN49B.3U7OKB7NIMLF2@baylibre.com>
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Andrew Davis" <afd@ti.com>, "Markus Schneider-Pargmann (TI)"
 <msp@baylibre.com>, "Nishanth Menon" <nm@ti.com>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>, "Bill Wendling"
 <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>, "Judith
 Mendez" <jm@ti.com>, "Daniel Schultz" <d.schultz@phytec.de>, "Siddharth
 Vadapalli" <s-vadapalli@ti.com>, "Paresh Bhagat" <p-bhagat@ti.com>, "Bryan
 Brattlof" <bb@ti.com>, "Jai Luthra" <jai.luthra@ideasonboard.com>, "Devarsh
 Thakkar" <devarsht@ti.com>, "Beleswar Padhi" <b-padhi@ti.com>, "Francesco
 Dolcini" <francesco.dolcini@toradex.com>, "Stefano Radaelli"
 <stefano.radaelli21@gmail.com>
Cc: "Vishal Mahaveer" <vishalm@ti.com>, "Kevin Hilman"
 <khilman@baylibre.com>, "Sebin Francis" <sebin.francis@ti.com>, "Kendall
 Willis" <k-willis@ti.com>, "Akashdeep Kaur" <a-kaur@ti.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>, "Hari Nagalla"
 <hnagalla@ti.com>
Subject: Re: [PATCH v7 07/11] arm64: dts: ti: k3-am62a-ti-ipc-firmware: Move
 wkup reserved memory
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com> <20260701-topic-am62a-ioddr-dt-v6-19-v7-7-e9db8b16821a@baylibre.com> <f9a23a59-4346-4408-92c6-11b9162f0efa@ti.com>
In-Reply-To: <f9a23a59-4346-4408-92c6-11b9162f0efa@ti.com>

--14a369f1291804ff25a36242752313e74f8647a8095442ea6e38a796f654
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Andrew,

On Thu Jul 9, 2026 at 9:33 PM CEST, Andrew Davis wrote:
> On 7/1/26 7:39 AM, Markus Schneider-Pargmann (TI) wrote:
>> Move the reserved memory regions used for wkup_r5fss0_core0 to the
>> k3-am62a-ti-ipc-firmware.dtsi. These are all the same for the other
>> boards as well, so we can combine them here similar to what is already
>> done for the mcu_r5fss0_core0 memory regions.
>
> The reason we left this region here in the base DTSI is this region
> is for the DM firmware and is required for the SoC to function.
> The other firmware regions are all optional.

I left this in the base dts before and Nishanth pointed out that it
should be in the ipc-firmware.dtsi so it only needs to be changed in one
place:

  That was the entire purpose of splitting ipc-firmware.dtsi out -
  if the default firmware carveouts have changed, do the change in
  ipc-firmware.dtsi. That way some other firmware people will have could
  potentially have their own dtsi files and handle things appropriately
  there, even if they are using the same evm OR if they use the exact
  ipc-firmware on different boards, that will appropriately introduce
  the change there as well. BUT, do check first.

https://lore.kernel.org/r/20260507155710.5zch4ghhzrj7hnlh@immovably

Maybe I am misunderstanding what you are suggesting. Also note that the
memory-region list in wkup_r5fss0_core0 which references the memory
regions defined in the base dts were always in the ipc-firmware.dtsi.

Could you please help me understand how this is modeled so I can update
the patches appropriately?

Thanks!

Best
Markus

--14a369f1291804ff25a36242752313e74f8647a8095442ea6e38a796f654
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCao2N1RsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlMY
0wD+MW1P+fXLHbnT0Q5q0xRZNdlX5mzZrZjflYaQeXlZQVkBALnL4EjrbB40bxbu
e80zmZ+OmW/bF+SzGKpJy8SoyqYK
=pVaV
-----END PGP SIGNATURE-----

--14a369f1291804ff25a36242752313e74f8647a8095442ea6e38a796f654--
