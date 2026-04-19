Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6342B30E834
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 22:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776638309; cv=none; b=C5jqWhgv1NJXo+cCM1nne84+EY97z8f8umCRuJS4sCsGJnJKELv4tDBPScLWaIrSqln2u7R/aY0MpMMonOvyz9LoUrWoqgR7KXqKTbjcJPDaVmmG7xtBVeGpsxG4iyH1KGAua77OGYj89bh2xi+hMWdqqldjiaEGFv9lD45jxU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776638309; c=relaxed/simple;
	bh=FUdqs8G4xwhD/VXXAjrPpZWDZq3wYXxHJeq5QFisxbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nbbhzJ+V0Zqmc2C4J16xCAG8pfvlGFXPUy9d2rNdEhEGBp0O7G0Xf+bCbzx/cl6ojPg31OCCuAbMjxxJE4pP3zV/gVk4X+GqkT5TxVVbsd0SCQ5Oe15BFEgc1+nBp+tk0GIb62Z9hrcc43Zkk7+zFwP0xyUziYLac610ddBZgk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p2XFwuer; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p2XFwuer"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d9e22176a7so1351500a34.1
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 15:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776638306; x=1777243106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yeLIlLS6xhhKIOicu0WwjZofN4fneA1R4+99jdOi6J8=;
        b=p2XFwuerkqqQtesQvOPuW5A/cqIFi0kzEjEtuZdO0zqevgOVjO2JJ7mN70pzKnpeM6
         E6OysWeXhiHUAFIQK+3C1j7mysDk5hTO3YbRqDRjr3uybiHI830ldxgAzcirix2Wqc6Z
         uD9QpZdnTkaO9d137jzl7Bnrl3XRQPPi71jVcKo23LR3gYUvJ7yaBgRAZyAAQRZZk47b
         gFgXV8AIEpDdPvL/JCwkbP1lNzfFV6waLfUg4sW7f5224qO1z5JCyU1N6Em/VvdvDb3a
         RhejPa0qe9W6BBNLc9JyNKGWxuhGdyU4RDjfQv5tadxFmV+t1jm/5uTmo2jDxBwl/mgy
         /XUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776638306; x=1777243106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yeLIlLS6xhhKIOicu0WwjZofN4fneA1R4+99jdOi6J8=;
        b=s5UKPfSfii/lEg1X6KkCc4LPmadRqoFAhgGiFd9fqOrWOK0nXqIKbMiq5nzPSfrutx
         q7rNMCJlLn48AYoS9RpC/Uy7ikx/JSEJTBbE2RLtlcIKnAEOgIx95XoApbXQaFQOOaC/
         4iP0GSbRv1+78AcjTW+mHSanntU53L57vVyKSPwXybFqqll0qRbHrPJW1LkZq/GjEXlB
         90npWdwj/9jibKSG4jSWZWCMZw2p52yC36KLjgSuV/P0p12xa4QVZTR72ZzB41kDx8Iu
         uaX7tZRIGSvCmBld3pjzkmyA8SbqD5v7gc21oFiybZzp6qCLpEmWU0q6AZWOs0N1K6LO
         alKg==
X-Forwarded-Encrypted: i=1; AFNElJ+GYt1rXUCrZUJ7W6ldCM5IFnowNGlKjMWvaFcuP6HX/90RmPDc1gztcg7dzyZ4mZeAsIcNtgSuKzHz@vger.kernel.org
X-Gm-Message-State: AOJu0YzP+ZTpwWbTQuEL7VnFCiSjMRFgGhSJ0n8lLU2VKJEBb+QqbAcS
	E9AyxhRu3Sk4cApzbAFYc8TikQf5umlCpyfXfoi7F7eo+2UAfpOD7jgz
X-Gm-Gg: AeBDiev24lWtPGtNpnVTPLXJ37WCw0HpjepLRPOvSCwJ3/Cwx4X3MVawZfmzKFOMz9z
	PAl8nkAwfZOEuMq5OamLMqKoyLiX0Kq2F+6Qw6OV4PPqtIjNv6DjX9NbVDf4Q5vbo4CjEeeuF3p
	ykJks+8QrOq89ERi5AuOXDm2Sd3r2d+NiVBIf0jDvfuwarsfvjxIbtdPWrn4opOmAuE7Aal0oUX
	qcViiEwopZQsNXTtQydH75JgET5cYe3IflCJxrp8m6n41IAFw8UlTWbn/pinl0dzL/4SUb+9vZ1
	5Hsq76i64lEnmsyNTk50aGK05NdBb7XosFFAdoJWY0dCKSmEcoIRmGOxX/sNzX6SdHaHybQzOyu
	xSYHGE931GA0T89jFx3j8oeoLh28/2lYWf7HJJN9BhLIbkVkPV9c7ym2s6pFAZox9V/zAMxsElS
	p8Ry6biMl487aKsBnkDU2Xd8gJWWvBTnSIU5Cf9KPEORsHyW5Dgv7729ZIUUGoBblbmI6n1Q7yP
	K4PbbCg9WgrcNIKNShPTmJPPMhyzzJ0lPW204yJUbGxCi/akcBipUaM10Q=
