Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20AB382F03
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 06:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061199; cv=none; b=uGlE9evdM1rm2LU+sjjno1cHM91+QiRHlnQSC8lndna0UG4A4EKYByPj1vySy2MnYKwVwRHL9Bo8sZklfNQk/fHoeXtKmbZc6vbp0hVk75B4M3p2oSDRDqTvCrxUWnCJEHx6m1s27c6oZ1D1A3ACJ/7O5K35z80HRcQsZU9x9Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061199; c=relaxed/simple;
	bh=zYUKFu34AySjt0VqkrhoPCtfsuMP6/HQY2yTKAKchOg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jVAD3Kik3tZIoCAF74Bzz6ESmGLhQueXIB7GyehsA/bd7Nts0syxsAwk/HnHsiH/HViu6BZG6CmGu/3ciXZfKQGrCkxEw0KiBF8JlPx6Y0pNW0ckS1KMyDEw2EDzCo4r79gLVHu/mIzk+hViUS6wEnW+nswa3Bhejr4dy8oe9B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYj23yoU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYj23yoU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2CD1F000E9;
	Fri,  3 Jul 2026 06:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783061196;
	bh=zYUKFu34AySjt0VqkrhoPCtfsuMP6/HQY2yTKAKchOg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kYj23yoUPDrw4kJlKt/E77zf4el3LAKAzPHlAhPydret8YWSS2QS8q2RSbHRFhGnz
	 c+32s/yCeiIK+tfr5po9R9mIkP+FA1jJ2ZDH5I2glrfb9Z6YrVRz3G1YYrhvo9rFgT
	 aDFQmRft3PSEILXcivPvTGFBGhwv78WTEEXcjLcLtYtiW1btGZ2j2DIKSfXLbFuWF+
	 yfKWzBL8QPmTMwT3ANnyJVDQ4+FHjLTedXXxhOMElL1JTXElQvBTpsV5Tty9/Vvlq/
	 3rY5k53n3cE5QWPegRe9xJteB/FNGcGWR/81xOv0FR2tTKjx5hS9zkSLt3xybPqvcS
	 5p4m0col/PaqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 2/9] dt-bindings: net: lan9645x: add
 LAN9645X switch bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260702-dsa_lan9645x_switch_driver_base-v8-2-90228d8bba58@microchip.com>
References: <20260702-dsa_lan9645x_switch_driver_base-v8-0-90228d8bba58@microchip.com>
 <20260702-dsa_lan9645x_switch_driver_base-v8-2-90228d8bba58@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 06:46:35 +0000
Message-Id: <20260703064636.0D2CD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing MDIO bus definition for integrated PHYs in LAN9645X swit=
ch binding.
--

(Note: The format of this report is altered due to recitation restrictions.=
 Standard inline diff quoting has been omitted in favor of a free-form summ=
ary of the findings.)

commit ab7b03f9ab6454a9469ee1ad3b3543a10a033f6c
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>

dt-bindings: net: lan9645x: add LAN9645X switch bindings

This commit adds device tree binding schemas for the Microchip LAN9645X
multi-port Gigabit AVB/TSN Ethernet switch. It documents the compatible
strings, Ethernet ports, and provides an example configuration.

[Severity: Medium]
The binding description notes that the switch includes five integrated PHYs,
and the provided example references these PHYs using phy-handle properties
such as phy-handle =3D <&cuphy0>. However, the schema sets
unevaluatedProperties: false at the root level but does not define or inclu=
de
a reference for an mdio child node.

Will this cause device tree schema validation to reject valid configuration=
s?
If a device tree author correctly adds an mdio child node to represent the
internal bus for these integrated PHYs, the strict property evaluation will
reject it since the mdio property is neither defined in this file nor fully
evaluated by the included dsa.yaml schema. Should an mdio property definiti=
on
be added to the root properties list to allow describing the integrated PHY=
s?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-dsa_lan964=
5x_switch_driver_base-v8-0-90228d8bba58@microchip.com?part=3D2
