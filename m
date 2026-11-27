Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795758667;
	b=FDWURzR6j4phBFZ5ucCb00yOu1hc1xnI5GmTNYmMlfhj0FmbNm2Y2DZm11hxUqjHEYQz
	 QCfI980Sy+jnkK/+ydCZy/MVYWmq840dU9JqR9m7gq/UgSwd2Fzw21qgP1jxAUJpWLuiX
	 r/L8Ms5clG55pWbRidhezdoJCbmdcaNuJu7bN5WNBzDmsIZnMZyQv6j5kc9dYcn2nY3ZF
	 uedwEdVvpv36evpx2y1bEz/IaWxBGPi4B3Bj9MzjkqAluGVPon6OVRlzDR+1lfxb+51U/
	 QDqiSum6gEPq8DtWOZ8r5mPOTJE1Zw857UMP0DiEh9NCV3xLkdKHkG20N66Qo+8LjHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BkYBrOVOkkEfmCGGQQnGpXrXRuB9vT/FlGYKiBKIwm4=;
	b=IrmmDm0mS1rUvOR0OGtaZ4GtDKu37+ggXe8axOPXH0dnWOrqJouTB54jdivTjmxezQyS
	 +GPNgj0VtkinyyFIsDtVi4dBskBMI/4RcEthlK2/zdjnTnoDSqWR9qa1eXRlA7UBswDIc
	 VBajbCvdMYqGOUY9SfPOGaXYGHwvZj8CUWtZs4VXmTzFsnJH3Xq0q0MWqdiMQZ369snNO
	 MMesaRmFegJDr5rALkErfRfbpQMcBn9x82jgaBNmYRelvh+obr0CIBs2Dg2Vo2Yj6zSxO
	 ojAMKA6InGcwu7m43O+qalrKXiIGD0W8KErT8Ixxav+Dl4g5eLodzb9Y1CCPy9sTCjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=miH4cTYX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C15606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3C15606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=miH4cTYX
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so1388853566b.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 21:51:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795758665; cv=none;
        d=google.com; s=arc-20260327;
        b=JhmmluQCbJ6eKKm+WFco4sX/TyMzM2vm40IpGbv3sPbHSbxAURHpzfEVR4XUrIVpMX
         Q2EOEwaukzYzcgL3Q55Sw+EDe4e+ajNASC72cu3+w0TpWUJez8/NZ85QrFYyNO1RacPD
         LDOLd5wAi0nhidRTBBG1NUblte/rwisPEMXuPJi+qlqaZFterklMVjgZGwpCD2F1eNFH
         3CUBSGyhERxAGL4YE09uwptsf93rqGZbBv8dPuHJkpT832BqINbcBu31F/UlLcOh6Xjs
         8JBWMAj6i3TA4HYslT/CyPMjpFQnDXGvfkYOFIwxBGDL+ke7+uM67Z9xAMe/vbJeNbx3
         8xYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BkYBrOVOkkEfmCGGQQnGpXrXRuB9vT/FlGYKiBKIwm4=;
        fh=JQ56Mma1yXEpKe9KrUHOmF1l6QjSnsCNDPlwr9aogBM=;
        b=LtEnn7XVzqaTGIgeUQBjC3BuIuA38CcDuARf10wqFwB0qg1672MoMILeUaz6rXURbE
         niBgj6P7OVDOGyn5Eb/KBuFNtok/DfMBjufdRbCgs9VqIU4zT4Kdbe1PX/yKL7SYe5Jw
         CQGR7dUoNX3UoYArwn4Cm3FT3IF4kn3PgkhHxyKXSLi3WPVKPfC1zZirq9cTg6+5nNKi
         XRk4RqXVVyrHA+7ReOFyBIJ6oIp8smhAONGCgm+UU1sb5v/Jb3CcOY2jLKmI2LVEv54l
         wEkAUqfxKE5HodJ1F+J9nS8eDyfJcoscV1DVzne2btal+GrLsnpYPEI1LmB+ds+NIkOt
         Z6HA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795758665; x=1796363465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BkYBrOVOkkEfmCGGQQnGpXrXRuB9vT/FlGYKiBKIwm4=;
        b=miH4cTYX54sXO2jYu/uMu1whQzZUf7gPVSyY9T71kJB+PiiEzn6y8qqGN35Hrk3stV
         LgfF4+zRUIvVYfTFbqeyJRxrlsxJfIv1nxqr9GAGnRuaS0s2TA4Qd53bGT3jmc4OAuaX
         wNzT2eieEXCXFE0Iyhq2qoEFjFdATXaRs/0DYAxvNpZ+s9nW6atr8pkbQ2uHuwXY7MNn
         nYHY/qKkg6HSTjqy5CmNyMAVtwiKoo58ZW+bBQpB4V05iy8+g1YMgtU/RAKyQ78nctQE
         hkb9hDSTfVebr8iYtFwK8CtYGZBO7L3oBt77blnucxZw5ermaGC+Z6eXsvavm5jDZRnC
         tYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795758665; x=1796363465;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkYBrOVOkkEfmCGGQQnGpXrXRuB9vT/FlGYKiBKIwm4=;
        b=t72CeIQ3Kx72TsVhdcJmAA/UEEGHjVvr+4ssnX3G1SU6WlRf5IosK5GGTsx7CijfLt
         Nm62YjXQ8wvE+xHQSVoH6KANeOcRk00Zo3/mu9EbUIwz4/GYMHZ2XlsgL6JlEEoYkWtD
         WOA1ilRt2suIrq193SUC2f802mvmL6cBCT7dcxrCss8Bz/S6iqegFccIKGZ8kg7b1Xte
         rUM9q68NCd/Wv+FkPolzYbXTn80kZKM0BV2S5290X7lxPVZB0PxlbhP0VkI1VxIFYTM3
         fMMeApqalGMxDFUUB1KSOIdxFtpB2m8qM6Z4gPhKb3VJwLRv1vYypeJF8BkCUBv2ocfE
         i6HQ==
