Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFDD3DB970
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 07:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782459934; cv=pass; b=BqWm+tMHqWrY9qbIRJtyfks57IJ5YsfvhFfD+nl1KmEepLHaVVxwUTxfzDS9FT8+AzFtNJCeHg9aUsj3T8Q4nQwhvpjdfr5q/MBhvqxm/aJWTB/TaafXyPZAIehf9t1zot3LG8mUvTMck3lGn56q429CSCrGXmSOJO415pTIa2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782459934; c=relaxed/simple;
	bh=ge+ySkSvSTzpeQ1S1iz53f9gihYI4+PsNWb353vU1hk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qqOQPKU+XMFLEZhIps7Hqd8wUBJn/HjfGV9Uk4CUAnFVNdh6Juv0kVylZnGeKrLaVoT//FGth5C2MxV1RsNPo4+Mw7Zk6d+zPe51QWNGyjUx0uUK87bPoVPF96HObjHb+HA7IPK3PmVa+yOCknhjy7eRaDfILQnMYvqUx4msGMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxfAayX7; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxfAayX7"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30c8b23420bso1149047eec.0
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 00:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782459932; cv=none;
        d=google.com; s=arc-20260327;
        b=bVF8zdqGuxeeBb8yhFe81wKizDeaXdRJKIO6CzvUDJcrmYx9N+aa+jT9ckdmm8hiTD
         gRN1Sz/ZsRa9RJqYxIi7BGfLd5HJjClxZXFFiJdhR0WdrESEhO7DQBbZ9oy/O4W33j5B
         LhCumUw0d7iFEWzC40zj8UyXEsJhnk3DGfQ8D7SlAdgFHTlvMnNCPc6KCYcvDw08c1LM
         RXuMjXSTbP+yIvaP/+0QaJ5AxvWzDQo6CKv1d1nWr3xetaFx3gYpD4/cI6l1Qs51XQyG
         KmZ4QaaFIJJ/dzzhtAwW2pCj87BXpgRCx5RS6krzp+BAUmdPeaJrerKnklo3r4TV6ZRz
         fCrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hSE+T8Vd1MLikSGDmSCJ4AKkeGzaDcArm4bG+QIsXTg=;
        fh=nnlkA3qB+1vEwZ+/3hTjXovKjbS5mAlqJy4r2Lx8Dd8=;
        b=hfF4prderOetU7ZFVAyOpzl6D7Ja8cb7CZHqp13y945kTUvF46VHNd2E/cn9xXXDRl
         L/D6BbkVm8bKp5YzyYPQaCzZFkZsuJqo5VEGGB/5w1vGmi4mPNZJ296Z4I1D9tJmkso6
         dFMIlRz0YiLz0neQ3+v9/UZ6wg+hvTIm41G2M0rNglIoPf3OhdwKugvTfOBaBHsHC659
         G4dcG7kQbn2OQ4yY4IfxNq31vKAMrvhMQUETTWanNKwqaZxax9XFEWis2hVWvDpfSjM+
         wy1yfxB9dneicO9vCV36ogAl0RZ3koJq7LaRGEPRJm8czLtpJeXxd/4ys9PNg9J1hEJG
         3eJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782459932; x=1783064732; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSE+T8Vd1MLikSGDmSCJ4AKkeGzaDcArm4bG+QIsXTg=;
        b=jxfAayX7c7L53/cL2q8lINv/3hCoh0beRvAv3+2rHLLvkUwNCT+IVtzruSc83kCWvv
         DJNs/2YuCAl7dC3tb4hIHh5/BayzqCvwcG1PLYs/bAB1ndhpXrOCC3UMKb76bLJti3QP
         CrjUPOS3QDUJSLnDLMfBLMPvy1XwZ9XWu9LnILMRLY0bQ3aRdCATAdgNZYwO+cxSWtgl
         iHw+rYwaQYV0uHECkHeazUngxT4G3bXPoueAsmejtMt/kQlnJ/f42BWESZPstf01qMRh
         378FEhUrD0b7/c4iIO9x44svzmqC6BZWTcrUkiu8Rij0xF5RTYtUAzO9oOf4cGEM9BHr
         xZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782459932; x=1783064732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hSE+T8Vd1MLikSGDmSCJ4AKkeGzaDcArm4bG+QIsXTg=;
        b=DNhhEBiz1CDgF2mzM02v2MG+RfcjXtF1XvG5b35zyDguQY/83OfkcXbaFQrfnuKI6K
         gv96ThGNeBX5ApdcW9fjPOr+gv7MD1ug2qwPXErm87yJx8GIzXffJdOFYQMhXtKIspVe
         G+CkrSbD4gRXGRHO/j2n2XP4aG4M5yZC8lB+bi+P+LNSI03oW3I1KNir6txAx5e1kk1Q
         m/Y4jn5KDm3sgBO0LaLDRfuYPdDa9QlqVFCOgDW85E4Rb7nhyUEe7gIy6kkqoeBhAgmW
         rz2bNgUhQU3qq5RQLxZyToVpqBNW/hA7NncsA+4XSk8ORgAuGTILJOOr0T2dSh1jB/D6
         VjSg==
