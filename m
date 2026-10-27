Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793128790;
	b=W5EgJrarUb3NGAqR6LtweC3lmJbE9tjFF06DvrSbbAX6MyMITdL96Y0yi+Sj5j4SOCjc
	 SMSVc+XgRel3WGrCab9zFSaFjRJYvRhs/F5yjWdUYF2445WvUmGRQeeZjzJnQrkIBhDvf
	 oH1CdBEEzIPxU6+OfoAPHhJ+EImZ2+dsBC/7uI7+QM+itYUxIOHNZUJIxGPvPGNNGXqKt
	 9L6GW6YYKQNL8jxWNN48isCgLPy7vaVFakKBh1uqj8OSTSpW4xlWGJwLdxEXUyg8CwY1x
	 1zK4KuaPLkCbISrXLxOblljnkgd1KTl0rl26qfr0Khx0FOyfoXdyzjPcHjgrEhhi7AQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793128790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Zm+jYKGo9hxrg3LOVU5esHB+n0omwff5Vhuoin5XRGk=;
	b=lnJdcMogkQ4AjKXNHW5cRY4Jdi5SWzB1Y0GJ66bIkjj+Jl0cNfhBPq8KOY/9MFdAZuqI
	 qtWBOFTSx8HXlKHt01eYAueIzJgdrOHCeTlEQ56VA+CALqCNRy4A5CvMHbMTX/OzsPy1e
	 oTcTGuV14uyNW4oLZFdAkjxbVDv58O9jwCcnzFeFtKJcx0ipOo5cc3tXeioOuSdYiF4xx
	 PdI5mhs7zmxJhHHyHzYgKGrXyxHgl72YWjk+Ulg/tWmax238Y26xAr/e9CYvE4+2QyKFY
	 faTFierY8xMQg3JUNCxA9/VHujlKNQSrWOClaxjfy5zWqRoMWtVNhdoNG0Z3ISipsyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B7OWrcee;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AF7606A31F
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 19:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75AF7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B7OWrcee
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6774639a8a4so244091d50.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793128789; cv=none;
        d=google.com; s=arc-20260327;
        b=ktmrYsHsZoj7bYKSntYUSlR9Ekj7m8l3U3NBxtgU79fYYtuzLI0xB1HjXwbECDIAXW
         MjXev0AGhE/I51RirIfUKfOHogAy+fpp9+H3bYeCb637oD2FGOglVWKDIiarRJstSqQD
         YM6X3aqLKljbJPPlOGdbtZsSzoDBvlhHYVpr1UdQXrp9G9udqd9ji0WwXVGXeSNuNIzs
         aDsP8goj3rH9DAIfoNtnS0MsaMqxAhUnbpyjb9RGDK2KvLl9qYwAGtZaU3TpCTQyCgfW
         jQPE+OIR/NNUIjrmjpIwHPROt9rqqFmM1VJw2wYB2vVBaFjfcmDUq3VEfL3oKUj1neZW
         RQAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zm+jYKGo9hxrg3LOVU5esHB+n0omwff5Vhuoin5XRGk=;
        fh=fKJX4knMcLko654+nbMzg2zqVh2r8bD1tqEcIcI8cAM=;
        b=Sp0nKWOqiYbiFKNTXIn9et0wNL+zzc9ZjGoa/nZOPzfwTHbid9bbMZVy/pDYqLqHHv
         PCT8QplZ5ke5FlsaA85sf/cS/5fJQDLIf+2VWnlvSYacdhvb7ORYz9j1t5qPYcYAH5Ht
         TrODSQTXpqfldoNa4nXRNKVVnc8n09Qez+uLGgLXmh6NlloMelkXH28UszUt9LZXeT5b
         yJiAPVkRg2jtx87K6tJh8fO07tGBFYe3mdW+Dg6ke2cuvTdBhlwLU/GMenES+hkRthPs
         gkKeUPrcOa3qoUas7KiY/iaQMB/Jj6DdZmPh68OT0xvv3XC59aZyuJC2/GfaKeWoxXMP
         MxCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793128789; x=1793733589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zm+jYKGo9hxrg3LOVU5esHB+n0omwff5Vhuoin5XRGk=;
        b=B7OWrceebfcXCuh/DhLY0EOzbwxS4VXIwx+4ErbIGYhP3m6OebBZKVpVzxUm97HkC5
         RATOxwfeWslWPH/on+cse8vmweGFq+Pe7cq0tJN6X5HmrQGSM6MF/ULWw/gpdXC5i5HG
         9NkLvfNE83gBYiy7Ru5QOulO2zJWhVApeBVoR/qyGns01Jom7oclFyk96zrOU+AXkJK2
         PoweW5z+p/yrJepYOWIS1yrxxrIxyvqcLqQF0/7ufHkRXBqbpYKGGSkPRGrphfitbASs
         qiM1wCpc6/jEu7uoZS/DuWD39x5VP8sElaJBuoLijnze9E7K6anFEzu0cuTEbh8uDlrr
         dYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793128789; x=1793733589;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zm+jYKGo9hxrg3LOVU5esHB+n0omwff5Vhuoin5XRGk=;
        b=cgz/+XPmDrR089X2fA0P2vTtCROcCNPYDDaVb1frOl+7auzzBv8PhoD/6N/zD9nr0T
         NWNjermy2WADoyUvKQAAVwVAotqxrSNyvIYUVaWt1ZkY/+YASX/0fsTHJPyhkkcqEHHE
         agReb46C7DjmDrPeOYGby4Vit73jcy/9QQwPfDVWzmsFpMgXvaT3OnRtwydvE27O8Wze
         SKyMrgsNvjvpDtSAFitWDTPlRgtcnhtu7LjpmGN96I1kmP2NDeDC+AQ+dXSugojD9dKM
         rfjx8m+mgJssuOZoUcThqmvhVkphaDxQOLqfmheJWFZT2tU6gSb8R5mwbyylZFCgbVbS
         R65g==
