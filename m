Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56FD3AFAE7
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 02:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789524471; cv=none; b=gVtEvQnhk3ZJDGo2f63at9LRGx7ec13xGkWRTLtBbMyFgD+28JA4gJfjqasW665fTUlTy1RFAfT6q2ELiNCnYVmApWTnyArFyPanXqYuQdhssq+LaZSIQdbiydX9RsBgmYbr508NhijrbzqvtbfLdUeFxu1NWVtEhNa8wlAvX7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789524471; c=relaxed/simple;
	bh=HGQgC4iOLTpUxOJdsDPUmd6X4hgb9Du2zgwMwf9f7JU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=acu+lusAU/KhmfkViDlHViZ+n+YwonXk7FhqpX7svHcJr9HJuTQM1ASNe+9LHTOkdwq3jIAnrcQBfoMLnJk+YFxtfd1/LDtCb6dbPhTcU7KesaAv6o9cbyl+8ZH4BacJoKGsFlcEBR8zGbI6Sxi31HFz/Y+TN8IAa0AYMMt8rO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpWzqEG8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpWzqEG8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA991F00893;
	Wed, 16 Sep 2026 02:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789524461;
	bh=GdTFO+hNnDkkylQADHUvrE6dtNafBAzA+VO7Cz6OfTI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lpWzqEG8pD+i+n1i+HBgaqaRNGhRaoQmpoZ07UAZn9PnJm2cIv5UlXWVFtX+6U1Qd
	 XxkDuqatj0/9UBJ+Vo8fkDMmPNgz07yMpGXZCz0taylfr0WnclFnsx0IXlTAbNmNbr
	 JI5uKu7klvqyLGVkoIv+u9cLmM6j7khM6jA9GU/Sgq7YfNxOAg98g6exiRG8Qa675I
	 zGTga+KKKElEuTtb6SYHT/+RSTMaOjO2eBhcw2OEV4chl9YfBY+/NAk3xQTDiSIi6N
	 IxGSpOWXp96t9v8skqWSiM2t53M4i/A103YtLW9YDjiPNDkrPVQE03vmsrPc9pQarP
	 snTIUKwxeMvEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: ti,tpd12s015: Convert to
 DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: Quchaosheng <quchaosheng000406@163.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260916015833.112753-1-quchaosheng000406@163.com>
References: <20260915120327.47114-1-quchaosheng000406@163.com>
 <20260916015833.112753-1-quchaosheng000406@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 02:07:40 +0000
Message-Id: <20260916020740.EDA991F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: validation regression for tpd12s015 gpios maxItems =
constraint
--

commit cd852360cf92f4482c02f981e6fec97ded13c090
Author: Quchaosheng <quchaosheng000406@163.com>

dt-bindings: display: ti,tpd12s015: Convert to DT schema

Converts the TPD12S015 HDMI level shifter binding to DT schema and restricts
the gpios property to three entries based on the assumption that no in-tree
board uses more than three.

> diff --git a/Documentation/devicetree/bindings/display/ti/ti,tpd12s015.ya=
ml b/Documentation/devicetree/bindings/display/ti/ti,tpd12s015.yaml
> new file mode 100644
> index 0000000000000..96b44bd665f1f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ti/ti,tpd12s015.yaml

[ ... ]

> +  gpios:
> +    description:
> +      The CT CP HPD, LS OE and HPD GPIOs, in that order. The first contr=
ols
> +      the level shifter, the second enables the level shifter outputs and
> +      the third reads the hot-plug detect line.
> +    minItems: 3
> +    maxItems: 3

[Severity: Medium]
The commit message claims that no in-tree board passes more than three GPIO=
s,
but does this maxItems limit cause a dtbs_check validation regression for
existing boards?

Looking at arch/arm/boot/dts/ti/omap/omap5-igep0050.dts, it appears to defi=
ne
5 items for its tpd12s015 node:

&tpd12s015 {
	gpios =3D <&tca6416 11 0>,	/* TCA6416 P01, CT_CP_HDP */
		<&tca6416 12 0>,	/* TCA6416 P00, LS_OE*/
		<&gpio7 1 0>,		/* 193, HPD */
		<&gpio7 2 0>,		/* 194, SCL */
		<&gpio7 3 0>;		/* 195, SDA */
};

Should the schema accommodate all 5 pins, or does the omap5-igep0050.dts bo=
ard
file need to be updated first before enforcing this constraint?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915120327.4711=
4-1-quchaosheng000406@163.com?part=3D1
