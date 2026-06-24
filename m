Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7500D364028
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 13:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782308674; cv=pass; b=iHN3pvJZwcW85+BQoG408RC4/Rio4rtVMW8IJ5b17Te/6Pn2jL9BgDtf686wKUauBC5QMlXoP5ZgqTA8uEh/2f+3BiKVWrxMbs9Dh/+knxav/Dg/Ds4aoQPaKmwId08hi1JuSlWmf4aPQqLqYwPbYwxCBdGYG04n/7PMJMDUUSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782308674; c=relaxed/simple;
	bh=4hmQpzJT1LFiuBCedVTY1IO9MEPmTIQMCZ1zdVhoFzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AUXlr0IFpFQRjLhzbUENgaIDqZjJeGCoCCNEdwEvMojD0xQOS4nKVniaASbcvMWxMMa8wgffv77Cx2vtXe5KyyYg1PNxYHB10NR27rggB8F++E6xkm9RanUXs0u2I07HFje0i6TCAZnO9Gcuo6WLOpwiZKjdzv/UWTIrXY6mqHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=KfwDRbJv; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="KfwDRbJv"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso10805615e9.3
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 06:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782308672; cv=none;
        d=google.com; s=arc-20240605;
        b=MtRvdKF/jMt0QBFOVIzx++bBQ3OjloKq8hPcAk2IznegaoIdz7aAyj8N5kcwCN1Z4r
         va7SgVA5N7XkeMxlp7W6QRONqZGpB/lfFo97GcYlkwSPt10bfEE0OeLQd3whAbIh7P8Q
         3xQO9B/VEu9nyLaCZG7WOl7iHT5rj236RmqaOnIT2aFNxZ/sel2NaX2hPFSTAuOtIacv
         g4pybf6SZbDLWY3Bi25QE7mUwkvBhV9w9Av9zHnwht5aG2z2x2L02fUvsiPwnHTOMppd
         zC8/p+7XtyExyrgls/RWjgvsSpy5LHLRLPrrdqw+qsznH/XPD21QKWExQ1Q6FRL9StCI
         W5lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4hmQpzJT1LFiuBCedVTY1IO9MEPmTIQMCZ1zdVhoFzY=;
        fh=PodFShO7v3N5AnU9h0v/GKgpol34w9NLAz3XxPfBY94=;
        b=V/RDf1r4Nsi2GOjDMO4rbWa/WizrY4eFcyQu+d0dTBrS27kP1fTfg1fPjF8pmGYXgU
         ek/EhKVPpLiAClNz97IuZJBMJdDt+rFGSTtEhr6qN5lcl9YTyF4zamM85FgA+WoLC9LG
         0XJmAmqn7y7mFjyvD+x2XpUviJ1u79kXMq6RcZzDVCEv8qVx3Ld4OkfVswTbpxZ3MJYW
         SgBeeneUvV4G+IUKKQ+abydu5xQugV1+pGruC2o7MqjaKYaeWPsOM3XcqdTVCeNOq2hi
         HNKwyGIUbHdqpMThS05TFMREqjEmBWiWPiMIM5UnGnaTObrfbLxmhstNDdNAEALApyM5
         spoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782308672; x=1782913472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hmQpzJT1LFiuBCedVTY1IO9MEPmTIQMCZ1zdVhoFzY=;
        b=KfwDRbJvBcKDt8Nlt5QHcOVyoaVnG7lSwpzYlHgsaZwctTnuNk/8j0CQhyW21n6IFF
         Yhh4GTksLUQsWqdSFlXQolbrWZ4HZ5a8RBQ0cQcQDHwu75Gflp/PL7BUGLf8TQMXNV62
         Eem7xW0K3yqxzUCj28M+ZuR7mkIAj4xfIH7BUyp+qIxKqFejcXEGl2yQO2LbTgNaVEMW
         odeTnjBr56GUPj/Tp0ragreDlKAgHPO17UmTmrSj8Ua0mFkVxSd01wxAp0799eYAq8C6
         RU9zosab0eCngr/aTgVdy6ulrJMgPq7pj2Cb1oXs/SD7Wc2ZMCY/i3aiTh6apP3Uhveb
         f88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782308672; x=1782913472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4hmQpzJT1LFiuBCedVTY1IO9MEPmTIQMCZ1zdVhoFzY=;
        b=mNBnVjnbXVKOwazLVX4n1WBMo5cn65Qw3gyARB+4eXc17ZRbly4aqa9Im3OBcf/e+0
         kQzaBVth9uBQt1NQ6YZJxnZGkFZvaf5bKJknrDTELD9v9HbVGBU1Os/VFeOP8Ryg5osp
         HV/dDnOSd1cePnqw+0CPuHyogoIH2ZmFzTuedDqDk1UG54BFHNXyheSYXrPHnGFhfimW
         9aN+AmYdK0Df+5L987GJpzJhsPtJCU/6Vi0+Fg230eDeD5kUgTm67jHXkNimduCCjFMv
         fLr/THmAINnXrIqba9Xrn0LsiGwkMahAO1I6mTALukgQ2RB2LGrNPTOd71wYZLSFVYS+
         YTtw==
