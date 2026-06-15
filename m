Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128613033CC
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 04:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781497616; cv=pass; b=Y71ETijZHyTyYfQNWly4nxye8y6fQ4FgSlEE27WfmQqvRUFk+kVkLNRclCxKBOr3cZF0k7kODrPEemKVFb3V5AqEKPteupoHh+QTOqyAKhm8OahVoUUQXw0A9nEWsJEzkpSpf1mvvXYf3jG1xojjzNylELf+eEUZNrlBXKh7D2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781497616; c=relaxed/simple;
	bh=Vl7IPQ+oCx/xUtiuiJtRzdKDCC/Kdl8GVNHYD3aF2bI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VDIdVVwCw4wp5Lw2LXMDLoHOwRUZTLZ4x53Kt/5e14f8b5ZnvHw8y8RFEEeNuq+AjF6IghiSyCptJBhOrPq0oJKZaoI1jvfnNlxpAwk9+UnGUDOox0RpZsS5xe9MHRpADp1mvRhi33oWFZXI6VGHyZBhXp4H7SXX0JkPUTNSlpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qC3ybLm5; arc=pass smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qC3ybLm5"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-6cfdce656bfso854210137.3
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781497614; cv=none;
        d=google.com; s=arc-20240605;
        b=a0FkK6dleZsh9QwQRJ+g8UdLJggKHL11dPV79fzllDbrKF3nTHJmkqG5ruoTDnWoZl
         FDAhnDEReZE0nk+nxCV9LRBJs4kgwRl4W6HCHmOQTK/W2hAAPtLxEtpGg/Dc9JbpiHXk
         NgLOPUXMLarxV59I5tv0RKx1/4FqIRzSOr+ccBGI+lmw8fjTxM4eDTTqgwnGNh97hBbu
         viuwA+1WXkobMu+NPOmAfrYZ1tsuFrqGF4rKylf1Mbki3UhsiOVlxZbgrYugONfvqnmL
         igsdmtl1L3t1Fa8JrTt9p/n4lFtpJrzgQt0OKn8xsx2Qwghz70zaBWNdMYHcZdRdGkwS
         xS4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R4Sf4+BSkjB0x/G1yuxp+2PybN4TRsjxfdrHzeKxLys=;
        fh=tQQoUUds6E1wHU0po6W8Wz7VSKpwjf8c4icQFHm3+wg=;
        b=irE8WV/lAVeLHqWAniiHXcB1Hp4TC5o2295uSP6aHTLTd4HAYROTj4vFmOn4Thhu0j
         6Bn1GflMbC5hCKJcbPGkb88bHQHhlPZ6tLZMlhvjxU1STxUEFeoy47IuLz6ic6nbDmZJ
         f2Md48u2Ncn4pAqQ6PzgNkS58x9jjFjxDNDH+yoKbK0Cs7vZvq71vrj6D9x6UyYcpEwP
         xs9lqfDrIwRk7XXBhBkPJ+PX976PpOnoSaKFFXaXd3S13ePmq9azXUR7c1uD22VBBQn/
         qRxlsgP00Z1l7PY5hLlUKrHAHTIB2WKivKAv4ceNpxthRPRH/ONOoLFxFtcV+dU/AQuH
         VCSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781497614; x=1782102414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4Sf4+BSkjB0x/G1yuxp+2PybN4TRsjxfdrHzeKxLys=;
        b=qC3ybLm5F9PrOi2nun2df7gsPh4hVQgUPEPCavKwEhWrlCeL7Fs8BscaqRwbT5EkU5
         MWpX9zxgKKMlDqXSpCoOoMcfdtOlM2/5olkBy4/SY9ksxZK+pJFygMAlDH5rcjKZUzgu
         js724BmjARXi3QayLC+4gqvwv7tFrsTcDQZFGqfyh0F3sb32TmE0abJJHa8/RGrPrY/h
         ooGV/QwxiJahi8luqhWot/2aNIolx2IlWQ7iIr0IjRdd96OLnygAXF1TgzYAt7wmWYei
         rxjKNcmsKzXLggXO5CxKFIy762v7VloyuOKmLZrnHZNcGNRM53OzLg8wQQ3/dkAwE/hU
         BdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781497614; x=1782102414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4Sf4+BSkjB0x/G1yuxp+2PybN4TRsjxfdrHzeKxLys=;
        b=ddWFXIoZ445BQWqoSGGLvdFeyIwiKFivGms9LNWbXGpJ2hsHFLN5fdvzECnLblxGdx
         PUxApEjcgLTiwmluDqTDNMfV6jlAvYuHxj/u2heTJwpell31e5S9lXg3PDYVdPhFRXF2
         DVCGH/oJyR4puz2yCAixe1cKijJ5trpTmcA8A56ksGN1CprFs4LhLEXUKAMBB3W7g1Bp
         Femx2DbQbl9DqEsAEgM9msbDPJ+apIytZG/K4x4duobHzIlNPZQvocN8gQOkcrjeo1df
         aThqiz1KPE6qEh5lcsUjCnCHhBEOcdsLhZjh7su29guTlfw3HYohn/lRMQrX92XkPYmu
         OFZA==
