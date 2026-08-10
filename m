Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA163BBFB3
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786360423; cv=none; b=n0C9uCgVHN9FETkZ9JA5NCc1a3qB228k3fHis8GDsTFBAC9JBW4cT9uea3HTPG6LvKpjvuSA+3T95pUdijgi2RvLZ09MEHQ3BogcZhbgFBIlu/08GFLcHIzUsE2P9hgNeZ4pUNykVByBT7vuIbTNhL9dHsIh5zTk0VU0Bi28Uh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786360423; c=relaxed/simple;
	bh=zmSsve8sqEAbwl4nnNRwu7JWxP6gMcHDO/OKh1VH84E=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SPEtGJtu+TLb5ZdNP5UNhCimdEZfHgPGhxhhwaBxitZMxHhfDjyjVvvZqVfP9eKa/7wMcXTfeMYixuHVkIXsugc7/NV5F04x42Ov3CELUexWUZxKcT32hDjislt7fK03sP4KWiVV/fn+6Y7EBOvnQkzmjFHX+KWb1PjO9piTtlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nw+HtS8H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nw+HtS8H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741EB1F0155B
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786360422;
	bh=apJ+Wd3xen3OiCkSn7zvoO866Ug5lbpClYMSDMZySoE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Nw+HtS8HuhE+MDZdUnvaFuTM7dmOwksv1xz+De2T1NseC4/RztBkdOOCQkkp2mUOv
	 EbpqK10RGM++KomkBX/jFgCsn1Y7mc/s3lCC2X7QNMkgDS2bJI3ycMrbr3hoKFumYI
	 54VuZ5MqcmylwH/XCmAKTnHRZYkRxHQeq+cu1G9GKmNZ9BcWTztdwa4ydU+knzwrqY
	 j2QxQ6Zd3pJh+XHZfK0PnaXuD8+zU1z3xDbWc3XroDAYlDQHu6Dcj/dwF1bjmAs0Sr
	 +j5KMRc73vSfY9kJt/uEafqLtfPnctafHIZCoRMEswKTC9feCAJvh4J8meFxiHaa80
	 lR0LlGQh0fNkw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b00d083818so3519259e87.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 04:13:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrvjy72YZP6kBsk6Jp2Nto3rSr6MAKWR9by3qYyfc29d2ch2w4Ps6un4uOBP0iGdwYvHf4449+3X1/v@vger.kernel.org
X-Gm-Message-State: AOJu0YxKBirgx6ovn0emJwgbCZ5Vd3L7yJzf+X9CZfdndPiXMUDNYZrK
	SUk/WvsuNpSaxmdqL5BmkXc4eVODHKZ2x1KXJfdqsBFJOQ15meH0jDytrbTYJZkAxXi7D1ry5ty
	uJxDv9V7bPiL50jcZNOw1vfLGLbd2LQo3WZ1XNRp/aA==
X-Received: by 2002:a05:6512:3986:b0:5ae:9be8:1ad7 with SMTP id
 2adb3069b0e04-5b30c156af4mr3019492e87.18.1786360421140; Mon, 10 Aug 2026
 04:13:41 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 06:13:39 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 06:13:39 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-1-c4bc688177dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
 <20260804-b4-sgmiieth_serdes_regulator-v2-1-c4bc688177dd@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 06:13:39 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mf1Mk03YXa0aYPSwMr+iZxtUKaQR6Erp3m0oO=g1U4Qpg@mail.gmail.com>
X-Gm-Features: AUfX_mxgJ-CVdRVanRZmxExwdSzq95SDKkVdHawKuf8WIZ0HaFMuUt_H9gU2wxc
Message-ID: <CAMRc=Mf1Mk03YXa0aYPSwMr+iZxtUKaQR6Erp3m0oO=g1U4Qpg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy:
 add named voltage rails and deprecate phy-supply
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

On Mon, 3 Aug 2026 21:27:57 +0200, Mohd Ayaan Anwar
<mohd.anwar@oss.qualcomm.com> said:
> The Qualcomm SGMII SerDes PHY has two distinct voltage supply rails,
> vdda-0p9 and vdda-1p2. The binding incorrectly described only a single
> generic supply via 'phy-supply'.
>
> Deprecate 'phy-supply' and instead add two named supply properties. The
> 0.9V rail draws a peak current of 46 mA and the 1.2V rail draws 15 mA.
>
> Fixes: 97b795125704 ("dt-bindings: phy: describe the Qualcomm SGMII PHY")
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
> index 90fc8c039219c739eae05cc17108a9a2fc6193df..e573abcb937df914ced25ec87add7955bbba7b87 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
> @@ -35,6 +35,17 @@ properties:
>    phy-supply:
>      description:
>        Phandle to a regulator that provides power to the PHY.
> +    deprecated: true
> +
> +  vdda-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to the PHY, which draws a peak
> +      current of 46 mA.
> +
> +  vdda-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to the PHY, which draws a peak
> +      current of 15 mA.
>
>    "#phy-cells":
>      const: 0
>
> --
> 2.34.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
