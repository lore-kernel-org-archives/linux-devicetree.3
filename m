Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1DD43C7DB
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 14:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787669056; cv=none; b=c91gWFKQsFtZc2GQAVtv4WdJOcXsZOguGV5IKNHvdqjspiUfbHHp72Ay7Y+OnGN+TUfOlJyFsDqEcv/y97+W+AxN5guxOdW0pPL+cU2TZFy7x/7Zmmp+CueMCEpJ/JGn97HkBUWm/eqlGrGhlVoc1Uds6zxNIabSYcOd0Ef7uww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787669056; c=relaxed/simple;
	bh=NtDNnAxS9JCqoYNY9CXizA3YxkktQlBKy/wbas23ZKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=babWp9EhX3OUzPelNXNI43B2pU25s/b2Ax5YhhVyIfgRIFYaS5+fRCzjZUvl79flePmlVv2OKEYBuLt1C6FQdYj6G/MzJy0jqk11/xBGg1KHW1/b64KiPk+ZEP45blnUu3CZ6gNR802A0lqt5NsMp+ZLkl0TAy/Mux8UYl9u3no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-9061a795d76so52655296d6.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 07:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787669053; x=1788273853;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ScdPB/HWXKyLnSzbxD6GH9YFmqF5SuqSigLbQv0OKqA=;
        b=IBoVfj0L6U6bW60TqFadOZpYHiPx2SgN2A+Bv2HC5UX13BV0RmCpl6fYopb4caaYuk
         G7rMzO8X2dRM0u/cLWBJDm1/kuYVOzz6QG6rgqZ/w2o5jNOB4+W90YIzuI4feSYdJ/SU
         uKVE6tuus1+mxk+BrhOV2rk0jNz9XAvWPMJLbxEb6XztLu+sYWr4XNF5fY8Sy9/UkO+k
         ATXbVazFD0wdgqAx56AfEmvwJTrfLePeFaQ+UfNNJ2a4tttUGBxCx3o2lzwOlaXsx0Ql
         HFNwqD7bfTWiBktaOgxH2WqUAY2POBZIf3rxctQ0+97Rlb6doTESiHcrG7LFNG6w+EOU
         LUvw==
X-Forwarded-Encrypted: i=1; AHgh+Rqaf7kKjk7UwxAtZrcG3ES3xWf/q667d4b9S9VqDVN67KnPmzgNC0OapeUFn2TRnkN0EBvDCdeUrJxC@vger.kernel.org
X-Gm-Message-State: AFuF++lyXNCLzSuQmhZuGHq9y847Q6aAY/gx62Q/ZlGAJ/TZ9bzsA8a3
	24X8+8073QeAjcRXpbsUiItA9QZPVT9g/Tf+3VKbrMu+hOlkO7warD/WZNwYAVVqEgo=
X-Gm-Gg: AR+sD11HiHiUhc4Dj7YEo9SLChtqLfNaawc0vNEQwTyeY/Z4PbGm5xqXsHHGXGvZjXB
	BTtqOfbIpCt7IvwpPPn+RycB/m2SnWdiCPsYCgBWK4LFot/vl9WW9Ia1ZzvgenSWUuhZ42XSDh4
	sO/IJMzvOfinve1Z0xuO3vvrRt7V7Frd52Op6iz5DksTug9zUuTkCk5BSsogCp+pas4vuFzYViV
	MdKzXlEJjW0o0sjTQRdLYIHTbFzGL/aKXbaFR4e7hl57OiQ+KurpNLEaW6iaXxKZTK8EZnG0KvL
	Il33oBoIBp07ZVeyBTTau1t8PBcLZ3hFA6yYBZ7ailtu8c8+1o3aDofhvyKyl/njxfCbfk0xnnd
	cPq7f56U44nSNWusqjUgoWgcizbdnjhWi6j9ZjzmGTMQ58KU6GJA0yGtLXPASXbU6CzYkduzzFM
	Bf4POmyC3ZS+cqzzP5mrjH2dwS3v+WKQK1zPTVmIpAjMEEMAkvMhwuR/ZAz2TZVLbLgrpauFf0R
	96wJAFugVaHmyqciCsxjcMgCYanQw==
X-Received: by 2002:ad4:5de7:0:b0:907:94e6:f8bc with SMTP id 6a1803df08f44-90cb79077a5mr66113996d6.15.1787669053474;
        Tue, 25 Aug 2026 07:44:13 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com. [209.85.160.176])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90cc65283bbsm55336d6.35.2026.08.25.07.44.13
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 07:44:13 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51c2cce930cso49257261cf.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 07:44:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpduyb5IEyOuMsIJKG1xz8taiJLo25+mI+VtjG7DaQfjN8B9KV/CnLjgxZvF7qzdi82bFrawFlchOIU@vger.kernel.org
X-Received: by 2002:a05:6102:148f:b0:77b:4bee:6a8f with SMTP id
 ada2fe7eead31-77fe84dcf5dmr2940768137.9.1787668585576; Tue, 25 Aug 2026
 07:36:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev> <20260714173315.1981708-5-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-5-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 16:36:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQ2MsMKQj6gA_4pPwdn2VmyGgzTUXHF02=3hVCdRWC+g@mail.gmail.com>
X-Gm-Features: AcwNN1W_bbmZVeZ40Fyz6-5WTX8tm1gBDARO4xiKfvf6z8u1u_UqEYooprtkdMM
Message-ID: <CAMuHMdXQ2MsMKQj6gA_4pPwdn2VmyGgzTUXHF02=3hVCdRWC+g@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] can: rcar_canfd: Allow the CAN FD clock to be
 sourced from fck
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	bmasney@redhat.com, biju.das.jz@bp.renesas.com, 
	fabrizio.castro.jz@renesas.com, claudiu.beznea@tuxon.dev, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 19:33, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> On the Renesas RZ/G3S, the CAN FD clock can be sourced either from fck
> (the peripheral clock) or from an external clock (can_clk). When fck is
> used, it is divided internally by the CAN FD controller.
>
> Adjust the existing canfd clock handling code to support the RZ/G3S CAN.
>
> The existing struct rcar_canfd_hw_info instances were updated to address
> the request in the Link discussion.
>
> Link: https://lore.kernel.org/all/1d9719e3-10ff-4cd8-b729-55fea93c37ce@wanadoo.fr
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
