Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106030;
	b=RMUjdFu4Mxy7pfruQOdkUN4Sbe9fi8SBW+DzxghHLAtbZxeYKBpa1RRtUvNq7qpJbJij
	 EcPw2oXmB2qtY6HePa6kzoJfh661DnE/sY7joIV4Exks8XHBOVFOZfN95vxmmrezSnHau
	 1a4f7PAX85DLPLYMb4MDHW0kMfrjqmP7UM0uQYtPlgIQwss5QIHBhBy4Vi5Y87F/1ddKj
	 y2frSwbvyXKHjj0/GeLchUvXloc8U8CLCm9J/7zVWb/XVYdcZdY0b8s41hKIBZkN8VZFe
	 bjJJ4kPw27q4FIxN3gfHh3HX+FaiL3dtWTy1OJZg4/lkaHOgnT1jxxkoiGpOfOpqaCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106030;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RPGlBcLzs+zhPePjUUY7ODZ/rCGIIg4LARWFNOL115g=;
	b=CMCWCFcydGvIcYFKSLJSBcAR43PW6rOqSZLmDddPS00UoZgLkmmGQzg9E/HBGUwvH1NQ
	 R6PKp0OFNAeUB2j1OuakPe0KYeoBb7t0iNVJIISoYBhRp7lDf+t/mkMvfEM8DnycLBkVn
	 LQSzDQrvBBNJKVbAvTRqfz2Ljig2prueUzAeQ2wR1t5bpN9s/MhWJJw9pMb5qTpHNqSvG
	 2eWkVkwNXN63WcxXGrBizSZkcTWp8Hnf/3yC9mYXIAJnqTpANkqu4SudbaNwTgrghztQE
	 qNKnaImz/sAzzg3la+WPzlHmGj87edn9LglOqtJe2oszhXNPI+wAm61G/B2usomOf8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W94dZSFi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75366606A325
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W94dZSFi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC8C81F000C5;
	Thu, 19 Nov 2026 16:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795106030;
	bh=RPGlBcLzs+zhPePjUUY7ODZ/rCGIIg4LARWFNOL115g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W94dZSFipzen+msAvlzka6tqrfux0ncuSz1MLm4jixLF4/ndMYtSX/gXdEPUKmhO+
	 8h/Mdn10yN3c8Ed3bVihdaKhbvmrRieAPztHYAmna+dfKm1mgU8ygrI0Vn9gYeIkkH
	 zEWpyGaGPDpwL9cIT7zvgl0LID0RWmOdOVGNyiSXmsklNDojhVDWM3EAulhGLRiETy
	 Zzh3eG9fGs4zvemJdOQXqBUF2Ok0Z0gIkJlUBEQnKaYudr1sS2Et1tbN2OzxTWwyi4
	 C4LUFr/UyOTE6LcLV40w19U2BoVH4rnmCjvRH7p8L4WiR78qazCmvanxbMfKJw5xxu
	 fJAjg/rVdB/RQ==
Message-ID: <sashiko-outbox-223530@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra: Enable CDSP & Modem
 cooling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dipa Ramesh Mantre" <dipa.mantre@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119-b4-shikra_qmi_tmd-v2-1-87089ab2acbe@oss.qualcomm.com>
References: <20261119-b4-shikra_qmi_tmd-v2-1-87089ab2acbe@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 16:33:49 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] arm64: dts: qcom: shikra: missing qcom,pas.h header and
  QCOM_TMD_* macros
- [Low] arm64: dts: qcom: shikra: undocumented #cooling-cells on PAS
  remoteproc nodes
--

commit 8571cc2f99e428cc1ffc7db9c0a71c46f4f27ba0
Author: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>

arm64: dts: qcom: shikra: Enable CDSP & Modem cooling

This commit configures passive thermal trip points and QMI TMD cooling maps
for the CDSP and modem remoteproc nodes on Qualcomm Shikra.

Link: https://lore.kernel.org/r/20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@o=
ss.qualcomm.com

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index c1f06f692f664..6e5b1aa376692 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> +#include <dt-bindings/thermal/qcom,pas.h>
>  #include <dt-bindings/interconnect/qcom,rpm-icc.h>
>  #include <dt-bindings/interconnect/qcom,shikra.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>

[Severity: Low]
Does this break DTB compilation for Shikra?  include/dt-bindings/thermal/qc=
om,pas.h
does not exist in the tree, and QCOM_TMD_CDSP_SW, QCOM_TMD_PA, and
QCOM_TMD_MODEM used in the cooling-maps below are undefined.

> @@ -2007,6 +2008,8 @@ remoteproc_mpss: remoteproc@6080000 {
>  			qcom,smem-states =3D <&modem_smp2p_out 0>;
>  			qcom,smem-state-names =3D "stop";
> =20
> +			#cooling-cells =3D <3>;
> +
>  			status =3D "disabled";
> =20
>  			glink-edge {
> @@ -2047,6 +2050,8 @@ remoteproc_cdsp: remoteproc@b300000 {
>  			qcom,smem-states =3D <&cdsp_smp2p_out 0>;
>  			qcom,smem-state-names =3D "stop";
> =20
> +			#cooling-cells =3D <3>;

[Severity: Low]
Does adding #cooling-cells to remoteproc_mpss and remoteproc_cdsp fail
dtbs_check?  Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.y=
aml
and Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml do not
define #cooling-cells and set unevaluatedProperties: false.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-b4-shikra_=
qmi_tmd-v2-1-87089ab2acbe@oss.qualcomm.com?part=3D1
