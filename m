Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518C83F4854
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 09:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847314; cv=pass; b=CD0ChkwrbN8uYDN7C/g1tdPOooJqnPd5Mxp8RukOTV9igUHtNvn5nVa121h93guvDQ0D6ynQShQi2jx+faKCeNvBNt/RbJZAEHZ0lsZKTbqXO3Cm/MzP37TluxKnBGIqbpBluWB85dyhRqHdvqh5HKZhflIySG4Df1k7/0z2cBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847314; c=relaxed/simple;
	bh=pGCU+YkLRfAjqDH/u84zLx49H7YX5I4bzZSwZUj/YFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HsHXkcRMQ8qq+PboYQqWE/1ts7XanrnLwbPL9EpYx0LuS0YCg6VMkKc0v5AsKn7D9/1xhVcW2tDfmCvE9HoePEkN6UVJejdGVL8eIqYq9+IKwAYRd6S5CKtnTZ7BwkfCDlSuGkYXMY8iMPMU2HcVqIFuh1z73q52HsgajJEFxg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sd7T1gK8; arc=pass smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sd7T1gK8"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6af7d702c76so584100a12.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 02:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790847311; cv=none;
        d=google.com; s=arc-20260327;
        b=OAjt1FMBOVNnP/yivzAqfoc0gIIXggm2IM6uH2hMPqUAwcW6jaf1zkYiPMecAy0XDA
         yayIjJxnLUIGIG5TnZIUhyIfIrqUAGRRJfIrhw45c9uWHidBm1S0RYsuCi15M/fccNwP
         +4OdimCVmwyGZRCNuHpb0oNoo/E7orte9zVjBGx2hf8W4YdjG4ao0OUHBYfVW9gEFtyf
         POPiccXkfHpcU5Z2HrA+faG/njwnZE8ngdXj9JRAez55FrNDScJjou1bqwq1KUEtRUHc
         WinqJX4mnXjyqF2cBtg0rPURCiigspbleJV1QgxDdzXueWaQM+GOyECsjLrnuMVP+oel
         ek+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vYNfNqLHkMdvHAs749vvVhbZflan3bjWqgzofQ0smdo=;
        fh=5MwwDn0jjkaj4sTiN7szK4b/V5W/hPVpZub2hDaBMYc=;
        b=p80n+gaZKR7KqY31+pPxgRQqjMy4NnoF71KQ4nR3olvZNDH0fhNkCi+hJhyBvdI2lY
         u4Pg/shoB42EwdwVA2izSFpyQhzav5DrOFJmxG96bqrYI+FCi9lfkS1RnvDQubvgIgi0
         hUvch38Ra5FU7orPBPYK+Anuf7MnhM6WcLjrMqHyfqCFIu8p+pcYkTDSlY8enfOO/jHF
         wUMmWD+9uEHaiucN5eM9BAlyr/SST7hFOER7IeuTkP3alxHEJAcUqKA/kJPNZpXS3SVZ
         5F91/SipkCC/x2L2TElJUwf3J9GyE+yAtRct3iwke9NqSbsjaSiO3CMuUd3pIQlGYWSY
         yjTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790847311; x=1791452111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vYNfNqLHkMdvHAs749vvVhbZflan3bjWqgzofQ0smdo=;
        b=Sd7T1gK87cHX73HpDC9wTDcnlwIIaXy5PqhY4c2sGOrCxmMdIx4rOvNbQn2CPEUDXu
         gwE5IOMkEGtbfx4XkZim4q2TUpTZQzoRC0B8ZdmA4Z24Ix/KenG3YoHIwx3MAYaFmO+J
         79eeOg7h9GHcm7IBIO1976lnq7QaaGro4G/ZEN/lpW0nvoYkF2YSu6jykQ7q4J7jIiB1
         KUth2sGQZKhZykdCjBFqkO/n/FTtlLPZsXzSGeqcQDlrhypqqbLgQX5IgfO1V+Pgaqkn
         Xd/rvmey5JbFXViUf+xiL9oe/0gDfyB2176JFotDsBCjn5ZgciXTBQmJ0DUTHucGgPPo
         +rAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847311; x=1791452111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vYNfNqLHkMdvHAs749vvVhbZflan3bjWqgzofQ0smdo=;
        b=gWwdqINnk1cT/QgPS3HskXXaRn1+MELW83NoJgJySn/zLG3lZ4UDVBBpZIow13MRmF
         Ano0eBczBayxsuffw/53iDFZdGKrYDOgDQ2VW8gpUuhuE2p5xEzDSXpTBJbydgY4YFPb
         EsW58a6uXpR4u0FYxei3rVpWZDIwOGv614iBbew1htffXXzxBGPfm0q0dUlFRY7RfNh8
         xa6BDLqypZ8Inhjg9+ks4deXi9Az/kCJfx1qMUzAByp53Mhu9HVCmDYMmDIKsaDco1jt
         n6OSiJbcswbvy+LKJ+KlZDoI4Rec2qMqhbFdOXHV72AP+dkfBQ9Su61J2rKl1Wr4mLZp
         BkXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRW/MuXRaNQAq05QclsAPQpnGJmre1k+pudzzlHF6NxGqpsn/dnqQAlWDEc+DbIdAQTcshb+Br6fLg@vger.kernel.org
