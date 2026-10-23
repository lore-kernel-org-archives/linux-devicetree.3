Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792764910;
	b=chE4NyI+bxnOgT/ZAZOSNasNRqyOzKyO8rLGLwC/mjSABZl0kxyQZXM/zsfuPCPuyo9L
	 0wWAZdr2g2955ARVx79g/Ln6Fl62cMpU7+8kbw20+suY/C47iW8p3p/E162kc5ELDuhm4
	 /rP9lWymksWa3TubUv0y8kTWBBd9bWveLS4CYhUZXewX/cYfeWOHOhxMnZK7CCh+wjfD0
	 2I8+t6plfVGqwPXheA7KQVR7EeHvJch/MavIQua3bcTAQ8QCq23g/dgpPMe5350ksL8F7
	 yKR5KXOaxM9neBXUi9y1XVEDdnf/LTHOO47eGi3kl7kpqZCn3mm9XhOMI9FgUvNZB2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ssHEzjzfcY3y99EaZ6IT5t5Uq+N8qOcZuAF48Ej6bak=;
	b=MWjZRl/Yt25KlpCzjGusoMKfWDZZyMOsXw1QHC28UpOmBmbyv9Nr7ZiLPJxfcrljnFfD
	 HaRVpSCWWLM0Ogb2K72brZjeW4G5Lem4Tua2NBPONy18jmjbm222CNqZf3aGLh/vg+ymb
	 lgqllLVvFV99MaVnV9Pew8QMpvJ2MNvVzmG2ASFhryjLGTTgKFV2NlieuGHLXHP/nvk3h
	 ZAsDEz+fdS+P/ECeTVOhHS5mPiP6OTvXF8kn8Itx9cgC7D0oTcw9fJJJmr+htCmAMavbO
	 0up1+WspUFUM6uu9RzsY156YM/uedpOp4TZfZwVG4NZlrT7rfmUCNwi81uixZVg/g0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AhdXrNWn;
	arc=fail smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4D5606A31F
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 14:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD4D5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AhdXrNWn
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso1508762eec.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792764909; cv=none;
        d=google.com; s=arc-20260327;
        b=DPz1A5fqzk5iUzKMI8uKRUE4TsfcB9Gj2DcbFGB03cZqGEZGW4Y3OX00NqG6ZmAGal
         /kfofNtZNx82hXzooCrpPSIlHXlx9fxIAhXNaaxSKnPNaNnZcM6NrDbWP0/McGnUrhdt
         ozv4MHwu5B1uVZ3UyocHgXVg6gF8gsT5d+kspyjFO8KXXwYi8xh5nLzxlCh9gqWCWZUu
         VHeyXDPEiBtxp5jZd2M1XhPph4yvv2q3lZ7p6zhvc2TFUL/oO6CPZ8jBbA0sDB2bn1UT
         2a/ClL8zQayHTdDz8imht1RLyngV+P9iD5jGHEfGNSKQWChg2J9eZDuN7ySrNGuKwzje
         5sgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ssHEzjzfcY3y99EaZ6IT5t5Uq+N8qOcZuAF48Ej6bak=;
        fh=esppd8lIZKlM74/R516oWhidfaBpPIlKywNC9ee76Fo=;
        b=e4xMNWiLXDMwverqZ8ye4qmn0tK2bIcXk2JGGMZ4T+Q2LJQszxR/yBghehmhI/dtIx
         4XONzUDjI1s+sFkBXAz2MII/9KAIJw8QWvBKYDFPpqiqvYWAU6XqZ8XlQfsC9RoOdEQG
         4S+aa1AWqrAQYYuA8vxdgKeNm7+cyuymV7vmITOtAxRcTd4pV+SPJSYHPACXNAFzeqei
         T/6xgBZO8+QfK8L0SQwZs653KOTpSWZuv63/Llw22fZ40xnzgXJnl8nMifuKr1pNP/wI
         LboXRVAvyLw0IINYzcsgM6o3zaZCE4BBGSEcSgPninMoXieMa29ySL9gcGnL/7UrAzew
         hbFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792764909; x=1793369709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ssHEzjzfcY3y99EaZ6IT5t5Uq+N8qOcZuAF48Ej6bak=;
        b=AhdXrNWnrU3mrt1MMRe/e6VxIevvuFIEP5rhfHlfuMzUxqtoIouvMJRuzKDBd2weYm
         l/dBG+LuBgyps93XvGFRFcHWMTOIAMzKJFCtjzFXTPBWFcKlqAMJXJP3Vetqp+pbR13Q
         dv6FtJluW3yMZ8spVdkU5AKtqKrAJ7klobwSKhZcEIaRzeTZloIeRxrOUwuEtWgujkNO
         XTW6xQ7AaHjrQkvEH4eSpLrmE+89zS0D1ddzkdo9GreFLLhSb6ilCUqWX/YP5hIHLtiF
         iAS8MM0fRa351wkUsBzTAIlLET80YjYHUlJx5JF9dgDGgSMoKrw3khS1TnI/ztRJ192k
         lOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764909; x=1793369709;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssHEzjzfcY3y99EaZ6IT5t5Uq+N8qOcZuAF48Ej6bak=;
        b=iwMTn5aglLfvcZYWjokUeKozVA54ctPlWcxiwbSBkpF4Se5Vop6X+812DrHqoEp/cD
         DqEH1rzwLfVobxRJJoVOuHonoQm2COuU+Ro/1UiSXWERzoq4eaCt7Ul1s8zQb0S07ydu
         7ZHSiSfW5bFdhOnNo84jElrrDaOQ3ks+LKYDHb0OkBTaE41u+0UV7eprIPMUFS8TN/mU
         gjwUuT0sreeB92LIec77Kq0NOvIaZZjneHH45ogogdWz0GqVaDBjXpx1WCEFDPQbB2sN
         EcvyHoxVEH+qNcH0in7yRukVaXQuOiaMA3kLLwH+ieV+rxlDwTDHxYF0Ckj+eCI3KQQl
         gqUg==
