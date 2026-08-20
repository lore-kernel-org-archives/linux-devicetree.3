Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB313F3282
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218459; cv=pass; b=Twyeq/OKQ1iHMXtunL3PHXRZEcGoBEyAEq2tviWiNOZOATDWa8c9ZoWMlXRQ3jIrXitxkZamdBW+xFr/Jp8f18L1dwIm+DR+rHGQv/M9of/F8IzVXsCZr4mahAd+FmvT2pkWD2sYtMD3DIZkJwV/PFQJSQ+ZL6up/QQX/nyrG4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218459; c=relaxed/simple;
	bh=nYYBXc76RfdtU54i/yfZoijMWBxoO6zClIQBh+szfn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QE0CegbYbE6nUXjyWGc3oy4H4ZcIZXcZRmCqXubkyHGaHGEKZvS1RgcjIl9JONl3L8Yz7XZZOwJHnZxRlQ1CDI97uPka0IM0MBzPZ3qCR2QM7ZiR4gtsm4RrS2cjTNG3cUTpQBl+wzxpoYUs08JdHNCvAJGhZWJnw9wnJsnsymE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3kOmxpj; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3kOmxpj"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a1585728b5so17439441fa.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:34:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787218450; cv=none;
        d=google.com; s=arc-20260327;
        b=PhyJxnQsbIDwjmK7eQyHk3zHRB3u10yAwd6Qzb4GnCf+/RDintBgGxCA1WzQjvao0o
         ZPVV7aGEpiuZXNlohfdxwuZApSUonTOd/0tijdvhgCrL1D4lDA8ZynsxUk9FRdoQEXpt
         b8pu9lbiq4/NDO2gkBX6Yv5B7m8wGQ+8PgOM+apf3zl1x+xLZIXfQJLCWXgRHiFdnh0c
         DxIDGXIoogkVXjWT7Gav7gkhhpiS+Ru7uayaDVaMpq0N/e7af09ID+fTxUYeV0NaX7c+
         2jJBL6l0j4DrCrEDAHjQaB9TQj9UFJ2uhVc62301TM/Y+W/gurd7OATnl7w+xLFRymam
         nffg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nYYBXc76RfdtU54i/yfZoijMWBxoO6zClIQBh+szfn0=;
        fh=vsqs1G/TASfZ9QKxva5Ofv4a525Y1p1v8w0Iw6xs0f4=;
        b=YRKscXkUHEB1+tpahv6i1xJCHjldUeTIlDyNMBuvHSEwf32zphVOjfYbazz9ecdn6v
         nLwtGZvjgrz1TVDBkOZ0eL5BNsIcpSzSMvQ/3lX/D7ThAYtRduT+8UQpvGakk+32hAao
         aKzkFg7N+wog/z2D/47VTXNapHXdvwU0MHwQvr+DxT8NuFI9Kk+cpcDg7nOUydt+blyY
         +9tlCorVs7oLWsB4nJLvm8UpSVST8Lf7IRLbqATPXUYuxk99wd473eaOwEd+P3rTpv9Y
         d3TgMDljfnQg81ynu+K6vxkvqfhBlYJadp2zWLSf10FMeGjODJDlv5PMYM8mowkNLvYL
         7Sqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787218450; x=1787823250; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYYBXc76RfdtU54i/yfZoijMWBxoO6zClIQBh+szfn0=;
        b=S3kOmxpjr8hALgLJmQEIN0nbQQ1PFcSjlZ2Rjp4qBk6XLRaTayQE2LWy9+usQDn++e
         qJrw1kOUZe7DE2bwFxzn4IcKlib2GXJyoL8CCS+Gt/8T7SoUQH3Zx0/9fcm5/ENWwB4V
         stbQrWbSUKCgXiG9mMLyGC7hLJrxG6uH+XZoW7W6XEIpB6KGFVJl3eVhIInzR07pqleo
         u/0eHDN4tOqdEG/ZXqS78bRvLNDxaK6BoS0xlKxxJNQe8C4yN7BpJMqubz25ea/5VdKr
         EYFOapSmNxoahpNxkKUkonR0fXpmsvR+Uvb/kANOuLUZYR/7vVAKJd7EsnjTUgIvdaRL
         RRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787218450; x=1787823250;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nYYBXc76RfdtU54i/yfZoijMWBxoO6zClIQBh+szfn0=;
        b=YxTTGNeQpdzvNI2Q3qpTajbiBEag8EC4tvTqMvkK3ber4ksHnTHFDoVJTHldQI3DfP
         UsNK0jHUC1dyHkjO8tsY8IFT0Np969D+pRk7c1jcAYV+VR6thu7Je0BxUDOGq+/KmHYl
         35PItNKeBKGlTVEY8hV+jD/ezMhAB4zM4hrajpBMZ/WhzKn4lNtCRE2SOBoKtM0+6VGe
         XdRTtFp+8TJHMMx3cDdqLk2vw5r85xK8qmrt+f7xqjnCJoch1j/z+j4QfvTy1ZOQ/FT4
         v8jexG/9KGog5S+bzENJ7zTsL7iLToqOgc5tHTPoID1qhccy2xTss4sb6CoA7hiPOH4J
         8aLA==
