Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30283244667
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 16:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780246188; cv=pass; b=afHu2/zqA2E8DIu1j9GWtCTu7cnIgpYZZKjQSOFc7jWDyCSnaO+nxSUg9Z50/W4sUKPPU6mLQwaLeucL98bTGPVNoXje9fK1tzzRiw/l7yAxdquIiH3Y7vEFMfsXTcP/J/JHvT9c7fwnqYAEaxv3Nu07dU1ndSPOEUeTDNggXig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780246188; c=relaxed/simple;
	bh=zryTzG5iMk2H82QgYnJw424xfPn+paahJo2LEFSERZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F7rxQzkDJ5Hd9pLuWNPs2CcISOVk0IMpA37cabXjopi52SJeGr4D8OiDosj4ebQxvTCvNCtfPkcfUgTpGUXMXV+PHKoDOv4jP9bRGVv4V8euFExeJtbBQoak6AB3M+Z+5bhkVFkDrojYUo5XrjOHAAKfKomJkFB1Ukph4ZIYzPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pG3qjnke; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pG3qjnke"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-660323f7b27so3916222d50.3
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 09:49:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780246186; cv=none;
        d=google.com; s=arc-20240605;
        b=Uk65xH4f842rLJhNRzWiHoPmRKgNCpf55nfBkFOeQjmPMjS8Vuej6Q0wJlxrP99qtu
         DL1HziMRsRcHLfgQ9ZgY2ce2qzJhXlsQxh6lgWSMqK9oM9QsHT4mxVDEAAB8bVonekAJ
         Cvqyk9bMwcc7vqHBl2uGsPP//waRwDeGcuVD4j4v2LkSJf4VFT2rz+tmvEoSb0Hqjj5H
         O1dN3GnXRtNgAjTMbcAn4BEplcRQSlanQt/1OdIB6PR7V9FtX5QmBKdT8YxBGjxb9vpx
         /5KYPdBX+xDkvAMplDqV86Y7mfm6gt8gqBbBqO5tdvgauO1CnxbEavmkqxp4FDk1ZY2u
         WZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3vvVnqsmhKyobaDGiJTopk2ghuyT9Gj6GdwlKhFFPf4=;
        fh=oocSR3Es1J2w1YRHI9YeeNHtdAdsamdxlwt0d8ZxL1M=;
        b=QKWhuUE2AUvlntSG8xMEJD1KoOzXR6V3RfvdTUWDCNpwnavSjMOdSRakjj+V3Cu/Ws
         xCKvMByaboZLZYQMrdpQZ1WYDkB1W/nkAWtosB7OSQPSiVQPKf0e2CCmhxGGtF5WsxRi
         BNB1Bz1dgrNNcn0E9vqxQxIqRYPKQOOeW01AoHhVdun3mirbfgJk7PlQNemEnigL8SaG
         W2hz5/DzzPYGHH8/p07HiZtbEA6J2eE0mOAtn0pnK6C5nOwDNBr1ggc15VRQbgewxiwj
         c2V98ixUB9ZAUGER4NxgkMpX7fw1BOu3lHfwLfM2ld3wQknjiS0KlsXuu1CCyVXUzbue
         PsSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780246186; x=1780850986; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vvVnqsmhKyobaDGiJTopk2ghuyT9Gj6GdwlKhFFPf4=;
        b=pG3qjnkeKtri2oU1iERdmsNx/YDIBxcm+twg/WvtZNFkQS9HDpIChonqUgDcmfu5LS
         tu3z6mNmMgiiDgLOdQUit8KtuhfpUN4tyC5zNTRPJW9O5tQlgfyhdO6TU1jEYJrIK0wW
         qzczqPoKgfUSaLLZlEgfK8C8/GKdDeCgVq484EjDzNREJJ38M4kzphvvhb0lQoH9kMx9
         oCflY+B9ONf7vSQ6br1yKMIE429fcDWGog5tWkna5yVBHNw3nbFpGeN7KUGlSAmyjKgJ
         nBxKjgaz55kW/lYrctjV64dzH/4C+ph3cKfFWlxrSN6JpgXIfupxkUtQ7MXWMCURrEp2
         jnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780246186; x=1780850986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3vvVnqsmhKyobaDGiJTopk2ghuyT9Gj6GdwlKhFFPf4=;
        b=MVGoRw/LAnbVxTgDqTdR5baRxyHXeOjKa4ZVE0BgoFRn4PBp1KIT4O7hJ0NtUffD8A
         BDayHEN4cXhx44K5g2yGozajBcdz6UKiBMHrsxNp6L/zL60zdLcLsw0kT5FJsrTx05RR
         lZyUEln3UhI2Z+mr4stSYEZagO8BzRoXBe7rAScdvoNyySgudn62UmsgF4pLExV6VCRl
         k/8Y/MDWVA0FCmuTqAa54oxxLMOVEKbZsazqO+F6UpBBuYRrhuF4YxTCWlCh3WVmW8ke
         vIBFuZBVFUy9apJVJ5l3zwEvbwrBjg2sONxs+Lb6SrWuuQ6qvylB3HShmUm2Qn5FB5Wl
         DJMg==
