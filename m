Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788A9415B60
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 07:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787298738; cv=pass; b=gI1osClLQlx++ZAC/f96rsicl/j943+IWP+U/nM2LvqHzKNLhQhwYVZqKLAkTe4iIFyTzPwXWnkzOFkgYEZJIlQf1jNUa/M33lWZKBgl9577+k8O4Zg5Vd+5RYh9b932bsBuHVLFqSHyuK47kr8qqYFsFKdG8TabDdlQFPxmm8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787298738; c=relaxed/simple;
	bh=iCkxqhNZxgEtFomtEu7YxBIX5x1KY9BNtJroquO1XxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ic4CD7E/RAkcJ3Xh3V41rSPD6PGa/VcwA5UBaxPXDbE0EFCcjxCgo5or6jIFj7ZlhIp9laSUSdGksTFCmbtMQlvkz0lEABauFoOmVXs/dCcrtINNLJvo1Pm6lArjET3+g4gniTWeSzfrDJfm2fqQQnTHnbw66FXzZl0AVVlh/aI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmaYIegP; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmaYIegP"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-480033bdcf4so394621f8f.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 00:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787298735; cv=none;
        d=google.com; s=arc-20260327;
        b=Efeu+jlbkBLAZ5m8hFRdEP8axHoR0rJWTh3Ub+MQ0i4aedFSa5J4GH1wtdnSxyrGsg
         SyyYdCKDBxRWdn4Ni8oCoFRWhdrB38a3OSXcMKZAaZwrofFzaMb8HfHWmXIs7CWCbvp4
         mberUjhe29uhM0dg98dzXl36zGXLDqrSJV6b3Cl11iWocNMxvnprhMf7B/LjxvYohGJa
         y0NnUlui+Wf+R+h2pkjvjdYpsSaieY9/Lc/H3sgjoA3CP42ZpxA8I+IGOrHkL1qE9b/2
         Cd+innERAtFsy4xgJND0RTejJBlXO+rnzikFsceMT8xNankJVev6VrWM7VnP2DiouK53
         rgmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WXVNR4kHchxo+dOC1K7o47R8p3Nbe2lAn3hnL/xdjqw=;
        fh=oDHwLCYtpSa64Qn0vKucTw/48RVJoucHF3OH7tyuoWM=;
        b=NMJa0OzpJfDlaJpLE8pG5/5Pbvev+8WPns4qfdkpaiNxLpZhemeUJ+1JS2IImc86W3
         c2Ioe8wjojousXz5xJWqVSEoGk/yKkVUThH2pzom5YYmsZH/foMT6BYJ3SnocgtP1mdd
         +kSFN+Bw0kQAaMsvI5L9MuXqldtcZ/jWLKVHZCVPIV1W8JPiY/6g1hFKu15UJGPcITYN
         xBsFOBQzOCsaLietguDZlCm/tFFw4CSf44v9XsBVXR9hAtqG718jFlVDvlRlkVyztXXI
         d8ifiw6olFsO2GQKxh+nXv/Aos7f2u1lig5Mroijk590uIz7v7zZPWoGKidI/ULk9lj+
         8/IA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787298735; x=1787903535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WXVNR4kHchxo+dOC1K7o47R8p3Nbe2lAn3hnL/xdjqw=;
        b=SmaYIegPGvowGAWTdIAVIQyyixhEpKqghPDCzlHFKWV+OLmkyg2JBGoIMOW0FDPH+S
         8hMX6EDqZJZqJsW8daZUL1d7yFVP6Qf4rLRmyBYj2y+5LK6Ie5HOi6Bg0X/J1kzIB3vJ
         8p3a79EozxMPxbFrfpSktMYnPtFbO48MKqT/XsUopwsVuHnJyJbbZgHXxQf6+rG3n8VR
         x5GykVVoRatG+Id5LeKS2g3jC8Cj5dHePa0uCk28ckFydh2UIbAuYLtZoLkSD/D6EopN
         gDvu+SRgfuXTAhxzOasZq3AzvNhieww0bEKpaSXwOIP1taFwEoAUMoCEjFUY6vdpRl/X
         ZkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787298735; x=1787903535;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WXVNR4kHchxo+dOC1K7o47R8p3Nbe2lAn3hnL/xdjqw=;
        b=fFDzVbNPRLKKFzjIwViOKz7/UIWN+JmX7JbG8x6KvaWZDLMcKRN0zsLftPpAreN+8N
         rd6L4fJee3uH0KCcwiaRhGF268eYO5Jt5IVHJyDl2JDbQXPbzMS2QeIt8qqPpirI1ifM
         RCzvyHMl/8xaXoY27Ud3lgqttooa56q/o2xfUfmx87p18QrkNd8/9yYKYuOS1lYwpaWx
         bjx724x+AqNFidcAO/B57NRfBblywiUwxNkDRddi55A9vrNlY7KMMAovU7tws9ixB7Z7
         QkV65sBKWPYVhAJpn20cAiogr3K2FnFATMQI/EhzjZ2bHN2J7g+vSTdKgjaCu8S6Q+V9
         PPvA==
