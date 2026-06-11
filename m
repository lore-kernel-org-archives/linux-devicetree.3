Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276DB29A31C
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781155838; cv=pass; b=AACCBWWG+1TF8u6bWCqHlRUMzR4j73XvyeRXmx/yGd/gsISoe/JaQYOgx4T/3/ta/Ezm6qhdWNbK8kvI7+nHnyuImysqEWeC5FzDHSlPjGYVhBimXRwSqjotAfvI7mO1CuIrKgtHEB6bjBFd6GKQBCbmpbaKreTN3xktLQWIaNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781155838; c=relaxed/simple;
	bh=Q773769O9P0PEkWxz/hUK6moYfjQ705w9ViRAFQaflM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SfnBeyEhZF2vz2Rdiwot/wGz/+rY4KbVh6kJJXlTK8+iRLnmCnnm5rOufNubR2D36raKTQpENbJZ58o5eHgQJ8aIyK+WVQgfVDZ1FOzrAhdw5epSNuKQbqABPjlrgyiJqlxwe0MBkvJiso+5dYGM9AsnDUhjTeIZZ16phZuNrs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXE8OmuM; arc=pass smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXE8OmuM"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-963ebce7076so1600527241.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:30:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781155832; cv=none;
        d=google.com; s=arc-20240605;
        b=kBc9TUMp6ASfL6bHMx8aVx4Ierc6akkayHWxM5qDErW8GSzgr6mlrfzIyKQgFQ0VDA
         0O63nWlt7qjeVEorp+8JvIZ3A5/mkPwhGloUbpFOb8CuV4AeVWHOUw7JihKnmNpiKXL7
         a2OHBrDiAsSoc5gBdhkuKuvIQL/b4+nt6EHrzq4N2wmmSkn8RN50oMmjdhCpk+d7yfBi
         IE/GPxAlTrfr7mVgcG9/KYJZ3rOzea5i92Owf4laTTe8kNVvU0J7Ui3M7FQVDbWsiHOO
         JGVHsBPTiC4RVLXz197T/qZR/nfTDttFOyNX7gXwRgWPit8wU9dzI69AapVdrIipgpOj
         h/BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ol4aUhvNk7Xou2fzcXcwE2NJZ2PFeOEVI2xbr2T74rc=;
        fh=V51Y49Z7+4CC8Fk81omr0N6n7atT9CbdTVF7u53sxLw=;
        b=fQWDYaklas8TYBB2RCrGpin8c3D35xbwXKYCMzkwYZ9QMo1T3EdihYvsUPqCSiMFLu
         jV3BlHbn8CR/YcTHlx3L34BOS8O/rqEsa6sBx5ixG19nIPZ1usklSq21SbTXsgBnwDzd
         zxF4nj/lZs5xP5VJM1S6wW4tbb6MGJ1VbGEvijLoRhKOKlHLXkhjCcLiDqsnekQ0PICm
         vLQTcJoY8r80OND0MSPCIS30SqgOIGNbGhC+K2168ZQrsBEu5kaZ9hnrkh4wtK65DJL6
         rhAbEI2Xu79mDSvKOwqqVrA6z4W6pFDtqbdvLVlr29BO0y48nna1fu3/KnJVhESnB4Zh
         2aFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781155832; x=1781760632; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ol4aUhvNk7Xou2fzcXcwE2NJZ2PFeOEVI2xbr2T74rc=;
        b=XXE8OmuMKDC7wNPkumHHw4B7pkKNYbwZDEs6j4IXCRsRDI4w+mNnhYwkUxK0t21WOF
         DOZwEpADmNpkKblzH2Q8d4NplfONwYArxPKH0BgWIPE+8zVak5Cww2xKS1XZox7hahyX
         8sVZt0PNtdssKx0q3QjgfZbfbKI4GP7yMx3YrRRP7PCb9IcIWKim+bRaPCa3nd0731mf
         KssWDJvtoBH6RIZfPjUqp/mN58ePYwRwxp7McqllhTvjycr6WJnEdu9Cv3t/wyPOZCNX
         cwFeLeciBxxTKiK7d3IdC1gHTB2SvacSKYE+ScUowmlt84Vpixc7MNN7gWYfcB0mbJtI
         wAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781155832; x=1781760632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ol4aUhvNk7Xou2fzcXcwE2NJZ2PFeOEVI2xbr2T74rc=;
        b=YTz4VBH4e3iPKorxOcDhNj7KGmneaWulGD5M2LnvaBKpksV9Yk992aZ4CzLPw6rKtQ
         VAhYCbjaCFctgNLcrreJ1Ov4Y/bZwOjWL/gfMQAlhAiaWOlwgW5oBOhpELrJsN2AW1UP
         17tiLEtqHfd6LjE/9SKMpYDTjRQez4UVj09fGwEsBbeOFjs1Ti3NsF16shrlv5ulBLnx
         YAmhZICyfm+eI0BaKPjlmIrTzTYUKaO5iMNFKmQlSo2g83J6Dbp2E3BTsA1PxmsKfDJq
         aaM20DohAwQup1RwrR8HYpXvGBZNaGot4zmhWqqzB3f5e8udXssKwUBeDlvsMaFD/gWW
         wdCA==
