Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E263002BB
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189387; cv=none; b=q7qQvn71QJAIUauWz/gVZEeq3j0qtMFb4Au/9O0IpXLenfH8Aweawwu6FS7QWu2+XhH+dv3HTWfBiabAYPptvKbT3WlLFhU5uw5rpZwHdf8VEot20Os7RBVLuhpggnWAoKQfdh0e9gVZ1/DY1cXKQE1jxCWdI10PmN8M2hDMU/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189387; c=relaxed/simple;
	bh=7wnMQYnrcxRUBR/8vF910vMtrwLbi+8r8gwkW4AnWjc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T6tQ8tTpL733FEUE+rQmsulFwco1dU9uk6atRbwdpt5eecKzL3afF9Mb/3p+kk9jPbL8pwUYNCrMjQaHBv0AoiejCSxAJq7ee147eubT+UnHhVP45bMDTyXvswgWKvnPYUkMlOKil+7Y92cc0LIFUYYw7bBYm4Tdm0sRvfu08T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJDZdQ9Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJDZdQ9Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A98C2BCB3;
	Tue, 19 May 2026 11:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779189386;
	bh=7wnMQYnrcxRUBR/8vF910vMtrwLbi+8r8gwkW4AnWjc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=jJDZdQ9ZHZP+s/D4nF2PsQ4g//VaOdaCKMPyAa3Svui5/xjtOyG6oSeMMVACX/ucC
	 DTkt4DMm1bOLaCka2k53HW/o8VviV0Xg87c12o9uyFXoRNgeCqftTsXkCieZ9BGQAF
	 i1wGO9j9zOc1raJMoz3Gpgnm5rdZYHP7IT4lDJ6WJg9lzgefLoJi8HKinE7ff1q/RX
	 36LMV6xOUvisEqVxJvPzwv5vCaNo29rlEcbj4xt0/8hQXnKk86MtgdjOPaie591xsS
	 QDcnzPvMbJ4D3Lw3yeaj2QwrsUNjmI7bh6o590BGWJksoGgiQY7b34o/cBGxgSjalZ
	 lnwbwFlrioQTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] usb: typec: tcpm: qcom: prefer VBUS supply from the
 connector node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260519-fix-tcpm-vbus-v1-2-14754695282d@oss.qualcomm.com>
References: <20260519-fix-tcpm-vbus-v1-2-14754695282d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:16:26 +0000
Message-Id: <20260519111626.A8A98C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The fwnode_handle reference acquired via device_get_named_child_=
node() for the 'connector' node is never released, causing a memory and ref=
erence count leak.
--

commit 41b7b2878f5810dff29da5bdf47dafca44618828
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

usb: typec: tcpm: qcom: prefer VBUS supply from the connector node

This commit updates the VBUS supply retrieval to first try fetching it from
the "connector" child node before falling back to the "vdd-vbus" property on
the device node.

> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers=
/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
[ ... ]
> @@ -720,7 +722,15 @@ int qcom_pmic_typec_port_probe(struct platform_devic=
e *pdev,
> =20
>  	mutex_init(&pmic_typec_port->vbus_lock);
> =20
> -	pmic_typec_port->vdd_vbus =3D devm_regulator_get(dev, "vdd-vbus");
> +	connector =3D device_get_named_child_node(dev, "connector");

device_get_named_child_node() returns a fwnode_handle with an incremented
reference count.

Does this code leak the connector node reference by never calling
fwnode_handle_put(connector) after getting the regulator or returning an
error?

> +	if (!connector)
> +		return -EINVAL;
> +
> +	pmic_typec_port->vdd_vbus =3D devm_of_regulator_get_optional(dev,
> +								   to_of_node(connector),
> +								   "vbus");
> +	if (pmic_typec_port->vdd_vbus =3D=3D ERR_PTR(-ENODEV))
> +		pmic_typec_port->vdd_vbus =3D devm_regulator_get(dev, "vdd-vbus");
>  	if (IS_ERR(pmic_typec_port->vdd_vbus))
>  		return PTR_ERR(pmic_typec_port->vdd_vbus);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-fix-tcpm-v=
bus-v1-0-14754695282d@oss.qualcomm.com?part=3D2
