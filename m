Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F2327AC31
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 07:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789199854; cv=none; b=UYHg/1wYwzfT+ougR+IbXRuJfmEhNtijNLBE+x3gHuFAfA2XlXlksY2/mrw/IyECJPWFpn7YtNPxs3hOMp4MNe5KIvAqx2UXpRdiDdR3ipp3WEejK42f3Lfw/Ub0ka/JJDSDGbkUJ8cwfM04O7nowNYEm4g34tTs+Ee/wt9sVmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789199854; c=relaxed/simple;
	bh=bTBk2CBRDahK1Lh12GNmBkGqI1rSJ+RuEfJVc5A7eMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gync/UV15Qs11WPHnO6CqyI2BkDWIfYiVfvlo0cprK2rB0cTAsqSBDyK+yXLDkA726EXfyKcq9tPE/Zun/xNabL2u+WSCTzUyttLdRVEDf8B3WxldjH3APUpqag0sy4ovUu0oiqtNORwwPrpchdzpf24M+NokzPRn4OUOjOY+s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46accbdfc20so772276fac.0
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 00:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789199851; x=1789804651;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTBk2CBRDahK1Lh12GNmBkGqI1rSJ+RuEfJVc5A7eMs=;
        b=Tmt2xpzqc8sMeBo7IC2LN1oEkBPpIesqwUUw4DjMT5PiDuUiiczQnN2//HlhFFF6c2
         xE/uoP0wD/VSvGf6oy9B95zeS5KiFYfqRpjOxgcoyfS7l/Z3KCWhMOcLd8M2s4eifUhL
         y6+dSecSz8LOi5lyhHb3txLuuDzrS5VwL6zbPZ4ulH9PQ38OKOUszOwHSoI2+TI0QHhR
         fKtDYlmxT5ZiPV+4Eh+W+gsrScHoho32ph/BvrlSkU+gxsSG5qVffqpGBNZooJ6RzMiU
         1Yun8jPgnpiSnJFj4/h9zcjlFsvwFkVXmWGoTR5C1LZr8N0eA1eicAk21onEq0cXSaOs
         Dk1w==
X-Forwarded-Encrypted: i=1; AKwUvBzppDUHVTuaOyjKu24/+TiCfuExQR9xOnjVseS89ybN862WfG2PKAxBRpnaBFMBd8u/AfPT/3NeM+wR@vger.kernel.org
X-Gm-Message-State: AFuF++nqOD7FqEhBdYYFWBSzekSNEgMzSjkRqnZ/SZtOqkpl359yGO1V
	Rz/hEr7QSGk8kXWUPTbUgvphf9IGnOnmIhr7ZCuCBEYLBgVQJIR9nXdgmMnCBtIDe0RWnQ==
X-Gm-Gg: AYBFou1GgH8DAsbsT+VfVGAUhS5Rp3TllplKCluq3C9zsw3HruFxr1J6LP7GVYDHCGC
	KxWazwpK7j3J8jucuVjpINhLbIZydTuP8zUej7NGgVQ6XQ/vufx9EI5QVmc7WcJx4LgrhyVLa+1
	K+ieU+qdJlfXCVrXlDdzWRUgQ2NG81mmnjXt322QGaEj/8V1PPpmw/u0WInWXUJBzeyS1orTrgj
	MxvBKveXXP4hS99XyG0Zi5dnKMMwXgci2RDI+dTihZls4sgWHKrHxqhn85pi4HSuWdTu/SmIwop
	X2m2dG5a+hejQ35Zmbeb8/QnpnZMvXbjpAuqvdrcGpCLi0rjAyIzLRFj+G6BNx3dp8FyxG+n+nd
	k8lLNuaD5O7ChFAy4kSRUOwrVKiiR7tKfgn6VZP4buGqPANzMfDeOeDuIXco0QmPsFBTNgdn1kt
	tqeChvkXjujPA9Cme7odYbrvO9pykQJ7euke0sPAB+DV6muJmOaLAbn3XSubol7lx7h2zp/tYuQ
	kXSGM+v6Z3lGgvF6fTTgacSaerGOcX8LgjxflhK5mzDiPh578CVfTX3vBt4Pmep
X-Received: by 2002:a05:6870:326a:b0:471:3325:80ca with SMTP id 586e51a60fabf-47de7d6484cmr10606327fac.5.1789199850694;
        Sat, 12 Sep 2026 00:57:30 -0700 (PDT)
Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com. [74.125.231.171])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df42b4699sm4701213fac.0.2026.09.12.00.57.29
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 00:57:30 -0700 (PDT)
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-7fccd4c3f36so617118a34.3
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 00:57:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwXUh7lRVwiP0uAZHw4TdvPwaapOogw0L+9S5UQxEYBANI4BbgJathrcyfS3XDi3VwQzSuf8yKgWMdR@vger.kernel.org
X-Received: by 2002:a05:690c:97:b0:81f:e85b:f9da with SMTP id
 00721157ae682-884b4b01ddamr30061107b3.33.1789199423193; Sat, 12 Sep 2026
 00:50:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905153234.133217-1-tanure@linux.com> <20260905153234.133217-5-tanure@linux.com>
 <aqSX-kUvYaixESxe@redhat.com>
In-Reply-To: <aqSX-kUvYaixESxe@redhat.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Sat, 12 Sep 2026 08:50:12 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2vpcFw-5evCkykwWo6jbHvKvQ4XjYt_EKFyJuQm_ES5g@mail.gmail.com>
X-Gm-Features: AcwNN1V-hZOzugyfoJiJeFS5rmMdeoAyBQ6wZJLEfk_Dvgzhb0zC99WtQCvbVRg
Message-ID: <CAJX_Q+2vpcFw-5evCkykwWo6jbHvKvQ4XjYt_EKFyJuQm_ES5g@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
To: Brian Masney <bmasney@redhat.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>, 
	Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 1:08=E2=80=AFAM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Hi Lucas,
>
> On Sat, Sep 05, 2026 at 04:32:34PM +0100, Lucas Tanure wrote:
> > sys_ampipe_nand clocks the pipeline stage inserted in the bus path
> > between the SD/eMMC controllers and the NIC_MATRIX fabric. It does have
> > identifiable consumers - the three MMC controllers - so marking it
> > critical was the wrong tool: the clock should be referenced from the
> > consumer nodes and claimed by the mmc driver instead.
> >
> > Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
> > sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself and
> > have no single identifiable consumer.
> >
> > Assisted-by: Claude:claude-fable-5
> > Signed-off-by: Lucas Tanure <tanure@linux.com>
> > ---
> > This patch depends on the MMC controllers actually referencing the cloc=
k:
> > the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
> > clock must land before this patch, otherwise the boot hangs and memory
> > corruption this clock caused are reintroduced.
>
> This series should be merged together in one tree? Which tree? I can
> provide an Acked-by if it should go through the mmc tree.
>
> Brian
>
It's definitely best to keep the series together in one tree to avoid
boot regressions,
but I think the clk tree is the better fit since the core changes
revolve around clock logic.
Could you accept it ?

thanks
lucas
