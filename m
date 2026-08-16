Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CCA30C16F
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 08:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786870769; cv=pass; b=jroCkLMRA9h7Z8AjCwlg1AWuIwwwulcXuCRg0sdQCCJqG+9+ZqoppxwrBQFqRoNjH6EzT12ChauYEZCxi7fN4r95rI+HVMKETRQJjm3iyqSE+B+oZDn64Gzq4RPXF+OGPgVpfKzEkapLnjS0S0osSDdAVJdrbrPsG2XgbfTXj1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786870769; c=relaxed/simple;
	bh=MrRkNVXSVcfDkm0x1IqVS/OiN0O0+RNhnY8dYOfvfZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MMGqahG0UUylg01MypBIxdj2PzDeGigTQ+BnILWp5E3NdzXoNTasiWGhWkZMGJ0c9R8VLihFEEk4Uxc2cj8z+gQQkg3FfOpde+TSBJCi9pF4XNCHfQBDedSaCPHPUZI0h6oKumwCStPeHnoHTx0zOjcxJkmBik3YqJaYuxU8c6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ik8cqEDm; arc=pass smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ik8cqEDm"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7377dde7bc6so2270675137.0
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 01:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786870766; cv=none;
        d=google.com; s=arc-20260327;
        b=nnDPphkgCWTSDvm4Y80okI5Qriq8Gh40PExlSbtI3PHkfxCCVUkrSzROXrwbl/imr5
         7V8pqV/j4PAvxyMNzue3ZHau2JBVpkgSZyj+6yqvURFwQKLWivAbF5HM6do/82/68uOV
         YblsbhvebW8LtVb3ThP2qyzyjiMdxFvFUsXMI2aEWKz4t9oR0IqdpaJEqs/1+ByDPWeJ
         YnKZFgNryg83aQpEPlTWtEt78Yi0X7dGDIfaPAefsCKuOhEeaU+gWJiBYS5H9rexHuI0
         sgpFh/ogCzNrMBNbOroHmI3fUkbqF/A2lNCR1CLf2sMYSyGjQvQmP1os017EgvOlm4fH
         Cv3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1LmQ4nt2XjP2OgxPqtP/sT+nzVt0sYBaB8O2AA9vv9A=;
        fh=YG2JSFytOj8RNguYDi2KmpaLONpN54/D/l3aUv8cov4=;
        b=V+L1bRQlB6oLDI/fYGy35Cv+E2N9z2tq3lBibUESruecUqSh/NBDEGpCFsiId/szI3
         6hwNWnkb3azRZJLpjLY7RGawaYcD/4izaBJp/dssuVnySeIGNhD14XSA9onFqaL2q/qG
         JGkD2Dy4vBebKRL8q5U+CrV2mNb8rPU1Zn3FDmtyS+nPULIHg7w8yAmODQgVfOaJ0/nh
         lghNWkrpzaUUMC+WEcryTpyKyyjn4YAvDXOCOMynQZcKJBV/qJcAaVJEtVyXgGoq0ZZ6
         VkEMSnSXesUpSNBDzeiXhShkhZmz5Dnevo6WquQ9wxpPcJKXiHQnSYXzbsh7ZvAhL3xW
         xAoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786870766; x=1787475566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1LmQ4nt2XjP2OgxPqtP/sT+nzVt0sYBaB8O2AA9vv9A=;
        b=Ik8cqEDmdgUqfjohdx0q/g7YAf3AtzikgalaiZ4HZS/EenYixYrNUxzMe2Q6mqxgg7
         2+vugnwKOvEXjpOLv0l4Pwl7pP2aignd/Xl+xO6XnHEt6Ozi11tqyq2TiKNYCE5pI2hK
         CNqcptFe6hsCoDf9E0FiO3YXoL3iDN3smR6ngeTHiudR6TpGXkMaB5ZX2CwIHbFnn+Oj
         mfgLv/kOpN0VlX1A1Vbcm/P8wjpw8TOqP4P8C1CPkyAGUcCuNVx2+SWQkQpYLggUU7DF
         LkC/Elzv7NC0p01rVwIpTcnHRgTF78t8PYYVO2hNBnu8JuD6aMGucmx13UBq+2wY4B61
         1I4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786870766; x=1787475566;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1LmQ4nt2XjP2OgxPqtP/sT+nzVt0sYBaB8O2AA9vv9A=;
        b=TTkAai+7uDyblFUx6AkDO7hqwzfjkQYE2z1SmGa5ZqMiPRZthIVMxo0F8V9d7XSEMP
         njNuY2QSgO1FoYJyqnc2tNTn2GC+pgUb4bBKHhTDnyqsJCGvzTbW5Ad8GFQFTFeVaW5S
         RAPBCUl+5yvZmUfZEwBU6lzqFYOsp4NTdeDyBrytDk7+cTFbTOe7owMCKgs8/4hAF8OP
         gVTaQGBZKeqR/sm8kkDtjxhfr+2HgZuJArQ6cXMwLE4LFiAK3PuXQceJsMpoL1b82J8C
         TbHXM33gVNV9E0a7WF5rCZq5PI9RPG3AHAgMDQptnLSW4YUCqg6JdsvEqGpqL/hlfzMW
         DwKw==
