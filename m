Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655773955F1
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 07:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974026; cv=none; b=sSBUHyTe/RBzaJIJpKwEbUhF1SL9C+330ikzz47PQw791xddW6/UNYQdldm2hvczuO3lQH1jmA3ilug4KbfJtnkQQAjH1m8+YbHxI1W1DbDeKnsJvutMEE1NX2vE0vlo+Esifmeu0WK05xzBb2UhE6BS8D4V6VJgrtUuy+BOD+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974026; c=relaxed/simple;
	bh=PCnr0xBQj+t/0xaG7BS45LYsMUGFPhtl2ckLHlVwpXc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Bm3QLh6d1Tx2eXJQGHSQ4uy+27EQhqAFyT1yzDWdclh49sIw8MGyft153M2risVMZcngD1nzlCYlVRFxr4DAVnQ4s6cRhnJ9HeJGPipFl3Oio4iIYKm9CC8k2E7k7t44bBlXC9mpMHRL5Z1xn9JPUEmj7ZRI8oMiF3xySPPTQ8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CLTPK6Tk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CLTPK6Tk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D851F000FF;
	Mon, 21 Sep 2026 07:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789974016;
	bh=Q62E4u71JnDdaXdfTPLWEfkpYpQplkqlR+yWj5AU/Jw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CLTPK6TkkVTHFnEnM+KbWKnuze5hyz3SRXTbUveyyXyxQ+gH4MaTugQ97K/X7TXc/
	 i1LMLihzUXj/eErDdj2kdltE5B25pf8+8WpIND2ph9HO0OtXNqyziTB8IdYNDFEjiV
	 QNimdkXkJMC9zBDhlBHDR/rTx3tHZdtg2+IG1SvDxKYqtK+c3NWylHk2SgR2jp2NoB
	 EATLqs5MB+zVbDTwZ0zDwIeaJ5aD8SojnSYKBJ1TtaS2LvG7bvU0I6gl0+NtpCAhKB
	 mm7/DcPVnl1dkpXOYrdwLO7ylgpYgnjq7j9rXzjYkbSlCwVV+6FxX6KfPl6DPJaNAk
	 opefQoZZdIRcQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: add few more SOC IDs
 for IPQ5210 family
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260921-ipq52xx_new_ids-v1-1-63d68a11bbff@oss.qualcomm.com>
References: <20260921-ipq52xx_new_ids-v1-0-63d68a11bbff@oss.qualcomm.com>
 <20260921-ipq52xx_new_ids-v1-1-63d68a11bbff@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 07:00:15 +0000
Message-Id: <20260921070015.D0D851F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] cpufreq: qcom: kernel panic on boot due to missing SoC IDs in swit=
ch case
--

commit 0b99a8e575edc333a621cdaa6e2499570c73a001
Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

dt-bindings: arm: qcom,ids: add few more SOC IDs for IPQ5210 family

QCF3211 and IPQ5211 are the new SoCs based on the IPQ5210 family. Add
the SoC IDs for the same.

> diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm=
/qcom,ids.h
> index b63e4a0b8e545..f251d4c75612c 100644
> --- a/include/dt-bindings/arm/qcom,ids.h
> +++ b/include/dt-bindings/arm/qcom,ids.h
> @@ -317,6 +317,8 @@
>  #define QCOM_ID_IPQ9630			779
>  #define QCOM_ID_IPQ9640			780
>  #define QCOM_ID_IPQ9670			781
> +#define QCOM_ID_QCF3211			801
> +#define QCOM_ID_IPQ5211			802

[Severity: High]
Will adding these new SoC IDs cause a kernel panic during boot when using t=
he
qcom-cpufreq-nvmem driver?

Because these new SoCs are based on the IPQ5210 family, they will likely ma=
tch
the fallback compatible string in the device tree and load the driver.

During probe, the driver reads the actual SoC ID from SMEM, but these new I=
Ds
are currently missing from the switch statement:

drivers/cpufreq/qcom-cpufreq-nvmem.c:qcom_cpufreq_kryo_name_version() {
    ...
	ret =3D qcom_smem_get_soc_id(&msm_id);
    ...
	switch (msm_id) {
    ...
	case QCOM_ID_IPQ5200:
	case QCOM_ID_IPQ5210:
	case QCOM_ID_QCF2200:
	case QCOM_ID_QCF3200:
	case QCOM_ID_QCF3210:
		drv->versions =3D (*speedbin =3D=3D 0xcd) ? BIT(1) : BIT(0);
		break;
    ...
	default:
		BUG();
		break;
	}
    ...
}

Because QCOM_ID_QCF3211 and QCOM_ID_IPQ5211 are unhandled, execution will f=
all
through to the default case, triggering an unconditional BUG() and bringing
down the system during boot.

Should these new IDs be added to the IPQ5210 case block in the driver to
prevent the crash?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-ipq52xx_ne=
w_ids-v1-0-63d68a11bbff@oss.qualcomm.com?part=3D1
