Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795199717;
	b=R7MZToBn953VJfvEAJvQNu6AR2FYSaZuQQrXssc40rNr1YDxVviUmD2bD9Fw6T30gAXL
	 NhndhoqbR7BFpphmSCQLkJDlrYKC2Rq2P/mhQtOcaGPQGhiKfojWi/0TsJYRtdotA+7Wb
	 gelgxnCY2IX3knLWGSautXvEzhvoOu82MizWy+e67EXuiSX0TXSx33jxM0p7l2ItMJFpC
	 Wo5VJ7mSYwhGtVi1venYzoX4OlEpBwpSSCLKzcbZjCB9ob6l2QIScUOpEYGEjEjt9m/ug
	 dUVqJBlP5OnH/iV+u9KZPDiHrDwSbtMpbTIK3NWrJSQ7NtFPA6uKscNLTD8h6+Pm2Sg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9rsFIIfYLlPNAydhi/mQeevdGoY6nLo3sNtxIAPeXsE=;
	b=0zJ0Ld/Cbosku7QBLD7yVRxJ0yo3NhQMdwTMMV/9cRQfOvTzUcV3kNd/hcnrd6pCpkaA
	 ThYUt4TRu7+HCq3OEZpz8uNGfNG/LzkAWpXYz+d5HTOG4OXJlkbFdDAqxSM8U+ArYs5dE
	 oltnxfCygiHXTZyOFGxDbHipxhenenKp/0cHaBqLpNt8Hn9iXYcQHIbHgttLIiGvNXe49
	 w2rqEWW8/UMFUbYdutOwJzKyY0IOMiQqFuwsOxqLiGQB53tLctXMpfnKDDork/4dlvIk5
	 MTNsMtlJiIeE0KTX8iRmTK/aoVrtsp2B5T0KiOtWw2OTnEjJHqZmpab/U8DNozU0Yeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="d/pQaSeg";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4661460A261E
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 18:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4661460A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d/pQaSeg
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so682110f8f.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:35:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795199714; cv=none;
        d=google.com; s=arc-20260327;
        b=Cb9XFB/TvwwOi/0jQuwGYHsLIJZ7uTJjjl5Ux7xlOlC7IecFBouvjS4bbtl9Ez1UZF
         UG715/UXeMathKIQNBR2okMgbdbKtozWRwLV3ZzkGg0TjFVkdKso9ebQi3LKhNbi+zcd
         b5v/B1RGCaGk6HAf4uiXjn8EM9K96MPWbaUozibHDXMQCo25ASI1VzC9DAW2iA7onXni
         jPzZvXzTti3gzaEb8whmNLfG0PWyKIRafTkGBDYMs/e6tbGmuHEQkWs1kJuIuHGSOv/p
         QOpRsM2cZHujta7rV9XYUJX0kAaJVGmitYhCi2I8+1M5Bfc5Q77ocmV9x/tuTfDbCC2I
         64fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9rsFIIfYLlPNAydhi/mQeevdGoY6nLo3sNtxIAPeXsE=;
        fh=Gi4e45vvMX2OcZDBddB7zTAy5usU/cpTs++PJjtWsQo=;
        b=InSA1/TE8gfxGSU9iaiJPKTfyxRAwGhRECAmrw0HWhB0OFWfc9maobTzijDs9n5HSL
         jGvyS2kZLs7dIzAkd+LQf7HjPUpEHjBPGDZ4hnqBbkytmtqCwPam22yxKQxF9heUeBoK
         5r0pJvFcBCmxAhwL4z69vsjnA7fHg9JmFcJDdrWvZY0itCshSfievGFG7WPeUZMhFyES
         31b5Gl3D6ziWq+HPqbhZjZpt4K1MjEQS5fGYvzSn/+rtGPh7FM4yVm3vMnfhZXskfsl1
         HIzFdHt2CCWd7iJRUmiHO7mFRidlv5XGKBt7+51TxO+6grI0Fqh0oI6KtF+v8oO8fXFV
         aQHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199714; x=1795804514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9rsFIIfYLlPNAydhi/mQeevdGoY6nLo3sNtxIAPeXsE=;
        b=d/pQaSegThK9ekeLMvclSNFVlyfHAlpbyZqEv2Nd1/mO4riFi4mx2wHSvPRx6ZMaqP
         Qx7qHLRRh99OXWZMDlTS6957zxCocmHnsFhFeWGafSiZtp0PsDN5vcfji240JtFstdGu
         zwhs0+ZhOSXHAjfwqP3ERvsnd+l3ignMpzoDxOf4tALVj1aWrZajDE9oUibIphBWY6kW
         IkLmnRhDI9F8OHRCyhRgYAhAJgLBW03gaNiyqaQgTh2eS/BzuVBM/zGGaKkBS5pxQKgf
         PYbYbI5yJqkJgJF4xRV9NRlBXDgTlZWYIMxMiQ15pUm2UzeaFL2L/P2/RwdOEKeijd+T
         gnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199714; x=1795804514;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9rsFIIfYLlPNAydhi/mQeevdGoY6nLo3sNtxIAPeXsE=;
        b=KmQ3oadV/q6QAyJDlGYqbc8/Z98k7cJrAzDmKEKJRBXLDCOkUz6kwH9n3n14XiiPao
         A3b2ZCsoSK769kevF6+PL2x9ERlv39ZswsEl/ZkPpPQ86GBToapXl6buYT+YSOLALsL0
         vhDaFqsc+eJYHTR6LHLe/NBP3EeFWem7uoe+22WFD3BmuDx/dzxqhz2FVG2qIG1z1Lt1
         3niMO4745T7weE8rtB/BhifuoDvZA+l72rOlmaMPh3eAkaOuz5gi8zRHOIaHP5nwgesj
         gGnHKVL9yD+wVrBXGUJfZCJ653BSp+Ko81F5z71RMpTvDfQpZmFOR4YvT5kbPBaqvyzg
         ZSDw==
