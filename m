Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792500555;
	b=aDcFmsmlfQ3biShkrYe++tSlfiCwiEPEt1GVACNFK3Z512EA4cJXESjjle2Hq2Ray1dU
	 x7EW7E33VCioyMlMrbkY/8ebUokOqjOB8Opo6wUrf/LdCVM829o4lvfDbhtPwp7Mg4/xh
	 7PV6DmHQZXuLgZizDFIwykj6HdzqCQG8c+SRwepXAaGIk3uUOIbRezyMsn+FY7SLhh2BP
	 aFhN2QaztHMpRkr48MLXAIIMQZD6cOtfnTeuYgy4nOYULJ5IsyDbHEYuzieGKdx2nm4/W
	 0IiXskrA1w9pxKdiETqG5iNN5vxToNu1eBF3LlB+5+MUcBqpg5zIR8Sky947kC3zsdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CqnJR5Wud1DAN6Fg9Q8koGamno6KsLilMYisqlHxAoA=;
	b=lfnZuJge+oAQGtJA5w03tvIPE5AxqwwbZ098KS4+BIMOhg3C8gIF/CJhxCvKxQyMSzYy
	 86O4GwUXOiXvutyvQTFrQxRshjYSrZ0VCuslLqB9UM1Pu0uTVeNUrMYz/KDuil5ivEUrI
	 D9P4n1hGjb2+wVFcOTDINIszgykwufOy3iWqHV1rqomEoaf6Rv2uhnisWZZZJOJBnBRrE
	 7zsuj0mXRGXnCAWLF8+54QFgI15YtGTdWz5tNkPRACN/cDlDCkuIgnIy4Lztjr5wvfSly
	 mZAcWiCMBhZJ0uI8tx2Ix6/oHKeAYo0UNxKJpP3YVVRqpRdxqAqZaqIE4anrAwv7bDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=zVsNfsCP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAED606A31C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBAED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=zVsNfsCP
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso2152526a12.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 05:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792500554; cv=none;
        d=google.com; s=arc-20260327;
        b=PAkcSvv+GGWXQ0rubKyNs8dnCWtpIna6GRzyg6iLC8WlZF+G9KiXtMxsOgZAiLRXZo
         5NmWhRxm/KimjunIeWYixdviMwkwGmjWuyRLHsZL/w+OQldCi/JHsdEN+LtazRl++6xa
         S9Ay9yZuIuCTiB/YopqpXuxM55LJZom61S8tlg7HUwezqo8k14xq/AcJbWZ0qD8AYSlX
         Vb5rsqLxmuBpQvp8NR5h6k/JnyO05grbmFV4ix0AQh7uc662uVur3q96l8M5604LJTPb
         9l2GyanHk+qWnOuDYM0VbK+853Z5LiMOhJxhVvJQlt/3MU8fSp/Abqfl7l4XIQpR2DIz
         JAkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CqnJR5Wud1DAN6Fg9Q8koGamno6KsLilMYisqlHxAoA=;
        fh=HPDpg8mI6gO9Q6TWmN0l6bBrM8YXF3JKWGZLu5vfCP8=;
        b=KZLkeL5q3bzAlGgAnkVPl0I1I5ZWetmBQOn3zOCidLGH3rAt00gLGJCYyib2lGAHBr
         5cvmx9YbzG+RX3niLdkjDWmpMTCJZbicNIpkzmiMX5RK1EgrQTda5zmwDrjuMU2UQaPp
         qqwoZ5bhgWiqD0um8mSZBLzdMDG15jGUv3d7Bw+e4a8b11bYtjRY1ElxwcjqurU13wtS
         gFEV4zP/4cCX9XBMcaXA8X32Pq5Ce+VeE55V8/kTtoNHwa/M2zXY9Cibs9eKmXQzZQe5
         npVmFfhvmSSZeRN/9PX6ySw2FTnzccESLrpf2Uwlg9vrpkf93Ye+dSibEBDZMZpXVeCT
         Tvug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792500554; x=1793105354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CqnJR5Wud1DAN6Fg9Q8koGamno6KsLilMYisqlHxAoA=;
        b=zVsNfsCPZBw+Ri9Xsl9wXoJgEf/7Sp1i5cuA+AIHozLkCdfMyG2Y9C5MyYzCFflNI1
         6125FjHNDCyTMFbq2bJThVOhmiiZPwysz7oK87DP6I2n94+OMe1wY/D8Nlcx++4Sn/z/
         6gzXkT+egtst+XZqZzak3H1NWz/2TCVNNnGouMW9VyiAGB7DDSWXXKbC6MfRSzExb0V7
         uT0aZ/CXgHP+97p74wan3UJk/kiUNTlAtFaUE0pcDCNNBopsRqxA3/4WLHK7VBSK91Pg
         cTuOUzsfdFwbyY67l3gDHf0H6K1MPvrHxExlepovoXZAkMFEtT5SVx1uOSfUe3OCkCLJ
         X2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500554; x=1793105354;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CqnJR5Wud1DAN6Fg9Q8koGamno6KsLilMYisqlHxAoA=;
        b=Y6kHs2biN5G3mD9yqvP2Q6w2orAOD7PxfdGEVkGBBbVfmeM8NWsOstyWT8hVFAXmXz
         wU7u+T4q5MId/UNhSufvWz2+MYLotJCKwSHA4ysNRQmQkzOgrclF6ZA61x1bk5iegs1N
         ZfzhKSsf0Bz04zbx77zzW5HVVrvGwfnCwa/M1MqRxrrPMZNcUg3yjlugLXLkYNCvq7aW
         mAVM8NAQhPvFZiVVV4S1wee47ZxfR4aeWWTusSjaiLiXmkYywKqV96yEUuceRq5+ykei
         xMZzCC6net8ViPn634YLDF+yotAR0bQdMSRDwAZOhZkJY73BKKUreIPP+ElVvEsQRSlr
         nqCA==
