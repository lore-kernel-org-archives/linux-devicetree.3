Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796E8353A90
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 05:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055894; cv=none; b=VSXpvCmw3DGOheswhJbxaA/c6oCr+Ijpf55DqmbqG4GnqAZZKGVDxnEr0JMwnGzzyEdDO1E4bY2Bxe1zjslg3icUEApY0cL64phMVbyFLoKaEa5uAlI6VABa/GVUa+2twdw6hobBiqPa/dbtBv/HjoSwcLytCr29GyT0jfp5NQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055894; c=relaxed/simple;
	bh=/ZV0czfIS9daMssmPcd3BR2gSRKnpT1tYsuMU7qxotY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uJEyPEGzkUQspQH1W6X1h88i6Z26X/AEPYGBpE7Ej3jmvrSy1gyeYlf6kxwiChVNSubaJoA2EOna5JGfpmsAqiCmBzm2DpVOAx9kNBB0nkq+zR07IqjKkrwATp7RXeHf6MxIfXwXwgmVGcPArtULbd3JGY4iVzBzUnuUnUWSlZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJVBfx3D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJVBfx3D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4191F000E9;
	Fri,  3 Jul 2026 05:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783055884;
	bh=2x6zde3ZmldJpBgbCteGWdLJiJ0PTxoIsZ8v2ZEyDP4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RJVBfx3DU04lLzuqKm+QIXMNN4WfgjKqApqDuGvjfZ1ub82Z92cJrDTaHCKAjPcmC
	 fIZQeQ7t12aI/OiVDoDpnsbEy6GJ50vI7Az7DeAMv75ZOOYBXDiOWLT6jD4H1/bCyi
	 XRioP3DecIRVSV5Ly+pHAnvE3pmjSydk8hGCS9wxWy1xaPWUOU9bM4uPg/SigsZFSP
	 T550Q9Zoocq1Hn0uVjOwmk+BSKZocRddKDSacqCSwn6Mpipci0WVBcHaFoCCGCNB3H
	 T3LF5Cwq7At01zPOZyTWLTVMjJ075QRZ9orLNk+KZEmj1f6EJwNnSsOYMH+QBwvQ4L
	 0KqoRgtFY20xg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 07/10] arm64: dts: qcom: lemans: Enable CDSP cooling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260703-qmi-tmd-v4-7-3882189c1f83@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-7-3882189c1f83@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 05:18:03 +0000
Message-Id: <20260703051804.6B4191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing NULL reset of tmd->cdev on registration failure causes inv=
alid pointer dereference during unregistration and breaks subsequent regist=
rations.
- [High] Destroying the QMI handle before unregistering the thermal cooling=
 devices introduces a race condition with userspace resulting in a Use-Afte=
r-Free.
--

commit 68055a14c90dc23e8743fc49a13b0805f601355b
Author: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: arm64: dts: qcom: lemans: Enable CDSP cooling

This commit sets up CDSP cooling for both instances in the lemans device tr=
ee.
It configures the cooling maps and cooling devices to throttle the CDSP whe=
n it
reaches 105=C2=B0C.

> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 353a6e6fd3acb..89fa25e9d3c6d 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
[ ... ]
> @@ -8764,7 +8769,7 @@ nsp-0-0-0-thermal {
>  			thermal-sensors =3D <&tsens2 5>;
> =20
>  			trips {
> -				trip-point0 {
> +				nsp_0_0_0_alert0: trip-point0 {
>  					temperature =3D <105000>;
>  					hysteresis =3D <5000>;
>  					type =3D "passive";
> @@ -8776,6 +8781,14 @@ trip-point1 {
>  					type =3D "passive";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip =3D <&nsp_0_0_0_alert0>;
> +					cooling-device =3D <&remoteproc_cdsp0 QCOM_CDSP_TMD_CDSP_SW
> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};

[Severity: High]
Does enabling this cooling device expose a regression involving an invalid
pointer dereference in qmi_tmd_register()?

If thermal_of_cooling_device_register() fails, tmd->cdev holds an ERR_PTR:

drivers/soc/qcom/qmi_tmd.c:qmi_tmd_register() {
    ...
	tmd->cdev =3D thermal_of_cooling_device_register(dev->of_node, index,
						       label, tmd, &qmi_tmd_cooling_ops);
	if (IS_ERR(tmd->cdev))
		return PTR_ERR(tmd->cdev);
    ...
}

Because tmd->cdev is not reset to NULL, qmi_tmd_unregister() will pass this
ERR_PTR to thermal_cooling_device_unregister(), which expects a valid
pointer or NULL:

drivers/soc/qcom/qmi_tmd.c:qmi_tmd_unregister() {
    ...
		if (!tmd->cdev)
			continue;

		thermal_cooling_device_unregister(tmd->cdev);
    ...
}

Will this cause a kernel panic when the thermal core dereferences the
invalid pointer?

Additionally, if the QMI service restarts, would a stale error pointer
silently skip registration entirely?

[ ... ]
> @@ -8784,7 +8797,7 @@ nsp-0-1-0-thermal {
>  			thermal-sensors =3D <&tsens2 6>;
> =20
>  			trips {
> -				trip-point0 {
> +				nsp_0_1_0_alert0: trip-point0 {
>  					temperature =3D <105000>;
>  					hysteresis =3D <5000>;
>  					type =3D "passive";
> @@ -8796,6 +8809,14 @@ trip-point1 {
>  					type =3D "passive";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip =3D <&nsp_0_1_0_alert0>;
> +					cooling-device =3D <&remoteproc_cdsp0 QCOM_CDSP_TMD_CDSP_SW
> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};

[Severity: High]
Could exposing these cooling devices to userspace trigger a use-after-free
regression during teardown?

In qmi_tmd_exit(), the QMI handle is released before the cooling devices
are unregistered:

drivers/soc/qcom/qmi_tmd.c:qmi_tmd_exit() {
    ...
	qmi_handle_release(&qmi_tmd_cli->handle);
	qmi_tmd_unregister(qmi_tmd_cli);

	scoped_guard(mutex, &qmi_tmd_cli->mutex)
		qmi_tmd_cli->connection_active =3D false;
    ...
}

If a concurrent write to the thermal sysfs node invokes
qmi_tmd_set_cur_state() -> qmi_tmd_send_state_request() before the cooling
device is unregistered, the connection_active flag is still true.

Would this cause qmi_txn_init() and qmi_send_request() to operate on the
already destroyed qmi_tmd_cli->handle?

Should qmi_tmd_unregister() be called before releasing the QMI handle to
ensure pending sysfs operations are safely quiesced?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-qmi-tmd-v4=
-0-3882189c1f83@oss.qualcomm.com?part=3D7
