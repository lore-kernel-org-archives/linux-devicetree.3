Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DA83A2E2E
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923756; cv=pass; b=UXr3NzqN4JDg1Dhx+38yjF9N1wcf2dvdP36gOfbmalU1roWkmP/GFcsAfjiqVjIHXJOwv4ozBLxlQ84XYf4mk9oY7hqUkzryF5n4AbeWX2Oc8DaL2tyaQy9JCEDywQl98/d4rNvPJy8ZgqrDv0XZ3G3uIjcMuk6wKNpuWJcPc14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923756; c=relaxed/simple;
	bh=mCI7iklNQ0TyrRJOgh0VD2sQcekczqwciDl8A/HfUlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p3A607dRWk885RIHi1TmkTacBKhW43M6Ihv4xEm24ZHtT/2k/lyeiDDs+57ezrWXTRX7L3nTorgU0SRcPyoxoBzDtY46Td5qAq/TwigwANcdn10fs6agSqOTIYrjJnA/t23hoSx+KDsKke3gPK4Vgw8fLbGyAH1yVMwAUhpv2Fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AebBzkS4; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AebBzkS4"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aebd7da975so124297e87.2
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:29:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787923753; cv=none;
        d=google.com; s=arc-20260327;
        b=gsaWY2UGiThB0U5Moz//mYfMXi+oy764INFppQhvOkirAy83y2pObytVKLT/gg0m7a
         BpXoCbn05twjFDE0YnSpA7CECy+aX430+FOLPOi2H/3/no62/oazeIsT5H2KHtZbieM6
         KZaqd0OmVd/JDWtproiPtO6XvoHDlOEXv9+If6dsJJc0EQoOjalwffnhLRSfzAu3Y2xq
         Vs833Z3LLUWxARB4AMktAlYnaEc0ss2aXwPk6jST783BQueWWoJIDVK/Nmgzd6zikof+
         d3aZrlxKeUHTC/Roy3NG7nOZe2hOLtFHurj6630oXQcltLOY2KgPcNFu3cshq1XfWJvR
         +x+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oJ8E3vVRgDRYUctGG9mDCTffEyrWTB3jUW17WO1h8J8=;
        fh=0oK2yunVIcMNRvT8V3EOSchw8uUQwBsWiLjVOyYOLjQ=;
        b=VPfvOpD9tuW+mz3At0NzGFJ3pZnEKGw0OQaUy8UIIwUN1j1T+QUCrS3SmMQqAY6kCL
         J+0sVh77hHjaBoJi4Im1ASrZn/PScN5teI6QLiBNjJEYQG2q99Jh2qwl7FSUwpaoa15r
         1H2gaUWzCjyU75Df78Nkl4G16WqG3vTYnKDEbR456ZtsndItDS5eSAtRzgXySK32h6RN
         h0q6oqgc2SSyYXs7DFd0k4/kPFyvSaaTbi7yOZLURAOWgwgpFAr9yX6CuwEQX+IV3TPG
         YHxpjWHqJ16tm9/eadsjPDc4+41SaVNF78CGUkAdo5NY+ygoEcKoRNFiWanE2Y3qCZig
         9EXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787923753; x=1788528553; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oJ8E3vVRgDRYUctGG9mDCTffEyrWTB3jUW17WO1h8J8=;
        b=AebBzkS4rYgR9X0FoMUC7ED91PR/a6w8iYrOPvObedeWI175HXoPgOqboqVLE1Y0E5
         KDdlPvcjJKXxvEUQaS8euJ84sma7IcMtf499nGg03KOYlvEIjtXT3LjNPao9Ee+6YsJY
         Qt5yua2s7yoo7nv+FoMmbR/wYyZsU0phJQJM+yHa8EVcLSfm7ZWSGCkZZJcsNFrtEHbl
         C846aU4VDIK5VsIxQUxVebZqyYOjJwTCPu9IG4fvEj8HLobleNBTF/tAR2XbYAEysW2y
         vKDElRGgqAHVHjH5NOLOlpOVGBXPD4+EKvqLFA9en0fEoH9CaP1YkdyT5OUxhWYOD7Lv
         zR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787923753; x=1788528553;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oJ8E3vVRgDRYUctGG9mDCTffEyrWTB3jUW17WO1h8J8=;
        b=eZS5J2vHj2bKRKHZyVEvARbndquRYQLEUelVlFp3iQnSREVUPlK/ENZHKEnpSbVKV1
         r8IFKceEivLNNC570yMS/NyHJOOb2JuEiqnb678tkArpWryXSjds/HuB/rfaKP9Iql4L
         N/YmpYDqgsGc5zs+/mrLSnQzXl7Fq0ye0pdZc/C1//pGfbgA+l6PqY6PlZIjZ0p8HPSP
         iOzh4L2xu0iAPkfF4xQ+ZuBw6FEZpq1R0w6AuSDbrlp5GNCsITjLLduXRonrK1bE0VBW
         mUGYnj8FuWv80UyKyjGEkUIV9u6J1LivNXs+yZosneVWPeh9ylBCFWuM2mvnlFC74HNe
         pchg==
