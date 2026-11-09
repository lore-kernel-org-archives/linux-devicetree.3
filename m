Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794210055;
	b=n8QWODsHKKDMhydLchz+0E+mmtQLod2I44Z4wI477SwCXsYASfEy2AM/Jpx7cekgiZiu
	 CZyoNN2gl8vQnOtpB0GjMGi6jk+lRtDQGwKOPcNDNMH0lnjsDjdVPWLzswAlkkb5ZXX95
	 w4EHRjZP0WTjlM/L2wuizeMAMogQrnRZ+qfFQE0LqL+MMGl7Mf0d8G05R2lsnSIykdKHt
	 +J6kJZEhtmQ4KbioQJh2t9Kf+xlvoOVUY5RVuFt3Z7/AdNjWdYvZMaK+1j5D+0dxp0Lfc
	 y5rv1o0XalfOLB4E3WtKD480YaaSjCvSsZYQQnR4BeLyoKdMHp1E9M+oUp7WDkB/gvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/QLOpX391Fwz82NJDNrzMApohUKRN/kTwsnVQ3ukXWY=;
	b=j8+axfQttqAoErAQdc8oc07GO08ZSmuyvdX8URK5SuKk1DtnNcs7wBHI0vhHaubr/7BB
	 cZR1VFMOlh8dbG/tihE+Dtz62BqK2mz07F67PamQDAbe/LvOCqNlHAXbr4vXpcAKusowI
	 wn1GQ9wQnPP892h8IG/OFvzuAsqGEiOaWZAubh7Pd3hKe5nFfoxfFEBbyVphMD5q5MEgM
	 nNAO1zMC3DwkpYncHCA2I/+IRi96TLI/0nvQX8V10A7rSGNKSXq1KAOW4Sjm7+CsDQNJg
	 LDh6BhhAGUyz5FSsROZU69EMMMe/+Kli+MLXmRg9OoTxh+GrQOWQzURHCkRMv2hYTQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kuqXFq0t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC86B606A322
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 07:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC86B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kuqXFq0t
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc751eddf25so207646a12.3
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 23:40:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794210054; cv=none;
        d=google.com; s=arc-20260327;
        b=Jxj8LQ0lNa+w+qnomQbMLjN4C0NuEGzzxM0WZK0s0V5yQTQhSWNKZAdQCKS1/hRp4H
         95mS56CKyQfLsPUjqPHs5RfMaXRzUmTnHBQSpc70f2RlPKDeC2rcXKGfF/JLHpalEzWG
         zEaqly8LaPCuJDS6eBCXs9ypEtRyYzmEDUfX58YUfnpMLUoukaayugPd3nDXrcYL+m+9
         bLsVPB8evf0OLTncp+DqqeqceOYFatrosjixIQX798BY7GA03zumps08urAnknR8ZWqE
         qgDZoJ8cDIKO7YzdRJVh1rjKRqfCmums9gcDOIDjmL3TolhPs97ZsaYDptmhXbfbYGP4
         RxWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/QLOpX391Fwz82NJDNrzMApohUKRN/kTwsnVQ3ukXWY=;
        fh=lH3k5SEAbsF/jQTX73SRPIgiUWJBUXn7MgRccs9rszk=;
        b=i9NA2//RYOnIiE5JsaHxHr8JyT/GJbvWHa5qf0Y1lQAkIe4DeVs0Q8kk6IiUKQSYOJ
         I6RGSsje2eBCs/z5xKIAd9ny6QwGHwXW8CtgsPszQXrn9o8lZdEtbbVpBesngP5zkjgU
         wBgVOHfjXtdr0EdKViUBgK76i4GXGn/F9QzCZj+7eGZHY2z//bSghP7BCwWzDvcWEFTz
         iTUlQ8mqCC57FqhoGXmUqOXu7T2EsbHUnmM7Q1CEPFhTJ2dbZ6kBR9tutYnH6G+1MotA
         X86yFxyOYJMtKuzgzkRAoVbYkCn6KKGDfHZokv43sjDdbo+4DYqaIVACXkBVgAUWhk72
         L5kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794210054; x=1794814854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/QLOpX391Fwz82NJDNrzMApohUKRN/kTwsnVQ3ukXWY=;
        b=kuqXFq0tTl5JQVuMi2oPKq/Rlo+gmj7lWPiwPYQ7RU+83hnncGZImbuWX+2j1noK1S
         YO7mm7+mxOQaPTMSvTaoDByvjD9/o4rBarbJnMoN3TAOC7z1J1aaVRPCEOZmbwO+PBN5
         yjQeWe7Qit4Umtbzq26wiM+XyaFrFUTNmZmai6VRQcgpKZ7tIoFJnyRAocmjeQCpeZS4
         icS5bPqGV0YNeT6sum++goPqNsDKZjjrWXF9cpnwp2bEMMVcQYdihaPW1mytY+ZdVpCh
         iTJIEgGClbzYZ+uhpfOz4rFLETxumDOZh5oeBDUFCSDEHcA5NQMYV1Idy/F4iYX/fLY6
         KtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210054; x=1794814854;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/QLOpX391Fwz82NJDNrzMApohUKRN/kTwsnVQ3ukXWY=;
        b=VUkBbHZBdIJbXx3uvXPLVyte/LRYpmtFhPheGfgDde64VjAeVakWTFB4Yrzp6HBgbG
         eubzZhnasg7fEkKHsqv2MSozvleEYiUEPd8REeZQcbA+z4ZhoQjTX2t13T/sx/LQ0heD
         g/eStfxMCvr7FRgu90LmG4JyjZgYnnGRY67TpHcEa86aEAFgwLRA0K5OSV0Iju+Riocn
         QXsXBOnDie9FAZDF7R3xct7VzvHde/1iy9UBSfFpo1BbhAR+u7hdb05UtY/v56DRqSgu
         dhq+ywWQb1TOVGV49moPtm/yKC+uxa+LJ6wIe/clzN4qHoIdo0kDd0Jy/q+PmtIoC/G5
         JSvA==
