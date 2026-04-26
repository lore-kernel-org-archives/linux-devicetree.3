Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6F6274B5F
	for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 16:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777221872; cv=pass; b=K3Fy+HMFQlv5mURctLU4uTWWT7iXgNy/r2Cy0CZil742hLrg2HFiml6lmlcrURZiIY08wxKj6jV0JK6t41JeM/CYPBunXMfXH3EXCbgIZxmB2a8kBwJC344N6GwGw1SIowMUbgHDp3Su44KIRkxuYnDw3oR9m9EInbbm2hKbh0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777221872; c=relaxed/simple;
	bh=wmZ8Dpe7vWo4FjUXWm2XsIppLlcGoz8XQcj0Stb2G6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rF8uI+WL6XR8l1DTVv9R87qE5/Lg+Y6T+fsMH/eQUsemCYC27SPhZ9vTPCVZJKO2v4/cofE9aiASnnGMFl8NOu5zJtZooAZ5sKBUwl57Lht8B0lo/3TAT2OFuLm8JxApKuCQzbu8A0i8OZwDpkMYC22IVnj5SJuDnl1XtGfGtoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJ7sT9pP; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJ7sT9pP"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38def541b0bso81356931fa.1
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 09:44:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777221870; cv=none;
        d=google.com; s=arc-20240605;
        b=XZnHntSrFqtPOy06OW9JBucK3x8kLvBzLTkCmOlZ9FP/XP7QCQD8uOj7sptq9zIgnS
         DXH5PULZtVoeRdmaWC5B4uBmcZbX2Jeo0rHitNkCaOTXhVEp6+zGRCRNii0ptmJ3AiO2
         PPQmue0ZvmgN5G4K1hrpKEfidiKieqXauxYB+90C+BxLIUIYtojIgjRRIbRgpPBjj10r
         PtGNeLQ9BhBp778cY4AmQlXNc4YdTNWNHTodi8CRv+zC4rmIwBhE2tCFj63r0/NQxPfW
         AwFpWUC688c7/ZHkp6DdgikOH+nWnDaIvL84t+BQkmammMQ9kxhr10vSdBjqBMxRfcQT
         v3KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gF0s3Zdd9y3ounVULddivCvOaPAIz7AmO/Iu2YOKL5U=;
        fh=zkY8qPNiEF0JK36Fi79Bfdm7xo7sbEFIsxQjUsOJ/KY=;
        b=byPpAeUDAJUSa9xEFk+3Q8syp0s0D8XUlyPsV4JgdjCiJG73pzGLLgNIfEll2H9Gxg
         E+Xh/zKfX/wTjsD949aLdw70fORQf+FZGPFrCheQmoYhqms8Ypy/f0ESTzemNAEkaUvK
         y16ruspfpyyH/5RBDnSC1iRd13KmQfi0R6R0nZUwDsRGaLJh/XbZx2SZ76w1KpDb2QtV
         UmmUrSeQlFQkpXEYWgP85k7U5Pq5870R8bhe7zwWa4nsvOXoIxo3Y3X0642OY8HsFHd0
         X8dQWVZcy9w5HPAFwQw6Y6va3zLNYMzliVcPl4Rhni3GttD397pPL83uML/EnEJ6ywfA
         GGAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777221870; x=1777826670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gF0s3Zdd9y3ounVULddivCvOaPAIz7AmO/Iu2YOKL5U=;
        b=IJ7sT9pPKLTF/cuj5jo8WzqD7Z39d84p5lXTsOvGJMqGU7kULgw48akrtTjTgLj73F
         33tqlxYYESAr1tXmHcu3GuqM6PGEsKBAOjKt37GGk7OTl9yIMh8w5opKJMy5U3vEh8gS
         Pjc6tVvhK4ueLOIHvMOohqI4CPzwsmRHUYIBtT1MLAHo5gVTaPj5UQHbfwZFI7A8IqJO
         +QI2u0+9Iq5M5QYVl2ko2YlekqObn6X5ndmINJpwYDtHBgJCJLQGKuILDhOGNhoFEzTc
         kv1mZXnpVupMkbndC8VCEczPnaRi2UNXyig+Jp8YVZDNNQLpVcqEUZHNkqZn5IZ09M/+
         mPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777221870; x=1777826670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gF0s3Zdd9y3ounVULddivCvOaPAIz7AmO/Iu2YOKL5U=;
        b=LIjpaJviSkRGWDt/hvgCe3ony87/Ic9LO6Muiw3YjBRTPx7QBmckmlmWG4/txcpvVw
         LjB/JL6RNs1+IA3EQ4LKxqh0aiwqIA9KLtlFHkMItEhciTMhtMOkIhVsPI0xebgN2tEa
         m5VgUYHqdD16UhIzHVNRrMtUA053DsndisIMmfKT+fHjaiDh3J0Z8o6PAcxNJx9Aft1S
         f+YxySw9jHyDx3BtWcMwTybDPy+W2MmR6BA7STGfTDsqJMsAjhRuDQgKlM4Ya5IzkqFD
         lXPLYSkVPdTThd3SLRlhuKIyNBFfsTOO0x6QjBFY8x97lBLUr/JN6V3cGVI1ajJuYv3s
         dvvQ==
