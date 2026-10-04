Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FCA3939D7
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 15:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128361; cv=pass; b=T8CjDxtoasmSUyxGt6i+sQxsYRXudaZ2969PpfWVifDdF2iSydESghGucZWbQEHrR66cxMChOo1m4Qn8v0/J1e9FUY8xy1pPOQCHd/L1HzLgHFdltSYsULb4hzx6gh0neCO1Bs4mH7klY+FlgcVT1z1gzzDvy3UAChhXkxdgS7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128361; c=relaxed/simple;
	bh=3cdHnUfHpaPGgAkFtOVEuzUpvi6BLXWvqN78lkdzaMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JDz9gPWwDOR7u12BUh43Pa7MMyECSor2h8PSJnqrhijzQj5W1yRLKY0ZxzQBCNTpU+ln1QMDRLTgebZ2pHFG5BTfFWcraoKzlsLMFeqavT4zrJ6QJ2N/8nxzIJg6MLgxfgb4MSVl2aTel86LYUAy/Ti0zPmtr09trsVkI7FaoXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIDTufiz; arc=pass smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIDTufiz"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d747ee1f9bso2838005ad.3
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 08:39:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791128359; cv=none;
        d=google.com; s=arc-20260327;
        b=Xpsb0zk/MdxqwENn5spsxzNfkvpDHrv5c0ngmo+BbEEfKw6dF/j8V79j6V0y3VNxXe
         kJnNhx9FuqluG71G/Gep72dXcy7/ju0XRPzfqpcKJ6on3KFmyPGiEvr2AQSbgreMHijL
         AOW2yHd/tQHgQjzkPk2gJhn71RQZ3vRKzpFMx+LsTynoSFUeejevCDk4Trij/minO5GE
         5W5/XJOqqU3wHRUi/MdgwMeGdhDdk+c2viRoD7m0Fv6vCUqmcKuLnPRZ+qJqKllzjHF0
         FR++R7PpZg2lqT7RVmI50daX91MU1K/YMzUqnazi9ampZjaCS+3CMKzGW7UCBQM8M3TE
         Npww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uU2ek87LjjL1jNDt+iYTmSSnmmr7Z48twFZ1D54C/G8=;
        fh=AaG+Yl8a6fH8UbrBtvX7gyLNrET6oS+GqlnjyZe65PM=;
        b=NCauvx4mSvs/PkoHU+f97rtMDYpY+ePXmBm8HMfMNyuE21AJiIZ+DAzl0Wvd/T3cj8
         hJkU32J3RtHk7ndGaYEGcMNvEjUmCUepY6Q80M73eyXvoB0dKr7a0MKl4J2fj7Mbb39j
         NG5c/gTkLfg7PEOTSTa7bhvHnApdSlVCu0dDgH7eLTdLmtMAdxtrre+LCQr0YuO7lMhL
         u7T/Sqq0cZxwRlYz5h6xPMC0B+VVZnj+a4SHlCakxBO7pfjI62DU20/5b3RA63D+RaVD
         tpzO7oPVuQB61nhUbCiiDfIHoK9ONShoO10RNPVPSfWKeIsZuLJcQZnhTJS8NLkx9Z8n
         1j7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128359; x=1791733159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uU2ek87LjjL1jNDt+iYTmSSnmmr7Z48twFZ1D54C/G8=;
        b=gIDTufiz6KngN5fXuYiX/qHgFZ21KQ1lxKRoK6xCOre0zIwaB5ZdZc/kGGQC/KPHKZ
         I9yH3D5OSsnGAgrBYBU2ih3DlsAmqB6SqUQC2NRKljWqwKp/1SZ277PApphXQ+O4Q+GJ
         TN45Ecl76Q2t+XxVw5PgmFy3cgCxFH0fMYCoGflTOVfE6ODmyTJbnCYuhNJdtQ4UjzEh
         z1OSXsOvY3thKX1WEsyQY6cMG8FQsIXgBjA+aYZxpNamXBP4D2fC2GUuKMc85BGrdfHs
         3SF6E/Gn9+svqNzKs4P7oc6qEj7uXdpS3Vzk0KOKKtbRpmdhLT5fAbWkZvZ8+dzjYnvu
         X0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128359; x=1791733159;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uU2ek87LjjL1jNDt+iYTmSSnmmr7Z48twFZ1D54C/G8=;
        b=BgXP7sigCxJ2yNbXB6fARL0I2+X/QzQGROImU0texJrJ5uXMMI8mlgk20JsqNeyIcI
         7yKZgGAYghljWAqDF7q7M3kgXH5Jx8W1epB28TNBGpKSBSxlHnNFONL15WctOgxXzje8
         c9V7WU9ltx/G5wSBwzLIUNw8z5BknNTEjNqsx90jhfxKeCJIqgv8BNQS0vQ906xupTQZ
         4wxUNu5oEMBwAieM3M54QlackuxvKkXIr2G79Cf5TfrNTKrbyEHHnYXoIjF+Ctj+gbKv
         vI4l6vum7MmESRELe9Cic99ImAGDNS/sPs/JRV/mK0+QoFRvE1DDLU24NbVhW+Xb7P6c
         KgKg==
