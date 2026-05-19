Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0623EFFC0
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180962; cv=none; b=K7Hx6fj5ulF7NxSTLNOk5QTczD7UTg8R/6HDt5c3CiQd/gi3vW776S0UCFUyD2x/MNwzSL3q/O0YCHof4TEFZB5klao2uFQGXQ25XtQYmJEDc1AUPZ1VpUy/J6kQCUrDDvnJLz8BBmHchAG/orDO+d5TuYBwUu9EBhTTjbxyeMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180962; c=relaxed/simple;
	bh=uKGhi9iUrTdOisqjiyNydIx7fx0FrybVAAXaYF6uRo8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=FHky7Ibgi1E4nbg+G5CqGAj1YVYa1AVuvSkdVojNa31DUptajilU0o5qLHu/kSnHI8cKm8j1+T2SXG0KK0AyP5oU9dutPR2DEInBPk3aQKhAMcOfzOkozlvMQK30z7/4fUUTYkJXhqxTRcdQ9gAp7gxyCPYcKQkGU2mXPmdQvl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uwfEP4fw; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uwfEP4fw"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-67e2498f3a7so7304033a12.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1779180958; x=1779785758; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nt0bHv2cN1VanRtf2jDdXMUgy7r2FF0U42NvjdLGAFQ=;
        b=uwfEP4fwB17TnD1YcbmOSGS2i3Y5zsKGMx7E6zKz57K45Sj4VqA1iy07f6fZg4LMJX
         eZeVrTL0XFiQjSpN2QGPQqb91BHVZcyaUxBKZV+U0wf4tmVMlOtgr9FI0W5wgskDJipO
         1rmyGviMWX2ah+MF4S2eMZ8DlJGW5C5ps5b5kyVCY2H0IHBr4Fu8qBSh6GjJA/pyNy+q
         FzeRMqk4q2dQEPlobLkrXXEZKDiBv6W9LVkmpwe2oCjr+JCACHunEpAahJwGKLJ+AF3C
         0Fu36rnG5x9UtggeVUcq14rQUr1wLZqKCtVLzuWj2Rf4NSw6Mcaxz0fpot2ihsPCw/bp
         6jHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180958; x=1779785758;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nt0bHv2cN1VanRtf2jDdXMUgy7r2FF0U42NvjdLGAFQ=;
        b=i68vDr2fMGvzk1CiYWXPem97ww1qfNG3viPY/lwNPXbna8mbeVsWGM+FvkQnyL7w6J
         I7redOtHxKcxM2lR4VUmcmGLu01glnFMrsiUMK8BW2yrxdUCLORmvY9c32vA9eevzdhN
         KHh3C5EgBqkVMWV24CEQzabEqFjQ4j3jrtwb1/ZlS37fuSnAs/WbTqsKxX06FIGf78xe
         2zOgiaKwxG+2HmwXZ4TxIF8Fpl53GhNNI6eeQEeBcBEDW2PjGvBuj+0klUPaf+stG769
         ItsmPyqura3ugouVJi7fdOMQXf8UOChtrOs07lxb6HSaVhv/cuOyOlTvKZok1jg87W57
         KCPA==
X-Forwarded-Encrypted: i=1; AFNElJ93lRKdn/mmNONGH7rM0f39CnGGCi8LqrF4BeW+tHCbbG7RR19avoXOKvF7K5odmqLfv3vbDyg4SXlP@vger.kernel.org
X-Gm-Message-State: AOJu0YxDdBzplcTqUzntXEvBP7vd5UTQKOU3hcJuIbe7Q7jX5HqaleEF
	1QBgg8/Gd1xUZYiI9nB92AcDbWrKI8HpQj38psYuQac4oSp2ThKlpgQ5Kh9Y+uGsSZs=
