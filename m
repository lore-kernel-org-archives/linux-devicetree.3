Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC4D35C6A9
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 05:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789192384; cv=pass; b=mbTfhRbGB9IhS0ZE1uVxy2jkaBtEqHipKsMV+94BW+Xa8RT52y+TFI5zpDZ5R0cG8jJbmbs3LR3sKmgJW+AI2hr541AG3OQb4/AlPN3M0zvMxM/MRkViV3YfqIuetMS9XuXNnxXz0g3Uc+JUpqSKrEqXOfHVTXt6DAqn2hmKOWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789192384; c=relaxed/simple;
	bh=/9I8y5ZkP4ODohDfo0OYtleusAr+6bIH54mMhnAsLO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mOxqufQ4jOmQ8uaIaf6EJwDTRiLxI5xxr9rbhiuxey0Id+flU9zoEcH2rbTDppu68+/cDJqgcPE+9FzcjZuO3Iqed8L9fZYlwucJwq5pDbbOQpR+iWzT6cKFoPVY7qgGOUoOX1UTJ/5ZRt432c2l3uTyApksQUpCZ25WQgF4aTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LYGCH6kb; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LYGCH6kb"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aaf2ec5so238378d50.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 22:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789192382; cv=none;
        d=google.com; s=arc-20260327;
        b=idocboDR6qEHqQWtiamrDxz+c7gg4CTNPgR2tR/KcnVtiNdfOvVMtGyxkaPLS0myQG
         nDQKCPElFZ3xun/DCMD6eeE68MduYfE16j6uUwkmTKZGTsvzZENr9ZIiz8KObNMfzftB
         fdwQhZCN3i5eaLjmAF/V7gwehn1nzUAOs4P89beNb7TCDNLB7BOj68CjBDdRUwaUrZ1t
         3k5cXhT589fn6BigDA6psVgAhUjceNs+lJL1tLVuLIG4EqU6p2I2jDrP5f4Fr0SBwyqY
         iENnd/a/ZIBwQ6EFUd+QWaxO/UR0RaGm4gK8C5avRXvYjbrVenptW+fz/gmEZ6SrY5qP
         vfzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FWSKXBlRVQK4HizOnCRfHvGpk/soRBqoRAazsxuWHOM=;
        fh=2tdffsddi+NB0UOGxdZ516YmOC1J/z/0m+9HiduZgPU=;
        b=IKoWgf8k9neMtPUEYXzY2Q9EX/5nEtK0B+hWa7nTQc1xh7YdfEl3ezn8syStHDnEk6
         /84RZaRi/zCw0Hz/ah5fTjWYtn/0+do8STtM/R91HH7+M2/pAiRArrXhZrxxKViQ+pVG
         EU31Bmqx0Ze75JoYCxWi8ojFLVPItHTktke/hpAd8QNRaPh+Eusscqy8BXRIEAdbHrJv
         YEozdGESNPVabQZtL/W7OoQ8qd2vLNGuF8yG7XTGsju8t7U9f43FqTOjMGjTDj1XeHar
         uAWTHL7ZnkZCXOy8yINYvjHuhj3I84XvYLeKhoIvJBnYRrL9wswnLUVMHIB/rJLTPbVi
         1OGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789192382; x=1789797182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FWSKXBlRVQK4HizOnCRfHvGpk/soRBqoRAazsxuWHOM=;
        b=LYGCH6kb/pJnM18MhFnAY2ZweIGLD2gEr8TquMj5Wp2o1YHBCmOjmVlMhxe7pHU4wA
         SjwwNJAzt1Iv95mM0QdzwGmde/IwmLrcJ1IecLjZzg/OQeQ8r7JRU/BwJ/0HEJRJXwO5
         EZzyi7L2kwvMGswxTtf4tPZ/asl6WehHJZ6ZNxx5SvneJESCV9/D2+YmQyooCrIO/c/d
         3Pq4+CqIaBfOibCRbLWeepp/AtIw8pYj4OSs9ZRbUB4bcQyZ979JyqA+z3+AYkcTfU48
         4gd16PzKluFocHTc5/Sy0+Jhw02fbJh94/8NrIiyZwRb2rkHXT14x9VN3nozbExedER1
         fMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789192382; x=1789797182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FWSKXBlRVQK4HizOnCRfHvGpk/soRBqoRAazsxuWHOM=;
        b=nY0HqPOERtUm7oAzLVzSzZpu3ar3fCdfsq2OfUxONAysGQoiGEcJilNMTskEgK+ehb
         K88L7UvRCg0jC3FbvQ7wtYC6nmO8efT4nQ8QDMuzUrRfNLSFPbev7ghL7oRMNBDv651I
         iYKWzB/kcTBr7uRzoGoBbfJkiGK5EGus9CfwqiqHthAiJUzxrJX8b/y6lY+VZ459l0DL
         9z8jxfzNGA0aZxYVZPr6wbE/XA9uIiDRtInrj3OPnvv0YsYCmcLdyYga9Qv7vWoegH92
         0remn/EPGH0t5SoSEf9HUbLPNuKx1FZNKWyfo4wbP1Lqs0hYN+blh379yRqJYgjJbkqy
         2iCg==
