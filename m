Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8DF3E51E7
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544651; cv=pass; b=UQpgyRqRnueaOvyrHheJpcMlphBG/PPX/ddxwFT/tkZaBEZa/JcMGMbRPgAtj80lvwB1aPorT0RpgKyaba8OPm9obcEMUPYWonDdHuEoZ0hpCzxXpnYbFLOcPmw6gE7OtskF/RcZvT37AlI2o8nPkewlLWF9myr77fbETLh2ZeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544651; c=relaxed/simple;
	bh=6LIKfbDAVneuMSs7+f/o47O+7eA2LK8R+Sj5PDUGEII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ArErBwrivdAK2Rc4HPPdPejtM4xEhHV2p065InCihZVLgmgcdNvHGjgWNP1rZ6NFO/8IP+ThJl2M3MgkieFQv6IlmeblGTcMq4pECHaXNeXMNdByJ+kv6G8fK/kFnYxd72580ERUsNjHPWlYui9NKlGlOpkQHyLVaYBmbHiyDJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNB2gY/w; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNB2gY/w"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47de008b020so2724738f8f.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:50:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784544637; cv=none;
        d=google.com; s=arc-20260327;
        b=aZiMU59Nr6zzTay+B7fA0XPcJX7N72N9rIqUdtrReqLJ+FUrkcuI+xpLV1HFsrt6nl
         0aXj6KxWupT+ugpjlBLI5tjHj+goK1bWmTaeQK0Bl9y9xbhxyJrpcHIcYfxxvYDHwVTz
         4VVTtpQUZ0lQX4eqor/sDCfAXruXxbymCuaa5pPNA803Zt0OOJ4ZiyJwSTlxsvtAv9kT
         HMhHTYrHrBvIxWC+ide6Qw7rkAc0bSbh8kkv/ZaQSQ0ttd/Iya+hA6KSap3YxMDOFv/s
         7KAMsSErYm07rGrtDVBRa6OfyxEqq5m/7AdIB/UM77d6JoQTndUtoN2AD+dxfmITFntD
         zugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6LIKfbDAVneuMSs7+f/o47O+7eA2LK8R+Sj5PDUGEII=;
        fh=FMuW+26bcnXK8wzai6HNMNVy8dNSwc0tG2pkBqRAp4g=;
        b=lMdefsxNPXvfwQh5QazEGYXhlGGQQR60fZO1a12C5o0/zjCTW5gKVXWT0dJNdntIFI
         p1tcmfkKxEH5MJ5cL2Tvw8246S6fPfZVHFtn+7JOtp3Kxg7EKzcXaF2FXIiWuriuj+nK
         gJNd+hcudrb2AsUSfhCxmE5PPIor8C8bqvpldlnGp3c0vP3oCnvaTTdq6P/40SBvduBw
         q9StCNDvGcUtN0HZaTxjPliF4RrCrVzHJ2/5CeX5fiEjIPINo+5ivoC9GUu7ZoYYcot9
         8/xIv6h+XtaiuGzcq2RZcOItNANR2FaYrAbj6Aq6WwCZkcLQkkaOMu4311J6Pla8q9mi
         VNsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784544637; x=1785149437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6LIKfbDAVneuMSs7+f/o47O+7eA2LK8R+Sj5PDUGEII=;
        b=cNB2gY/wccKpu/LF7vqqY6A3quWLN/f6zMGwZEqMlcMHEoXIwiYgHXpHpRta7bFryS
         cDxLrDX1BvAEI1WtAn1sO+YOfhvRN6lBEPQVmCWaXEMVpbR3U2dxJwhzeNTQMh3j9a6A
         yDmNTX7OYcDikeBt5RdQwnC127eYSfjoH+OZnhsX24MaNH8g46fAuFrsVJzwKQEUs7sW
         S1mnWy33WxjcoPafzgNqR+PKzmy+aLdFfusY2RpM84EpWG3XBM9EAXFlUaKU7w1Qok9U
         ZPftWxlfk+amtTZv37KYookH730ft9Qotzsc2rcPkVhFpde8LXtyQH13Vs0vBA9ItPjb
         i48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544637; x=1785149437;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LIKfbDAVneuMSs7+f/o47O+7eA2LK8R+Sj5PDUGEII=;
        b=ISxbjcls1jSZm6h1FdBAWTrk2cy8HK5BkwvXW6iXAcF69PlUuHcsBktBosN3XDwytT
         5IrEMkTA1YtAebupe85SUQsdi2QKrrujCB05/PhoXsjmT0gwKJAHCkSKmluRj1R95QB2
         Ed3OwVUbVcUU/pltMt1Xe+p/OUSbbJBw7d7DnNTluVTyYeZuEVI4R7/aZGgZpekips7u
         RmZMSA+923gEpV/47IP4vxScF6/7POBJGqbaCuKYVoHBpBDD4RdnNuoPydC4zR/IDYGU
         g4f5h4ZF04gwiyrdtg76k0Nlx+ei/yqfTTTxSEN9eeYf9Td7v8FhBc2G+54o5lyz1deO
         YIgQ==