X-Forwarded-Encrypted: i=1; AKwUvBzi3vLhboVT2W6W35/WsLPw6kkuChX5RjfIfJ2bPSB6A3fWc7IP/F1zUH3T2H2MNYOxXA8LZRngtsL0@vger.kernel.org
X-Gm-Message-State: AFq9FYKG3y3Ie9sbgQ3/1D7+GNkxriqV06/TJrdQFN+1It4ReKGVYIMB
	oUM8d8E7kwuz/1TfAIERRgtQEwX8vXE6kWWJuB3b0xZOBpdYvFyZrKoHCt5nW/yTdd3ji36Fx/R
	HLl8BY0xFQOkFUVwqNAYALSjGotiNgoMAGNmjDG2EXw==
X-Gm-Gg: AYBFou0wm63NDlVqkcK27nedXVvbSRc8QqokiPZozIDQidl0fbNML7l9rSL5GsgpahN
	0eQ8+yLjjO6D95LYPWUBj4drUrdK+6w0vNC8DAbaKZ3mX6faPETzhPYqBPPC2g1DnzTUJQSUnix
	v7YIdF15HQKW7gdlOEoYISabrTnK+NIUifJihF3Fj2oJBluj84ixTHVv042KuDvjDjxUfHhie2L
	Z779gvh2Cj25tiq8xUM7uxCBhH2qyvEAm9MVDpK69hEuwbyCo1tGVmjmvGhqUfSrBRET+Zc1aa7
	IJftdiflBA/1sD47SUSxyqCpHb6ntUxkQ0JXIFyL+1OqI9YWazr6PBfYfGtMKhEaL+jFB6IbsaP
	RdU2v4Ckk73OzoDZnrDofeBKw3dq1tbSgtDl6mfNs769z
X-Received: by 2002:a17:90a:da87:b0:3ab:36c4:b502 with SMTP id
 98e67ed59e1d1-3acef19656fmr9756442a91.30.1792500554208; Tue, 20 Oct 2026
 05:49:14 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020093655.344585-1-robert.marko@sartura.hr>
 <20261020093655.344585-2-robert.marko@sartura.hr> <554ff2eb-af27-434f-be62-17246c7a302a@lunn.ch>
In-Reply-To: <554ff2eb-af27-434f-be62-17246c7a302a@lunn.ch>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 20 Oct 2026 14:49:01 +0200
X-Gm-Features: AclHuK_rohgS66giciekkFEQ6V1rvibGJWMBWALaApFMciIq_wE3KnKfDINfbIc
Message-ID: <CA+HBbNF7DKkwu9X2=cykc1brHLmVnbYJe2VqbOH71S3sULu57A@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/5] net: phy: mxl-gpy: add MxL86211C VDDP supply
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, lxu@maxlinear.com, hkallweit1@gmail.com, 
	linux@armlinux.org.uk, lgirdwood@gmail.com, broonie@kernel.org, 
	michael@walle.cc, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lrosu@maxlinear.com, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 2:39=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +/* Packet Manager Control */
> > +#define VSPEC1_PM_CTRL               0x0c
> > +#define VSPEC1_PM_CTRL_MDIO_VOL      BIT(14)
>
> Is this Packet or Power?

The datasheet calls it Packet Manager Control.

Regards,
Robert
>
>         Andrew



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
