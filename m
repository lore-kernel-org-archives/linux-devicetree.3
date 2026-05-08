Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2809155757
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 02:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778208335; cv=none; b=R36uJKq8Gi3cXO+pDhTOYlRa5Q0r7MPeVOYP3ITFFMK8pf+ANJsCIydC4YMaPD15I0gXpWp8KfFGsjRmFacC3FDvqt6cVII+gCmBvLCBguOU+34LEPDOSfDPxJx9l0xRSbCGQ3i7Js63sXv12HjLVffJRMTu/IW9WupD74kGASM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778208335; c=relaxed/simple;
	bh=oEnT/UCXWeDB9vAKPoyngIcFubAI8zzoEf1ZMRsfegE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qjeG0sbFgQkon5T+hoj9/hmViYsDSYmtmU/jvWua2Opy5F2YYrC00j9UwZvRaeWjTV0EGYJ5PS6gYWEalF0Q8iBJBg0j4wksnET9lc6ogMcMQXeMGn8hOsjNI0imRsQMoLtQ1HzTtjmO8zKREaio/lKkbJEYqMon16LScam2Pfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODWmQijR; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODWmQijR"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-42fc6923f38so1849221fac.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 19:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778208333; x=1778813133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEnT/UCXWeDB9vAKPoyngIcFubAI8zzoEf1ZMRsfegE=;
        b=ODWmQijR/5g1OUlUvDpypgfpilBU8K602ai2NUyBrr9M/7scQhKmf615y/89uP6LZI
         KwqoY0I8Lxafcj8e/nkm+RgQAOEsZ39CG0rS51thfr0gU6w2fDjYJbqWQFgYZqprL1Aj
         JYSwzIdont/o9HPqVk49HyV+GKKO2s19Kts29KeTuWIobkNsTTFZ4pKA7n/AF11b4HmH
         X4ZX+IrFe5D1i8v09UAPhbV3uYwR9quHdjy3lcYTl9eW9tahlqRawaHOWR5f0kQ5WPTD
         p9mb+xO+5WnnBpxg3M2maFnTYjYu5b75oS+DI9gsVxkukHyPhhnjQ/6cP3MTxGQzbtmn
         JNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778208333; x=1778813133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oEnT/UCXWeDB9vAKPoyngIcFubAI8zzoEf1ZMRsfegE=;
        b=F0OF0znElzQN46IFZ59sPkONsD1MoaILGzNYABuy3zQS9IzJ/AtB7NnPWYPaYnhKXw
         wKaYKFdMB9DNGnSaU44ssjiOUlZXH1Rr+9pJNW755F27uCkMjSF+9ErZpAZMHdopi7Rz
         PLiUgNk7vW5WQnFV07kDmbLZPzbStioaWMJG/CTuiJgmdubhBRAn+bpO0M6LdV6OG473
         aqlGJ/ovq24Q5pclkhXUvIW/2oBzNLPF4H0mzqou7VgT+OjN6ebMm1usUt764bSUleqm
         ZAV1heE/5n5r1RVQZcoP7ZioAGTfR++5uQ+Woo5mAou2jX4sG7qDTqmrU38timIvmE8S
         nHbA==
X-Forwarded-Encrypted: i=1; AFNElJ/neTBa6ESVng4Ts96PVwe4pVIaJBg6h22Chvb6ktGNwFlzBap6n2o3eLTnCPQp3sBkzV9c78jzY3N7@vger.kernel.org
X-Gm-Message-State: AOJu0YwzDRNveEerLyZ9FbJZ+QkBrcLymikZB4QU0sRd7W4xcTLf3mE2
	nqGzIXuJ3J3NjJTFdA+LVMGbkQq9AEQYnnbE69/9utx9G7bpZaIwFu2g
X-Gm-Gg: AeBDietIHacSQC9wGMFV4ytmOF6yW4iuyTEp7vE8d5t/c2oV9lnDX0lEY4r6HpRnToO
	uKcbSCUhZXDIo10dwfWqhyphhZHZP5n6TdI/UXFb1oxlP7Z1plv8az1IDYRM0S/Jf2rbpdi+gvE
	XTkNLNW7CmKLESp+NaQ+6spnEIeUAkKFP7YLPbc++bBxlR+UJDwzKpM8OnLhpWbk3y5Sd2qFfqC
	mW6Yt5ZUirNqBb6hcWzcYgcb99Rv6tNl+DF+WxP4rgulqtETmVwtdPlL/YfxhLO4oFaKBvZfbZM
	VIhjigymjL2elzFWiVVKUsnlouB0gRecXloDuEfiLexBcaptUoZLghF0wjndRBktZAES7XTZhdi
	QmrtmvvJnkk6yoS81LBV3b7USarANs5C48nksAah5PCs5Ooxr9PG8CetPHbDK23r90FdaWUBL88
	QZsQYWZYd9vH+5VIGO2vr32NC7okm+g/aOpY0draqCFF/0bN2EXWdz9rytXSLdPXqjPfeA5YZUD
	XZ849ShensxOnSr2Vg7+5hIm0PxyhOdsw5cnUgA8QnHN/DK
