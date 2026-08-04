Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB93D35AC2C
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845506; cv=pass; b=iBeurXCLXalb/vze09RNK66TcNKkRwVwFSPEjUbQ6WmWao2YueFR3k4aXVNeEat/CJcOo6Z8bK8/RdUv+Rb0ZaxsjeD4LYvvYuqy86cDMCGr3EKHDXyhSlgqaZ3SJ4lxSzC6A5DgCPJxE3fzgPT+mFAjwje69G0Drq5LDi2IVlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845506; c=relaxed/simple;
	bh=Vc2K8K3/wO2xt9lWIqY7aV8z8TRWb0/Z/YFUuOsyxKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jKJ5hVKhn6+xiPuMl1WxVZlpDmNm+6db8IJZYbwFPnpvAt09ZHVemyLsQRZI43eG2GiOaDiU5kbolE5QHq9T8W6s8/JStXRAUnjTqTPHMYNCJiYYH0cKFNmUmlq25kDuZVDUaF5AlWvOwSsicCuki+oVbrCH5iiHXcEhXPA5D2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WSTeQaj9; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WSTeQaj9"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a063d211ebso5656048a12.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 05:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785845502; cv=none;
        d=google.com; s=arc-20260327;
        b=GFYxaIeS9phNK5JEHdGlR8oHJcANsDcp6E7XSU/1otWsaB2WbuJ9u3UTo11yP/tGL7
         tOUZwyckWEBKomNohMg0F49Z4uy3jAngw9PzN/f3bw1ON5DKQbrz0/Unu1ksCAKM+i22
         gMwjNZ2BGTHfTM2ZcvWFnvs0obeFG3I0P89McQO3jAcY0rd2omO45ASPNmS7N8grlhY+
         DRGfXDogyRiMm2iblGsS8oDugcHNBsXRCP007gEm7maRWtR2B10fg66BVtaZy08fOo8n
         5/fI7An09D23r/uI5aMzSysfVM2c3pjqLcmin43Hic24ApKKD4wowBUiiKpCx9otNZIg
         OeOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z0BOXxAbTVuGKMQNaanorzcfB9Bd3BBit6YLVIa3kYc=;
        fh=bmd/785KDQgaUXlbeGcqHsBk3ga62sAJKxI1XVc9v5k=;
        b=rYav9NesHwyzCYPDtW0+Kn9tkoMyNciCyxIirTXA0NE3ofTgnNnuV8hHIzo2iFdUz1
         I7/Kk6URmWYC9KEIcyil5yrHYKr92QJt7WsxyjOvr/1/Or9Rs5P2MoIz9e4LI1ZjyTf4
         wa2e5hMwalZFf1LQqTes8O7IsucmwGUUjjN0J1RpXRhi8Zz9bIibkIEeeX9xjY0FD/0E
         pKIWVpJ263xQSiuWpLz4kRfdq6bRn5BMZmiTOzl4g/qPv65IMQp9B8Z0k1ahAAOJoLZ3
         LPyvv0ZIwOXn0VViNq3GaPUh9iXoB/eSGUbI9bUuohXx3Z+q5UtYBAke3pYK73fKXgiF
         ayiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785845502; x=1786450302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z0BOXxAbTVuGKMQNaanorzcfB9Bd3BBit6YLVIa3kYc=;
        b=WSTeQaj90XqCKBoZlv7SV9OHDQUEqz6sTMi6wDop63SlFs3Ud1BE6IsWQ3VKubdwlX
         KdfpsOhOXmjdlLbVjQnLlF96zMKI8+VqWBEK7FijvFkvkrsewXGKKFTW3ej5jwKwrjJO
         jAEU+zydwTcnL8+XJ1v1nykknetjnbN7ZQundPJAL4/AC709aDGipyESJIhJxIxnw/dY
         Z6voUGFAqnPgtBngyyFlY6vufhfkJQNRLnSdJ7d+inD89uintMlsv4+KeN/JEIV+AUi1
         8YXLiCeFS1w2boZfIS3gOGStIgMSSQjTPzdpXppVlY/vfNSPc6YiSFoekE59xuEbBWiE
         C9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845502; x=1786450302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z0BOXxAbTVuGKMQNaanorzcfB9Bd3BBit6YLVIa3kYc=;
        b=XYSK/eLJKgPq+GqWc6+FwpxL7bPgzTlAdkn5ak35MPyHtt/NhqauPn4nAO/Vyz7kFK
         q2hzxDgso1ixuyAZyzqx1vq0Zg398O1M264WNOy6GLFqsAA2rO/gnWBFwqV8pave+kRe
         wgbAhhxVThqBEAnVZFppL30GgHf7JRnxqC7rO3JJANR4DFgv6Betg8UVwY3isBxTaLMi
         IbJLgjc06WxSFx5G4uElbKiSP4S7ktUJgrt0wljfJpHFiJH5fRwJnS/oqpzahFukxU7i
         1O2RJ31yfPgkZScy5auJJLmdXJkNiHeT+LnZblzE5UyydBHKF00A1n0aXEIrMLJIPMC7
         8U4A==
