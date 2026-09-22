Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6019A515979
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073878; cv=none; b=DAktFk+0W1p7OB2F8GmdnlK3lzeO6v9I1ozTMV/x5+0gdEZMMcdgwYUQp2XHC72reXI5ohAzcg+xoS5Q25ZaBsm9O+gfenQcgSY6vhmut7OjXQnMaxpbjIhem4RSAXRsVuD308wWDiIclX95RWq7R/+TdHbWh5dLWqF7+Ifausg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073878; c=relaxed/simple;
	bh=91FpfD5ux4o29ybKYtgxcpNziqSHbnI7bYjIapS35CY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aNxGEL+a1YrT/VhC3M3h/ZXdSJjS00NStBxyMm3F+jWKPh4ZNpOxuti/O/CXCx/egRNnnOsb3QNwtUo0u9Cdn+ddGaXlG+O5UXfTXp+U7eEY35bTUh6dEeF+5sRNx0uOAsoblAuIRsNyKBGdaX7x2NCs9VKB6oH+krvy3KFDcTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jPBKxsDR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jPBKxsDR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9171F000FF;
	Tue, 22 Sep 2026 10:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790073875;
	bh=4l8x8CTy4XuM/q3X7N5hXRy0/ThJcPXM+dH0+o15Wh8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jPBKxsDRWELEujddzJkpTR6VhAOnt4qDzoXQ8b6c7hFz3JvdrFr+mEjoLwxLEEOFT
	 G+xinOjwNr3XEsNqBNh9ubOJF7mDLw7ynMZtQ+qXHbWUwvNwHUaaYuEqBPdvaG16Aq
	 g+ve0kFFX7Q05retX/zdah59dCE4w5omm0JXLAvEIKqU121DG0AmtqpAtaGw2/KneF
	 0sYKguRic4A7G1Ne+kb74feBfDJvunVkIzPl71fnXxSga9x5VPXeA/PlWpUTs9Fa3a
	 HwdOtzsCeNjcgckaoS9vF4n30aiNA2hHmwU3I3GHg48FT9g9uYTLvo62rtTH66C231
	 T4je/Wr3I8Fiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: Add CoreSight nodes for
 APSS debug block
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-4-c2a8c3225a2e@oss.qualcomm.com>
References: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
 <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-4-c2a8c3225a2e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 10:44:34 +0000
Message-Id: <20260922104435.0E9171F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: empty port node left after endpoint deletion triggers dtbs_che=
ck warning
--

commit b9b7f9e54234f4ce9f0f624d710b7719ad97a035
Author: Jie Gan <jie.gan@oss.qualcomm.com>

arm64: dts: qcom: glymur: Add CoreSight nodes for APSS debug block

This patch adds CoreSight devices such as ETM, replicator, funnel, and
TMC ETF to the APSS debug block on Glymur. It also deletes the nodes
corresponding to cluster 2 on Mahua, since that platform lacks the third
CPU cluster.

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/q=
com/glymur.dtsi
> index de7c395d9c353..049bebbb80f92 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
[ ... ]
> @@ -7625,6 +7939,51 @@ pcie_rscc_tpda_out: endpoint {
>  			};
>  		};
> =20
> +		funnel@12080000 {
> +			compatible =3D "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg =3D <0x0 0x12080000 0x0 0x1000>;
> +
> +			clocks =3D <&aoss_qmp>;
> +			clock-names =3D "apb_pclk";
> +
> +			in-ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@0 {
> +					reg =3D <0>;
> +
> +					apss_funnel_in0: endpoint {
> +						remote-endpoint =3D <&ncc0_etf_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg =3D <1>;
> +
> +					apss_funnel_in1: endpoint {
> +						remote-endpoint =3D <&ncc1_etf_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg =3D <2>;
> +
> +					apss_funnel_in2: endpoint {
> +						remote-endpoint =3D <&ncc2_etf_out>;
> +					};
> +				};
> +			};
[ ... ]
> diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qc=
om/mahua.dtsi
> index a59c5ed7b48e7..77a456fb0772b 100644
> --- a/arch/arm64/boot/dts/qcom/mahua.dtsi
> +++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
> @@ -6,8 +6,18 @@
>  /* Mahua is heavily based on Glymur, with some meaningful differences */
>  #include "glymur.dtsi"
> =20
> +/delete-node/ &apss_funnel_in2;

[Severity: Low]
Does this deletion of the endpoint leave the parent port@2 node empty?

The device tree schema for graph ports strictly requires a port node to
contain at least one endpoint child. Leaving the port node empty violates
this schema and causes a dtbs_check validation regression.=20

Is there a way to delete the entire parent port node instead of just the
endpoint, to avoid leaving an empty port@2 behind in the device tree?

>  /delete-node/ &bwmon_cluster2;
> +/delete-node/ &cluster2_etf;
> +/delete-node/ &cluster2_funnel_l1;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-add-etm-de=
vices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com?part=
=3D4