X-Forwarded-Encrypted: i=1; AHgh+RqBb8MiVUVveT/NET4R4mdAlXMSAzlODj+/HQLEpW6cES5L7TV7Zv+YsAbT5uZkCapWTLsXuN7sFj3C@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt7sh+kslTbsTT5aoiNkSrJ+4PtytqSjzMY4gr6VOM2zWrBFFR
	dtQnPzd64F98BIdOU+cazPXGvJsEdOP4k7qFFqn3H87Nt5AwO7xtFhRd26KZG6jGBC/2ZiUPePn
	Yb6NKPpHv5lcAMoVChmPhCvYwFY3Zb4Y=
X-Gm-Gg: AR+sD11GtS4sDKMJDoiLdd5QRu3XjxJG/cfAdRvkWuoIh5KqigbrTycc48QN+hI8uXi
	rYiXwJS1K0X6Es3N7x+qAiaGUq1jRcKUPgwJV0sq2lsWYZIgUWJhynwQQuJDLXCjMp1ecPRH0K5
	i9NVxJPunn10AqoWhof5LD4lHe+00vtBV2bHyXkMF4V8NNLCYvwoSNVQrIteCyLRF1N26Mzh1wI
	lPDYUT3bLRngSDPjGn9xXe6ijqoNO4TmkLwndgluaf4QeqGLOMVXTJ/j/3y7yPIMBBxVt1Ro3vX
	oJ/Gj8e+RoV2Hxc3ki5SQeprK78cbKJeoR2GopCqa4CrdyWVJTAugH4jv9MoqBC8RCJaeWJtDIw
	nE7MsRdUT+toMktznhe6uGOrbog==
X-Received: by 2002:a05:651c:2118:b0:39e:a64f:d7a9 with SMTP id
 38308e7fff4ca-3a189725893mr23369941fa.2.1787218449766; Thu, 20 Aug 2026
 02:34:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADOrJmbTyrGGkq+9OJDXCgTa2HvNo8BWxoE6yjafcrOq7WNamw@mail.gmail.com>
 <20260817215428.84740-1-gvalkov@gmail.com> <20260819-generous-nickel-dalmatian-b6bb08@quoll>
 <CADOrJmYfBe3ADun_kFjFSH6YOSTX7Vu3UsFsL57yuRdaQ=eJCA@mail.gmail.com>
 <e554c007-67e3-4fbf-b85e-5de02f649e83@kernel.org> <CAGXv+5H7AhZgZ06r9KO3HLZ9Cymkai+Cv9SgVTuSC1PjgGf8hg@mail.gmail.com>
 <d6c8f19e-f154-4b57-9101-cf3b73e9794f@kernel.org> <CADOrJmYxKTyDkKPaKCpH37RsyyZJZ+4uReE--+uvnHmEdNJVOw@mail.gmail.com>
 <c38cb98e-0746-4b28-b0c9-ce59e8338048@kernel.org>
In-Reply-To: <c38cb98e-0746-4b28-b0c9-ce59e8338048@kernel.org>
From: George Valkov <gvalkov@gmail.com>
Date: Thu, 20 Aug 2026 12:33:56 +0300
X-Gm-Features: AcwNN1UdyfRyP4qTovLiX62_oFOyy91L008QCKICpAGE3pTfgFyxj68IsFBTyvc
Message-ID: <CADOrJmb8CTkjRFp7OjynfQSFm3fHT87wemUM4X5yJjTtS=C7tA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: net: wireless: add flag marvell,ignore-regulatory-hint
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, briannorris@chromium.org, johannes@sipsolutions.net, 
	andrew@lunn.ch, krzk+dt@kernel.org, francesco@dolcini.it, 
	johannes.berg@intel.com, kees@kernel.org, miriam.rachel.korenblit@intel.com, 
	rafael.beims@toradex.com, avraham.stern@intel.com, error27@gmail.com, 
	s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, chunfan.chen@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Aug 2026 at 11:14, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 20/08/2026 09:50, George Valkov wrote:
> >
> >
> > Krzysztof:
> >> regulatory-hint for me means usually regdb, but even with your meaning
> >> you tell SW what to do - ignore hardware regulatory information.
> >> Property should not tell what SW should do with hardware. Property
> >> should tell what is happening here in the hardware. In this case: what
> >> is the reason behind.
> >>
> >> IOW, why user of a board in country X, where regulatory data says X,
> >> should have the correct regulatory data ignored?
> >
> > Because users in X buy a board for X and the regulatory data says U.
> >
> > Indeed when the ROM regulatory hint is set to US and the driver
> > reports this to the OS, the wireless-regdb restrictions for US are
> > applied. This would normally be fine, however the third radio in
> > WRT3200ACM and WRT32x, reports US on all models including those sold
> > in the EU and other non US markets. This creates a conflict with
> > radios 0 and 1, which report FR and also with my correct setting: BG.
> > With the wireless-regdb restrictions for US, FR and BG applied, radio
> > 0 refuses to start.
>
> So if you move with your router to US, you would need to change DTB?
> IOW, the DTB is per user? This is obviously wrong... What if one device
> has correct regulatory data written and you ignore it? Why would you
> ignore it? If you decide to ignore correct regulatory data, then you can
> as well ignore it unconditionally and this property is not needed.

All radios on these devices operate according to their certified
region. The firmware for all radios is closed source, locked-down and
there is no API to change any regional settings or affect TX power. By
design, the regulatory information for this platform is configured
from the devinfo partition mtd3:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts?h=v7.2#n106

cat /dev/mtd3
admin1_passphrase=[...]
admin2_passphrase=[...]
cert_region=EU
default_passphrase=[...]
default_ssid=Linksys07770
deviceType=urn:home-linksys-com:device:Router:1
devinfo_version=20160121.1
hw_mac_addr=[...]
hw_revision=1
hw_version=48SAM203.0GA
manufacturer=Linksys, LLC
manufacturerURL=http://www.linksys.com
manufacturer_date=2017/12/26
mfg_data_version=1
modelDescription=Simultaneous Dual-Band Wireless-AC Gigabit Router
modelNumber=WRT3200ACM-EU
serial_number=[...]
sw_version=v1.0.0
tc_passphrase=[...]
tc_ssid=[...]
uuid_key=[...]
wps_device_pin=[...]

The intent of these patch series is not to make the radios operate in
a region other than the one they are certified for, that's obviously
not possible. As described in the commit description, the goal is to
allow the platform to use the correct region, which is stored in the
devinfo partition. The hard-coded region in the ROM of radio 2
conflicts with the platform region and should be ignored, otherwise
radio 0 and 2 won't even start. And yes this applies to the case where
the user bought the device in Europe and has configured their correct
country.

With routes that allow the region to be changed, a user can move from
EU to US, set the region to US and use their device.
This is not the case with this model. The radios refuse region change
so the user should not use it in other regions.
For models sold on the US market, all 3 radios report US. The platform
also enforces the US region from the devinfo partition. Even if we
ignore the ROM hint from all radios, the platform will still use US. I
don't see any regression. My changes are carefully scoped to a
particular device which needs them and do not affect any other
devices.

> > Would you approve any of these or suggest a better name for the flag?
> > Should ROM be in upper or lower case?
> > I omitted 'in-ROM' to keep it short, because the driver check line is
> > already longer than 80 characters.
> > - marvell,ignore-regulatory-hint (current)
> > - marvell,ignore-regulatory-hint-in-ROM
> > - marvell,invalid-regulatory-hint-in-ROM
> > - marvell,invalid-regulatory-hint
> > - marvell,invalid-regulatory-ROM
> > - marvell,invalid-reg-hint-in-ROM
>
> The point is that the regulatory hint is NOT INVALID. One device was
> sold in US with US data, so how could it be invalid?

US devices have no issues, because all radios report US.
I would love to ask Linksys the same question.
My router was sold in Bulgaria and radio 3 reports US. Others bought
it from the UK, DE, etc - same thing. Please allow me some time to
install a clean firmware and I will post the output from
iw reg get
so you can see the incorrect regulatory hint and mix of three regions.
This will take some time, and I will be left without a working Wi-Fi
until I recover using UART.

Georgi Valkov
