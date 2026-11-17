Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794932670;
	b=ueeMXpxhFLYDCQs6ocJxwFL+hnpbuOOuqa2FXL66DWdn/84Mn3m5w32z7lIttqs7LZ3J
	 9GkkHtHA1SJmWiQ7CEf7Bk64HTFcWq9wIInIraUWyQ7L2i3XkJpe9rtHiqoS63zJsnS5p
	 FDTAJV7HN62W5NS80lRVrAK7HkdZt8w4+t4B/A2MU+2Vv6q2GV/LQE3Qa/N40mlgk5oFR
	 tqsWREdmywfB35GW2yAWYri29uoJ4+VSkAlWVwAmDsthCHq3d4uemk+Ke+E+DYBTXQtpc
	 ARJQh6k2/L8DJJFHWJ3bKWJQic16qxRWCDAFB/W5+e6LwLpZFrhzG8k1EBaGNoisWIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Wxewv3rmU3Q16rUyybTo0MlmIExqFujl8iHouonYjT0=;
	b=lcg30G2K629BzKNTfIRV3RomU+F6g2FyOeaxjlY8GttM2+//oxmlrfPiHGK4zcJhO5Xo
	 vmhoORB5ugenHqAnIX8+hpO2xBtofSd1VhThWiQe3aEZrbqbC/Dz7w0jS27AOs4n3haJW
	 rYRv5wtPqkV1OeyAR/vIz/MlIEGr1l7xx8B4qAOirf/PfDELYWkbc/r2YHBzzJmNhsQFa
	 vy85f8IPqTp+gm9zfADG9E9IfYpoXHagJUsCYidNVNdt7cwvc4rnpE97KCcLgo9PgOEm9
	 8x7Fk37ChWvcJRJbtFM5ncaMg1YTXC1rN6K5k+PH9cGlX3JKvZivuok8xpjbwl2o0bQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cdqQd8jv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3F1606A32F
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 16:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA3F1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cdqQd8jv
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4322d310e7so871752766b.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:24:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794932668; cv=none;
        d=google.com; s=arc-20260327;
        b=NbNb+VArDq1Gmgr6D+K/5YV40QeSAl9dQuSOm6ZAetlqIefwLDeCq4kZKSXI3HIXQr
         dhgJN1YcAhq2sxdt7wIQ3vUJGOHirWCzbhDuY95Ulm1cY/H1imeclB9SySqXW54N6Zfq
         i2D9r8QuaARaBCNFF1HWLGHILxizqEP0mUKmwbiKH4ENBWjPmpIo3NuMsr7i5cjNYXuv
         521hb0KtyZA59Wnu3iUg6Ny8mmbrReuEAOggmTJqBAwyDS+oum0WMZ7XiCaf+SAq6GrZ
         W/OXJUWdMfRDTJi9zKDDjW2zCmmz9TbA9L9EQtPF1PKctoEnHNDQAul/XHf+01Mxwlpy
         IxoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wxewv3rmU3Q16rUyybTo0MlmIExqFujl8iHouonYjT0=;
        fh=Wj9nx8f0QNhE1VTj7/gudKSFcM7w9vsvbAlH94yzBbo=;
        b=WRpunXX/kiv0TPOdnZdrAmqdRLtu8CN/JfYNq5ce7YTmEblKd4FIhJtLGZsCynYFKx
         gbDh7O/2oz90xwAoN3M/Kd5G5TI0CvGF7E78+nZ4x604jKrcQvnW8h5jPnFDJBj2fvbd
         E5yG+SUJZ76Kd3AclKIMQOYzvJrJdlsGCEqrFzmQHPvTwDxPsLADTuE+UzJu0WBxBQ0b
         zxNTiIBIcerSxb3bLa0mmpovW0ljWkNjHnwLnWtTYhfbmHfbgpCHYs3z+pojQbHtLRos
         ZdgKDSsj8/2tkVEitnO9PUfIL+2Fx0Dxsp93Ka0kKUsLsYhALAK+9I1iI9VQ/qwyztvU
         SUbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794932668; x=1795537468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wxewv3rmU3Q16rUyybTo0MlmIExqFujl8iHouonYjT0=;
        b=cdqQd8jvojBdqf5S+ZlBYnRBB0iv9NrxVYWGKdwsf3qISFsmdiLHOpl+UNMQAzU5Ho
         liy/ffvLgOjWoCC0QMtIRtCSaVqYHa8IArufbSdRmDatd8CHbeYDI8B2a59M2Wrb8O29
         5NvqLtv4LgJz/k1d6g/ZfQrzTO47WvsKobB2eTGboiH6qTmucj3NIxw06T+MZKY4mOTH
         seB2ppD/Pobdk//WYyirPBedKHZ3i6zq8BB2cxTSK/1zF1XG4JeHqeQQ/WrdtMt+RNK3
         5yuPyjkXC22spPcEmapMTeUxRVzMVVw38Bm3+Ce+ODpNYfXU3pJjuC4IOnDK36O1bFx8
         gTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932668; x=1795537468;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wxewv3rmU3Q16rUyybTo0MlmIExqFujl8iHouonYjT0=;
        b=m3bJ3kAU8ODsfWn/AR1F90WvAUZKZ4Lv7PWzEO6kGDL4P2IPGFJejaIdkLTSym3WLO
         b1cZVsH70C2aC1JvqrPO14osL/DZmUwtaPatGG2nZUoUEzxQKbaWfCpg9QHLstTWa1uN
         2zDosSujqR7FzjzjFzOJV6kOYG44J6crstaghwrO2DYGMLYZgYuF0c7o0TWwQLngwWBN
         aX16wSJ4JnbccIEIBd/DHRJ10Ev1STK7Ok8bJAKqUzAdrJnegHzASmWAZ2810ZlDK1+o
         KHU0r671jeiNBMzvwmxGSg9LdSDcRXWAsjvTCSnsdQF9GCR6mWr5MFqXVxJP62V+6XFC
         qd1w==
