Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AA53E0C4A
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 12:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789906389; cv=none; b=iYa7Gtqi9CGkJgCRJQ/uolXVbKAvTYsfTWLt8m0o+PFDHylbIXahZd9LOSO8Ul/w+adiZ8dFaqTe1+o81Zp9bqmmTOVxx9lHJoxkfpcD9ZCHvcCf3bdS+WR6ELXp1QT2Jiuc7wJn7vtnAl68dlr+f+Ax+3x0bO+CqqfY1NbtC4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789906389; c=relaxed/simple;
	bh=ni7+a8WhA0j+PGxLy5/NPh3JY/2Bpb0miHtLvkpdLhY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZkNeuNgAgLC/1vS+3vCyIHDoIhtGr1Kxdu/Der9o2OqAvIIBh7PJbq+r+5wtNbPEyM1nKiqCI+wCHPBo63SufVSRR1vwYG5espKeUU1oaZOLTzPCPvKh0V1fzepR26JpkDArC3MwZhbiSBnZEMmB/+QaXm30z7//IQuKIF2b0ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVGFxNr8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVGFxNr8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6E81F000FF;
	Sun, 20 Sep 2026 12:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789906370;
	bh=mq7619wqUyXtCKMlUgm3/aBewI48d2mvQHgQBbJozCs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mVGFxNr8rFi12n8GtKV3u2BIvc9mhqO85QGlDVjOqPqRR7pOW+E6iKrCTw4P14D1+
	 nSXLtWdQIWBkxtVyCLhoUGfuXZtkLKdx4vQ9yyZ1Rf6uqATXiwtyKMZtcgfRjhW4sN
	 IElXfZvvLSDfXWsqrYmP5eaEeZ8gYsmQDqGkKdCOuEraL5FV6XF3LcO7xTqejIFJvS
	 EtOJtdjyLpDBdsFta/gaKTzlC/Yp1+JLvQav7f56x2Pv7yIJw6HvaIgAo8DfAjTVvX
	 NDxu+GuyAahUrt09QUr0lKO6mssp5vIv6Csac+teV4ghX2+Fm5YpvMKQ0ps7pOFsSy
	 J7ZZs/bT2GIxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: i2c: Add Qualcomm I2C target
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Viken Dadhaniya" <viken.dadhaniya@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260920-i2c-qcom-slave-v4-1-f7e1020f3bb4@oss.qualcomm.com>
References: <20260920-i2c-qcom-slave-v4-0-f7e1020f3bb4@oss.qualcomm.com>
 <20260920-i2c-qcom-slave-v4-1-f7e1020f3bb4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 12:12:50 +0000
Message-Id: <20260920121250.8E6E81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: i2c: qcom,qdu1000-i2c-target lacks i2c-controller s=
chema ref
--

commit 04d5fcf83b820d8d116604eccea697fd3f7a8e35
Author: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

dt-bindings: i2c: Add Qualcomm I2C target controller

This commit adds a new devicetree binding for the dedicated Qualcomm I2C
target controller used in QDU1000 and related SoCs.

> diff --git a/Documentation/devicetree/bindings/i2c/qcom,qdu1000-i2c-targe=
t.yaml b/Documentation/devicetree/bindings/i2c/qcom,qdu1000-i2c-target.yaml
> new file mode 100644
> index 0000000000000..9a6b08f0ab0e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/qcom,qdu1000-i2c-target.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - interconnects
> +
> +additionalProperties: false

[Severity: Medium]
Does this strict additionalProperties rule block the addition of valid I2C
target backend child nodes?

In the Linux I2C subsystem, target (slave) backends like EEPROM emulators or
MCTP endpoints are described as child nodes of the I2C controller. The driv=
er
calls i2c_add_adapter() with the controller's of_node, which naturally
parses these child nodes.

Because this binding omits a reference to /schemas/i2c/i2c-controller.yaml#,
it does not define #address-cells or #size-cells. When a devicetree develop=
er
attempts to add a child node with a reg property for the slave address, sch=
ema
validation will reject it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-i2c-qcom-s=
lave-v4-0-f7e1020f3bb4@oss.qualcomm.com?part=3D1
