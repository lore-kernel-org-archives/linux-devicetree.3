Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFBC39FCDC
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786346840; cv=pass; b=iYaS55F69BTYpuyl37Xewh0QuqExgKWn9OqcENoO2GffO/4HBGN4Q3JIjv3Hit1RSFbzSxjN0N4ErKPPuTK/7jeWFhMpnkXFyrgW4m9AiOpLxFEGWQAuPHaW/zylV44S8CR6IjK/QEV56tPhNfbITQrVqxDrZoX6Y0t4XLsAz2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786346840; c=relaxed/simple;
	bh=+DtkcWXpgSVoe05+cxu51zHZ9Mzah1+nKac2Hu8aixI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kg0jBZXnERaqXJNGZDZxrfCFVuAMJkyQz9I/Vlj4VRUU0zCgUygD4MifvHJ/pcaBoWuDvT4BqWPwPx/IuINpUzGMvfQLZUhfRQmsbUaRDqSmv1aal7pVYSl7NeCjnoWvUCDA69t3mT/q2+6TY3UamZgNMUMQK5+5rV+brFkJx4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjfczn5/; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjfczn5/"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-527e352a167so9048431cf.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 00:27:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786346838; cv=none;
        d=google.com; s=arc-20260327;
        b=hIhS3UxiKxnbakHg+tazzPasLbaxilyNCN3y3XWUZwKFWxfgknjr+wDOEwFjvrViks
         2+fY9Den5K1uBmCD4e4Kx01gt/eNjCZSZOuVkRD6GOGupO4mAy7kZi+ytyllklAjGl3H
         AuYU+tR1DAICGH7VyYEcuy7Pb1fodP5kw4hxVk7C41lwd97NGsl0nJxqcIgvOMeEXFOy
         yGlczfN3ZdnNil+xQo/c7EAHP/BO0lIwmIpsjMmy86FWIhvsKoiToQTwKGpVYLI3zWmP
         I/OrSJUeAa8Ev1ApgpqyT3OB/sRXFfjAgPrgUKLgnaB/W+JwtrMhwoR8XNKmo2V3xFOu
         OMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+DtkcWXpgSVoe05+cxu51zHZ9Mzah1+nKac2Hu8aixI=;
        fh=1PmKpRz0h9q8mS6DwGjXKl3hDjW3jDk+tklMx1xA13g=;
        b=dMGzNIYc6rObw8P8KTW6/zLdlik6/B+RKvJ1IyOdspBslxkNlDOKPp9SDSlOM7KqM5
         zD/3DiMQtNUM/dQZK//SXALh84JHGeHFqwOMoxCZPFWO6iOUxTE90DKGyUjL2xtRujA5
         g05EPo6oI9pXtxJ+LZ+XpvBzVP3u/cXZ/izzWwp6CPBptN3OhfG9sk3BVEcnI+FqOW06
         rCqHfVXaj9RhlyH3QvD8SCPJfl0/se4CkuMM3ODtN6rV/QxGKWmyD7tbdkVyBuLUjCEs
         Z7r5oYEkOLtVipq2VwBPNRL4mVnSZax1H2maHxTZA0wDDtfXZCJw86nqlR1ptLfjqnDP
         Vnnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786346838; x=1786951638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+DtkcWXpgSVoe05+cxu51zHZ9Mzah1+nKac2Hu8aixI=;
        b=fjfczn5/m3A9OTGOrEoQNFczrr3KaaLT4YBaQUDmrOylTOObyoch9+VHPD8I4Rab6x
         Z9IlJ8sfYXoF8a1qbkZThAfApSj2mUSRGJr2T5Ydrh/njP8m2tj+B2aT0JlvPAZwCOEm
         xSxH96g+oBwIOzMzlujcPzhRzIWKga4TFloDkgwMnZbX3gYznELVdSRIdVH0hyaPAt7a
         MPgl6aUmqY8HX2ysJ/P8LmC+ChDAJhccLlt0wepFgEV8K6726l0jRzGZJGkgCLeQReI8
         fr+QNxo7/NiLmtK+cwGlZRJYHQnPUwF0J0H8Znwbhl4p1IG32rIiRjqlbQdJSF/2DSFy
         aIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786346838; x=1786951638;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+DtkcWXpgSVoe05+cxu51zHZ9Mzah1+nKac2Hu8aixI=;
        b=A04DJYdbNhtSq+pMKTUzQLUtTInyEUOvsLGFMDz8uHVV5MkOuRCWJDvS5X3rY32XSc
         yyeN4rmJ0eIXMR2MEowyBh6uZky3Kfc7bdthLkFbgYgliR0EQxmjiA8/Nr3xnPXqEBL3
         pLSrZ5XWMnNblUyGf2MrzbwyL8XsDLYX+QTronHwhCnsWIx7nwdHJqxamP3Oa1TAUpBM
         EL38/uOqFLjs1XPnUGDTxmmMNoHgSOj90DC9sCsnNbnOB8VvLSMbgLJoq7jrzEbIrGVJ
         ewW6pDJI7czCGSwXuudlzxt5XSE/5if0wB4XpMx2GcA35m0Z8dU521tNaszG979u3yx+
         XNLw==
