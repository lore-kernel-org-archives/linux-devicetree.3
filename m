Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9233BF68D
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 20:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780777159; cv=pass; b=X2mDmeBgBgWRUCHn0JQR65KFOEYhR5k2sVbeBUVfnH9Dw7nbI8y2fZ2Drq/RuO37SIuc3AVkq9x/WW0ZATMDIckDePDnCalgqWMeaEK+AQ5KnFEEgFbxvdJeDZlgdPE1NFw3iF5qXrv+9n6+jTm+e86jK4oashhW/WJ1h/2E3eE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780777159; c=relaxed/simple;
	bh=lDy5Fx3Rby1fSWJ7lIA4/br6UrnBOMa4Q9GB4CkOFNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=amYa8YunmcL8Gg7z44QqL/Met/ajNV1O2PSg7V8Pe0zBxAO6ESMlTSdSA6WblsL6cdCOsWpgzX8DgLITYCZyQqgSwHb+BStyvimitZuYyaiGF3fY0Uud5iDyrcnd2eLvuxnogQHRGKewc8ti4H/BV3viuKTTOwqq2Nj6wxEnCgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C35oyBcP; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C35oyBcP"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aa61503fdaso3573924e87.0
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 13:19:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780777157; cv=none;
        d=google.com; s=arc-20240605;
        b=VaqkvxlCgdFlPpFo/AcYJtXHoanRzfkfJYJqpj8hgHn70UxpTSDUxw7QGkBsoTHaE7
         wMdx7tW7Ktp2HK4wig4XaIDlkjCBZNQFC9ydtFFVLNGua/vrKWAl6WRAMZKm0wsR0KeZ
         K59m2VY4N1/rJG87lKpT/iCQNq0V5+lwO1lGfCAhgAh6soH28QpOyWyhG5CESeI9aSEE
         zxHZW3LX0XwOlyuAhowZYieiwYgUh+YaS81sUVS0yWWTG5y0KBzRuNNWV3YIIQHjuOnE
         0RS0eYnZr0eugjRQnEmJo7LQIcr9quJRtRyRsX2dStPtyuyLm2NOwBUpmyx5oL2VrtMH
         /InA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GGurdML8GWvZXdlmgMS8yljqvF4FwClaRGE3W1u9kBQ=;
        fh=ZkkaLD98eWG4ZRPQ/vyowOHzJZaELTWfJl4cIXubGTU=;
        b=bsCxAb+SgXsbfzOExCzjNdT5TKQFPmpu803CbTHW4OHirKiHuYqOD3TgnmMsXDtSXV
         YGzoK7f88KMLsz++QBhYKOeg21I4BM47WSsyyMcN7eh/5bRa9L20qVmQfL9YSBHKzB0c
         k7ivvsdCteJZw8QRsAukg+NJJbDk8DpK3p2up1lbGAAK8gB3SsjOY23eyfqCW/nZrk4C
         jzf5JkUOOpC1ghG8GUgsZr+cYPBMPHk9CPDWs3b6DDDLAAMuh0N/iRxP4o307262RhHO
         sZqwH84HBHIh6rSSlt35SBTTfoAB1hhh03ArrlWU/5gJYQ0+1UWxw+LbPQSncKtgZzrq
         u6kA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780777157; x=1781381957; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGurdML8GWvZXdlmgMS8yljqvF4FwClaRGE3W1u9kBQ=;
        b=C35oyBcPDqcxfGoJ09aStWl6C/Iqd1LfmQMTWY1SHsPPgeYDA0GEjSu5nDpKCwlzTl
         n1a43fcBCJy9oUq19KQ+fOAhzPhG9+c4kqkW7o0/DPyAVrRvwCGTElZrLUkA4Y/o2/II
         tWfrHSHpzPeYx5vVroJXndjZolGRQwknYjHYxNK2OVpI2cvCLs2WKwHOkrT0qftPJKHb
         7a04Q5L0xvDqyGdHXvEGHagDDmRnRnJfBYatYwwcjzx3hce/pMGPLzJpWHaB+sE4p7fh
         +iYy6GMEd05BO4acwVytnEQFoDhytaLYOiicVqQOiNJYZXK+tVOX2IzDbbjhB5Il8y3p
         FgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780777157; x=1781381957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GGurdML8GWvZXdlmgMS8yljqvF4FwClaRGE3W1u9kBQ=;
        b=cHc/X22dCaZky3T0cEXhDqfPvtI2BiIsV8gJOD6DL3r8OVb/5cPPC0KuwLIvOmbJft
         jqdiSqHaqFPHm6hxoHesO4FnE9zC7DAIENO9v1lG66Vkc3S6eocOChpMvBa7+GQxgdxD
         eUIQvqwNyCt7+hEZr5wOkSIjqELXeApim5XIainc7xp9Agm/6QWgXAbXwSP+XcOzYdsm
         S7/73aE2oUYxsRsBeghstgZUgSsv7oLS3ygWoqEGxFyNEkuNpEasT6O83Ks391XDWncC
         ukxBeXN8OLm/PMlkdVPm87RBXqk1/lChLI/uG7Cr96q+A/wPU00CL86asWGewkD0mIGx
         COIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9J/ZtzGMBWQ4H101Vb4t87YykXlrPpHzTtfwLYuDzzEnOu7RoHd9E0rLxpa/qWkIWADNUPlIXw3n/P@vger.kernel.org