X-Gm-Message-State: AFq9FYKzQei05P2H6TTfZa74TaDYp45qZk3s/auG+dEEx07lO8KC7M7L
	n3vxWllf758k0C1OcjHCjl0d2q0ziHDam0j+e8jDiMetOltvrWXQStETtBFM4ahRP0dNNcNUKAY
	w3jxEI35g/BhzXToIyUNyJvThTGLA3H+eCy/gQY6x7A==
X-Gm-Gg: AYBFou3/hgDdFhy1F9X4Xa8Tz4iE0/ZDunptoYkQ5/g/pN8XsLg2VGB/ilL2fFhwPMb
	3mj95AFY4rsG4nmZ+lRDEbz1LZw/XToVkdEx22Gy2vZWbrQUdyS18SkTN1D+WX52qJOHuAQIsYI
	dcorHtWHDDqKrKpG/mTpYys/rL0l9FVY2d24oCX6iQVAFcOC5ii/ix6KqSGo7gWs/HLp/AW0ULP
	9F7pk/4ZIw3cJr6T+PnP8VSjQb+nDLTusWo81ODt7JgUGXkoztc4VnrwFfT0vR0dEpjjLkdTejw
	WYXKr9Zq8xnwWiVbRHxKpdnOGSN6kKFxujYBsQF5wLM1HRBZ87jVqdnGQiZxCJxHUzlGkgz/ne6
	BfOrAPtVoMcFIvA==
X-Received: by 2002:a05:6402:c4e:b0:6aa:490e:5506 with SMTP id
 4fb4d7f45d1cf-6ae1996fd65mr3129163a12.39.1790847311405; Thu, 01 Oct 2026
 02:35:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-pixel10-initial-dts-fixup-v1-1-b304868cc3e8@linaro.org>
 <CAD=FV=VAiHf0-9sPvgGKji4j47rL38Ja3S2yiEfztubgZqBpjw@mail.gmail.com> <e58235f1-2c9a-461e-8231-8729eb3e9c46@kernel.org>
In-Reply-To: <e58235f1-2c9a-461e-8231-8729eb3e9c46@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 1 Oct 2026 10:34:58 +0100
X-Gm-Features: AclHuK_YpgKbBYxkFtRgH6bLpQ_dPXQcVCNkRBcwgfpIDgIy_RrFnu-Dzk9rMWU
Message-ID: <CADrjBPoppW+tAY3QXgawcCx7nvvSvWkQDKbP9R4r_4zAU3vWGg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: google: lga: fixup #size-cells DT warning
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, Juan Yescas <jyescas@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Sept 2026 at 06:22, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 29/09/2026 17:47, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Sep 29, 2026 at 4:11=E2=80=AFAM Peter Griffin <peter.griffin@li=
naro.org> wrote:
> >>
> >> Fix newly introduced DT warnings:
> >> Warning (avoid_unnecessary_addr_size): /soc@0/interrupt-controller@588=
0000:
> >> unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" =
or
> >> child "reg" or "ranges" property
> >>
> >> Fixes: 80f23487d554c7 ("arm64: dts: google: Add initial dts for franke=
l/blazer/mustang")
> >
> > Is the above git hash correct? In linuxnext, I see:
>
> Yeah:
>
>         WARNING: Unknown commit id '80f23487d554c7', maybe rebased or not=
 pulled?
>
> I'll fix both when applied

Thanks Krzysztof and also Doug for noticing.

Peter
