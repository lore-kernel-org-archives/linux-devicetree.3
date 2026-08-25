Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2272D36F8E4
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 16:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787675563; cv=pass; b=ONKMLDnw/uBzpK9yDRM9q+M8FTlaAbsXShDHkIDZ9P9nr0z8nKZyXrULpqpgQbxMmbgkDWTe965nwcsz9YwIzSVgn9m+fCuBD2OGDIbOebZMOAuoqDkiOkcpyTn08N3YiBvUEYjaNgkCjaKviSWCutTGZex8hTowk8Fz+HhQUhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787675563; c=relaxed/simple;
	bh=/k84j26bjqojqsGkVOowJ/WCefrkRCst+f+Jb6wWW6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L2HMdFOLLZQOg7ELspo6T+1uYMtb69UWs58U6kiizMNVd+VnoPE+3FL2oDfG95k2BBZNAkWJgSfMSI9pt150bXnoqgXjcFD2YRKp3D07AK9mAutiDQ7u4TnDqKG3hTn9eGmACr50cdW6hH5tn+TLaPndWURPh08k39TdH+Z84Y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdvfAcjJ; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdvfAcjJ"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so376737a12.2
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 09:32:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787675559; cv=none;
        d=google.com; s=arc-20260327;
        b=IznqbedyFRR3liWkBkvsKRferZGxq51VsHJS54bMCow5neczcHOjoQ9p6QnSrnxgm3
         JKwYA/MyB3ueCHRFVMt9kJtv4CAU2qEtFRyN8sKDZ4pk8pXlLakEVPozujZ7dXRJImBI
         UxTva4grt0e/T7BVsxQu7/J1f2/isOWwor9x07sZhIbyw22CSgbcITOSBACTjbPD0kVG
         nj+LDk7szr3l77FN/XrEVSiD4DV/saRuLedCqXBCyZn+uFweh90PhFFCwKfIkkF6Zah+
         PKIEs0DClWKNs0dUvbXi1cSRzXaBD9nvNbO/QQLUv9GFy1m75W7TZcJ1MaUDyBU2vfhg
         JAcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RLh6vm4k5z6kpwU5Bc9yLeQpIHWI3MlaI4Wdfs6kBDA=;
        fh=Prp4ecfCEbT9zl4eEyx+PqZbxSZTvGwigM/nP4Y/ZX0=;
        b=eENwdrWkzJUdfAgSkWBmMLxuzAtdclrZ0OLhHdoYQk/7fG5fv2RK5RixoGfbbXEZvb
         g2bNX+5Unvxd05o8ZJYHZc741FFD3JcQNmib0BiSgGisHGGajXW4VtlY7xk7WPcJEp8D
         XeKW1VyH62rq3hvoRoG+ekL0qPpIUVnD8wpNcFgTRmrLh9cNL3zpHScQm3eMPbR9szMU
         jJGiulTs3bZkyOkH+cgQf1Udn11qkfTqg7PXGBdN58nFFfftSYtUpxejkfQmswDzsI/7
         +aKjdaCU3a581zm/p0TfGDGg8UMuKfG9k+IkBX6JgCnJLCemAJjHXcE9EmL5OudgmJTY
         YrOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787675559; x=1788280359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RLh6vm4k5z6kpwU5Bc9yLeQpIHWI3MlaI4Wdfs6kBDA=;
        b=gdvfAcjJQbRqhDQBdk/RdtckY/LBCPDDoLoED0WcGvIHz8otCeBLL29taUtVc16DOJ
         gs+iTP9jWIVfsQJmRM8ILa3ps5lVqgoTvyZvQNMHQp1fCFa/+egZK/H7G8NKpA1iO/pt
         uR8zkixBz5qTbaMtjSAfN+53V8fUOmUm5bRXzfFG+m79PB9THidUsKi1pnlKzqo1k0LT
         jWuC+CPKpGNpvaeFXoG3MIEtB1nRBQsHRzEXR2MRBWGbTMN2mD2DYQ1iOA4NtShapDLa
         gl4hkvJT0xJ1cABgstmzsvQfJSy2HWjisDfcHijEc9V9Hd5Y2iwxi5QoOkRReTrTkl1V
         7gaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787675559; x=1788280359;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLh6vm4k5z6kpwU5Bc9yLeQpIHWI3MlaI4Wdfs6kBDA=;
        b=Y75USa88v/eRp9AB3ED9e+MhgjRKWBxIbL+UJq6gYr3DCxCA2pqlHa38l7yEMPH7K4
         e+lfxuwBbN1F882F5ROx5EwOpr4cVw8KZ1BuZCecPuVn5Vynzayx+1E0hnU820p+/UJM
         t9kdOD/Az8WWfO4lGqEpJQ6lk894TwWSx8K4QYghgsN/vlJitQffz7uA85ohbnyHq7ei
         M8TwtAiOkvRAMS2K8lGOb3wp79aqUnt0dLs2Vn1ktHMuR5DO/nDHbnr93bc4jpMe0EoM
         NcADVIccwVaQHY68tVpxMWE+48KEfO+chs13LUzcGD2JcSIAFY7HxFCfE0aHlSSwBjmN
         bIKA==
