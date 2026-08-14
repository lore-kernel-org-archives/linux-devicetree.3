Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A61C347FCD
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 06:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786690721; cv=none; b=G+eCNvQNxOrI222dvVk5yBVX2BuNnGhyMClpupz/y/hgigFn4d0S82GFq3j9wX9npbeb/DnWbZynsz/9cWTzf+PvCKSo7PDsNUF8FpFi3DJ2KiZ6LnXGmzSxZIFibdLn5EcmsGcEKa0nyH4yG0395I05tmSKPboMNfw25VXGCbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786690721; c=relaxed/simple;
	bh=csIsvLf1U9LsyENkdQVy1zbSHkYcN8Of8/B075321fU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eOs7S+7cMZYGVBkxC4FGzpXk4LwtDYtiySQ6R5kdvGZXS61ui6vvDJdkKWxAFRXWul+1q7nJY37vcBoCJ3uWy1vJfZnPOp+BBY1V1c+p693DOSKH1oYXUhubpb97GzvdcRMJeJhR1MAfOjTgGYU7WBJCBd1arxNShHeYhdDNUig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/bP5ViT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/bP5ViT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6EE91F00A3F
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 06:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786690719;
	bh=csIsvLf1U9LsyENkdQVy1zbSHkYcN8Of8/B075321fU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=D/bP5ViTAhcQxJkz9ISTAsbQQJx/HxuNi6D2zTuf+sMjx4s52nIlOcWFsiQBgNXwz
	 BVAu406wVJe0JnfgSZawXiEVMpvrkEjhibwRwTVJRbgBRctlAyt29i6yVmG5r6uNbm
	 bXlz5ARqU+T34etDQ+1HIkA6MPysN0tAL+/UefNTCkmjj9Vh0cjOAWZZBfXGTC0Zg/
	 kpbdS1EqO5+vPbEywaJN/NO7yIcwSXC2mGK3ode9qBTk2Eu1kvB0YkSCKAY7hH8Hs1
	 Mgg7zM2itiqjfIOh90vyInZ4rJJeIsTn1mZ/H9CQ/BLRCU5TQmxcWJi3GCXgA4orgN
	 ErmlxlZfN5R7Q==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b01cb18515so606444e87.2
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 23:58:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrRXLe3Myhooblhf2U40SvfqMQj+6QlG+xU8GOTJqlKSRkPvBkqvazwBZR4zMyhqWhbdYyRy8yy3XPA@vger.kernel.org
X-Gm-Message-State: AOJu0YxPGPTT//7Q3mZpnbWrgt5+OaggrOnLDlWTkJkGTzVPaceptdFE
	tHGA1ut/9l+p2cNzx8WdbX+bHLNytOgMvmaQ3eb95N245ml/6X02jxU7Fcs0/Wgi++hhsAfr4QC
	+3fvf1MP9Or+6485mwY9VDIGPuR6AylU=
X-Received: by 2002:ac2:4f11:0:b0:5b0:1ace:3bc7 with SMTP id
 2adb3069b0e04-5b459164d3cmr561959e87.31.1786690718590; Thu, 13 Aug 2026
 23:58:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813-cv75-v3-c-v3-0-9352b3fd6026@ambarella.com> <20260813-cv75-v3-c-v3-1-9352b3fd6026@ambarella.com>
In-Reply-To: <20260813-cv75-v3-c-v3-1-9352b3fd6026@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 14 Aug 2026 08:58:26 +0200
X-Gmail-Original-Message-ID: <CAD++jLnFqSy0yUfn_NtmxAij_jN5BeMXNNNuQFv99Q82hRxpHw@mail.gmail.com>
X-Gm-Features: AcwNN1XuvUL75RlWfYI66nkaW_h1Km9OIlm1Ef0qiIjxZ-dRRgrwe-r9r6XcyPY
Message-ID: <CAD++jLnFqSy0yUfn_NtmxAij_jN5BeMXNNNuQFv99Q82hRxpHw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: serial: snps-dw-apb-uart: add ambarella,cv75-uart
To: longzhao@ambarella.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 12:35=E2=80=AFPM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Add the Ambarella CV75 compatible string to the Synopsys DW APB UART
> binding.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