X-Gm-Message-State: AOJu0YxYbraNAOsJZ1d+RJOLFJ6FQSmGEyYI2rC0/WxGHA6kW2xuNhFO
	BUcstKY2tNINAU4L2PUGc/RWUXdrtjA3sdC/rxBiW9MxkVLohUt8OO/bwIsp7Xi1NarYE5Fwj1L
	L+kxBmLdefUyp4ewsL5jmsztciaOhS3Zb2vyqLJ0=
X-Gm-Gg: Acq92OGPIRmJZ0JSfubDeNkFvxFe6K43m9a91b7rFy+M4jjTGK023ecRn4NDgDGJAln
	naz4qEcLhZMJ4cKtcjW50zzxQq2ddG4Xtsc6kdgwxCAeC9/LVha9ipYfGMspk2pUvxxWUYG/Mbj
	qoNtAUkWmufA2xE48DO7Ogf4Xt9q8Cy+al6lXOqw9mr94hgU+36fA6kHRZ19UmNSbYH17vkmVZl
	WNNku2VTHTIk4leUS9V3xCbRYhG0LOuPAXcBUrtFtvCKvfsJxpCwlHvuSZuD3zwpcbYNuPyw+D5
	4777eVFtx4aN85ACRIXxXDaNbBB35PGdiCmRNsclCBuwK+f49HkZLM1huDXhrNf+3lYoJkOvja8
	PBg0=
X-Received: by 2002:a05:6512:2c08:b0:5aa:5f5c:9546 with SMTP id
 2adb3069b0e04-5aa8865e0d7mr2001911e87.2.1780777156648; Sat, 06 Jun 2026
 13:19:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-cq8725s-soc-id-v1-0-bb1ef93de649@gmail.com> <0b3a7b64-252e-4d86-8561-c5f16808054c@kernel.org>
In-Reply-To: <0b3a7b64-252e-4d86-8561-c5f16808054c@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sat, 6 Jun 2026 15:19:05 -0500
X-Gm-Features: AVVi8Cc_0vJoW1FDGpU8mt-gGFKN8aCl4VyZlNXYdZhDMJ4eEjw8Fs-nciAfZBc
Message-ID: <CALHNRZ_2gC_WBQiz+4gTZOypvyCtwv6j4MnN6qJ1KoBZ=0LA5w@mail.gmail.com>
Subject: Re: [PATCH 0/2] soc: qcom: socinfo: Add CQ8725S SoC ID
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 6, 2026 at 2:48=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 05/06/2026 23:49, Aaron Kling via B4 Relay wrote:
> > Add the ID for the CQ8725S which is a variant of SM8750.
> >
> > ---
> > Teguh Sobirin (2):
> >       dt-bindings: arm: qcom,ids: Add SoC ID for CQ8725S
> >       soc: qcom: socinfo: Add CQ8725S SoC ID
>
> Where is DTS using this? Or anything? We do not add SoC IDs alone, it's
> pointless for a DT platform.

The cq8725s device I am working on is the AYN Odin 3. The kernel dt is
not ready for submission at this time. I am trying to get all the
prerequisites submitted early though, to make the later submissions
smoother. And other id's in exactly the same situation as this one,
such as sm7750 [0], were recently reviewed by you and merged. What
makes this any different?

In response to the palaka comments, I will change all of those
references to sm8750 in a new revision.

Aaron

[0] https://lore.kernel.org/linux-arm-msm/20260412-sm7550-id-v1-0-958a673ff=
791@pm.me/