X-Gm-Gg: Acq92OHWnwZlWk2TUxRp4yOkApgcALIpkF1MMc2YHte5/uf1EAyd4DjOhodo2hO+gCT
	7EdYxI8XZtzEDUtMqEmrN8fuk7fihX8NdbnAjcpcEERQ7fKKE0D8qeB6CpzVRu+4rbwCoG3krcS
	ppIGj0AjbDQtX+MJ34sSbGW7bBxFGKN+HRJMAr40I0WbwVX7BpiMVRUR1/ZgX/C0ZoMp+L2KRky
	TxvfE+DHUINSWXjmZbwjRMXAo+5FNlcoTereqcs0gDfEwZxpfg7fnNKS+pqm5UVFw2VVdPP1bYj
	MybQtQmOdYuHR1ss3IBNqowNj11T1N38Ll1ntatNz0utuiuNy5M5vTAwqfKuTd/R5TgbmDn4uWk
	wvdhyHuPLa/O3OukV6wfblU+O/hB5ceb5gLF+91pIct6iNvrQL0ZiqD+7/Vm6b4LQEU8pG5pnU8
	CVRIbhBYCYPIPE9JIHt+L1kAqGnE7OtIx6wml2X46Ns88YmOk7IG+E0g0hQ/69eEI37hG8
X-Received: by 2002:a05:6402:504c:b0:67b:7d11:758e with SMTP id 4fb4d7f45d1cf-683bc5b72c1mr7689364a12.11.1779180958503;
        Tue, 19 May 2026 01:55:58 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310d58c79sm6291724a12.12.2026.05.19.01.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 01:55:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 May 2026 10:55:57 +0200
Message-Id: <DIMJ0GE2UNHS.VVZVQKVBXBLX@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: Drop unused remoteproc_adsp_glink
 label
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260409181329.556899-1-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260409181329.556899-1-mukesh.ojha@oss.qualcomm.com>

On Thu Apr 9, 2026 at 8:13 PM CEST, Mukesh Ojha wrote:
> The remoteproc_adsp_glink label on the ADSP glink-edge node has no
> users in the upstream tree across all affected SoCs. The only user
> of this label is qcs6490-audioreach.dtsi which references the label
> defined in its own SoC dtsi and is left untouched.
>
> Remove the label from kaanapali, kodiak, lemans, monaco,

nit: Not from kodiak, as you wrote above.

Regards
Luca

