Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCFE39657E
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774947730; cv=pass; b=Y6iz2kUk3LZg9YA4aNzbuTI+g4HeQ7tWrg6zaAQoP2mAPPRFenfMBj33h2m/aHX08SbdKzqE/PUIaHClTbFju70Etyjv6+p2sNUrKyNF/ifBD23X5uLhX84DZcZNJzHRI2eyJwtTToRSfJrxhqwupTHDc83wT0bFrsro9aLlzPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774947730; c=relaxed/simple;
	bh=QuCvn599COW//1DtmRcEag0zAJukE3mULPcfdxWmbHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tcySHCWoghahhi/WRI2JlR491/ExeSy/fCfqcz7DLHHZJ0pHF33D0azLVF16g50io3f0JGnGWQQ1Oa//zIRxiHSHKF3bYbc1QMccxpuJSCxGzlDRdW1vIxMaMnUShtIAAY9dGc9urJ8ZedeJ+KGhC7tEeBZ/XMyS2z1nli7ifdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WyW8aOgY; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WyW8aOgY"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a2a8abac7dso3992758e87.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 02:02:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774947727; cv=none;
        d=google.com; s=arc-20240605;
        b=VAjJZuN9Q1J/xL/LnKELokvK0sTQtm8NpFW8KS2qwfzrN7spcWaGNEZnyktJB+Ead5
         M2DK7j2bScraee2jxXHcQvrDj7Bbtr1llKNI0sAotaXcseJmffimOe09xRpcQItXFFI5
         Vc+Q+/9A0l7oqII7pWZtBS/T9dsbpS8PMNpADewkopHLaoaQXnnv2FAcfVnH2uvtUwH+
         QtyQo1hj/zZ4QYBkkuQ93PQOwmer89eGKTkorsLwIR2wq0rNtb6shvmZrzUUFODgXvvk
         D/upRNCyQNtTJSZNKcHe0k2MqAXtxakbMi2m7IS7eyq7sYtzWsgx14RsocK8yJpt+mPe
         ldIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QuCvn599COW//1DtmRcEag0zAJukE3mULPcfdxWmbHI=;
        fh=If91Su+i/vXBcoYDsVwV3F0ESOXFi7HWaGTWrUjI9xM=;
        b=eWE0FjRCsJogwB+Mn5CXDOXpjxNF20xvu6L2ui1f2W/MHa+wgSRrFM22F75c6VHtfF
         6KtpV75Qy73TYP/kWJra6EOdXkC6qe76mJRGM3gUyei6QIyxoVvJTF7sokLnuNXfvgKK
         NuZv9JqUIeWzxQDK0SxuFhTWAqZ7Nfr5OLSaoRYsYZTFEkH9AtT669W/cYB5jmRgki2d
         09mf17m0OUufuzySc3pPavidUjgknKpvZb78FnB8Ukl+CvOXk1KWW4VktoTzeT1jQ8PO
         SmaK/FFZhRnrfRI/5s3UI8jQztT2RilrNBZFZIF3Tqpd3wWfrrg5CLjGEuM4AForcGMn
         o3eQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774947727; x=1775552527; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QuCvn599COW//1DtmRcEag0zAJukE3mULPcfdxWmbHI=;
        b=WyW8aOgYi8MVszoV+uXI6HpIqbblZcKFU61V67eBcX0jra4k/WaoEzrxKrnHaF2MdE
         5yyvdXkmBYkkOR+wbXPEtQ4ZtCbilrZeEuoFlyIaC56gAYJMxzM155shYE78fY1pfj7G
         M21H3Noe1GilKjaI1f40ma2GRIq3IP/2N8jl66/to2eiiEHlf2H/KUwUAEG+q9OE7M23
         Y6guly5IqcdEGm8HB6jN3l3OVon6JTBgQ4ia+/aH1ridr7GXTgTKKBI5ZHpMBsRWGIMv
         PMIf8w9+mVbgLeNUjVPRZL4CqVVS+M/mAgAcdQ3110A2jQIp0PM66DQ18sRdsVh9xnqE
         gUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774947727; x=1775552527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuCvn599COW//1DtmRcEag0zAJukE3mULPcfdxWmbHI=;
        b=T2Wu2/ldVsqWpeYLxzcNGqfoAN1ELSM37Ufebc09T7TjaRitXYGw8wHiqZq5XNzJxi
         H/VbKM7jVbA675hJFJZQ2gT4eursoqunEkLVIRhsSyDOikyWiHiIAZNPL4YdP2MWj8f7
         sCP5JgW161I0ZKHeJrnQumSnPuWZydc+08TvWDPtEpoOaQWenid5jlzKHf9MDjFoFsM9
         Wk+XZoBn3MXZ56B7m/aUKH3kCX0nef//O3ysOf2qSSKEke0WrTsq3EXx6SxIMuG1KoFE
         JpOpnoZ6ZByvN+yXoVMsy+hgY9hGn8paWAZN5LuUnbiJ1/SpQYYYPFpTVOK6sjyKYZKn
         XmOg==