X-Received: by 2002:a05:6820:190a:b0:696:1a98:bd5 with SMTP id 006d021491bc7-699ab62e838mr2720265eaf.19.1778208332600;
        Thu, 07 May 2026 19:45:32 -0700 (PDT)
Received: from nukework.gtech (c-98-34-199-138.hsd1.tx.comcast.net. [98.34.199.138])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69b25c767d0sm349447eaf.5.2026.05.07.19.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 19:45:31 -0700 (PDT)
From: "Alex G." <mr.nuke.me@gmail.com>
To: andersson@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com,
 linux-remoteproc@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: mathieu.poirier@linaro.org, robh@kernel.org, conor+dt@kernel.org,
 konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject:
 Re: [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native ipq9574 support
Date: Thu, 07 May 2026 21:45:29 -0500
Message-ID: <6525179.vuYhMxLoTh@nukework.gtech>
In-Reply-To: <1397ecd5-89a6-4666-bfe9-014ff8553a97@oss.qualcomm.com>
References:
 <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <27098742.6Emhk5qWAg@nukework.gtech>
 <1397ecd5-89a6-4666-bfe9-014ff8553a97@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, April 24, 2026 7:17:05=E2=80=AFAM Central Daylight Time Konrad D=
ybcio=20
wrote:
> On 1/15/26 6:27 AM, Alex G. wrote:
> > On Wednesday, January 14, 2026 4:26:36 AM CST Konrad Dybcio wrote:
> >> On 1/14/26 4:54 AM, Alex G. wrote:
> >>> On Tuesday, January 13, 2026 8:28:11 AM CST Konrad Dybcio wrote:
> >>>> On 1/9/26 5:33 AM, Alexandru Gagniuc wrote:
> >>>>> Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_w=
css
> >>>>> driver. This firmware is usually used to run ath11k firmware and
> >>>>> enable
> >>>>> wifi with chips such as QCN5024.
> >>>>>=20
> >>>>> When submitting v1, I learned that the firmware can also be loaded =
by
> >>>>> the trustzone firmware. Since TZ is not shipped with the kernel, it
> >>>>> makes sense to have the option of a native init sequence, as not all
> >>>>> devices come with the latest TZ firmware.
> >>>>>=20
> >>>>> Qualcomm tries to assure us that the TZ firmware will always do the
> >>>>> right thing (TM), but I am not fully convinced
> >>>>=20
> >>>> Why else do you think it's there in the firmware? :(
> >>>=20
> >>> A more relevant question is, why do some contributors sincerely belie=
ve
> >>> that the TZ initialization of Q6 firmware is not a good idea for their
> >>> use case?
> >>>=20
> >>> To answer your question, I think the TZ initialization is an
> >>> afterthought
> >>> of the SoC design. I think it was only after ther the design stage th=
at
> >>> it was brought up that a remoteproc on AHB has out-of-band access to
> >>> system memory, which poses security concerns to some customers. I thi=
nk
> >>> authentication was implemented in TZ to address that. I also think th=
at
> >>> in order to prevent clock glitching from bypassing such verification,
> >>> they had to move the initialization sequence in TZ as well.
> >>=20
> >> I wouldn't exactly call it an afterthought.. Image authentication (as =
in,
> >> verifying the signature of the ELF) has always been part of TZ, because
> >> doing so in a user-modifiable context would be absolutely nonsensical
> >>=20
> >> qcom_scm_pas_auth_and_reset() which configures and powers up the rproc
> >> has been there for a really long time too (at least since the 2012 SoCs
> >> like MSM8974) and I would guesstimate it's been there for a reason - n=
ot
> >> all clocks can or should be accessible from the OS (from a SW standpoi=
nt
> >> it would be convenient to have a separate SECURE_CC block where all the
> >> clocks we shouldn't care about are moved, but the HW design makes more
> >> sense as-is, for the most part), plus there is additional access contr=
ol
> >> hardware on the platform that must be configured from a secure context
> >> (by design) which I assume could be part of this sequence, based on
> >> the specifics of a given SoC
> >=20
> > What was the original use case for the Q6 remoteproc? I see today's use
> > case is as a conduit for ath11k firmware to control PCIe devices. Was
> > that always the case? I imagine a more modern design would treat the
> > remoteproc as untrusted by putting it under a bridge or IOMMU with more
> > strict memory access control, so that firmware couldn't access OS memor=
y.
>=20
> There is an SMMU on this SoC.
>=20
> I don't know the original backstory, but if anything, the through-Q6
> approach is probably *more* secure, since there's additional access
> control hardware inbetween

My question is what to do with this series? I think I present a valid appro=
ach=20
which has its use cases, irrespective of which approach is better for a giv=
en=20
use case.

Alex

> Konrad




