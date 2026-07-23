Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FFA46D0A7
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810987; cv=none; b=uwbjicHMPuzNX985pXlGlom75fHAXpF1b+Vu/EPk2p/wwywDyPm2RmclafkD5Ma2vqvtiKIr6WZpAMKmWlK+LKLbdrQPK1Lqt0pYpT0GnM9N99b9qdPBhXo+a29stVG2FOPdTw1a6GRjX5TmmoE6406PwSQgfyDTDpT1etaE2RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810987; c=relaxed/simple;
	bh=6VK3x4hFmMoTUWy09q47nqRJgYiBvndTtyd84/k3ov4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SmUI6HOHmIqmJt2B1+kfMzssRe7oiDPxifTxxCFv2qVhdrqvdsk0kfRi55Pny8XLO2Dt/F/2c31eP9WYZj7fFswFzLVzpXH9zUT5WXXYQApNO/ak6mRb80Fn0/VRgT8g39Zdo9u6QpaerfDTZaRXfkWeuReYfJJdco5qMv6ONrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bvRUy3ql; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bvRUy3ql"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25CB1F000E9;
	Thu, 23 Jul 2026 12:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784810986;
	bh=l6ZkVJ5Ht3hhnXR29U55c6Y8/mPj+RuY6hFsjEu9sbU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bvRUy3qlL/UYRe4V1XLGAgdNm2Wq6sAhne8umP5q+8HwF3qyZFiRYljEwhsZ38RWy
	 xvz1X462SAmJ4LzuOdCllGeETfrgtqIAFl77Bpa/YGjmPPFtFn18B2gG5wtoz6BEF/
	 gCN3A4k2RDF3/s2S+VDsllQSW5pOO2oiBWJlCsh/El5Ch6OFmeqZsajFY3dkgntZNE
	 8ta6wmsRQ3Jp9FFmxMZv3OJnJ3nY3nfsKE4AIy5h7GcMcgGsK6ScrKs0eUvIcc62An
	 5kzTrnBTVobf78lN6doEKnu2YNzpa+l5nr8oTtzvec38VHcBwOjvN/xPXvc+jTXghD
	 KHOZs9wwG9yrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: rb3gen2: add Industrial BT UART
 overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rahul Samana" <rahul.samana@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260723-rb3-industrial-bt-uart-v1-3-3c8e580c09d1@oss.qualcomm.com>
References: <20260723-rb3-industrial-bt-uart-v1-0-3c8e580c09d1@oss.qualcomm.com>
 <20260723-rb3-industrial-bt-uart-v1-3-3c8e580c09d1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 12:49:43 +0000
Message-Id: <20260723124945.F25CB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Device Tree Overlay attempts to use `/delete-property/` which is=
 not supported, resulting in schema validation errors.
--

--- Patch [3]: [PATCH 3/3] arm64: dts: qcom: rb3gen2: add Industrial BT UAR=
T overlay ---
commit 28aeca4684147ad8ef66aae33d88bd048694447b
Author: Rahul Samana <rahul.samana@oss.qualcomm.com>

arm64: dts: qcom: rb3gen2: add Industrial BT UART overlay

Add an overlay for the RB3 Gen 2 Industrial mezzanine variant that routes
QCC2072 Bluetooth over UART4 and models the M.2 E-key connector graph
endpoints for PCIe and UART. The overlay also disables the on-board WCN6750
PMU and UART7 path so the M.2 QCC2072 Bluetooth controller can be used inst=
ead.

> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanin=
e-bt-uart.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzan=
ine-bt-uart.dtso
> new file mode 100644
> index 0000000000000..06560df0a7192
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-bt-ua=
rt.dtso
[ ... ]
> +&uart4 {
> +	status =3D "okay";
> +	/delete-property/ interrupts;
> +	interrupts-extended =3D <&intc GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&tlmm 19 IRQ_TYPE_EDGE_FALLING>;

[Severity: Medium]
Does this /delete-property/ directive get ignored by the device tree compil=
er
since it is inside an overlay file?

Because the FDT overlay format lacks a standard mechanism for property
deletions, dtc silently drops this directive when compiling the overlay.

As a result, both the original interrupts property and the new
interrupts-extended property will coexist in the uart4 node when the
overlay is applied.=20

Does this violate the device tree schema by having both interrupt properties
and cause validation errors during dtbs_check?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-rb3-indust=
rial-bt-uart-v1-0-3c8e580c09d1@oss.qualcomm.com?part=3D3
