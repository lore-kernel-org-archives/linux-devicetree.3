Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CC838BF72
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 20:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778789894; cv=none; b=EqgGPr8t7ye1f/PKLKDwmO9tBX2UR332b8Ozt8AEs2PWKicXaKjJ9Xfo1c32gvWAGOmZNZnHqdpjezJaI24NG58yKRcE64hnwEq2u5ISBfIBzMCArrYUEcg+iKKxl3uSHOz8+TbUjBlrf/mDfrvCtOZmAyWNTc9Retw9H71ALs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778789894; c=relaxed/simple;
	bh=eeG9fQkvwPjJRL5JSBJO5rD/9qhQX1xIiE7dWKBbyuk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FZAu3itUveDFns31xder7F7kt6AbgwLT7VseyWHsnxZ4ssUmjXfq48jFaNdUtKDg0MOpUn2Uy6p/iuPWbp4uAkMOIlDicL6A/4XrF2V3GjTWHj1HSTXYB8Ovy3yOmV+x7AthZBS5qgZpitrRaXZB6BiGN3BD6oB6kK+LyYSsWyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wv4eVXqr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wv4eVXqr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AFDAC2BCB3;
	Thu, 14 May 2026 20:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778789893;
	bh=eeG9fQkvwPjJRL5JSBJO5rD/9qhQX1xIiE7dWKBbyuk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Wv4eVXqrUcF11C7IRJ35NwjPwE7G7y8u5A77IRO1nidG0gl07QF4s7utddKFeoVlq
	 f3nX/RpcM83Yp/QPyrKD5izBqGOOAZb+cgp0glOAgvl2EWTWIUTle0g/18RnZ9bu6C
	 wyFeElHDF+kupMwmaNmoLtWu3ByAiL7dOTuMuMJrIzeHFUfwxroOOiJKRKSfjxYCa3
	 pFPr1bNMXEVLBEFE7swRU5EtkermBMvrxuLb9JCFB8wI2v8mwvU7fx6vVvZRdW7C8W
	 gAWbk/kqubhuaawKxqKQVr/bhz2TKreg6NPltAT2Cvz5PqFaRmkkt2sTEJ7ywtWRoM
	 zQ/8jp2DMt09w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260514-eliza-adsp-usb-v5-3-a21056ffd892@oss.qualcomm.com>
References: <20260514-eliza-adsp-usb-v5-3-a21056ffd892@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 20:18:13 +0000
Message-Id: <20260514201813.9AFDAC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The compatible string 'qcom,eliza-pmic-glink' is used in the device=
 tree but is not documented in the YAML bindings.
--

commit b9c08b3ae54cc2b9b02f4c789a987a560f3a9531
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: eliza-mtp: Enable USB and ADSP support

This commit enables USB and ADSP support for the Eliza MTP by describing the
USB Type-C port and eUSB2 repeater. It also enables the USB controller, PHY=
s,
and the ADSP remoteproc.

> diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts=
/qcom/eliza-mtp.dts
> index 90f629800cb02..3e41c95edb28f 100644
> --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts

[ ... ]

> @@ -54,6 +57,44 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
>  		};
>  	};
> =20
> +	pmic-glink {
> +		compatible =3D "qcom,eliza-pmic-glink",
> +			     "qcom,sm8550-pmic-glink",
> +			     "qcom,pmic-glink";

Is the "qcom,eliza-pmic-glink" compatible string documented in the YAML
bindings?

It appears to be missing from the
Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml schema.
Will this cause validation to fail when running dtbs_check?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-eliza-adsp=
-usb-v5-0-a21056ffd892@oss.qualcomm.com?part=3D3
