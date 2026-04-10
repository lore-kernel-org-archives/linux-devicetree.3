Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61CD3DEFEA
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 22:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775859935; cv=none; b=p/6mB1Cq1oZNLK8Fxcld2hG9OBr3Jntjc0ECGgP+KBB0afZolsZh2VqPCRX7d1KwlDu7UB7SG1DGtQLKcaXaDHqJF8EhjgAMz4/Uysr2BW4QuD6dNvKa5Ps//XCqpSAarMkZUphHNKey199TF4DETbVK2ZeuE7tS8YW5VfrGGmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775859935; c=relaxed/simple;
	bh=VyA6DGW+xjcM8w3yvxfoOhS0/P19nFSdUahGjkQPHuM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Um7utW5MqNdwFWsFx36nFcUsotPVSiWYE3pcRZ4Ps3SaZjept0mDhGl+1ix9yb9/DfA4aD5kDUjshktiLSWnV1d81HdnB60tc+zGX0eNLT4IhIAdMjVT+QtexfJQQtF+u4V6qUf0/jlTm7xcJ8ie1Xxd7SrcBPi1CMYQozPmKZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=tZZhSJ/4; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="tZZhSJ/4"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35d9c7bf9a1so2405263a91.3
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 15:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775859933; x=1776464733; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oO2Iz58ZlsFu3Y4x3hOSK/rbD3OpjMOM0bJqqqYROA0=;
        b=tZZhSJ/4R+5CHY/dqaR4l61LKPlkhiburEkOpWmYMbSbcG5G5DR7bmKuNGByjHhMH/
         HzzhjqhHEi4UDQCncvZT4McmyY8emB7Qn6NLjsAydOXljf8NNXy81l0QTVrys9ZkdIg4
         cALelPen9QiqeDPBciHIwry2XjM2yu7+u+HptSyxz+FG0NFvFYbvQdZPPbzuGwqzuL8k
         GLJ8C33l49DMucA7PINJSdNso+w8JFitA4aHwkmGoqqCWmBWQuziakltLfdPD45yXDVL
         rOn4H3xSmORXu2j0vKpRYs1BKFL2hulDWy312xmoApa+QlYS9eRJ85ZCGF1IZ1gxjosh
         Earw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775859933; x=1776464733;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oO2Iz58ZlsFu3Y4x3hOSK/rbD3OpjMOM0bJqqqYROA0=;
        b=K+Tc5tOBMoEwyP/bYYr1puDF9+Py3pmpAkePtfgOF8Prv+RAzSEhXAcv+6dMokivkS
         mnVtcaxQJ8orExgoKbmQCJNBTsOKweDBP2hmZFOWGA7Gybeh3Qc2Bym3wxIZbCqVavyz
         JFFpzUFbZp3bWYI+NXyreFH6OkFSgSUQlso3Ss3i4eOrixwsTTv5DFhlJfO5Q6pXxZUZ
         cJxcQpRWgKJ6ZuqKc0xexFyKS33r/KI7MMpDRxJLklMuGKLViEr7iG6pA32oWnW0Ulz7
         ruhXPEGQVAqU4ucFazJZ6p/mEhChkQbMXJ073V7NY5lijwtJMNEfGw/eOnDkeqG6HTyh
         Om9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQ+zW07PF4EAPEttYzy4y0CoJVeqRRaJzwJR2myFrbSimwMEKdc00o71n/oXroEGrBIXjzcDbqXqsg@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfhjh7kVomawQu+/EVXNMNVMoWwcjUPNgHavE+jamVDg49OYvL
	oKplt7lPQpm0L4p0ffWOUI+xKIDb+K+bjhmrGKqjUb8PvlUmoNSi6pFKfObO43pvqAo=
X-Gm-Gg: AeBDietXxcnVAwV5fAHb4uY1cyWZ9D/MwRSMYVe0dbER28yz5z2CPOwKvVbBP75eE/b
	4pii0H9j1vtm7tpkRXbavUiWW8+n4za7+0koBzcMzA0osdNWzOg8mebD6gp87PebvvCT5N0FDZt
	r9Okco8VQwEQMMXP3mMFEna+1b96NxS1c+pPItzj540HyeP6eIeoqC1Hyju9tYDkszV/WDYig+6
	lnpHvxSqHlzyqClPlNerxIY9gmaHpprDnfWu0F1SYesWYkpx0t5k3SA4XP+5dSfk6RXou9MgfUz
	C52sRtCR0kjX/v2aFjdohGQhTLzYCm+wIKwe0GUS+yf08WFdwdrKikiX/X3fFk8U7MUi+t1l8q9
	roJjzuYf0S6zAF7nuTM13Dm7ce+PMX/dBlw63blgPHosdtnN/YBnderUt0fYaMUtJBzN2ITqwA1
	s1D/UEKda4wKX4t0dt6ak=
X-Received: by 2002:a17:90b:35cd:b0:359:1130:1047 with SMTP id 98e67ed59e1d1-35e428524cbmr5346124a91.17.1775859933169;
        Fri, 10 Apr 2026 15:25:33 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e41336a20sm6073059a91.14.2026.04.10.15.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 15:25:32 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] pmdomain: core: add support for
 power-domains-child-ids
