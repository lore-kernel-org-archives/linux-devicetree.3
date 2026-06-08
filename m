Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B0838F65B
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 07:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780903980; cv=none; b=GMurM2peV9cFjFN2yKR1JxonWIbIkjghgkgrxnQ6NUnHox8Z1cBDA6/J07rCOucPpzl9QPlVvCFSI9qB/A8LcSCPx8Lgdgu/F0sA+FM+IPC2EGQmtWiv6EuPOTtur3l+uA8tw7yNK/3KzVMZTSA5Op4vgkjbwpxe1NPlwG9vSDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780903980; c=relaxed/simple;
	bh=XMHyOQHx6WIm/tuQ1tglv5lWCjfTXh95qCF2ldK+bKM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=duKI+WZSwqy+NAQWbJkY2MlvUdLDmJ3L+G5Pqw3cIclumnfIK9Ykm+2OvZNIsIf7AXo6geC4Duj3DYS6mKMw+RoJ7DtJBalxan8g9HBzdm55iy6oX08jkq0sfZzbFGhJCdyBgFeih5R3jkhJJOfe/E9CjO4P8ggis3FtRAnQYJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=wGFcigS3; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="wGFcigS3"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68c19f1f3ceso5998570a12.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 00:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1780903975; x=1781508775; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5e4yVKORIbgcZMiPjlqQS5Msk7HSGQTKiassh3VqtIA=;
        b=wGFcigS3B+FXukYWVi5TuZg0Iuo6fSbyAfy6NUHUuTyKi3aZ5s5eNx9ncKP3Jjj8qt
         8i1LY9nXLim4RY+BzxCPdSXverYy2XgfIB4EfVKT6B4X/3vKM3K2FZS+gRBkP1euC3BZ
         zGJ2tfn/wD1yVYyWbv/zeVMxld81oyJjV0K0MR8o/vGEekpoivOuxBgs4QjJlPkm1qlv
         Rsqz9h21+KSR+WkU8nwsdA5YnNKdSGYjnzE2q5gS5mVJp7VNQxmYzdgBbofcDQuZwvbO
         b99N69rEUw/T4Sb9GPoWywQgTWJ6HmTdtNeca54HsiJT4ZZx/FIvFqLlJAiczzl7xdFT
         ab9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780903975; x=1781508775;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5e4yVKORIbgcZMiPjlqQS5Msk7HSGQTKiassh3VqtIA=;
        b=jm5vKSIzXOizs8nj3xc64h3hAEziMOgVnNUmNWiysba4V++U1EwE/ceFAozv5i+gAj
         ZJCSujf88E/E0mZSYMkzPs8g9fSEsCk990F+jNjhx0pNtL0yGrd/qtA+IKkvEMKwWgo9
         9evCQwe1ybU2+UzNXDMwlXt/cckz7Ru0taZi+jQ8kzyBmjRxRf8CM+EhW3ffs8F/0REM
         cwitVIErBhvEhJ6ZaWkjhkvnLM8ycsj2t6HAtHnjU350bnbODrEdrQLy4B6IGSvZvDOU
         yRuwzVi3GO9+lK3yqMyxSLQHEHMfxj96nPy1vIB21+Zwyrzuxt6L4Fm3hcZybrqO0TCn
         wzLA==
X-Forwarded-Encrypted: i=1; AFNElJ8ZasjkadrKGhuaizxxlark7jS07BIf+Xv4yzcl75Yrh121rk3htBHQHCZCVBA5FvPd87v9BYmSaSbN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr0xwSdcKlBjYwk6aE9cfm701SSJlEWqiIbumesqqr1pnCgtg1
	vr2fDrhvCjqm75QVLZ9to0oBkf+ocgfqbI2On1dO0Yq/BpsEC+2mrimsKC5S9WbXeNc=
X-Gm-Gg: Acq92OHsEQaTEjzvnXfDkF3Wh4VLSUWkTFTZvUVTiFIaiCCztcwXgvC5nYWLuJnqBFN
	Ox8Xm9r6ObD013f2xhwaIHDsXcgpNdteE0qxeZwCjkftGLO6dfxSErq4MN3P3ixNRthyBSZOEKb
	jlGCClFabroGzxoWlgLQ+DUZFQQnOpB95oC3kcUXuiQL6/41TpJKQ/S41r2fxpGfQYQ6MGbvnhz
	1JoxE2otWfVA7RGiFHdZy4dqBNqPg4XbOkpVyAAKtIg0MXPHx0mSSbsNmpkC2mgdJsOqObgLrkl
	ofFvAVg9ole0nnE8bRlcw/IfqOS2R/X42aEyq41qJWKPmwvFegzWfHBdy/DhDSvLSJutiGq6GG4
	i+yh0EJDa5Us1UNWPADqc4C1LMSvskUSBAJL4eo5j3KdCwDSFT7ClXEqfnWDUYtLDEdxFZzRkDj
	Xsei4YtWeHO+hvkAcpy9qmtVUBnfD0FwP7GjH5CSjPVSK57Wz4jyt/htug1/zhY7e5IgwMxz4dU
	D0fzNA=
X-Received: by 2002:a17:907:3f20:b0:bdf:8e2a:1092 with SMTP id a640c23a62f3a-bf370e639e5mr722825866b.3.1780903975340;
        Mon, 08 Jun 2026 00:32:55 -0700 (PDT)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051d82a31sm831571366b.19.2026.06.08.00.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 00:32:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 09:32:54 +0200