> sar2130p, sc8180x, sc8280xp, sm8450, sm8550, sm8650 and sm8750.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Not sure, if these should be individual patches..
>
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 +-
>  arch/arm64/boot/dts/qcom/lemans.dtsi    | 2 +-
>  arch/arm64/boot/dts/qcom/monaco.dtsi    | 2 +-
>  arch/arm64/boot/dts/qcom/sar2130p.dtsi  | 2 +-
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi   | 2 +-
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi  | 2 +-
>  arch/arm64/boot/dts/qcom/sm8450.dtsi    | 2 +-
>  arch/arm64/boot/dts/qcom/sm8550.dtsi    | 2 +-
>  arch/arm64/boot/dts/qcom/sm8650.dtsi    | 2 +-
>  arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 +-
>  10 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index 7cc326aa1a1a..39aad33f42c5 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -2634,7 +2634,7 @@ remoteproc_adsp: remoteproc@6800000 {
> =20
>  			status =3D "disabled";
> =20
> -			remoteproc_adsp_glink: glink-edge {
> +			glink-edge {
>  				interrupts-extended =3D <&ipcc IPCC_MPROC_LPASS
>  							     IPCC_MPROC_SIGNAL_GLINK_QMP
>  							     IRQ_TYPE_EDGE_RISING>;
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index fe6e76351823..c5976e19fc4a 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -7483,7 +7483,7 @@ remoteproc_adsp: remoteproc@30000000 {
> =20
>  			status =3D "disabled";
> =20
> -			remoteproc_adsp_glink: glink-edge {
> +			glink-edge {
>  				interrupts-extended =3D <&ipcc IPCC_CLIENT_LPASS
>  							     IPCC_MPROC_SIGNAL_GLINK_QMP
>  							     IRQ_TYPE_EDGE_RISING>;
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index 7b1d57460f1e..e44a42173d2d 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -2795,7 +2795,7 @@ remoteproc_adsp: remoteproc@3000000 {
> =20
>  			status =3D "disabled";
> =20
> -			remoteproc_adsp_glink: glink-edge {
> +			glink-edge {
>  				interrupts-extended =3D <&ipcc IPCC_CLIENT_LPASS
>  							     IPCC_MPROC_SIGNAL_GLINK_QMP
>  							     IRQ_TYPE_EDGE_RISING>;
> diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts=
/qcom/sar2130p.dtsi
> index d65ad0df6865..3c9529bb2f76 100644
> --- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
> @@ -1612,7 +1612,7 @@ remoteproc_adsp: remoteproc@3000000 {
> =20
>  			status =3D "disabled";
> =20
> -			remoteproc_adsp_glink: glink-edge {
> +			glink-edge {
>  				interrupts-extended =3D <&ipcc IPCC_CLIENT_LPASS
>  							     IPCC_MPROC_SIGNAL_GLINK_QMP
>  							     IRQ_TYPE_EDGE_RISING>;
> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/=
qcom/sc8180x.dtsi
> index f45deb188c6c..6d36d377e05e 100644
> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> @@ -3755,7 +3755,7 @@ remoteproc_adsp: remoteproc@17300000 {
> =20
>  			status =3D "disabled";
> =20
> -			remoteproc_adsp_glink: glink-edge {
> +			glink-edge {
>  				interrupts =3D <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
>  				label =3D "lpass";
>  				qcom,remote-pid =3D <2>;
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts=
/qcom/sc8280xp.dtsi
> index 761f229e8f47..416991bf9cba 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -2956,7 +2956,7 @@ remoteproc_adsp: remoteproc@3000000 {
> =20
>  			status =3D "disabled";
> =20
> -			remoteproc_adsp_glink: glink-edge {
> +			glink-edge {
>  				interrupts-extended =3D <&ipcc IPCC_CLIENT_LPASS
>  							     IPCC_MPROC_SIGNAL_GLINK_QMP
>  							     IRQ_TYPE_EDGE_RISING>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/q=
com/sm8450.dtsi
> index 03bf30b53f28..ffc4ab021ad7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2798,7 +2798,7 @@ remoteproc_adsp: remoteproc@3000000 {
> =20
>  			status =3D "disabled";
> =20
> -			remoteproc_adsp_glink: glink-edge {
> +			glink-edge {
>  				interrupts-extended =3D <&ipcc IPCC_CLIENT_LPASS
>  							     IPCC_MPROC_SIGNAL_GLINK_QMP
>  							     IRQ_TYPE_EDGE_RISING>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/q=
com/sm8550.dtsi
> index 912525e9bca6..e5dc3dc19f04 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2797,7 +2797,7 @@ remoteproc_adsp: remoteproc@6800000 {
> =20
>  			status =3D "disabled";
> =20
> -			remoteproc_adsp_glink: glink-edge {
> +			glink-edge {
>  				interrupts-extended =3D <&ipcc IPCC_CLIENT_LPASS
>  							     IPCC_MPROC_SIGNAL_GLINK_QMP
>  							     IRQ_TYPE_EDGE_RISING>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/q=
com/sm8650.dtsi
> index 1604bc8cff37..a4b71fd3ca14 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -4486,7 +4486,7 @@ remoteproc_adsp: remoteproc@6800000 {
> =20
>  			status =3D "disabled";
> =20
> -			remoteproc_adsp_glink: glink-edge {
> +			glink-edge {
>  				interrupts-extended =3D <&ipcc IPCC_CLIENT_LPASS
>  							     IPCC_MPROC_SIGNAL_GLINK_QMP
>  							     IRQ_TYPE_EDGE_RISING>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/q=
com/sm8750.dtsi
> index 18fb52c14acd..63fcc6c749a5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -2217,7 +2217,7 @@ remoteproc_adsp: remoteproc@6800000 {
> =20
>  			status =3D "disabled";
> =20
> -			remoteproc_adsp_glink: glink-edge {
> +			glink-edge {
>  				interrupts-extended =3D <&ipcc IPCC_CLIENT_LPASS
>  							     IPCC_MPROC_SIGNAL_GLINK_QMP
>  							     IRQ_TYPE_EDGE_RISING>;