X-Forwarded-Encrypted: i=1; AKwUvByHgRhJ8jH1f2n/389YMI4okKSz2ld8a0hkuZUacr/cbckpC0F7EglYp7u0y/vIjEHJEiSHgofXPrhG@vger.kernel.org
X-Gm-Message-State: AFq9FYKTAtsbbNtAYxKjtoaInNBsHJO8wWDdnjVv5uye3Pludc9I6Oyb
	THJ0H1MoMEHJR5roAUYwLm8cfSApkOAfo0VwS6/q/Z0mKAhfuWsT/SeXUICkyughZRRfZg0SAVO
	49rCXF1j5Y3rnKcsFYq45Zeq7incld70=
X-Gm-Gg: AYBFou3uj67u47v/6VyLu9A4qq0wbM1VDRn7qGXbYSLd3n5Hfmd5UKZYTRtqisNcNMI
	UoVYtl7JVfAxcyyB8jfo6SJ8N8kiu2N6qNUMLxttGJDNg/7U/p226gOONDRzH+y1O/JObJvLRrh
	TwOkkjC/bnd7Ew08ZQOY5jRpbkSvwlcMBmVMKq/LZtOMVXWzttl4i6SKxzWNHh6zOu4H4qhdeuJ
	xcMSr4PYGDCOwjKgb+p4uwiGsMV8fcanGvaLprk/L52tn/yOn5vbdvgyjB10TqXS8WXcJFk7cO1
	/Bcj9RylncI9mrPrHqnMJ97Qr6SD4oJD47d6CC9LAmQd01h3BNVu4/WEHc3rYUwln+/UH6wJDCG
	zyeqqFOyc3bpQ6qBdP/SG1yXJEpwfX3CsuMKtDYKoA9yv0r0vGDhAskTFAZWM+jc7yJ3ZKQ==
X-Received: by 2002:a05:7301:6507:b0:358:8f02:e0ca with SMTP id
 5a478bee46e88-369d96e0ad5mr4018525eec.9.1792764908756; Fri, 23 Oct 2026
 07:15:08 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022132259.240717-1-clamor95@gmail.com> <20261022132259.240717-8-clamor95@gmail.com>
 <Ot5qxntOTJ2QgFh6uZ0riA@nvidia.com> <CAPVz0n3Vrzb96iR5ZW8zvmruZ4aK0hKGKpJ2T9Ys+bSPCtLWHw@mail.gmail.com>
In-Reply-To: <CAPVz0n3Vrzb96iR5ZW8zvmruZ4aK0hKGKpJ2T9Ys+bSPCtLWHw@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 23 Oct 2026 17:14:57 +0300
X-Gm-Features: AclHuK8iWdYJNcYZY57a5wy5nSa1L6Um7fXs3cPnETk89r87jtgd5ZLBghEmEmU
Message-ID: <CAPVz0n3gzV+gAu_gzp3oTG9VOu-YiNSiQA0SdCFApKsi0dGjKQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] drm/tegra: Add support for 8-bit CPU interface
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 23 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:2=
6 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=BF=D1=82, 23 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 10=
:53 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
...
> > > +MODULE_ALIAS("platform:tegra-dbi");
> > > +MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> > > +MODULE_DESCRIPTION("Nvidia Tegra20/30 MIPI-DBI Type B driver");
> > > +MODULE_LICENSE("GPL");
> >
> > No separate platform driver or device. If a separate struct device is
> > needed for some technical purpose, we need to create a minimal separate
> > virtual device, but unless there is a strong reason to have that we
> > should be fine with just the dc device.
> >
> > Thank you
> > Mikko
> >
>
> ATM, I use bridge framework to describe interface and I am attaching
> it to RGB since it basically uses RGB to transfer video data. It works
> pretty nice so far.
>
> You propose to replicate how RGB works just for DBI?
>

One of the reasons I used separate pdev was to be able get mipi_dbi
from it using dev_get_drvdata() from patent (dbi bridge in this case).
DBI framework seems to not have a way to pass it in any other way,
unless you know smth I don't.