X-Forwarded-Encrypted: i=1; AKwUvBx7exTa1Eg9KwPswt7qTl4ViPAA9un/ppBkPAKCfkhRNquhAkUitGS2dWWSJxOAR2p3nU5+CNBjWiF4@vger.kernel.org
X-Gm-Message-State: AFuF++lqsBL3wX4fkR1LkXCdgzKf80pG+PTM6VhkseJVhq2fcK5Nus9z
	fvEl6DItzD9brJAQtQ/XO4nrKslJG4myT08cZyBOlqhCYsoWfbGOsHWF/oLkj9hh7XkYiveZksr
	uxyTxRhU4/nXZjSFh3bOB731ExTpugI9di0wt4YO1Sg==
X-Gm-Gg: AYBFou1zoENuUinlU0U9NUbnQAIklPdna77vSNeYv+dSfLM1KN/LBBbDyLM9E1fGabK
	yzJtZclz5iJG8ZPQ+GyntRP1aXM3v3lBu6Y5z+Afw+tGJOQp9UIwlE4QWfbh7ZPGIkPWJad1K61
	vv22Qm9coXkDOlijCLLuX/Eo6hYFuJxywIVLd4rG8+B79MhofX03/PPFlt/5kBTuvuC5om/DMT5
	NgXMIFDY0Pf7QrWJXLf+79W1IJDIbUYvb6l9o3KAG05cEF0kNqhaaLQLEc3N4auyucVNn0rAc6h
	/8UA+6xY0PZsu2eXVTdzIzw05LSlXD5yfXniexSmLc3wGdvdh1KVSBcenvl8yyc0hTzmOuOf2Nv
	NnbNVLmntHSwXEA==
X-Received: by 2002:a05:690e:12c2:b0:66f:c1be:84cb with SMTP id
 956f58d0204a3-67135a1d461mr326324d50.57.1789192381752; Fri, 11 Sep 2026
 22:53:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
 <20260727-exynos850_sram-v3-1-8627a49188ec@linaro.org> <CAPLW+4ntx8qLy9jAYYdT+XwxwKHjvisutqEi04oPEQny8auD-Q@mail.gmail.com>
 <DLCMHTJ9SYL0.3HW3W6N3PFYWM@linaro.org>
