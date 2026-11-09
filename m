Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794262072;
	b=dzCB4F4l24YkEes0p/Q0E+7Tn763p61KPKHcMujRnBggV8E4Mlf3lqf2oACB8ddhi85l
	 kvjxL3fE6hVUkj6Eye726jpRCoJwuSktMt4ZkPT8pYOChGmR8G9n+wiH70+WEg1MWjUT2
	 2lOtXqZ14bChaTbQtk01858xlVObBaHTxcloPIpmuv4Sxfh7UU5qftthxz15JMrLcdH6q
	 UC3ckmoUOq0wy/cADCMqpjq7tG4oJDc6Hmu08HBg8SRN3sif5SCmx6Wox1fLfR+X7XugD
	 FM0/d/QSPv+GsfK+7dxlnNRWhIn5ErhPwjfJaXfgAchDrR3eSQnSeF+3wjtKWVQkdQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QcUpnpKg20NxvBr0a5ywGW50/2qOjmULZA7gI4yvXH0=;
	b=myxF0mvZgQsu00yGDaDEydyLID/Y++vUpzEbNRR3z4hgWPsM9C9tRdvDvKTBKuJncYKc
	 i4+r8R5UC7/6WiqY6SsnQflrpbFcfmVL4FGkdrGcfP7ljFezS90V/bmrHL+Tf1NaWLqH3
	 v6Yut/X+YLUkdvq+mV6js1LOxeDAeQxQWhbJ7El1lxi1AfjV7vJulj5xPoe63OhgqwNkV
	 TW4tAOrSh3sDadqfsCtkrsCouL8ZMgm2LYboaZu+Vp7UE9lfWkckRJEyh8IFPkOmbruqs
	 mKF0VW197HlAj9hefnEtFFLTB/OCAt0jb+BgWsRbR9W/NhCfWcC2qyVXj10ZJQ/vQ5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=spacemachines.com;
	spf=pass smtp.mailfrom=spacemachines.com;
	dkim=pass header.d=spacemachines-com.20260707.gappssmtp.com header.i=@spacemachines-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BaWCv17P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45077606A326
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 22:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45077606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=spacemachines.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=spacemachines.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=spacemachines-com.20260707.gappssmtp.com header.i=@spacemachines-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BaWCv17P
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3704d30b84fso1754250eec.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 14:07:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794262066; cv=none;
        d=google.com; s=arc-20260327;
        b=cGO/0ASXTILGA62Q6bKC6VxD6iXlS8MMH7ZkLwudyCFgZgnF/dS3BwvhDm0xZhT28N
         DLyX3Tss1E52Iua3W/0Lw7o4Eiyn47BEGROPHxgy4Dc4uVTYjXVL7i2rmO8QFePlhtky
         gl5yO/3yvWhw2KceR/zYkpYZaUrZBBHk+bFzXsl5FIMwByjq3Wfeu7kgIJJiLs0U2Js7
         M9RHfOrS7x6bzJbORLWNhcBnPIztqNC55/Zm02j+QY2OmuxteMqoE/K2VrVRlj/oGWvS
         8ikXD+K+4JvD+fXWNKeOIfVs2l4b9Q+gWD5ekU4Pan6YdJtxmCdjMWWsxGAgXfZRuAht
         TSFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QcUpnpKg20NxvBr0a5ywGW50/2qOjmULZA7gI4yvXH0=;
        fh=m6iZP56//Kt4A2XSRV5q11o2sQnBORPkaS71xEuF0LY=;
        b=f5+2fCZl3HFwLMWEhC3eO/5jsBiaJe4ZT7inCX7BNTevn6/GZK+wnEXZw9NN5fQoLB
         cUQVOqO0Qm81h/TvzRUig5+ERRIapLQ6IwK4af5CdAOE4i8gr+qpQKT7nKAiDXHP3r9g
         jO4gHqc36AX/4uwm2DN4t6t6bQ3P8Hlo59X/CXPtd/WSzLMILQOMH+j19PGWCaQAI26H
         vyL+7dbPeFyhlBD5sPXIVwzsqBn2QG8XoYQjn1mX22LeK5U6BQ4C69osGrlUh5mRgVRi
         skkxKKp3+vLMY0tiqzznBEj0Vy8HIUz+4z/XYgB6ObpX9oQd0lVrbXrqTXi3LO5pEzD+
         k2Qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=spacemachines-com.20260707.gappssmtp.com; s=20260707; t=1794262066; x=1794866866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QcUpnpKg20NxvBr0a5ywGW50/2qOjmULZA7gI4yvXH0=;
        b=BaWCv17PHSiTRyTlxQPASAWMJeZnaXjziuwGrHaCRLqUplR+O3Kjd9torHVzPfp+UI
         F27fPXDPMT0ZfDiQCfyyHaVBZnhJTOL+f5UKoRfCgLiketMQBubOzUgCYheQLm0DiEIZ
         0ooQfMaKuOnrI2kf0B/s6oebZTPCSw6EbpBrXQl3JUIQW1NBiVAvQoOOXtaJiAx0c3gi
         i3f7TFDaLQpscHuXusjrHwiDy1UVtthdK+fyJtyE+IcaCdO/oDUvwe0C6pNMWU0vXnay
         UUppCSBDgt1ALp3dSdpGiyRG2mf8fti5QitibXUlFb04c7/nD3OVDTMjyorP8BWCfO2u
         ot0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794262066; x=1794866866;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QcUpnpKg20NxvBr0a5ywGW50/2qOjmULZA7gI4yvXH0=;
        b=zkrJopyMGwxiEcg3XtHFS4c5lsd9F7v1EgETvgVmAqQWlrSTBzxblY0Yk90SYTNyVK
         MyOqpdKdc1DJkuIxnPiiyVBdJ1XOIt7Iw+SUMPWn2Y5y9FyYgqZ5ZrrhqQfSDiTfHlXL
         41odZLxSefHjtSGi9HW065oOcK+Ead9/b/3GmDSW2hoapuSb6JNwY3LV/HJoEFKACMPw
         Bur/kG7MpMU907CKaSL7fX37uP7RlMv+aGQwJsqlf6zpK2IDyc97Dsai7vsfUKNULWBM
         qNs9WxWMqQisPyDzATpm7sRO0O0Rerze0sKPZFZuXBLI4hVnlM05rqUbMDVZ1rALtl0a
         VStw==
