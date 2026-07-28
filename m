Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D5643F8A2
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 18:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785263215; cv=none; b=f3s5xn6lOUdfwqd2DqLv1xVtMPLsPcenKt6LIOF6yZE4hjIuuGe9fRDvVE1ieUWfVkPtznXyMctICnjAlhHuIKNN5LGjeHfQtaI2ElTerT2e3rn/84VWGzTjfAvY0OBAfFgRzSRydWofIqNyILvocJe3YoAkN/Rsv9xuN3VOXwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785263215; c=relaxed/simple;
	bh=aLf69OFjvhqkZCALYnG8VAOwwOf7uGEWpKSGCCfkl2c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lcATVAiKXruK079sJfA83z5CDM7hIt6jr5aEZsGbsKdr15nItLgi6+Hx9Lj41LkM7u/o+oYGt2H25HdIqNsJ0MERzCOmwF6VDwpbFKMDrJAIZ3vcgj7h+r5PkOvug59fUEzj3nkfAbR/7xESI9OTmfSxMk3Vbt4ElQwB9qGt3Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5lkAXCu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5lkAXCu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F6841F00A3A;
	Tue, 28 Jul 2026 18:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785263213;
	bh=MwYPAymCqlFrSzGYIRuGOsq/feOCorwN1mUI89gDIoo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b5lkAXCu8jFD+XKkZVjsM3IqbD4v4BLx+s4iXGnCoUazuKPdGp3himlglayrBP6GP
	 w6S6Sj4oK2EWVIRLohyBrsCxKnrKyUHDLk/A9G1UCFH330DGzYFHG6MIQeYwRGW/Jd
	 uNTgRZ4gDzYXDDybEsTZksqTF7dB5FMlV8u87ThULiY+YGsXa+oPw57D0YkYeCIgj+
	 Jz+OP0AZN4EsausE9igPEET7M+8nHt7sdHOd3mU8yQ0Xr+d5qRfTIzzexLayvydw7J
	 j/JT/I4Tx2kPTJEJkSj92mVRF5Z55BEHJlx7RD03hmzvUbKood7+L6xSTKFv0C11O+
	 aE6Mn5R83EsEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/8] arm64: dts: qcom: x1p42100-crd: Add qcom,tsens for
 EC fan thermal management
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anvesh Jain P" <anvesh.p@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260728-ec_add_more_commands-v1-7-771abd65ee1a@oss.qualcomm.com>
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-7-771abd65ee1a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 18:26:53 +0000
Message-Id: <20260728182653.8F6841F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `embedded-controller@76` node is instantiated in `x1p42100-crd=
.dts` without essential base properties (`compatible`, `reg`, `interrupts`)=
, resulting in devicetree compiler warnings and driver binding failure.
--

--- Patch [7]: [PATCH 7/8] arm64: dts: qcom: x1p42100-crd: Add qcom,tsens f=
or EC fan thermal management ---
commit 6a0028e3f0e9078f36aed5052ae5c17e337676ff
Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

arm64: dts: qcom: x1p42100-crd: Add qcom,tsens for EC fan thermal management

This commit adds the qcom,tsens property to the embedded-controller node in
the x1p42100-crd device tree for fan thermal management.

> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts b/arch/arm64/boot/=
dts/qcom/x1p42100-crd.dts
> index 7ed4116b95904..b46b67c5e4366 100644
> --- a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts

[ ... ]

> +&i2c5 {
> +	embedded-controller@76 {
> +		qcom,tsens =3D <&tsens2 11>;
> +	};
> +};

[Severity: High]
Does declaring the embedded-controller@76 node here create a new, incomplete
node?

Since this node isn't defined in the included base files, it appears to be
missing the required "compatible" and "reg" properties. Will this lead to a
devicetree compiler warning about a unit name without a reg property, and
prevent the qcom-hamoa-ec driver from binding?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-ec_add_mor=
e_commands-v1-0-771abd65ee1a@oss.qualcomm.com?part=3D7