X-Forwarded-Encrypted: i=1; AHgh+RoKcc5sYIY7ztSNOm3AolgFQVWNJHTNeKaJQ8ef6PfqPWmIn/K2ha842JerkrLk488ePVbQnVdCfZ2E@vger.kernel.org
X-Gm-Message-State: AOJu0YzwQMqahN2+FKne+r09AulIW8tVSY6w4rW25xt8zAyyvg3TDAcu
	SHX32FdN4FnlBC0D1sirWbzkLLHS8NlLZIEaGil1rpI64mkeJK2tI1fRyk2bcSBCK+oE4i25B3/
	QyXtOQO9Aj9kPsKdctbzmL+ZrPlofhKalC0jIO/tqVg==
X-Gm-Gg: AR+sD11DXcba8oRaVdJjVwNuVJci6GiUjVlFbSD3+peoHBXU//FWOXCsMAXCYQ2QeuO
	S/Sx5EczJfHSNjVHjjVJI/bQfF0+0biqscJ01lS+P30fuPhE9e49X+3zSqDSbKVQkRhgTZKUC5g
	pniyCcX0Z4k/YyQtqRiLoU4uSQr9XSgq/oKPTGrfAp6j8xBO3sj5y7MbJ5Btgj3qRrnhycakAON
	3x/SckAD/SJNGxBy2fTHgEQIOz9gysRuW7t4FvbUc/jUiWfggRHgYnsVuUFCtpdl3cc9NiBlCW9
	KYKwEhVLYk/xEsDiI5LFr5ANXLY95rRlXBcvzbFIAU3R8XvtxRabTLz1PuDBjwIJ1+C+s6t7tDJ
	GYPI=
X-Received: by 2002:a05:6402:a51b:10b0:6a0:c826:6494 with SMTP id
 4fb4d7f45d1cf-6a0c82665a7mr6874744a12.17.1785845501833; Tue, 04 Aug 2026
 05:11:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
 <20260801-b4-dts-coding-style-strict-v2-6-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-6-f09a659ab80d@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Aug 2026 13:11:28 +0100
X-Gm-Features: AUfX_mxMUwqUomM84AsdgBn375nan6j7Xy_5FQP7ITXDD-yyX2SPy00_MokSRL4
Message-ID: <CADrjBPouUvFVLDWwDDS=+1EBfqSqUz1HLKcLPLRyjB++vBy88Q@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] arm64: dts: google: Align continued properties and
 add missing blank lines
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 1 Aug 2026 at 16:07, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Trivial white-space only changes to adjust to DTS coding style and fix
> dt-check-style strict warnings like:
>
>   [required-blank-lines] child node must be preceded by a blank line
>   [continuation-alignment] continuation should align to column 39 (under =
< or ")
>
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index edc38f2d1183..bfceea5486f4 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -39,12 +39,15 @@ cluster0 {
>                                 core0 {
>                                         cpu =3D <&cpu0>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu1>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpu2>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpu3>;
>                                 };
> @@ -54,6 +57,7 @@ cluster1 {
>                                 core0 {
>                                         cpu =3D <&cpu4>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu5>;
>                                 };
> @@ -63,6 +67,7 @@ cluster2 {
>                                 core0 {
>                                         cpu =3D <&cpu6>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu7>;
>                                 };
> @@ -1681,9 +1686,9 @@ usbdrd31: usb@11110000 {
>                         compatible =3D "google,gs101-dwusb3";
>                         ranges =3D <0x0 0x11110000 0x10000>;
>                         clocks =3D <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_BUS_=
CLK_EARLY>,
> -                               <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_I_USB31=
DRD_SUSPEND_CLK_26>,
> -                               <&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_A=
CLK>,
> -                               <&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_P=
CLK>;
> +                                <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_I_USB3=
1DRD_SUSPEND_CLK_26>,
> +                                <&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_=
ACLK>,
> +                                <&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_=
PCLK>;
>                         clock-names =3D "bus_early", "susp_clk", "link_ac=
lk", "link_pclk";
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
>
> --
> 2.53.0
>
