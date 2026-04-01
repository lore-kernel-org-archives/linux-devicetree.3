Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAC5223DCE
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 01:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775006892; cv=pass; b=AQKAVEGdmR+ws8kOUaz6Z3lJ/vd1vrVCDM8h4W9rLF64zvajy/GesDeK897JlCjBMSOxgHDmgXqSA7nAn8RvXTpIVE75amdtIsSLHVS2ME80NEgEiMftNVDaR/AXLNRBy2ua+efhAU+e3ebC5spO1mput22JEIKXlKOHqBmBSZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775006892; c=relaxed/simple;
	bh=4IruUVcp0HjdDE9HLsgtbDaSAgdq3HRDtspM2HHU3KA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+JJzPAZcWvBlkmX7N0In2ViZbhQUQr4mk+Ygj0oOo5TO23YDQx10SVeVHzbwBFlUP0BteQaWReFYdoK/S6V/d2O/3pF5N/u3bthpLvT3fztBmIi8aAFAsat0kREJfApmLSaXQ5PSrEACSpfocw36BZlpWIp6f+QTsYBpAp/47c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b=iKqKM3KR; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="iKqKM3KR"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7986fb839f5so28228307b3.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775006890; cv=none;
        d=google.com; s=arc-20240605;
        b=NtcYyMgtXXZUaefixEPlb05RbhUq/K+dPIDeGDQeEkZxOMa2RDVjFluxHF0nN3m0BA
         +3maB1ctz2c6Rwcgk5GChvaPvNw1DV8CF7e7vUDCdCe7KKLU6MKBqdh9oo8C7cHnjvjZ
         //l7YID9BKUM2m21doJVoGh0ObK/g/XpUf62Y091bmv0DyavVfg+uScDvlnB+7P9iEPq
         iDgMU90tmKFqObgtJKtffNTy56gPxQSPzRdep3j76Jc6+HCYGaZeZN8ZMOxPnE2jHpIe
         +3ZzeZQWqMZRu2faifkyYDPEqPVip0mjE8s4gcrAd2P/ylMv35bVAm84NWpTOnUK8Ihs
         Xpvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4IruUVcp0HjdDE9HLsgtbDaSAgdq3HRDtspM2HHU3KA=;
        fh=b2ps4O7JKPCWoaMTSPYdniX5TrQl9BV7rqWy82/ulNU=;
        b=GnjtLTsQRsDp5ZN0uZhIIQFN7czEU4z43uEYfgZtSIkf5e/qZWK4ntIe46TDPqaZKe
         675WgHktGw0ImsAAPfyURSKCXoYFO7MXxnG/WR+qCxmnD+lENUO8r6MsrcDfVX9McZLA
         GvtMsEwtJZNpvydO7fUpUdPCVkZoGjI8yrDSYte1DfXWk8nQYCvtMqv7/E5QFRH04axW
         wJVhC8NA0w8pxTGL1VuK7E0NhCo+kIyvnunKRQ5+K0NO/qv8LpGVIHAXfOjs2gI7sj1t
         uEDKywjO40ySHl1ta0xu809OSuXGp/a3lq3UfLkTQl1qHkZJMu11jR0e+brYaWNQ1trV
         nPmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1775006890; x=1775611690; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4IruUVcp0HjdDE9HLsgtbDaSAgdq3HRDtspM2HHU3KA=;
        b=iKqKM3KRJ9ucoDsyy9JAZurNPWLPMK0dG7ZMAWrQ8YSYgLWkJahtywFA31/Y/G7S24
         11hGho4Y+C1MqxxWS1nE+zwXWj71fJM1Rg5crX2y5B6ForuAl5RZWLEfso5O1C0UjOr9
         /2kfTmewu0skvHcsqVpHG/5oVNsIh6KbmhsgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775006890; x=1775611690;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4IruUVcp0HjdDE9HLsgtbDaSAgdq3HRDtspM2HHU3KA=;
        b=c/K1sLuB4cTTQMrNrV5VIszncOp0zrAdmNeonzYd2tH+b94jmDqwxPnf/zHVlp6nlN
         uNCdPjyl6tPxs41ZRl0e4hEr/A2c6kKu4z/QCXzz+W0GAylVqCBhK59T3/jtj3Drunul
         31oJSr30P4c/FAksptJ6+CkBVCE/9jpDUNVADBDHwNXpGU+0WgZFPUn7UCeV3OJxsubw
         1BUMamnByXfRfteMfeEpjlr3fHeFT9XqAu60N/e9leGot+Ij8NpRCSa68mVTKBwXLsWT
         EbLrijL8Y/5KMjhivMuVMBOkiWJ3/5vtk2LXSyEQ9lcy9ZS8GLieli+W3+PNb1G1Z4Ns
         3JHQ==
X-Gm-Message-State: AOJu0YwPRImBFZXk2qL3/f+HiDUOlJQmjlv4tpLEYHo/J2y7+x3wZ3H2
	oAezcfZYNg0vvFiHbNX02an7Dqk80zaJ0MEuffQ4efXpC02Q4oGnhO5vX9WE1QYIVxa80ZKSVZn
	wBrtv1F+rHJoOj6pZWBDZdj50ajfXsWg4CQ==
X-Gm-Gg: ATEYQzyjA50gIG/SrjKRWyWXqya6ZB3T4747p8Qul9AP2He2nba5/lzs2ixNtqjhsGM
	USdiHMwDfo79krsGFdU9m5nCVGJsbHonofj5E61VZSPM79B3XKzTEeHvJDCnm1VZ7xoyKmfnqrR
	dXOQhF76kvH8xT4VmimSeBYh2py3m8z86GRLSkVZWxm0siBBa1r4Pu9B08zpCcl5AEEmicnebvJ
	G6UDC8eHJEocmS01s8r3ppFHIck8Qst1hZhzw5O36O2plsDQc7c8ip5hV9JMhy5BJYUca+TOWrj
	ZGWWdGpOPr/OVkJKcMq5AfK9AwrNXrPRs6VKbyZuBBXVnSODgqrD5Xb/r01N9+kqh2zJ
X-Received: by 2002:a05:690c:348a:b0:798:6f0b:86b4 with SMTP id
 00721157ae682-7a21107aa7dmr20051487b3.25.1775006890078; Tue, 31 Mar 2026
 18:28:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310003850.3837030-1-npiggin@gmail.com>
In-Reply-To: <20260310003850.3837030-1-npiggin@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Apr 2026 11:57:57 +1030
X-Gm-Features: AQROBzArsWqts098VpZ5lUIVgJv6zvnv8uxKW8b6rDQsTlEehBLHkq47aL6BupU
Message-ID: <CACPK8Xc=imZXXPp-CYY39=Ww4oVDdXPS5My_R1qODzGhOD2qnw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] dt-bindings: iommu: riscv: Add bindings for
 Tenstorrent RISC-V IOMMU
To: Nicholas Piggin <npiggin@gmail.com>, Drew Fustini <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, Tomasz Jeznach <tjeznach@rivosinc.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Michael Ellerman <mpe@oss.tenstorrent.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Mar 2026 at 11:09, Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Extend the binding to cover details specific to the Tenstorrent RISC-V
> IOMMU. In particular, a second register range is added which contains
> M-privileged registers, e.g., PMAs and PMPs.
>
> The RISC-V spec S-privileged registers remain in the first register
> range and are compatible with "riscv,iommu" so the Linux driver does not
> notice any difference, but the binding will be used by OpenSBI and
> potentially other M-mode software.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Drew, will you take this through the the tt soc tree?
