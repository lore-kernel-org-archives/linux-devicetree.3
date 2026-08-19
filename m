Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1EE370AD9
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 05:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787118715; cv=none; b=ft9GCVieysRrMZWUYMDzM3twdcuUwo3IdWO6yJov82ky2bN7SnX1nOE/pleaPsH/Gh8dt0+L2nRmQMpZPQvSGVd/RSJCQ9DH6cyLhpfdM/5JTZBqqaEuCKAMB6XwpmxUBL+2B0Xv+GpkSg96FCwLRv7wAPE6FTt8gIrfMcnokyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787118715; c=relaxed/simple;
	bh=Yl5GiKxCXYTx2wIlQhhgGTqiIgCA0SCbH5b5OvO+RL4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Uvo2JxVI8E9oi4NCcKtHwuGgC92T3WcSTFk+vmrCiLtGnNJFkLYtqNUXxIrj4Q7iQWL1cMegVpdZuSuMK0scve8zPe7todGlpZt9cb2rVRGtsZT5YHQG9eO456N2wTXo2JGbIKCIKYjTWL98ciea6kKzUFyHBQ3RAaCL8RG82+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fmRFYOwD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fmRFYOwD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CAE1F000E9;
	Wed, 19 Aug 2026 05:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787118713;
	bh=9LtvI96esLb2WRtUQ1Jy4KqBVIAIrXXTxazhU3tDcvU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fmRFYOwDJM+lidlS7p9eSf8TmYk2sO99urw0n+drxoY+lanXpq+e7fAGVtrSppiQW
	 9ehZCIaHXX0jE/aty/E2e8Lp82fuyukKKjioyt4k88k2wFO236rmVyKdKqstXrJ44p
	 C7pMvcwRBoWQoF/llcxsE0JOU5O5rBBdyXKwrNlGWwzn3ePWOnLL2jxIGlKxKoSHB5
	 sL2fLbf3ao3xhTxkY7U33nHMXknwTQ2vdXjYTO5/3TdMTN6854scaY5P//gtLrk0Rp
	 M32z1ISxG2wuu3JHvYSJbiaZaJHwZ0H3i6pZRhKHgLRzYjBwdX8Rq1gjYRUexGvlrO
	 3jAU8U9JCXxbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: qcom: Add Maili SoC compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260819054203.61385-2-prasad.kumpatla@oss.qualcomm.com>
References: <20260819054203.61385-1-prasad.kumpatla@oss.qualcomm.com>
 <20260819054203.61385-2-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 05:51:52 +0000
Message-Id: <20260819055153.59CAE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The new compatible string block for `qcom,maili` breaks the alphabe=
tical sorting order of the SoC list.
--

--- Patch [1]: [PATCH v1 1/2] dt-bindings: arm: qcom: Add Maili SoC compati=
ble ---
commit e26e69cd7b7d4cf716af221adce51d02ada71b52
Author: Yijie Yang <yijie.yang@oss.qualcomm.com>

dt-bindings: arm: qcom: Add Maili SoC compatible

This commit adds the qcom,maili SoC compatible string to the QCOM SoC
device tree bindings.

> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
> index ff8a35df7862d..00d9a493fe766 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml

[ ... ]

> @@ -175,6 +175,9 @@ properties:
>                - qcom,kaanapali-qrd
>            - const: qcom,kaanapali
> =20
> +      - items:
> +          - const: qcom,maili
> +
>        - items:
>            - enum:
>                - qcom,mahua-crd

[Severity: Low]
This isn't a bug, but does this addition break the alphabetical sorting
of the compatible strings? It looks like qcom,maili is being placed
before qcom,mahua-crd, but 'i' comes after 'h'.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819054203.6138=
5-1-prasad.kumpatla@oss.qualcomm.com?part=3D1
