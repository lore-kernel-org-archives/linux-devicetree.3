Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5237741A51B
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109909; cv=none; b=aSr/avvya469G3NwIL+BLJ0tonaFBVKT2g59omBpsJj2mVLkJRH/bDig85iGUPGvQwgy+1fXHibv2dVtuiqw5hiFQDh8VhSPSwsym+gCCWMXtA1yGR7bNNWub9g17NLrEZyVSSs4veIphO/g8A6Jb7YjErRYgPgEmfjvq3xbf54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109909; c=relaxed/simple;
	bh=Cb3n3Pegb6XDHuOXmfoDfYW7aCZ1jUtoMEzJPp2lR64=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SmFQ3CKJ42S+MzlUpcyDC+/kiqT/bzJwPec/haBuInnYZgZPyrHyXRNSwTdAr8I6vXBucnWr679Oc3nAaOVuml2j+FF6ivtPYLYfptP+jFXnGMBoZpsqC4bjSrNY3ZT460av04DWLFlI6RbvF9LTcUquq64qfsOo2sd+Ebd8uD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZKJ1cmvE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZKJ1cmvE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2181F000FF;
	Fri, 11 Sep 2026 06:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789109897;
	bh=Sk3pPIHyejq2tr0yImzf2t7EPrqVv2i7M5Im0GDzINw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZKJ1cmvEnFDRe67ZNl8n4+o3GAZmOm7kbfnpFfPG9YB3E40A5A2lrnnRPUfetUVjw
	 yv0ujrejEwxNVPCN4WSDqHAVpSLyxHZz4qhKpZmwCLj3zCqfwPyeFLZqVmBOjiQ3qN
	 Z+BOKuTnT7Jya9kUYZueloYvVSy8Gz2d0hrGYRRNrItvmwLsr/xb2Wa5Bez5jWsUpC
	 gjJSfykX8cOcl43i5gOFcJLUTKJpHk94/HHZ4OYLJDBvd/0fzN2bURjQdNNyt3ZBsH
	 +aFSiaXFWTD37MeRcET6XqslCrnctJZuoGVax1d9DLh74tuP8VqQlHbz6AeNQ8hLMC
	 jeLqBWKS+0Yfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/8] arm64: dts: qcom: sm8750: Add t-power-on-us
 property for PCIe root port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260911-t_pwr_on-v1-7-c9eee197d082@oss.qualcomm.com>
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
 <20260911-t_pwr_on-v1-7-c9eee197d082@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 06:58:17 +0000
Message-Id: <20260911065817.AA2181F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The property 't-power-on-us' is introduced in the device tree witho=
ut a corresponding update to the device tree binding schema.
--

commit 0f66318dcdfeebf212674b31a30fbfa300a4c149
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: sm8750: Add t-power-on-us property for PCIe root port

This commit adds the t-power-on-us property to the PCIe root port on the
sm8750 platform. This ensures T_POWER_ON is correctly programmed during host
initialization, preventing improper L1.2 exit behavior.

> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/q=
com/sm8750.dtsi
> index dd738d13df8e0..bb57385678f4d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -5577,6 +5577,8 @@ pcieport0: pcie@0 {
>  				#size-cells =3D <2>;
>  				ranges;
>  				phys =3D <&pcie0_phy>;
> +
> +				t-power-on-us =3D <80>;

[Severity: Low]
Does this new property cause make dtbs_check to emit schema validation
warnings? It appears t-power-on-us is being introduced here in pcieport0
without a corresponding update to the device tree binding schema.

>  			};
>  		};
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-t_pwr_on-v=
1-0-c9eee197d082@oss.qualcomm.com?part=3D7
