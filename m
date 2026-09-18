Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8524A3F39
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 07:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789717417; cv=none; b=lPfYvPNI+TxNGJzNq+qAwwPNqg52nyc1eQst7mSg0XP4LBMvmWChsWzqgEjiRjxS9iw5sS6Or4QDHGOfkmJ05u9SlbZHW9wacjUfsfZYkweY0YO8hW7E7ItV2UN8JIzNu4kLeXvmvHVAdKes4cwzlQeWVaonZ8yDjtkgdV/Yac8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789717417; c=relaxed/simple;
	bh=cHVPOWKKfhZVIB7cWuXyuW2OrGOIzBYJeXQE3IvAcLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pC+1w+0YFaHkRYtJcqiMzZpmNW0NkZbmtHAJ0V69V3AbxSlF0T+oZTH+xsNwTEzGk/ylGxibtp1Bt1ZkwFg0lRaJNabWKSVhFjXyzrlTYi6uHduSmpkyn7A5UQ8Tt+FyF7ReMxrxqYO13iooot6crONxJnvScEbnXU6wgdYZVb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c112aaaf04so309753b6e.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 00:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789717403; x=1790322203;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0WtucTJYH5u+SsiRL/3DRg9hQeKGo+JDwDdtR43iO30=;
        b=zBMppK0B6w9kiwWppSVN87IfZJSVjHEfDqUeU+M1t6dmIPE89YNgzyn9Y1KAs8q8jE
         +1rz7w0y/T9CXgcWP0QYQZBtD14mY+0IYuLILBJZmxX4LFebSL4+VrZLWY6uGYbTjrsb
         nRskjgR2C7ELBpDXsQ43m1jciq+vZfx0NFzOjsj2Bi/p/GWuc/ZzLBXUZZNehqyRCBYs
         iQJ82pWwQAvLghP4CZAZtAQbde9Qy9b7cxMmmRerDedlRmx4By2zhqIdpBgArzweyDrW
         2sPewGZTI7KJxd0TyKDkheKdPg6YA4sed8lC6YBaQHRsz1xT6qPascuSypTUqjFrg2f5
         bv4Q==
X-Forwarded-Encrypted: i=1; AKwUvBx0px0GGXavA4aSS0wYvizkoIe1Hy1jGTtDVSanZEhO6CKYLqOGy5uT4JmlpkUazq1OLTs0Eh81FaKv@vger.kernel.org
X-Gm-Message-State: AFuF++lqe13oqMrqvoYaJbFYii4sJT7Kavr0PuN0TdfHseZMzgAcJ/9M
	mylJfUREYfsKnzuAMPB/IX64Xn56C6+gPT03kGzDpaCBASuAfWNPaDU0UDgzCLEo
X-Gm-Gg: AYBFou0u7crONgwVXD6i/DTr/jMTvetdtnOSDawA7HbWU1zZWbM+Y6u75xACr3m435R
	1i13jEiBrECJ0CC7VgI5PGEyClG6lUm911qD+pHbdLbJgOZS6ROc3uUSytEjzF1YX0JXBdWEzon
	EOE4EDuQZ2zIoWsfiyOoxPE4mrvLHUKhwzrKUcm/Vppj90Y/hidLWQDAU/1lsZLfiKmRXmEz9IC
	E368lxxaLq5JEHiWoebkGTUtnZAUCcIPwi3ovGC1WgtHNSdV6WSKzc+Pw995sXVRoWJbHqRZMFG
	uLoAmKOU93Cr+ajSsDjjfr2JF9Fvl+C+boRfC2eB4gqj6dfAUt/88FbLylJrzweCwnndYe4eOYk
	PkoTgN4es1pbB6TKiOGlMcALAdszsdW1SOSCxlVSd3hvkKxIzDvIFt/kBQtp20MQXc3X1NY8IEp
	leHbFsKNJpHx5rRF+GtBht4Mc98vIHE6Xjue2Hd1aTxPhlwX5qxbAc93ZrwaAqX9kwzWB0P2CFv
	LjzhquK0XIrRN6ZV080ImWMIQGmM4vdLbbT
