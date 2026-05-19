Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66F64E3781
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 13:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779195649; cv=none; b=c0VOf5HJrwJ8TbftPGstnV2GrUi0vFLMo5LMF1s2U0/JE4D8JK1gEhtjTvk4JZWwfl4CH1JNXDYMsOBS1ADRJ1nYChTGYqYSvQCZjlMJeOq9zyDfSyA1MlRoRA9owQkISYKT+WUTExAEgDXGzrpnX018Ay0uLcIKcB+ZXuB9nN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779195649; c=relaxed/simple;
	bh=Raw2ewHcCFzji/tAL24qeJBQwxbYxe1N9SanMEHHpF4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dbPp7pOadsPuo9kmN5sEJza6xcEHswQS50u8hBJLHO9oA782Y8WN5XLDBElcG2JNAP+RGGAZXdkzm/ZKxyE0daQFwTaxAvgrKd9kmV3UCrHLCkHQBVMSU52092WRtAJ+DnunlbpFvBw2xkvoBKeb7jLtHe2WWxqfcbKINU93CiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZJ3Ptis; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZJ3Ptis"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16F9C2BCB3;
	Tue, 19 May 2026 13:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779195648;
	bh=Raw2ewHcCFzji/tAL24qeJBQwxbYxe1N9SanMEHHpF4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=iZJ3PtisrYleKH05Rybb/81KryYJT7zV/3V+tjxeyvl8HOg6oSA1roXofxUTcUXJr
	 w2PGfLne4Lwso1F5/8zmCSK5ZE11PyE2syUCtn9k83ljg0CoMKYM7DF+FG8ncftlvl
	 /6BhzS//Gs8qHx0/j6QmZlZ4k7Gim5U9Hdw2fWOaArBNSuFGqWafOkGAXg1fAMh6CW
	 ExKFc9BbnXYimtbkNLjUnk4e6iFbknO37OsN/WAWqsuox5xJ9hDvpxEPNSeYmIgVEz
	 0sqpytxWno8tFmShL4f8pS7ukKum7RIYeQa0h07bxsHdiKADL6l9HZgANcn6AYOj/f
	 cmo5IbDbJqOdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: pm8150b: move vdd-vbus-supply to
 connector nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260519-fix-tcpm-vbus-v1-5-14754695282d@oss.qualcomm.com>
References: <20260519-fix-tcpm-vbus-v1-5-14754695282d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 13:00:47 +0000
Message-Id: <20260519130048.A16F9C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Resource leak of fwnode reference in Type-C driver probe.
--

commit 41b7b2878f5810dff29da5bdf47dafca44618828
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

usb: typec: tcpm: qcom: prefer VBUS supply from the connector node

This commit modifies the PMIC Type-C port driver to look for the VBUS
supply in the connector node rather than the main device node. It falls
back to the old vdd-vbus property if the connector node does not specify it.

> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers=
/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index 8051eaa469913..429bd42a0e628 100644
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

device_get_named_child_node() returns a node with its reference count
incremented. Does this code leak the fwnode reference by missing a call to
fwnode_handle_put(connector) on both the error paths and the success path?

For example, when the regulator fetch fails, the function returns directly
without dropping the reference:

    if (IS_ERR(pmic_typec_port->vdd_vbus))
        return PTR_ERR(pmic_typec_port->vdd_vbus);

Could a call to fwnode_handle_put(connector) be added to ensure the
reference is properly released?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-fix-tcpm-v=
bus-v1-0-14754695282d@oss.qualcomm.com?part=3D5
