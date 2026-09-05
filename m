Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5484B0CA2
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 15:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622831; cv=none; b=hR58RxH9XIcWdYTyvBwSgHyWRoJJZs4seogpjTt7wJU+HJT49GSBsSPg75ogaAmzBc8iDjT/EEI3KOK7ebW0csV9fwdHkLVQEQDYX9MGPNFKgeeiYqLgeEad7AkzVCV+8cWmx+LwyYS8gxyghmQidngvZpVGL1RbbtlPun2dH3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622831; c=relaxed/simple;
	bh=gnUOi0/rmffEEmvVGp9MjfjmSFmNqJYat7+ohLqpSLQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BuG+9Sc/8UKgLbbBlbLt1vm2PbacTJhJtZ1RrePe7q+SmXQ4qpRvU4q6aF3sG0BGfrt07ezZ+sS5oDM6tSZMRmPlGHcDXY4YbwyqWMrs/HKnJ++zGul17pBjWRTjqZihCBUQJDu450yNS50hipfYciXTo9xM823fIQPILv00qPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VHi6Jv6l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VHi6Jv6l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6D91F00A3A;
	Sat,  5 Sep 2026 15:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788622826;
	bh=EPOGoZys2/8mCkrtmEOMC9IINUrL5IIWHmfw5JEF/Sc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VHi6Jv6lFSkjjemBXlmjKZ6MG1YQMxrY20X9ZsSBMMambi9dpkvpCIzuqjaEtSh6w
	 yCz+uKaWDfILStcBGtzUg542MTVrxLmxS6Z3ajTf37p64YAd+aVCHqOTLTMzBbssPP
	 BeQW2jpxdZcqqvqAuhqCSIChJdTc8M5vdBOrExIplLmWfcMq6e4k2w5lKgryfRpRhD
	 FTY9bGkQASN2d+4F527CXcvkz6Bf9I0Q6oJ7iOr1f0F9Rwod8kx7PlYjfiTURfYxGE
	 KkGHCCb0cNxH0oncW3ZMA74L9faQYgmSqZV17dJyq0UvlwM9E4S57pZSIwMkZg4Oud
	 kjnphwpZimkRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/5] usb: dwc3: qcom: Modify interrupt handling for
 eUSB2 Phy targets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Kurapati" <krishna.kurapati@oss.qualcomm.com>
Cc: robh@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org
In-Reply-To: <20260905-eusb2-interrupt-v7-v7-5-820cf5377a70@oss.qualcomm.com>
References: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
 <20260905-eusb2-interrupt-v7-v7-5-820cf5377a70@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 15:40:25 +0000
Message-Id: <20260905154025.ED6D91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver will fail to probe if CONFIG_GENERIC_PHY is disabled be=
cause devm_of_phy_get_by_index() returns -ENOSYS.
--

commit 7538db3f4327a94f92b49936063fdf191b900637
Author: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

usb: dwc3: qcom: Modify interrupt handling for eUSB2 Phy targets

This commit updates the dwc3-qcom driver to dynamically query the attached
PHY type and adjust the eD+/eD- line wakeup interrupts accordingly for
eUSB2 targets in host mode.

> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index ba26e61df915a..2d1e66ff72ed5 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c

[ ... ]

> @@ -698,6 +720,17 @@ static int dwc3_qcom_probe(struct platform_device *p=
dev)
>  	if (ret)
>  		goto clk_disable;
> =20
> +	phy =3D devm_of_phy_get_by_index(dev, dev->of_node, 0);
> +	if (IS_ERR(phy)) {
> +		if (PTR_ERR(phy) !=3D -ENODEV) {

[Severity: High]
Will this cause a regression in dwc3_qcom_probe() when CONFIG_GENERIC_PHY is
disabled?

When CONFIG_GENERIC_PHY is not set, devm_of_phy_get_by_index() returns
ERR_PTR(-ENOSYS). Since -ENOSYS does not equal -ENODEV, this check will
evaluate to true and cause the probe to unconditionally abort.

Prior to this patch, the driver did not fetch the PHY directly, and the
DWC3 core gracefully handles -ENOSYS by treating it identically to -ENODEV.
Could this error handling be updated to also ignore -ENOSYS so that existing
configurations without CONFIG_GENERIC_PHY continue to work?

> +			ret =3D dev_err_probe(dev, PTR_ERR(phy),
> +					    "failed to get usb2 phy\n");
> +			goto clk_disable;
> +		}
> +		phy =3D NULL;
> +	}
> +	qcom->has_eusb2_phy =3D (phy_get_type(phy) =3D=3D PHY_TYPE_EUSB2);
> +
>  	qcom->mode =3D usb_get_dr_mode(dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260905-eusb2-inte=
rrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com?part=3D5
