Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2200B19CD0A
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 01:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791424717; cv=none; b=kW5wy9rJ81ryYqE9kSF+jh3wUD7FYWrrz2fMbWirXwuBS+CcLnFDfc00Cg2CP89OH+FP/nn0oeoeRZBp/bAlpJ8RvL8H0FUKk5LhCvAUXhtExkrVR3uiU9KsgdG/ldzzJnZb/KsZarFMEMYMDpYIdjufSOknm8DhTGwh8Jjoblo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791424717; c=relaxed/simple;
	bh=EeqmxE7UQyL4rWLry/MXAvW1jTGPmb5FLYptq4h58vA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gYeDpEDvA5LkUh3oh7K+Y0uzmkM0luq8EvuWqIF7AUlW0LyAGHQ2TJwvKftPCAz57HpZEf2HQ+JDi+bydSyheVzm99RAdbgoAp/dMNY3Bexqyp/lva1sqgv/3wbZnGqc/Bc/QcjgXbYgZ3jeWYVVsK9KYVjCSsxuUbTblN1fhnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=msakGurT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="msakGurT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F6311F000FF;
	Thu,  8 Oct 2026 01:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791424716;
	bh=vQnGJ+C1sN32AfGgrQoHVj6yJ95PC8XLu+MQxPG/bxM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=msakGurT+cpVrZwU5dXOEX1qlDUeByUe6mvChOWsY74YG1+HkyjKBaxOEDBT42v54
	 6f+itUQCbjC2PLoDL/c8/dHI8y56kaYn0X8G4AiA+d01Oa4V7qdkgdcQfhD56NQslq
	 di0Nlg+AeY/vzcZIP9PjQ6XIImQPUVybjk7rV8espxu7fpxIpw8Buguyg6zZ4tr7rm
	 bXMI5vDOwF4AB0kq7vKXpTAZo90ljCxXKr2A6N+gQl3scPjcxGRTGV68/528u3UCfn
	 Y7Jn3o/4PJpne/t68dpc3QTuFFJG5BHe0bPmHFYMUKLJqtc4kIptFY1fWsHsMGqfVj
	 3+KQrjlNO/PHg==
Message-ID: <sashiko-outbox-163502@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: phy: qcom,snps-eusb2-phy: Add Nord bus
 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, robh@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20261008015017.3359804-3-shengchao.guo@oss.qualcomm.com>
References: <20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com>
 <20261008015017.3359804-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 01:58:35 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: fallback incompatibility for qcom,nord-snps-eusb2-p=
hy
--

commit fde27e15de912af2a37a383a23a0f964bc729bf2
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

dt-bindings: phy: qcom,snps-eusb2-phy: Add Nord bus clock

This patch allows an optional second bus clock for the AHB2PHY bridge.
It requires this clock specifically for qcom,nord-snps-eusb2-phy, while
keeping other compatibles limited to the single ref clock.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.ya=
ml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
> index 931cd0e7d297e..67f2a587e65cc 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml

[ ... ]

> @@ -77,6 +81,24 @@ allOf:
>        required:
>          - resets
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,nord-snps-eusb2-phy
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2
[Severity: Medium]
Since Nord requires an additional bus clock for register access, is it
truly backward compatible with the sm8550 fallback?

Currently, properties:compatible requires Nord to use the sm8550 fallback:

properties:
  compatible:
    oneOf:
      - items:
          - enum:
              - qcom,nord-snps-eusb2-phy
              ...
          - const: qcom,sm8550-snps-eusb2-phy

If an older kernel uses the fallback driver to probe the Nord hardware, it
will only enable the ref clock. This will leave the AHB2PHY bridge clock
disabled, leading to register access timeouts (-110) during probe.

Should qcom,nord-snps-eusb2-phy be removed from the sm8550 fallback list
since it cannot be safely driven by the sm8550 driver?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008015017.3359=
804-1-shengchao.guo@oss.qualcomm.com?part=3D2
