Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4192330C60D
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 21:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774301993; cv=pass; b=cp/VSRH0luxZZpZfOXZSoixMbYnVKnEZhSPWBlYvqWbjZYiv+vRpuSoOlV/2wayqIDmQ87TCRGjWEqmXr52UYw6qFQaJ0Hx0ohtm0ufvPy/R5YMLwejpCZB4zn51lbmVOdBq7owKBEv4pTZVQruAv3Id3DbigYXuRl5SJgmjB/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774301993; c=relaxed/simple;
	bh=6yc22CdzcKPHhtv1K0lLqEnKtQNK1gApls0Ms/xK9XA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FkCwX3gL7HpLTh5bBJM8ghdhwm2duiWfMmnho+4+MMQ0FhC9kvCgkMmE/aqSMh2SM2pkZ1huMU3cNtf+IHpGWPys3SqLiOoM5HAj8AsqOc+ZexL7e1ln4VZr28+zRODKfdCb5PurxGneqagRtiK32Dwy7QczhRgW0dAe3EPswB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=atGnjibS; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="atGnjibS"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b04fc8851cso6825005ad.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774301991; cv=none;
        d=google.com; s=arc-20240605;
        b=T5yRqPLg6RDiSAiZ3ps1JEvdoukiNvaJX29QBkOypclnD/JtcSvKluwGHTYf0sCe8I
         pnH9cBBKRiI3oqRFvu1k1xxBidMOeTEKiEUW/kyvoBoeafBtUtZnyO4IKVNBnOTmgF8B
         LKj6ItRgFZnVZLQe4awPpL/u/z4ugmLM0lKEH1yFuZFW2UtWYxlNdwcIgE2yZt26vCCr
         +tHg/1/AWF4e34nBUBXakegW/7el4MpUAyqUxkY8kCGS6ok4+cSt9EgakNuJFRoWInAP
         uATwtm1Mh4YdyXtkrLN/IylFCTjSUm0yXNnOgg9j4caIGZ6bFqA1Du0nvvnc8rt9ZRnj
         dQRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6yc22CdzcKPHhtv1K0lLqEnKtQNK1gApls0Ms/xK9XA=;
        fh=wOZJ0bx/Jr5PgUgvoHG9uJJwwzfJYWpw6PJc90qrtWM=;
        b=DKmyN3y3qJ7RQV57omkCRxZzaC5QdPyEJlF32yKXxhyj11yIKsy+sqbAS7KZComGOR
         BetOXe5IhR6wGANViniZyK9MWlQ6QsgIGxFsSLifJFdwC6CnIARCN+/qsW+0fxfa2qnw
         aJLYJJgz6bVavmApft47f/FY/h1i4SNj5ZfNp4VAOHrxuBrSpS1vG3fClkfp8JuUG0bN
         AygZSbYgsnhdSm58ILbSBhv8tEyjgM2DoBbzoY3w91+aB7esvTImuWgiggc0PrRWFJL1
         vF/OIR2tSSCN8OiK2e8q+saD7xX2cv6K4vj7eHCq6e9R220LYxOy+b3HcPMZgbqz7oQB
         rdXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1774301991; x=1774906791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yc22CdzcKPHhtv1K0lLqEnKtQNK1gApls0Ms/xK9XA=;
        b=atGnjibSaBMp8wtZ/QqcPP5ZUeIrx28FZNVoFZ5jjiwM9XhqMJH21XzLSPbC4m6WtE
         E5yI/ekHSPE81NeTJ7kGvo4eYuj4S68c8d8Bk1OtTBM7Xv0V/RkWm0Cwey//KU4p+THw
         wSWfNVnns3elZxa3zmNPmB+KRjFRMsSkSzOM7+JIghxCthFNUPaGTwgyIw6NjsvgC9+S
         sJwlyJhmjobg3RP0TnC8rkJSBbkt9nhOz/UvhMxz6JGewyamgNi6nXcG3jPXYa6TCxSk
         N8xnjfRAh+CPUGGjbQtdN6h+SjoEAX8XheIcUF87WCCGCvIRvnkgLr61QKHY08btOhqI
         2FCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774301991; x=1774906791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6yc22CdzcKPHhtv1K0lLqEnKtQNK1gApls0Ms/xK9XA=;
        b=jFoDh1qxhXM1T9e/snzPITXp6BBnPT2rOTEBvkuOIkT8K99BXpQ8ksaEzpAFV82I4K
         LKUZYXzfdn9M3sJ80hA543wENOvnwTm/QaZhos+j99mHOI8KLsaF5s/pHFh+gJMSt20I
         30myJakQOXSFrQKVKfQ3TvROpp1p0vwnKCz0ej+hDrVoFeqDXOzIhMdX1WGdJFq7EKAZ
         8MtS+YyITy5WjoSrZd0fPdZJ0vLI2p2vdz24wSg35nTTvU0TIVvwUQ9suMfGYQWc7bOn
         XztoOhz4RkGE6CitsK1am9crdKHv4nyVPLCPXXpuqpct140S+xFUtCn4UmO509yKmRuR
         K3XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaqZKNOmPDPcyG0B2h48oRvoiWDjl1fj7uat4MKif7nMw0zenMxIIuajqM05xarKa1Je5RhSO7w6bO@vger.kernel.org
