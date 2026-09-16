Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D4F37FF67
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565015; cv=none; b=JXJjYrNWfwbDl19p0EttaCqSqXLAWZNVI2lwKq2+2gC9Sxn4szX/3iuubTBsRZBtfEGps1hw1swXR3sRC62XE9aYUDobHhP0f6SBF3A1tKvZpEg4f0tZ41mHl15dqQCL8kxK2NxNeq1hq4HIonTeAnVdPG65kYKFVmAwYQDsrQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565015; c=relaxed/simple;
	bh=LzoyAvXtOW79D7k60hO8Y0fmEyA6rZBKfdqsZ74qXdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LDDGDiIQo646lYv8ZVubJ1MBlq2sqerrhutZWiyxq5/kvRcZQHC2ggsxFPrLbHozhVkgkDQt4gGR1PonCisCWEm+QL3tBkziAJBSYQ3E3fxbwF1WI1rojJdFfAVauCu5/9XmX6GeUQ/JBsIzD7zDSR5HZXcPVp/p6DQWANxbezQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e512ee9so336447e0c.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 06:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565010; x=1790169810;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VjFBIrCXQf4je5+QLhXlwhCeUMvFdhymcKdGZkZgOg4=;
        b=FwWryWS8qWwjwl6ez5LmFABYXykTUg6q8ahIahzIbJoZO8xpCeXtnJNhvt9mlqJRbR
         /KweRpzjvra5lZDPCM0Ggr15NS6Hkzm6AwbR3m0/IpdDuWg9vC7vbTmY/UKSEDVC3fhR
         hxhqkKgfw1QzB1odkFNYkyX8v4B5mpkl+ksps4GP22rFK+UmlnX/gUHQ34D94ORUepoh
         HULXvvqKyNNX4chI0aavL8LRhQyas8F7f0oyFFfZXjbwTQ804QAgFY+U8Tf3dWA4TaJM
         +J/t3JMrIpbz7LUzJCm1B5+x6QHfoPDnG81SIi0WXQgfBu6KSuY8TjKoVJYsh7fkQ0OJ
         r8Cg==
X-Forwarded-Encrypted: i=1; AKwUvByKi77BluU+qb1PUf4OcMof+eVZcYbRWRjYmxhPNA/sbW9plZm7hgT9cSzf0ZcDgQ/sAgOEa0I5+89G@vger.kernel.org
X-Gm-Message-State: AFuF++nuIsjAyJNHMSSHzM+xv99LDziDN3ud4x3FArkmvnVQztDCzIp0
	Vd5i/BwmV58sOjJeNJ2abZxL9EvhDYjeav9XTHKXKtO4iBrZ6PbAjnGQT2YygKxFQVU=
X-Gm-Gg: AYBFou3YE55MaKMpHCBjrmusMt4zx3FKLLzPYABUdfKa6SZd9jLXoHArhBINyvf9bz4
	fcKsYS+yDNAEiOn/6qQFJFB8kML5XJPu8fDCRvI8xYAcsn/Qnt0hVfqWGsDChnCBLQLrtC1VP4B
	jImz7nDtPiPNiFQFRoaJf+HOnw0yH3/fMY+WpjppTXdtJhgqFTWFAvej4cMRdEzQpyb/0GoKjQW
	PTVCNvQ0GJaz90T3iHYAuI396WZIAajcKVggcRSpU9Nzt0/9ugED9HZkV4HG441Gt8UJWKQ8LLa
	T+Zp0W7Z4SgnXzwnxPoT6HykAZwPEldZiZZ8rxRpqnzlfw9sKY/i/QyStYyRXZ4S9HOf6XcN1f6
	chJ+Vjpm/KdV+lDFvpsAas131hJ9yk+sMhWOUWNwlu5vr9tItHAc0CQuZPyH0onKpOZiaM5ATif
	eOVMpqTXAD7llzJddD41kNfHyuSK1GR+7PldFkz1ecJBYvdmP9a8fIefRzhz6inBJBsQDEw/0FM
	jKAcE8U72qB0bU+oIQ6xety7ogBVm7YjjPO
X-Received: by 2002:a05:6122:1b0f:b0:5bf:b3a0:388c with SMTP id 71dfb90a1353d-5c99ac2ec94mr2668992e0c.6.1789565010064;
        Wed, 16 Sep 2026 06:23:30 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c998ab9cfbsm2623345e0c.14.2026.09.16.06.23.29
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 06:23:29 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e512ee6so321132e0c.1
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 06:23:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwSMIOmdXoVDVN6AfrSRhWykItlROSS3LsMO9dxXpnCJAq8YA1FDXpcjUJZR5Zz8Z9a4sRn/jVASGO0@vger.kernel.org
X-Received: by 2002:a05:6122:8c5:b0:5c7:a3a3:a4bd with SMTP id
 71dfb90a1353d-5c99abf1d57mr2593491e0c.4.1789565009279; Wed, 16 Sep 2026
 06:23:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916102520.24288-1-wsa+renesas@sang-engineering.com> <20260916102520.24288-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260916102520.24288-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Sep 2026 15:23:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW1Yad-jV9z47ivY02WAYtOcgnCWVfjynv=zNy+Xcw36A@mail.gmail.com>
X-Gm-Features: AcwNN1XUKmQ2TuuLF52Q7gsi4LkQkjc8o93Y7AoWlIWPEwf6hN5sIOrfKevHtU4
Message-ID: <CAMuHMdW1Yad-jV9z47ivY02WAYtOcgnCWVfjynv=zNy+Xcw36A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: rtc: rzn1: drop unneeded 'start-year'
 from example
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.csengg@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Sept 2026 at 12:25, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We don't use 'start-year' in upstream DTs because the driver does the
> right thing by default, ranging from 2000 to 2099. So, drop it from the
> example, too.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
