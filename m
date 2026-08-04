Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D1F45D1B2
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 13:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785849871; cv=none; b=W4MZaoPkWrzCkxLX2H0/25bhto1yAYwE6RgCqyoO/C4pQfUC4JyG/sKugJQOQeXAIOW3Fog1MW7MCpZ/+JGDCIgSeG4oZzc+1qIKStvLnGRAa7gkxs/wzUhuHtwf//lw++6k9NWR2iA3XlXY8WKmRK/3emAFF+/GDaB6gFaJz50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785849871; c=relaxed/simple;
	bh=cjaTBcoabOwGG7jgJNjkjLDDD9yULRtNRmPbeWgSCEI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=CfqfRkFYbt9Y58hRgci51rvcXKoKWdkEPyDGSQvFr/C9ZrM2vmokUT18OC4DPnTC7TJumJ4siUt/o69BC4D1kUcdlaGClB2S+02Uj0of+wrtL9bbN45YKM9hlZxnmbQILnM/5xwI2Q04Noif6Dkr717fYArolCy5YTOFd67MQzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=lbRZSPyk; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="lbRZSPyk"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15ca7a7ca9so449141366b.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 06:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1785849866; x=1786454666; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DtP+GSoAeum6eUF2aWhaojOmnieDIDYnqy3lkWwdQXM=;
        b=lbRZSPykyO+/kRB5v0WLzFyRxc5iULFSRxq7WlYe6sBQPX4msKIulUdoTc5uJp/vTf
         o1ugIMkF6X9CPaCVtzvyk+1BSizwcof91jG5q+gRrVUNMdZNJ8Ewf0yEhPeBvD8qNJ1y
         +3s/J0XRPiGmFJMBPgSXk36Q3MkPphECkjhbfI8LodIj+JRihepTX5dTjzRtV9gXk7sm
         8++LuO/C2Xp0YHHRQWebcbP5W2iUmNAhHBQ8OQ4II4+B7hZ9ijf+LQrfpOMWCZTfnGwF
         viWmPsZ3qcjLpjU/C27yLCQzqmSAEwzXvFOXYnSbJrYrkECfG82MqRD4sqITRgXYN/t2
         twNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785849866; x=1786454666;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DtP+GSoAeum6eUF2aWhaojOmnieDIDYnqy3lkWwdQXM=;
        b=KjgvorbMQ+n5Dxjzilupja9RgLFncIlEU4lXMwLCSDcWaqAnqhKpl1p8MJSXy6l9ZN
         mt5jC41E+9amEW+JmwrNqJQPULCITZfeLQXhEg/m+ieiKugSVIYGTqoY8oPg/EsvW+2E
         dUZEIMSCLUZM11X6MfTdezC1/0BVjGHhCze893FNMnuH31b3mQPKjJF2VMtGddqVO2PP
         w+yrwX28D8MqfzZ92qwl/sgMu5dGydyC44sxoWnoJdats90/BFZq0iTT1JK2HkM6Ufg/
         FoyGZgfhYfw2scNnk6DEbrhHpuGqENDvm2TUqPv0KnO8YkEVs0j0kxu3gy2PxytzZDaq
         Uhsw==
X-Forwarded-Encrypted: i=1; AHgh+RqCHaD8zv6iAzQyi2iLZA7HPJUQYWa2vQj2E3pqYsl7RqApKOxTygpSszIkygyC0HmtVTwOdKn2O/sJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxPmM1fuW6m4Gg1if0Ev1+YZKbEmWlF28OMsJU0cImE+As2Pjn/
	xcxrMz40Vt9gpuxy4gX3KGrzoZ82f6nBDlndvD8cO2Z3/1yorx1jT+XQ1xVdS9MrP0qX9ccOnnT
	C4bhBtrY=
X-Gm-Gg: AR+sD12qnwMYA2AQZ74G2z3gKILPcZN+VJow9XVbn4WXAO9yIzmvmmVqAI3n9msDN7d
	fPjIOg6Bs+D9RJMeglkw87ooO7Q5bzXf+gNBydY9HzHCfWHT8YL2l/uHIBmD5UV6nbuSLEOuCBl
	g57yaHa691PSoCZOyqVY4szFzr9pyWNE3LP+18tBI0vi2rcRXbWB+/MGuxWMImIYq6xx6k5kiwk
	aXYLljNX88OGU5JzuRJox4B5nMNWYth1M6N6L50ItXGBr7aW6UCxoDz+ZcCh5Sp0HjWZPUXZbiv
	B6o9OJrd729s4JNKeLT0C3EEMOB+s64j02RB5Q9eEnPuyHsJ6VautTCiTUGnBS3TluaY7mrg4lK
	JtOUNtpD6JbsTSkinvjN1aJBj59rHpmiuVqGkxMK/0E/OgTMWS93XpIuQjzGuGMMIRBmWB22Cy6
	keDbwkIw8U2YJXysJv6YykV0QvT6p7Q0FZHubFw1OYK1YSMDr+e0L3eDszC9+4jf7yF4yRoY0d8
	DAtGlzYPUnE7PbGHd8=
