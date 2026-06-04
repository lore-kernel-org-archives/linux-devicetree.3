Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658E13DA7F4
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 07:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780556629; cv=none; b=S2Bkd+I3v/YffAL83GM+5LE9HmEa7cbAXaeHJ8ibIa43WVCVkY+VJ2lt2M2cmDgYmZ7g2craOjcFkDC3rF+JDk9TPv/m8Y1byWDwAWNCwa4kmwUXcxyiWTTn943BLqn6dABqJluZqkankl5oHin45e1s7rMGTTBvgZtdU3o4r+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780556629; c=relaxed/simple;
	bh=3h1OyraZE2jeiihNwjneeUeawEaDJu17cIDY2gFYiAw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lk3+ofCwucI5YCqexRsnkNSf6Qg7x1vOdtaijR+DuKE0sJpT1ds8ctF3YRq0H0ZTl8gVidVYs7vTXRNmjKJeVh4bgsmuksVEL8HcCbdpoewlO2ivhHREHfP39H1wbN06Lwfv7KWUDrV1gRQd8XdSI5mbBWndGAaTjzh0XKRN4EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5uPFnY9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5uPFnY9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09CE1F00893;
	Thu,  4 Jun 2026 07:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780556628;
	bh=o1/AW48KfAU+eJ8luXpLeTt2ZSUV/6doyZMNwCMlFVg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C5uPFnY9Ey+44BfDeisFfWbECd2YdSn7uj+eapkOLsA1SlGdVjZwoLIWP49arbWoS
	 w2yKuTOhPU0/caTCKpr/uvZyBJX+WxwXJIO/felaP5+cMzk3TTiC9r25B26UR5QpnY
	 CJFV6amky0WtRK1toTY6cZIAezHoZnuBYzm7zNR+iHeKDzGLFfkWAlvsZOFHsQQnHo
	 SEekwSuhgFnaI64Jv1EyfGSlIHKILw+j1JT9B0RXF6Kmol06HZCAWNHCKPnxkrKf6z
	 WWymS8iF5kjhHElccy5OmT20jgWXMYlVY7Rwt36GnCeD/JCPU1sPZXzhloLlOtkaB9
	 xo4XUBOAENlWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] spi: qcom-geni: Use resources helper APIs in
 runtime PM functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Praveen Talari" <praveen.talari@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260604-enable-spi-on-sa8255p-v3-3-43984eac4c67@oss.qualcomm.com>
References: <20260604-enable-spi-on-sa8255p-v3-3-43984eac4c67@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 07:03:47 +0000
Message-Id: <20260604070347.D09CE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing rollback of activated resources when dev_pm_opp_set_rate()=
 fails during runtime resume.
- [High] Dropping performance state vote before fallible operations leaves =
the device broken on suspend failure.
- [High] System crash due to unclocked register access when pm_runtime_get_=
sync() fails in spi_geni_init().
- [High] Silent failure in packing configuration for bits_per_word < 8 lead=
s to inconsistent hardware state and data corruption.
- [High] Asynchronous pm_runtime_put() in probe error path leaves hardware =
active.
- [Low] Unconditional assignment of dev_pm_ops struct creates dead code whe=
n PM is disabled.
--

commit 8aeef46f49b41f7b8567cd06d65f302b46222b6a
Author: Praveen Talari <praveen.talari@oss.qualcomm.com>

spi: qcom-geni: Use resources helper APIs in runtime PM functions

This commit introduces the geni_se_resources_activate() and
geni_se_resources_deactivate() helper APIs. These functions reduce
code duplication during runtime power management. The drivers now use
a streamlined method for ICC, clock, and SE resource operations.

> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 333216df922e8..4205349376955 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c

[ ... ]

> @@ -1137,15 +1129,14 @@ static int __maybe_unused spi_geni_runtime_resume=
(struct device *dev)
>  	struct spi_geni_master *mas =3D spi_controller_get_devdata(spi);
>  	int ret;
> =20
> -	ret =3D geni_icc_enable(&mas->se);
> +	ret =3D geni_se_resources_activate(&mas->se);
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D geni_se_resources_on(&mas->se);
> -	if (ret)
> -		return ret;
> +	if (mas->se.has_opp)
> +		return dev_pm_opp_set_rate(mas->dev, mas->cur_sclk_hz);
> =20
> -	return dev_pm_opp_set_rate(mas->dev, mas->cur_sclk_hz);
> +	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but if dev_pm_opp_set_rate() fails here, does
the function return an error without calling geni_se_resources_deactivate()
to roll back the resources enabled by geni_se_resources_activate()? Could t=
his
cause a persistent leak of clock references and interconnect bandwidth?

There are also a few pre-existing issues in this file and related code that
are not directly introduced by this patch, but might be worth addressing:

drivers/soc/qcom/qcom-geni-se.c:geni_se_resources_deactivate() {
    ...
	if (se->has_opp)
		dev_pm_opp_set_rate(se->dev, 0);

	ret =3D pinctrl_pm_select_sleep_state(se->dev);
	if (ret)
		return ret;
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but dropping the OPP rate to 0
before the fallible pinctrl_pm_select_sleep_state() creates a window for st=
ate
inconsistency. If pinctrl fails and an error is returned, PM runtime will l=
eave
the device marked as RPM_ACTIVE. Will subsequent accesses to the device be
unclocked, potentially leading to hardware hangs or asynchronous external a=
borts?

drivers/spi/spi-geni-qcom.c:spi_geni_driver {
    ...
	.driver =3D {
		.name =3D "geni_spi",
		.pm =3D &spi_geni_pm_ops,
		.of_match_table =3D spi_geni_dt_match,
	},
    ...
}

[Severity: Low]
This is a pre-existing issue, but does assigning &spi_geni_pm_ops unconditi=
onally
to .pm produce dead code when CONFIG_PM is disabled? Should this be wrapped=
 with
pm_ptr() to ensure the callbacks are properly conditionally compiled out?

drivers/spi/spi-geni-qcom.c:spi_geni_init() {
    ...
	pm_runtime_get_sync(mas->dev);

	proto =3D geni_se_read_proto(se);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but does the unchecked
pm_runtime_get_sync() allow execution to proceed to geni_se_read_proto() ev=
en
if it fails? Could this trigger an unclocked register access and cause an
asynchronous external abort?

drivers/soc/qcom/qcom-geni-se.c:geni_se_config_packing() {
    ...
	int iter =3D (ceil_bpw * pack_words) / BITS_PER_BYTE;
	int i;

	if (iter <=3D 0 || iter > NUM_PACKING_VECTORS)
		return;
    ...
}

[Severity: High]
This is a pre-existing issue, but for valid bits_per_word values less than =
8,
doesn't iter exceed NUM_PACKING_VECTORS (4)? If the function silently retur=
ns
without writing to the SE_GENI_TX/RX_PACKING_CFGn registers, will the hardw=
are
operate using stale packing configurations and potentially corrupt data?

drivers/spi/spi-geni-qcom.c:spi_geni_init() {
    ...
out_pm:
	pm_runtime_put(mas->dev);
	return ret;
}

[Severity: High]
This is a pre-existing issue, but doesn't the use of the asynchronous
pm_runtime_put() in the error path allow pm_runtime_disable() (called during
device removal or probe failure) to cancel the pending suspend? Does this l=
eave
the hardware active and permanently leak clock and interconnect resources?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-enable-spi=
-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com?part=3D3
