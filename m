Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4613C7DF8
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 18:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774288965; cv=pass; b=IbAO54holduPTs8CMGXmDl8hayB4N5Y3HVJDVKRFsX3nuzDmhIp5IYz/gHL61bA80m/ULtIgH+JfBqMIPcSA71YLWqY1ev7FNifdngWGeDXkfRtfGdOmu165zeq+XDEF1C/PRBOYtCw3LY8kAeA+ZVsjpoAAKcPeBSa2h9/zht8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774288965; c=relaxed/simple;
	bh=iVJYDMHNyDCesmIpYQjf5t/2TZzun6xBePuOLxarvaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RBc2bdKO+SATb1Efurq0k8gTyQnS61+im17Jo05f+oDyDD7GNCXfOehbX1YYvueoOuUXd51JHogcYbYDPoWk7FkTmdW9izWq4wcoZnzgGQhLL8jntNpCDupPDiRhKKl6abIE3rN/MVQUxZiIPSQ0Vc5kMFrQqCZ8dHEifB9aYDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REo9LC+C; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REo9LC+C"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64ad79dfb7cso808326d50.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:02:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774288963; cv=none;
        d=google.com; s=arc-20240605;
        b=S3BmBIIua3y1nwdcNWu7XmHn7KKJHqpGKk6ESsRl9uDHE+I2jkr2fMZtQrJjmAba4H
         j0+jVJSb44YvuDPdPRIBgGH0Hk7HKguLNAjGibHQQ0AvwPVi55JKTYRLMXnHvUDOij3G
         RU6NqUW/KJGGTnNfBs59xwLwhtuvGv80o7+8J5OO3KZx8aPmzmfbQVORyhU1kEQn3Ujq
         TcKGOVM56OSpZOCg2kIw/hcJPkkHaQm+PXt6kkt8Ox7Og9vxtnMbJ/OWaragXr5kzgpb
         DgGbx/512JZPGL3Y+3uujotf7m1S2mpdkIFy983et5/wh96a2iV3676G/9xSUQl0pdBr
         iPwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6THnl+DNe7um/ranod1N6/FqZLqgHsG94BHHkoGkoxg=;
        fh=eRMu9QCxj2AuanHr7znklInr7Oxr7HKvHlFwxhwbDUI=;
        b=B8/OL9KZuPD+M0kKgy769Oq3ypMqgiSVNe+wVbcjIlwpTJo2I3KJfj9jrEI/q8iA5m
         WgpPn2lTod7Ph3DNHxOSLTW/35omrExeDRcKM+BntQW7iuvMys5LD9qLLtFLdBolR5v1
         SbrRsuyBTnpoDYxHS+7ZW4U440g0GVdSRX26gc0JTEutKlbBihR8u173M5zZFJbud5aV
         Js0n6kLzlViRBQieaGJXNpnS65tSLgSJEY+qmRdDdnxVrRLbxwrUP5x8Fts4e7z/lw2O
         UFyvJE1OhbxY6kdRL1zg8cWRUm33KBD7R5CpLe9SsSc1/+ZOSitqsMR1cQCcLBe8eWDa
         VJuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774288963; x=1774893763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6THnl+DNe7um/ranod1N6/FqZLqgHsG94BHHkoGkoxg=;
        b=REo9LC+CFJW/1iPD1ArWt9rtpwJd83thQUwlRuvU+ZuDA/gVt2Eecaq01f/3BffKoL
         YRYM721jFFMkKTacOGPYz1fTENQEJJiuGZ62HGRBbr7L3OCbj0IkpsZocq61eFd6paGr
         nfJbrwS+RfxApEoVogo/w6DjWrtCidfoJT1xDS0+cvA8WCwDI1kd/t/fLE0wpAixesLl
         hMdmvLU2jvtolAXrCysMCe56/srYMgUVNIso2q4shSG6NDXDIuR9/j/R0+hWjONRer//
         kiYQjVLUeTp5YLpel7S8W3bHbcMfVlgeYxm+uzEOWZiO82tTe1stVYghDob3o9x/h7QZ
         pl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774288963; x=1774893763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6THnl+DNe7um/ranod1N6/FqZLqgHsG94BHHkoGkoxg=;
        b=s/WpnVxXdBtNneU1tWvR45VFWaxr28Alp+MbZfHF4R7BtNmkK2Wf8pSct++043YF2p
         ztLv5GgYnd3QtzfOb7h91lkfYRsHbOIW1y4StY57RDNnREQnmMZMay7fFgqBZ6biz35Q
         l9SZ/jMOY7V3i8UAnEL2u60Xu1OxJpRcXyDhTc3usZf50Z7JuMGCDUTSofSFEdI9uBQS
         g4+UHC4zML7UXWV6M4ALl36MPhVPm/4qX/v6QiCn+BDkQsuUcl9+9SMhFxs6IgUYsFqG
         NEPTm1O0Kr1yLLPxxr0T1JFBGMGYDB/31+LMEzhekuRZeq4ohRPtEDOD70KSf39aGyHm
         nPhw==
