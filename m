Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8E33FB7E0
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 07:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786433606; cv=pass; b=RDcfZbXGiZ3KbjCIVm8bPvT51vz5/7SiB/ofR/pQ9yoUoFxq71iVbfYJwUBY00r09uWxoA0AJy5Hv04lps5AWm8sD9McDmxFLTc4NCGnMm0y2vdrB2iAwtV/q/Qa6fSO+vO1NITE6HOIZvgztpzl19U7yK4+NJ4Dvxr+ZawV+D8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786433606; c=relaxed/simple;
	bh=kfaDMc7SeR1228IzWwSdYTwwBERUmTN0kZ5yR+E6Fjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DDVCZqBiVJHwcmOT+UagRY5ZjttOMPFNgZPT/DhTh8VYxjYoeLxAhHsG4QMVd16huuDY67mzCB/NoYLMlr/C9Dh37vav29Rkk4mlll+iu3zpQJpXwCJAVOGlikQFsR1pMWy9L9Q4fpIlM4u/Ni+RVPJDt8RqT9+ZjLwGZRv0hQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWsCmxPs; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWsCmxPs"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc891373e0so33311445ad.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 00:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786433605; cv=none;
        d=google.com; s=arc-20260327;
        b=LAF0heZdc+5g0srjIAYx5EThLlGYJLrXpnrA8iN3Qt1+rqp+5a4xFWsSdsQWRabCPQ
         SBHKDc5cibdICIZ3Sn5+qkrnxlrHRpc1tqgiy6LkUslj4q+MinoVWAtEKEO2WL3dm/Ax
         F0IYijwtSBvr/Rjj71fo/Av0BdeX5zCa/QF7wu+Lew5fhlThjx2UK03Zp45NP91ZwmOC
         8J42rCo38wLXPfbmwH3TEWlfYL/1tjFTS/ILWlCCCGB6YDNmreobzB/4yYCF6W7nttfb
         DZDSfBIguS6wesZwwlVZgIAufJUwcRf9Nmf3AJ3ImhiOrvXPa7C6NLmb+ItxmW7bZ6ol
         5Hjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xF99ad/0DOf4sVlgM38a6novcYoEr4EV6MAbjOWZJGk=;
        fh=U45cA53ydIaID9mIu9Gz27xKqG09WAfv3cpsQA1MbDw=;
        b=ZvYhw8S7QmbnblTlv2TGWlH16GcocSGCYScihIjtZy1ZAhOvIQK5AgbbYxLgZnemOE
         G1ZKEEtOcJGXcPOALzawrxI3/jYl8Ts4KtMyItJMau226lqKOwUgaOIuJME2u3Hy36Vb
         Sy+9w689DxEC0RlbjPC0WMQD2jz/0XeIEVDBPRsF7BZ0trW50u5siZDw4vlUzlsEVvuZ
         vZTl1UYI3KxIuh6kZJ9ANt24yyDQCQ+pNDhJSDc3hB0u4zyTJg4uc0Vi22MKB1qtzaMU
         a5tTvmvJOb9Ozi8WG+JqN/b0ET20zdBM/mDDOI0IRkxOu9+Cc6JlEcmtqmqsciVfJ1Ce
         Lfbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786433605; x=1787038405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xF99ad/0DOf4sVlgM38a6novcYoEr4EV6MAbjOWZJGk=;
        b=jWsCmxPsz6rM0JqqXMDzCdyIJyaf/vlz6gfYrXgA1y2K5Reou40w85WAAnEzYjcv0n
         x2imTbMY/pKLvyBJg2YOndD1f4FCNRWog+tEyyzGlf51zHWUZ8kEumaqSry1qtZCBRRw
         c2EANZ5ciWVutVOpWlWElzCaHBQwV0S7O1+0Uxi+JyNgliVONLfayQeWKEMWDMLO0T4z
         rqaJ03RJeKd2GCmSLkW/zPMhG/NxJEehdxphg38HbZDuaS5H4plJWpQdPqH7xpx1IzMb
         rraoL1vIPJJltCQfMatxivuBSGcz5ze1qN0AKfyLtLwefitPQN6l8ZWhwratOSFftuhn
         ElPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786433605; x=1787038405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xF99ad/0DOf4sVlgM38a6novcYoEr4EV6MAbjOWZJGk=;
        b=kreac5fyVOvs7ZetPnNHvzYHs3Re0w6VGYLMtNFCxmMs9hPAMqlYcE95IZDq+3b5uJ
         ENbd1I0jawPmJu3McSQq/+hW81RkUPJItcO94lLLoKlIH5IFjz5G5XwYf8HkcZIQ4ySy
         utNBv/Ny2BHAW3qkK0Rn6DyYXadtOQPWekn767hAykkzs6Mlhj9Goal5X4JOH7ydplBl
         I7P5qayxXZvG7unRNSBliGdQeTTwSR/9M/4qIYei8CvgDYAKD90kfaWeWG0L8cN8Pm6+
         DH15enFsAyLiEHaDe/5SX/8w8TYnzPduDlDT/MyUCDohhdnUwKVbri/FXVI8ZliDiiqi
         3iSw==
