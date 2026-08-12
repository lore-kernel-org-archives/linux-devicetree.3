Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4531640DB47
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 09:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527680; cv=none; b=JbCUu/JwoQrzZYHQChPfxfYe0CRWCxQz7/JqO8Al6W9wKudabbgIRg9M1VZZPBDfcIDTDuAcxm54aOklT6sYFa5I5fLYsQ2PUK7nZESGjpqNhjEy6eZ9T/8SqZvFVBv61HeTjA5ulq0lwsvIX6Wh8/zDaJFKRGxeOu+XQRkzmaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527680; c=relaxed/simple;
	bh=guFueRuyHhhepUdqZQQxDbsDAvzgR9WXZIEpzzuTS68=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t29WjFm5iv78qik7LjqnJBOJBbdYC75TJe4lxC8Pv0/nuoDS4IX5YMQmQoZBZHwlrYhasS1QJf5yr0gbvd0wS71FAM3gh5ZjrJpBpSvk6VaHJMqYcMp0z8SWAPZf44GzQR26QM8mTJzkRnjUGM0pAN7BofTdMhpB/ScoKPMhNoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MtRR1Dj0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MtRR1Dj0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94AFB1F000E9;
	Wed, 12 Aug 2026 09:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786527679;
	bh=Zt+NpGI6iWHN39zktRg4D7AclVRL5Gv+ygNE0kQ8i4M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MtRR1Dj0zhgw+Ja0z7bv1LRk+0fQvYrUzeTrYKPMsjJPOG4SxA5quoAF560QMPehU
	 2hzwu80zkF7t3yoIddH8tEERUO96hyz2J/PSpdiqlPpXEcJdWvF8E8qtmWS9RVhLZZ
	 N7mRQWaML33u3XOE8X/RbemfT3opviI2i7BgHjmi7LfGkaseODh1mhkihjMNsuv5Q7
	 ragVcEHY2bH2IA4loiGnHl2SRoNKv6a4TAZOajJ7OF0ERblBz6yVEKCEvU8Zj40eRY
	 zlQeBmpj3yaOc2fHw5lFtm4KcNB24MvvbKfy+P9ycOnrFVS/Hwpsy/Enc0XEdjRkpn
	 v4mJYdutPaYiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/14] dt-bindings: phy: Document the Qualcomm
 IPQ5332 UNIPHY USB Super-speed PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, robh@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com
In-Reply-To: <20260812-ipq5018-usb3-v2-1-8f355d7ff0ef@outlook.com>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-1-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 09:41:18 +0000
Message-Id: <20260812094118.94AFB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing `minItems: 3` constraint for IPQ5332 clocks in conditional =
block allows incomplete device trees to pass validation.
--

--- Patch [1]: [PATCH v2 01/14] dt-bindings: phy: Document the Qualcomm IPQ=
5332 UNIPHY USB Super-speed PHY ---
commit 0e89230ae30b325a8982291c9e629f57e5fde180
Author: Praveenkumar I <quic_ipkumar@quicinc.com>

dt-bindings: phy: Document the Qualcomm IPQ5332 UNIPHY USB Super-speed PHY

Document the Qualcomm USB3 22ull UNIPHY present in the IPQ5018 and
IPQ5332 SoCs.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-us=
b-ss-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-u=
sb-ss-phy.yaml
> new file mode 100644
> index 0000000000000..cc9eccac51ddb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-usb-ss-ph=
y.yaml

[ ... ]

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq5332-uniphy-usb-ss-phy
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Shared PCIe/USB3 PHY AHB clock
> +            - description: USB3 PHY CFG AHB clock
> +            - description: USB3 pipe clock

[Severity: Low]
Is a minItems: 3 constraint missing for the clocks in this conditional bloc=
k?

Since the global clocks definition sets minItems: 2, device trees for IPQ53=
32
that incorrectly specify only 2 clocks will silently pass dt_binding_check
validation. The json-schema items list keyword only validates the elements
present up to the size of the instance array; it does not enforce array len=
gth
by itself.

Would it be better to add minItems: 3 alongside the items list to ensure all
three clocks are required when the qcom,ipq5332-uniphy-usb-ss-phy compatible
string is used?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-ipq5018-us=
b3-v2-0-8f355d7ff0ef@outlook.com?part=3D1
