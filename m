Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D201EEA31
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774498487; cv=pass; b=Jzwv02Z3LORah3W6ECywPvoYSw02VLZHXNVvAP7bsGiHn+hQCR1vYwIQYqQ4y2FjA5yreqnn8F3CAHXc4LOwbpAqaB7ei+aouqJaO6UIz2nGuodg0ZODtIDUNbzXlQxmvltgTra7t00xOuyYmmGDNHLC8cVY4MDqsBF50CmuBuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774498487; c=relaxed/simple;
	bh=owa56jocMLMvuyeJMM3jD6PdCbE39qZHbdTyaFvtmfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sfm8Lj8GLo9tuJJ51x10SdFUT+WUapqC4ERIw88omuy+yw5fJgaUR5dfyBaxMso8Obg5CEwNwzhoT0bYVNQrm42ZQE/GbZa6M7B3ZJGZdXWM1dZJurlAotYRyHzn/hwz5zB2rDt9aR++jYvXf35UKv8N6UAEYmT1PAo/8PR5Zmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hJKcT9Bf; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hJKcT9Bf"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a27eb8311bso713489e87.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 21:14:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774498484; cv=none;
        d=google.com; s=arc-20240605;
        b=YloNFgJFmrPilv4GO6TjXgeiEI8/YqmTgEqhfDR9cpACMaeYZ8qLl5XlfHU204BVdH
         sP6CbfUrfkOKj/USnrU/+nJ5eeGJijaUQ1o2ArtltuKFkoQ2WnOFW6bAufoLSC4QNv9a
         q3Oqgtn9E7xbkwuDdiQEEVKLFi9ScMlsaVf48IcgSyjOKo2D2LsWWEF5Jje+gLl2Rz1m
         S3UB3+RlufJ567vlZ13gJ00p62Bo/9RdWkwYim8yvH6dIdeO0EqfpatZ1XpnkylxR+Sr
         /L5aEbl/0VvJgyD1ohABv1EyxoTcDVwui4jAW0vvArKJx1AKveVz90/tEHpKn94p1ciR
         JU4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=de7JHH7k1zqX8/9oU7ziLibktmb15IDmP+4qbS9sqKo=;
        fh=EOVNWZXt8rHziXCBMJHTRxKi/7Ke2tT8+L+dLIxkfl0=;
        b=jm99Dc4dH9mpNaAp7u8H+KuCb71w1H3Rl5NpYaAf8nhgp6+jEiHmDfK5XIhOTSJSwx
         tWOZIikr9+CRb77s2pSqKlHxwRibWepuE6uLIXFmqGlHe0SP0cnUOFzuzR8yykuNSffd
         WqUs5x7x+/mePds2tpbZZGkCJe1nYklK5BD0dgDUZlM6yhaXCsV6BnGTLh35uguolbjt
         cE5+c9gZa6VJYVr/zvNW3BmR7c2HkeKJpgq46AYl4QHY+D/9cox20LVxmr9c2zrDD1xu
         BVxAOhpy5BidfDHFIlA46ccICPZSROJJE27IOJlRE+uTbNWiS4O/WcZDkQxVTulyWtsE
         iIJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774498484; x=1775103284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=de7JHH7k1zqX8/9oU7ziLibktmb15IDmP+4qbS9sqKo=;
        b=hJKcT9Bfv4iQkhM2OqF6pQVj+AhrysuDmkEmOCwyM7lsUbG58LpEt+lX2kmB2NtHtB
         ilKg1MxLhtn0HXkzAEz8znr13hhng74ZDa3ZWaAV78yY5B8EY5oejLplpGJeCP3kx6ce
         3yEP7ohfGV1LSryOLy1kr1CqWqqSX39Nr906Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774498484; x=1775103284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=de7JHH7k1zqX8/9oU7ziLibktmb15IDmP+4qbS9sqKo=;
        b=IimMDz4Cii+AcVnHntZTNBoSZDPAbSikRlPbm88I7q5PijPOodFy9j7joHnHgCukHo
         haZbBO7+Aep0OLO8hVcy5keJLRJ06G9tIUzwwIM9Fmm7XlBtKwE97V8kR621ZhCxEFp5
         WwpBJnrP2uRKM4ZeVX+GBy2uDgYT6kYRaXujPPjQQPjgg2ZAR/Owjz7nsFp13nO/pp9K
         yLnmujCBnxdr6rycn4tXjftmEjH6EFXBMf5bz6lcaPmw0ckypGtU70UMV7z+TsXoTj31
         SGh65rkKHsJYYcEYdzxOln++l1kXlV8oHIeD6G0xB4pCUlM2rv3YiZ+l1EIsZLApPlLP
         ukRA==