X-Forwarded-Encrypted: i=1; AKwUvBy8Hti9ZCNc+H/0cppr+ymH1UJZP8vspoJZNW+ydz70pwJU5GBeePTxh19wDHv8gAo9dZZae0Rm4UkK@vger.kernel.org
X-Gm-Message-State: AFq9FYLdY2VKyKHZIND7PrcV2agsLZellCWNUA9L2aGr/JcvDLXaF7jc
	FX9iQ0RrWy5ONZYXhlPL5654oCuGWhXy8H3ta3r84cw55NCPQGiWh2q2zY3xaA53YH2O6LY6B06
	VGFbgbEbCWEcaQCbwUSR8NLmwiJ+V4/E=
X-Gm-Gg: AYBFou06HHQwD/yasknWybRa6mCBg2SDRWgKFYI8HfvWMETuMRlw7ipBVNP0B+iiZI3
	cHqIMkqwQ9M4VvrFDMa5NJBDHAM890y8Gw7crJpR5Hn8dqBzx4kGvyjxtoJ2AtBXzJK0XzL/kan
	HUM4n5C70xJUSA3dfoDRhNioCKH4dDz7dIYVoZTa6oT+4tGs8/cHThfw0NUCD+lKGs9vsiOqTHB
	7BgD5suDElt0HWtu6oHPvBWCvx+n9zNwYq+aejNSnpF4V/QO7InZ6J3tPeHXxh4MLI4FHLM9zkm
	p+IbupKPQq2oXI1jI044+pDbfiHNbpgoamqf0HUQRc6OUwfKvkZZt7ypJSREBBJpvWrzLgEBHxw
	NscduI3DzHBcTC/z6xQ7IN3Hd/g2PnKcP4Qj5
X-Received: by 2002:a05:690e:589:b0:679:9afd:c0da with SMTP id
 956f58d0204a3-67a7bce2beemr237682d50.70.1793128789479; Tue, 27 Oct 2026
 12:19:49 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026154001.9323-1-jeff.roach0@gmail.com> <20261026154001.9323-3-jeff.roach0@gmail.com>
 <665b6014-f9df-4582-a682-e825dbb1ca4d@oss.qualcomm.com>
In-Reply-To: <665b6014-f9df-4582-a682-e825dbb1ca4d@oss.qualcomm.com>
From: Jeff Roach <jeff.roach0@gmail.com>
Date: Tue, 27 Oct 2026 14:19:38 -0500
X-Gm-Features: AclHuK8SfxQzWuTwavpktbuV6X76nKFATsMGirtAOEaQ-uUx0DzvkbTO2fqQFh4
Message-ID: <CAAnD8RbKBMaCEf8rQZdnAxMSW-oUjYR2GCqwKyVSy0pn=-CzvQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 5:49=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> I hope you asked the agent to go through the regulator settings!
>
> Konrad

I went through them against the PMIC votes in the laptop's
ACPI tables. All match except vreg_l1f_e1, which I had copied from the
EliteBook at 880 mV; ACPI votes 904 mV for it on this board. I'll fix
that in v3. vreg_l1b_e0 (DMIC bias) isn't in the ACPI tables, so it
stays at 1.8 V like the other Glymur boards.

Jeff
