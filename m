Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2B03B83E0
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 07:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387018; cv=none; b=eScic76xEcNdnsG6la3nQWeLu96kwg6+Bm4rYFU1S1jvSPCbPdKAIYMDqlphnH5b5OG6m1MOi1nDWqHDFVB0B9b3ckGJGDjdw5GY82ZzCSASobh/yo1pz3AzXx4G9jFY7hneaQy+PsGmIkPYLgXr885yT+HjDhFqyy1Ye1ZNpBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387018; c=relaxed/simple;
	bh=i0fsA2ivhe11Y8u5gaIykHCgQXF8turnGuDsfusfryM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MWXQUOeX0JMI9yWlyALIb5ZXZt9U+ubBK/FRHb3QupLfGcJQa45VrzAqQJxfAx+Eyn268WGC2+KoWvBiE66c0KENWZczaMD7/Wbe4K4PxL3D6GrTiKCVwgU5Dmiuy8YbLfbKIzHmKsrpAmCbgbJdyPwp7ISSXf+tvnYwJonSkhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4//jXaC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4//jXaC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002DC1F00A08
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 07:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780387016;
	bh=IBxDHoejwDo5SnSlUDfdE/v8ud8psoV97bK5W9arbl0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=I4//jXaChHtEsAwXCmlkr80m7M4dYxDsHMuXgGPQQjV+bUQQUWcImdN+ike4TSNOc
	 yrDfSsJnrujPFDcBBa3xPL9dvkmhl4+ishyUdYtjWfL1Rt6XpmeyHF1WVxBbXaegep
	 KRbjCB8Sk1cdu9bbTqO3X/k4N0fkwXGjy0vh4mvtIAsvWSEJ8YmBt7fQaI84d1vkLq
	 Py7RQBfRySx30QcOVcfrKD4c2aINRlDYCFk9BuA6bM1CydpQe6E1dL5SdXs4Fl9+u1
	 pj8+dYOPZTE1vCBE86/Dg4WqoA9fXWQGXPHo4vjoPpp3QIvZp3pqudhQG3uup2JeMu
	 ALzO4V52uJlnA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-396770cdcfdso24420111fa.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 00:56:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Y18X94liDlCRT0AJ4C53GRP5CBuMFd0twqu1pFjMDrJfWCqu7mI/GIAM8EZSkztEcL37SOrM2q7Tf@vger.kernel.org
X-Gm-Message-State: AOJu0YziXjw3J0vH5v3K9KpAzcE2ZC9eQ3hgWd3rYGNxx6y3lPwV9usA
	Sqye1+uyZla9lSiYlDj93Yk6odCQueN7UnxMICrUic/VGAVfQyxZ4ffDDw2JxdFuPtP62jCu0/T
	8xBa5DGOSZ8It/C4FBi6o2EUn299oFW/yv1nke1nYig==
X-Received: by 2002:a2e:bc83:0:b0:396:7927:2d14 with SMTP id
 38308e7fff4ca-39679272f2cmr33518171fa.8.1780387014648; Tue, 02 Jun 2026
 00:56:54 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 00:56:53 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 00:56:53 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260601-sm8350-wifi-v1-4-242917d88031@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com> <20260601-sm8350-wifi-v1-4-242917d88031@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 00:56:53 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mec4ZU4TswetjpWX+S8y9AmfAeu3mteDOx9zKLL_SB15A@mail.gmail.com>
X-Gm-Features: AVHnY4JD_Y8TgJ1t0LpA1dRA878Luk7CeT7uJ1XWJwhH04aYi2i6ZsE-lBCnpKc
Message-ID: <CAMRc=Mec4ZU4TswetjpWX+S8y9AmfAeu3mteDOx9zKLL_SB15A@mail.gmail.com>
Subject: Re: [PATCH 4/7] dt-bindings: bluetooth: qcom,wcn6855-bt: document WCN6851
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Jun 2026 11:46:52 +0200, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> said:
> WCN6851 is an earlier version of WCN6855 WiFi/BT chip, compatible with
> it. Add a device-specific compat string with the fallback to WCN6855
> one.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml        | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
> index 0beda26ae8bb..ec766f40a042 100644
> --- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
> +++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
> @@ -13,8 +13,12 @@ maintainers:
>
>  properties:
>    compatible:
> -    enum:
> -      - qcom,wcn6855-bt
> +    oneOf:
> +      - items:
> +          - const: qcom,wcn6851-bt
> +          - const: qcom,wcn6855-bt
> +      - enum:
> +          - qcom,wcn6855-bt
>
>    enable-gpios:
>      maxItems: 1
>
> --
> 2.47.3
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