X-Forwarded-Encrypted: i=1; AFNElJ8C3ppwmAzoCY++25a0MBI9sAUHmksvxpHldVhcCDkNrhW3Ghczg4BkuM4FU2tb60zqDpBe6FGdbxAu@vger.kernel.org
X-Gm-Message-State: AOJu0YxHFw5TeMfHTBh1gIM4g5OkpXophVkZK6DeE6sNERkRZvguWdUK
	4osEO8gOMj/OHvCE36OZ3Mq3VPq0EbrcinagpXUJpFU1XpZQgExTVzHfNQSSXZ7M3Xr6W7tQ7MU
	7o9jcy6GzC1sQe8yZy1xBBu871eAr09E=
X-Gm-Gg: Acq92OEZCx3POgHf12dkk0x49be1BFvQsaz7SHHih+NfojEroTeqq2rjuCw+fut/5yK
	YGQCh7leyxrVNSmW9X3i4AbtX3xcCucrSYLm57Bl0iQyIfD/ZMnxaM/FD/Rr5Euk395o508Yh6R
	NvideKER11BOV3LUL79LtKqb50yRn9ZDezWs2mDNhGhjCLo+l2r1cLzuPqDtFiM+XpMBEIuBSzy
	NLX7G8LkqaMdkVrQ38/iYfrlTzvWbvzghzbIxd7kgU7IGC2i02N0YUpvZo6DeB9T+MRroaIQroI
	R99GdkYMzkQmsj2YnQ==
X-Received: by 2002:a05:690e:13ca:b0:660:5c38:8f3b with SMTP id
 956f58d0204a3-6605f71a3b6mr5723987d50.53.1780246185998; Sun, 31 May 2026
 09:49:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524151110.21277-1-challauday369@gmail.com> <20260530-academic-aspiring-sawfly-7dcfab@quoll>
In-Reply-To: <20260530-academic-aspiring-sawfly-7dcfab@quoll>
From: Uday Kiran <challauday369@gmail.com>
Date: Sun, 31 May 2026 22:19:34 +0530
X-Gm-Features: AVHnY4LxpC2x0GiINlS7vOZo1_ti4_hwMiVaPwxDTitDyXiuaRJqEY0xfeuMxek
Message-ID: <CAAj-GBmNXvTNbnQ8hOzsjnQd0Oi4a17LY8yjb8HTbD4PpTXH3Q@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: clock: via,vt8500: Convert to DT Schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, skhan@linuxfoundation.org, 
	me@brighamcampbell.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/via,vt8500-clock.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: VIA/Wondermedia VT8500 Clock Controller
>
> How PMC is a clock controller? Really?

No Krzysztof, actually that was a wrong direction in v4.

> > +
> > +maintainers:
> > +  - Michael Turquette <mturquette@baylibre.com>
> > +  - Stephen Boyd <sboyd@kernel.org>
>
>
> Subsystem maintainers do not care about PMC. This can be platform
> maintainer.

I agree with you. I changed maintainers accordingly.

> > +
> > +description:
> > +  Clock controller bindings for VIA/Wondermedia VT8500 and Wondermedia=
 WM8xxx
> > +  series SoCs.
> > +
> > +select:
> > +  properties:
> > +    compatible:
> > +      const: via,vt8500-pmc
> > +
> > +  required:
> > +    - compatible
>
> Why do you have select?
>
> I don't understand your changes. This was not at v2 and I did not ask to
> change that.

The select: block with via,vt8500-pmc and the clocks: type: object were
mistakenly added to via,vt8500-clock.yaml in v4 =E2=80=94 leftover confusio=
n from
trying to handle the PMC node's clock container in the same schema. In v5 t=
hese
are removed from the clock schema entirely. The PMC binding is now a separa=
te
patch (via,vt8500-pmc.yaml) which is the right place for the clock containe=
r
node description.

> > +
> > +properties:
> > +  compatible:
> > +    const: via,vt8500-pmc
>
>
> So via,vt8500-clock.yaml or pmc? Why aren't you removing the pmc file?
> Why is this located at clocks?

In the next revision, this patch is scope only to the clock provider bindin=
gs
(via,vt8500-device-clock, via,vt8500-pll-clock, wm,*-pll-clock). It no long=
er
models PMC/top-level node properties and does not modify PMC binding files.

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    type: object
> > +    additionalProperties: true
>
> No, this cannot be "true".

Agreed, I dropped that structure and kept strict schema validation.

I also fixed remaining related points from review/bot feedback:
- example validation issues
- dependency constraints (enable-reg/enable-bit, divisor-mask/divisor-reg)
- explicit reg: false for via,vt8500-device-clock

Regards,
Udaya Kiran Challa
