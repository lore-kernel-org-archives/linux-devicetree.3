Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACBE36194E
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 20:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791751813; cv=pass; b=AD/BmdsHww3JbyZkR0uZwsU12Sch300wL04eVSbFq2xYEW3DHtBKWluWu24WGZxDXuPV32Njb7NJ3Dn2EmcLlQDGM4CIGokZ3a6ARL52qHHws6H4vF/2SczI4oj6KRQR+tOIujTz8EkWkx4E4yH595DyadReXJaDQOAZsFn8rjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791751813; c=relaxed/simple;
	bh=DDg4auuOqPrEXGrToBLHCiNJTDyvgWN+z8Xmqs3ZOYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aewJToNutvUaATlYMiu1Wqekoc7dTEM6UCDySzu9q6PCGvumDLCabCcTHKWRiw+2r9IHGuTRo1uZ9ISRknLrDHMktFy42ZjmSM8gXg9XZ9Mqd/jo5DG/iJRZFaLHujv2C0WDzQ5UNQxWnCbR/zyHoRoITiVVwXw67ln2N6EBrig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=XjAPXvFX; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="XjAPXvFX"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-678febd9307so1011738d50.0
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 13:50:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791751811; cv=none;
        d=google.com; s=arc-20260327;
        b=HJPOK7UOhno9Z3gPdZrSNEPZfXaXSF+QuLkl+fgt+Z+I4PC/U49Uavd5UF+tW03vRH
         mD6kj3Ef2jazihkYP+cKQZlt+ERwlmtZ1e413zeidEasPRyGOgH8XDjj4UfTfEuRLxMN
         Qa9dvP5DZk6IurNcPOX0aXXZipHKTeBPiRQJ3hBinB5BYvDH6j8UNvzQWOKlwJBpXGMf
         BPJlLY4SnGr2pGZlPsIU/3diivF40T8+1p6EXvvdpyZDMyVmw5OwHf1M3GPPip1EZrFx
         +StjwjccKrrxAywpngSWPjPP0RzXfOMyVNSOSM7FkPNeYDnrAkIbQgutfWm8K1FQrnSq
         QS7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rc3F184YUjrOopP/BvFd/ZpML46lL0W1tVVXp9Yb9rU=;
        fh=MKR/t2JbAJoaQ9DP1UhYIkWevHaBBqqtTsXiLJg9w7Q=;
        b=kc2JXJa46Vub+vKSmjLx6bKMNU9BrFi6iN+/QvVDJcxC6A3GNeIgT+vjZLRbYlMfLg
         VRS7+4ykmrKDkGAE8v/x4mPYCFfm45Z6OABi1BbPhZx2Zv0dlvgzWMgqGqgOA53BCkQ+
         1FqQmzULx3CINKxVNgQVAtqYjuGEAYcCEmn7V9Gk3WZ8e/a5vb+iGOFw5vcGPHrQaKU3
         36VZ73ry2rnpNBuVYYMIbi+QqDyTyOWUuw5r6AXdZJ1lg7Mt0WaxDBqCxxUQV+ozTWaV
         nB1KSm+KxD4ME4ItEzGOOPu79pZ6lCiuxPU7h1G1UXBAQldQduIZI5QwoZcsW12fz/jz
         CrbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791751811; x=1792356611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rc3F184YUjrOopP/BvFd/ZpML46lL0W1tVVXp9Yb9rU=;
        b=XjAPXvFXH8ronGJIvWKruGn67lXo/MgtL54mIBrVmqD1OF+/SP5hu1752BtKm2Lpa9
         xh0g4uWcnI2HCWxIuZ++rR/nTtAKuo4lvsF5KcytljNhSUSlYvpf9dACZOc03yK/SEAa
         kG7uOqpkjOHQLvPqyJoC5BeHlfXFjni0509WfoXbRuNQ8dbOTc1hH11sKmlycWdFqbfu
         2BxfHN0QPspETjcWlsrP6iZjJoShSqpinxEQzhl1zAQLTFgq5BFcPmq2jGRPXd5wgL/i
         2dsejMB1s/TQ8QjjxeFeCzgDhg8DNZzZXayVOJZzgXO9KAC7dkSRVTUUmRZMINUx5DLH
         9oeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791751811; x=1792356611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rc3F184YUjrOopP/BvFd/ZpML46lL0W1tVVXp9Yb9rU=;
        b=pxRWHmsfzfka5d5Dg/i5MFVFVEg36PhlPPIOkSQplZ7SO1PHC4brEXNFYQsuU9y3pw
         xrG98LHJper3jO+sAKhZ9gSMq31W6Wv4OHDdsmFfMHWKcGjCf25xsjMeoPHS0OL3ZpBw
         15+qdklMC5iGxkkBJq8Og+8zohGYufmtprl/cLJVFp7fkhdnD58a+EW5P8Ktj0qv1q3Y
         x6HIrGRdmFGJQd26O1ZkCHXZLzeVUpobRBn9QT3bAJgsstcrIr+21zTb1InNi6jliUNr
         ETE/yceUnjYczKjptHq38K8UZELUH0yiDgH0+nWTsOwhkggsMlY5aa2mzw7q+K/4iKTY
         Rz6A==