X-Forwarded-Encrypted: i=1; AKwUvByq2/6JyXzleLbPERk0wjqvcvLfmc1GKWwn0o7SfYdilk9SkiSnltMLQBa+nZuDGPGh2cZPxE7A4HwC@vger.kernel.org
X-Gm-Message-State: AFq9FYJbT9DHOi+7liTImy62CX+EwEYygGtKz6S1WxU7HB0wKdlTXsVO
	BMq5a39vawvGz0v4QdocNAgMFxf8puCBONiIrLsZM/uWpC/kQ9p61NIpcIx7q8dymU+zqNigrqI
	IetPIHIFgrDT6IdX2f230ytTZ++oZxPo=
X-Gm-Gg: AYBFou3vHMCXRVSzUTTcPLlVjTUbl5FKU71I1ID4GTh5/Mcx5gILbJBpHkLN3M2WMzg
	i7T+eBy8YlVhA+QejQa7siSAjR28sewk1I1sTp1TjJzxozdZp4khCi9IjeGDJFbT8eUe9G4gLe1
	Q/ZJBi6uKoReeWuw05C4CZmW0ET0AfPkT+YgeS2bwS9r87l2y0YT4sDa4e4WOQttQmq8x1EK4wr
	8iDTSbpNVo7ikLImAD4SXFVVnf+RB8nB3pJUHs3NKkP1nftpzzD/7bMrezydzRLhQShc3IHj34E
	Vhjb6pjBr/p1KRWhFVUI5OHCBMGpL47LwUhgenKkfr/yEPlIYFv8PMJAWA==
X-Received: by 2002:a17:902:da84:b0:2dd:c100:7cbe with SMTP id
 d9443c01a7336-2e49b6dca4bmr75707755ad.58.1791128359433; Sun, 04 Oct 2026
 08:39:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922171942.201947-1-sid9.karanam@gmail.com> <8cb23b44-027d-4d81-b342-7eaca0248f63@ti.com>
In-Reply-To: <8cb23b44-027d-4d81-b342-7eaca0248f63@ti.com>
From: Sidd <sid9.karanam@gmail.com>
Date: Sun, 4 Oct 2026 21:09:08 +0530
X-Gm-Features: AclHuK9ZGYlY4040N6uy7-lCOD-y_fYZ0mAfz4ke5Z9n9mwfFspUkB4sIuVJ618
Message-ID: <CABM86pxDca--BxNFUjdZy3Z_t7qpd8a9A8FpnYc9r=VGag9bXQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62-mcu: Add power-domains property
 for M4FSS
To: Andrew Davis <afd@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Anyway, the reason we don't use the normal "power-domains", and instead m=
anage
> the power using `ti,sci-dev-id`, is because the normal power domain frame=
work
> has a nasty habit of unconditionally powering up devices before the drive=
r can
> probe. Which in the case of remoteprocs can cause the core to start runni=
ng
> and executing random data.

Oh I was not aware of this issue, seemed logical and a straightforward
issue to me, I'll drop this patch then.
I also figured this would in turn nicely move into wrapping all ti sci
handle's device ops through pmruntime (such as get_device and
put_device functions) but I believe that won't work as well.

  > * Power up subsystem
  > * Set reset line for core
  > * Power up the core
  > * Setup the core (load firmware and set boot address)
  > * Release reset line for core to start it running

Right, I see, thanks for the input :)

Thanks,
Siddharth Karanam

On Tue, Sep 29, 2026 at 10:09=E2=80=AFPM Andrew Davis <afd@ti.com> wrote:
>
> On 9/22/26 12:19 PM, Siddharth Karanam wrote:
> > Assign the power domain to the MCU M4FSS (Cortex-M4F) node by following
> > the device ids info published in TI-SCI public documentation.
> >
> > This will be useful in future patches that will attempt at abstracting
> > ti_sci_dev_ops's calls such as get_device and put_device via pm_runtime
> > calls.
> >
> > Signed-off-by: Siddharth Karanam <sid9.karanam@gmail.com>
> > ---
> >   arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi b/arch/arm64/boot/=
dts/ti/k3-am62-mcu.dtsi
> > index 68e906796aefe..1ae0870893c16 100644
> > --- a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
> > +++ b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
> > @@ -181,6 +181,7 @@ mcu_m4fss: m4fss@5000000 {
> >                     <0x00 0x5040000 0x00 0x10000>;
> >               reg-names =3D "iram", "dram";
> >               resets =3D <&k3_reset 9 1>;
> > +             power-domains =3D <&k3_pds 7 TI_SCI_PD_EXCLUSIVE>;
>
> The surrounding M4 subsystem's power domain is 7, but the core's power do=
main number
> is 9 (see below in `ti,sci-dev-id`). Enabling 9 should also enable 7 as i=
t is a
> dependency. We probably should have modeled the M4 in DT the way we did t=
he R5[0].
> With the core being a subnode of the subsystem. Then 7 goes in subsystem =
and 9
> goes in the core's subnode.
>
> Anyway, the reason we don't use the normal "power-domains", and instead m=
anage
> the power using `ti,sci-dev-id`, is because the normal power domain frame=
work
> has a nasty habit of unconditionally powering up devices before the drive=
r can
> probe. Which in the case of remoteprocs can cause the core to start runni=
ng
> and executing random data. We have to do things in order,
>
>   * Power up subsystem
>   * Set reset line for core
>   * Power up the core
>   * Setup the core (load firmware and set boot address)
>   * Release reset line for core to start it running
>
> Andrew
>
> [0] https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/ti/=
k3-am62a-mcu.dtsi#L178
>
> >               firmware-name =3D "am62-mcu-m4f0_0-fw";
> >               ti,sci =3D <&dmsc>;
> >               ti,sci-dev-id =3D <9>;
>