X-Forwarded-Encrypted: i=1; AHgh+RoU5tAmVB5oAsSr/BrtuPPC3arYkGdG1boJPGSGK3xPq8W+E/TpJz/4gaH+yXl/uNcSML6Y51j73Ncu@vger.kernel.org
X-Gm-Message-State: AOJu0YxtZ4mUQYJrCzw8uNIQWD+iJZwhDHnhiEtnIEqHZtSTPw9/wV6s
	/fOot1V94KCSlU0ZfuLBciUxwfo6eYdMsFqVaVRNwf244sPx+YwTymuLSxPcEQCLEpss2e6jvdg
	Kfv1dffswNXHKnmbC/LOOivDg6zW4M2c=
X-Gm-Gg: AR+sD10mtiyJRpvMH44guw3jfmYxoznzbe+xDyRKy8+p7CdKfDFSu7A7DMsVB30O6jb
	Av5kDeBWoln2B7q4H+FmbquIOsENIpZOUZcgB8ITDyNe3iG2zw8lgfzfWt5MaTPkLbsttAzlY75
	ojxN2JQam1on6TPCWFPQlNMPuOxOKGTh79ocOVDw+X2GdusbnvVWku5oPPB+bMaZ8ONR5/kC48j
	2hzZErh8CBhdTzo2Lip3uwsHsqdpTdkT8QhpMaXvqXWtw/SxfVhvDwwJyx+D8L0pN1SjR+BycCF
	0kn+sqsbMG3BgysQVVFFX+CXC+xLV83PMWSfSE+UiSBuJZY=
X-Received: by 2002:a05:6000:26c6:b0:47f:71a0:c060 with SMTP id
 ffacd0b85a97d-47f71a0c528mr6994984f8f.2.1784544636880; Mon, 20 Jul 2026
 03:50:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260716123434.2576253-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260720-fractal-prodigious-spoonbill-86f534@quoll>
In-Reply-To: <20260720-fractal-prodigious-spoonbill-86f534@quoll>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 20 Jul 2026 11:50:10 +0100
X-Gm-Features: AUfX_mzmB1NqSZ6NtXzORayD9TuW5BGNtCQcsQ-KypuekoZwKlJVJ80qQGr5ZIo
Message-ID: <CA+V-a8tfCL58j2TvoO1VhhDAZf=8LB89R4O0SycLghYGf7Rr4w@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: clock: renesas: Split out RZ/T2H CPG binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Mon, Jul 20, 2026 at 6:55=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Thu, Jul 16, 2026 at 01:34:27PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Move the RZ/T2H and RZ/N2H clock controller bindings from the generic
> > renesas,cpg-mssr.yaml schema into a dedicated binding.
> >
> > Unlike the traditional Renesas CPG/MSSR block, the RZ/T2H and RZ/N2H
> > system controller integrates additional functionality beyond clock and
> > module-stop control, including reset control, clock monitor support,
> > write-protection registers and other system management features.
>
> Nothing of above differences got reflected in the code, so I do not
> understand this reasoning. Binding is exactly the same as the old one.
>
A syscon regmap is implemented [0] as part of the RZ/T2H CPG driver.
Since the RZ/T2H clock driver uses this syscon wrapper, a function
pointer is implemented to handle the RZ/T2H-specific configuration.

Also, as the initial implementation used separate device tree nodes,
Geert suggested splitting this binding schema off into a dedicated
file [1].

[0] https://lore.kernel.org/all/20260716123434.2576253-3-prabhakar.mahadev-=
lad.rj@bp.renesas.com/
[1] https://lore.kernel.org/all/CAMuHMdU62updtKeBBk-vO3YP+qaWTGqHQnzKvFJbrz=
4J5eEPMQ@mail.gmail.com/
Cheers, Prabhakar

Cheers,
Prabhakar