X-Forwarded-Encrypted: i=1; AKwUvByW8KVPkPRf2VrlsMGl7CtYaOiaDaX3YZF/znka4hbCFp8W6pfqngeEXL4lxdcg63Ij+JoEBViS40bW@vger.kernel.org
X-Gm-Message-State: AFq9FYIomuUsP6zZEnW0BYLzlFNF9T/r8O8nlKQOXjRL5AXD8Gttb8mo
	UYw3BHhUmkv8dyat6cW/6AtmFVzwsFyF9GUvDAq64oN1BCtzHmuwiRW1DkhYgXiS+mqnLfBymOo
	vZsxT7SNip8gkHvvzaIbPMp4mCD5S33M=
X-Gm-Gg: AYBFou3hQ1qsOE+KbcQyRnVRHEfOg7jQfZgLDLkLkf2Ppqf8Uvy3RwBdJeS8OIxVa/h
	D6gTEoap2ku9dyfbsaZdhJbd+X/4UOwZ+mu30H+qMkZadPyjO1Kt/rqak4PLciwNpNCrWzLQRD6
	vkhlyAWDQpfGzT66LA1GswlLcI+lTPEwiFYVcvBNl7O+pP9aOi7YiUC8Kp3FI/5QkLfFGEIaZDz
	XFy/9VSZg2jE6RKRCCRr9p9y7p8rT+Oa5tA7PU+iQzrnutMwsiEJoYIi0HWULJc4DTr5GBQBquB
	lRXwhbSOY3vs+cALjwwp5gk6+7ajpa1nn3bSVBz4PU2jorTjVLmfuKoXGvV9mI1uh5q+852LcRh
	/0UwCM47HXlu+
X-Received: by 2002:a05:690e:144a:b0:672:bd30:83bd with SMTP id
 956f58d0204a3-679369c2fbdmr2874224d50.49.1791751810698; Sun, 11 Oct 2026
 13:50:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com> <20261011-odroidc2-dts-v2-1-a3a4a752f2ab@gmail.com>
In-Reply-To: <20261011-odroidc2-dts-v2-1-a3a4a752f2ab@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 22:49:59 +0200
X-Gm-Features: AclHuK_PzKBu8m_ohCyUp7PhTYe_NgQTHs4WyLsmyGpLktVRlcmdBIs7NzTNljY
Message-ID: <CAFBinCAOsJG=ROP43+pj9dqYc4yWXs4RQisRZghqzbtspp=e7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: meson-gxbb-odroidc2: read the Ethernet
 MAC address from eFuse
To: filipp.dunsky@gmail.com, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for your patch!

On Sun, Oct 11, 2026 at 8:31=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:
[...]
> +&eth_mac {
> +       reg =3D <0x34 0x6>;
> +};
Question to Neil: should the eth_mac node be moved from meson-gx.dtsi
to meson-gxbb-odroidc2.dts?
Odroid-C2 would be the only board using it and u-boot seems to derive
MAC from SoC chip ID/serial number instead of reading it from eFuse
(so I'm not sure about the status of MAC address in eFuse on most
boards).