X-Received: by 2002:a17:907:c28:b0:c1c:3b06:ed19 with SMTP id a640c23a62f3a-c1fe82058dbmr1260652066b.31.1785849866554;
        Tue, 04 Aug 2026 06:24:26 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c20363e71ddsm8295166b.34.2026.08.04.06.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 06:24:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Aug 2026 15:24:24 +0200
Message-Id: <DKG6XXPVJLYA.25Q0D3P2HY45C@fairphone.com>
Subject: Re: [PATCH 12/28] arm64: dts: qcom: qcm6490: Fix swapped USB QMP
 PHY vdda-phy/vdda-pll supplies
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <manivannan.sadhasivam@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, "Manivannan
 Sadhasivam" <mani@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
 <20260803-phy-supply-fix-v1-12-5880630cde3e@oss.qualcomm.com>
In-Reply-To: <20260803-phy-supply-fix-v1-12-5880630cde3e@oss.qualcomm.com>

On Mon Aug 3, 2026 at 8:34 AM CEST, Manivannan Sadhasivam via B4 Relay wrot=
e:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> The QMP PHY expects the vdda-phy supply to be around 0.88V and the
> vdda-pll supply to be 1.2V. But these two supplies are swapped for the
> USB QMP PHYs on these boards, feeding 1.2V to vdda-phy and 0.9V to
> vdda-pll.
>
> Fix it by swapping the two supplies back.
>
> Fixes: 9af6a9f32ad0 ("arm64: dts: qcom: Add base qcm6490 idp board dts")
> Fixes: a319cf4a4b09 ("arm64: dts: qcom: qcm6490: Introduce the Particle T=
achyon")
> Fixes: eee9602ad649 ("arm64: dts: qcom: qcm6490: Add device-tree for Fair=
phone 5")
> Fixes: 249666e34c24 ("arm64: dts: qcom: add QCM6490 SHIFTphone 8")
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Assisted-by: Claude:opus-4-8
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts    | 4 ++--
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts              | 4 ++--
>  arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts | 4 ++--
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts      | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/ar=
m64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index 04cb9230d29f..92a7d80b7fee 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -1502,8 +1502,8 @@ &usb_1_hsphy {
>  };
> =20
>  &usb_1_qmpphy {
> -	vdda-phy-supply =3D <&vreg_l6b>;
> -	vdda-pll-supply =3D <&vreg_l1b>;
> +	vdda-phy-supply =3D <&vreg_l1b>;
> +	vdda-pll-supply =3D <&vreg_l6b>;

On Fairphone 5 the schematics show:
* VREG_L1B_0P912 <-> VDD_A_USBSSDP_0_CORE
* VREG_L6B_1P2 <-> VDD_A_USBSSDP_0_1P2

So with the updated bindings description, this makes it fairly clear
that l1b is vdda-phy-supply and l6b is vdda-pll-supply. I assume all
other kodiak boards are also wired up that way.

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

Sidenote, you could squash the qcm6490, qcs6490 and sc7280 patches into
a single "kodiak" patch, but keeping them separate also works of course.

Regards
Luca

> =20
>  	status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/d=
ts/qcom/qcm6490-idp.dts
> index bdc02260f902..58cce89a0c1c 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -1141,8 +1141,8 @@ &usb_1_hsphy {
>  };
> =20
>  &usb_1_qmpphy {
> -	vdda-phy-supply =3D <&vreg_l6b_1p2>;
> -	vdda-pll-supply =3D <&vreg_l1b_0p912>;
> +	vdda-phy-supply =3D <&vreg_l1b_0p912>;
> +	vdda-pll-supply =3D <&vreg_l6b_1p2>;
> =20
>  	status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch=
/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
> index bf18c4852081..17804de03e17 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
> @@ -839,8 +839,8 @@ &usb_1_hsphy {
>  };
> =20
>  &usb_1_qmpphy {
> -	vdda-phy-supply =3D <&vreg_l6b_1p2>;
> -	vdda-pll-supply =3D <&vreg_l1b_0p912>;
> +	vdda-phy-supply =3D <&vreg_l1b_0p912>;
> +	vdda-pll-supply =3D <&vreg_l6b_1p2>;
> =20
>  	status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm6=
4/boot/dts/qcom/qcm6490-shift-otter.dts
> index 797f37596bf1..cdaacc09f56c 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> @@ -976,8 +976,8 @@ &usb_1_hsphy {
>  };
> =20
>  &usb_1_qmpphy {
> -	vdda-phy-supply =3D <&vreg_l6b>;
> -	vdda-pll-supply =3D <&vreg_l1b>;
> +	vdda-phy-supply =3D <&vreg_l1b>;
> +	vdda-pll-supply =3D <&vreg_l6b>;
> =20
>  	status =3D "okay";
>  };

