Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2122A3B6C1C
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 21:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786743236; cv=pass; b=ZYPjFj/T/pkS1zRJeKPwloKtX6XbvnmnZUKhnc9APbnLwfXoPzBpLhIpoPwSW6vdJcO3K8SJmnj4zc2WhMGtVfuO8IVkVJW3HHwOQbCmvajpEBIhI22SsOvGqmVbs+vesaZi5wNBvxRHqrrj2/vIe7yRwh9E+p2/Zpc+EeDQxw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786743236; c=relaxed/simple;
	bh=bF//maFhRDVTJClT6VlIKy7W5yILeHbfc8S+gFxhrTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rKD1QHvKI2stzGKl/bfNn0aHa6okq7bRHW5nDtHSmWQjMWx5/btiQql8TvIwY7MElcLZ8732R9VwV3UMAJeax5tOb/6A60jnwD5qcHgu5cF8H+fearyNMB/aSPA/iT29aszyaoPBZOZ6d77yOM2eNTvcLFzND2RUnez416UdaQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IL7Y+4Sq; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IL7Y+4Sq"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c16879184e7so12745066b.3
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 14:33:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786743233; cv=none;
        d=google.com; s=arc-20260327;
        b=dObmKFZsNYKqFxlJbmLXpa0N41qhCDdNu5a7BAeSeTKb7iweXLjl/ilJJvkNZ6VbWF
         qZyubHpctWOhsImwZ0ik+NvzeR/hYp8SoxDpaacSVh3JhgPvT0KVnFUtXsuEnLLrMj2e
         5+ksKfN1AZ3YsXXqGsN9SfOlPwUbA2jQrHnJGvd5pYy/uik+0PUxhK70tqfVPMIMmfF1
         kpOCp1kBJGqV5QOLSE8rGWUgaQOX8dJbNP8WLxspO3EPGxH4Tbuxl8/G6Do5UcZIioLE
         Pe+ommf45xJqVU7isBNtyzIP0XLFgENIsClPrxWSKa1aqj16O8kr5HWQTHdZQaH6tA2C
         u/9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bF//maFhRDVTJClT6VlIKy7W5yILeHbfc8S+gFxhrTk=;
        fh=ikPofqJs/Tvy83Muq/EaHrJH7BKCEbLBlyiupitgGKg=;
        b=Ruz42a5rB6kQeFcoMoZHtEOsNbUlj+gcUainVYF9oE11y63AJDLrrHXU81CErQlT2E
         pcWkIAEY+kosmUbRDiNkIsunUlS/8fGNG/tsI804LsT/onHL4bxzgmuqf14abUtUG+vE
         Rs6r1Hpja39Cu5OXQGXCa+NkhLvW01zMthEt71nFQRH14LlLkv/UTILZ8LtzTqIrDvEK
         9KmqGBud84eeLcBHYLanQfw5OAWaYwZwBPHRLqv62dsTJc8vkUIpTbRwAHrHFIsXCKKU
         S4opyPkKfK5WLkswpXWwwGJbCfHUwFhSNDVf+v0yBLHWxKLejZl66Z7RMDKYa/+trgVZ
         R2mQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786743233; x=1787348033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bF//maFhRDVTJClT6VlIKy7W5yILeHbfc8S+gFxhrTk=;
        b=IL7Y+4SqBdcJmVhltEZhiSuetwSyTA/y92kwPMOhlHPN3J2ilomAWs3/aSyrtO55F1
         LkU+x6DSVCCpdNL95NsCiPlJ/Y4RLEjcYRxByOUeBMuYVQxY1y1n1Ps43bJNRnRnPRZ+
         LG1wjSfDZxni+grpxutk0d4A+OJAt6jCmoIz3arTr3UT6A06uBjptCNTpDThSCY2athG
         UlWS7yp4FkARL05i8Auem5+WPWAkWo1YHZXu/abVLlpcBQnkGgiid5JaWWjsTWc73/lt
         4AI3XegPWhBvFTBPOaqYDmenq0h6gJqQ7s7yYmWJZ912zAeRR1b9fDri3loYTLrGJu9c
         nYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786743233; x=1787348033;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bF//maFhRDVTJClT6VlIKy7W5yILeHbfc8S+gFxhrTk=;
        b=lb2nF/rC9M+Uslk5Xc98MHXaY5g18rWQX8ldqQ+Bt51Pxj006sn5fxvslebEfEF++1
         cShjS85W9r23ipUvk0oRaEQ8BU+bL7xqgjBXE/O7GnwkRSGg9gMvhnyC/0o9JfXNakib
         jNWFCt+t74NYWrQMHlhOgprLY0gSA9GHhMR1HkDMUKK8Uj0OMYds3UrXwaHoJQ4Lcgms
         eN5CoWt1AfkSaESnXiu6G3zAcaUgL26TB77DIUYRpWWPg158YQcpzyezyk3hqsd6NzHp
         6gvAv/FCDvXkJWmki7eO36KV0H/aGiefuBGuf8VfrnHeNbcvMd4tA6qfb7XoY7QSPa2X
         mi4g==