X-Gm-Message-State: AOJu0YyeuNiXxq5V3uWem1vkgYaL00Jf6C6aGy+B4eA41759VrxT+X9d
	oH9CXjsk3m5nnPfex8xUIf2TU65KH+r1jQNMCmkFGVo4n9+tbSR5PVvuOnjlzQZCXubJHdEEoNQ
	k4MVkSSVYo3fPZbVqR88ckqy8ctSCPSs=
X-Gm-Gg: ATEYQzwS9dNoO/E6eCxwXmZhdf5Yo+Roxp9N3Sux/pYUvoLlRE+A4CRtKoZU+crmS1/
	s7i3RDHRGP90760t6G/oQYhUTqlyYGaNP3H/Zm1hNj50G7yvSJ4gVI5dSTJqodb4ECur/cupjiM
	CBfsnlWWJ5eMa4w518aqh4mv3aGXD6B8W4weRyp0Lt7xU0Iwa0Ilfl19XlcYsjS2UMuc5QS1kMI
	MFl7VPZM6rdvb+omBDNjcvSqix9Tq1rDDSWlw5QtoY71SATAxmKAElbhj/Hwju62VOSmZX93VY0
	FeWlqIz2nWufeKH2/riHAI/+nSr5140nmAVhl2fv
X-Received: by 2002:a17:903:283:b0:2b0:5bfc:8af4 with SMTP id
 d9443c01a7336-2b0827a4001mr128486395ad.34.1774301991602; Mon, 23 Mar 2026
 14:39:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323013408.429701-1-nick@khadas.com> <20260323013408.429701-2-nick@khadas.com>
 <20260323-saffron-cobra-of-perfection-731c8d@quoll>
In-Reply-To: <20260323-saffron-cobra-of-perfection-731c8d@quoll>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 23 Mar 2026 22:39:40 +0100
X-Gm-Features: AQROBzBHwpJgqdryfoMYgGeaKe0N_FLrFJ0DYVE2fe5meqjo8yYkKZdDC7I4VPA
Message-ID: <CAFBinCARQWQCjDFVyy3XOsae00KhcO2qpgLjH_r85cVxST6xtw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: iio: adc: amlogic,meson-saradc: add
 S4 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nick Xie <nick@khadas.com>, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, jic23@kernel.org, dlechner@baylibre.com, 
	andy@kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 8:53=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Mon, Mar 23, 2026 at 09:34:05AM +0800, Nick Xie wrote:
> > Add the compatible string for the SARADC (Successive Approximation
> > Register ADC) IP block found in the Amlogic Meson S4 SoC.
> >
> > There are no known differences between the SARADC on S4 and the one
> > on G12A. Therefore, it uses "amlogic,meson-g12a-saradc" as a proper
> > specific fallback.
>
> You should explain here why you are adding that comment.
What do you think about:
Also add a comment indicating that "amlogic,meson-saradc" must not be
used for new devices. It's a made up compatible string that does not
correspond to a specific hardware generation and is not used to match
any driver. For old devices we keep it as it's part of the ABI.
