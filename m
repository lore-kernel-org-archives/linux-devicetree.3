Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985697;
	b=KEthC2IzsyWTfjhK/Ff/1Ych1IV0Qsloox4unVLXETEEJ+NAQ7BgwPraWvl5v5ZL+OmN
	 Q4+vwQIgo70NVaUbkaFHELggXxqqz1MEU0nQjV1iiqV5349HZAFCu17cIXZ8YDI2nEwV9
	 Ke5OkDFJD5LMg+pQaOOS1RXm0Q+rN1bgKM4DlVfEBeQpqEAz5Dg6MuzhCenvgXPS0mnyI
	 YqlQkiZT544lC1FeUxSKcBGMC9CAqgaxsXuHqvBVd9Lf7Tg1TvT5V465/iDMkMCvpgoYk
	 oXy30jVqm66HxEGjM01+Svwhq5uZ+NUZFTDiCNPYRHsKYdP1V9G2QS8dYGQp3/rvYhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985697;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=x9p24LfSHDTqi6p+sScYV7OtgkVERfeVnsX3Ino7ugw=;
	b=WvQaROcnQOF2af7aebfa4YJWzyAbWOHvIKTg79HfxbYUVjerBIMXUKcAFTbvh2mGtJ7Y
	 NZrQpi9geI5UlzwHgw6UfBrPEfx3XAD4swrUwvoRc7RkyBjcOVPiKq0TUTQ8d+TVFGVoS
	 tvsxzMyUXku0cDBiCSDNxwUCtx2BOAJUusCRbzP3tqE5JPg6ZiIRhBUEAaEI3DsWAHQlU
	 u6LRf/mHpFwNP3sbshrgcuo+7AquWXUyZj9WD09WPlN82Mk9DthCr9xj/Dr1gvI1EN5ez
	 i1sB2wgYEksMP491JhQuAvg8gPJT8tCljRU29C19XZVTQDixMKNtYUyjAaYxREWVz4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GSbVXDLM;
	arc=none smtp.remote-ip=209.85.222.225
Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BA1606D82F
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 17:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4BA1606D82F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GSbVXDLM
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-93f30660e69so72037385a.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:21:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985696; x=1794590496;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x9p24LfSHDTqi6p+sScYV7OtgkVERfeVnsX3Ino7ugw=;
        b=bQf+iyPogQyJdJdoCbgef9jfWLLiJ3d9i5YAKdRzLqlq8M00301knPPFg0jBNdtf4W
         WIkDm0/Yi8Y38nlVuonF9sdZs4ZBoMDHkemS3pK5/+PuSX9YTnIGcT1Aqd4mlswopyC8
         e9EqhwD+5CL99UkY9PFJwF9lGJ7i8KZRKzLFvKKO7zlJityGXOq+X9hqVehh+3UNNXHG
         984qiR/jnyyJfPqRNi3RlfuMvMc2G4QX/VpKecIiF8R+87vUjfhf3OBLSscOr3NDEdYV
         hokYw3Zll1H45ruPq9G2fiIV6WkATkjGNW+mbElZl04mSsynHuN4aYk6oQ8sI96gZJ0S
         EzWg==
X-Forwarded-Encrypted: i=1; AKwUvBwqJ4nk1OzXCPkV5TYJV6vZk+h3V4jSbTqi4xYpAPlZOEftuJAEDgdiwDwd7Viat70mKsc72pFHT7nB@vger.kernel.org
X-Gm-Message-State: APuU4Z8iNHblzowMwl3pRB3u5297XXffxPxTliIlH7qlCJOVUfhiqurk
	o8yGX4sQxekVZ1lm7b80BPj8bXGGDGckMF5qGMTciChsyu0HyP4Tsn2A9oZ10UzepkUAs0B9GXa
	l4ntFuq8iWEhm27Bvrzxb+erVkXpN9gL0W6tPx9KIVb8gDD1FCRA+KuTJRBfNnSmOOVEQeCcZXM
	Hgx0Mr/hyCxM+wZack1u0RdruqRONfcoim2s0ja/owcpSDQxdcEeggLeRDC+BtHRBK0fABm1Afa
	+vay84odz6i7Q==
X-Gm-Gg: AYBFou2AI9Y1hQqMC2GXQ0dZkfM9yE8pHg9dkxKAeeQCOrc3zfdmGARH4tEKKqvDreH
	DxDPxCbYfyZ/p4RJ/HabtNW8zNySdmu8OUL1xqSAKSQlOKqj82mmwwn+1SC3pKJrn7IzX483hR3
	oD03109EwpU8w5WgEYJQp9+sEfRU9OSfjhu4ZLEFE6otP5cT9WaNRYMA97C9N7iqHPZktxPfTbW
	co44tkwcMNmx7EWNzAJV6dRZ3rdQH+hB/eUCo50ANrio0REQThPFsIgBzKR4PbcdkGtItyG3i5w
	CCu0xrlO0+2kTROmyX4U/yTRLCdxQt1rkDfu/jXDpo4+kO+5gMqW34tWY5b6I59WqbiE48zPuga
	wjxTGtxQPbFi3MC3xV/JrLhcH3dQY7is0b/Zej2Q57jd6KktDeYwuz7qq58tZryJJ2UYaGxW0kg
	Z1daBeA6Bu/ZrCMUsxchmn/uLO6l3vpBT1