X-Forwarded-Encrypted: i=1; AFNElJ8gJEq6Vu+HBUBmPOI7xdan1yH7TDN/7vowMU502fFYRy5pTOB2YxdWRpMo8ZnVW3PpYYeZlmF0LS54@vger.kernel.org
X-Gm-Message-State: AOJu0YyhkVySqQKnVFa7ryIXAufY7gr+CXXo+Y6S+4j8SeKDT1DBB++C
	PZdb4/GgojmydHo8ukgVA1aUhDJsuUtkc5LWIohXtvM1JkZRvvHD4hvCZAfPoJ829X7/OreWDFF
	v2OGPfd3hBO1c7Ko6d95EE2VEv8DGwIMCX6v65QoKog==
X-Gm-Gg: AfdE7cnkXg11VaI1sqxbly2JKAGDDXYYwWoH2ta/nf53e230ZTSZcyY+zNRo+ieBWdP
	1mGyv36w/ZTP49igl4rqF+rpkDJyBV9QO+eYY31TUXPD+IFYrALibFdMBb9LotEyEeQGw2XDpW2
	qxXjoV9ZflHjrgqquuL1GJHsxprkaQzqlQtmAIFCSDKsj5cL2AxBDfRvGHAGXrrFknVgRcga20b
	OEpKCHKqqyyIEBg+hkLzI43TxGUaQAQ0ZvjEQNnNjY1J5lGhBFi1uArGjMopdItuHHN9B4aT1Zx
	a1KEugPaA5pBQZAnTNc/Mi7U5+77YysQKhuggy17d5vUM6DK0ruiIp9BwA==
X-Received: by 2002:a05:600c:4ecb:b0:492:37b7:607a with SMTP id
 5b1f17b1804b1-492608796bemr50951345e9.31.1782308671484; Wed, 24 Jun 2026
 06:44:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782224059.git.gregoire.layet@9elements.com>
 <30aedaa9ffd5ba2d763d8802a07b77ef2d5bfcf0.1782224060.git.gregoire.layet@9elements.com>
 <20260624-copper-albatross-of-youth-6abae8@quoll>
In-Reply-To: <20260624-copper-albatross-of-youth-6abae8@quoll>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Wed, 24 Jun 2026 15:44:19 +0200
X-Gm-Features: AVVi8CevgRC28tg2RrmLdkUxp5ymSnVB-xqiyZURryTvD9U9Bz7rA-Yxg2vjrr0
Message-ID: <CAFi2wKY+JZZV5vKnKKO91Bk-903+HVKm2a6NF+fufri0r3EjCA@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] ARM: dts: aspeed: g6: Change vuart compatible
 string for ast2600
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

> Please start testing your patches. This for sure fails tests.
>
> It does not look like you tested the DTS against bindings. Please run
> 'make dtbs_check W=3D1' (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sou=
rces-with-the-devicetree-schema/
> for instructions).
> Maybe you need to update your dtschema and yamllint. Don't rely on
> distro packages for dtschema and be sure you are using the latest
> released dtschema.

You are right, I had tested my patches but wrongly. It is indeed failling.
I'm very sorry for that. Thank's for taking the time to explain.

Best regards,
Gr=C3=A9goire