X-Forwarded-Encrypted: i=1; AHgh+Rqdy1e3x+hty+AA4SrNpyrfhiLR4Rb6/CpnaKXcEvFsxaJOc7qKU4AcAygzLbYFf1BiMhD/XTCiTN0z@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfe0oioSx+gmjWGfYrm++NIdJAhtb6XF7vPxmKHXjEuXcwrMJk
	Ehm/ZnF6kPUB5KCp8FMZzEA3KsINafg7JzP4PmdfUlph1Hoehu1msF8Bjj7+ZqhaQhnyushbNSM
	Vc+CWt+76Y1J8bQHN7M5OG47xn10385w=
X-Gm-Gg: AR+sD13Qv0VmyckdfncRaG7p0VNT3pRMnZTuTcWAXH6+jV7HNgVRXQMp8ujuPSygp0o
	CimxCI+7EIhckTjPkppRkdK9wiQFx/6muZpkGq0JYSyaZvdpNOF77paKcG9M6OWDYMRunNyoB27
	rBhrHHZhxUS7guAGcCSrETBybFcvOLGX5G/5gNZc9bzeoQ1+VE7fivShMBdGBFcgSAdwVsiGufn
	nwWQ8d/8sReLH7/ZBxcWGD+t9MuI0cEsiyMI7gdeLWhENim1VOTtuLB72Fx7MVqeHKTBllabrcf
	kcUP49qN+xZ5RUY4GltBLzosCc9kNYDhgio0LdVQW21v
X-Received: by 2002:a17:902:d4cf:b0:2ca:d975:5bbd with SMTP id
 d9443c01a7336-2d3179365d0mr16451405ad.20.1786433604824; Tue, 11 Aug 2026
 00:33:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-2-shengjiu.wang@oss.nxp.com> <20260810-normal-cuscus-of-argument-4b230b@quoll>
 <CAA+D8AM9s7EX-G246Hf2=DOx5q2qXWg_MjUCaoJ8RggOjp+5cQ@mail.gmail.com> <dc40dcae-3017-4e61-8c6d-7e6127e4ee77@kernel.org>
In-Reply-To: <dc40dcae-3017-4e61-8c6d-7e6127e4ee77@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 11 Aug 2026 15:33:03 +0800
X-Gm-Features: AUfX_mz8xzcQdpAVFUpNZF46ew2dm49dWd2moRqPqyVHFf2Y0Ny2enqss2gXdZU
Message-ID: <CAA+D8AOQ_y7BdR4h+X6qxFygPU6h1iFV0cYXHN4KB370yM2Bkw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 1:44=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/08/2026 04:28, Shengjiu Wang wrote:
> > On Mon, Aug 10, 2026 at 3:14=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Tue, Aug 04, 2026 at 06:02:14PM +0800, shengjiu.wang@oss.nxp.com wr=
ote:
> >>> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>>
> >>> The i.MX ASRC hardware supports up to three conversion pairs (A, B, C=
).
> >>
> >> Which SoC? Did you read this binding you are changing?
> >
> > The i.MX35 ASRC (the original) already supports three conversion pairs
> > (A, B, C).
> > All subsequent SoCs that reuse this IP -- including i.MX53, i.MX8QM, i.=
MX8QXP,
> > i.MX952, share the same three-pair hardware. This binding covers all of=
 them.
> >
> >>
> >>> The existing binding exposed only a single generic audio-graph port,
> >>> which cannot represent independent conversion paths when multiple pai=
rs
> >>> are in use simultaneously.
> >>>
> >>> Add a ports container that enumerates up to three sub-ports, each
> >>> representing an independent conversion path:
> >>>   port@0 -- conversion path 0
> >>>   port@1 -- conversion path 1
> >>>   port@2 -- conversion path 2
> >>>
> >>> Each sub-port references audio-graph-port.yaml as before. Hardware pa=
irs
> >>> are allocated dynamically at stream open time; each active stream
> >>> direction (playback or capture) on a port consumes one hardware pair.
> >>>
> >>> For backwards compatibility, keep the old single port property but ma=
rk
> >>
> >> Why? Did the old hardware change that it has more ports/paths?
> >
> > The hardware has always supported three pairs; the original binding sim=
ply
> > did not expose them all. This patch corrects the binding to match what =
the
> > hardware has always been capable of.
> >
> >>
> >>> it deprecated. A schema constraint (not: required: [port, ports]) ens=
ures
> >>> that both forms cannot be used at the same time. The binding example =
is
> >>> updated to show the preferred ports form.
> >>>
> >>> No existing upstream DTS file for fsl,imx-asrc uses the previously
> >>> documented single 'port' node, so this change does not break any
> >>> in-tree device tree.
> >>
> >> Does it break other users of this binding?
> >
> > No. The existing single 'port' property is kept and marked deprecated
> > so that any out-of-tree device tree still works without modification.
> > The new 'ports' form is additive only.
> >
> >>
> >> Why mentioning upstream in the first place? Either this change breaks
> >> ABI or not, explain that.
> >
> > The deprecated 'port' property is retained, so this change is fully bac=
kwards
> > compatible and does not break ABI.
>
> So why? Drop redundant parts.

Ok, I will remove the sentence below in the commit message.

    No existing upstream DTS file for fsl,imx-asrc uses the previously
    documented single 'port' node, so this change does not break any
    in-tree device tree.

best regards
Shengjiu Wang

>
> Best regards,
> Krzysztof