X-Forwarded-Encrypted: i=1; AHgh+Rqn+MjK8S2MNbwtw8btSj7VhcPoFRuTg0MCQXAWi4CzJuTxNASMGzYETgswkhwMpgoLwFhXHipmb6ry@vger.kernel.org
X-Gm-Message-State: AOJu0YwbdKjN7DTB2YBi2B198O4nJU+/3lZFJAWSCskvPdGNFUqoVOMQ
	R08qBZ1PnenC+582cbmUSenb/NpPVOgiY72q3sda2hMTSwmp9pkDRZcKOAHHdd/CA8PlWEmrBEt
	MUYkReeC8H9xlo2WAvBX1Ct1PEG50z9s=
X-Gm-Gg: AfdE7cnf5ADtsetALYdi7BVGY8y8tZ10Eg5g16yLMT4oExiTCFXBZNkYnQWbWuurkfB
	R6HjZyimzeRkZEtNKrhWSVBX5Dz8438MSCvtsRnOUuBoyjxQ8WOQ4AWbfG4p//S3rJpa7kgDExs
	an4xdDcWug12ApbqsGmPKWrHmzddeixhBY+Zh4K4xQBdKCxnlowcaNt8dmAS9InYN1YywlYIdsp
	6fhnGQso709C+GMVjeYul6foWU1iWqWGGVQnFXnJ9Ra5YOeJghyZ6KvE84rp59IeB4myi2J87Hb
	mmZxnMykjf9k0olbuFnz1MTMw0usgQ==
X-Received: by 2002:a05:7300:d08:b0:304:ccdd:594a with SMTP id
 5a478bee46e88-30c84d12a7cmr5988818eec.5.1782459931718; Fri, 26 Jun 2026
 00:45:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617070528.35006-1-clamor95@gmail.com> <20260617070528.35006-3-clamor95@gmail.com>
 <aj28fvj34b4_VI3k@google.com>
In-Reply-To: <aj28fvj34b4_VI3k@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 26 Jun 2026 10:45:20 +0300
X-Gm-Features: AVVi8CccXP_mAYvaQ06OenJXyIA8FoomOKdGLmNiaJ4doTQTPO6HkKiB97iqG30
Message-ID: <CAPVz0n0Ja0eKrpirtMxK8bkTV0NY-UoKU0c09qLEF-xMWmOzKQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] Input: isa1200 - new driver for Imagis ISA1200
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 26 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 02:4=
5 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Wed, Jun 17, 2026 at 10:05:27AM +0300, Svyatoslav Ryhel wrote:
> > From: Linus Walleij <linusw@kernel.org>
> >
> > The ISA1200 is a haptic feedback unit from Imagis Technology using two
> > motors for haptic feedback in mobile phones. Used in many mobile device=
s
> > c. 2012 including Samsung Galxy S Advance GT-I9070 (Janice), Samsung Be=
am
> > GT-I8350 (Gavini), LG Optimus 4X P880 and LG Optimus Vu P895.
> >
> > The exact datasheet for the ISA1200 is not available; all data was mode=
led
> > based on available downstream kernel sources for various devices and
> > fragments of information scattered across the internet.
> >
> > Tested-by: Linus Walleij <linusw@kernel.org> # GT-I9070 Janice
> > Signed-off-by: Linus Walleij <linusw@kernel.org>
> > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
>
> Sashiko convinced me that using mutex_trylock() in the playback work
> handler will result in dropping requests and that we are safe not taking
> the lock there at all. Can you please try the following modification?
>
> diff --git a/drivers/input/misc/isa1200.c b/drivers/input/misc/isa1200.c
> index c61adc4b605c..fb7f68fa0a2b 100644
> --- a/drivers/input/misc/isa1200.c
> +++ b/drivers/input/misc/isa1200.c
> @@ -253,15 +253,12 @@ static void isa1200_stop(struct isa1200 *isa)
>  static void isa1200_play_work(struct work_struct *work)
>  {
>         struct isa1200 *isa =3D container_of(work, struct isa1200, play_w=
ork);
> -       struct input_dev *input =3D isa->input;
> -
> -       scoped_guard(mutex_try, &input->mutex) {
> -               if (!isa->suspended) {
> -                       if (isa->level)
> -                               isa1200_start(isa);
> -                       else
> -                               isa1200_stop(isa);
> -               }
> +
> +       if (!READ_ONCE(isa->suspended)) {
> +               if (isa->level)
> +                       isa1200_start(isa);
> +               else
> +                       isa1200_stop(isa);
>         }
>  }
>
>
> If this works no need to resend, I'll fold on my side.
>

It does work fine. Thank you.

> Thanks.
>
> --
> Dmitry
