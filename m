Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0E04BD0FB
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639193; cv=none; b=VA2P7NPkxogdEA+x054tnhEDlRfHaS4cm8rL11tVZJJ+TcflpuhJ1Tt89NXZ4TBuZOG25m5+lfaME8XC9gwrgqWsuq3PgUFNOnThR/92vrd9TqaRnaQjC5rJWDUfOBbdnrEKPEy4bhQnjr74pz+fgQgt2RCvbumLBAcwj1h4LhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639193; c=relaxed/simple;
	bh=lyxCvXomazoscclUR0t4ky/vHCgm3jn4yYZm7vcNMNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENY/jX61VHCFXJo72nmd1BakYe7PTroGrOEOJlZ3yJXdY9BVDqhWOMxDH/zTicR2Db1DSMwd6KomKhNliAm2TS0vmdAaTJYU/sdRRxRX0fXbO864DQ9C7NVZOXo/boOUPOVtS158PdpwdkO3sXTFPJgk7HMifOImtWR18qrImv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e2ff27eso443258e0c.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 02:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789639185; x=1790243985;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s008ZoScdhr7BNxJ8Chjjcs4adQQJjIUFRUX5dqGglE=;
        b=obj01JxFxkGg7RoDVnRmvRukQ4J8DLYcYr3eiBiLCDUyJ/SoqibAnDl1/sf1gUpMpv
         C8MwCBYMk7tlZTw+l0ngikNCU/6EnEac3v4WN2lWsvxjUpMolSKh9AZj5CAT2Kj6qvS0
         pV873wwXStxL10xOoy91WBXk2GFEXmKlzU3xAyijHfkY8OXnzz9Q52IYagWPTWZbdsAw
         Cd2m8Xhsdd1A9YczZSGIa3AqSQhL7e5J0t7loroRq8vGQvDNqIGvb9PNZZD7Xo/BHdez
         Wnc5Exsmtc5+lzQE99piCRDnWV426TTKrdrbLGl0ACwYQCCNcfAiL49kGU1S8a+C5BVG
         LqoQ==
X-Forwarded-Encrypted: i=1; AKwUvByryW7tJzuAKZBP8XOGxEikR6mk38hJEeGQiLb9Ym7b6hl4BAPlaGfFHh+AGrsZCs//YF5WV3/Kk3xf@vger.kernel.org
X-Gm-Message-State: AFuF++l2AU1On7y+0ozzrihivYDHrGetyBRzCivT1gK4n0VyDHAoeXpO
	HDuAYZ1SnXij+PxX0X4f4fignIAsskYmTPO6HoyDH4zkyQrpX6cHPePnRSl4QSVMMm0=
X-Gm-Gg: AYBFou0e2sPGm90BHCWgX3ZGrQAXXS8gVKXdsRDK0OYtdB1QHL+glqW5+mBxcCeuem/
	A+Aisz+2d8b/sDdRTkUm049Up8HJEe3Qm80vJvHPneKQ4f8NnAZJWsIJDWdwsFYRL1MSvDKtQ5Q
	1XmUXOMdmwxw9AgxJgr+wwUx+8a1PtDpR7mECbaia4Rr0FxJ52LMXSYe1fd9xbGMTeuMPrjnXEh
	dNZurauV73HvgLDVzg7HeDifBa4TFrrqVvFOmAhFWeHV6nn4om9KllXu7vrsKs/y3/kYsfR0IPQ
	jV2TEfNoAn1NYVw1tHrzRwJdm3ELb73CI6cBUyCz1XtQ05LYyGKqoSsIhywWfaPmnnT8W2MYnaM
	gpgFPbGe/Te0f9mmFdWjcMo9HtT2pSKFCb86TCLcuAFPeaB2K65F2pZgvHTymV+MkWji64l1yH4
	GCUZePrZt7ZrAB3wjie8tmJbi5om8iTTIHFGWkT9ZRF02LEoKRP3ztr5tac14cyh5g8wgh3zZRC
	4Y4vNgatLE7Ei94Jg66YEglPyI5D55NOAFL5g==
X-Received: by 2002:a05:6122:d98:b0:5c9:8b3b:deb5 with SMTP id 71dfb90a1353d-5c99ab30808mr6467524e0c.0.1789639184715;
        Thu, 17 Sep 2026 02:59:44 -0700 (PDT)
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com. [74.125.226.235])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9a54312f3sm2115535e0c.15.2026.09.17.02.59.43
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 02:59:43 -0700 (PDT)
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-982dd15d169so330016241.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 02:59:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByEJmDfaEbq+/Q/ovOgqtQnvCx3/nzznZ/Q1UUFOaGIrWBTVUBebfr4dDMbDEZNReEKFbgRhB+mUOTx@vger.kernel.org
X-Received: by 2002:a05:6102:161f:b0:79e:cc38:c40b with SMTP id
 ada2fe7eead31-7a0285a1f25mr6780296137.11.1789639183155; Thu, 17 Sep 2026
 02:59:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910085430.3173166-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260910085430.3173166-9-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260910085430.3173166-9-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Sep 2026 11:59:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXFVd160eAuWAcxqvRWUnCHZXshCZscnRoYdiZGCzBqHw@mail.gmail.com>
X-Gm-Features: AcwNN1V3Cad5Rk6IGr1bTFS9lb5rrCjt1yRBSqziGUl61jF7JvalYEJw63TOIlA
Message-ID: <CAMuHMdXFVd160eAuWAcxqvRWUnCHZXshCZscnRoYdiZGCzBqHw@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] arm64: dts: renesas: r9a09g077: Wire up DMA
 support for ADC
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sept 2026 at 10:56, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> RZ/T2H (R9A09G077) has three DMA controllers that can be used by
> peripherals like the ADC to offload data transfers from the CPU.
>
> Wire up the DMA channels for the ADC peripherals.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