X-Forwarded-Encrypted: i=1; AHgh+RrtciYmay53rS2yeMZR5M6l9apwLK2PsD+E2iXseQvx71GMkYMEPJkheWIXm6xM9DECbUckqTNLRR1S@vger.kernel.org
X-Gm-Message-State: AOJu0YwfIyCt0AQ7sAFU7y9h0Mg59DZEIRK4aMSlMlv5sUOQS1PMJNbB
	PoHNThRvpj5vOOEHkWCA6q2tt5EJDOi8h6dD91fCwAqPPF5PK1g7x/TQHkpF/8vJe/V/KY9IDlo
	0vMvJ6GZw8Xo+Bij9pSStqX5LDwx4Ldc=
X-Gm-Gg: AR+sD11DTZTLYhiA9TA25OHCrQ55oPaWv5GPqfoq34Qa+6XYlBqREcSxVJuYd9jSgOW
	B8DYVMGcr+zBTH/IR0uBPsdPb0Bqpo5Ba1PZV+rVrzfdIOD6N0XypPZE03PJxksoEIEj42ABTAt
	quGbvpLRCvHV9O68EsFn+uwMAEVrSJ71fifcpu9U1OZNxxHxZoNLmnpjIxybwVqv/GS4WTSxI0K
	YvbXUYs37oWDMFeGmBOKUDqEvlNPSh3v9Wjx/GeKsfIRtmimTfzhGL87NwNKPFgrAuDJI9LHD21
	V3JvQULHj/mpKb5q7r43vYePOHqBanKlabkCLZ6yqg==
X-Received: by 2002:a05:622a:2b4e:b0:51c:17cd:1fd4 with SMTP id
 d75a77b69052e-52ce622aad1mr426354311cf.41.1786346837843; Mon, 10 Aug 2026
 00:27:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1786262697.git.naseefkm@gmail.com> <CAD++jLkpcQkdN5DgCp61OANFhodoQyAUAb2WF4CyNYv=0xVsyQ@mail.gmail.com>
In-Reply-To: <CAD++jLkpcQkdN5DgCp61OANFhodoQyAUAb2WF4CyNYv=0xVsyQ@mail.gmail.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 10 Aug 2026 09:27:04 +0200
X-Gm-Features: AUfX_mxJ04kaXTJmP1OVrdQLPid7YkYxdoDRvjl11jvmxSghogHNPP37XYst2dw
Message-ID: <CA+_ehUwO0WEiDGE18a=v=ZjJhpZB_KVP=m-Cog7K9Cm-zZV6EQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: airoha: add EcoNet EN7528 pin controller support
To: Linus Walleij <linusw@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>, linux-gpio@vger.kernel.org, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il giorno lun 10 ago 2026 alle ore 09:23 Linus Walleij
<linusw@kernel.org> ha scritto:
>
> Hi Ahmed,
>
> thanks for your patches!
>
> On Sun, Aug 9, 2026 at 10:05=E2=80=AFAM Ahmed Naseef <naseefkm@gmail.com>=
 wrote:
>
> > The series is based on linux-pinctrl/for-next, as it depends on the
> > per-SoC driver split and on the CHIP SCU lookup by "airoha,chip-scu"
> > phandle that landed there.
>
> If we can get a speedy review on these patches I don't mind merging
> them for v7.3 already, it's nice to get some movement on all the
> nice Airoha silicon.
>

Hi Linus,

I wonder if the same speed treatment can be done also for the clock driver =
and
also dts?
There are a few patch there that are currently blocking usb phy and pcie...