X-Forwarded-Encrypted: i=1; AHgh+Roz91N530GSjy+M46Tn0J++uFtRpHlbioDDo4WSTjStS91b8t4CjCddtqf/AqpjEzjK+3DDFxdmZfr+@vger.kernel.org
X-Gm-Message-State: AFuF++nAsF2w69+B6jCweUIJdo12fkcHAxhPn61/AbTrPTxObGdaD6tb
	PCcs1B+sSZnNBR7WTzdkgYvDsaTtcZhCZ4a9frZCovpzTIKTQWpDPE63RfUrLS8/TB0Dd3N7wLZ
	NbDvuFtRuadh+BcyPFImORW1q1Ei8wbaTb0c=
X-Gm-Gg: AR+sD116kO9nMiFTvCkhdQS6F8KOy5qXq556uw5/yGdvg2+FmqFHph+DeRERdgyaGmQ
	PiXe0EwX+UqNtjdkIkE2PSt3skLt9CU8ARlyYr25bWPN6sGec/1HZFdvaSGauK1K+QO4oKjkA0k
	zvlvkeh6iwFPH3DT7eJZohzva/+7G5g31a5W0R2HCHJY+VSjD4OjuXt3C2u/PYK4XW9e4gvInaU
	8dcnAKbSvIVkwh67RmdEG/lzj4DOFpTtforiRkC3NenLQgW7rHRDWkPILHw3i1zWJP+NR8JFZl4
	Q47AfsDnlhQ2Ga6ykwoPbAtsXYajBybLmn0aC876kLWM43FrcQDcmA==
X-Received: by 2002:a17:906:ba8f:b0:c1c:3b06:ed03 with SMTP id
 a640c23a62f3a-c24920e2f93mr3477526066b.23.1787675557738; Tue, 25 Aug 2026
 09:32:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825-blackrock-audio-v2-0-659cc4724d57@oldschoolsolutions.biz>
 <20260825-blackrock-audio-v2-2-659cc4724d57@oldschoolsolutions.biz>
In-Reply-To: <20260825-blackrock-audio-v2-2-659cc4724d57@oldschoolsolutions.biz>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Tue, 25 Aug 2026 18:32:01 +0200
X-Gm-Features: AcwNN1WYzseF4DrN8CujPdJzCtFKwid82ijQDptCX4tlvVoNAotzNxH91_O73SQ
Message-ID: <CA+kEDGHSZmkch4Hs=U8ry7P0FzvE6gNC=sqQZ7noiy=T-rY16g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sc8280xp-microsoft-blackrock:
 Enable 4-lane DP altmode
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 25 ao=C3=BBt 2026 =C3=A0 16:07, Jens Glathe via B4 Relay
<devnull+jens.glathe.oldschoolsolutions.biz@kernel.org> a =C3=A9crit :
>
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>
> Allow up to 4 lanes for the DisplayPort links on the USB-C ports and
> the mini-DP connector. Add the standard link-frequencies and move
> data-lanes to the out endpoints where required by the current bindings.
>
> Also enable mode-switch on the QMP combo PHYs so that altmode events
> can reach them.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 13 +++++++++=
----
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi                    |  4 ++++
>  2 files changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/=
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
> index ac22f44020a64..f5140d3985503 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
> @@ -563,7 +563,9 @@ &mdss0_dp0 {
>  };
>
>  &mdss0_dp0_out {
> -       data-lanes =3D <0 1>;
> +       data-lanes =3D <0 1 2 3>;
> +
> +       link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 =
8100000000>;
>         remote-endpoint =3D <&usb_0_qmpphy_dp_in>;
>  };
>
> @@ -572,19 +574,22 @@ &mdss0_dp1 {
>  };
>
>  &mdss0_dp1_out {
> -       data-lanes =3D <0 1>;
> +       data-lanes =3D <0 1 2 3>;
> +       link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 =
8100000000>;
> +
>         remote-endpoint =3D <&usb_1_qmpphy_dp_in>;
>  };
>
>  &mdss0_dp2 {
>         compatible =3D "qcom,sc8280xp-dp";
>
> -       data-lanes =3D <0 1 2 3>;
> -
>         status =3D "okay";
>  };
>
>  &mdss0_dp2_out {
> +       data-lanes =3D <0 1 2 3>;
> +       link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 =
8100000000>;
> +
>         remote-endpoint =3D <&dp1_connector_in>;
>  };
>
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts=
/qcom/sc8280xp.dtsi
> index baca36b151853..1c8836c1aae63 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -3692,6 +3692,8 @@ usb_0_qmpphy: phy@88eb000 {
>                         #clock-cells =3D <1>;
>                         #phy-cells =3D <1>;
>
> +                       mode-switch;
> +
>                         status =3D "disabled";
>
>                         ports {
> @@ -3807,6 +3809,8 @@ usb_1_qmpphy: phy@8903000 {
>                         #clock-cells =3D <1>;
>                         #phy-cells =3D <1>;
>
> +                       mode-switch;
> +

As you've moved this common definition to sc8280xp.dtsi, should you
also update the x13s and arcata devicetrees to remove the now
duplicated mode-switch for both usb_0_qmpphy and usb_1_qmpphy?

Thank you,
J=C3=A9r=C3=B4me

>                         status =3D "disabled";
>
>                         ports {
>
> --
> 2.53.0
