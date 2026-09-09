Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6294C2F0661
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 19:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983525; cv=none; b=lHArLOao0J+aIOxsPeDMtze0whyO6hZnNN0/bmq4F+En4LLjyMGOa9YCuL7WshsNrYaVoH9zSMTIHmdAca9y5R+10uo0v0FYXYOF42HDYUfk6uhGzLkgzm5aV6CBnbLAPgpTuvzz2m7KXb0/M7wFFQi9zIX20JQYBjCLjKpxqCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983525; c=relaxed/simple;
	bh=Psr17wybNpVlkeV3MynfQRTSWz/AG2dmAtmnIi3Y38A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tyA1M3fCGx+swOohG8wbGSUmBE5cRyi6XmbhQTFlgroTTfIUABJZNXPa0hrMvmqFIF8JdZFrWuLeCjr1IeHYu4cAkd/g/FUxCww51cgeNa9SNvFMP76BJED3PlfjpcZ0zGEilXYqHmDAA9gxLyrB58Y1B9COW8Vd9daOUYcvnSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfA4beWH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfA4beWH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CC41F000FF;
	Wed,  9 Sep 2026 19:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788983524;
	bh=tV0WdZtQQ/mVbo+aAHyQkaedmVuU7oDp8NP4DiJsJ28=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QfA4beWHj8TJpLINp/msPd6mH7tU7fYy9JBuu0ngIVAsmL1t6N+1ZfKWvl+HmrDeH
	 jSKKGQYMu9M1vA1KN4aLrvRKgSqgwrQt6085cgBYToSJOzr7uRTzf0Mko1nIoTCs4n
	 p2wV9FiOt7KA9mQGGy3bpmP3s6MGTHIZr2Q9vKBkorc7QtOFVEWI/hUIEQ1dDcWCCl
	 mOtLv8gEGvgymFOY6+P7EbSqEiwwUVqP9xHVmTtWG/7OFWzkJhwngcyAeE6Ru+s1dc
	 Fb8K17bTiXmH+kzXCvzdCtsmfxiLa8YC/4VkN9ZIdTwlF83L5LO2VLic1om1RI3cYk
	 E2Tj6U3aMA/OQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] media: ipu-bridge: Add Sony IMX681
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergey Lebedev" <lsa.uz@pm.me>
Cc: robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260909193953.86192-4-lsa.uz@pm.me>
References: <20260909193953.86192-1-lsa.uz@pm.me>
 <20260909193953.86192-4-lsa.uz@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 19:52:03 +0000
Message-Id: <20260909195203.E1CC41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Leaked ACPI device reference and dangling secondary fwnode pointer=
s on error paths.
--

commit 4b67afbc2a1ae41061ad9ba083bbebdbbe1112a4
Author: Sergey Lebedev <lsa.uz@pm.me>

media: ipu-bridge: Add Sony IMX681
   =20
The Microsoft Surface Pro 11 for Business (Intel Lunar Lake, IPU7) carries
a Sony IMX681 as its user-facing sensor, enumerated as ACPI device
SONY0681. Add it so ipu_bridge_connect_sensors() builds its half of the
graph; without the entry the sensor is never connected, whatever driver is
present.

> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/int=
el/ipu-bridge.c
> index 7e65491faf6dc..68c2eb326f1dc 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -97,6 +97,8 @@ static const struct ipu_sensor_config ipu_supported_sen=
sors[] =3D {
>  	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
>  	/* Omnivision OV8856 */
>  	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
> +	/* Sony IMX681 */
> +	IPU_SENSOR_CONFIG("SONY0681", 1, 969600000),

[Severity: High]
This is a pre-existing issue, but while reviewing the addition of this new
sensor, I noticed potential leaks and dangling pointers in the error handli=
ng
paths of ipu_bridge_connect_sensor() and ipu_bridge_unregister_sensors().

If ipu_bridge_instantiate_ivsc() fails:

drivers/media/pci/intel/ipu-bridge.c:ipu_bridge_connect_sensor() {
	...
		sensor->adev =3D ACPI_PTR(acpi_dev_get(adev));

		primary =3D acpi_fwnode_handle(adev);
		primary->secondary =3D fwnode;

		ret =3D ipu_bridge_instantiate_ivsc(sensor);
		if (ret)
			goto err_free_swnodes;
	...
err_free_swnodes:
	software_node_unregister_node_group(sensor->group);
err_put_ivsc:
	put_device(sensor->csi_dev);
	acpi_dev_put(sensor->ivsc_adev);
err_put_adev:
	acpi_dev_put(adev);
	return ret;
}

Since bridge->n_sensors is not incremented before the failure, the caller
ipu_bridge_unregister_sensors() iterates up to the previously successful se=
nsor
and skips this failing sensor. Does this mean the acpi_dev_get(adev) refere=
nce
held by sensor->adev is permanently leaked?

Furthermore, primary->secondary is assigned but never cleared on this error
path, leaving a dangling pointer.

Additionally, in the cleanup function itself:

drivers/media/pci/intel/ipu-bridge.c:ipu_bridge_unregister_sensors() {
	for (i =3D 0; i < bridge->n_sensors; i++) {
		sensor =3D &bridge->sensors[i];
		software_node_unregister_node_group(sensor->group);
		acpi_dev_put(sensor->adev);
		put_device(sensor->csi_dev);
		acpi_dev_put(sensor->ivsc_adev);
	}
}

Does this code leave dangling secondary fwnode pointers? The function
unregisters and frees the software nodes, but it doesn't appear to clear the
secondary fwnode pointers on the ACPI or CSI devices first (e.g., setting
acpi_fwnode_handle(sensor->adev)->secondary =3D NULL or calling
set_secondary_fwnode(sensor->csi_dev, NULL)).

If the ACPI or CSI devices are later queried for fwnode properties, could
this trigger a use-after-free?

>  	/* Sony IMX471 */
>  	IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
>  	/* Sony IMX471 (found on Lenovo X1 Carbon G14) */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909193953.8619=
2-1-lsa.uz@pm.me?part=3D3