X-Forwarded-Encrypted: i=1; AL+hErEEE+3qAkvyK0lmf7mJeG3P135U0KgbGE2YJKVea9dc5Ioxw4Gbqh2A7JmxomrW6W5C957R2Fwz/sgO@vger.kernel.org
X-Gm-Message-State: APuU4Z9dut5UuXvlt5StZ9lt0e+lqfNTToW4IU/LsKc2xb8vUmyfn9oA
	A7ylSgURCl52dCRZvzvwD1isl3I4jmk/QwGmv1Ptz/3VHNimWJV6eQ3KZP2rqxJClVFxBP0Zxix
	oVmcEKLcKP0pLgYLUuyIpGXtgQZ3+Sh0=
X-Gm-Gg: AYBFou0dlTw7MsDzK4BxNNGGneflFEOY4I6RSZxTPkDdoV2igSbRxvWoNikQSiEV9+t
	E4QrzOt4BKZeTbxqoRUHfe++O7POZohqbBEee8AItx0NGyE4N4ps1oIVp+6a5lmCQj0edOdEKU7
	CZJHiuOd6Prc6Nt1R32moN7zC6IcdzMqC8w//H6J/jQKk6+i6hdgp47MdYuvQSlo6cRdeIR+gw3
	hciQNQYH+QQIeh4A/lTlSdLx41ChgB0nHDKKd8fMkPigxYAk+m9kWHlFg08OUyaeBbf0Ris6A1x
	dmYZ7/t7Tc/RKrp7Z2WIM4S3hSzEUYWtPYiIeEQk1/2s0vGuowJg6R5ElLo7sf0lG+5eRKMRoh/
	/teWdDfAX/X3n0B5SgFXg2CdTBQJXdVbcDcLO0Zoyr2S88abOBR7NVkn34owd
X-Received: by 2002:a17:907:d308:b0:c40:f9ea:7387 with SMTP id
 a640c23a62f3a-c5096110ee7mr1203048466b.6.1794932668009; Tue, 17 Nov 2026
 08:24:28 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
 <20261117114432.2794961-5-a.shimko.dev@gmail.com> <052adff8-b1d4-4cf2-941c-cfb2725d13a0@lunn.ch>
 <CAOPX745DQDpYh=PNQxDkH1DbfwMRwD8DV81TaX33mNk-9aX3oQ@mail.gmail.com> <6b2ffa4d-b99c-42d1-8729-00f180b955b2@lunn.ch>
In-Reply-To: <6b2ffa4d-b99c-42d1-8729-00f180b955b2@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 17 Nov 2026 19:24:16 +0300
X-Gm-Features: AclHuK_kxuMbS-JfA12If6aJeq6DU7qmi51H7ZrXORdCaUCFkepguGc-ovdSkpg
Message-ID: <CAOPX74709XiLXLoioDJStTSzzhstC2sHpM4GieAO=3-37E18pw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 4/4] net: phy: dap8211r: add PHY LED control support
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com, 
	pavel@ucw.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 4:49=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Sashiko said only [1]: Sashiko has reviewed this patch and found no iss=
ues
> > For some reason it replied only to me and linux-leds.
>
> There are two different bots. The netdev one send emails using
> netdev-bot+sashiko@kernel.org, and it gets the reply addresses
> correct. It is also more accurate, less false positives.

Oh, okay, nice

Will wait =3D)

--
Best Regards,
artem