X-Forwarded-Encrypted: i=1; AL+hErGWsd2i0imMBscQhhY4h4jyYS1P4zuYAGNGZ9EDiQJquu7LPsLgzilkbLC8GoCltCul+GKbwhOZ6mc4@vger.kernel.org
X-Gm-Message-State: APuU4Z/8675MQQ3F6CDGrki8CMOs+EaATHHwHzHNtcoVtiVwUykA/DuH
	TuMU4oWBsGRmCqioS3XmW1V6cdM8mRTOm28pOiQV62QcHckK9KqmcVRVraSDfBW1LQ8Y43q88FY
	u/bMOOtdsktKQk8iwiNcBBpalO2bMoSU=
X-Gm-Gg: AZFdTZf9gEtyCuj16qs9pcHg7OKcpEmw5N7CfVTvO+7EajQT/ns4CpXJR1hbbFi04M+
	/Y5TNPhTfyFiSbef0iN+orZZX2F4hyM4/cZSLMcYF+AWiZdEMWy17vN63ljoVARHRRvMNTaxgYy
	2VMveDQCrexXlWqbAvBs3uP14kLwwolBRr2cgl89jN3tyhsYpzTWtVHTzZEmXJyQUfu8QhzvPV2
	p6AVsSlXX1qVxIY4jvvOtZfGyzdBFp7C5BwrHgnd6ul2lFxYWYkvAMTkSiW/GmXhXqcARVYwrDN
	CmOGs9S6b7kn20pPTn5+oVNiwRw5dfb47urJzom2qLTgoCIxIfrkhzneohvymWdtBKelDKQe5OG
	xuPScrbqa8c4sVl4Oua4QSUW5M81E/wtBzD4=
X-Received: by 2002:a17:906:1553:b0:c50:576f:b39e with SMTP id
 a640c23a62f3a-c513ab0cf13mr1274661966b.26.1795758664865; Thu, 26 Nov 2026
 21:51:04 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126160102.52163-1-dinesh.v@adlinktech.com>
 <20261126160102.52163-3-dinesh.v@adlinktech.com> <e281de75-7294-4f7c-a570-d51cceb70c24@kernel.org>
In-Reply-To: <e281de75-7294-4f7c-a570-d51cceb70c24@kernel.org>
From: Dinesh Kumar <dineshkumarv85@gmail.com>
Date: Fri, 27 Nov 2026 11:20:53 +0530
X-Gm-Features: Aa3M54qZ7qETuPSsSaydI_K7kgRHcYJbzNWIkAB1COl4VYnvMvXjxJvC7-etm4w
Message-ID: <CAG4v1_AT6kMjExcy+L7edXwnFVrJjjjEBC19FDaJyytAXU775Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank.Li@nxp.com, robh@kernel.org, conor.dooley@microchip.com, 
	s.hauer@pengutronix.de, daniel.baluta@nxp.com, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@pengutronix.de, festevam@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof

On Fri, Nov 27, 2026 at 7:10=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 26/11/2026 17:01, dineshkumarv85@gmail.com wrote:
> > From: Dinesh kumar v <dineshkumarv85@gmail.com>
> >
> > Document the ADLINK LEC-iMX95 board compatibles.
>
> Looks confusing with the actual board. SMARC is often the actual module
> and here you claim board is LEC-IMX95, then what is ipi-smarc?
>
> Explain here hardware briefly.
>
>
> Best regards,
> Krzysztof

Thanks for reviewing, and sorry for the confusion. To clarify the hardware:

 - ADLINK LEC-iMX95 is a SMARC 2.1 computer-on-module based on the NXP
i.MX95 application processor.

 - I-Pi SMARC Plus is the ADLINK carrier board that hosts the LEC-iMX95 mod=
ule.

 - adlink,lec-imx95 identifies the module, while
adlink,lec-imx95-ipi-smarc identifies the LEC-iMX95 module mounted on
the I-Pi SMARC Plus carrier board.

The Device Tree files are split accordingly:

 - imx95-lec.dtsi describes the module hardware.

 - imx95-lec-ipi-smarc.dts describes the I-Pi SMARC Plus carrier board
and includes the module description.

I will clarify this distinction in the commit message and Device Tree
binding description in the next revision.

Best regards,
Dinesh