X-Forwarded-Encrypted: i=1; AHgh+RriKru4wVqhfhlrNaueQ84VFGIHVQd2C5HFqyRQkc94El9U09DuKMFJfa2hHzQetF0ge1hsWndECWRb@vger.kernel.org
X-Gm-Message-State: AFuF++lSUwW+g8XC6WN0QcgWG0AJ9gCYpQ3MCU2AKyzIolcpyeynR34v
	om6/GHwGpltZjecOZGbVTOxi2SCAKirdsc90cSVIqBGF/XX1S8WpddhyuJI3BudZf8fnIBQZOEi
	2KTTbXgJamgiN8V0cGVPDkQWnM6EUUoo=
X-Gm-Gg: AR+sD12QbXiXzzQ95vCzsL7iGGjl+uF0WrJjnVA4jPsX685jirv9kyGeDvM3TBu6HsB
	J9fhRifOQiluW5ZvALDU4LoH0lnfKjXoRrYa1BQIPH/REVRv6Ye2kO966d1IdwTDW3Dis1QkHdC
	ElL7xtKnByNwKyonTDoX8VEkTQF0INAXzucv8OAx4QiOCikGE7nltDI0zHI4B9kmcLB9moD08l/
	pF5AsQeWow61XnXf5zgXfWIiZkzAM/Cxm2OLP1Kn7zLwDTOUFR26sE2YWODaRMGTEUerUnfB/7R
	xPmvRBULdmvZhtqsTOsa2Y3mM1ckOoOBLzCwDyO2felIbLHhDB+22F3ynPh/4wLsMNr5KXLXrlE
	V+iti7Vv0IyAd1pw3MWfEF0qD6ClQGdvL/vg=
X-Received: by 2002:a5d:5886:0:b0:481:568e:11b5 with SMTP id
 ffacd0b85a97d-482c0b4207emr6296886f8f.5.1787298734749; Fri, 21 Aug 2026
 00:52:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819103926.2136712-14-prabhakar.mahadev-lad.rj@bp.renesas.com> <aoWr0gfN6sQmgUie@shikoro>
In-Reply-To: <aoWr0gfN6sQmgUie@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 21 Aug 2026 08:51:48 +0100
X-Gm-Features: AcwNN1XlRNqpAUbeTUrYnSgdpHgWqQlabT6nhqi5ctC444iuectwmXZSSzZ0vF0
Message-ID: <CA+V-a8vwNHm+KZs74ktpuvxKjOcqLtcxGRFi8i-_g9jcPs_3yQ@mail.gmail.com>
Subject: Re: [PATCH v4 13/15] rtc: rzn1: Add OF match data to gate SUBU
 register access
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank you for the review.

On Wed, Aug 19, 2026 at 2:12=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > +     if (!scmp_val && !data->has_subu)
> > +             return -EOPNOTSUPP;
>
> I'd think here a helpful comment for the user is justified. Maybe "No
> valid XTAL provided and SUBU mode not supported"?
>
Ok I will add a dev_err_probe().

> > +static const struct rzn1_rtc_data rzn1_data =3D {
> > +     .has_subu =3D true,
> > +};
>
> 'rzn1_data' is maybe too generic? rzn1_rtc_rzn1_data? Yeah, looks a bit
> weird but I personally still like it better.
>
Ok I will rename this to rzn1_rtc_rzn1_data.

Cheers,
Prabhakar
