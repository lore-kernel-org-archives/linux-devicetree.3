Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA3222D4E9
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776174209; cv=pass; b=ZVxF8Kk4Rg1R/e86ir9mDa/rCV+rhr36mJ36EbyJhaAHD5a1W/NHqm2qxn4htzefBTIn6BncZKfYaFdQ9AQRyzKgAyRHHlzSfRHEcW0HrcA8EyD1O44KTlDL4Yzto55T76tk8/uvnQAEfcUsPr2eWik7+k9tvDRnANB4KddDvVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776174209; c=relaxed/simple;
	bh=+FMcleE/RJk8JXq4ZJIsUVYV4jwK9150VQYwhJJuz3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PYnSbsC6AyNStFEqY5TEqJAubsG5GVJUycc5vArEQJU7FegBNGvzGUaK7TxW6GX07UQ8476dhfhhWjENIGwftlCO3gknALBDWyx2Y8xGl4/4pFw0TFw/DVNhLeCNbmfW8hP65c9pavCWqphBSKslCErelthGW6UditWtcja0BlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MzGXfcs1; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MzGXfcs1"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a2c500750dso5566946e87.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 06:43:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776174206; cv=none;
        d=google.com; s=arc-20240605;
        b=CQ1FV3ja459PtyypaJ/HP2vOPE3mtWtEh8uOieoyPYRSit1NmewLWUDhVXoHa0qTQR
         7ze1PSE3Z19c5ZbgaUX8nYxQ8P+ykVUFBsUeX3FJ9x6RoV97v36tD4I5e2pSSOQpHmz6
         wtlO3bY4QPhNz8Hx2ZAOeDvLaouv3sThc++lO21UuAdZjH7mrpdIFMgttI3Hwq+zvcyh
         kP/ekN7DTNzzBozbPpfvV7j7RPwjSXmglJ0RjZxNr3Zic4dA2Mghk0LGgT+Rvh6yevg3
         ZtLX7KaCFyY4+04LZdh9wOTBSbmRcf+mkdkKO7Jz4K9W2odz1r8Ul6g3IHf2rq0tyxc2
         90tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Zy/0PzEut0PvWHR237jELAY9rSr5MyVNvmg6pBAc6Og=;
        fh=g2ANjnAUZEp+9EZQpjGBrv1wzgw2/pe9gwIWgj2xg6g=;
        b=SA5FhcDtAhvSz8mV7EMYmMqH7afeVWUkP5XvLk+Hoq8SBOfqw/5qHCIPFFKZZLoY//
         7/JRzus+tztCmYOUtST5j1CtMLb9XuhWxyx0uLj0rrIK7f/N1lsxMMRqBTOyttj1bQKo
         UhC4hq2imgX3DQUL7RZNxqi8ofvvD3PpusNkL+ebiv2NKbRfWfQvoZxGlK5pVte7aya/
         /9TzrH0W4uNlHs9LhlODJj5lwDdp/kbP7gGfRvayXkRxkNZMMS1JTxNE8Aw9ygyDze6s
         fdNM00ZZnfAO0K/g7sx3x+ptcASAKN04Xk9pd2SKwEndv4sqO+PWEWbuBxUf9+vv7P7W
         +tHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776174206; x=1776779006; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zy/0PzEut0PvWHR237jELAY9rSr5MyVNvmg6pBAc6Og=;
        b=MzGXfcs1iOQSunlCSB7WO0Z7I5Zt2w0pLfXkAxiFTN86ZKsQkD0Kcq5WR+Ldg0ps5p
         vhYpW4hEFLI1dY9mZ9wLG7mNUuW1iihIdFpd4VMkO9FH6TZkdZsoBV9Ir6HVacdXJeUb
         0dSs5OFUKdbRs1NsrcxJetfOUIGwUKtn9dx2yaW9++G7vcwQXdaa5SaS4j/5BdHRHOsb
         LDipjcwb1SBg8JAvf5kkoFZjNU5Ezc8QLcElWRqfxYawL9o1HW7sUtEOwFiw32JFgyJg
         ZL2qznySay7+ha1NOnCez+73WpuDSzC1+VgFK4esY4Ems05DGSJr0CD3SMVMk1pMqjaS
         jL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776174206; x=1776779006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zy/0PzEut0PvWHR237jELAY9rSr5MyVNvmg6pBAc6Og=;
        b=XMiEe4F1eDar8tmr44Q0Hwsv9YC0ytqS37BMZ5RtzQhEmrfyqWSQJ4k4wvNKU7C4YX
         PSRzvV5laZ5MFDtZUzY0aRV2C52FoRZqbj1RqqBZ9n+wtI3vPNrmOToUP5K4x56Tia21
         U9loHbYyqqH/wtNCvxv2X3bQ/gEz9MC3SuM/JqlBP6x8r5pbPIHIA+XGTqrXht5qHL2N
         r+Nn4vmTOicYsqiYz2xz3SXktImT5WWpVdyuUgUehlfRRSQ/sdNBlxwJLC/2Mr3ZvOkf
         WmBjrL6fKZ5qghUdQVBis9NSxfARqxewCQLuylpSievLqdlEm0iQBE4bFW9qhrp4ry94
         RFmw==
