Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5103403ED
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672908; cv=none; b=ue5aJ2tFBk1UHKlNBXUbBCjZu+ARyiI9rk/p1SE5LqMwJQf0P4miGN8PARSZvp3nJMEUKJ1+LDj1xqVoM9AFu9286MNjtjWW1LZOjcl0ow2SBxrb0/CfT5b0inSACSiJWDVqDz7fE7BhQqX4YbKcQWPsdaRamdjtR+tCcwuJCF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672908; c=relaxed/simple;
	bh=yGRUq+NkeA2wCzaT3ddrS1lhHL4f/8v2x/N+ptJUPEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Colq3rnasgd+AChfnU2MV5zshmnw2aCm9M98xTGAGUls4t6My9HqJbe+p2Wi3NaZP9imoJJ9nJ5LnLt2VwLG6yjrPV4HYeVVcsVHIc55vTIz0SVO/8NYM+PrIAPi/d9Yn2aEvGHDTJ5ZBhspvxKx4XiO6D2p5YKLTVLM5zOK/PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4cacd3409so2248502a12.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 02:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672903; x=1791277703;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M48abSoMOPLnpPLpLH2wH9c2xeQ/JgdDngp0dUmsb3o=;
        b=gEKEWbUoiNNXKajQFTRtDW5UToMP/ad1npT0bQDkJistGNfmRpTjLXrpI8ZdIe3Xx9
         haN9SZc71YI+vrNlabxyd5PV63b2i90oXMrxvp0TwkgUSZaFPCUwGSQnqEaRGev6BKxA
         u0XEsAosGU1xAfkruRJbmCfKsJFTv02bppboetbBdsrUiFZdVg4ZWTADPaVSd3/nQiVE
         ioMbeyc5Nkl9qXpY2ZIxJGbXGFVLKbpr+3nUweXdiUXsgqlg6CPOJUKTbtPRcfNyDGlq
         iu+7gRBauR676D4FeuzLknA3ocaNnPGfRv2P7CVSCKaX847xg5JZsotxGurQNKpWByFv
         2pug==
X-Forwarded-Encrypted: i=1; AKwUvBxH2jHpOYhKzvRdILphKD2L8dUXamdd2ms8QmXCf2lct3FLc1iaz1s3DexUdxQA6KsPx0OA8mkhnKE9@vger.kernel.org
X-Gm-Message-State: AFq9FYIItPAhvg1uibsfTdE746bNSZXSGgXabxZi2Na3PRXtChJBJcsc
	5d5XCvLXY6GrWnBZbcdYn3DiaFoxs8T7aFsQrnw9AWYl7v/t4P4iscBSkD+PNQ==
X-Gm-Gg: AYBFou09SXFSKGfwaVR5MR//qBXsrMIOr88kvGHMYQGHlnzB3KXxyzknAlZ30DptEUQ
	gDtdc6x7IG7jbms28Xk1Rd3xdfRETJ73vUYcNSygaTkAgYrtHR2O1nppziPZsh2XJMVWydZqagx
	u1Apt6LhKO0NDvoYWM9V1g4MeXLSo6ptaLo0MH2jQUe8Lj7lY0Fc2BN/2I01qqNq9grai8HqjSA
	oL0I/dgM33zTgC6v1OcL8j0fqSL5d+qduGbrRn3URxW/0IWscwPl5HdhTgNMIiv6wFr+xVmfDu1
	fW+GeylSiPNTu+ZVYpCoMxGVpXLn+0i9TUehrAGm+jhiPN+jDfGf7Zqp2HA1xcmQ5U30TlfK9zi
	PAfBLDsZPwJBYJZlqNQsGNYAZ5clJI+gLfMrfBUVqFWxYQuoZXsxMnuZu4NO/mKXryYD4c9I49a
	qaoR8YBwSkldivMUSNjzAgEDlOi6l++hITglRUXDvG0y8sgV40FDeLeZ9HnwNfPQfEAfT82bOuF
	ywocM9M38LnFT0dGKV2UXUlRWLslfBgjdgIgA==
X-Received: by 2002:a17:90b:2c8f:b0:3a0:e163:fbba with SMTP id 98e67ed59e1d1-3a0e1640006mr7781890a91.16.1790672903184;
        Tue, 29 Sep 2026 02:08:23 -0700 (PDT)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com. [74.125.227.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49804220fsm4491908a91.12.2026.09.29.02.08.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 02:08:22 -0700 (PDT)
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398a147688bso2860782a91.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 02:08:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxAwClIYnPhoJsUy9vU/HuRp2TVjLMqGXCqErqJjpf3W9TAt2NE2LK2CP4YCJEtl1NKVBftgSxQRc84@vger.kernel.org
X-Received: by 2002:a05:6102:2d04:b0:7a6:accf:72c1 with SMTP id
 ada2fe7eead31-7af19740319mr5405907137.0.1790672496458; Tue, 29 Sep 2026
 02:01:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com> <CAMuHMdWWoH-m972X1Emo6gis81-_TUs819gOPkUwtgnR3aQhGA@mail.gmail.com>
In-Reply-To: <CAMuHMdWWoH-m972X1Emo6gis81-_TUs819gOPkUwtgnR3aQhGA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Sep 2026 11:01:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUMURt52wR7kM3=7GKv7x-3O77MLwSuUDt7KJEf9e+hqg@mail.gmail.com>
X-Gm-Features: AclHuK98mw98nJ3_l_Mt7cVTGbvizjI_Q30Ugi6pttPN_xWKMIDQnQGX1HfBaig
Message-ID: <CAMuHMdUMURt52wR7kM3=7GKv7x-3O77MLwSuUDt7KJEf9e+hqg@mail.gmail.com>
Subject: Re: [PATCH v10 00/11] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 10:12, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 28 Sept 2026 at 19:34, Josua Mayer <josua@solid-run.com> wrote:
> > Add support for a variety of SolidRun RZ/G2 based SoMs and both
> > HummingBoard IIoT and HummingBoard Ripple Evaluation boards.
>
> Thanks, will queue in renesas-devel for v7.4.

Except for:

  - dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow input-/output-disable
    Already queued in renesas-pinctrl for v7.4

  - dt-bindings: usb: cypress,hx3: make peer-hub property optional

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