X-Received: by 2002:a05:620a:2609:b0:93f:cbd:8e20 with SMTP id af79cd13be357-945f35d4fc2mr458978985a.73.1793985695850;
        Fri, 06 Nov 2026 09:21:35 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-945f5984eaesm31766685a.4.2026.11.06.09.21.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2026 09:21:35 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14373747468so1468838c88.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793985694; x=1794590494; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9p24LfSHDTqi6p+sScYV7OtgkVERfeVnsX3Ino7ugw=;
        b=GSbVXDLMb2QaN3O8YpaEQT5vB6DELHMB1TH/OM9nokxE/iacjDVyDsM3WR0ib1oFJP
         TMXvc9p1KyDAQed9P135FCf6yAZqlFHIgkQ2bA6KMzGm+PZnEmfMsw4gW4VG6uIDiFi+
         kGLczxz9EAk6rFX6miRnMhZXwYWEYKbe25cnc=
X-Forwarded-Encrypted: i=1; AKwUvBxGbcYIEmhUgRlVL7zFbiP2bICd6VKyF226ohVtMCRVCfsgb/W7Kpri2/o44q7oTTVm29lw7cUKZwFw@vger.kernel.org
X-Received: by 2002:a05:7022:eac9:b0:14c:d8d9:9502 with SMTP id a92af1059eb24-1b25d2f75acmr4645978c88.14.1793985693864;
        Fri, 06 Nov 2026 09:21:33 -0800 (PST)
X-Received: by 2002:a05:7022:eac9:b0:14c:d8d9:9502 with SMTP id
 a92af1059eb24-1b25d2f75acmr4645945c88.14.1793985693180; Fri, 06 Nov 2026
 09:21:33 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030181034.3811225-1-kamal.dasu@broadcom.com>
 <20261030181034.3811225-7-kamal.dasu@broadcom.com> <e27b69ed-7444-49ac-99d2-dd78f2ef8b9c@linux.dev>
In-Reply-To: <e27b69ed-7444-49ac-99d2-dd78f2ef8b9c@linux.dev>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Fri, 6 Nov 2026 12:20:54 -0500
X-Gm-Features: AclHuK-9gKqVSq2QdAwIZcxJFXm_faPXKcSvMprQyRcwpT_qP3BTXNFJIOncP1Q
Message-ID: <CAKekbevoPJZ7VFCE_4d+0+i8eoT63dwiU-sY7FnTyXALBFQHkA@mail.gmail.com>
Subject: Re: [PATCH v11 6/6] mmc: core: Add support for resetting an eMMC at
 system resume
To: Shawn Lin <shawn.lin@linux.dev>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>, 
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000000ecde7065f9ed864"

--0000000000000ecde7065f9ed864
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 2:20=E2=80=AFAM Shawn Lin <shawn.lin@linux.dev> wrot=
e:
>
> =E5=9C=A8 2026/10/31 =E6=98=9F=E6=9C=9F=E5=85=AD 2:10, Kamal Dasu =E5=86=
=99=E9=81=93:
> > From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> >
> > The DT property reset-card-at-resume specifies that we need to make a r=
eset
> > of an eMMC card at system resume, assuming it also has stayed powered o=
n
> > during system suspend.
> >
> > To implement support for this, let's start by parsing for the new DT
> > property and set the new bit MMC_CAP2_RESET_AT_RESUME if it's found. Ba=
sed
> > on the property, we must also set MMC_PM_KEEP_POWER in the pm_flags for=
 the
