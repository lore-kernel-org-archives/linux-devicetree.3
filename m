Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF423264F2
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 19:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778268714; cv=none; b=KU/ap2XEvYrPdM371Ta6Kk7Xnx56URUpgFkVesXfZA1r5aJK/SRPh6kIf1wbzNIp7j60OYMtKTn8AR6ISjt+D2VXZTusrsmg+BSwLDf3TAEU7j8jo3UiLxRmE9fJXo42xX62aUF691LOvl43yRjuyxbIcN+DPBKJWtEXMXhfjUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778268714; c=relaxed/simple;
	bh=aGpX9J7nVnYMiRidthi5gCcU8OCi5wUaJY/TU7AQ0Ew=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=chk8QS6El3LvnsnwPqHZ4pxlJIpv774M61LToyDcgEAcVC/2u3FR76+lSbs2Mcm2fF8G6Fe0ELNpNyoB4krupvRGVDgXEFvdngl3qv1QZG3ollnGqeo3rW2lV1IOn+IU5ze5aUuwN6f4aFs74YEmdW5IUiO3f98FhdEdS8VQyc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ac5h2PWX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ac5h2PWX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63486C2BCB0;
	Fri,  8 May 2026 19:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778268714;
	bh=aGpX9J7nVnYMiRidthi5gCcU8OCi5wUaJY/TU7AQ0Ew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Ac5h2PWXyysEoCAaPfTiO90mP9NPmq50bT9Y2+BZpYEvNoXDgwFpgu2+u1gPgh9ej
	 e9BqBiHVqmIzRP5H+tke27mBNg271YTjROozFPEcclhItIatuHurOgHZh2pft5pLKa
	 62Q6FhuFQn8+0XAa+JDxYhVJ4Pq3GCnFXcEErbWCmYayQLCaEE1HUTAmRwaosk24yD
	 g7AWkF+chJg+gv+liKrMjOb5xpOEbeIZ5TRa2eahygzrf2Edp6JR+XrKzZPI/GPslk
	 99nEt0BJPccl6teHpxGFVqfK2cSqPfZX5Ys0zvquiHXy5h0OL7spt0rM82jWF1dole
	 og8Qcq+5hBL6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: kaanapali: Add camss node
Reply-To: sashiko@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260508-knp-camera-v1-1-a18e289163fd@oss.qualcomm.com>
References: <20260508-knp-camera-v1-1-a18e289163fd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 19:31:53 +0000
Message-Id: <20260508193154.63486C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit adds a new compatible string 'qcom,kaanapali-camss' with=
out providing the corresponding YAML device tree binding schema.
--

commit a3fc6582c63ecf6be414df632ff7d8a517115d29
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

arm64: dts: qcom: kaanapali: Add camss node

This commit adds the camss device tree node for the Kaanapali camera
subsystem, defining its registers, clocks, interrupts, interconnects,
and power domains.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index 7cc326aa1a1aa..9d8aee202797f 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -3138,6 +3138,207 @@ opp-202000000 {
>  			};
>  		};
> =20
> +		camss: isp@9253000 {
> +			compatible =3D "qcom,kaanapali-camss";

Is there a corresponding YAML device tree binding patch for this new
compatible string?

Without the binding schema for qcom,kaanapali-camss, dt_binding_check
cannot validate the hardware description. Should the schema be included
in this patch series to ensure the node properties can be verified?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-knp-camera=
-v1-0-a18e289163fd@oss.qualcomm.com?part=3D1