X-Forwarded-Encrypted: i=1; AL+hErFSkbqWql7T5u6LIV3JMfbmM0QULjS2YKN7SEwrLy7I1oXs1+maREBrjAzPLmXj9WyUUDoV8MLohMZI@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z5F9Ck9bkkQKo0txoJZmBJkNlYJGeL43X4jpwy0F5URBDyZ5D
	uDWBad27bSYPolnp/eRajSY8Y5Mjves/yusRQTJ0ge86ZLV40Ea/t7IaOpAvnETAihdQ5uYorJs
	iSJKz4MuVPGtibZO2VZ5itErw6V3g0MU=
X-Gm-Gg: AZFdTZe8d0xCAYr4qJ7AUfv4HWXzhgpAL5zL3AjQEoJErJL8iVRytktCtlmMXSGap+U
	OjX4oKkSHGzDvDBtBJLCTe7SrZdTK1beZSYo2TXPuI0WLAyoptJRfZ5KNgdhWhqxHiBH+hKlAwr
	mvjZzq3YfucsCUnqX6YBZUgSzK2InnqJ5GhbvBmZdLiAy3OKXB3n4LaV38X5YAIRK7NmpDl57mF
	nozLSfNH5GdswCRg9JPFnY0h4knLn+n9sl1hy5yKYntQX1lJRhgHS7xF4Vn5L1+f4mhQa0WjE6B
	T0Zi3SL8Yp7pj3EtDAni9Nk/VApZoi5qdl7knF13ZenNp60mHB+jz74gcm7kEB86FzoB3f6JYh/
	X5ip6NSZBS3PCqiGLp+8/QRHKXxTf+t9fDddv/qT8+6RU1HavoNQ6So2fVpkO3u4mUYDz/PspZC
	nEYOaTXbya+FHhMttBZJEjWjWE10qWHh3VIFLyPsgeDhWsM8dWaLPUqZNH8A==
X-Received: by 2002:a05:6000:111:b0:490:71a7:6f51 with SMTP id
 ffacd0b85a97d-4abb4c7aab0mr6478589f8f.45.1795199714378; Fri, 20 Nov 2026
 10:35:14 -0800 (PST)
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
 <20261120002549.1908299-21-prabhakar.mahadev-lad.rj@bp.renesas.com> <99974c5f-c1c0-427c-ab10-a6559789f258@linux.dev>
In-Reply-To: <99974c5f-c1c0-427c-ab10-a6559789f258@linux.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Nov 2026 18:34:48 +0000
X-Gm-Features: Aa3M54qKtccQda4ewlsXLoeUNdEV-Vb_fwoRb_ScgagJv7YFEhFjsxItBSHmLy4
Message-ID: <CA+V-a8vikSkbxjoE+Wq+jZ1uQjtbu2VFttHEMGXHkWqqcqf6Lg@mail.gmail.com>
Subject: Re: [PATCH net-next v5 20/24] net: dsa: rzn1-a5psw: Get lookup table
 size from OF data
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Clement,

Thank you for the review.

