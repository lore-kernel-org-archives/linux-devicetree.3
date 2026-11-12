Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493284;
	b=eKICEw82/8xK/eYJUC+dZ0cy/x4Tww5lS4tTHuuvKzId9otNpcAZ/2axkJGQ1AHRqGV1
	 Dzn225AAnh3Im0aU8pOyWlX3TvvPz5gUUZWGANi2D5l8jf26UQoHQd+GmhURc0uGhhtIu
	 L+fyT+oDrNBKMWs3r3LEFWapViEXw2nBJlyZT43E+/F2hFKAJolSPvU0O76j/TPrEeHEW
	 PdAbRZKQfi8IFU3MUqLN+jYev10dKGaGCssbQuWsGO2wBi44pqHHdm9HvTWEOvntD6RfS
	 p9vhWkpJcY1ohr5OVs9w+CdkyUJc9FspZfPITTyjnU4RUkHZXBz2lsLLzkukD4N9gKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493284;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=p9x4nyKp58U6HRLjvUMttJNHFZj1/ft861x7cFqIKgw=;
	b=xaDzs2wP1LeZGR5gDYBZgst2eItydU4K9EPiDpzXs+6cieerq/gSukzG9/KLkCCbKJNo
	 5Ed82txdetxeWn/UNEzYLVOnlfPFceTq8neQu8EEimYh7+ne1ijoE7dHaGaLg2moEHJsM
	 4oHmt1zJwLnsMGSXvW+pr3GkJ7zVPE8wQ0ZcMuZBOLjrlH+euVl0Y2bmWU0oyMuXFY1ZH
	 VSHlRr9/A+g1ZEXXFeTBlYFJDZaiq+5CJyV43dv5jSbFPWzx+t5yBhvx/2eLRClXwZn/e
	 C/2QTc0zLnhXQkb/m8bDJpJsidbMrBepPEJOiq/RppXC+grmFx7IV24HwuMEATNAnsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE20606B804
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 14:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADE20606B804
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-554c0d47d17so35860121cf.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 06:21:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794493283; x=1795098083;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p9x4nyKp58U6HRLjvUMttJNHFZj1/ft861x7cFqIKgw=;
        b=nLN0r0LtsNro29VOGLt7kQ4I3rlKBQ4DgcNjeqHVwGf+84aHu96+Htq459QWxgF+KV
         nbJU1wsHVBCAhW7rgG/ZsZnZiY/YPzvTlWbpX/uSgG7KOt8PqN8lLFKJNbPzLjmcGHAI
         hL1ij3bfi/shJpg9mNSIP65cIb9l+20QoK5Thyhu3uIHBNTeZbladTxMVN2WCPALye14
         Xosfey2rK9mgwajXz9K870GVAjlFgTS2sMePWWxIgktkcvtk7Y/73JHq2FWG7bVMzly5
         x31zOZWydELFw+K2IBIe+J9wnAK3eZAAU/YELjmahrsPUfrfC+U05n7AOjyZLEEpWhA4
         aSng==
X-Forwarded-Encrypted: i=1; AL+hErHFUmONoQ8LHD+ZGsSmZg4BQVFJ6hAd/Atpj0096LiWinm9w+vDxONCAIU5g2Fy1T3pnoduFB96wcDN@vger.kernel.org
X-Gm-Message-State: APuU4Z+kmnk6vHKsXAA/Jm/ybDYtbpGNy7MvB0M5IiW7I5ftfOWh9ayM
	SEmtQaaAOZFU7sW82Eq6GvWa9Wq1pUJKiAKZ9HkrtxLRObXDWZKqIulaNPhUDjEmSYM=
X-Gm-Gg: AYBFou0QrMLf4z0umVG/tYh4td+4nsfLGt/fVijNTCWpepQ5XYGbjhXSjXhFyDnVaNz
	acPR/SH0Z0e3IHlgQ61xOJ16xT4vRADD+e6p/7txW9m1anGMZrTVIdP2u1VPOtXfj0PJ9KeQ1mu
	/FnXLk+AHLm1kfCa9oZs/WHQ+F6W6q/HhrQXMhrJ2BMQVmu5gEvdKXN+JTc4OJ/Hrj/FaePbIkm
	7r3Z6vSzzy45HAY+IyB51yb4fvMj5hcPwZsYUJ1Aa5skTzI1Y8jWch9gzS/QW9GMATvC997jzgO
	pkuCrUI7W2AAUUxwaenubQ2t+wj/UlMa71tIClEdljcnQ9rZO9SYDm6XRKxCg5xKlRmgvUE4gyT
	3EP1Khz0sIvOhndfMxu5faEmINn23E/mc01JpKifsIib8kwgDZdv8InAe0eKH90uwJQYey+VOCM
	7dBlf12I8gDTR8yDWLJIFhHioJ9GVTOSnafxlGS2EIpED14qw9hkcyVSZ01nxnYkiIjAK0ySKF0
	65bvFYAagRxqYOcE5+YjNvlZ9wXrECM7PTsPZ3Qm6YPvKdFbeP71MN3X0+nV4Y9CrkSh9exZShY
	8BWYYc7V8zse/Gsf/tV4yLq9JQhVr1Pn+SxCnhTPSZKSKT4zT/4G7AeMOKPFwsWfH7A6bGu2Npt
	rp4Hd+N2talNy0UES
X-Received: by 2002:a05:622a:4e93:b0:54f:8d78:4dae with SMTP id d75a77b69052e-556c1678b2cmr90824071cf.61.1794493282782;
        Thu, 12 Nov 2026 06:21:22 -0800 (PST)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-555091eb7f5sm75377541cf.1.2026.11.12.06.21.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:21:22 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53c4b82919fso57849041cf.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 06:21:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGjY9kjPIsf+zhh+gj0puR8+1qkRJW2KfOmgGwikdlEVjpbyb25ROH9TOwbinBBm9W7AzzC1M33ZAf0@vger.kernel.org
X-Received: by 2002:a05:6102:5798:b0:7c3:881f:b620 with SMTP id
 ada2fe7eead31-7d5060e293emr2040092137.21.1794492899954; Thu, 12 Nov 2026
 06:14:59 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-2-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-2-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 15:14:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVBBySyLE=5gG5HvQV95811asBZ7LKwsQXAVPdUPjjTTw@mail.gmail.com>
X-Gm-Features: AclHuK_i81THT_hnDNfFBzoyAYqo67SKua85inNQRuBh9I9Xk4b1lG_6SVOc53s
Message-ID: <CAMuHMdVBBySyLE=5gG5HvQV95811asBZ7LKwsQXAVPdUPjjTTw@mail.gmail.com>
Subject: Re: [PATCH v4 02/13] pmdomain: renesas: r8a78000: Add SCMI maps for VIO
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 14:34, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> Add SCMI maps for the VIO domain to map the VSP and FCPV power domains
> and module controls.
>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