X-Forwarded-Encrypted: i=1; AL+hErFUjvTWIupwlvRYyJh66EMeKvCq/NafP2Xydo4MaGQ2wgSC0aEfbXaQnDOLSBpg88MKh6FF7fQwPmSD@vger.kernel.org
X-Gm-Message-State: APuU4Z81BzgiFrPZNroLnluhu07jL8AooKtZWFM/R52sowfwP2Lt3AVw
	N+TBnBLbVof2tlSBHSRE6zIDLzCt4PePARDcUaC/698JYev9LXzeHyBfAzr4lpHoxvzOeKjF8pf
	PYmhA9BtXjpU4Y/LliXw1TkD3v2Fa9sY=
X-Gm-Gg: AYBFou1HzLFMlKsyKOtZGZV/THuNbnNEaUlKDBRXPpk9/BFP7Yx4kyw8UTRon+BkHD/
	msspkhs86kXnqQzOwFw0NSqOy6J875hS1upoGskOLEdsDtfs1FHjnO/TzCxSY5McnbNSB7uUUbg
	ZzIFPVjM9/x1mf2nIbN0iLUiWzVAVmh+8q52KRHszj6ArIsGhGclNqUHBJF0vCVohqkr7WRuhkF
	dj21i0sYQUM9drbHXgBzSoIJxhu0+4OlMP8DruWDWl9ZmGA3FE6KJTmic9Mrf0MZnXY6w5RHtZO
	D/SGxYSrt743/uUHwUqWQfMBh18U5508K/2/Nq4gvee5Bf4VwOKTHpXznVxkH1UFllavo87Kl/J
	K0/HLqy94i9r1vG5c+C96LgK5K/qpAPJuLyq1
X-Received: by 2002:a17:90b:2692:b0:3ab:2737:3393 with SMTP id
 98e67ed59e1d1-3b12d4e59famr3159700a91.40.1794210054212; Sun, 08 Nov 2026
 23:40:54 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105024106.338791-1-shengjiu.wang@oss.nxp.com>
 <20261105024106.338791-2-shengjiu.wang@oss.nxp.com> <20261106-savvy-invaluable-gaur-7af1b6@quoll>
 <CAA+D8AMxrUb-Pj74wrRn=vEyRUFKWWsR4Eq1LZ2ErsX=rRq=rA@mail.gmail.com> <80990ab6-5072-43a2-b829-177c956080c6@kernel.org>
In-Reply-To: <80990ab6-5072-43a2-b829-177c956080c6@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 9 Nov 2026 15:40:22 +0800
X-Gm-Features: AclHuK_S-BK2XU0WY_pNWrUm4vSuurn5YOkC4y9TAw4Ztjpw5amiTRF4mk36wDg
Message-ID: <CAA+D8AMt-_=XqABMoeUssasrmChJem7m=Oj+sLA6qnNORTZ+dA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: dsp: fsl,dsp: document debug reset control
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shengjiu.wang@nxp.com, daniel.baluta@nxp.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 3:29=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 09/11/2026 03:22, Shengjiu Wang wrote:
> > On Fri, Nov 6, 2026 at 8:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On Thu, Nov 05, 2026 at 10:41:03AM +0800, shengjiu.wang@oss.nxp.com wr=
ote:
> >>> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>>
> >>> The HiFi4 DSP provides a separate reset control for its debug logic.
> >>> Keep this reset deasserted so that an external debug agent can access
> >>> the DSP and perform debug operations.
> >>>
> >>> Also require the reset properties for the i.MX8ULP HiFi4 DSP.
> >>
> >> That's ABI break without explanation.
> >>
> >
> > The i.MX8ULP HiFi4 DSP has not been enabled upstream before. This serie=
s
> > adds the DSP node for the first time, so there should be no existing up=
stream
> > DT relying on this compatible without the reset properties.
>
> That does not change the fact that you break ABI, does it?
>

Yes, it changes the binding ABI. However, these reset controls are
required for the
 i.MX8ULP HiFi4 DSP to work correctly, so the existing binding is
incomplete without
 them. I will add this explanation to the commit message.

Best regards
Shengjiu Wang
