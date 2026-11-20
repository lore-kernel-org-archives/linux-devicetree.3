Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795199379;
	b=Or1KUK3jYfkQUbMv+IpgyxFcvlrUxfJG5krxje3ho4f7obFPpdTUQ6saZFNENoQt3bRW
	 KergCblqm4nUGTQx4Q4BqczQFaQ3PYK9oiF3EpwieKUq+lWwL2D4I4tip+zFf3jPh1a4f
	 /hdjFFkHq0bGtGdyyKx0L6kNGRoIQuL7WTPMOX03mznX9Pnk0exTHQySj/JxoyMZYkuPd
	 SbEeO9FvHD3ZlZIRhu8vUL7pq7vMC6OiNExd6o/JYPNp+7jWkNKC9AYzmvRHiuCl3WvWH
	 9D4kor+VeIR+ERrJWCaITz0WtGZEI7wwAOb24MoMEAc7N3TcXudLC2zOb9mqP3br7Tw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WpZL2JSgED1dxCTCDeitpd9jOOz/PRQfRKQZbZU7GDc=;
	b=4HYhUSMDaadumQDwXB63vSVYMdq83xXxrW3C6ov2elnief+OsaZqwaXYWNWpPCN/lKUB
	 p/ZrX4LbSe8DYQ93O50hqCQ8XqRxszW0Akw+0rFiFpaCdxtae6iAgqx7Mk48BIta29bv5
	 VtMZQg6UT0NAvo+Z16GMjOzjipYA5BZSnDBCnenSP/+NxmKxsyjFRyFojCDJ/50TYh3rd
	 vqD2stnlg5CN0tJ9YApzRPc4dsnqXUlTx+0ou+lpzGu85EsiD23x5b1NWSoX2JTXEBCFI
	 B1KDhfVnCStyz/NpuvpmI385CxToDM0vcWHaK8f1np3XBAPf6xK6X2OeWJT31kbwwFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwABIWmP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEE9606A338
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 18:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEEE9606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwABIWmP
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so676919f8f.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:29:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795199377; cv=none;
        d=google.com; s=arc-20260327;
        b=PZhsK8drAlezQv7U/Zpccnj/BeIhf4l5QYQdReYkBvwOtsoNw4KVm/GKzrJWVVcmKc
         aPdL29qZt24DD8j1X/m0jkRrJGbNBdfbMoYWgWTNjJXHiYj1UPf3eUJFTHJElMtIiJeX
         Nvs1iXFtjSHflam0JY0u2I0lxLPmXkI+yOBz9YKUG9orpKCtLFgOI5XLlm8OBklcCV2e
         F8liaAlSHXxMaEAUuROV+bjzmHjCdFY+eGSoMjvh4BftONRLl9x5JWkv6ok5cHTzaN13
         mgnOKrNhCLOZrsS8B6pLTevy4IQnWDtl9JkHUN8J1C+Z4CZaMoWx2ITu5ZuHQ1n3P9IU
         +NXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WpZL2JSgED1dxCTCDeitpd9jOOz/PRQfRKQZbZU7GDc=;
        fh=3zfQspQHNqQIDSrlGf88cf3ay4Veze1MgEJNwRemvrY=;
        b=IUwmMXa+63QlsqEknuIuPLfoBWAIQhu9gId4tYDrQks1Ji2XVlo1q02JS56HOvwXb2
         9ewvcHYaVoK02Z3i48YytQxpimfjlI+T70m3hGO4BUPs7xN2A02ieMu9r9Om61Blej9V
         9mX3Qnbg8D8dRsLtkESrOXSASJqBwDp/06Hss12jqCTLBh/6TX3LWEJ2fxAskv0/7LVR
         zsopgWh+e6V5rwiGCJkHRCyJk9mBAP9/wSGXl3zOP1MaIovSmhdlYdCkxWIw4d7nw+m/
         LkzLJDogNl7MCaIybnXdGnNVRfhclSaOqkka4EUqFlHlZ0xzqV1dQ9F9i5FO+baVT2wU
         Oc3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199377; x=1795804177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WpZL2JSgED1dxCTCDeitpd9jOOz/PRQfRKQZbZU7GDc=;
        b=uwABIWmPL8ufMw3MxhB2hOwlsEmPeYT8AMWdeblvvNQ1+v8MV4AO60p9JPABKcnamE
         9JU6LGYN7Rjwug1zxzVeJfqBL5YXMOmJO0GTOzazp/XoyyrswxdfWvwZfhhafqQqFPPt
         puNGPl19MUAnpekoVGvKRt7Mr5vTe4SQFBbC7jnM/ITYttyruWuBOwQSJ9X52/Wj4iEH
         bosO+SyqUgtYWJAjPH7yYL8doFP9iZQqB2OGnY5zNkhvPXMUmBIgSn+t6PsMJQXz2KOH
         dDNGaZsmXmcj3qC835umHkJbCrs9Bn3d2RCkV/6r68WrFW+s0asEfLgHUq+ZdBKyOpQ4
         CFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199377; x=1795804177;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpZL2JSgED1dxCTCDeitpd9jOOz/PRQfRKQZbZU7GDc=;
        b=WTfvd2p6uHYPjh6/kQ3x4+MmFjCUfPUezcs+qHJgRozeS8uTdSXNqMOb324fcHaxLa
         23PAzXtQY/jLOfUl2wG/jN0aYkHS4MfBihyDPeqpfV21xbUihmwHlBjeXjCefZoUVGXU
         5MWD2Ky3zE2awDLL09OxomMND7VV0OykmimqAjY3c3pGyQvdav66j68CxHXR8jPfdWM+
         0ioFFsNBc62mfLwzsfReYUij619DE9/BfE8oX5PMFvk8nyeERLlhy0sIKyuAor1rWcei
         s4U3ghlNY+ey48H/aKIrCmL+JZfexLuky3S7E/lNxSX5pgRgk/qvubAxEIDr4ifVC5Yb
         lgWw==