X-Forwarded-Encrypted: i=1; AFNElJ/qkg3fvdvpusj01JxZbVTwI/ZdEN8zq0adKGeI23EZjq961V5vK6MM26m0oTZTi/G//UgM9uNKbuzn@vger.kernel.org
X-Gm-Message-State: AOJu0YxUKPI+H3zw2OtM7FrwP2qSdox8kZB1206BhyusuDDG9FvrXDPe
	4Yhpy/iIMxIiI8UMpe+5ShPEdyr1XCss+5M6RTWtH9skxvhV70bGNw81qwPDDhXMIusQe5Oyxp0
	NJgNdqW+qLrlQuMLcf4jtMU3yvrtTkv8=
X-Gm-Gg: Acq92OHzNAEG21ZybF7Ve3Blw4L4YV7WgTXMUeL0THmro48fsdcsP4C7J4iWw90ymyW
	8D8dLFVZgg6vdmT1CA2TzWIY9NBkbumdexnBmeWKc5yqCJyYJBva2pK3O3Yuy1t26X9RGOYmv0T
	UatjUGdcKNxeSxOh162sH/gVO81eYjcQ45vGKSLkYIJP7Drhr5mRY32yneH1oaSMHwBfb6MyrfE
	aCb+bwR0lYw2D9K1NgVUEpCtrzduoK2YYocoecYEK4M1GQ8gKVwecQ1Dunn7HKEjNnG0nbHBypN
	iLOgP25l2a47tDgb/U1gBbRaRxnz6hfVFHXIPi6s6mufWhtZSo8spji3EZUp
X-Received: by 2002:a05:6102:374c:b0:62f:39a9:ae67 with SMTP id
 ada2fe7eead31-71d5ebb6737mr324066137.17.1781155831972; Wed, 10 Jun 2026
 22:30:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607160435.36546-1-mitltlatltl@gmail.com> <280402c0-57bd-46a3-b95c-f9ae02122a09@oss.qualcomm.com>
In-Reply-To: <280402c0-57bd-46a3-b95c-f9ae02122a09@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Thu, 11 Jun 2026 13:29:12 +0800
X-Gm-Features: AVVi8Ceuyu40o3HD-dzKwp_kGIQyqB8dXPSn6NI0LymvcdUS1bhUSGUemAnaeFs
Message-ID: <CAH2e8h7aGiF1g_LgG4WxEj1eGbUp-T_U-yZVpoHgU8FsMOrWTg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp: Add camera MCLK pinctrl
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 8:17=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/7/26 6:04 PM, Pengyu Luo wrote:
> > Define pinctrl definitions to enable camera master clocks on sc8280xp.
> >
> > Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 56 ++++++++++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/d=
ts/qcom/sc8280xp.dtsi
> > index a2bd6b10e475..0dbcd3069a3b 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > @@ -5484,6 +5484,62 @@ tlmm: pinctrl@f100000 {
> >                       gpio-ranges =3D <&tlmm 0 0 230>;
> >                       wakeup-parent =3D <&pdc>;
> >
> > +                     cam_mclk0_default: cam-mclk0-default-state {
> > +                             pins =3D "gpio119";
> > +                             function =3D "cam_mclk";
> > +                             drive-strength =3D <6>;
>
> Other platforms set this to 2 by default.
>
> What's the value set on Windows when the camera is in use?
>

It is 6mA.

Let us get ctl_reg first on Windows

lkd> !dd f111000 L8
# f111000 00000284 00000002 000000e2 00000000
# f111010 00000001 00000801 00000000 00000000

ctl_reg =3D> 0x284

in msm_gpio_dbg_show_one()
...
drive =3D (ctl_reg >> g->drv_bit) & 7; // (0x284 >> 6) & 7 =3D=3D 2
...
seq_printf(s, " %dmA", msm_regval_to_drive(drive)); // (drive + 1) * 2 =3D=
=3D 6;
...

x13s should be the same as gaokun3 in this part.

--
Best wishes,
Pengyu
