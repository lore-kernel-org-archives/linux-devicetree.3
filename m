Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B866B3F165C
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782721788; cv=pass; b=b+fSZ+KVuvmxltUXOQsAHZc50A234DxyR/dyP20X/2aAfzS5A+Akknbu1hcStdvNyQEO+TPXTAJ5snm1oluOVssYIf9idt3b87jTloomey54Kqlmcel0giueJ+RCt4a8FtZLr4Qu2hF/ykwp3sTsB4e6ypbG4WZoFc4C0KFQwCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782721788; c=relaxed/simple;
	bh=CQk3EhYxqTA9sSVEy1cSFKfxi+PZ6VIeCkzzbrNRYs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BfVwhM4OcKD2q7UxB1KR8Yx5/5EvyfktJ3wTXJvHhyCIER7R4js5r7sHnP70NVjIULvC2cWQNZDLb5H6uor7vpRaNOBSzKWM21tm7uZx551L5fn4MRw5XyF8N1L5U+U4WyBQ7d09ZUgfUTfX12ODyF9QH/xcpWPsWGCicBnB+Oc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ByJhpFj0; arc=pass smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ByJhpFj0"
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-c127a694ccbso24498066b.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 01:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782721784; cv=none;
        d=google.com; s=arc-20260327;
        b=ZNRJ/CP02E/I832zvQLGE8s3Ug3u2+RITc0QPsff4kGpshDKtY1WgKYfVZDMmMwBa2
         EF8GkW3cMmC44bwKcb4Q4Mfjl5bqbqdMuuLLgZa3NOfcD7fnqC4V/BeCoUruQlejZgVh
         U1ttIRV3kb96aY/GJQtBXzSXqSrgeZglUZzGhSr08Q4xhcjWvIBl2n9ibvgZUYJsljl0
         xVtdmJqVIoKcSbNzERGqMcq+0ZbmqiHouFkYGRyGpMGNaLjDSMMhB7H2Q23d36897whO
         +Joh0ynIhBiAeUuRBGK4jj5ziIkOUImrUI0mcQ0GdeEDbCOyJbSXQgOCug+e+RjX1GqO
         Iytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CQk3EhYxqTA9sSVEy1cSFKfxi+PZ6VIeCkzzbrNRYs4=;
        fh=BvyQMo/dkj6UQM//rba03/XUPriKCrp0do4F1ZZbYVE=;
        b=piUjZ6lyo98rhQP5lQ3rjf4lBzsSR9dwVzoLpaZTfi/OpWLfQ8/i08zXcZUIBjEuk7
         SPCCZsfm9goAgaMHrO7D6solpbnXM3sj5erawmw2sBlUyTMn+nifsiwtbPvWrJ7sqlfz
         6YoQR5Fq4eDr5SaDtZUrWAx+yLlN+1hCkG7b/KjmcFkQISOpgkSzIkwSG6mQAbcExeAI
         O81n/HzFFFV9eeFkGzTrorGFWF7vvqVQR9HlBWwLcSWR3jqZ3dLsLU3O/CsVZ5v0B0Uy
         YoLzTogkobzoKyx1ItbsbDP9CtDFyBXjCF1VhyiYyqZPJ/tOWQe4xSzXA9uuHPJdZAdq
         jKEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782721784; x=1783326584; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQk3EhYxqTA9sSVEy1cSFKfxi+PZ6VIeCkzzbrNRYs4=;
        b=ByJhpFj0HT+29tEs2d9+Zpm7LimN/eJRzFnDrj2XYoGIzTOQSFnB1LegCyOdlYzkVt
         T3s689UmeELZ5bi4a86dWcsABJotIU5IX3O+C4GyqFmt32E+qLMQZbPJeYlh0jgI0zlo
         GK5lCCYBsC/NCSirMz/uKzPcu6T7JBbo7ZwR72XskNCU1cwGORj2cSCPWo0W144WTEHL
         pc5FlGAS/R/O+CtuFqX7qz/TbGjIuWy3iTnwZ31++IgsMTPTies0xYi7nrd9/5iQ01+t
         HEHC0urt2t9+GM8izxgNaaSI+tG83e4jza7s9VtICqDeS6gJUzuFgF1omGEMgNdqct6b
         aiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782721784; x=1783326584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CQk3EhYxqTA9sSVEy1cSFKfxi+PZ6VIeCkzzbrNRYs4=;
        b=JZ8DwjHf6NYfHvGDFUHuMW6byaLl959VEVknME5r9z1p+5xM3DOJzwJu4QI8S9AQOu
         +ryBDvUD1gRR+gx5XHD+5R7JUAaxtbwFoL/VllLSiDqxzVsbWimrElvm1qU906nGBtyf
         Q6deQXTgN+xUyMk8gCwxcqcLuEGFs/3aoOxI8uWEvY1/HBAV4YvPcK4xi3rDkhwSdUBQ
         D9Zy7upgolxMTw1RznBfCDf+WP1PUyz3n+faPBfPK/Hs87yQt641vMTTqc1FX4zeD8C0
         3nfdZ0po7iGHhySgLLexuRdq+Ij8jDwukvGc1lfSFGk40hr2XQpp3gRJBNqgXGuBPW0v
         /gRQ==