In-Reply-To: <DLCMHTJ9SYL0.3HW3W6N3PFYWM@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sat, 12 Sep 2026 00:52:49 -0500
X-Gm-Features: AcwNN1VD8BCzWQBSI8YU3zjpwgpLQB8VunevE0JIHRoygZZzTiTyguyvXbn5lqw
Message-ID: <CAPLW+4kS-75pC46xFSwb8oUUvmyTOysNGrei8h-My0=2d0p5hQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: sram: Document samsung,exynos850-acpm-sram
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 11:20=E2=80=AFAM Alexey Klimov <alexey.klimov@linar=
o.org> wrote:
>
> On Fri Sep 11, 2026 at 1:42 AM BST, Sam Protsenko wrote:
> > On Mon, Jul 27, 2026 at 8:23=E2=80=AFAM Alexey Klimov <alexey.klimov@li=
naro.org> wrote:
> >>
> >> Document "samsung,exynos850-acpm-sram" which represents an SRAM region=
 used
> >> for ACPM communication on Samsung-based SoCs.
> >>
> >> The SRAM is consumed as a whole, is not split up using child nodes and
> >> properties related to this are not required.
> >>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com=
>
> >> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> >> ---
> >>  Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Docume=
ntation/devicetree/bindings/sram/sram.yaml
> >> index b83fc6831947..b9c4d4f3199b 100644
> >> --- a/Documentation/devicetree/bindings/sram/sram.yaml
> >> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> >> @@ -43,6 +43,7 @@ properties:
> >>          - qcom,rpm-msg-ram
> >>          - qcom,shikra-imem
> >>          - rockchip,rk3288-pmu-sram
> >> +        - samsung,exynos850-acpm-sram
> >
> > Is there a reason we can't just use "mmio-sram" for Exynos850 ACPM
> > needs? I can see it's used in the gs101 device tree like this. If
> > there is a reason for this, I think it might be a good idea to
> > document it in the commit message (probably in both patches).
>
> But isn't it already in this commit message?
> "The SRAM is consumed as a whole, is not split up using child nodes and
> properties related to this are not required."
>
> Also: https://lore.kernel.org/all/5797be19-8886-45a2-bfce-eb7d5f0df6c2@li=
naro.org/
>
> Do you want it to be re-phrased smth like this:
> "OSPM ACPM should parse the SRAM and discover essential data (e.g. queue
> offsets) for establishing ACPM communication. At this point it is not
> expected for any software entities apart ACPM to use SRAM so the SRAM is
> consumed as a whole, is not split up using child nodes and properties
> related to this are not required."
>
> or
>
> "The OSPM/ACPM IPC should parse the SRAM at runtime to find configuration
> data (e.g., queue offsets). Because this SRAM region is dedicated
> exclusively to ACPM IPC communication and is not shared with other
> software entities, it is represented as a monolithic SRAM block without
> requiring sub-node partitioning."
>
> ?
>

I was thinking about something more like this (in addition to your
existing commit message):

    "mmio-sram compatible can't be used for ACPM purposes because it
requires child nodes to be declared, which are not needed and make no
sense in case of ACPM."

basically to answer this question directly -- at least if I understood
correctly what was discussed with Krzysztof [1]. Other additions you
mentioned might be valuable too. Anyways, that's just a suggestion, I
figured if you're going to submit the next patch series version, might
as well provide more context in the commit message, but no strong
opinion here. Also, feel free to add:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> I hope if there will be other software entities then we will be able to
> fix it later.
>
> >Also,
> > should "mmio-sram" be added as a backup option (after comma) in your
> > [PATCH 2/2]?
>
> Sure, I can add "mmio-sram".
> The compatible =3D "rockchip,rk3288-pmu-sram", "mmio-sram"
> and compatible =3D "qcom,rpm-msg-ram", "mmio-sram" are used in such way.
>

On the second thought (after reading your discussion with Krzysztof
[1]) that probably is not a good idea, kinda defies the point, because
for "mmio-sram" you'll have to provide more stuff in the node, right?
So I think it's better to keep only:

    compatible =3D "samsung,exynos850-acpm-sram";

in your [PATCH 2/2].

[1] https://lkml.org/lkml/2026/4/14/523

> Best regards,
> Alexey
