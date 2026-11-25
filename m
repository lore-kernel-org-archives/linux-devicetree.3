Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618434;
	b=qUGB0g8jLaiUVS7JqmgcTccL0QPdqfWs85GewS5KkPZTivoxjlK9ztcEOjbnmvJDKKML
	 s0/pvUhqm6R5EtwjCw1OWilZyw6Lr1V6JIuG66cysTdY7sR9AExZKiWzsez6YQ0EWkE3/
	 PFl4on19IXfBUQA5gqEq/24JPC2ro4XtTmf0NNIezyQE/Rr5F26fcvlEm/hMlW3qV2bSp
	 cpF9/1mpY79YMf6+MW7H++5Tsg15mHAjGfOB9cqQ/CNKwHLAKewzQ5DD/0rNVfkOLKsO2
	 pMYH3ZD/Kq7K04r4eoAMcfxarsflAmWrqZxn7ddUWyxS84wZ8MogjakXiy6xlFznYNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618434;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=jyTslH/h8L0C8HCIteQbCN/1sF3Ppecw+tHudhxEPjo=;
	b=Z/E+R0tsuIyDJz8j8XWVM23CPnYpGu0Y3NVgbhGTHHm8DffC3+YZ12y8iEhitD8naIEH
	 toFjxX0rhK7XLu8rTRFhCFKQC9J+jxo8dZEE6Tvbb8sETdJYYOSMADtH3rqosHncvvxrS
	 BznDJnyjEUFo0pAjpJ6bs1wEIp2y57s/7VNmqYlMEGPTWOCcP1CLQS5YX2PugH2OxvO5u
	 qkHCeMaZk+9YRzl85ow0B4pWGDwV0qRU5yGAN5qQSo5eA2lf67H7hUirO3iv6Xbx49cpn
	 vkaHDVA3OJuHObXIbJBt8r/Tjs7KWsuuQIwCkcSDbctn1mn1heue/3lqH2Eu/PkK/Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFA1606A32E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 14:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CFA1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9495d543c42so595557385a.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:53:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618433; x=1796223233;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jyTslH/h8L0C8HCIteQbCN/1sF3Ppecw+tHudhxEPjo=;
        b=A8e5Z0bBOZpbiDH/nEX8/+znQrePr3rw3cROeHeUwin0Q2T4DiriN3fwB1CU7wo9Z3
         eoUFNBKwSxQsbYPN0Av+XbuCLoLjjehetsIPjWdHNfVCl4W3HvrBoB5UV4XVbkhjr2k4
         uwXtIz05/W0Zdkz1I6yLkxyraEo8Pcc23Bg0R2sXouNArnbSRfkaNFPs7a02SVyC43ib
         EcoSsUuk456BEoyuv+E1WnCLJXzrqL/Yjvaa3HidXmzLve/c0LubGDZar/M9GzeSS9lv
         PuKUWq+nXbbJGFJe8N0x7BSAcZZ2G8ZPdloRsUgN2r2jhDvIXzkWIXA5o4otR/SAbLbs
         f6wg==
X-Forwarded-Encrypted: i=1; AL+hErE/StakbLg8a/7yRD9pX+2abJx1L3lRgc08+SvM3ijYWpNzyzsyedI5Mq6oWNe209kuFlunQtFOV59j@vger.kernel.org
X-Gm-Message-State: APuU4Z9TgNM9676a+GSJormxWBm9JmK/+lThIDdggi1JwFYxnrDE0WDh
	GNTd6k5tusv14VBC73mVqfSZqM76SU0EzHWJm34UPgdj8fz4byGVDc17bim2CF/b