X-Forwarded-Encrypted: i=1; AL+hErGLPvFtaEOpMKmbftkVhu3i9+8bwXu9UwoZVIyYOazQXdtVCtiCi345O5OaPtFUA0solxap9OY6Dq6P@vger.kernel.org
X-Gm-Message-State: APuU4Z9hDud9cjpKlKH13tH7tnrjbagoXbc9mn8pui0D/SMJN+wiNO98
	RFyf1Bj4OVR6+HXhXmQa6VfnP7Mcjm5jIH5hIbLEkIM96t29MAHDf8clQ+b+CHRwMJnSxFpDhJZ
	lQYHou5xthiQkUeZc9x9i0Fe7bbHDoT8=
X-Gm-Gg: AZFdTZefVPwRpGnKw+JNWo/i7PdDiyOwPpRmwjYpaorQeEMi6cpXYbrpijh75l661DE
	aVoP4NFazC8vB5SzPUmWEa3aHCjaThZwVmtwWUkgO/hWZhZMjtq3nYG/Ok/YNv6o/eIxCu1VXVx
	7LLJtQsaXf7WI6lMiILzC2NSI4K8fS/3cCNSO7PYIm2L3/YY73i/ZtFoWykxYzwiZ7807eP2Z44
	WjDNgL6HMNmo6gCtMKiSTPSXUYGlplT2tqFpJXqd6Fgxyrt2HCPqfvFQn4KuZhq0G656JkuesVw
	mYfr0yPJs9uTmoJCmCyylq/TlW38W8ahI5/Ul0EudC1s4QxBAYp1c64zGL8zhfYVahXBoMmiKuH
	YQb2eBegBK5rb/lsEyGLeBdIe7vBathax3LZe3/cf4FjyjTvwGH9i0m1V/24HWxzS8GtCxGHk6C
	M+2u2cMoXWTrU725dM0dL7TdZGBa+QQam3mvJwgKala8Ze3VgZRk2VcqhOHw==
X-Received: by 2002:a05:6000:481c:b0:4a5:ebcc:2260 with SMTP id
 ffacd0b85a97d-4abb2dda518mr7812309f8f.29.1795199376768; Fri, 20 Nov 2026
 10:29:36 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <d0f5f347-a5f6-4e84-b773-f29ffcdab156@linux.dev>