In-Reply-To: <CAPDyKFrR2zyMFXTAkKs1XRgB-u5jSP256g730s=7SLuOZKsKVg@mail.gmail.com>
References: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
 <20260310-topic-lpm-pmdomain-child-ids-v1-2-5361687a18ff@baylibre.com>
 <CAPDyKFquJ7K4NcWuKMr1sjrnFVVPGAeLCiSF_FhvJf9Frbn1uA@mail.gmail.com>
 <7h4iljskvz.fsf@baylibre.com>
 <CAPDyKFrR2zyMFXTAkKs1XRgB-u5jSP256g730s=7SLuOZKsKVg@mail.gmail.com>
Date: Fri, 10 Apr 2026 15:25:32 -0700
Message-ID: <7hqzomqwpv.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ulf Hansson <ulf.hansson@linaro.org> writes:

> On Fri, 10 Apr 2026 at 02:45, Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Ulf Hansson <ulf.hansson@linaro.org> writes:
>>
>> > On Wed, 11 Mar 2026 at 01:19, Kevin Hilman (TI) <khilman@baylibre.com> wrote:
>> >>
>> >> Currently, PM domains can only support hierarchy for simple
>> >> providers (e.g. ones with #power-domain-cells = 0).
>> >>
>> >> Add support for oncell providers as well by adding a new property
>> >> `power-domains-child-ids` to describe the parent/child relationship.
>> >>
>> >> For example, an SCMI PM domain provider has multiple domains, each of
>> >> which might be a child of diffeent parent domains. In this example,
>> >> the parent domains are MAIN_PD and WKUP_PD:
>> >>
>> >>     scmi_pds: protocol@11 {
>> >>         reg = <0x11>;
>> >>         #power-domain-cells = <1>;
>> >>         power-domains = <&MAIN_PD>, <&WKUP_PD>;
>> >>         power-domains-child-ids = <15>, <19>;
>> >>     };
>> >>
>> >> With this example using the new property, SCMI PM domain 15 becomes a
>> >> child domain of MAIN_PD, and SCMI domain 19 becomes a child domain of
>> >> WKUP_PD.
>> >>
>> >> To support this feature, add two new core functions
>> >>
>> >> - of_genpd_add_child_ids()
>> >> - of_genpd_remove_child_ids()
>> >>
>> >> which can be called by pmdomain providers to add/remove child domains
>> >> if they support the new property power-domains-child-ids.
>> >>
>> >> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
>> >
>> > Thanks for working on this! It certainly is a missing feature!
>>
>> You're welcome, thanks for the detailed review.
>>
>> >> ---
>> >>  drivers/pmdomain/core.c   | 169 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>> >>  include/linux/pm_domain.h |  16 ++++++++++++++++
>> >>  2 files changed, 185 insertions(+)
>> >>
>> >> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
>> >> index 61c2277c9ce3..acb45dd540b7 100644
>> >> --- a/drivers/pmdomain/core.c
>> >> +++ b/drivers/pmdomain/core.c
>> >> @@ -2909,6 +2909,175 @@ static struct generic_pm_domain *genpd_get_from_provider(
>> >>         return genpd;
>> >>  }
>> >>
>> >> +/**
>> >> + * of_genpd_add_child_ids() - Parse power-domains-child-ids property
>> >> + * @np: Device node pointer associated with the PM domain provider.
>> >> + * @data: Pointer to the onecell data associated with the PM domain provider.
>> >> + *
>> >> + * Parse the power-domains and power-domains-child-ids properties to establish
>> >> + * parent-child relationships for PM domains. The power-domains property lists
>> >> + * parent domains, and power-domains-child-ids lists which child domain IDs
>> >> + * should be associated with each parent.
>> >> + *
>> >> + * Returns 0 on success, -ENOENT if properties don't exist, or negative error code.
>> >
>> > I think we should avoid returning specific error codes for specific
>> > errors, simply because it usually becomes messy.
>> >
>> > If I understand correctly the intent here is to allow the caller to
>> > check for -ENOENT and potentially avoid bailing out as it may not
>> > really be an error, right?
>>
>> Right, -ENOENT is not an error of parsing, it's to indicate that there
>> are no child-ids to be parsed.
>>
>> > Perhaps a better option is to return the number of children for whom
>> > we successfully assigned parents. Hence 0 or a positive value allows
>> > the caller to understand what happened. More importantly, a negative
>> > error code then really becomes an error for the caller to consider.
>>
>> I explored this a bit, but it gets messy quick.  It means we have to
>> track cases where only some of the children were added as well as when
>> all children were added.   Personally, I think this should be an "all or
>> nothing" thing.  If all the children cannot be parsed/added, then none
>> of them should be added.
>>
>> This also allows the remove to not have to care about how many were
>> added, and just remove them all, with the additional benefit of not
>> having to track the state of how many children were successfully added.
>>
>
> I fully agree, it should be all or nothing. Failing with one
> child/parent should end up with an error code being returned.
>
> That said, it still seems to make perfect sense to return the number
> of children for whom we assigned parents for, no?

No, because what will the caller use that number for?  If we are
assuming "all or nothing", what would we use it for (other than a debug print?)

It also makes it a bit confusing what a zero return value means.  Does
that mean success?  Or that zero children were added (which would be
fail.)

I prefer to keep it as is.

Kevin