On Fri, Nov 20, 2026 at 9:44=E2=80=AFAM Clement Leger <clement.leger@linux.=
dev> wrote:
>
>
>
> On 11/20/26 01:25, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The RZ/N1 A5PSW has 8192 lookup table entries, whereas the RZ/T2H
> > and RZ/N2H ETHSW have only 4096 entries.
> >
> > Add the lookup table size to struct a5psw_of_data, derive the address
> > mask from it and use it in the FDB and ageing code.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v4->v5:
> > - New patch
> > ---
> >   drivers/net/dsa/rzn1_a5psw.c | 10 ++++++----
> >   drivers/net/dsa/rzn1_a5psw.h |  4 ++--
> >   2 files changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.=
c
> > index 7e9bc252d92a..c0c1f45852da 100644
> > --- a/drivers/net/dsa/rzn1_a5psw.c
> > +++ b/drivers/net/dsa/rzn1_a5psw.c
> > @@ -311,18 +311,19 @@ static void a5psw_phylink_mac_link_up(struct phyl=
ink_config *config,
> >   static int a5psw_set_ageing_time(struct dsa_switch *ds, unsigned int =
msecs)
> >   {
> >       struct a5psw *a5psw =3D ds->priv;
> > +     unsigned int entries =3D a5psw->of_data->lk_table_entries;
> >       unsigned long rate;
> >       u64 max, tmp;
> >       u32 agetime;
> >
> >       rate =3D clk_get_rate(a5psw->clk);
> > -     max =3D div64_ul(((u64)A5PSW_LK_AGETIME_MASK * A5PSW_TABLE_ENTRIE=
S * 1024),
> > +     max =3D div64_ul(((u64)A5PSW_LK_AGETIME_MASK * entries * 1024),
> >                      rate) * 1000;
> >       if (msecs > max)
> >               return -EINVAL;
> >
> >       tmp =3D div_u64(rate, MSEC_PER_SEC);
> > -     agetime =3D div_u64(msecs * tmp, 1024 * A5PSW_TABLE_ENTRIES);
> > +     agetime =3D div_u64(msecs * tmp, 1024 * entries);
> >
> >       a5psw_reg_writel(a5psw, A5PSW_LK_AGETIME, agetime);
> >
> > @@ -511,7 +512,7 @@ static int a5psw_lk_execute_lookup(struct a5psw *a5=
psw, union lk_data *lk_data,
> >       if (ret)
> >               return ret;
> >
> > -     *entry =3D ctrl & A5PSW_LK_ADDR_CTRL_ADDRESS;
> > +     *entry =3D ctrl & (a5psw->of_data->lk_table_entries - 1);
> >
> >       return 0;
> >   }
> > @@ -638,7 +639,7 @@ static int a5psw_port_fdb_dump(struct dsa_switch *d=
s, int port,
> >
> >       mutex_lock(&a5psw->lk_lock);
> >
> > -     for (i =3D 0; i < A5PSW_TABLE_ENTRIES; i++) {
> > +     for (i =3D 0; i < a5psw->of_data->lk_table_entries; i++) {
> >               reg =3D A5PSW_LK_ADDR_CTRL_READ | A5PSW_LK_ADDR_CTRL_WAIT=
 | i;
> >
> >               ret =3D a5psw_lk_execute_ctrl(a5psw, &reg);
> > @@ -1357,6 +1358,7 @@ static const struct a5psw_of_data rzn1_of_data =
=3D {
> >       .pattern_ctrl_base =3D 0x3eb0,
> >       .vlan_res_vlanid =3D GENMASK(16, 5),
> >       .vlan_res_portmask =3D GENMASK(4, 0),
> > +     .lk_table_entries =3D 8192,
> >   };
> >
> >   static const struct of_device_id a5psw_of_mtable[] =3D {
> > diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.=
h
> > index 29d205e2331d..fd523fe7bf47 100644
> > --- a/drivers/net/dsa/rzn1_a5psw.h
> > +++ b/drivers/net/dsa/rzn1_a5psw.h
> > @@ -93,7 +93,6 @@
> >   #define A5PSW_LK_ADDR_CTRL_WAIT             BIT(27)
> >   #define A5PSW_LK_ADDR_CTRL_READ             BIT(26)
> >   #define A5PSW_LK_ADDR_CTRL_WRITE    BIT(25)
> > -#define A5PSW_LK_ADDR_CTRL_ADDRESS   GENMASK(12, 0)
> >
> >   #define A5PSW_LK_DATA_LO            0x40C
> >   #define A5PSW_LK_DATA_HI            0x410
> > @@ -210,7 +209,6 @@
> >
> >   #define A5PSW_LK_BUSY_USEC_POLL             10
> >   #define A5PSW_CTRL_TIMEOUT          1000
> > -#define A5PSW_TABLE_ENTRIES          8192
> >
> >   struct fdb_entry {
> >       u8 mac[ETH_ALEN];
> > @@ -241,6 +239,7 @@ union lk_data {
> >    * @pattern_ctrl_base: Offset of the PATTERN_CTRL register of pattern=
 0
> >    * @vlan_res_vlanid: VLANID field mask of the VLAN_RES registers
> >    * @vlan_res_portmask: PORTMASK field mask of the VLAN_RES registers
> > + * @lk_table_entries: Number of entries in the lookup table (power of =
2)
> >    */
> >   struct a5psw_of_data {
> >       unsigned int nports;
> > @@ -252,6 +251,7 @@ struct a5psw_of_data {
> >       u16 pattern_ctrl_base;
> >       u32 vlan_res_vlanid;
> >       u32 vlan_res_portmask;
> > +     unsigned int lk_table_entries;
> >   };
> >
> >   /**
>
> Hi Prabhakar,
>
> It would probably be better to fold all these commits that adds data
> into bits of data in oa5psw_of_data into two commits: a first one that
> prepares support for RZ/N2 and then a second one that add RZ/N2 support
> itself. I'm not the net maintainer but your series is already quite
> large just for this change so folding the commits make sense rather than
> commitmaxxing.
>
My intention here was to keep changes minimal so that it's easier to
review. Since the fixes patches will go as a separate series, I would
like to keep this as is. Hope thats OK.

Cheers,
Prabhakar
