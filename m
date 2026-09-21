Received: from mail-ej2-f5.google.com (mail-ej2-f5.google.com [74.125.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2BF4E36E6
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 17:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790011983; cv=pass; b=bpfWBmgQWqiwHDxXVwYNS/ATH5MK8C2KgBD7x7znfFmaIzF4E1c8eTYgn+mGIAlHa4dWDKZYuBOUMavOojQgXqjh+XGn1hP4MJ32ngF9cA+kTKk3unLSmsgAyYZPg3ocZ7H2UQPAqDJz31htdLpxraxRbnh4kB65SDlAKgou6JE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790011983; c=relaxed/simple;
	bh=K9si7rBSGFSkQMJDZblogrtMa3XzYm8ZMWN3VzWupEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jVDyeFkMRDyqcwmY9LiFswYbs6BHJwYpp0QcyX/2fJ/ypZ9LR5AmXlHZaxsfCP4p3nnp73Vbf16JuAi7RCSUA0SI4OT2IlHqnzFVf0x0zDJZim/T44puJzb65RWG3WZv2ABmsdnQeoGij+4WeUDJOb8VZH3JJMaDLgNwTz5oqN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YgtoZmWJ; arc=pass smtp.client-ip=74.125.228.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgtoZmWJ"
Received: by mail-ej2-f5.google.com with SMTP id a640c23a62f3a-c294cac59bbso262372466b.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 10:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790011980; cv=none;
        d=google.com; s=arc-20260327;
        b=m82ZuVrYwv8ldqdbEvo9V/8rMDz7J5YN9IzcPqrmYLiFxxAEddPhyDgD5Qkx54NSrG
         UW87wcf0AQ6lKCLS2lOLtII5GubUM2+H05tesZh6LfhZT+6GrRXD+glPpL3PaU3Zz21N
         HGnlSDsNPtapVC4ZzIdsJk+isnyZgFMPlojluPc4tm+rfxpmnn/ZLkKB2Bkl0RY6w+3K
         Blwf0jhfs5hJYldRL4rNbq14FaTFwiGuGzlHjdU4fGB2x5gYXN9/S9cuAMaJZwD6YAmA
         lILysdFSokX4pBXij9C7YSZ1O6nTBuqjyLlVaSomm+1d5xULKLGDzoI2nwzhpDjVvQse
         nRVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VuKnziCRcnwT2EUABNsJz91YeadinAdPu4p/tIggi6A=;
        fh=ElkwVKz7QZ00Vln2txdvooYPDn7Yd+mnfSy/tABBQNc=;
        b=i/R62kuoE30fFdS3at39C68IJe5VWojtMptofoaiX4L/IVVLchpmNFHHkpF7AYelty
         SOxHAjJFEURcowL47KglKTJUk9em1TvX5i4J1iQE5y/AIPidpiAv77nsDtaBEJKg1Adc
         XkZZKwaarLxveDc2fhAipZJEq/gjEvEx5B8EKqXLIjBQcH1KYhm7pebzFwVseHYZhXqR
         ajp0+9S2cZKXOVOj77PI05Ov8eMWrsy5AgN4yy+4En+j6nZoYRdUflgez1WNiLlj8hhl
         iuajwLOER3Mj0gDKpoesZgLPcKEp7K1CrzP3/NA83dZryGZ0uDeYFiNJ3eS7rIgbjtha
         afrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790011980; x=1790616780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VuKnziCRcnwT2EUABNsJz91YeadinAdPu4p/tIggi6A=;
        b=YgtoZmWJqfXFvyeaWQ86HJKVcpFAAhROAokDLwIlAEaJbQFjjZhfY5sHljkIQW0cOw
         ogOzEe5N+OUiiUc1d8qwYzfCRVXJUTTAfjShyqDWylVKOIi6BPGbJ6jBMFGZQU8BrfsZ
         GSEJb9ZJG3YiUrcxQHB8z16gpg1YEhjx1BSaeG9PdHC4eWjaI8elGhSlErvhB7eQM0jc
         XE/ZRkktbK8x/r1HHFYK6UnleDJqxP2p0UL1SYmj+G2Hh/tGBxJTuMBYfwA6mEuhaUrA
         QEk4j6PXEsfzvU7bLeYrDIhugyS3MLuh8py+/8LG4i0Ylly8QF6IfYISLddyNcf4lMd7
         kj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790011980; x=1790616780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VuKnziCRcnwT2EUABNsJz91YeadinAdPu4p/tIggi6A=;
        b=hiRBH80osjyBFPA53VRYn7sL5eRUO9UGMqjpACYjszsAEqgGoaKoCPye3BEShKd9sm
         3d9AP/FWT0/xOy7NtLMvow1UhBZIaTcQ6oNJrEiS/Aa6+t9BoQn8/cdjNCx21X9vjrLh
         3cGUtJQfL/VYTzDZx8h+LRRoXgIin/ObaEON5x2kBTDI671gH8eV8MB6IrPDpomjpr3Q
         e1T6m1Hx97hSexR9Gi0KJz5miIsuuLKUgfr92VRlEAp6yGMPbmhfWVANQC68/uv+7wX5
         7b/Z8BYiGqEFyfqPGS9cScUuDdp8y7R69913WYyrs2rIqNVBWMKqjwX1Wh37DxVVCxYW
         0+cg==
X-Forwarded-Encrypted: i=1; AKwUvBwNAIr8iu+OcMHwHO/XpgKQHZHHeDeSemu1E6VKYsh5bFCmXYR8fatuxUe6fU72RUnZDLCtiJMbuGIt@vger.kernel.org
X-Gm-Message-State: AFuF++nWw+HMpAxz5WDqJpe1bP1EGznfuluHSmP0h97vGAFHBiyYZqAG
	iDAHE9RE/RCNZHRXyvphTAlDAV3h5IlfSTJAlY4rtv2LevIpBtASnV0a5MMhExF4vXTAB/rTbRU
	8DE0kKejl4ZWyAsg2+7fZJ2CdFiuHhmk=
X-Gm-Gg: AYBFou3dhMbB9aql+8tdSNRa4j4CDUqtyIdhc5S8WCrA9PzJqymnoTyY8bKkr5Pg7oM
	qbrPH6dUC+j8kKSxwXFXgAz62GU9ZkJnIuvNz15vdFGLPeibstKLJweFkCxr2KLaG+5V0gtItDi
	cPINMit7iIVOATtXz4cD28AyvWDxqPPtvsIGIGsJEtKkVm4imBhlBvczauFQRB2StoTgPEIiGav
	t1gXG0EMQXmitwU/AqlOn8Acp6L9WtBg2ktP1Nh0mJDTSZotzQp2Bhx7wsqU+nh13Gxp1V1/eo3
	sVUVhHFUwsg2Bln6xp2XFQNy4eguwPxZdCfv/HL6E0CfFnUulOe95VZrAg==
X-Received: by 2002:a17:907:d18:b0:c27:420b:7c82 with SMTP id
 a640c23a62f3a-c2a15e0e909mr1026408166b.48.1790011979683; Mon, 21 Sep 2026
 10:32:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920170116.3624104-1-coiaprant@gmail.com> <20260920170116.3624104-6-coiaprant@gmail.com>
 <20260921170343.4CA421F000FF@smtp.kernel.org>
In-Reply-To: <20260921170343.4CA421F000FF@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 22 Sep 2026 01:32:48 +0800
X-Gm-Features: AcwNN1UD6p5KTncPSk1LxfRScJC4KOn99w2_Eqc8eBCD3CAs0EpL3r44H49taEU
Message-ID: <CALj3r0iMGUoM_VmS70NnnA99-G7_TjgA3s_x8ZmvNe12QxWoxw@mail.gmail.com>
Subject: Re: [PATCH net-next v9 05/11] arm64: dts: rockchip: rk3568: add XPCS
 and fixed-clock nodes
To: sashiko-reviews@lists.linux.dev
Cc: wsa+renesas@sang-engineering.com, vkoul@kernel.org, olteanv@gmail.com, 
	linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8822=E6=97=A5=E5=91=
=A8=E4=BA=8C 01:03=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] DT style violation: non-reg nodes placed out of order
> --
>
> commit 1674fcfaeba70039871d92af0a02901f9d009886
> Author: Coia Prant <coiaprant@gmail.com>
>
> arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
>
> This commit adds the Synopsys DesignWare XPCS and two fixed-clock nodes f=
or
> GMAC reference clocks to the RK3568 device tree. It places the nodes and =
adds
> necessary properties for board-level configuration.
>
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3568.dtsi
> > index 3bc653f027f1f..227d03e336043 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> [ ... ]
> > @@ -110,6 +110,51 @@ sata0: sata@fc000000 {
> >               status =3D "disabled";
> >       };
> >
> > +     xpcs: ethernet-pcs@fda00000 {
> [ ... ]
> > +             xpcs_mii3: ethernet-pcs-mii@3 {
> > +                     reg =3D <3>;
> > +                     status =3D "disabled";
> > +             };
> > +     };
> > +
> > +     clk_gmac0_xpcs_mii: clock-xpcs-gmac0 {
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <125000000>;
> > +             clock-output-names =3D "clk_gmac0_xpcs_mii";
> > +             #clock-cells =3D <0>;
> > +     };
> > +
> > +     clk_gmac1_xpcs_mii: clock-xpcs-gmac1 {
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <125000000>;
> > +             clock-output-names =3D "clk_gmac1_xpcs_mii";
> > +             #clock-cells =3D <0>;
> > +     };
>
> [Severity: Low]
> According to standard Device Tree coding style guidelines
> (Documentation/devicetree/bindings/dts-coding-style.rst), should nodes
> without a 'reg' property be placed at the top of the file (or the top of
> the root node) and sorted alphabetically, before any nodes with a 'reg'
> property?
>
> These clock-xpcs-gmac0 and clock-xpcs-gmac1 nodes in
> arch/arm64/boot/dts/rockchip/rk3568.dtsi lack a 'reg' property but are
> placed directly after ethernet-pcs@fda00000 and before syscon@fdc70000.
>
> Could these be moved to the top of the root node alongside other non-reg
> nodes like opp-table?
>
> > +
> >       pipe_phy_grf0: syscon@fdc70000 {
> >               compatible =3D "rockchip,rk3568-pipe-phy-grf", "syscon";
> >               reg =3D <0x0 0xfdc70000 0x0 0x1000>;
>

Thanks for the review. This is a valid DT coding style issue.

I'll move the two fixed-clock nodes (clk_gmac0_xpcs_mii and
clk_gmac1_xpcs_mii) to the top of the root node, alongside the other
non-reg nodes, and sort them alphabetically in v10. No functional
change.

Since this is a low-severity style issue and no other comments have
been raised so far, I'll wait 24 hours for any further feedback before
sending v10. If there are no additional comments, I'll send v10 after
that.

Thanks,
Coia Prant