X-Forwarded-Encrypted: i=1; AFNElJ9/iTn4D+N335XQz251f2kx0KVBHrEqYWuS6tsx/kMi2JqvEIeDfsuQYDAns0mo2q840ZjtxzUIx0gW@vger.kernel.org
X-Gm-Message-State: AOJu0YzffNjTuZLQiMEL/ALuB3bBJ/EBk0k0sCd3B1BwNJGud1ED9atY
	xzGik9Of6GX4SbE9i5zLwkR+b1vkwKdi5sKo802ShfUhxYWKkJwArhYyoQt5MdcK+NkFifj1Jme
	Izl4FCsqfqr16kzNHWXgbdwVCox5XndE=
X-Gm-Gg: Acq92OHdK7apvKyXQNXzxdjXA0l8YGWJ91QcnkLc6hlKpoluISjFptWtSc+cwX8zfMb
	jxVD6GY+H+53TtYTPzH3Vki/xnYF2f2YkR8AWsqBlGsne1Voja4RImf5wEqKG+nZPj+ZfCUznIv
	75HThXkAsfHt4aq+z/I6hnWW3pka3bmRSqpJfYa9E2MBhueECiiN334acl4nXtUbll0MXvg6RHC
	Le7gON9iqvOT/GwWLvd506dpyhHlXqYlmYOyx0WCcnmCBBecX8icdoUM5FqK9E0nLJhzeuUmJHc
	zvG4Svsbg1LyO1OvBFbj6kz0QKu05r8C1PJJJx4=
X-Received: by 2002:a05:6102:3ec2:b0:650:9174:f3 with SMTP id
 ada2fe7eead31-71e88b5d470mr7178683137.12.1781497613922; Sun, 14 Jun 2026
 21:26:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com> <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
In-Reply-To: <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Mon, 15 Jun 2026 12:25:32 +0800
X-Gm-Features: AVVi8CeDmjxY205ZovrS3y0Uc7ZTFkv5R1e4COHN-snpVF8Qqejv_b1FwKnYlgU
Message-ID: <CAH2e8h5Swn2mWoz+t_nrSw1=hQttwi1Hx=dg=cd9S3QRnHjpSQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 5:18=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
> > Some devices (such as gaokun3) do not disable FIFO mode, causing the
> > driver to fallback to FIFO mode by default. However, these platforms
> > also support GSI mode, which is highly preferred for certain
> > peripherals like SPI touchscreens to improve performance.
> >
> > Introduce the "qcom,force-gsi-mode" device property to hint and force
> > the controller into GSI mode during initialization.
>
> Ideally, this should be decided by the SPI controller based on the
> requirements. Another option would be to prefer GSI for all transfers if
> it is available, ignoring the FIFO even if it is not disabled.
>

I have read reviews. Can we check if the compatible
"qcom,sm6350-gpi-dma" is in DT? If the gpi dma controller is
presented, then we enable GSI mode.

Best wishes,
Pengyu

> >
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
> >  drivers/spi/spi-geni-qcom.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
>
> --
> With best wishes
> Dmitry