X-Forwarded-Encrypted: i=1; AJvYcCUiXSuC6On3EsQbS1ueipO9sUj+DqcHDXVGbBaLVhK+hPiEoI4D7g0A/qrRnKqTtDlsL+OFxPS+RO9v@vger.kernel.org
X-Gm-Message-State: AOJu0YxDmlEZi7DWMvg+3F0LHGOExqar+8UFShmOXQ7ZSmuhFMg6oMgG
	C2iiNclpBCpb2BbPx+uV95EKgIr2KhSQucaEMCphgJQCnuUQEAyfuH0uwPQOELyjEl2jpfez9O5
	ZqjQ2Gz8359OtuF1DwiaLBN4ox5yt9io=
X-Gm-Gg: ATEYQzzSHftyuCbifGS8ufdonpJgDwtK6KQ6LfTYAxs6aFRcRIf/NIcWT6Nh8hoQTA5
	tChf7ADFE6WMFhLErnmX2+wowgDzLbcCG8+C1LPoL5HP89deR1gE0+iH04Uwy7uGXvDEnO4zklh
	g/kJ79w4z4GJHpAr+xHcSN4IcDGkg/9gKJMqabf/3uJ8yj2hFza118XDOeljhFkHc2Wnjd4d/T0
	v3Gg+b4GnnrLVExau12/K1YiYkvWB5d9V/p81LDvxwK2fpcQVfWemegi600kS5bUQp2+mdttG13
	7qafqHDQMURVLg8sJLCP+QUB0Ivz/ROENNcz9w==
X-Received: by 2002:a53:bbd0:0:b0:64d:6cf8:f9d with SMTP id
 956f58d0204a3-64eaa7fdaa0mr9907572d50.58.1774288963108; Mon, 23 Mar 2026
 11:02:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260315080302.454233-1-challauday369@gmail.com>
 <5731aafd-8a72-4a81-8a0f-04c1ff5b69f1@kernel.org> <CAAj-GB=1+sZcw9jomC9Dsw8ojyKUs2zahpeXt7VXoXE8V4DK1Q@mail.gmail.com>
 <74f53763-d33c-46dd-89fd-7e9aa076156e@kernel.org>
In-Reply-To: <74f53763-d33c-46dd-89fd-7e9aa076156e@kernel.org>
From: Uday Kiran <challauday369@gmail.com>
Date: Mon, 23 Mar 2026 23:32:30 +0530
X-Gm-Features: AQROBzBLcG9r8mQjtrtDi2iFv1rmr-Vux_2MXzqTTPUH09cGJ7BifZhGveoJHCs
Message-ID: <CAAj-GBk_2xnZxTpj7fZHqQQjLOA2xCuHdSPaUuK7RxLXGwf30g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: mediatek: mediatek,g3dsys: Convert to
 DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2026 at 3:27=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 20/03/2026 19:00, Uday Kiran wrote:
> > On Sun, Mar 15, 2026 at 7:55=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>> +
> >>> +  "#clock-cells":
> >>> +    const: 1
> >>> +    description: Number of cells in a clock specifier
> >>
> >> $ git grep "Number of cells in a clock specifier"
> >
> > Sorry Krzysztof, I didn't understand what you meant. I've tried executi=
ng
> > git grep, but there are no results apart from my commit. But, I've foun=
d it
>
> Exactly.
>
> Therefore why would you write a style code which does not exist in the
> kernel? Why doing this completely different than everyone else?

I understand now that it is redundant to add the description for provider
properties. I=E2=80=99ve removed the description and aligned the schema wit=
h
existing kernel style.

>
> > in clock-binding.txt i.e., in clock.yaml in github. After careful study=
 of
> > guidelines.I've removed the description of provider properties.
> > Please let me know if there is any deviation in my understanding!!> >
> >> Your mentors were supposed to be Cc-ed here.
> >
> > I'm part of the Linux Kernel Spring Unpaid 2026 Mentorship program and
> > I've already Cc-ed Shuah in the mailing list.
>
> Does that mean LFX mentorship also has sub-program like GSoC for
> bindings conversion?  Does this program at least incorporated our
> feedback from two years and year ago?
>

It is similar in structure to GSoC, but it is not specific to bindings
conversion. We can contribute on any subsystem of kernel and I'm
trying to align my work with existing kernel conventions and feedback
from maintainers.

Regards,
Udaya Kiran Challa