X-Forwarded-Encrypted: i=1; AFNElJ+chuXnU4CV8giWoqkwW1VsEZdrZJLUiXdmQ1MWcvy4TEN/Qm5YJ3M6uV01H9tnP/Rv9ohD+W51QKMH@vger.kernel.org
X-Gm-Message-State: AOJu0YwS/fRXoVLwxdl0z7ZuQYtmgOL0JToq4FAMuH7NGXstRejBDwiI
	l2489dmGCK/zwzZ2sljKqzuhHBno8I88jGh32wxYk5lMtLVX2AzU/6gWPZAEAQWmoLPs+AmP0DY
	lphDsSRO1UR6OwGquz5VoMLLE3BHjUNPtLiiy+ZK/Ow==
X-Gm-Gg: AeBDietQXNeV2sj/IzYjt1mcPqXmF6AowynCFxV/YhJCMQeyusewgj4n8ZjqUGrl/MV
	xF1cRF+4bA6UgRG6z9V6GoWu4OkEZhvlaWCHfTyfypQohPiLciO0OwtpSqCeEQwT/01XMRxL3cq
	E3V8k8r5Yz55LrpqeAjaHVyBjqtFwiZpLttPED5hdeOOlA4yV4kgMVz48oB9nUeqZnPY3Rhjjbg
	Nz8oA9M+rUhb0zHOJzXgKc2j4370cGr5nYoSdvRazb/bTTSqaeAs5+MC52A9MkOvXA5b2HPSDb/
	I0m5IZvboE2XKiGxFrA=
X-Received: by 2002:a05:6512:692:b0:5a3:d3ac:505e with SMTP id
 2adb3069b0e04-5a3efb62ae8mr5639501e87.44.1776174205307; Tue, 14 Apr 2026
 06:43:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
 <20260310-topic-lpm-pmdomain-child-ids-v1-2-5361687a18ff@baylibre.com>
 <CAPDyKFquJ7K4NcWuKMr1sjrnFVVPGAeLCiSF_FhvJf9Frbn1uA@mail.gmail.com>
 <7h4iljskvz.fsf@baylibre.com> <CAPDyKFrR2zyMFXTAkKs1XRgB-u5jSP256g730s=7SLuOZKsKVg@mail.gmail.com>
 <7hqzomqwpv.fsf@baylibre.com>