X-Forwarded-Encrypted: i=1; AHgh+Ro6Znr3Oh+XKHtGScc5+Wwcvf2InFggcixeh1ckfQ62De05WX6Ct9BmuANpvJCV8Tf14i6xQ06Ro1FK@vger.kernel.org
X-Gm-Message-State: AOJu0YzdrpjYzD76v/inLJTN1koHHlNAimjk+7QN78lb69FwnNQtZF3L
	KqJljgkGamcEtm8FPujL/RXAiozJx+mWF44wEWRtXsdi4aypRt2UQV2q8MRnIfh+XYqZM0Xr09L
	v3uie/oLmzg0K8oDHqfWRDfRdlmi/inU=
X-Gm-Gg: AR+sD10ml7+VAxOfKFsX9UwQD4Yw82tB/tIKt+BkOnMpIBuClVOPf1ko8WYJNp5o9fk
	edO9GNwM6mTEPcrPFBYdvSvW8nKJet4g36ra6QsabsXeNqJZZETLfN9KN7oEdPEZJIgbSGJUhc/
	6bHAhRgD/x+QHIHGB0HG0wwQL6wSa8+Q563Riafnim9kPdnVgpiBszQddopOSXj6yypOUsyro+Q
	V0O1+g880l4LEz9+1JPsR0JG6N0N/+gZ6aHNsQNcYrJ46i98qoZDq0z9y9ykkrd2USK1ea2vA9l
	ZBsMppxlW7bJYC0njsetYAf9aHjthZHIGFP5vLtHEadMGHEie4qBP/VXJGnsUi7jww7gGM3AzEK
	qmNY=
X-Received: by 2002:a17:907:3e9b:b0:c12:732a:fe52 with SMTP id
 a640c23a62f3a-c212a26d6a6mr212990566b.4.1786743233242; Fri, 14 Aug 2026
 14:33:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813-ti-keystone-devctrl-v1-1-6f0aa87d9af8@gmail.com>
 <20260813164117.DE8F01F00A3A@smtp.kernel.org> <CAOWyW_6Wayw0gKMyhpy2wE6oSbikM3fKCopqxHodddM9zt1-FQ@mail.gmail.com>
 <20260814-wild-dog-of-dew-3ccfe8@quoll>
In-Reply-To: <20260814-wild-dog-of-dew-3ccfe8@quoll>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 15 Aug 2026 03:03:41 +0530
X-Gm-Features: AcwNN1Uy44KKTceDwDiBJV_p4AQtngzimLEUMzkno-EHQhuKCEBgyeAvZt7maU0
Message-ID: <CAOWyW_7NL1GeWCTu5LED4avsRLMOHMs1kVxGN0r+MxMhHSj_AA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: ti,keystone-devctrl: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, mfd@lists.linux.dev, robh@kernel.org, 
	lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 12:18=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Thu, Aug 13, 2026 at 10:24:12PM +0530, Bhargav Joshi wrote:
> > On Thu, Aug 13, 2026 at 10:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote=
:
> > >
> > > Thank you for your contribution! Sashiko AI review found 2 potential =
issue(s) to consider:
> > > - [Medium] The schema enforces non-compliant, legacy device tree node=
 names (containing underscores) for child nodes via `patternProperties`, bl=
ocking the use of standard generic names and contradicting the commit messa=
ge.
> > Yes nodes with underscores are kept not to break older dts/dtsi files
> > which uses underscores
>
> No, you made them ABI now without explanation why this is needed.
I will fix dtsi instead of keeping incorrect child names in binding in V2
>
Best Regards,
Bhargav
