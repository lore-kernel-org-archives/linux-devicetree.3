Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E349B381E88
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 21:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789249246; cv=none; b=jXeXZMeJ7XQHoWWTLb0lSs6YCTfRf8tLkdyaUlQxoOwcnbkLoykBNlXxRy3k5Az+Yqe0Qhz/tWHFJDaPxf0IN5Q4sq1EKZRxNqaMyoidFhLli4QphAVM4d7Ll2uHWUsUoKyNY04vJ95o09Yn+QjWe7qx9Dq3G/hUOVPvDvBrQPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789249246; c=relaxed/simple;
	bh=R1gsF4+HgLfQK56SU8aFnlEoOyKTuOsHD++6l0D1/EQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PfyXUtpBCqVmVbUBz/xBU0tQJ2mGDUr71lrWgJVZJrG8PumnxcZOLGZX3SoPwxAdzaq9pW5QxMCdnjL2aguG8U6/vcnfIXzXjdDFqRX4UN+6BqPz8tcFo3gQ31qcYJ5orxauvZ9C4LY33GplqRKzmWalfgQHJTUxDsRJts2GblY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/zHvXXB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/zHvXXB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B3F1F000FF;
	Sat, 12 Sep 2026 21:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789249244;
	bh=aIiLQuXkjqxWkkbnpKPThoM44QyrpiPs0QzK2xeXwQs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P/zHvXXBHvwID1Syg1NjevOwntokBbbuPAN8hbtMsVdJ3FvIKGwaFjXMm6j4mcdJr
	 5IfJzEwPtTOPSTwc0YgrShbZp5Utwx4NebXnx/A2BZ+spi7h3Zau8Jk0nb/gOxlIzY
	 /Ahz+cOkmrTRg/fzuAV+B1le0K/aMnct9c5BO7W5DEC7CMES5X09Dgjf3EMAHn4znF
	 Mmrm8IL3t3FN9oOsvkBJaNmfltTgwa/MQ4KZpayd3vOXmXc5+duAR6TIvriFkA3VM9
	 ueqPCAf1C4c27Dpla6t9YRDSewQno+WOdV1Y29qM6wxCMERPv8B+9S7lznn/lS33zH
	 CCRArGRN3jvFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] arm64: dts: ti: k3-am62: use ti,am62-mcan
 compatible for m_can devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kendall Willis" <k-willis@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260912-smth-v3-1-6fa661ae5a4c@ti.com>
References: <20260912-smth-v3-0-6fa661ae5a4c@ti.com>
 <20260912-smth-v3-1-6fa661ae5a4c@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 21:40:43 +0000
Message-Id: <20260912214044.48B3F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The compatible string 'ti,am62-mcan' is used in the device tree but=
 is not documented in the dt-bindings, causing dtbs validation failures.
--

commit 38209444ad0c4e93f314506da051123caab882d5
Author: Kendall Willis <k-willis@ti.com>

arm64: dts: ti: k3-am62: use ti,am62-mcan compatible for m_can devices

This commit prepends the ti,am62-mcan compatible string to m_can devices
in the AM62 device trees to indicate out-of-band wakeup capabilities.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/d=
ts/ti/k3-am62-main.dtsi
> index c5ee263d34a62..4c7e793d84a0e 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> @@ -933,7 +933,7 @@ eqep2: counter@23220000 {
>  	};
> =20
>  	main_mcan0: can@20701000 {
> -		compatible =3D "bosch,m_can";
> +		compatible =3D "ti,am62-mcan", "bosch,m_can";

[Severity: Low]
Is the ti,am62-mcan compatible string documented in the dt-bindings?

Running make dtbs_check on the generated device trees for k3-am62 platforms
will fail validation because the dt-binding for bosch,m_can strictly requir=
es
the compatible property to be const: bosch,m_can and does not accept the new
ti,am62-mcan string or an array of strings.

Does this patch depend on a separate dt-bindings update that needs to be
applied first, or should the bosch,m_can binding be updated alongside this
change?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912-smth-v3-0-=
6fa661ae5a4c@ti.com?part=3D1