> > host, to keep the eMMC powered on during system suspend.
> >
> > Finally, to manage the actual reset during system resume, let's extend
> > mmc_resume() to support the needed behaviour.
> >
> > The property only makes sense together with keep-power-in-suspend, as t=
he
> > card would otherwise be powered off and system suspend is refused. Warn
> > about that while parsing the DT properties, to flag the misconfiguratio=
n
> > upfront. While at it, claim the host around the reset in mmc_resume(), =
as
> > it sends commands to the card.
> >
> > Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> > Co-developed-by: Kamal Dasu <kamal.dasu@broadcom.com>
> > Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> > ---
> >   drivers/mmc/core/host.c  | 13 +++++++++++++
> >   drivers/mmc/core/mmc.c   |  8 ++++++++
> >   include/linux/mmc/host.h |  1 +
> >   3 files changed, 22 insertions(+)
> >
> > diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> > index 8e9e61839198..8b38ff45d20f 100644
> > --- a/drivers/mmc/core/host.c
> > +++ b/drivers/mmc/core/host.c
> > @@ -48,6 +48,14 @@ static int mmc_host_class_prepare(struct device *dev=
)
> >       if (host->bus_ops->pre_suspend)
> >               return host->bus_ops->pre_suspend(host);
> >
> > +     /*
> > +      * If it's required to make a reset of the card at system resume,=
 this
> > +      * indirectly also means that we must keep the card powered on du=
ring
> > +      * system suspend.
> > +      */
> > +     if (host->caps2 & MMC_CAP2_RESET_AT_RESUME)
> > +             return mmc_set_host_pm_flags(host, MMC_PM_KEEP_POWER);
> > +
> >       return 0;
> >   }
> >
> > @@ -375,6 +383,11 @@ int mmc_of_parse(struct mmc_host *host)
> >               host->pm_caps |=3D MMC_PM_KEEP_POWER;
> >       if (device_property_read_bool(dev, "wakeup-source"))
> >               host->pm_caps |=3D MMC_PM_WAKE_SDIO_IRQ;
> > +     if (device_property_read_bool(dev, "reset-card-at-resume")) {
> > +             host->caps2 |=3D MMC_CAP2_RESET_AT_RESUME;
> > +             if (!(host->pm_caps & MMC_PM_KEEP_POWER))
> > +                     dev_warn(dev, "reset-card-at-resume without keep-=
power-in-suspend, system suspend will fail\n");
>
> No strong opinion on this log, but we set MMC_PM_KEEP_POWER if
> reset-card-at-resume is present anyway, could the suspend fail?
>

Yes, it can due to user error in mentioning both variables. Two
different things are involved here:
 - host->pm_caps is the static capability. mmc_of_parse() only sets
   MMC_PM_KEEP_POWER there when "keep-power-in-suspend" is in DT.
 - host->pm_flags is the per-suspend request. mmc_host_class_prepare()
   sets MMC_PM_KEEP_POWER there via mmc_set_host_pm_flags() when
   MMC_CAP2_RESET_AT_RESUME is set.

mmc_set_host_pm_flags() returns -EINVAL if the requested flags are not a
subset of pm_caps. So with reset-card-at-resume but without
keep-power-in-suspend, prepare() fails and system suspend is refused.

The warning is there to flag that misconfiguration once at probe time,
instead of the user finding out from a failing first suspend. I'd prefer
to keep it, but I can drop it if you or Ulf feel strongly.

Sashiko (https://sashiko.dev, patchset 98989) flagged one issue on this
patch: mmc_resume() ignores the return value of _mmc_hw_reset(). If
mmc_init_card() fails after the reset, mmc_resume() still returns 0, so
mmc_bus_resume() never prints its "error during resume" warning and the
card stays marked runtime-active and unsuspended.

I think it's worth propagating the error, as _mmc_resume() does:

  int err =3D 0;
  ...
  if (mmc_card_keep_power(host) &&
     host->caps2 & MMC_CAP2_RESET_AT_RESUME) {
  mmc_claim_host(host);
- _mmc_hw_reset(host);
+ err =3D _mmc_hw_reset(host);
  mmc_release_host(host);
  }

  host->pm_flags &=3D ~MMC_PM_KEEP_POWER;
- return 0;
+ return err;

Ulf are you OK with me folding this into 6/6 for the next version ?

Kamal

> > +     }
> >       if (device_property_read_bool(dev, "mmc-ddr-3_3v"))
> >               host->caps |=3D MMC_CAP_3_3V_DDR;
> >       if (device_property_read_bool(dev, "mmc-ddr-1_8v"))
> > diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> > index 026003ba507d..a9e3cf7ae039 100644
> > --- a/drivers/mmc/core/mmc.c
> > +++ b/drivers/mmc/core/mmc.c
> > @@ -2320,6 +2320,14 @@ static int mmc_resume(struct mmc_host *host)
> >       }
> >
> >       pm_runtime_enable(&host->card->dev);
> > +
> > +     if (mmc_card_keep_power(host) &&
> > +         host->caps2 & MMC_CAP2_RESET_AT_RESUME) {
> > +             mmc_claim_host(host);
> > +             _mmc_hw_reset(host);
> > +             mmc_release_host(host);
> > +     }
> > +
> >       host->pm_flags &=3D ~MMC_PM_KEEP_POWER;
> >       return 0;
> >   }
> > diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> > index 032c018650e0..3c0ea74e3e35 100644
> > --- a/include/linux/mmc/host.h
> > +++ b/include/linux/mmc/host.h
> > @@ -430,6 +430,7 @@ struct mmc_host {
> >       u32                     caps2;          /* More host capabilities=
 */
> >
> >   #define MMC_CAP2_BOOTPART_NOACC     (1 << 0)        /* Boot partition=
 no access */
> > +#define MMC_CAP2_RESET_AT_RESUME BIT(1)      /* Reset the card at syst=
em resume */
> >   #define MMC_CAP2_FULL_PWR_CYCLE     (1 << 2)        /* Can do full po=
wer cycle */
> >   #define MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND (1 << 3) /* Can do full po=
wer cycle in suspend */
> >   #define MMC_CAP2_HS200_1_8V_SDR     (1 << 5)        /* can support */
>

--0000000000000ecde7065f9ed864
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
H0K0rs+X8O45xZIUJlxzf5UZex3BLi1f/H+08rSQULWEtO/ECwkFod2DIzSX7fZdz5RQ1PpziEOp
goo/JZPYIeCmgt3rIyvMuupj8Ymb0J/velhpXfQuYUM52viw2nmqVcxCwBqyM3Iq7eI4xtEOFRmR
wxSizd3MSQMf6GCHA4/B/6ttnxhGAr3utaOU+x/RnzG0gPLTW1XRAQ0+GVc/tGFdI864OG1cyrRl
GvBnHJQSAFOIKwYrUk2oFpgMbafQ6osCAwEAAaOCAdswggHXMA4GA1UdDwEB/wQEAwIFoDAMBgNV
HRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcwAYYt
aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIAReMFww
CQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZodHRw
czovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwIgYDVR0RBBswGYEX
a2FtYWwuZGFzdUBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYDVR0jBBgwFoAU
ACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFOV9h+N/T9ZsJ40qRxh7NYYD+N6MMA0GCSqG
SIb3DQEBCwUAA4ICAQAKtKh30wv1/30230mCimgUjMWQE/LImRmyfDgrp2IhBVS6mDun+wH8thEB
WhBHQMz3gsGixU4ZBJG72eWi39IzQ7CGnisJwA0+hsGaGg03AVtFtqo1rXYRZ81MEDOb6BPYLigJ
RsHbNmrUGR+LsGeUwOWUeRXqBrYaYFrkgHKvVK1NEewv+vUY08n4tsezO3jq0HKhVDY46bMbf8vL
oQqqhtcQvu2+5FK2jpUayeubpzPwobjEG61RIhBvM0KivY4CB2s9A7qgjL1XBycAybIvG03BbFoT
t282FqXwk9JU6YihLlt+hpzO9UF7E8GZYlQlVIZOLOvytqilhua+2h77Yy8Jz/FJyIXKuaLPtvb2
SC2shL7jF28kQbP3QUKwAig+cxwbpngnUkd9D9cXSHVq9PPwYm0A4eAO0YQ/80Uq20+gXF++g0sy
NKrrV3i0T1dbCd86miGDKvarGzjh7pdsdwNY15liGP6Orib1tnWkJcbtP1rJty4r/mbbxcK8ILO4
IvTGFG6BfjJ+La0aRt69i1fQmjUWHLwzkLNpw9cJH8/MONZcEJeDkq9WELSyy29bagStk5KHu7NO
TH65sZg+i/4qmj3DEeEGTr/Shzp4YWSNn4W7NEelr0VgDlwa7xqlwZjXxG4MIJqy0SsQlAwEXtqd
nH2FpJfzgAetkuyU6DGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2Jh
bFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1FIENBIDIwMjMCDEca
ZUGCu6d0oT1M+zANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgIiNwQas+Yk+xrgnD
ppKdIQs8LQyPREN9hh7r8kU4fjEwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMjYxMTA2MTcyMTM0WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgB
ZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEw
DQYJKoZIhvcNAQEBBQAEggEAiXgW1eOcpT99DUKcrJEWL401IuSqCZ79s35eWgxjaOP03gt7J2bg
qYkA4K/Yndr9H7TqIBZq+C6SQ7f9Qg/Ht5u3Sj48Ag3UueJy1BCHwS22kH2NrUGUfpMXZd+/pvbc
4DPtC3XhNUx+DmH7CDFHUPVKIW3xz1Jw39lj0A1qQnSAqJBqM2y8EhVomfT6KHOfnrEmoE3PxU/O
xZeXPr7JjOfQ1GYy3bfpXap920hT5wNxHJww14e7VY6nt6aKnV4gbvsbqq+c/AMQrYNP+LR77QFL
MYVvHeRA16ZKIf09QagtADgBLN+hWNz9XpZsZiSAZqR4PaZbPn4HV00eyypdaQ==
--0000000000000ecde7065f9ed864--
