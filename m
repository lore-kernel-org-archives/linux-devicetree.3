Received: from mail-qv1-f100.google.com (mail-qv1-f100.google.com [209.85.219.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F1926ED59
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 21:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780004994; cv=none; b=ITbUjIOefvbh7zdzIJio1jWjZotVZeUfRo26wgKyU7tQgVBra3X/UVeFS4stwsDPl4fnkZgwS0WbgxXFeNMs/y26uu90Qbemw/xYBe0t6bwXHjKWUG9MHdxbZzCEardP9yX+qKGQC6tpTuiFuNmBMQy49LQ0uYuOJ1wqKzBG8PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780004994; c=relaxed/simple;
	bh=borzcxvYurQfrzlM51CMclrGrhZgnWmR8GVqv47NfVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V0CvZUR0QhLJL/52Ic/XqoMnJQb5t1C1Uhn3ij2ip+5St8EciV3lE7JaYcFsqH4n7fMOBjM5A6aZz6TiBfgazES0OGjbsy4mvnkx/s2PLURZfNtfx1mibWV7IicmnfLJD3pv7TtONy7ebJfHSquSXKF2Sj5ceP72I2aTOfrE32c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=T6Fm9kgW; arc=none smtp.client-ip=209.85.219.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="T6Fm9kgW"
Received: by mail-qv1-f100.google.com with SMTP id 6a1803df08f44-8cce22e029cso3484166d6.0
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 14:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780004992; x=1780609792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhK/MEz8Ecu1hdCgykapg7g4X65fg6YlqCenM+/UkDQ=;
        b=Ft7Srtc9+qsfafgLqp4cFZ17BZZ3gVrvf1CW2ozUTqT0/pcjtLHjZSZrxKxdaucP46
         VHAz+MX1PtnaibRV22t4x91l1RP/BMzZy734FWaYfbHCtcSL3JEtumRxRPc7Dh9CNZYs
         d5a3sNzYSO/xdH6QwreZ2ngz72bAQsz0Olg/FxqDSEvFv35TELSj+x18ENT3bdbwtfEz
         fvXyd0yCdVAdYX3lg3W6+dKOlvQaxeyZ1H3KPqr4eciF7cFUEHpHWJ/g//Jw06FLGnJK
         OlBcgKVpLy9tvKbHT2fl+rM0F6hm/jfuwAd77RfJzguALOS83mJf9XbZWgYOb49XcnFN
         Jfsg==
X-Forwarded-Encrypted: i=1; AFNElJ+jUDjCsBzZt5mVMMFaf9gB1iiAZDzsVIqQFNY31It3q0+TI+9kBHcv1Xn5+lC5HwWLRTsiPu6s4pDF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz9FAHBTL2MTPfeHyxhDZ4mP+ARtkI69U5hFy7eGIX3Zrqw1uK
	S2XIW+IlPxR7G/y/G2cR8RtWOONFPD5wp/9wLaDbFdqzpQOiOyDU7drkP+7Y5kUX4IwynImlHSl
	zz4aPxJzOUjcOUgyOq0f63qRUdcyT8iETO7p/TxNxnxj46snoT9l0J6MjER9YtGNPEZJ9UFsQvf
	4z7GUY2dZaDk2NjH9nQhQbU+YNXXvDtNB2RxpdPC8wBTpDLCXB6al+VrmTmAS4DQAGJSy1NMCQ/
	0zDSc8iW4k/TsdbP0s=
X-Gm-Gg: Acq92OH4jKdaAB41ywvbUJ030+TzlogRCXWV8b6orS72M+iG5yEe5bkoUhQaRwhIuK7
	yQtYo0aHi3ckhQX1CzpM2O/NRWRr0bBm00q9zyaxgmzGOWTMnhBtPB6pkleaoDgWNA3vycClnGP
	ZamIViypCy/ldXLYz3FQlNHs6vQAi+vAa+2TokyZHo1rKdghRrhFldprA7HySAjWEqGRmR4yot6
	Jy7t5LtWKKTPzd+YHSki/QO4Vyo+VhFJHkcO5EMPxEj/uvbTNynHh4BJf5+0nR+XURuAOO8KpnI
	ki2bu8+sBa8a9alp1lvYdhdix8xv/neJo3rmqnGBO+8Er9tnvhCxetWm8v2/DCoHZbwzv57foRe
	7FdyzG4LSve6+erUUxNvGRtKTWMbRLaxOGDxfIiDEicNT1/rhN2nDHqo+h0mTsIsqwWrLzpS3Zd
	zijtx/Ami8D9OjCluOeagfAuwzt48+2MlC94rtPYtRfC0FemO4hSAzuDvDQmx0njPvjL6Yfw==
X-Received: by 2002:ad4:5d47:0:b0:8ba:be50:f19f with SMTP id 6a1803df08f44-8cce4ac757cmr4432246d6.6.1780004991736;
        Thu, 28 May 2026 14:49:51 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-8cc8130ff46sm12978226d6.21.2026.05.28.14.49.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 May 2026 14:49:51 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-bcb9366d7d1so130515766b.1
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 14:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1780004990; x=1780609790; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yhK/MEz8Ecu1hdCgykapg7g4X65fg6YlqCenM+/UkDQ=;
        b=T6Fm9kgWZ4c5MFwVteVToY2rLivAWueoGixPWYQXqe4t+xBkDVirmzijbrNJNJVL5s
         IPqrQw1ibPl4qnJQ3BtZ+OBlTpeFIiPY6YI/WBSaUO1iLaOxHw0geJU7zTJA8pd8CNzP
         SXuTZ2uVj8Z98G/KIDS8vyH1DbEKJRBHf6cMM=
X-Forwarded-Encrypted: i=1; AFNElJ+i9IgMXLa4CfsGuHzk2kCKdn361UYLjCVm7VCW/DP7Bvgc2L2FL68vaN8/OR/fV0lBWwkEQAqJVre2@vger.kernel.org
X-Received: by 2002:a17:907:c807:b0:ba7:41d0:5efd with SMTP id a640c23a62f3a-be9a7fab0damr13866066b.28.1780004990264;
        Thu, 28 May 2026 14:49:50 -0700 (PDT)
X-Received: by 2002:a17:907:c807:b0:ba7:41d0:5efd with SMTP id
 a640c23a62f3a-be9a7fab0damr13864566b.28.1780004989776; Thu, 28 May 2026
 14:49:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231205184741.3092376-1-mmayer@broadcom.com> <20231205184741.3092376-4-mmayer@broadcom.com>
 <e63906cf-9f76-4fed-91b0-1a9168b179bd@linaro.org> <12f3c515-71cf-46a5-ad92-15bf6c4c2f2c@broadcom.com>
 <c483e962-a565-45b0-91e2-41f47e2cf4bb@linaro.org> <CAGt4E5smwohGsPkvFOY8o270mNQnTkSWz8UKh3un2=XtEibzAg@mail.gmail.com>
 <CAGt4E5tGHJFXswic6vTx-ThN2K9xBtO8oA4ybrXg+q5cA6GYCA@mail.gmail.com>
In-Reply-To: <CAGt4E5tGHJFXswic6vTx-ThN2K9xBtO8oA4ybrXg+q5cA6GYCA@mail.gmail.com>
From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 28 May 2026 14:49:37 -0700
X-Gm-Features: AVHnY4L9UkUBZVKtZIeHcLsjwHBic26vGpnAXVLZgeTiH45cXBZqkqDCVGgyvmo
Message-ID: <CAGt4E5v+=9UpHFV0fv-gNXqF+N38C6+gpAkengNR-NULS+sbCQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] memory: brcmstb_dpfe: support DPFE API v4
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Rob Herring <robh+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>, 
	Device Tree Mailing List <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Thu, 28 May 2026 at 14:45, Markus Mayer <mmayer@broadcom.com> wrote:
>
> On Wed, 6 Dec 2023 at 10:48, Markus Mayer <mmayer@broadcom.com> wrote:
> >
> > On Wed, 6 Dec 2023 at 09:32, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> > >
> > > On 06/12/2023 17:18, Florian Fainelli wrote:
> > > >
> > > >
> > > > On 12/6/2023 3:10 AM, Krzysztof Kozlowski wrote:
> > > >> On 05/12/2023 19:47, Markus Mayer wrote:
> > > >>> Add support for version 4 of the DPFE API. This new version is largely
> > > >>> identical to version 3. The main difference is that all commands now
> > > >>> take the MHS version number as the first argument. Any other arguments
> > > >>> have been pushed down by one (i.e. what used to be arg0 in v3 is arg1 in
> > > >>> v4).
> > > >>>
> > > >>> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> > > >>
> > > >> ...
> > > >>
> > > >>> +
> > > >>>   static const char *get_error_text(unsigned int i)
> > > >>>   {
> > > >>>     static const char * const error_text[] = {
> > > >>> @@ -929,8 +954,12 @@ static const struct of_device_id brcmstb_dpfe_of_match[] = {
> > > >>>     { .compatible = "brcm,dpfe-cpu-v1", .data = &dpfe_api_old_v2 },
> > > >>>     { .compatible = "brcm,dpfe-cpu-v2", .data = &dpfe_api_new_v2 },
> > > >>>     { .compatible = "brcm,dpfe-cpu-v3", .data = &dpfe_api_v3 },
> > > >>> +   { .compatible = "brcm,dpfe-cpu-v4", .data = &dpfe_api_v4 },
> > > >>>
> > > >>
> > > >> No, use SoC specific compatible.
> > > >
> > > > This is not that simple because for a given SoC, the API implemented by
> > > > the firmware can change, in fact it has changed over the lifetime of a
> > > > given SoC as firmware updates get rolled out. Arguably the dialect
> > > > spoken by the firmware should not have changed and we told the firmware
> > > > team about that but it basically went nowhere and here we are.
> > > >
> > > > The Device Tree gets populated by the boot loader which figures out
> > > > which API is spoken and places one of those compatible strings
> > > > accordingly for the kernel to avoid having to do any sort of run-time
> > > > detection which is slow and completely unnecessary when we can simply
> > > > tell it ahead of time what to use.
> > >
> > > Thanks for providing justification, quite reasonable. A pity that none
> > > of the commit msgs answered this way.
> >
> > The real pity is how this API was designed, making all of this
> > necessary in the first place.
> >
> > We can definitely spell out more clearly in the commit messages what
> > is going on and why all of this is needed. I'll pull all the pieces
> > together from the various responses. As long as there's a way we can
> > reasonably implement what we need, we'll be happy.

Updated the e-mail address for Krzysztof. Here's the original mail
from a few minutes ago.

> It has been a minute, but we'd like to resume this effort[1] to
> upstream these changes or some variation thereof.
>
> What are the best steps to resume this undertaking? There are still a
> few topics where I am not entirely clear on how to better explain
> things or how to address the feedback provided. My apologies for that.
> I will do my best to address whatever concerns there are.
>
> Should I put together a new pull request that contains improved commit
> messages and addresses some of the feedback and we hash out whatever
> questions remain on the new thread? Or would it be better for me to
> reply to the old thread with some of the questions that remain before
> sending a revised series?
>
> Thanks,
> -Markus
>
> [1] https://lore.kernel.org/all/20231205184741.3092376-1-mmayer@broadcom.com/