X-Gm-Gg: AZFdTZcM3ATDkHKerO5B2k1Pjy0EjOMZ5RW3+6FEgQ5WmzEqRxp8NGE7IDmMsBkjMc/
	/H1TGH8iVQP7zFAnJYlyl2sNEgTto0jOTmH/w1VdtCHlwJyxSMYKn1acta+9JGnhPuRcR84AmH1
	MLAJ+KtIKLVqz6j73TS77NJVI33ec3DfVf/AeL4FkmaYAxA7u8GodmZkFtzHADXdnuQQqROMP5m
	z+1MWJJcEsppJqy/0/wZ+ZdJO1z9JgUYnD1TKmaOF5ZqCI6emsLXoSuOgGUGpm+8ydUijwV28nI
	Oe+PkIOTn6wxv7s5/jDCpudLIlwWwEKhQ3kfoFlJZxOtbXewM6nJ/GoZCha7gEBkCciDSOJ84Vh
	N3rZJ/KvyDD9gSPJDheh9HcMxkXoAkHBsoi59rbw8gYV6oRkMkj55fX1tN2DTRjzJS/fyj0/WFp
	n12yihZyvitLPhUCS93Gys9kz7hNG7hLqPW1muUk+MQFq1dySt1BAqNuhDn10E794eAjUdGeEV6
	KGf28+RdD2jOPo+qcQzN7YyWuoYCf5397H72MeMqkP7yMojQA8fBwI525doRmtQSTzMhk9zpPC/
	lsPysWp3wCL13LClWiuDZPwN994CnpbGzWPSgv5HETxdx5m2ceAqcP8OGw0TMq0VWTplGsk=
X-Received: by 2002:a05:620a:4626:b0:93f:1936:b229 with SMTP id af79cd13be357-949bab30868mr3319479485a.77.1795618433428;
        Wed, 25 Nov 2026 06:53:53 -0800 (PST)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb397b4bsm1334807685a.21.2026.11.25.06.53.53
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:53:53 -0800 (PST)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93f1e5d7450so553887585a.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:53:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHcVA6UpGu3HlEJvunaI5Zs7uMwE94BQ28y0MAhkDKz0hb7O1P4RYBYBXUXVkicnaoC9KufEDo7vNvL@vger.kernel.org
X-Received: by 2002:a05:6122:1daa:b0:5ea:389c:520b with SMTP id
 71dfb90a1353d-5ee8af0b136mr10546236e0c.8.1795618054600; Wed, 25 Nov 2026
 06:47:34 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
 <20261119234759.GB2324725@killaraus.ideasonboard.com> <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
 <awAqqg6F2Z1t55x2@ninjato>
In-Reply-To: <awAqqg6F2Z1t55x2@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2026 15:47:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLn444XFOUV75J22dNSnMkcjefusMomnp1dqRe3tsggg@mail.gmail.com>
X-Gm-Features: Aa3M54pxTFdlXtNPAY9vlRQdDdU5I_xDDti_PqZ4BrybSMWjBRbxoSvFUUiO_NA
Message-ID: <CAMuHMdWLn444XFOUV75J22dNSnMkcjefusMomnp1dqRe3tsggg@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Paul Elder <paul.elder+renesas@ideasonboard.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Fri, 20 Nov 2026 at 12:10, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > I don't think SCMI itself introduce instability.
> > It only defines the protocol, and each firmware choose its ids.
> > Could you tell me what you mean by instability?
>
> Let me try to reword:
>
> In the past, we wanted to support all kinds of firmware. Sadly, each new
> firmware introduced different IDs here and there. So, we came up with
> some stable IDs ourselves and mapped them to the IDs per firmware. This

For core clocks, we came up with our own IDs, just like in other DT
bindings where there is no simple mapping to hardware.
For power domains and resets, the IDs are derived from the hardware
documentation (register and bitfield indices) (augmented with a few
power domain IDs that have no simple mapping to hardware).

> is a n:1-mapping of firmware IDs to our stable IDs.

Unfortunately this is not 100% true:
  - There may be multiple SCMI IDs corresponding to a single physical
    resource,
  - We are still discovering missing SCMI IDs for some resource.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