X-Received: by 2002:a05:6808:87d3:b0:4c3:9892:96fe with SMTP id 5614622812f47-4ccf6746239mr2250395b6e.3.1789717403208;
        Fri, 18 Sep 2026 00:43:23 -0700 (PDT)
Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com. [74.125.231.76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80e3fd45252sm847562a34.0.2026.09.18.00.43.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 00:43:22 -0700 (PDT)
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccde2ad9so423432fac.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 00:43:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwR3Sh/TTcmwHDAzRuvTqTbZ88bCRpHV07wCp5f4Lcy1Cl1EpTRfH2GQVKHRGDYnRRdfnWapnsa2RT3@vger.kernel.org
X-Received: by 2002:a05:6102:91c:b0:7a3:2e52:1163 with SMTP id
 ada2fe7eead31-7a55da9b0damr516237137.26.1789716931735; Fri, 18 Sep 2026
 00:35:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-epaul-v7-3-rc1-x5h-vsp-fcp-v1-0-4c72d4e086dd@ideasonboard.com>
 <20260917-epaul-v7-3-rc1-x5h-vsp-fcp-v1-2-4c72d4e086dd@ideasonboard.com> <20260918011156.GB145152@killaraus.ideasonboard.com>
In-Reply-To: <20260918011156.GB145152@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Sep 2026 09:35:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWwCLiQASDhr3yY6XFY1704W3tAWEPgYw77evrK9ECRg@mail.gmail.com>
X-Gm-Features: AcwNN1Uhv0ZzlOO0pTf4pD3p_OGSBmogWfpHa_8PkhuJrVnrMv3c15ALo4pMZkM
Message-ID: <CAMuHMdUWwCLiQASDhr3yY6XFY1704W3tAWEPgYw77evrK9ECRg@mail.gmail.com>
Subject: Re: [PATCH 02/10] clk: renesas: r8a78000: Add clock for FCPV and VSP
 for SCP FW SDKv4.36
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paul Elder <paul.elder+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Fri, 18 Sept 2026 at 03:12, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Sep 17, 2026 at 09:04:41PM +0900, Paul Elder wrote:
> > Add clocks for the FCPV{B,I,D} and VSP{B,I}. They each have one clock
> > from an option of two: a 1066MHz and a quarter-divided 266MHz. As we
> > already have support for the 266MHz one, add just those for now.
> >
> > Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> > ---
> >  drivers/clk/renesas/r8a78000-cpg.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/clk/renesas/r8a78000-cpg.c b/drivers/clk/renesas/r8a78000-cpg.c
> > index b820d09e1a195068debe8a6eea7a01c534a97b23..17792ff6ab8ae2f7eb5c8f7e3d581b43177e195d 100644
> > --- a/drivers/clk/renesas/r8a78000-cpg.c
> > +++ b/drivers/clk/renesas/r8a78000-cpg.c
> > @@ -326,6 +326,8 @@ static const struct clk_map_in r8a78000_cpg_fw_4_31_0[] = {
> >       { R8A78000_CPG_SGASYNCD16_PERW_BUS,     FIXED_CLK(66M) },
> >       { R8A78000_CPG_S0D4_PERE_MAIN,          FIXED_CLK(200M) },
> >       { R8A78000_CPG_MSOCK_PERW_BUS,          1667 },
> > +     { R8A78000_CPG_SGD4_VIO_DP_TX,          FIXED_CLK(266M)},
> > +     { R8A78000_CPG_SGD4_VIO_DP_OTHER,       FIXED_CLK(266M)},
>
> Same comment as for 01/10. I think the two patches can be squashed
> together actually (unless Geert disagrees).

DT binding definitions are shared by driver and DT sources.
Please keep them separate, so I can apply them to the shared
renesas-r8a78000-dt-binding-defs branch.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
