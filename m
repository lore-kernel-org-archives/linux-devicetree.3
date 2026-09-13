Received: from mta0.migadu.com (out-74.mta0.migadu.com [91.218.175.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A5B35E1A4
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 08:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789288420; cv=none; b=hYAojWDdybDj9wjs2L9gMJemYizcGC9RXMo4qaWNK0FwVhLjKuinlr5nJl4QYeijvCus/786Vqhy/7DERAA22h4dFEvN1aPO039CY7DIV/g1aD0N4cCgXH+8Qp+ojorso1svguMRh01Zas+RCtlThwRdZIVxD1NnwmJ1vicaDXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789288420; c=relaxed/simple;
	bh=gZziKGY+pciV87A1gXHM0LG1L5PqC5q8IxSkp5BXcFM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=b13djehxlg54fIGZxCAFiqyANepxQEhrZgbBPi3c9H8/4L4a8HhfXq0w9kgc67AE5MmIVGSkMRbBoQCyCoM7Z4lPHIpgZU191FhGcMrwzEJYiVFLckt6ZYVmUt8cpnvshX+tuA1Bdp32PW3WCj11n/5MKgsVUmCvdc5fKqyQMD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RbqEKwPm; arc=none smtp.client-ip=91.218.175.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RbqEKwPm"
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gZziKGY+pciV87A1gXHM0LG1L5PqC5q8IxSkp5BXcFM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789288415; v=1; x=1789893215;
 b=RbqEKwPm+UDNhCYp4igfDd8ifXT8+vzuhRnEeLyVVJd7ar9jXqF509TrOkkgjFn4wIxuix1L
 ylrqPuk6809otSHl+zzkkAxdQFN3LTg6BA7liS61SS2rN+jqpxw/QFVhB5pEWcJq62+KJeqq1wR
 Vp9pyXXIOSa1IXdJBPWraPSQ=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0bf7a0079990b2f0;
	Sun, 13 Sep 2026 08:33:24 +0000
X-Mizu-Trace-ID: 0bf7a0079990b2f0
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 13 Sep 2026 16:33:19 +0800
Message-Id: <DLE1SV7ZDI16.39A7FPB6DOCQ8@linux.dev>
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Ze Huang" <huang.ze@linux.dev>
Subject: Re: [PATCH v2 8/9] riscv: dts: spacemit: enable USB2.0 controllers
 on OrangePi RV2
From: "Ze Huang" <huang.ze@linux.dev>
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Yixun Lan" <dlan@kernel.org>, "Xu Yang" <xu.yang_2@nxp.com>, "Peng Fan"
 <peng.fan@nxp.com>, "Peter Chen" <peter.chen@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
X-Mailer: aerc 0.22.0.r10.g73f20125
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com> <20260908-b4-spacemit-k1-usb2-v2-8-f07342ffa051@linux.spacemit.com>
In-Reply-To: <20260908-b4-spacemit-k1-usb2-v2-8-f07342ffa051@linux.spacemit.com>

On Tue Sep 8, 2026 at 5:48 PM CST, Junzhong Pan wrote:
> On OrangePi RV2, usb2_0 is connected to a Type-A connector at host
> mode, its vbus output is controlled by gpio 126. And the usb2_1 is
> connected to the USB2.0 connector pins onboard.
>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 28 ++++++++++++++++++=
++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/risc=
v/boot/dts/spacemit/k1-orangepi-rv2.dts
> index b907a1396b21..32d1aafc88f7 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -64,6 +64,16 @@ vcc5v0_usb30: regulator-vcc5v0-usb30 {
>  		vin-supply =3D <&vcc_5v0>;
>  	};
> =20
> +	vcc5v0_usb20: regulator-vcc5v0-usb20 {
> +		compatible =3D "regulator-fixed";
> +		enable-active-high;
> +		gpios =3D <&gpio K1_GPIO(126) GPIO_ACTIVE_HIGH>;
> +		regulator-name =3D "vcc5v0_usb20";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		vin-supply =3D <&vcc_5v0>;
> +	};
> +
>  	leds {
>  		compatible =3D "gpio-leds";
> =20
> @@ -341,10 +351,28 @@ &uart0 {
>  	status =3D "okay";
>  };
> =20
> +&usbphy0 {
> +	status =3D "okay";
> +};
> +
> +&usbphy1 {
> +	status =3D "okay";
> +};
> +
>  &usbphy2 {
>  	status =3D "okay";
>  };
> =20
> +&usb2_0 {
> +	vbus-supply =3D <&vcc5v0_usb20>;
> +	dr_mode =3D "host";
> +	status =3D "okay";
> +};
> +
> +&usb2_1 {
> +	status =3D "okay";
> +};
> +
>  &usb_dwc3 {
>  	dr_mode =3D "host";
>  	#address-cells =3D <1>;


Works fine on rv2, thanks!

Tested-by: Ze Huang <huang.ze@linux.dev>