X-Forwarded-Encrypted: i=1; AL+hErEId8f9fJPLrOoBWVnk3uUOtwovdfsBK0KiznGD6y4bA2OBVvGeFVaZCdxjFV5QEVWREDlFPVL6OjMA@vger.kernel.org
X-Gm-Message-State: APuU4Z8f9F/BMUoHi6srXOZXfMLVuA4le2k+MpHGbxYIMhuETLrni4Fd
	olLwsfrLhJldF+DxisTANie9hHpfX+PsjX1+2sXKow+oG03Xp1tX9OgA7iGLh+rnAcjkQetCqVf
	2zl/HyNw4QNjD4nuw7ahygFIjuYy2xVUVfUBpRWaQwA==
X-Gm-Gg: AYBFou2k/n3X+eVVoDw37QDTpCHXsyq+us9nEjmtJ9Z3IevPLvsYaw0oYN9WUc+G6IT
	uyTzgQFlK7igTFQlReVrNPKbv+bmJfgbftkjQAg8TXhtKtBWBP/U7iONyXN1coqBbMg7gI5ZK8x
	POlrE7lq6YBvjOW67itP0kboEzTCfZpPsMSFKVot9OvW0aaAeA47KAt/qe8vPZOQ4FUeLgvOIXk
	D31pmEYDqroQT/sbbNG3E8wPDSSh4uEzc5w7iZs/UgP6xN6iLaXpDlXpHB3ql37wdT2vPQshaOZ
	tQP+tscr0B2HG7p3HWn65w2ri8slybgC2jL3Rmcbv/nUWNQ58kxmvYelXrwsvyGOgqOh05/6EVQ
	vOwe4yPHmqfWk4vEU90AbF0JcBdCtnG1PRg3/93biiu6Yc+m3EVEBAoSLTEw=
X-Received: by 2002:a05:693c:834e:b0:35d:2633:ff79 with SMTP id
 5a478bee46e88-37520510ae6mr909969eec.40.1794262066318; Mon, 09 Nov 2026
 14:07:46 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-core16550-rs485-v1-0-6d15ebe1e5b9@spacemachines.com>
 <20261103-core16550-rs485-v1-1-6d15ebe1e5b9@spacemachines.com>
 <20261104-zen-aloha-35da49a7e72c@spud> <CADMKYUAc3QPCdpH8JL9VHk4d0iETsUL2ao2i4OhoHYoZGoAnnQ@mail.gmail.com>
 <20261109-sheath-companion-d7063fcbdbfa@spud>
In-Reply-To: <20261109-sheath-companion-d7063fcbdbfa@spud>
From: Kohei Otsuka <kohei@spacemachines.com>
Date: Tue, 10 Nov 2026 09:07:35 +1100
X-Gm-Features: AclHuK9l1GWI0bIlcJDD2h4RqXtEuzFkTr5VEGPfn7sQUhXhTFIqGkVSKW4Z4lQ
Message-ID: <CADMKYUBqti5CNTyR=ADwTUpKTbZLCgmDf4D3cNFrwaShsQO1fA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: serial: 8250: add Microchip Core16550
To: Conor Dooley <conor@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, conor.dooley@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 6:35=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Mon, Nov 09, 2026 at 01:54:17PM +1100, Kohei Otsuka wrote:
> > On Thu, Nov 5, 2026 at 3:20=E2=80=AFAM Conor Dooley <conor@kernel.org> =
wrote:
> > >
> > > On Tue, Nov 03, 2026 at 11:11:31AM +1100, Kohei Otsuka wrote:
> > > > Core16550 is a 16550-compatible UART soft IP core for Microchip FPG=
As,
> > > > including the fabric of PolarFire SoC. Its registers follow the 165=
50A,
> > > > so ns16550a stays the fallback, but
> > >
> > > > it raises no interrupt on TEMT,
> > > > which the driver has to know about to support RS-485 on it.
> > >
> > > Doesn't this exclude using the fallback to ns16550a, since it require=
s
> > > specific interrupt handling?
> > >
> > Everything a plain ns16550a driver does works on
> > Core16550 including transmit, receive, FIFOs, modem control and the bau=
d rate
> > divisor. The only thing that needs the specific compatible string is
> > software RS-485
> > (em485), which waits for a TEMT interrupt the core doesn=E2=80=99t rais=
e.
> > Without the patch, RS-485 direction control is missing, but the UART
> > otherwise works. If you=E2=80=99d rather
> > not have the fallback, I can match the compatible in 8250_of directly.
>
> In my opinion, this is enough to invalidate the ns16550a fallback.


Thanks, v3 drops the fallback and matches the compatible in 8250_of.

--=20


Kohei Otsuka
Satellite Flight Software Team Lead

  koheio@spacemachines.com   spacemachines.com

 UTS Tech Lab, 36-38 Lord Street, Botany NSW 2019
