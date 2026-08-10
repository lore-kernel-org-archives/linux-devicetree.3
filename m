Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040D33BFE24
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786360526; cv=none; b=SaZ4OtbOnrUGaLUESk4R8W+xidaR0rBYDnw+CJE2RCUoQWlXil5kKYgCLK1pLjPiKZQ9T3HW1G96QCI/lAN2Ie4/pm9dmEG9yjXGz93u5yTeBwWMaiaFzYe7+cOoSxLHPS9BLR7erD6ElH7oRRbrl4FpHmMrLidIlcR99q11k0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786360526; c=relaxed/simple;
	bh=FMhkGdGhLQOIoOydP+ku/DXrUFI8tIxPlZMHZUFhato=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q0oMK6cORtKwktCwKuec2TFBkKRUJLu2+uPNIzoMbjJmc1pZml1yRLhT9VeNdHE+1KbAND0mORSJ6ZS0U6vmFbKk5ygMElbgGJa01rbyajzStePBj72UyuxQt3KXou7pq2WLOMHNDc0Q9p36CqE7CAtiLOMUX5kuSRDGuoSQdlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hw61/ViS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hw61/ViS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5151F00A3E
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786360524;
	bh=vhrx8DeAvw9uZMYwSNzW2M9NFfXSvO+hZMshnNaVKXk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=hw61/ViSHiVGf8GH7Sb4G30pms5KQsm/e+G66NKSYqCT1Ix1BY3Dt5+fKXZjPGXhL
	 5ZhFX2nhHUMvTTjyJMPXrEQVYSsmOhVagmWXwjoE73SySr+1PcudE2axXJxMBtWiFT
	 bjJ4hisHuG+5IxVygd2+vfMNu+MLbPSi/qlQxiesNKi0dYqW2VSUZedzbq3kQYjFEB
	 qv2/5RLAjBmmvJAkI4Q187qg9VpST1UTY37wQVN59aruQMoNl5bR8QdLmwl6ieZF7k
	 HG7EXBZ1E5oLDtj7h3lL/uwo7UehsnmB7yG2N1eF7ZvNmuWTcYjiSKs1q3kLYKhhZO
	 FTl70HTUlYjCQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b013aa02b2so4883302e87.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 04:15:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqwD+6f2axcB726axpO4s/Tsk6Nlj8thJX1+yXpLSeaXWoW8U7u228c3c2ralOvuV29C4R+uqMdovoy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/lEc65BWEYyM5n6examR3NEd7sQ6Peu8FLefcaHKK8m8GpjTB
	u/G9mcYkp5ELwTgWnNE7HnFHEcgRvxl9KQr/C9dKb9GEiBY4ZAN26lNmwrchrayZvqYtPJze56t
	fi6SDGRaMH4B435r4Op8sz6eH83wNwMIIycPJZ4hXBg==
X-Received: by 2002:a05:6512:350a:b0:5ae:ba88:5443 with SMTP id
 2adb3069b0e04-5b30c03e7edmr2973614e87.16.1786360523676; Mon, 10 Aug 2026
 04:15:23 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 11:15:22 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 11:15:22 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-3-c4bc688177dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
 <20260804-b4-sgmiieth_serdes_regulator-v2-3-c4bc688177dd@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 11:15:22 +0000
X-Gmail-Original-Message-ID: <CAMRc=MfGO135r=_PuRUYmL8QkYTtw4vDrTWKEQO0R3pgHB=8iQ@mail.gmail.com>
X-Gm-Features: AUfX_mz7YbfQpGrxAfn0g3K5gHPEg8MpiJ4dCVlm-C7BXnVJ5BHj6wkG8MOKooU
Message-ID: <CAMRc=MfGO135r=_PuRUYmL8QkYTtw4vDrTWKEQO0R3pgHB=8iQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: lemans-evk: fix SerDes PHY
 regulator supplies
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Wasim Nazir <wasim.nazir@oss.qualcomm.com>, 
	Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>, Umang Chheda <umang.chheda@oss.qualcomm.com>, 
	Yijie Yang <quic_yijiyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Aug 2026 21:27:59 +0200, Mohd Ayaan Anwar
<mohd.anwar@oss.qualcomm.com> said:
> The SerDes PHY nodes were configured with 'phy-supply = <&vreg_l5a>',
> which was incorrect on two counts: vreg_l5a is not a supply the PHY
> requires, and only one rail was described whereas the hardware needs
> two.
>
> The PHY requires vdda-0p9 (vreg_l4a) and vdda-1p2 (vreg_l1c). Replace
> the incorrect phy-supply with these two named properties on both the
> base EVK node and the IFP mezzanine overlay.
>
> Fixes: 71ee90ed1756 ("arm64: dts: qcom: lemans-evk: Enable 2.5G Ethernet interface")
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso | 3 ++-
>  arch/arm64/boot/dts/qcom/lemans-evk.dts                | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
> index 6cfa0bc1440e91d32df0695ae4059050e4e20b56..8651c412d0288fcf2ab69fbfaed86f68fb2b4fc5 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
> @@ -291,7 +291,8 @@ pcie@0,1 {
>  };
>
>  &serdes1 {
> -	phy-supply = <&vreg_l5a>;
> +	vdda-0p9-supply = <&vreg_l4a>;
> +	vdda-1p2-supply = <&vreg_l1c>;
>
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index 0c53640c42a65c62375e71f7ae79cbc834a05888..5c046b9bfb3cdec59cffc1dfdbf9f2a51dc9721b 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -978,7 +978,8 @@ &sdhc {
>  };
>
>  &serdes0 {
> -	phy-supply = <&vreg_l5a>;
> +	vdda-0p9-supply = <&vreg_l4a>;
> +	vdda-1p2-supply = <&vreg_l1c>;
>
>  	status = "okay";
>  };
>
> --
> 2.34.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