X-Forwarded-Encrypted: i=1; AHgh+Rpq+TnT59ZmrIvZdHdemWLPxwOm6WRI3oTDZuIr2W2M1gidmn5sZ9P7N+Bk1rfgKhq5L0XSlHkxGI6+@vger.kernel.org
X-Gm-Message-State: AFuF++lucrvEPlBuFsS3yxgyb3HiA8S9+yjoyO74iSSm9hJ6cvDqc6aE
	sqjlRserhbuMwCRK3qnfVeEkvEz++ZH7qTwlHpPp1PKODHWcqIRmN2B5yFJgc3btUqndpmReOA9
	ew4Y9Vq96V1LnBWSMJdueOuZKTAdsLJ8=
X-Gm-Gg: AR+sD13sdJKKhv6Xqh3VOzrFRWwwtItNJsJVnWaedW1t2YPcQljsH9aA5gTpU8tMA4Q
	BXZUVMxJSPbSNndRapFRA7sDyhLUuG+2c2uBL5SFQjK5X+KTacHSZuGTsvfKStZ8tzJdsVwPMgR
	EkqG1PSkKY9xLMn5OzozPw02Uttf1QW4OZ3L9k5NQzwtytvV66QR3Y5yP2UM/pRt8ZBZsdb0Qv6
	s0jJqpA4AMp58ZaOObnDVclVzFGqd69/QTn38bI4hSqBDYvXYPrzh110C+Z7JN4TTqeSbDHM9VU
	f0Ge8U4VU92B3yq6Wj9uBy8n/NWP94qGMohBYDA9QBT823bxA9IkjWpl/uc/XBiqLZJSxgk+MCY
	76bRexDXyD+NKPysdKg5dHUSZXOo=
X-Received: by 2002:a05:6512:2350:b0:5b5:e0e9:78c7 with SMTP id
 2adb3069b0e04-5b5e6b2d23amr860942e87.3.1787923752502; Fri, 28 Aug 2026
 06:29:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803163323.74414-1-chenyou910331@gmail.com> <aokFbP7wArV58T9E@inochi.infowork>
In-Reply-To: <aokFbP7wArV58T9E@inochi.infowork>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 28 Aug 2026 21:29:00 +0800
X-Gm-Features: AcwNN1Vyq3bOlIovVS7iwVPmCuDz9-szJAlLvnMYLT0vFzTw2H-zmqYHijMwS14
Message-ID: <CAKspUhJ-xxkptgSJMQUCNv4ADBJrSLOW4CzpKm8OoVy1ukT9qw@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Enable ethernet for Milk-V Duo 256M
To: Inochi Amaoto <inochiama@gmail.com>
Cc: chen.wang@linux.dev, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 22, 2026 at 10:15:XX +0800, Inochi Amaoto wrote:
> This is not acceptable, I agree with something like DT overlay for
> support external IO board to enable this. But you should not enable
> this by default. As other may want to use this as GPIO.

You are right, and I should have caught this myself -- the signals only
go to the RJ45 on the optional IO board, so enabling them in the board
DTS takes the pins away from anyone who wants them as GPIO. Thanks for
stopping it.

I will rework this as a DT overlay for v2: the board DTS keeps the GMAC
and MDIO mux disabled, and a separate .dtso enables them for the USB &
Ethernet IO board [1].

One thing before I send it: I do not have the IO board yet, which is why
v1 said link-up was unverified. I have ordered one, so v2 will come with
an actual link-up and iperf3 result rather than just "the PHY is
detected". I would rather send it tested than send it soon.

[1] https://milkv.io/docs/duo/io-board/usb-ethernet-iob

Chen-Yu

Inochi Amaoto <inochiama@gmail.com> =E6=96=BC 2026=E5=B9=B48=E6=9C=8822=E6=
=97=A5=E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=8810:13=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Aug 04, 2026 at 12:33:18AM +0800, Chen-Yu Yeh wrote:
> > The SG2002 has an internal ethernet PHY, but on the Milk-V Duo 256M the
> > ethernet signals are only routed to the RJ45 connector of the optional
> > IO board.
> >
> > Enable the GMAC and the MDIO multiplexer so that the interface is usabl=
e
> > when such a board is attached.
> >
> > Tested on actual Milk-V Duo 256M hardware: the GMAC probes, the MDIO
> > multiplexer selects the internal bus and the internal EPHY is detected
> > at address 1:
> >
> >   eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY]
> >
>
> > Link-up was not verified for lack of the IO board.
> >
>
> This is not acceptable, I agree with something like DT overlay for
> support external IO board to enable this. But you should not enable
> this by default. As other may want to use this as GPIO.
>
> Regards,
> Inochi
>
> > Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch=
/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> > index a2797c0bd767..1462a96a1c12 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> > +++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> > @@ -49,6 +49,14 @@ coprocessor_rtos: region@8fe00000 {
> >       };
> >  };
> >
> > +&gmac0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&mdio {
> > +     status =3D "okay";
> > +};
> > +
> >  &osc {
> >       clock-frequency =3D <25000000>;
> >  };
> >
> > base-commit: 11881041b745b444e4f6c87a2748f1951cf02742
> > --
> > 2.43.0
> >
