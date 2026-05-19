Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837463BCD15
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779188241; cv=none; b=tkBykLL6nmgXjWgVgfvbepIOk37l9QB0FCcmoeNGGi5hYknRsPxR0MDYwM74xVKjwnf0i8lUpjpp+aEPL/uog5+rJvOZ/tDfLLlu/pYUIJx7FTgQnBuIJUJm0se5hI+C2CBedxKXe9fus1vDb6ft6LW/i392z/oYWxHv7wC2i+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779188241; c=relaxed/simple;
	bh=ItnJAZqt4m3pPdUFVH9i93Qs4rlloiblcj2y2L34PbI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nlj46Idu22ntO+38GUYTFTpgnmoI7vyQjD5rsTy9RujKbWYUjYDvbV5CXwtMByjOZhtrYvss+rK+yfancuwixKm/kynGYvA4ixU3wNCJ0tBoF91Z4ViDfcQwizhg8FAsuevELMZQ1Mf4vEFPdMxyFBrK8AbZTN1cwd+DIV0hmoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QrCOAbGZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QrCOAbGZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DABCC2BCB8;
	Tue, 19 May 2026 10:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779188241;
	bh=ItnJAZqt4m3pPdUFVH9i93Qs4rlloiblcj2y2L34PbI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=QrCOAbGZCHq02qh3/RHYwjH8kfbxoAcTqp0A7D7bA/4PDiXaccdyFNvyO93mTaRcn
	 Rs/9NCzjk8iUdd5A5ZL2XPZ+NLy5u4/WE7fmGIfoP0TE4l18Ca/AjUUBWnUY+tg+Rx
	 SYaIvmed8q6GL0PAh79qkS+Nikw7Kri+n72Zt46rEtEMxEOomYbRLAem73WOUu6Ou+
	 MLWetweTsphmUYzkUdTEx2mqxOpqMG1GaeF6n9Bcagj5+L9JHniOtPXCH+umhEvKTP
	 IR9bS6kUlLzFptEKLJ/SsBK/l2ZurxS6tvJJGCnz6799rTi9krwa+ChhHhyGumb2CK
	 VNQE7w1duaBnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: power: limits: Describe Qualcomm SPEL
 hardware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519-qcom_spel_driver_upstream-v1-1-75356d1b7f94@oss.qualcomm.com>
References: <20260519-qcom_spel_driver_upstream-v1-1-75356d1b7f94@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 10:57:20 +0000
Message-Id: <20260519105721.0DABCC2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The unit-address in the example node name does not match the first =
address in the `reg` property.
--

commit f3971a9e10b2466608195c2613f6957464048b20
Author: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

dt-bindings: power: limits: Describe Qualcomm SPEL hardware

This commit adds a DeviceTree binding to describe the SoC Power and Electri=
cal
Limits (SPEL) block on Qualcomm SoCs.

> diff --git a/Documentation/devicetree/bindings/power/limits/qcom,spel.yam=
l b/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml

[ ... ]

> +examples:
> +  - |
> +    power-controller@ef3b000 {
> +        compatible =3D "qcom,spel";
> +        reg =3D <0x0ef3e000 0x1000>,

This isn't a bug, but does the unit-address in the example node name match
the first address in the reg property?=20

It looks like the node is named power-controller@ef3b000, but the first
address in the reg property is 0x0ef3e000. This mismatch will likely trigger
a dtc warning during dt_binding_check.

> +              <0x0ef3d000 0x1000>,
> +              <0x0ef3b000 0x1000>;
> +        reg-names =3D "nodes",
> +                    "constraints",
> +                    "config";
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-qcom_spel_=
driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com?part=3D1
