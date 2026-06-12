Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172742EF652
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781271986; cv=none; b=VFldex3p/4To5dVByMhyVRi3Jt3MEILQgCqypbRgiO0Xtc6Ep1YMXx08Cyzb04HyUOaSuSac3s2qcdiQzeYa6fYt4MMMFsyu63T4+5ose1bLxJ1GgJNJEF06ti88yCT5bcfp7ujTpFyNAf1/eYGZPIqdmh6OrD+Ufz1Qs5gSDSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781271986; c=relaxed/simple;
	bh=f8j6pTQh6YCRHfsD/tvylB4gaZX50h6BTuMcY7i9jI4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=TZex0YCGEBaSP6KI70Ck/Ro2oqesM67thAiYz/Fp/mQNe0zkQxHx6THoF7RLrcdfNiOEdt9Dec2stHTPfuBNsoMgMfE1kUqywXXX42UOluX1GzmJuzdCfGgeil07m1fYY4tkuu6kr/3BoqVT/jm7WaKbQeSIByiTrrJ6nxGGD08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=HT4Zui4c; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="HT4Zui4c"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68b90fc6a1dso2067049a12.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1781271983; x=1781876783; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylCRDVWR0E0OMduxXy2JHO34dLyiiO1L7Ze1awwPVa0=;
        b=HT4Zui4cT3cg+FG7kaRP00saJYnbrMS/19SeAguGZ7ETq8q0Tk9oZaYh394GnqrXBH
         RtqLYGY5DwGolK+RPfqJ2GZ3oBKlzDUOBY/Tp+/Pqgx4t98CBuGErJVKJRlSBNloLxCj
         UzYOeFpFw+7VUNatoVt4m3mcbEAdZgUVOxPiyJVO6DtnoOXAmJ4RSgnI+iqC7766FuGc
         peaaujGXIRKUpKV60dv1PclYlk14kJZn+wEH+x5w9grmuqz7x9OtBEW8FCuFDJWWS3cs
         u7JSg3QWP+ZuiXVbsVD/LMmkk18ZknbTR9bcqlhB3FJbVFDJmG2tuodiY7wTa+9wJ75S
         K5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781271983; x=1781876783;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ylCRDVWR0E0OMduxXy2JHO34dLyiiO1L7Ze1awwPVa0=;
        b=VNLja78Da53NX8LZHEwpnt0guoTzzIkKs9XZy/1lre+JT+k348JDWCV0kaAY5BCWr3
         tR2610T7LU5ZBKg1+UeH+nydYT/TmK3ltn7rzgsuW0XvWsme6613tKsIgC+53rgjIsB5
         qMRKMFWxwamRYyKU5Nt0vGyce/gIJMyVYGctKAuRvs39a8HoJYJ0y8p5ptuDT8DuSRPC
         ZSCuCcqXU79hVhhO+NmXM1arwIhEh7tLPTqZfk/b4ErDMd8hqbDgDa+yL+Q00mzzZ1fd
         9Nw6sHLosn4StojHMEoEKzp34Wi/4SdvDZ09F95aZTNc56JegCFoAjjd+hcqMM2zqU+G
         YewA==
X-Forwarded-Encrypted: i=1; AFNElJ8gMUM4IEppE3u87lp5B6UkV+tXEDji+m7rUHemWRcZ/p94ElOLBWJrYbAH9yGyph+Y76rjVPHCn1h+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4QmJv/NsHir3OnSFZVZctqvTdeQLxKWJ9z02du+necyAE/mXe
	jWEpFxsJPl4ruEa4PXrfIz84eARsWg8pWMn1nAuIvZA1UXkXVdgmjfZfS3L2qVU5iHo=
