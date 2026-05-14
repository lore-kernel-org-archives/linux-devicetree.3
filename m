Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1193F4121
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 04:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731494; cv=none; b=g8cN/gFyXq2gps+4p7pgV1qsHY+Jhpw5PseHcLEKjsd6mvWxjHcCPTKiUBkm8fteOnDp30uqcw99bDmM74KjNgotQwSCK7ej2/ry6MeG9n3Xv2Y7Z67OmV/lfIrq3UEvvUe94e0EE9MkcbpmC7cAkn8BMPpn/lt2iiMU5HsSOXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731494; c=relaxed/simple;
	bh=eASmCAop9+qLy4S/WoDeT7tXY6MAK+khj+C67SI2/OE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kgTAPJoKHTkLBkHKnF2Bv8O74bC7PcZcu0Jq2Om0CNaN/dxQr9VkNUUvQsIong+YzPiTindZhPOdNGRa0lbP/qUTSrXbVnFReVOPiTGwPI/Qv4Osau/rhHQQfRQvpEd6lAJXo+er83LRf9p31uvqhbyeaVgqHE6ak01bfN3VbPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sDD2DEBP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sDD2DEBP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6654C2BCB7;
	Thu, 14 May 2026 04:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778731494;
	bh=eASmCAop9+qLy4S/WoDeT7tXY6MAK+khj+C67SI2/OE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=sDD2DEBPkeF2fQ9ZhIiuffrmnoPBorInFm/UP04Y2kXS1bDy3YQyPsoUzmMa5hmOH
	 54JOO0UZS41FRFoFPpH4SMRVauud7UA62APpHTIm93ooQMnAiigyU2Xp/hjqkt975o
	 1NLHAASaeGr0zFJvkhKNwvABRy11TOiyhHtHx8dOaKl7VyN2efMmyFhDI7ih+sdGqP
	 Fy5Q39LxmMORdkiJ2Ju1UdgV4TEx7U6HMZPUgV/fbAHmsKCsV1H0Pa7bqH9Kg90blK
	 UNtTbANaNJJZ37+Ixv/R4nW6A64yuqLrlZdEzkWgqBNrTYN3AnO+ME6wgViyKMbeBH
	 IPhnzbgbSLkpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260513-eliza-adsp-usb-v4-3-839936e89aca@oss.qualcomm.com>
References: <20260513-eliza-adsp-usb-v4-3-839936e89aca@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 04:04:53 +0000
Message-Id: <20260514040453.D6654C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The compatible string `qcom,eliza-pmic-glink` is used without being=
 documented in the binding schema.
--

commit 9f076cccb73f2dcb88a58f126b6e3528a73fc2ba
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: eliza-mtp: Enable USB and ADSP support

This commit enables USB and ADSP support for the Eliza MTP. It describes
the USB port, the eUSB2 repeater provided by the PM7550BA PMIC, and the
ADSP remoteproc firmware.

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

Is the "qcom,eliza-pmic-glink" string documented in the binding schema?

Using a new compatible string here without adding it to the corresponding
binding document usually causes make dtbs_check to report schema
validation warnings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-eliza-adsp=
-usb-v4-0-839936e89aca@oss.qualcomm.com?part=3D3