X-Forwarded-Encrypted: i=1; AFNElJ94EUFFAFfkB42F88ip//Xkca/5+KcInOAQ+vG13Hvdbagfrpl2WLKSoP6ddLGJKzK9HtoeShXjp1Fj@vger.kernel.org
X-Gm-Message-State: AOJu0YymrdTsuD7lq9JabXcKMboXZPNbWlSuaauI6LL0XUHqQ0pTYTi3
	xF39Pm9YyRVVHmOcf2LcbaoNqCEHV2WYuTQ6RVmO49fSRlxt133MLwjClZgfNKKSkZ04/DuKrE9
	LrDP0NbHwYI//uop27D/Tz4XIgdEKOYk=
X-Gm-Gg: AeBDievrxuwkdnBEFPDahXx5RhHsaWCbogPws1U2VffJKCiR8b+OUP/LZLPKpy4hNOz
	0ZD8use9oeta/Yo0+GEU0mahQiPEWnmCVL//UJI983E2I6cYJI5V3mouJxlIOdluz21l6t5P8Vi
	SQHkoffZxaX8QbK8G9VCHoCqNzZwP9+KqxkhooY2r69s9hbF35BDI86/2MyXB0cnfOWLyJN8sTl
	Sv0btNfTLSH+3rLBEKC7GQHBbRkMB9vaDjjfHaHeFG1nsJEtsMEHOlPg0dyq0bcVIKraxYzl6Wk
	TowtAjeVfPUbFGDTUj8bTMrtTOgfAK3mEODduloyKoKeW32kQtCS0l+GuZbM76ugYCc9kX1WjPs
	S2ZSX5gc/OnDfiw4=
X-Received: by 2002:a2e:8a9c:0:b0:38f:f6a2:a5dc with SMTP id
 38308e7fff4ca-38ff6a2a783mr88016101fa.32.1777221869275; Sun, 26 Apr 2026
 09:44:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422175910.1258579-1-piyushpatle228@gmail.com>
 <20260422175910.1258579-2-piyushpatle228@gmail.com> <78aa1551-2dc6-432d-9d44-ecef0198e1d3@baylibre.com>
In-Reply-To: <78aa1551-2dc6-432d-9d44-ecef0198e1d3@baylibre.com>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Sun, 26 Apr 2026 22:13:51 +0530
X-Gm-Features: AQROBzCaiysL2a2QMEYBOq53qTpzqm7ui1GlIeNHbpCurNM0rkHZyNxj2hgt9PE
Message-ID: <CAMB+xkaOc=y8t9VHSNKkRRxsxLR-Af_GonwiaY6Tmtapkabo0Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: iio: adc: avia-hx711: add avia,hx710b compatible
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Andreas Klinger <ak@it-klinger.de>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2026 at 9:58=E2=80=AFPM David Lechner <dlechner@baylibre.co=
m> wrote:
>
> On 4/22/26 12:59 PM, Piyush Patle wrote:
> > The HX710B shares the same two-wire interface as the HX711 but differs
> > in its channel and gain model: gain is fixed at 128 and the number of
> > trailing PD_SCK pulses selects the input channel rather than the gain.
> >
> > Add avia,hx710b to the compatible enum. Document the chip differences
> > in the description and add chip-specific supply properties (dvdd-supply=
,
> > vsup-supply) for the HX711, a rate-gpios property for the HX711 RATE
> > pin, and an allOf constraint that forbids HX711-only properties on
> > HX710B nodes. Clarify the clock-frequency description to reflect its
> > actual purpose: controlling the SCK bit-bang timing.
> >
> > Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
> > ---
> > Changes in v3:
> > - Drop the vref-supply mention from avdd-supply; no such binding
> >   property exists.
>
> Why is there no vref-supply?
>
> HX710B has a VREF pin for a reference voltage input.
>

In v4 I will add vref-supply as an HX710B property and update the
allOf block accordingly.

Regards,
Piyush Patle
