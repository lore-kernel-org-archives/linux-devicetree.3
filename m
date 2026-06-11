Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96D734A3D6
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 07:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781162653; cv=none; b=FlXc1QLR5ZiP0UxrjhPrTZHqZ+3fHT4+1zZTCCeJt/HmjVx6j7EL5sKYO+6Y3IF+oM7SwEv1/DwcaYt/+VLHOBKVPDdmRMWYObXO4cP0nOqDFZ1mZMqpT3GIvyQVTPqvJLOmCSwRGdMFRgQb2+q1kqnOM/Q3k1BQ9RlKh7T1NOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781162653; c=relaxed/simple;
	bh=PjTAo4dbofqv0ye7GM5PSTrEQOzpu8oolIIqfFbEJ3c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kNsHUd6x9n4GXMwSqgywNbFKwy7JAny/LJjuRwQ2LQhAV4U/ujAV+Yf+7BHbqVcLz2T8+3q64ZwozYcsRpdRi6XJjqgiAnKHqUy5pss/JnQWG7Qau8MBjV70IKlFldJSF9RUIbrtlKO34qehdPL09AWDx2IVHRMzk1zL3XRWcFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZdkiw09; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZdkiw09"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD6F1F00893;
	Thu, 11 Jun 2026 07:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781162652;
	bh=Vpi36MEFsA8rNajtOkG02BOhhnUizF0oqsV0ErxqUqk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MZdkiw09X4Bb9nCmlgr6J2uuCCza2Din1T4ntCPFQXyjXaZYvaF8u8GqHfQXq9Gg8
	 Y43xPvfhZ1HsNC7q2pVWuv6UUa18sXWdK3buH6o3gM8N4gPMNQ1Dn6uNb36tNRRUZD
	 zSvwOKE0nJCPTnbofWN3WG0kMAE5pGMCVAhcHU0CmIhVKqNDVZ6XbI6uv3IDzjlAss
	 LQikvCHv+et9w7Hp7cVySNQ+rhbrwBeiKr8jqNtIzWIdbjyjvBEmMst5Rd8Ma/QfW7
	 REhm5pFZvhbl/e2Hq4bl/aCGYCzL797aPvJUyWiJp4a4d+zm7C1T0GSPVLr0fF+prc
	 eOkVsGUeZZGwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 37/37] arm64: dts: qcom: msm8996: Move PCIe phy and
 GPIOs to root port node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260611-wake-v2-37-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-37-2744251b1181@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 07:24:11 +0000
Message-Id: <20260611072412.2AD6F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims to move both the 'phys' and 'phy-names=
' properties to the root port nodes, but the patch actually deletes 'phy-na=
mes' entirely.
--

commit baa70baca6b8bb3dd12472bf021f252ebb1f4c9c
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: msm8996: Move PCIe phy and GPIOs to root port node

This patch moves the PCIe phy reference and GPIO properties to the root port
node from the RC controller node. It adjusts the device tree nodes and adds
labels to allow board-level overrides for the root port context.

> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/=
qcom/msm8996.dtsi
> index 2f67e665996f3..8db1448e5e610 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -1900,9 +1900,6 @@ pcie0: pcie@600000 {
>  				      <0x0c100000 0x100000>;
>  				reg-names =3D "parf", "dbi", "elbi","config";
> =20
> -				phys =3D <&pciephy_0>;
> -				phy-names =3D "pciephy";
> -
>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
>  				ranges =3D <0x01000000 0x0 0x00000000 0x0c200000 0x0 0x100000>,

[ ... ]

> @@ -1951,7 +1948,7 @@ pcie0: pcie@600000 {
>  						"bus_master",
>  						"bus_slave";
> =20
> -				pcie@0 {
> +				pcie0_port0: pcie@0 {
>  					device_type =3D "pci";
>  					reg =3D <0x0 0x0 0x0 0x0 0x0>;
>  					bus-range =3D <0x01 0xff>;
> @@ -1959,6 +1956,8 @@ pcie@0 {
>  					#address-cells =3D <3>;
>  					#size-cells =3D <2>;
>  					ranges;
> +
> +					phys =3D <&pciephy_0>;
>  				};

[Severity: Medium]
The commit message states "Move phys and phy-names from the controller to
pcie0_port0, pcie1_port0, and pcie2_port0".

However, looking at the removal in pcie0 and the addition in pcie0_port0, it
appears phy-names was deleted but not added to the new port nodes. The same
pattern is present for pcie1_port0 and pcie2_port0.

Is the intention to drop the phy-names property completely because it is no
longer needed by the new bindings? If so, could the commit message be
updated to reflect that phy-names was removed rather than moved?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-wake-v2-0-=
2744251b1181@oss.qualcomm.com?part=3D37