X-Forwarded-Encrypted: i=1; AHgh+RrY+RMOOdEDuIBxD5ECxadL4O1jgOZEVX9v9sDr5pIbOi/g8wqKqrLVZEUiqL2astoHdx1hTJWqOKLN@vger.kernel.org
X-Gm-Message-State: AOJu0YwrgTQu8MoYT3XO8dAORMyH8utQIhPPsJwv6YvWavBo68t+j+cs
	027iNTgxbKT5Cau9fv8q6Xx8QmFDgc8DMouyb3LDi30qaWvHtphuoNyor/6LoZXyhbTBXjvnmD4
	uSHbKqNNoZ609+Z7WBzxxY+3GGjr/lBg=
X-Gm-Gg: AR+sD11DrK/yrjGXVvlHwA5RV9xH4iLLQN3D6juBMAbCGbn+Mphc2v6PK0NX5lm32/H
	gKJLaPzMUfXLOKHKU0VhsaeODaKIZk6LVELQXOKpW7Vpx3gR0ljl1l3pXqAEt164QNpFzm60BmH
	0yJ0Ee9vRtZzSamezqBlige0iQVTfwI44M7iKZReB29mDecf5Ut7epZB7y7OAl4uW69jnBnJfu6
	dgP/XJXSm/GBAnjWUtkFvsRSrByO1OuSOaPgp+ITHUDXSWOf80ShyJS5oPhWGzKzHz5d+Fgfbcx
	OM1rkqX9S0FcoGFQoCPgSrRJ1ZNMlQWqHUfgyqb9I9sCFdaj6+W33nDrusXa9Phf5FWZ0/wPC2A
	=
X-Received: by 2002:a05:6102:3943:b0:760:330:312f with SMTP id
 ada2fe7eead31-76dd3bc43d6mr2139074137.15.1786870765925; Sun, 16 Aug 2026
 01:59:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630042229.277799-1-mitltlatltl@gmail.com>
 <35f13ab2-cdba-426f-bf4b-36f53ce1d4bb@oss.qualcomm.com> <CAH2e8h7p-i3epbxD6Ks-ru2OP+qY6nYXA+Fm+Luexo3cZ2Eucw@mail.gmail.com>
 <cbfb770e-0e27-4254-a3c0-6011e8eb37ec@oss.qualcomm.com> <CAH2e8h4ABRuOTe8Qu-iPEk-i6r-Le3bzmwFSEG_c7YmBu1LjCw@mail.gmail.com>
 <250311af-0860-4a76-9799-c01608b87293@oss.qualcomm.com> <CAH2e8h65xgLnqusTMw1QnAMSmf__YK0PsWY-w0D=32US1d9L2A@mail.gmail.com>
 <75b423b3-d721-4bff-8d42-603cb5679364@oss.qualcomm.com>
In-Reply-To: <75b423b3-d721-4bff-8d42-603cb5679364@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sun, 16 Aug 2026 16:57:36 +0800
X-Gm-Features: AcwNN1X3_AoqGZg6lT9YwRS-zp_xWQ_uWAXtkWj--hAmpkIidjFcYHLYoqMRULM
Message-ID: <CAH2e8h60opbaRGjZ_GhY=vboHEBpYUAEcO4SQ0-oTxoRXG3j8w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-huawei-gaokun3: Add dsi panel
 DT node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 7:45=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/30/26 12:41 PM, Pengyu Luo wrote:
> > On Tue, Jun 30, 2026 at 6:34=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 6/30/26 12:30 PM, Pengyu Luo wrote:
> >>> On Tue, Jun 30, 2026 at 6:29=E2=80=AFPM Konrad Dybcio
> >>> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 6/30/26 11:28 AM, Pengyu Luo wrote:
> >>>>> On Tue, Jun 30, 2026 at 5:18=E2=80=AFPM Konrad Dybcio
> >>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>>>>
> >>>>>> On 6/30/26 6:22 AM, Pengyu Luo wrote:
> >>>>>>> DSI panel driver have been added for a while, so add the DT node =
to
> >>>>>>> enable it. vdd{a,s}-supply for dsi, dsi_phy are blank since the D=
SDT
> >>>>>>> describes the wrong, no impact after manual disabling these wrong
> >>>>>>> supplies.
> >>>>>>>
> >>>>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >>>>>>> ---
> >>>>>>
> >>>>>> [...]
> >>>>>>
> >>>>>>> +&mdss0_dsi0 {
> >>>>>>> +     /* real vdda is unknown */
> >>>>>>> +
> >>>>>>
> >>>>>> L3B: DSI core 1.2 V (both?)
> >>>>>> L6B: DSI0/1 PLL and core 0.9 V
> >>>>>>
> >>>>>
> >>>>> Yes, that is what I saw in the DSDT, however, I can disable them
> >>>>> safely (hack the regulator driver to add a sysfs to handle these
> >>>>> regulators), the panel works well.
> >>>>
> >>>> L3B additionally powers CSIPHY2/3, EDP0/1, REFGEN (probably why it
> >>>> ends up being on), UFSPHY and USB1_PHY
> >>>>
> >>>> L6B additionally powers the same components, minus refgen and USB
> >>>>
> >>>
> >>> No, I confirmed they are totally disabled, since there is a way to ch=
eck it now.
> >>> https://lore.kernel.org/linux-arm-msm/20260420-read-rpmh-v3-v4-0-70c1=
52e6c958@oss.qualcomm.com/
> >>
> >> This presents you with the status of the votes casted by HLOS, not
> >> the actual hardware state
> >>
> >
> > If so, non-HLOS will vote on some critical regulators to keep them on,
> > IIRC, once I disabled L9D, system reseted immediately.
>
> NHLOS will generally ensure that the hardware that it needs is
> powered. This does not extend to hardware that *you* may want to
> access in Linux (or which was left online by UEFI), which I suspect
> was the case here
>
> >> To get the latter, you'd have to dump the SPMI registers
> >>
> > I will appreciate it if you provide more information.
>
> Take a look at drivers/regulator/qcom_spmi-regulator.c, you can get
> the actual live value of the enable register and the voltage selector
> for each regulator
>

Hi, Konrad. The real case seems to be as you said. After disabling l3b
and l6b via rpmh,

# cat /sys/kernel/debug/regmap/0-01/registers | grep -E 'c[1-9a]46:'
c146: 80
c246: 00
c346: 80 # l3b en
c446: 80
c546: 00
c646: 80 # l6b en
c746: 00
c846: 80
c946: 00
ca46: 80

Could you please have a check if this node is available for
sc8280xp?(I want to write 0 to 0xc346 and 0x0646 to ensure the ldo
disabling will  turn off the display.) This is copied from sm8350, if
the fuse register is 0x7820a8 for sc8280xp as well, then it is fused
as disabled.

        spmi_debug_bus: qcom,spmi-debug@6b12000 {
                compatible =3D "qcom,spmi-pmic-arb-debug";
                reg =3D <0 0x06b12000 0 0x60>, <0 0x7820a8 0 0x4>;
                reg-names =3D "core", "fuse";
                clocks =3D <&aoss_qmp>;
                clock-names =3D "core_clk";
                qcom,fuse-disable-bit =3D <24>;
                #address-cells =3D <2>;
                #size-cells =3D <0>;
                status =3D "okay";
        }

Best wishes,
Pengyu


> Konrad
