Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F8B42F6F6
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784220087; cv=none; b=DKE+Yp8elIjLd0kOyovy2O+moUxz+aiXJzupTGKqFuxbDblbAPVa64LdObtc9W8VxuXuAEPnVoEPeQO3pbdsZrfm29Z0YTf0UBkfmLVtI0SynRP4IVg3iQBMlSpET0OhxkO0Jw5H6OYdl4SoSWSJCmXkHX7xFhRDdRwPLmU2/Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784220087; c=relaxed/simple;
	bh=NLDqUXyNiHc5o69EWE57ZljHN2pfyaWNX+0FtdeeYBc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H+bzrbF8ti3fnmQidg9zWmvPKYY7GSWxzDRCEIhu48KjQHtt3G67ZqbaEz5H0o2aKnPFflC8CUcBJi2yAi0LVxFhWCq4ZycWT+9fqsooWx2HcE2f5Cumu8KD79JmHY4Y5gO8H3Snx+yTbF8XTfjZuHrLbIYHLCIAPDbXgVeqNQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HB1pfG/u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HB1pfG/u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA16E1F000E9;
	Thu, 16 Jul 2026 16:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784220078;
	bh=qzik+8JyhJocOOA+rM8T6SWM9iactfPOTXYphl6Ulus=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HB1pfG/u4jZsvRJpume41VdSmFEwm26PG2kAergcjSGhqPJD9821Bl2O2NcI35w2g
	 d+e+XTY6bt7ZMbC6A3WNEmE9LZHg97BDqJMwCdUsYb3Lqo/adUPhyoizNPMUeqUkjE
	 l2Glgk0MDSJ5qC+PaN2TD4gEpvAh3i96UPYtxc+CWeeswmZ8KdcQTj38qSamn7NER9
	 5ORCtfuOgp44Txx4XWHcUqGOCG2MOGFB+U2To8ZkjcEICfTKtOkxZvhh+mkCPqxdAN
	 HZyHY52Em2VoYRiGvcsoCG015Jf+w2fkT4Wt/FInk0zMEZBJnxOE8ELHG4l/tQSHfi
	 Gh3P4DQmzNkbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: Enable Primary USB controller
 on Shikra CQS platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Kurapati" <krishna.kurapati@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260716-shikra-usb-dt-v3-v3-2-13f73a0571bb@oss.qualcomm.com>
References: <20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com>
 <20260716-shikra-usb-dt-v3-v3-2-13f73a0571bb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 16:41:17 +0000
Message-Id: <20260716164117.BA16E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `dr_mode =3D "peripheral"` prevents the USB controller f=
rom defaulting to device mode as intended.
--

--- Patch [2]: [PATCH v3 2/4] arm64: dts: qcom: Enable Primary USB controll=
er on Shikra CQS platform ---
commit 2bd6f1e7b8937d47916fb8392363e93f8f9b7c35
Author: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

arm64: dts: qcom: Enable Primary USB controller on Shikra CQS platform

This commit enables the primary USB controller and its associated PHYs on
the Shikra CQS platform, with the stated intent of configuring it in
device mode.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-cqs-evk.dts
> index b3f19a64d7aed..2e96dadd650a7 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
[ ... ]
> @@ -38,3 +38,22 @@ &sdhc_1 {
> =20
>  	status =3D "okay";
>  };
> +
> +&usb_1 {
> +	status =3D "okay";
> +};

[Severity: Medium]
The commit message indicates the intent is to enable the primary USB
controller in device mode, but there is no dr_mode property specified here.

Does this missing property cause the dwc3 driver to default to OTG mode
during boot?

If there is no dynamic role switch defined to drive the role (like a Type-C
connector or extcon), will the controller just wait for a role switch event
and fail to function as a peripheral out of the box?

Should a dr_mode property be explicitly added to this node to ensure
it matches the behavior described in the commit message?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-shikra-usb=
-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com?part=3D2