X-Forwarded-Encrypted: i=1; AHgh+RoAnOxCjO2+Uk5PKX0ayiqsd3Yr7mSEGYpovsnTvelPqbPduBc34zdnG1zA3YLOyURfJzuGeLt7hAMI@vger.kernel.org
X-Gm-Message-State: AOJu0YyLqkRIponPNWoR2caY8lI0z9eRl7S5RJmemP3hVqawP+djOSCO
	8tQR0wudTTObJdzspG+zOXoKZJuPAWSO1s12Fg57cxPKopzUG90OiM7cKFFubsXiQT0l5PTNwtl
	Rt6OtPNPanKjaWwRnoOn4bqIl4g0PCZ3IWidGibTTS+Qh
X-Gm-Gg: AfdE7cnoVjVqtJ8ZF0SEprwz6P3BQ2F31R7hKSVJd1+aWZ84iPdyEOFBY0tR8F9qrgS
	t7aIPIyRAMVmSW6PLtBMUBbFs4tJ2EpbACXTX+LwX0A9taLc5uoWvR0++/un2A6uzFqPlsBpiiU
	kD1dSf/gYsIyNEMDCfmdS1jSJm164W2WhsmaKGDTZOZlmF4U7Y4oYGRCR+XSvm9Ke7IVHm/DX5/
	rqSTwSm7PrPupaKM24CKCtp9R+pX7hwLLm8aqLd0SIses0V8v9jbCpHIK0IoBzL0GwZ41BW+1CV
	5eL9u8P1GyY=
X-Received: by 2002:a17:906:9f8a:b0:bee:f541:1dca with SMTP id
 a640c23a62f3a-c1205eb8582mr857638766b.28.1782721784045; Mon, 29 Jun 2026
 01:29:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260627225755.1710837-2-coiaprant@gmail.com> <20260627225755.1710837-4-coiaprant@gmail.com>
 <20260629-fabulous-muskrat-of-romance-cd1bef@quoll>
In-Reply-To: <20260629-fabulous-muskrat-of-romance-cd1bef@quoll>
From: Coia Prant <coiaprant@gmail.com>
Date: Mon, 29 Jun 2026 16:29:32 +0800
X-Gm-Features: AVVi8CfWsSLK-1uKnZroe1Q5sLbgUiQYsXoAa1H7uKEtrkvHKF52rbw5QkyqxSM
Message-ID: <CALj3r0iDFBLarResDZA0zCKUmkXwfV7dPN+fqAK0jBF7yRLmUQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: arm: rockchip: Add Graperain G3568 series
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>, 
	Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 03:12:XXPM +0800, Krzysztof Kozlowski wrote:
> On Sun, Jun 28, 2026 at 06:57:56AM +0800, Coia Prant wrote:
> > This documents Graperain G3568 v2 which is a development board based on=
 RK3568 SoC.
>
> "Document"
>
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submi=
tting-patches.rst#L94

Thank you for pointing this out. I have revised the commit message to
use imperative mood and split the overlong line to stay within 75
characters.

> > This series also have an SBC series with the suffix "box".
> >
> > This board is development board series, not SBC series.
>
> Remember to also address Sashiko review.

Okay.

> > Link: ...
> > Signed-off-by: ...
> > ---
> > ...
> > +
>
> Looks like you just added bunch of format-patch and check-patch
> warnings...

I have re=E2=80=91run checkpatch on the entire series and fixed all trailin=
g
whitespace and other formatting issues. The patch set should now be
clean (except for a hardware=E2=80=91list line in the third patch which I k=
ept
intact for readability).

Apologies for the oversight =E2=80=93 it was late night work.

I will send a v2 with all fixes shortly.

Best,
Coia
