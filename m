Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA213128BE
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 09:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145720; cv=none; b=U33i7gJqcB1qWAtNq7WWeVqqp89YAjojo+5z0aIYBp6+Ln4Vz7Z6qVoBHpgG1tB9QUz/v8lGsg8DUTSKgpitxCAaQcQQz7WpkoDL3dKIWYCsb4Sc+gd+LCXk3rx8FDlwNSg7WBXFEDQoRoWjuPa8GQB4tWvLU08wS7bX/fLiEiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145720; c=relaxed/simple;
	bh=IwrNVFKzSRTdZ5JveLi918fTr6rocBDAoIvz3oaLMZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q7rfHU8FWLFjaI/bTGKerlhFZTZ7qQ9BdT4Kp7MopPFMbCiAG9ucz1t/VGa538BsN+/5KAXtyoYRLkq4qwka7e3DVoAk93ECQRr7hLKoBMBy5Rld+cqxzgBKpdzez/xjXc4UOyN4osJLJ+c6Z7r4WpUtQP5NNvxIXZWBnYgEJ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso389084241.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 02:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778145715; x=1778750515;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YlQwLkoJNNdnPrw8knAwIybrcJ+s/HKf8ofWJf6H5hI=;
        b=RuktNbmg5O21GJXkPnAIvWfSb+rfQ/FLBoFGAsQ5XtHMY6GyzRwZmONNuqvbA47szS
         yso41tvVT0pBxMcIgDeGNHrOoiHEud2e9OuuuZw8CCkCIZl2TeoRCnYbpCgTALu8lQuB
         1sQkooID13EfrNFyWCIT2y2s+jAGu6vZK9TcWWV9RBsjLprnFfofpKPrg08bJloIsvP7
         +2sXJVrXPaZ/h/8TKHqptuHfpidi7142tjnrZ7tidSz8H2Eax//3GQ8tAj0L1wdmfRJf
         sZ1/sTVBKd8Z/ldZV9OXlAXyuZBEEuBE/CyLoPZRA5sfGVKNkhB7zGCbKjIEDKg0pJ0O
         8uZg==
X-Forwarded-Encrypted: i=1; AFNElJ9YyPasYIr4NQ5a9tYBp1sp1jPKt9sYUUEsj2O4UELGUXM+g05c5q0jq9XHVnxIna45NWa7F005+lIn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3RnvvuBw/uIRvwRUeLipQ/1ErI0j9ok1FVNF81/oF4mBwRhwJ
	AJbqio9Vzf4KExjTH0PHZOsZFNDxVaPzq/3IoGFiX7fParl+rQXHH+o+aNIUyPl8nyI=
X-Gm-Gg: AeBDies60BrpI6C0CqKYi75Wwb8sP6MvnycJCJ4oX5/Ey/TRBDA15akVC8ggHAxoCVE
	/gcIEXi7GHZuT95Widlb9kqXpXmpPcBVjn81V4zbcEOf9WKZi3dMuEQq3upIWn8ujlKuLBkoQ5Z
	sktJzfHRHulYer8T9VSlEnm/lzJtIrQzNUKvQsW95zpp8QxvH9TgE73pJu+KAztph4JM/d5u+Ch
	cle4wLBaUjzw6jEMYgap06i7RVvKpgKi2r3rU6s4SkYVVpcz6Hl+y9hOQeuwlFZQMmpPgbZxMHB
	or4AuxClKMd8y4cIIBJypg/V29Vc9SIDmGtizE5cUyZw8VOxMsnFLDVMWfTrvUlhBg/yrbqRy7P
	oT1JsH6xLPucyscmYvjDNhT6VDyJwMA2lKvDez4xqqaJI67FNOUsO96WMasbNK/+IymPREnwW6m
	izrcy3VjFxdyHkd69MRPXDUJZFoL4zngiHstTkqtpuqkQEgCLDlBQi17M0HB2W97LXyeKEYIozq
	0A=
X-Received: by 2002:a05:6102:38d0:b0:62f:357a:3295 with SMTP id ada2fe7eead31-630f8e78856mr3569613137.5.1778145714775;
        Thu, 07 May 2026 02:21:54 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0af57f6sm10760892241.8.2026.05.07.02.21.52
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:21:53 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-57512a429d1so457070e0c.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 02:21:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8sZcA+qr/Mww3Y7uBylhCCSOJK8Zwg34+nYrHe4jDgolF8lW7+phvSerBm7lp1lXnjitUdtrrfy32J@vger.kernel.org
X-Received: by 2002:a05:6122:2a48:b0:56e:f1d2:c3ca with SMTP id
 71dfb90a1353d-5755937cdfamr4080066e0c.2.1778145712572; Thu, 07 May 2026
 02:21:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1772468323.git.geert+renesas@glider.be> <10876b30a8bdb7d1cfcc2f23fb859f2ffea335fe.1772468323.git.geert+renesas@glider.be>
 <20260313215912.GA3415767-robh@kernel.org> <CAMuHMdXFd5Sva4Hu7KufgMfiiF02Z1z+UgLyJH=KYPvch4673Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXFd5Sva4Hu7KufgMfiiF02Z1z+UgLyJH=KYPvch4673Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 11:21:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWzBzFEfgQePb6xrEHnAYWFKR7L8OvBJfaAg_VxN+mB6w@mail.gmail.com>
X-Gm-Features: AVHnY4K1hvlIze4Kwir9AQf6-zlk9HJ7JWrXBp9drztoS3rJo0JwuvmBgBmS4rQ
Message-ID: <CAMuHMdWzBzFEfgQePb6xrEHnAYWFKR7L8OvBJfaAg_VxN+mB6w@mail.gmail.com>
Subject: Re: [PATCH 7/7] soc: renesas: Convert to of_machine_get_match()
To: Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Saravana Kannan <saravanak@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Ilia Lin <ilia.lin@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Mar 2026 at 17:35, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, 13 Mar 2026 at 22:59, Rob Herring <robh@kernel.org> wrote:
> > On Mon, Mar 02, 2026 at 05:29:11PM +0100, Geert Uytterhoeven wrote:
> > > Use the of_machine_get_match() helper to avoid accessing of_root
> > > directly, which is planned to become private.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > This is an alternative solution to "[PATCH v2 8/9] soc: renesas: don't
> > > access of_root directly"
> > > https://lore.kernel.org/20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com
> >
> > Greg applied this, so you'll have to respin on top of that. Next cycle I
> > guess. Unless you get him to revert it.
>
> That was my impression, too, but apparently he skipped that patch.
> So you can still apply this patch, too.

Seems like it fell through the cracks... Will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
