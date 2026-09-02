Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CBA49483B
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 12:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350645; cv=none; b=UJWYGwcvKELpN+2fAR8sYGxr4vtR+R2KUHP08+IpydOEAap8T2gahev9C0qBuKCgJgeP5ZJqtIGK5/Nl5cSSCSeP92ImukBPSocCK02JwdfcBbb9TC1x/0I5DpuYh9cZyuQpljSbWOstLJBgYJFN972phY2VM+6OtsP0cIXMaBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350645; c=relaxed/simple;
	bh=BGVT6NiiPBGrDzAWTCenC1f6pOP4TmMvoz1BBe+v1UE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZlCROF7qopshPc63/ajqcQpuvdcl1L7dvITRDkeE1yv3eNJQG0qlDl1d7VO//u/jHwWYsYYn5e/9rua1MhcONSbplGblv4EKlDBitdpcdP/PLwzn9vbni9yCpoLc9npI0VflEM/Kk+GU/2YSi1SNASWSu/uIVhyKlPlEnxgETn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-97e76cabd96so252980241.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 05:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788350629; x=1788955429;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zZuEv2ob4j8Zh+WhkA/MTuPTTESwfEtjHWVWham0Lxc=;
        b=aGGThvWiVBEnY1vCkZa7HlGoiVU/SFH8jmoAxAJJQm7Y9JLP5njxy51Z+qhBQAtQIJ
         QNtt2LxiUrasUI2JpriGK2PvnJ0RLU5t9JmB63607TYrLeRV+H3Ldxw6zSUYoCIqvV0f
         3f7IcciE0phrVUkcAT3wzc7QFJywEcP4eVAS9uSWnvlsFEVZSX3a2iCIuugH8MmtPcMt
         Ksip5zhvcfEK2db+Z3irV593Re2xCAdxvFoV6Lrc2y0ZYJxD2kBJ8vkgbRVWqLL8UBA8
         x1vorgPcNgC0YJYeY4y3aFXODo1UHEbKX1/cNz/EXJOKzEcJBpQ4erPexQSSfSvAqwF/
         g32Q==
X-Forwarded-Encrypted: i=1; AKwUvBzm41j8UF5l/+Xmr24PJBIVUaZMtNeJbeCk8IiavR/NjR0iNCf+L0/cx4qF80t4YLX2HJQbphDFttU6@vger.kernel.org
X-Gm-Message-State: AFuF++kRlkdWrR7vSAfC+oQsQrgE5vwus3838XtRWMYo1sn6J6JLTpZB
	rHUCIHqIvItzaMG14AD/KqYqeeDRpCH+Dk2npvTLCp3hO+Df8wTMreNXlk3lNq9u
X-Gm-Gg: AYBFou2IbYQoUdqonis6LSao9j/20kjPh3ET/7puNIVTza+u1RswCXA+1rVv1Chctz/
	+yKE64rfIkYaVFcq+A1L5RNhboPuwCrfh66RT81G583geaU8Bc/lZfTbTYXToTev3wuVLa1D95/
	5J29DIlBJ2AZgt/kDQOpLY+q4AeE/jjnpQaMbhxz91WHH2aFEuiU1Z0LTfgwfr2SVdVyLqLKc2y
	kFsIQUuymeO61D642aj1+o8VvrQVFlqjIBftsCh+dQOSL3mXpW6EljveURVFVJJZ/j7deJZ5QC0
	cNmIIiMFyC4fueSPkqLoiFwiLnfNka1vlacxU15PQIgw0v/ggx1M6b91TT0ep6RdW5gMOz8bRK1
	9kwcgFNAgOs5BM7Vtz7/+TEgBa/6BmQW4jrMqyE0HcWUHSXrSRI2sOgWE6XX67heExabNC8/e1R
	QjYceudDJRWNVM5m6Dp3hwh607NXnMVpLLJXZv8x9YBC2Xyy5jX0gydy/tqAM6lEZw8WTp6yTsh
	0DHKt5TG3OU/wQc1W1eiGkjZwIfUkse1dE3
X-Received: by 2002:a05:6102:6d2:b0:785:76cd:ce88 with SMTP id ada2fe7eead31-78a1f1576d3mr1255085137.3.1788350629099;
        Wed, 02 Sep 2026 05:03:49 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a1a251ca6sm1941679137.4.2026.09.02.05.03.48
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:03:48 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-745497ac8fcso321922137.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 05:03:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz2qg/P8bBBwzcPP6/czoyqI5YeDgyfJ3zfbS8t4Hbr/S+XzOyKzeWtnRfwL4h0V57kATQez9w2XGad@vger.kernel.org
X-Received: by 2002:a05:6102:14a5:b0:784:94dd:5389 with SMTP id
 ada2fe7eead31-78a1f3954bfmr1187932137.13.1788350628203; Wed, 02 Sep 2026
 05:03:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
In-Reply-To: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 14:03:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVZfH5rzN-xFvyfERt=j+c0aF7ZSbAn7XTM=R_u55+3MQ@mail.gmail.com>
X-Gm-Features: AcwNN1W7aL6kq2Ib0xjLGz4RQRE9m6dme2IHxODeY3IaF54CXwsKAcwLlCow_cY
Message-ID: <CAMuHMdVZfH5rzN-xFvyfERt=j+c0aF7ZSbAn7XTM=R_u55+3MQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Joshua,

On Wed, 2 Sept 2026 at 13:50, Josua Mayer <josua@solid-run.com> wrote:
> Add support for a variety of SolidRun RZ/G2 based SoMs and the
> HummingBoard IIoT Evaluation board.

Thanks for your series!

> Changes in v7:

Oops, subject says v4?
Fortunately b4 is not confused, and does The Right Thing(tm)...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