X-Forwarded-Encrypted: i=1; AJvYcCVCHJtMVA7jKaKxT6DHr0euJJxC6nhZgAJJQrjSBUL0D8Hhe4kUitDxCvNp1gaghsRCOn+e97NHIkG2@vger.kernel.org
X-Gm-Message-State: AOJu0YwxcuvbUzmQmSvQrErinR1UWxqtv0KMOEV5vUsjhS5+q/cfK4J9
	13KN3jMcSRw1mJ0bfH+p1Lkbk+mZfSSlu5ossXZJNwX9mUfWOiWqT8rqcd4+K8oQLmtwnokl1G4
	3gl9GCm8xcrFZFSjtEYVSUivcHob54S2/JY8k7Y1E5/LKCy3jeb1e5Q==
X-Gm-Gg: ATEYQzwkoXfvBpqBp/JL7zmuGw0AZDEA6zLDuoI6gBEqMCNAdTQ3yPYwBJusI/Stqad
	dmOK6aH/9EvZfF3ACP+GPZTianqSu/at9hnSXFxewRw1E1TtpA1tXLWgVBSvJHSPWbqKXYjdxZr
	AtbPCcxR8oRu4UdbJZ/ME4RfpfyJhjg6cm4Epb8bzT9iUCV5rAQ/phUCMuG9ztmm7EMkFyUisLv
	EvbWk3jBL+x+0X2/GIfM2qNKHfMO0Je+CcChuAVSMuD5WAGAy+6TU/uOP0+TG/R3ocVwbHNLU5u
	3V1UzTn+IPhYKeiPY5JUVixDHj326T5Uui3LdA==
X-Received: by 2002:a05:6512:3ca0:b0:59e:65ff:e57e with SMTP id
 2adb3069b0e04-5a29b976b9fmr2386806e87.12.1774498483909; Wed, 25 Mar 2026
 21:14:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324053030.4077453-1-wenst@chromium.org> <20260324053030.4077453-2-wenst@chromium.org>
 <20260325-uncovered-carp-of-inquire-8a7acf@quoll> <32638731-8f33-4203-9e68-1170cff99280@sirena.org.uk>
In-Reply-To: <32638731-8f33-4203-9e68-1170cff99280@sirena.org.uk>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Mar 2026 12:14:32 +0800
X-Gm-Features: AQROBzDMA30fJWTvgwWnvWVXSov1HJF2nrcMqAj-rcI0Dx_RnI-WKxTXLlei1no
Message-ID: <CAGXv+5Fo2GmvWQGogA-KTsFChE0-SOwWek6BQ+ZA3xaXup_z+A@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] regulator: dt-bindings: mt6315: Add regulator supplies
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 12:55=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, Mar 25, 2026 at 09:56:00AM +0100, Krzysztof Kozlowski wrote:
> > On Tue, Mar 24, 2026 at 01:30:28PM +0800, Chen-Yu Tsai wrote:
>
> > > +      pvdd4-supply:
> > > +        description: Supply for vbuck4
>
> > These all look per-regulator supplies, so I think they should be in eac=
h
> > regulator node (see also regulator.yaml).
>
> > Or in top-level, but not in "regulators" node. The regulators is only
> > wrapping node for children.
>
> > I wonder what should be our preference - have supplies per regulator or
> > in top-level node. @Mark, any preference from your side?
>
> The top level, so people can figure out where to describe supplies
> without having to read the bindings so much - the supplies go into the
> chip, even if they're distributed within it.

OK. What about the more complicated mfd PMICs? We already added
*-supplies for the regulator side of these PMICs in

  - regulator/mediatek,mt6358-regulator.yaml
  - regulator/mediatek,mt6363-regulator.yaml

And my other series for the MT6359 also adds them in this manner.


Thanks
ChenYu