In-Reply-To: <7hqzomqwpv.fsf@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 14 Apr 2026 15:42:47 +0200
X-Gm-Features: AQROBzD-JbDP-fgOPRrseyRbXAcHRr7LSIAAw6wp14sGFXLCR1gaiFIhrIczbGk
Message-ID: <CAPDyKFpWwwuxdU63Kuq_zoKkrFhkSjN6RrxdOCoL2u7JuH9B2w@mail.gmail.com>
Subject: Re: [PATCH 2/3] pmdomain: core: add support for power-domains-child-ids
To: Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 11 Apr 2026 at 00:25, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Ulf Hansson <ulf.hansson@linaro.org> writes:
>
> > On Fri, 10 Apr 2026 at 02:45, Kevin Hilman <khilman@baylibre.com> wrote:
> >>
> >> Ulf Hansson <ulf.hansson@linaro.org> writes:
> >>
> >> > On Wed, 11 Mar 2026 at 01:19, Kevin Hilman (TI) <khilman@baylibre.com> wrote:
> >> >>
> >> >> Currently, PM domains can only support hierarchy for simple
> >> >> providers (e.g. ones with #power-domain-cells = 0).
> >> >>
> >> >> Add support for oncell providers as well by adding a new property
> >> >> `power-domains-child-ids` to describe the parent/child relationship.
> >> >>
> >> >> For example, an SCMI PM domain provider has multiple domains, each of
> >> >> which might be a child of diffeent parent domains. In this example,
> >> >> the parent domains are MAIN_PD and WKUP_PD:
> >> >>
> >> >>     scmi_pds: protocol@11 {
> >> >>         reg = <0x11>;
> >> >>         #power-domain-cells = <1>;
> >> >>         power-domains = <&MAIN_PD>, <&WKUP_PD>;
> >> >>         power-domains-child-ids = <15>, <19>;
> >> >>     };
> >> >>
> >> >> With this example using the new property, SCMI PM domain 15 becomes a
> >> >> child domain of MAIN_PD, and SCMI domain 19 becomes a child domain of
> >> >> WKUP_PD.
> >> >>
> >> >> To support this feature, add two new core functions
> >> >>
> >> >> - of_genpd_add_child_ids()
> >> >> - of_genpd_remove_child_ids()
> >> >>
> >> >> which can be called by pmdomain providers to add/remove child domains
> >> >> if they support the new property power-domains-child-ids.
> >> >>
> >> >> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
> >> >
> >> > Thanks for working on this! It certainly is a missing feature!
> >>
> >> You're welcome, thanks for the detailed review.
> >>
> >> >> ---
> >> >>  drivers/pmdomain/core.c   | 169 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >> >>  include/linux/pm_domain.h |  16 ++++++++++++++++
> >> >>  2 files changed, 185 insertions(+)
> >> >>
> >> >> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> >> >> index 61c2277c9ce3..acb45dd540b7 100644
> >> >> --- a/drivers/pmdomain/core.c
> >> >> +++ b/drivers/pmdomain/core.c
> >> >> @@ -2909,6 +2909,175 @@ static struct generic_pm_domain *genpd_get_from_provider(
> >> >>         return genpd;
> >> >>  }
> >> >>
> >> >> +/**
> >> >> + * of_genpd_add_child_ids() - Parse power-domains-child-ids property
> >> >> + * @np: Device node pointer associated with the PM domain provider.
> >> >> + * @data: Pointer to the onecell data associated with the PM domain provider.
> >> >> + *
> >> >> + * Parse the power-domains and power-domains-child-ids properties to establish
> >> >> + * parent-child relationships for PM domains. The power-domains property lists
> >> >> + * parent domains, and power-domains-child-ids lists which child domain IDs
> >> >> + * should be associated with each parent.
> >> >> + *
> >> >> + * Returns 0 on success, -ENOENT if properties don't exist, or negative error code.
> >> >
> >> > I think we should avoid returning specific error codes for specific
> >> > errors, simply because it usually becomes messy.
> >> >
> >> > If I understand correctly the intent here is to allow the caller to
> >> > check for -ENOENT and potentially avoid bailing out as it may not
> >> > really be an error, right?
> >>
> >> Right, -ENOENT is not an error of parsing, it's to indicate that there
> >> are no child-ids to be parsed.
> >>
> >> > Perhaps a better option is to return the number of children for whom
> >> > we successfully assigned parents. Hence 0 or a positive value allows
> >> > the caller to understand what happened. More importantly, a negative
> >> > error code then really becomes an error for the caller to consider.
> >>
> >> I explored this a bit, but it gets messy quick.  It means we have to
> >> track cases where only some of the children were added as well as when
> >> all children were added.   Personally, I think this should be an "all or
> >> nothing" thing.  If all the children cannot be parsed/added, then none
> >> of them should be added.
> >>
> >> This also allows the remove to not have to care about how many were
> >> added, and just remove them all, with the additional benefit of not
> >> having to track the state of how many children were successfully added.
> >>
> >
> > I fully agree, it should be all or nothing. Failing with one
> > child/parent should end up with an error code being returned.
> >
> > That said, it still seems to make perfect sense to return the number
> > of children for whom we assigned parents for, no?
>
> No, because what will the caller use that number for?  If we are
> assuming "all or nothing", what would we use it for (other than a debug print?)
>
> It also makes it a bit confusing what a zero return value means.  Does
> that mean success?  Or that zero children were added (which would be
> fail.)
>
> I prefer to keep it as is.

In that case, how should we treat the scenario where the device node
lacks a "power-domains-child-ids" property? In some cases it is
probably fine, while in others it may not be.

I guess the caller of of_genpd_add_child_ids(), would then need to
pre-parse for the "power-domains-child-ids" property before deciding
to call of_genpd_add_child_ids().

At least, we don't of_genpd_add_child_ids() to return an error code if
there is no "power-domains-child-ids" in the device node, as that
would just confuse the caller.

Kind regards
Uffe