Message-Id: <DJ3HRRGJZN8F.3UNOV86ZOB47B@fairphone.com>
Cc: "Ajit Pandey" <ajit.pandey@oss.qualcomm.com>, "Imran Shaik"
 <imran.shaik@oss.qualcomm.com>, "Jagadeesh Kona"
 <jagadeesh.kona@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <netdev@vger.kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add GP M/N clock controller node
 for SA8775P and QCS8300
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Taniya Das" <taniya.das@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Linus Walleij"
 <linusw@kernel.org>, "Richard Cochran" <richardcochran@gmail.com>, "Konrad
 Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-5-1522662b6c53@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-5-1522662b6c53@oss.qualcomm.com>

Hi Taniya,

On Tue Jun 2, 2026 at 5:21 PM CEST, Taniya Das wrote:
> Add the GP M/N divider clock controller node at 0x088d3000 to the
> SA8775P (kodiak, lemans) and QCS8300 (monaco) SoC device trees.
>
> The node uses the qcom,clk-gp-mnd compatible, is clocked by the PDM
> XO4 and AHB clocks from GCC, and exposes a single clock output
> (gp_mn_clk) on the dedicated gp_mn pin mux function. The XO4 clock
> is pre-assigned to 4.8 MHz (XO/4).
>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 14 ++++++++++++++
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 14 ++++++++++++++
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 14 ++++++++++++++
>  3 files changed, 42 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> index 1ff9e1598d00429c03b2bcae41fa370ab2c892bd..cbc13ac37f8aeb0b1071ad060=
9ec11e829d2c798 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -4412,6 +4412,20 @@ usb2_role_switch: endpoint {
>  			};
>  		};
> =20
> +		gp_mn: clock-controller@88d3000 {
> +			compatible =3D "qcom,clk-gp-mnd";
> +			reg =3D <0x0 0x088d3000 0x0 0xc>;
> +			clocks =3D <&gcc GCC_PDM_XO4_CLK>,
> +				 <&gcc GCC_PDM_AHB_CLK>;
> +			clock-names =3D "pdm_clk", "ahb_clk";
> +			clock-output-names =3D "gp_mn_clk";
> +			#clock-cells =3D <0>;
> +			pinctrl-names =3D "active";
> +			pinctrl-0 =3D <&gp_mn_active>;
> +			assigned-clocks =3D <&gcc GCC_PDM_XO4_CLK>;
> +			assigned-clock-rates =3D <4800000>;
> +		};

Am I missing something, or would this just configure gpio60 for all
boards for this clock controller output? On QCM6490 Fairphone 5 this pin
is connected to FP_3P3_EN, so it's definitely not unused.

Maybe disable them by default and let the board enable it, if it wants
to make use of this clock?

Regards
Luca

> +
>  		qspi: spi@88dc000 {
>  			compatible =3D "qcom,sc7280-qspi", "qcom,qspi-v1";
>  			reg =3D <0 0x088dc000 0 0x1000>;
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 19f8cf4e15482947f6049188050c370340afaead..d192f92a896bb13017abdf820=
62e8305aab3e5d5 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -4353,6 +4353,20 @@ opp-384000000 {
>  			};
>  		};
> =20
> +		gp_mn: clock-controller@88d3000 {
> +			compatible =3D "qcom,clk-gp-mnd";
> +			reg =3D <0x0 0x088d3000 0x0 0xc>;
> +			clocks =3D <&gcc GCC_PDM_XO4_CLK>,
> +				 <&gcc GCC_PDM_AHB_CLK>;
> +			clock-names =3D "pdm_clk", "ahb_clk";
> +			clock-output-names =3D "gp_mn_clk";
> +			#clock-cells =3D <0>;
> +			pinctrl-names =3D "active";
> +			pinctrl-0 =3D <&gp_mn_active>;
> +			assigned-clocks =3D <&gcc GCC_PDM_XO4_CLK>;
> +			assigned-clock-rates =3D <4800000>;
> +		};
> +
>  		usb_0_hsphy: phy@88e4000 {
>  			compatible =3D "qcom,sa8775p-usb-hs-phy",
>  				     "qcom,usb-snps-hs-5nm-phy";
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index ebe5889daa5300efa7857314e9170d7d2fc33ef7..f6c5ec38c7491b7a16ebfb853=
f8af88bdf1f0db3 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -4867,6 +4867,20 @@ opp-384000000 {
>  			};
>  		};
> =20
> +		gp_mn: clock-controller@88d3000 {
> +			compatible =3D "qcom,clk-gp-mnd";
> +			reg =3D <0x0 0x088d3000 0x0 0xc>;
> +			clocks =3D <&gcc GCC_PDM_XO4_CLK>,
> +				 <&gcc GCC_PDM_AHB_CLK>;
> +			clock-names =3D "pdm_clk", "ahb_clk";
> +			clock-output-names =3D "gp_mn_clk";
> +			#clock-cells =3D <0>;
> +			pinctrl-names =3D "active";
> +			pinctrl-0 =3D <&gp_mn_active>;
> +			assigned-clocks =3D <&gcc GCC_PDM_XO4_CLK>;
> +			assigned-clock-rates =3D <4800000>;
> +		};
> +
>  		usb_1_hsphy: phy@8904000 {
>  			compatible =3D "qcom,qcs8300-usb-hs-phy",
>  				     "qcom,usb-snps-hs-7nm-phy";

