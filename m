Received: from mta1.migadu.com (out-20.mta1.migadu.com [95.215.58.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E314F30E0
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 10:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949797; cv=none; b=h3r65eIG8dREJmulzaFj6yieMC1ROln+BDDjqA8Q7FhnsaxN3yaygpSHE33Paidw0uhL7CGc+ZkzCElO+5nQF9/pvYG/2tk5bOlWrzhh2eDiynyVGT0avOKZN2odhvWNvQ7i38u/cN6B8z3uR4LH0BkiJK533VBWYCHpEV/E+D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949797; c=relaxed/simple;
	bh=S1uOY2Lbxqeick8URdu0hldNgRFplEY0Z+aGMt8MGNs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=sGpS1A59lF6DWW0AXHzZNvgw7xrn7PF4QBwxiR/p1QrXHpiPYpjeQ8GxG+LMbgBZN+Y/pYVZzNFHggXLEs51pGBFr+eJL/6p3XCT7Zx+BQEuEBibvW5uUtUkiC3pMJ/FG9o/vNkA+eaq/05KOm0XOvhJMZJRgWQWKyIM1h5hDrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=TDdDHlYN; arc=none smtp.client-ip=95.215.58.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="TDdDHlYN"
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=S1uOY2Lbxqeick8URdu0hldNgRFplEY0Z+aGMt8MGNs=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788949787; v=1; x=1789554587;
 b=TDdDHlYNH54z6sZAhOVE2kJX4AEndUlowGoiMfiDQl5YaeJApQ43XF2WmeG9Iii0Zp9brjXJ
 D54q1dbvFvnU9syL+wBJ6XH5Aj+rnzyoNfjbxuZidaUiaHj80AKIDFCi46qJohNzgJCprgIsRWL
 SPiYgbbdHldw+RiWi/jMEKbSPtRnL9+oJXU8iEOWDqRIlHM/BmOZGsabbwvSC6ty7R6goqTMPRW
 NCtMJ4h5bOuJLd45/GwlcQ0Dd8jhiu8ft5kfI+8Fi9EAPwnPYo+HKT4gZI2sZvHeSUUAoWFcJUR
 uPi5Qbr+kYALAR+IshWbQbYae+YyMXTKQhenjLlXzgPsw==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e2b854a189f54564;
	Wed, 09 Sep 2026 10:29:47 +0000
X-Mizu-Trace-ID: e2b854a189f54564
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 12:29:47 +0200
Message-Id: <DLAPRUR4Q73F.1KIBGA408LQSJ@cknow-tech.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi
 R28S
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Andrey Korshunov" <razor1702@gmail.com>, "Heiko Stuebner"
 <heiko@sntech.de>
X-Mailer: aerc 0.22.0-9-ge948bb7230f4
References: <20260908235824.665-1-razor1702@gmail.com>
In-Reply-To: <20260908235824.665-1-razor1702@gmail.com>

On Wed Sep 9, 2026 at 1:58 AM CEST, Andrey Korshunov wrote:
> The NanoPi R28S is a router board from FriendlyElec with the Rockchip
> RK3528A SoC.

There's already an attempt in the works to upstream NanoPi R28S support:
https://lore.kernel.org/linux-rockchip/20260907-r28s-upstream-v2-0-21ab570f=
c91c@proton.me/

Cheers,
  Diederik
>
> Signed-off-by: Andrey Korshunov <razor1702@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Docume=
ntation/devicetree/bindings/arm/rockchip.yaml
> index a799bb843..1d937795a 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -340,6 +340,11 @@ properties:
>                - friendlyarm,nanopi-r2s-plus
>            - const: rockchip,rk3328
> =20
> +      - description: FriendlyElec NanoPi R28S
> +        items:
> +          - const: friendlyarm,nanopi-r28s
> +          - const: rockchip,rk3528
> +
>        - description: FriendlyElec NanoPi R3S
>          items:
>            - const: friendlyarm,nanopi-r3s
>
> base-commit: df2908090cda368b01ff43709f51890076c56157


