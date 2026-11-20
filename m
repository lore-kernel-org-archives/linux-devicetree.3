Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795174461;
	b=JuVEpW4QX2NUP1HGZ6XziGhNcdUWYZcJUqe4AJhh3ylXmz/D3DWMQsSx436DaVC7wBy8
	 jlEQ/4ibHkZotNpHrVf/f+jk2fGe5iiKAZK3yPLTOzR23zLVh4PFx5lX0X+XpWernQe7Q
	 mZOTpXwp++yx0RRjnMpMHS4H/O4ysLQARw2EuRWAczLIPvC19Via83X+aNSHRKup9cjHb
	 BMFSM8JjwesfMNpbp80BNMKWnG1bw7IXLoafUn8mlRFkxWjwsSvOhKe8xs4k2/u/KnmfX
	 014NXHFu5RMdGOVqRROxRHZXCF339T3hnZyeRJAz5P/rGUYfYltHSMXnkRxMzR+3XNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=fRsO3ZDu/cz2F9ezmEnkpxWWVWCZOJbm/Q68ymsx9pA=;
	b=h+v2ArTBX8cb/2CnzxSugS9osP1Lw3k6JuHQNgSox5v464nsqOSlCEpD9aP1NkKoBo8N
	 EnT5oaQCA00xqvgRBnz0UzSc+KvLrTqmUNGL5fJWJi8sq8wN/+xitkaN25J3Da1+GNQXn
	 KVdLF9zxPbbJVxcpFlizVFdo4uSTWjNhM67GgANqHQ21HYl2P47B04taokCCPP0+l4fIJ
	 32NiGu2QzEv82RlYIDozDasKxQbZwbSl6CWnZPJ34hS+BNORD5xSEFZ943nDi1WnY0XgD
	 EKyPiUSjSAC59L9n8e7KspR55wpplQGpKAO7t+25mnn8YkKLCTbvPvKnsxlHsc6wMJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=VrC6DFmR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B5F60A2601
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4B5F60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=VrC6DFmR
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4cdc606b47so145956366b.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:34:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795174459; cv=none;
        d=google.com; s=arc-20260327;
        b=T+FZA6Pf3uMw80XpE+Db8Bt1znC8G1Eg62/jPlooB8JhL1IF7Of5Jh5T6CXaAvkDZ1
         lRbrYX8g62JU3/gGSNf7xUyVx5+J1jMLoqfzfmzICtX2xx0bbO5XoxxAR72eDTqMfee6
         rdEEXZC1E7o1R09jkMLIsx/tdjzqp/7i9AJOSJMsfnPsB+sGvxtfKzwW5I8s0H2KPztx
         bBXwKJQfVVLQdf4RbG6uM9dBsF07gxVaBu7GVQ3mT9KGilsgwF2+SewZlOqTN5OTKHOZ
         UMfzrgq9QDZtMV8+ylQL82ltFBvewK41mPog6cShGg6sljAx9tEKxx3ZnNF6wd8eMDpL
         lmgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fRsO3ZDu/cz2F9ezmEnkpxWWVWCZOJbm/Q68ymsx9pA=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=jUpyp3e4g9sK6+GPy/iqGka7uTJpNuytLERmdKuxTdgeXvOrbsLbMxLMTYqS8xCY9t
         iJTBz2ak6P6JIRIoqGjItI65iTQsvY03zvECS6rsLP30DCeiQDnSHcn1avvhXoRzUXzy
         0lcS/z2rQTLDF6u88VamRbBIWL/EQSODTc8RXowsFnluP8ptAov539j28CB7cBCBPLvK
         /TrSCQjhtencEtEOP2fvH/ZQKlmum/EjHP1I8lgpo5ODJ8mO5ff4pc79vLasJuIJGRZ4
         J6b5ucWvIhBX304KVcPbs7PkmnWBT06081aRxJtAV7ERvKiXCFw1B+kolM7hmAgvfs1i
         pm1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795174459; x=1795779259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fRsO3ZDu/cz2F9ezmEnkpxWWVWCZOJbm/Q68ymsx9pA=;
        b=VrC6DFmRnn4E7CY8vbn4bUrlAnwIUlw5ycZduQy9MnrdaHGK24YzVbvN+x23iDKdV9
         wYpS1QFDguNjApZ5LgBzCDVZE50Iuj+zOCbrfYm+zIvl/tVmyaKxlfFD1qkh0GfNA0Ax
         6drJtbFdcALTL1p7CHjCbOFdzANSzIiNouTaXF7pACkDTIsAOoR8IJENyt3K/pD3i/on
         Slr4a1KB2kHRRwLWemYfdcsv+vd6r3dn+MiQMVdPgpOSwzMvJn5P9IH8kc8zrLEMHDxw
         x1XzXb3TnC0ffg+0U5gSYzzwhjLkjBPCEfHyVF+6Nddn4ZDPqUCIoTlMZgyi5cFpcTI3
         9pHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174459; x=1795779259;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fRsO3ZDu/cz2F9ezmEnkpxWWVWCZOJbm/Q68ymsx9pA=;
        b=ufpHb7B4JBSCJCbZZ7SFPWVeyeuHTf8kNclf3o9jFWLLFOCejARTZH0CxxbmDBP1bF
         ZAm7EFJL/rbeHG7zO6Y4ew7EnxW200URPFnqAm2kuI8CezZY6BcSUxnO7Gu16VIHkgvZ
         MjbXeKzDlgwuOvcdI/M5+zRkSPrHj1jYZelXLtp889ngN7AB+sQ2P25MKMKPRp+c8mK6
         H84YQZd1zTezmJjW1L0GLja7zw8mgdzR+N1Ctdcyeke1RTzB/SlPHoKFjqWNwHDBzUa7
         va0LgA3daEGooxIPJm2j5mBissS9rFVLQYgsd5ILRmDcqJB5CkWjdL2J/US/BajnH7YW
         WBWQ==