In-Reply-To: <d0f5f347-a5f6-4e84-b773-f29ffcdab156@linux.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Nov 2026 18:29:10 +0000
X-Gm-Features: Aa3M54pnhmFSvmvZzRx-r4wW9mEW3Np4iPEWnckhFv_SM03jf-al_Jy7M9nYdCI
Message-ID: <CA+V-a8tQH_aFb871XXJ6QkNUhyXwZo_0RD4j83GbgDpfa=9x0A@mail.gmail.com>
Subject: Re: [PATCH net-next v5 08/24] net: dsa: rzn1-a5psw: Fix LK_LEARNCOUNT
 write mode encoding
To: Clement Leger <clement.leger@linux.dev>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Clement,

Thank you for the review.

On Fri, Nov 20, 2026 at 6:01=E2=80=AFAM Clement Leger <clement.leger@linux.=
dev> wrote:
>
>
>
> On 11/20/26 01:25, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The LK_LEARNCOUNT write mode lives in bits [31:30] of the register, but
> > the driver writes the raw A5PSW_LK_LEARNCOUNT_MODE_* values (0, 1, 2)
> > directly. As a result, adding an FDB entry writes "set LEARNCOUNT to 1"
> > and deleting one writes "set LEARNCOUNT to 2", instead of atomically
> > incrementing/decrementing the counter.
> >
> > Use FIELD_PREP() with A5PSW_LK_LEARNCOUNT_MODE so the mode lands in the
> > correct bit field.
> >
> > Fixes: 5edf246c6869 ("net: dsa: rzn1-a5psw: add FDB support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v4->v5:
> > - New patch
> > ---
> >   drivers/net/dsa/rzn1_a5psw.c | 10 +++++++---
> >   1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.=
c
> > index 13c46cf2c420..7fd2652813ac 100644
> > --- a/drivers/net/dsa/rzn1_a5psw.c
> > +++ b/drivers/net/dsa/rzn1_a5psw.c
> > @@ -5,6 +5,7 @@
> >    * Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
> >    */
> >
> > +#include <linux/bitfield.h>
> >   #include <linux/clk.h>
> >   #include <linux/etherdevice.h>
> >   #include <linux/if_bridge.h>
> > @@ -545,7 +546,8 @@ static int a5psw_port_fdb_add(struct dsa_switch *ds=
, int port,
> >               goto lk_unlock;
> >
> >       if (inc_learncount) {
> > -             reg =3D A5PSW_LK_LEARNCOUNT_MODE_INC;
> > +             reg =3D FIELD_PREP(A5PSW_LK_LEARNCOUNT_MODE,
> > +                              A5PSW_LK_LEARNCOUNT_MODE_INC);
> >               a5psw_reg_writel(a5psw, A5PSW_LK_LEARNCOUNT, reg);
> >       }
> >
> > @@ -604,7 +606,8 @@ static int a5psw_port_fdb_del(struct dsa_switch *ds=
, int port,
> >
> >       /* Decrement LEARNCOUNT */
> >       if (clear) {
> > -             reg =3D A5PSW_LK_LEARNCOUNT_MODE_DEC;
> > +             reg =3D FIELD_PREP(A5PSW_LK_LEARNCOUNT_MODE,
> > +                              A5PSW_LK_LEARNCOUNT_MODE_DEC);
> >               a5psw_reg_writel(a5psw, A5PSW_LK_LEARNCOUNT, reg);
> >       }
> >
> > @@ -963,7 +966,8 @@ static int a5psw_setup(struct dsa_switch *ds)
> >       }
> >
> >       /* Reset learn count to 0 */
> > -     reg =3D A5PSW_LK_LEARNCOUNT_MODE_SET;
> > +     reg =3D FIELD_PREP(A5PSW_LK_LEARNCOUNT_MODE,
> > +                      A5PSW_LK_LEARNCOUNT_MODE_SET);
> >       a5psw_reg_writel(a5psw, A5PSW_LK_LEARNCOUNT, reg);
> >
> >       /* Clear VLAN resource table */
>
> Hi Prabhakar,
>
> It could probably be worth it to add a small a5psw_set_learncount()
> helper that contains these the FIELD_PREP + writel.
>
Sure I will do that in the next version.

Cheers,
Prabhakar

> Otherwise, LGTM:
>
> Reviewed-by: Cl=C3=A9ment L=C3=A9ger <clement.leger@linux.dev>
>
> Thanks,
>
> Cl=C3=A9ment
>
