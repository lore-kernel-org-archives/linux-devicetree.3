Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBC83C9890
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843907; cv=none; b=GlkSrRqgGasfHaxBsRwnlIIv9XTgQirhcasQ1ES4FPiRFZgSmb5RqI0XDr17vXpakY1SA6PI+9bJbISGiXt0epqJmtNjdaCcA3iniGcJHsWxNxk4XewUsPy6188JiumZoYtl8hxHL6vdhKOC2uWHKE45MAFc51TLZpSrC9PyAiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843907; c=relaxed/simple;
	bh=Qvq+yZ6oQmdKTw/RDlarw/2JemWDqSh4Pgg/OrCDjgU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Pm7pCFk9iSrHKfjzbgKG8wIi6zFXhyQaDs4L1QVY7tY2cdJQ1YJfojPmKvTm3K+W5NWZrMdpKoJ59hhs95I4yh9k1k3KRpJRMFDAzFcOVkHnBxAu7Ge75vELcQ3jXFLxCYzpEZHDdjltKfy/Ka3cM8K8yDi8EpxThvpFNIrgWNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rdE6kJks; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rdE6kJks"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1623C2BCB0;
	Fri, 15 May 2026 11:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778843907;
	bh=Qvq+yZ6oQmdKTw/RDlarw/2JemWDqSh4Pgg/OrCDjgU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=rdE6kJks7nCUNQR3B15jYFjANEDQlb0gzDtuR9trXBSSZ6syrdBZYQbqjB+dVPUby
	 DsypAIYFqHrBCNfWfipvPVD46htEsEJ1idvA4XiJCD77TXSdKttvnIBB+hhGf3Huh2
	 Xb12yiyykDQdRfjgz4uhyNcmPoKYKIPB1MteTKDCKZBiO2r/nJsCGEGZz7CDxEPpIL
	 Q7T7JncJgPSOw/BM8JA7AC/G1r4c0Mq6Zy2OdbReMJhT8LXbbaTNXhN0mFUSTPH+ht
	 Fsjg8IHs6ZSJE5lqYroHAgfz7YzI/s7YbVnU98aKp/uRLx/lyjAaoxWB71JO3l62Ki
	 RA9ffziDNgqjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: usb: qcom,dwc3: Add ipq5210 to USB
 DWC3 bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, olteanv@gmail.com
In-Reply-To: <20260515-usb2phy-v1-3-5f8338d466bf@oss.qualcomm.com>
References: <20260515-usb2phy-v1-3-5f8338d466bf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 11:18:26 +0000
Message-Id: <20260515111826.F1623C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The new compatible string `qcom,ipq5210-dwc3` is added to the to=
p-level `compatible` list but is omitted from the `allOf` conditional block=
s that enforce device-specific constraints.
--

commit f7f00d62e8a27abcab7835184425ce9a31f1b2c3
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

dt-bindings: usb: qcom,dwc3: Add ipq5210 to USB DWC3 bindings
   =20
Update dt-bindings to add ipq5210 to USB DWC3 controller list.

> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Docum=
entation/devicetree/bindings/usb/qcom,dwc3.yaml
> index a7f58114c02e8..f8e0819be894b 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -26,6 +26,7 @@ properties:
>        - enum:
>            - qcom,ipq4019-dwc3
>            - qcom,ipq5018-dwc3
> +          - qcom,ipq5210-dwc3

Should this new compatible string also be added to the allOf conditional bl=
ocks
that enforce constraints for related hardware?

Similar generations like ipq5018 and ipq5332 enforce clock and interrupt
limits further down in the file:

allOf:
  - if:
      properties:
        compatible:
          contains:
            enum:
              - qcom,ipq5018-dwc3
              - qcom,ipq5332-dwc3
    then:
      properties:
        interrupts:
          maxItems: 3

Does ipq5210 share these constraints, and should it be added to the appropr=
iate
conditionals?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-usb2phy-v1=
-0-5f8338d466bf@oss.qualcomm.com?part=3D3