X-Gm-Message-State: APuU4Z+tKxOuEAwpwUpGYGMGxJUuqNadZXp8N6hPrZgjH3LkKVLkxxwB
	wBpiX0FzRklKw+cWMn6SSXR2WgCwHUu/oq9t/Ly1y9JspbgFJ/NFqhNXi7kj/65ECR4Xv6y8g/X
	QXnBdhqRXLAFPiOxsgcK7U6/17el4PW+iCQx7CQpN2A==
X-Gm-Gg: AYBFou0b9As/QFC2c4OSQAeOaPjwz4JcKX2+g1+Bc14Lr4zdUc9r6+CmNWb4h76FMdY
	wxpqef4+vu8qqDzpyxw3UxLqs2FTFOFu/KYIMO79dJihCzdHXHo96gOyQj2w/E/b0dUTH6IL8C2
	Q+z86cM4qFNnLNCyvW1bN35oInFZ6jWUuDqZRJ4iCxExEj1/zOf8zJGt7fqgB+HB2LhL23t57di
	BKdLWjzVJJgn3vSihxymlzX5fGbtmtfSvwPWAgD0u/J794vUN5IvDiWpsXYLsEvzeLu5RmX+vy4
	eWn56ckxuaqfzBn6vtCcfnmNhtu8lfmIvStjNmaDYK3vyd176ryD2ePoIz07qJ4HledPEVuXzHA
	0S8XkSVgWfYhpOG+vSLUyLHfBwVQLKbmj1ExoxCL5UAhNyXw6lASSkduOzOHti6dwaMHK8Q==
X-Received: by 2002:a17:906:2db1:b0:c51:691:c76e with SMTP id
 a640c23a62f3a-c513a9abeffmr212514466b.36.1795174459002; Fri, 20 Nov 2026
 03:34:19 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
 <20261120-rk3576-phys-v1-6-6382cd14e3dc@flipper.net> <sashiko-outbox-224978@kernel.org>
In-Reply-To: <sashiko-outbox-224978@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 20 Nov 2026 15:34:08 +0400
X-Gm-Features: AclHuK8RoRf7zMIuyYmJlfLbmrB--2dyFTOsmnodC1bQoiDVeS2Y2IYBUY1ezpE
Message-ID: <CAKTNdwH+yKELMRe5RRv7UEuBFytum-k52xJXBPT_p5wC+9heQg@mail.gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: rockchip: Shorten NanoPi M5 Ethernet PHY
 reset to datasheet timing
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 3:01=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] arm64: dts: rockchip: RTL8211F reset-deassert-us below 72ms
>   minimum
> --
>
> commit 0900c61dff0b0908a212846ea06a953d5d033faf
> Author: Alexey Charkov <alchark@flipper.net>
>
> arm64: dts: rockchip: Shorten NanoPi M5 Ethernet PHY reset to datasheet t=
iming
>
> This commit reduces reset-assert-us and reset-deassert-us for the two
> RTL8211F Ethernet PHYs on the FriendlyElec NanoPi M5 from 20ms/100ms to
> 10ms/30ms.
>
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/a=
rm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
> > index 638e00b6e1658..3444198b6cf66 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
> > @@ -809,8 +809,8 @@ rgmii_phy0: ethernet-phy@1 {
> >               interrupts =3D <RK_PB1 IRQ_TYPE_LEVEL_LOW>;
> >               pinctrl-names =3D "default";
> >               pinctrl-0 =3D <&gmac0_int>, <&gmac0_rst>;
> > -             reset-assert-us =3D <20000>;
> > -             reset-deassert-us =3D <100000>;
> > +             reset-assert-us =3D <10000>;
> > +             reset-deassert-us =3D <30000>;
> >               reset-gpios =3D <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
> >               realtek,aldps-enable;
> >       };
> > @@ -824,8 +824,8 @@ rgmii_phy1: ethernet-phy@1 {
> >               interrupts =3D <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
> >               pinctrl-names =3D "default";
> >               pinctrl-0 =3D <&gmac1_int>, <&gmac1_rst>;
> > -             reset-assert-us =3D <20000>;
> > -             reset-deassert-us =3D <100000>;
> > +             reset-assert-us =3D <10000>;
> > +             reset-deassert-us =3D <30000>;
> >               reset-gpios =3D <&gpio3 RK_PA3 GPIO_ACTIVE_LOW>;
> >               realtek,aldps-enable;
> >       };
>
> [Severity: High]
> Is 30000 us for reset-deassert-us on rgmii_phy0 and rgmii_phy1 below the
> minimum post-reset settling time required by newer revisions of the
> RTL8211F datasheet?
>
> Revision 1.9 of the RTL8211F datasheet increased the post-reset wait afte=
r
> PHYRSTB deassertion from 30 ms to at least 72 ms for internal circuit
> settling before accessing PHY registers.  Because phy_init_hw() accesses
> MDIO registers immediately after waiting reset-deassert-us in
> phy_device_reset(phydev, 0), a 30 ms delay can cause PHY initialization o=
r
> stmmac_hw_setup() DMA reset failures during probe or ip link down/up
> cycles, as seen in 1c7412530d5d ("arm64: dts: meson: g12b: odroid-n2: fix
> PHY deassert timing requirements").

Hmm, what a great world we would be living in if parts suppliers could
share UP-TO-DATE datasheet versions with the customers. TIL about
revision 1.9, and it does indeed specify a longer deassertion time.
Will fix in v2.

Best regards,
Alexey