X-Gm-Gg: Acq92OFvngceDqIOs5lcudzg/s8yBnmLPckzXOyd+7LnMUM3/S9hEHVRZsiiWT+HaZv
	LyaveIBb+YMz+DF8uVHc87gBwOZhMlRU1BPXa1DWw+r72PYTHJ7gBzxbTly2RZMAomPbQgzXjuB
	AMhswIeP5h4wyKoysEeQiUsc86H2nk0PLIs6n6PinTTbxTxYCBzeWVD4oInLQryWCxieN1dnUfi
	fG8P2ffP5Ze6dlj2mTEg179TTp3/DfF4nOSm9+sszJMSPZhNlPw4+IgbXCdLw1LfFjeM0t42S5E
	F8fEa2tosA35aR0oanz/Jm3kXjei5RcwCWIo0UGy1aazwdR+F40dwDqgiE2nVbrK+N/1k0ZyAF4
	7hzkWBwTSZ0YSrhAsIn/fydMNJ+8fDLA51s0d4K60BgjbsDA9PTa3DtRb0zBu6sAznUTZB4YogM
	CtH1o/mua8TrLV4O6ganXdB318S2HnMdRwtTXqo4fAmIukrwmUIuM1v7K+hQCdMetyachCN3EKe
	wUkERT8BIHc0hN8y/5cpVLTxZf0s7AzRkgs1w==
X-Received: by 2002:a05:6402:1f06:b0:687:2ab9:f4a0 with SMTP id 4fb4d7f45d1cf-69378daf678mr995497a12.5.1781271983463;
        Fri, 12 Jun 2026 06:46:23 -0700 (PDT)
Received: from localhost (2001-1c00-3b89-c600-b4d0-bc9f-f60e-913a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:b4d0:bc9f:f60e:913a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937948fc99sm682580a12.23.2026.06.12.06.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 06:46:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 15:46:21 +0200
Message-Id: <DJ747VLQEHIN.Q3SS1FFC9I3L@fairphone.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Sort pinctrl subnodes by
 pins
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
 <f05ad4ae-140a-40a7-a6ef-9ac2ddb0a939@linaro.org>
In-Reply-To: <f05ad4ae-140a-40a7-a6ef-9ac2ddb0a939@linaro.org>

On Fri Jun 12, 2026 at 2:59 PM CEST, Vladimir Zapolskiy wrote:
> As documented in the "Devicetree Sources (DTS) Coding Style" document,
> pinctrl subnodes should be sorted by the pins property. Do this once for
> kodiak.dtsi so that future additions can be added at the right places.
>
> No functional change intended, verified with dtx_diff.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 1382 +++++++++++++++++----------=
-------
>   1 file changed, 691 insertions(+), 691 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> index fa540d8c2615..62daef726d32 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi

<snip>

> +			qup_uart12_cts: qup-uart12-cts-state {
> +				pins =3D "gpio48";
> +				function =3D "qup14";
> +			};
> +
> +			qup_uart12_rts: qup-uart12-rts-state {
> +				pins =3D "gpio49";
> +				function =3D "qup14";
> +			};
> +
> +			qup_uart12_tx: qup-uart12-tx-state {
> +				pins =3D "gpio50";
> +				function =3D "qup14";
> +			};
>
> I understand and support the intention to keep this change non-functional=
,
> but this pad "gpio50" is for qup16 also, right?

According to my QCM6490 data sheet, GPIO_50 has these functions:
* UART for qup14 (OK)
* SPI for qup14 (OK)
* SPI for qup16 (no pinctrl)

>
> Similarly pads "gpio54"/"gpio55" for qup14 function, "gpio62"/"gpio63"
> for qup16 function, I find all of these are missing on the original list.

GPIO_54:
* UART qup15 (OK)
* SPI qup15 (OK)
* SPI qup14 (no pinctrl)

GPIO_55:
* UART qup15 (OK)
* SPI qup15 (OK)
* SPI qup14 (no pinctrl)

GPIO_62:
* UART qup17 (OK)
* SPI qup17 (OK)
* SPI qup16 (no pinctrl)

GPIO_63:
* UART qup16 (?)
* SPI qup16 (lane 3) (?)
* SPI qup16 (lane 5) (?)

But the GPIO_63 looks weird, is the data sheet wrong?! Where would
UART_RX of QUP1 SE7 go? Maybe it should be UART qup17 and SPI qup17 and
then SPI qup16 ??

Can somebody at Qualcomm please check 80-20659-1 Rev. AM and maybe make
the apppriate people there aware?

So yes Vladimir, you're correct. Some pinctrl definitions for those SPI
QUPs are not defined. And the datasheet seems wrong as well.

> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Thanks for checking!

Regards
Luca
