Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AC1232395
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 04:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787889785; cv=none; b=YF1SBwqbF7izW6jppElJh6sv90mYPCAAABpB4aApKpfGKRvzYxIhabRTHKFD6cFLbhOMDTNaBLkibG4dnZUtot3qNFGnSz9F5Tm5MdsqSIymU6zrjSJnF9uKh69Nv9PObwUhH1gc+NE4zBnWm9KTHL4sjc4B7qnbGuwCN62puwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787889785; c=relaxed/simple;
	bh=f/UC4T1L3dk5UfACx9kW3N3depx4EbE0dqghBpmcfRU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JyosLEyytD+LE8YzYzUdrP1w+HPy4vFqoZhzWt25YZlnObeee0BgW7BuM8d0RGpfleFmf+aHMrZ2KTDTNRuzRa3Gak2UY/aultki+mdSt1eoArEu6B+x6cXZ93i4pvJ61rNUxbt4bg8jtUFKRpn7VvRjHksq4TnpEpF4RLpgZ9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IONGKtLF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IONGKtLF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3161F000E9;
	Fri, 28 Aug 2026 04:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787889784;
	bh=OC9mxBXZ0XC4JDdeCcXCHTesqnmqHfnrgAArgBwdLF0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IONGKtLFtVJTRkxzqYV63ddcZQ+JHt6upX4Q2I7aDZHAA6UcWK1XOM7GOfBwDAdgA
	 Z9qoc2FEw2guydoj/yC0Gdy3fkkZ69kft3To+/bKWRUjcXp0bD3YeSX2ak0tF8yzPz
	 GP79QMVY+w+B1oYeAR1VTiTORWxWCarzfWifV56p7BzeGSOPmI3m+OvIaksdmIJcWz
	 H8FYYW5uWFagbpP2kWIMJJ+1Bnvn3uyvf3kiMJlXYZtv/lZBhVO6t4YyXuZPG9+5FI
	 1Q3XtghO6GcMBAJRb5zcTayY3WUlzCeUgUXjilxal5p0t6XFnD+VRexZ4g8WB9mNSu
	 xLtIzvouIRtCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 4/6] dt-bindings: arm: qcom: Document Nord reference
 boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260828034958.3165-5-shengchao.guo@oss.qualcomm.com>
References: <20260828034958.3165-1-shengchao.guo@oss.qualcomm.com>
 <20260828034958.3165-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 04:03:03 +0000
Message-Id: <20260828040304.0E3161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The root compatible binding omits the specific SoC compatible st=
rings (qcom,sa8797p and qcom,iq10), forcing a 2-item array that breaks SoC-=
specific matching.
--

commit e7840dc716d1200acb611d432fcd24729d2913ba
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

dt-bindings: arm: qcom: Document Nord reference boards

Nord is a new generation of SoC series from Qualcomm which includes SA8797P=
 and
Dragonwing IQ10. This commit documents the SA8797P Ride and IQ10 Robotics
Reference Design (RRD) boards.

> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
> index ff8a35df7862d..198314ddaa84a 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -402,6 +402,12 @@ properties:
>                - xiaomi,sagit
>            - const: qcom,msm8998
> =20
> +      - items:
> +          - enum:
> +              - qcom,iq10-rrd
> +              - qcom,sa8797p-ride
> +          - const: qcom,nord

[Severity: Medium]
Does this strict 2-item array intentionally omit the specific SoC compatible
strings (qcom,sa8797p and qcom,iq10)?

Standard Device Tree practice usually requires the exact SoC string to be
present in the root compatible array before the generic family fallback. By
enforcing a 2-item array, the schema requires the device tree to omit the
specific SoC strings.

This prevents SoC-level drivers (like cpufreq-dt-platdev or qcom_pd_mapper)
from matching the specific SoC or applying quirks without hardcoding every
single board compatible. Note that qcom,sa8797p is actively used as an SoC
identifier for IP blocks (e.g., qcom,sa8797p-geni-spi).

Could the binding be updated to include the specific SoC strings as an
intermediate fallback before qcom,nord?

> +
>        - description: Qualcomm Technologies, Inc. Robotics RB1
>          items:
>            - enum:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828034958.3165=
-1-shengchao.guo@oss.qualcomm.com?part=3D4