X-Forwarded-Encrypted: i=1; AJvYcCVJVqVt9vKdi5nSyQxdi/k9ukjQHQ2yYWckAVQGkPLaSrnJb5tJv9DXmdLL24RMYcPjTb3VSFwGDTmu@vger.kernel.org
X-Gm-Message-State: AOJu0YxrmI/juqXOiasevN3XDdq0yS+vb1RT0GFo16Ei52n4RIzhUen1
	DBc/OBQ0T+AO1SNa33gXrzOIrD7MeJsQ6OlnMs/UdJajABoGB9V+cPHq3KuQpAiJhfmvvNxksUY
	RrAQ3EmgYxPxCw/07oDuIAkNOAe1eqPUWRI1KltmgOg==
X-Gm-Gg: ATEYQzwac7IWwVKHYziWivEWZxLiar3OD6hAlVxYKxyHQl9qGfHyQHsF9wbB9CD1zLS
	2NT5x+l22/U1Mfr1NF7+9MTfVDhyJY1Tj9pNF1EGL1b9hnLFK+72yaf1btb5YHMb8LwZfrUtXhi
	ns5NxOLOu0LW6g6f5j7bamCjyYytHTP1v3bVlnnsjEX/fQdkiMWSfz8ua8IIrk+QNzl3FGbFyh8
	yyToFxPaxoszNKuXSroCJZ+UvpJY+Jrckv7e07WjzwTppvQ2gzuMLO6P3zXE7IFmr4lLCmsFEXX
	ofA8yt5P
X-Received: by 2002:a05:6512:3b95:b0:5a2:78f8:60aa with SMTP id
 2adb3069b0e04-5a2ab92e0a6mr5921259e87.37.1774947727265; Tue, 31 Mar 2026
 02:02:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
 <177409907930.268981.5882592990447577348.b4-ty@b4> <CAPDyKFoz-sm0pfvn5iSYFY0mrW38vaGRZsFvrVPqsv7BsYxeWQ@mail.gmail.com>
 <1fbf5c54-8793-4585-be33-ded77019adb2@kernel.org> <CAPDyKFrK3NLwaii-9FEmyaTzUAuVkMkLL3rWBQwQvT-M+PzEHA@mail.gmail.com>
 <3bb6b71e-947b-4248-95ba-79852f743c1d@kernel.org> <CAPDyKFpOPC2stAJ262jdap-=ByY09AeQ0kj6p_9FTGJBx+Tu-Q@mail.gmail.com>
 <a417e45b-1632-4b14-9e3c-f7110db53190@kernel.org> <CAPDyKFomzokuF+UL8d0+Syk1FCG3jnUfy7rVr+3iC1GPZmH1UQ@mail.gmail.com>
 <c4d6b758-474b-409d-b553-fa4ec1df494e@kernel.org>
In-Reply-To: <c4d6b758-474b-409d-b553-fa4ec1df494e@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 31 Mar 2026 11:01:30 +0200
X-Gm-Features: AQROBzB7d4a8fUYE9ADAwNJgppR-qAENvrUiLIFB9dQe-2GMylgbIm_d4czfNl4
Message-ID: <CAPDyKFrwxVcLByHef7GjbyB+Du0bRbD=6_ELmmnMWW-TsjMhCQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v8 00/10] pmdomain: samsung: add support for
 Google GS101
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Juan Yescas <jyescas@google.com>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Mar 2026 at 15:38, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 30/03/2026 15:30, Ulf Hansson wrote:
> >
> > Usually we want bindings to go along with their respective drivers on
> > a subsystem basis.
> >
> > Both patch2 and patch4 updates DT bindings for the power-domain providers.
>
> Patch 2 yes. Patch 4 not. That's why I did not take patch 2.
>
> >
> > Why shouldn't the bindings go along with the driver changes here?
>
> Patch #2 is pmdomain, so with pmdomain drivers thus your tree. Patch #4
> is not pmdomain, so not with pmdomain drivers, so not your tree... At
> least I do not see any pmdomain parts in that patch #4. It's a Samsung
> SoC PMU driver and none of further driver patches touch that PMU driver.

Yes, you are right that the PMU driver isn't touched.

Although, the PMU DT description added in patch3 and extended in
patch4, allows power-domain providers to be described in its child
nodes. Those child nodes use the same compatible string as the
power-domain providers described in patch2.

Kind regards
Uffe
