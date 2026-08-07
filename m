Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6032532939C
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 18:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786126907; cv=pass; b=DDA2qQPOoEtH0COqt3UmMgKdM5tw/QQaLy04h6tP6Zk0IGQZNVG2P9ivxtwmzJb71yrLYiHWjOsnttY55UhvJ0/hTrmzqFBoHO/T9YYSmdQFCv70q2KdIRRWEv7JAcUpBB7+GaeKBt9hf3Ej3v/NMyobBauxm2s/ECjX4aJzjlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786126907; c=relaxed/simple;
	bh=DFiX/7Q48wo6L4d7tIX2yPIwJYCBwS0h6wyv/X0iH4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hTNqcQGBicqH0i28aPfI9T57aJr1UPczbfWhwoUMVX5rhp9+xJvMxZSwE/r3dLitNXizKtY5rOIOTMvvHAqmFmKg8q+iT9iOS6I9CGEmEp7ADEbYQp5X1lRe/UfikldPaJzSCV828p1VCE0Cqu2i3lpl8ICWmaLBuD4BdNK0NWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mpsDPpKe; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mpsDPpKe"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c10ed63c0so29371cf.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 11:21:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786126904; cv=none;
        d=google.com; s=arc-20260327;
        b=c269EtOQiVBcGt5qfJK1Qo2kFUiNC84Iubb3vh75csqdqD10eDs8cXkjjV78cC0tnb
         gaWS/ULuSSTQMrxk9s7N0lEkXRVQQ1LB40+5QMF+QJ/CIVq9h2qgMmz1WQV0d6mYFZMe
         Pl2YSZAVchXUMJWARSuOe1jLa8RVnD2gI8Dve9rslqUs97lDhomCSg4NFmKqiiXSoHn8
         6POPZw64W8f9UXFRRJxxETuK6A9gDWinyu5kCgzmEP2cPIQEjsyhOggYy9Qv/Xr1SG45
         ydaybpKK8hUmwQTrKU5Ng8O18iKMdIjLaLwDhUkBlwr+1HSo8N7VbwyQF+HJpThG9izt
         IJXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DFiX/7Q48wo6L4d7tIX2yPIwJYCBwS0h6wyv/X0iH4c=;
        fh=rEWcrRvHb/BGPv/6HwJd2xbIDErJ6dW9Yfd5CaFrghg=;
        b=QUQ8zj4PA6L+Uk+VhaSnPg7rJS4dLYvtmIsYp9V0UL35hGsSQ9q9RpsFsYbofPusNv
         x8j0VAg8FMIW5UTQGF7XXWpRVhGtMpKrWIJNPYa+Fy8CeEdPs0Pg4i/OxwLySluN7Scv
         VEV8iipRovGUQ8/xcx+gVuyIhj1dAC/7cQgmNHqtgBvBIb0Y+4G7b76sFpE06GwUqDeB
         A8jIoe37Ugdykd574OGetYKkiTEHUyTZ4LaCQhphf9p2Y8SMj7c+zNkGr2aOhGj1pA9y
         HiyhklAyrOfF1U8mqzDa2uS/gVqY6f8o7+0kWyT2eTTMaHugrFw858yzmnjmUlpF/R3v
         uFxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786126904; x=1786731704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DFiX/7Q48wo6L4d7tIX2yPIwJYCBwS0h6wyv/X0iH4c=;
        b=mpsDPpKesH1FZzcVHwT0O9HMy9y82ulqtiHYCFDqdQp1e5+NjpenaHV2QbGSb1RQB4
         G9BVX97AUCjMB+7GQllgVsPrYQ/2mWzGM74/cWDrptBn0PldkZ3W2kBjpooilgElu3YM
         oxzRJHBR0gRjMVLC6c6J4++nU+8oBe4cByRd6qrrp7HqwogrBhIoDZg4oLeB9oExT/0D
         cqSTboR1zecStPhk2BimdLXFou8UDWdb4mpJfULoVI40Gyd6SV+dogEwj8If9B44V+Vh
         P842v3OBa5bL4sMyNw9Q7PbQYfMyk5V18OAdTQlR1Y1PrkJ9Jmu0sNqJaEiSDjq/x8xv
         85nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126904; x=1786731704;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFiX/7Q48wo6L4d7tIX2yPIwJYCBwS0h6wyv/X0iH4c=;
        b=HqS6Id3ZB+ylavfHZSPasAbXVa0w6DK8DYmYIInwie9MQnd+cwi3ryZIVFbCkBdHJz
         sHLY7+m06Sj8jInPpyo4CAtRjJhQWfkbV1GMWdczeCaz8jzkC3eQW6TB29oAMIFjBX7E
         lrH+fQHO7zinuKDrnwW/IZZh8+E5EsZ0c9igyANAFdL0PoBnbMCVcskug8fkQrOLEqJc
         rOC6+aGJ2KuYdnkEzdjp8VeoVsk3Iik8/Pr1j+YjJNqEAC6tNwe4RHqbJPc1Rkx/b5oZ
         1VZmiQP/J2VOGiUHWKRl+105D9rmSigAipsqu++MyfZ28jpFvZDdmkwdxVnMdbaP3FW2
         ctFA==
X-Forwarded-Encrypted: i=1; AHgh+RrGuX4SmEBdepKKKZXhaJa1qIYjepRyWSMSwqMw+e+rTgXkTi6aRcSqsPIjuyw5cH1zlzhswldZrSmx@vger.kernel.org
X-Gm-Message-State: AOJu0YyEfW6IgSRocwcMrgq0NFP4MrxDuOFa/bsHQscv2Y0azoDcd83s
	2V7o3AOSiL58WYlpDTTDZTS1pND57dmxzIESt5xxxlQ4Is1gS7dmxDDOk0/a78slOrJZ5y1Ku1k
	Em153iclx0vLT68fTWRfgWglezzdbASvXCSmof0/t
