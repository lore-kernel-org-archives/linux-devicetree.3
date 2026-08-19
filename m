Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0823CC33F
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787132507; cv=none; b=HSYiKwF/FwTDpgYQ3M5KSU4sALLIWAOER8Ybr0Yn0c5vPqA3Kx4jgW/VJuVCamFwVNMb7IVFdz9vLRKUdMxb3Fto2atQ7HKiscFJC/LOopfJuiErPrqeq0zCxRHgCC7//EjRpq1nnuLMJFu1KH4cdj8Zdn8xVYTzccufhG+dNUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787132507; c=relaxed/simple;
	bh=VigB2ogSG0mW4YnDVxpRsESux3gymaxLR9n7pC5cgC8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l6Fs/ppMUKzBvAq2LK9ORfaA7D08KCbvXn6AnsE+OKaf+i3nEEqljlMpvMIfntjOSPC2YomanxiXAtC4tiX0bULdaUJ+sbPe29PuQa/pBGlCwcb1O/Qzmaa8tB18YUF00fq2RLPB+dAhW9s8DiU63pys4vCsp77GgtwpjWgfc40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2Nxkg1l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2Nxkg1l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B671F000E9;
	Wed, 19 Aug 2026 09:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787132505;
	bh=mEvvC4z1iKNvIReI3RFgYCARhNeKHFHGX4J4fyhrmiI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j2Nxkg1lRbqXb33g5ax6XmPYoSfzsotFclK9/N/G5eRG4wKvSQiktKYibAoDXLh4O
	 KLXNFH0y2MsuO1/YqrWMi9cvaQV4ZG8u5majDx9XP5UHI9tgSxiBRb6AwbWd+kYfF+
	 lNa6XD36cNYhXbuZRJEdxIcsRkwy2PeEsD9g+AwIlLv6+M+im/3W8dmKMfvguHkzDq
	 ZGN029pn7ngWap3bRIEyqjQ9898M0fzKbUkwslDDrWPJIH+7frztWRh5Y1fntHCbc+
	 FzAo890YySHb460BFvYC9CNLE7LMwlIOZu2IqOmz+wpw1tSFIWf0vrsrcZTwJfvgdX
	 RqHIy2+2PIsxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] interconnect: qcom: Add CAMNOC interconnect
 provider driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260819093211.1436275-3-atanas.filipov@oss.qualcomm.com>
References: <20260819093211.1436275-1-atanas.filipov@oss.qualcomm.com>
 <20260819093211.1436275-3-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 09:41:45 +0000
Message-Id: <20260819094145.93B671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Off-by-one error and dead code in interconnect node linking loop co=
ndition.
- [Low] The `buswidth` field in `struct qcom_camnoc_node` is initialized fo=
r all nodes but never used.
--

--- Patch [2]: [PATCH v2 2/3] interconnect: qcom: Add CAMNOC interconnect p=
rovider driver ---
commit 2b98e7c9cd72541b2414334c311ac7fd888628a6
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

interconnect: qcom: Add CAMNOC interconnect provider driver

This commit adds an interconnect provider for the Qualcomm Camera NOC (CAMN=
OC).
It aggregates bandwidth requests from camera sub-devices and translates them
into clock rate updates, resolving a last-writer-wins race condition from
direct clock manipulation.

> diff --git a/drivers/interconnect/qcom/qcom-camnoc.c b/drivers/interconne=
ct/qcom/qcom-camnoc.c
> new file mode 100644
> index 0000000000000..9a703b052b2dd
> --- /dev/null
> +++ b/drivers/interconnect/qcom/qcom-camnoc.c

[ ... ]

> +struct qcom_camnoc_icc_provider {
> +	struct clk *clk;
> +	struct icc_provider provider;
> +};
> +
> +struct qcom_camnoc_node {
> +	const char *name;
> +	u16 buswidth;
> +};

[Severity: Low]
This isn't a bug, but the buswidth field is populated for all nodes but nev=
er
used. Could it be removed to simplify the code, since the driver directly
treats the requested peak_bw as a frequency vote?

[ ... ]

> +	/* Link every master to the single CAMNOC AXI slave. */
> +	for (i =3D 0; i < CAMNOC_NUM_NODES - 1; i++) {
> +		if (camnoc_nodes[i] =3D=3D &camnoc_slave_axi)
> +			continue;
> +		ret =3D icc_link_nodes(data->nodes[i],
> +				     &data->nodes[SLAVE_CAMNOC_AXI]);
> +		if (ret)
> +			goto err_remove;
> +	}

[Severity: Low]
Does this loop condition unintentionally skip the last node, making the
camnoc_slave_axi check dead code?

Because the loop stops at CAMNOC_NUM_NODES - 2, it will never evaluate the
last element. Since camnoc_slave_axi happens to be the last node in the
array, the code works correctly now, but if the array is reordered or new
nodes are added after the slave, this logic could silently fail to link the
nodes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819093211.1436=
275-1-atanas.filipov@oss.qualcomm.com?part=3D2
