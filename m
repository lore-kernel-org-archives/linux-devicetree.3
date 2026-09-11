Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27FC443E4D
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789110224; cv=none; b=UR5PqQmnQykBGKIjlh7erNSc35q3mx/zUJUc3X9HBvA9uxPVMl8hAPl24uFzh/4ehM0SkGhKhrZgRIODfibpjHGc1jtxuNF6cX88J1ZFeim5P2lB7czcJc0ztQsL+DE9PDMHsukMz8JASw9sjJJnj0VJ+JTgL0q2Y3tL3u8oTJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789110224; c=relaxed/simple;
	bh=VoucdhwPzYfj0mvumFVHeUEHYHMJVmOfrkKbiUakuZs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dQPiiLnGnyX6nZqeLPzL7cUDmEn91Mux0JnLwzZHtGdhWbZilLkLTKE/+UyKC1zuHy08h2oCtgGhlhvNQ69WfbpXtI7qb76qJCKw2g6RGtMCciaLKEDuI3DWpmdWrVI2hw8lQuJizd8jYhjeIDsufAS7cunf6QvHVv7Vf8mZStY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dIrXlFbI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dIrXlFbI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B8B81F000FF;
	Fri, 11 Sep 2026 07:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789110216;
	bh=/Uow//m9Oww0umnXVRnIai6FIChk4OGCHlEbFtXCkv0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dIrXlFbIthz5E3ggHfDLtDN1uVEQS0/FlkKMZ6eO134QxhHllF8LEkEI3Bh6KPNud
	 OEAbtW+RlqK0wQNwP96PuClQJFjXBN4IyNE/ok2Brt4M6246agspafDQ0j0XwEWiwT
	 54AjGnylhK49JgYMwBlSU8FT01BxKxq8nHY62ODljPKPPzzLkdDmyN13oSFljYIDUd
	 85HF6U/XzCj3AvOzFFpRmGOc4iqXmoTykYI0FAoOYBIqRt2VzrJEpmHxyaNM56BC17
	 Wif0kTKGcOuhgwdmgw2noEgnGFdhJU/4on8M0v4LB6oC9AZ1uAHOZ3IXonK+TkU7zg
	 DW0mCRFCXBqUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/8] arm64: dts: qcom: lemans: Add t-power-on-us
 property for PCIe root ports
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260911-t_pwr_on-v1-2-c9eee197d082@oss.qualcomm.com>
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
 <20260911-t_pwr_on-v1-2-c9eee197d082@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 07:03:35 +0000
Message-Id: <20260911070336.6B8B81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Logic Error / Dead Code: The newly added `t-power-on-us` property =
is completely ignored
- [Low] Missing DT Binding Documentation
--

commit 821321f53e293af9b1a675f69406aacca48b199d
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: lemans: Add t-power-on-us property for PCIe root ports

This commit attempts to fix improper L1.2 exit behavior by programming the
T_POWER_ON value. It adds the t-power-on-us property to the PCIe root port
nodes in the lemans device tree.

> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 695eae1b72569..615a9bfda2377 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -2770,6 +2770,8 @@ pcieport0: pcie@0 {
>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
>  				ranges;
> +
> +				t-power-on-us =3D <80>;

[Severity: Low]
Is this missing a corresponding update to the device tree binding
documentation? This introduces the t-power-on-us property without
documenting it in any Documentation/devicetree/bindings/ YAML file, which
will cause dtbs_check to fail.

[Severity: High]
Will this property actually be parsed by the driver as structured?

Since this child node lacks a phys property, devm_of_phy_get() will return
-ENODEV when qcom_pcie_parse_port() iterates over child nodes to parse the
port properties.

The fallback path, qcom_pcie_parse_legacy_binding(), successfully reads
the PHY from the parent node, but it appears to never parse the new
t-power-on-us property.

Does this cause the value to be completely ignored during device probe,
preventing the T_POWER_ON value from being programmed into hardware?

>  			};
>  		};
> =20
> @@ -2943,6 +2945,8 @@ pcie@0 {
>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
>  				ranges;
> +
> +				t-power-on-us =3D <80>;

[Severity: High]
Does this second child node also suffer from the same parsing fallback
issue? Without a phys property on this node, the driver will likely
ignore the new t-power-on-us property here as well.

>  			};
>  		};
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-t_pwr_on-v=
1-0-c9eee197d082@oss.qualcomm.com?part=3D2
