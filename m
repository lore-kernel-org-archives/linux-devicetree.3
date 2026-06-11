Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49493D47A7
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179439; cv=none; b=mk5sQfiQjVA30uR7C7F8/2eZkwUIGyEceUi+t2rQnCRRFSnY/oixyIG2u/XGiTRRSo5UxOOtEFBSNSL51wqEGQh/4bdrx4r7llUri/fpqWUiKo3IqDVeUBzvLxZczM7nd//Z9EW3L6jHEsX/oCMJvD6+GWW5FWBhmJ9ZAVAPCqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179439; c=relaxed/simple;
	bh=hFMbfqFQZE48xb3pCYJaM3mP/1q6DdQKHna/4Uf+I6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ffSwNPisqbO0dMSKn0WZXjjTWC4KPMBGI/ilcK3Rv911q2YSr5SDz/zC6dksb1bxJDRv1HZUx5pfxNdUrD6SWxMVcxOvS3uBeiu590G+G7XqcwQY1UBRyvIceWOxQspzt0dWQrDbJVfRvwwdDPNEWtjwSQQ16ag5biT3OH34euA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fw+RE/J6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fw+RE/J6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A9D1F00893
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781179438;
	bh=hFMbfqFQZE48xb3pCYJaM3mP/1q6DdQKHna/4Uf+I6w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Fw+RE/J6HGSyFMe+JY6JHuSjMtbJHsHfOU/qgLW4B5D1jqo5mZG98Ll+gijn1kZG6
	 s/nIJD9dlOlhrBPdiUPl78eifWso25YKAV6IG4+VTIXnRy2ROJWGWvQYbapMuFu7xl
	 mUwGMmvfUiscHmk6LviPL2VcxmvteW+9xWgGInByWccyEYEWlee4b+H9mnMinFiJVd
	 hnYRcNbenrppn4peknKFPLsfwP44Gpc4Je6Cwk4bxeuKIuk/2QgdZGqKPALAgkU5TK
	 zKpaf7NqvhAvS22/qr337OOnSTX6rvQhqe19I39kNvTNqBqMSXnQICQ3cDXrHBWaWW
	 9JmxSRKpe2GDA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aa65a184f2so8345499e87.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:03:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8bgDT3zSWkU2lWoNL7vetZfcCsWf8RF84z6nc+Q4B/ZNeYgAk/lMzovCyi9kE68XST8zBLhZ0t+Rzv@vger.kernel.org
X-Gm-Message-State: AOJu0YyMO/RRkSGYZNxv0sKbWnJLv7FUqpHfHl4JDuLxZZ2qi8U7wfN6
	He+Lo+brZzhhGjDaQSOEcEPDmXTiDFw5Z8NxI+/FpWGgxH+iaAtCI10FDW1z6m0ukNJlFGkWeKF
	9AZL5rOv6cUtoEpGhsOs9D5V1V9Np0Qs=
X-Received: by 2002:a05:6512:2351:b0:5aa:77e2:51b0 with SMTP id
 2adb3069b0e04-5ad27fb704amr771517e87.45.1781179437327; Thu, 11 Jun 2026
 05:03:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608094122.1245189-1-pshete@nvidia.com>
In-Reply-To: <20260608094122.1245189-1-pshete@nvidia.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:03:45 +0200
X-Gmail-Original-Message-ID: <CAD++jL=c8MNB-xUE5B=H4p_gMW5ky2fkTnFzfZBJPKVJyW-WAw@mail.gmail.com>
X-Gm-Features: AVVi8Ce38LENIr5p5lQNFRA8_GAnmdBuYPQ8c0ImlrI4j4vlm4FvrJsRZsp81_k
Message-ID: <CAD++jL=c8MNB-xUE5B=H4p_gMW5ky2fkTnFzfZBJPKVJyW-WAw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: tegra238: add missing AON pin groups
To: Prathamesh Shete <pshete@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 11:41=E2=80=AFAM Prathamesh Shete <pshete@nvidia.com=
> wrote:

> Add 24 pin groups, and their matching drive groups, on ports EE, FF,
> GG and HH to the Tegra238 AON pinmux binding. These groups are present
> on the AON pin controller, so device trees that mux these pins through
> it validate against the schema.
>
> Fixes: 9323f8a0e12c ("dt-bindings: pinctrl: Document Tegra238 pin control=
lers")
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

Patch applied.

Yours,
Linus Walleij