X-Received: by 2002:a05:6830:411a:b0:7d7:d2e4:6373 with SMTP id 46e09a7af769-7dc951fb364mr7104813a34.20.1776638306240;
        Sun, 19 Apr 2026 15:38:26 -0700 (PDT)
Received: from nukework.gtech (c-98-34-199-138.hsd1.tx.comcast.net. [98.34.199.138])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc975b057bsm7891589a34.20.2026.04.19.15.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 15:38:25 -0700 (PDT)
From: "Alex G." <mr.nuke.me@gmail.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: sumit.garg@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject:
 Re: [PATCH v4 1/4] arm64: dts: qcom: ipq9574: Add gpio details for eMMC
Date: Sun, 19 Apr 2026 17:38:24 -0500
Message-ID: <3675281.vFx2qVVIhK@nukework.gtech>
In-Reply-To: <20260202073322.259534-2-varadarajan.narayanan@oss.qualcomm.com>
References:
 <20260202073322.259534-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260202073322.259534-2-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday, February 2, 2026 1:33:19=E2=80=AFAM Central Daylight Time Varada=
rajan=20
Narayanan wrote:

Hi Varadarajan,

> The RDP433 has NAND and eMMC variants. Presently, only NAND variant is
> supported. To enable support for eMMC variant, add the relevant GPIO
> related information.
>=20
> Do not enable NAND by default here. Enable it in board specific DTS.
>=20

This commit references sdc_default_state in the .dtsi file, without definin=
g it.=20
It creates a silent dependency on the board .dts, who must now define the p=
ins.=20
This makes no sense to me for boards that don't have eMMC. As an example, i=
t=20
breaks most downstream OpenWRT boards.

Was this new dependency accidental?

Alex

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Varadarajan Narayanan
> <varadarajan.narayanan@oss.qualcomm.com> ---
> v4: Move sdhc properties from emmc dts to SoC dtsi
>=20
> v3: Disable nand in ipq9574-rdp-common.dtsi and enable it where required.
>     Add 'Reviewed-by: Konrad Dybcio'
> ---
>  .../boot/dts/qcom/ipq9574-rdp-common.dtsi     | 32 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  9 ++++++
>  2 files changed, 41 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi index
> bdb396afb992..e4ae79b2fcd9 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> @@ -169,6 +169,38 @@ data-pins {
>  			bias-disable;
>  		};
>  	};
> +
> +	sdc_default_state: sdc-default-state {
> +		clk-pins {
> +			pins =3D "gpio5";
> +			function =3D "sdc_clk";
> +			drive-strength =3D <8>;
> +			bias-disable;
> +		};
> +
> +		cmd-pins {
> +			pins =3D "gpio4";
> +			function =3D "sdc_cmd";
> +			drive-strength =3D <8>;
> +			bias-pull-up;
> +		};
> +
> +		data-pins {
> +			pins =3D "gpio0", "gpio1", "gpio2",
> +			       "gpio3", "gpio6", "gpio7",
> +			       "gpio8", "gpio9";
> +			function =3D "sdc_data";
> +			drive-strength =3D <8>;
> +			bias-pull-up;
> +		};
> +
> +		rclk-pins {
> +			pins =3D "gpio10";
> +			function =3D "sdc_rclk";
> +			drive-strength =3D <8>;
> +			bias-pull-down;
> +		};
> +	};
>  };
>=20
>  &qpic_bam {
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> b/arch/arm64/boot/dts/qcom/ipq9574.dtsi index 86c9cb9fffc9..4b8c58982869
> 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -467,6 +467,15 @@ sdhc_1: mmc@7804000 {
>  			clock-names =3D "iface", "core", "xo", "ice";
>  			non-removable;
>  			supports-cqe;
> +			pinctrl-0 =3D <&sdc_default_state>;
> +			pinctrl-names =3D "default";
> +			mmc-ddr-1_8v;
> +			mmc-hs200-1_8v;
> +			mmc-hs400-1_8v;
> +			mmc-hs400-enhanced-strobe;
> +			max-frequency =3D <384000000>;
> +			bus-width =3D <8>;
> +
>  			status =3D "disabled";
>  		};