X-Gm-Gg: AR+sD10aS39bBB8hHpPbJ9J3EWBmTTAa8vh7l54CGsg15orWU9eKrPVgNS2lcXxHW/s
	QKJFdMUlAPEbXgpb7KIDtVCWgeWMQByW68yjLfVvsLQSjHjpiQGoNDl4/XkcDoehst6MX1InPMm
	Xze+FGz2BVutj0oDbr3p4zMry1ICjohP6YoMOyxGFdgbWcZhFWGosYD8MQL2UubuUx19F0exZo6
	aNw782LqDPumJhhGrn7IYUHnjJTpnSiO2bsp0EbKLr1Jq45PPCErO5/w0PzEdkDEaBOsopLNzGb
	78gZ8OFA6zA+ly4DIBHn8uupBMk5qaQyg2B9qkYLQA==
X-Received: by 2002:a05:622a:1b90:b0:50f:b69a:f4a8 with SMTP id
 d75a77b69052e-52d23e4c482mr1477201cf.7.1786126903631; Fri, 07 Aug 2026
 11:21:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
 <amYIuhYenP4-qHyV@willie-the-truck> <0b7c0272-5506-4aee-82b3-76a78f2b39dc@arm.com>
 <CADrjBPqZFDvyLFpDy1YP9qrMNUCtZYtJhiaDd0iTnmB4ZYO8GQ@mail.gmail.com>
In-Reply-To: <CADrjBPqZFDvyLFpDy1YP9qrMNUCtZYtJhiaDd0iTnmB4ZYO8GQ@mail.gmail.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Fri, 7 Aug 2026 11:21:32 -0700
X-Gm-Features: AUfX_mwDnipayqqhz_vuvH-F5cw1FS42rqk5A6i8RcOd5oIHDgvQ1fDjMyBedVI
Message-ID: <CAE2F3rAHM2oTVM03ud0SQH2mjVXGU7Ns3gfc_YT4sTomNLjb_w@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add arm-smmu-v3 support for instcfg data override feature
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	willmcvicker@google.com, jyescas@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 8:25=E2=80=AFAM Peter Griffin <peter.griffin@linaro.=
org> wrote:
>
> Hi Will & Robin,
>
> Thank you both for your review feedback.
>
> On Mon, 27 Jul 2026 at 11:53, Robin Murphy <robin.murphy@arm.com> wrote:
> >
> > On 26/07/2026 2:16 pm, Will Deacon wrote:
> > > On Fri, Jul 24, 2026 at 01:39:41PM +0100, Peter Griffin wrote:
> > >> These two patches add support for a new "arm,instdata-override" DT p=
roperty
> > >> that enables the override of the instruction/data attribute of incom=
ing
> > >> traffic to Data by setting the INSTCFG override bits.
> > >>
> > >> It is intended to be specified when the smmu can't guarantee that th=
ese
> > >> attributes are provided correctly from the client device.
> > >
> > > This is going to need an in-tree user and a much more detailed
> > > description of what is being worked around before we consider this fo=
r
> > > inclusion.
>
> Regarding an in-tree user, I haven't sent the Device Tree (DT) patch
> yet for Laguna SoC which adds the smmu nodes and this property because
> 1) I want to land the initial SoC/board DT first
> 2) I want agreement on the DT property name. Currently I used
> "arm,instdata-override" which is what downstream used. However, since
> this is intended to work around silicon errata something like
> "google,lga-instcfg-data-override" might be more appropriate?
>
> For Laguna SoC the first in-tree user of this is the amb_smmu smmu
> instance which is used by the Synopsis dwc3 IP. The Laguna dwc3 glue
> driver is already upstream at drivers/usb/dwc3/dwc3-google.c
>
> > >
> > > In particular, if a particular client is emitting data reads as
> > > instructions, then a better work around would be to avoid mapping its
> > > domains using IOMMU_NOEXEC. But I can't tell what's going on from the
> > > limited description provided here.
> >
> > Unless it's also emitting the privileged bit and thus falling foul of
> > the implicit Unpriv-W -> Priv-XN rule, but then we also have the means
> > to deal with devices which actually do that themselves (hello pl330...)=
,
> > so that would seemingly only leave the case of some innocent piece of
> > AMBA-interfaced IP which doesn't expect to need special attributes, but
> > the system integrator has gone out of their way to tie the AxPROT bits
> > to some wacky value, which I would put in "erratum workaround" territor=
y.
> >
>
> You're correct Robin. It is an erratum workaround for the Laguna SoC
> due to some custom usage of the AxPROT bits which differs from the
> standard ARM SMMU handling for Privileged/Unprivileged and
> Instruction/Data transaction attributes. The effect is all
> transactions appear to the SMMU as "Privileged Instruction" accesses.
> The software workaround in this series enables the SMMU's INSTCFG
> override feature to ignore the incoming value and treat all SMMU
> transactions as "Data".

Due to the specific integration of the MMU-700 in this system,
AxPROT[2] is always 1 on all TBU subordinate interfaces, regardless of
whether the transaction is an instruction or data transaction.
Consequently, client devices have no control over AxPROT[2] on the
input side of SMMU. AxPROT[0] (privileged vs. unprivileged) remains
unaffected. As Robin suggested, the override is required to avoid
inadvertently triggering F_PERMISSION faults due to the VMSAv8-64
requirement that EL0-writable regions are treated as Privileged
Execute-Never (PXN)

Drivers are already avoiding IOMMU_NOEXEC. I prefer handling this via
the SMMU configuration rather than patching individual client drivers,
as this is an integration issue, not a client device issue.
