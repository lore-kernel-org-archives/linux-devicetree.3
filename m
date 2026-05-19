Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB1C3ECBE8
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 22:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779229133; cv=none; b=OOGnxrCjCbkfSM6w+Upogf+mkIOygNzsKdAgUgg58eOwldUVpSIQqpEWWpqDx/0eY8eyDNqGRRJ1hy7rJIYD22gi//dbxQBr0+6dVLSjsyjWBnNOWtqfcuWfonDcGkmuqMnBRztCo7BpZHwt3jEOBhJDfdn+yvazM4RR+jlXXLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779229133; c=relaxed/simple;
	bh=oADrdbtK96INOO4LzXCbOflC5hkWuUzeSIEIA+FE8EM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nYDzqLPIveUAD8MG+B1ZGahzh6ghYvArgihe/ITpmSy+Ch4hWwv2G9FDIcyr0vTGvfdnGgNvCJK8Q+Nll+YDph4aXSs56a9ge6jH2qS+Fvw+Ocr3T/e4GfdebcDcW9Sz8O+g6YjmzHGPZzZ3Nd80KxD0Nw53sgasXLwc+hWK8/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfcpAgMG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfcpAgMG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCF81F00893;
	Tue, 19 May 2026 22:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779229130;
	bh=xM76R264SYSvJz5kZ1OEDgnBdsOE2g+Fv0HG4WZ4NrM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QfcpAgMGXurOry1N9o5+QfumJQuSQC6MTdguv/6rPZuJqyiZp0qIUVe7Q/UvZnIX/
	 5ZdlmT9HMAfYUJzTcxAMFmFkGMbgXYFQkowy5+r1Wi08J3jvygeWmgzEHA0QiW5WuH
	 SQhNoK6AXCg5lxAl/yLPniP8SwFcah45Eth1AOoMhzdS1ITo8WCnVz0UL8NOKib3dn
	 IHs1LpRb4AYiuBteB2SZHwQePGBkv3QI2pn7+rlH9Msl4YMBUc3bgJt3HgTtwv3RM9
	 qqoGDbs9EMS/PyOUazEKUwKxVaDSxMhLLYGVfEHjSZotz5/FjeQ7VamvUpsgfM6hv7
	 gj8dMJforHc3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/6] dt-bindings: clock: airoha: Add PHY binding for
 Serdes port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, neil.armstrong@linaro.org, vkoul@kernel.org, robh@kernel.org
In-Reply-To: <20260519220813.28468-3-ansuelsmth@gmail.com>
References: <20260519220813.28468-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 22:18:50 +0000
Message-Id: <20260519221850.6DCF81F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `#phy-cells` property is inadvertently permitted for the `ec=
onet,en751221-scu` compatible string, contradicting the commit message.
--

commit 36e079ebecab2b854b57826ce9314e34246cb7e4
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: clock: airoha: Add PHY binding for Serdes port

This commit adds a #phy-cells property for Serdes port selection. The port
selection is intended to only be supported for the Airoha AN7581 SoC.

> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.ya=
ml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml

[ ... ]

> @@ -65,6 +72,8 @@ allOf:
>          reg:
>            minItems: 2
> =20
> +        '#phy-cells': false
> +

[Severity: Medium]
The commit message explicitly states that the Serdes port selection is
currently supported only for the Airoha AN7581 SoC.

Since #phy-cells is defined in the top-level properties block, it is
permitted for all compatible strings matching the schema unless explicitly
restricted. This block correctly restricts it for airoha,en7523-scu, but
should there also be a restriction for econet,en751221-scu?

Since econet,en751221-scu shares a conditional validation block with
airoha,en7581-scu further down in the file, it appears it implicitly
inherits the permission to use #phy-cells unless a new, separate if-then
block explicitly sets '#phy-cells': false for it.

Does this allow invalid configurations to pass validation?

>    - if:
>        properties:
>          compatible:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519220813.2846=
8-1-ansuelsmth@gmail.com?part=3D2
