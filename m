Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793915879;
	b=RrAqowGr5FyjFCHVt/PjGOY+xE1JSJ4RzV7/ZYLgRai7D9v5+59fUBRZVj2zCPF1/FVS
	 B2GLXL690DimBIhDhbPgz41ozZfECHi8VpWWNb/R1UuLtwbFOeGyd+XkLRNKopQIbaBS/
	 +08Wvov8SBYKAR6rs0Nn4Dwik4l97IAj9QAAaD7h7NHUMtdoD11+1koJXHpQETg20VqCn
	 m4ch+m78JB91xB5GAJgak1SutEuflEhzowWqMYGNHesdYy3aesul6L7LZIRC8S9X5qc5b
	 iNoIPR4n/1LrGGoj5kMBC8U6zo+wwg5fG4+wVUx0LB+U7wml/6+AvKx4Sef7apO75wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915879;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=f5e+r6C+Y+boKKU1c+tSb6Bf3yIjeJVK+Xx6iJaNfGA=;
	b=aYIRRTAhmoQi0E9bjrOySSudkGoA1fVCD8p2unEcvwBAviUzXQhacwFVpf3GgZEFAuVP
	 KI2CXwvwNUoEAyejUYHFDSIYm9/IAGOkFRaaD+QaMwlLgFMC88hFmwnCreX4ybvhu449q
	 wDDtOyXKytj53BH1gCbwzIGCJUnkQwEAWG5Vkgn/Nj9KTmR0k0dc5r39WWMj7n+OHb0wv
	 p8KR3Dt+42b7ttZGBBn4WLt9mzc7MXrnGv99KAfIX1SGCckRPbfmPb9YJkeKZAsQ7xJMS
	 29Z7uNzRPdtMpZbUBj51Bt4eCr+PU8jdEwwHZB1TfjIBIokeG0lvMSiF4KE+Z97Vj2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59D6606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 21:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D59D6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c315869241fso370206066b.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:57:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793915877; x=1794520677;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5e+r6C+Y+boKKU1c+tSb6Bf3yIjeJVK+Xx6iJaNfGA=;
        b=Df8TrgFVttfgx5dGESCiUP8jWKudy7WfldVHWvLmqBSFnIMcsyZahysVwqSqWErJZf
         IEb1QtYu41iCMuhnAPWAu/nrmgYGIaCrrT36noLxAHFAQ4TvaW9qOq9bivNeXBpUdmLc
         o1JW4P2sHawLYcb2Sfyv90ydO0I3zoDyludTmaXKMy9cbcDiU4Vywn5TY0UFDugf9Ymx
         O7Z7YeB4gHbLjup7v5PLb/zwzkewss/aucZyHh0q6MePxTK6V397BVHNlU1UgpGcDVAu
         PDi5fnK/I72m2dCy9AWf8CvpQpGnMWSjUw+Y2pgmDaRszeCfeWijgpVT/ykhsImtYS9w
         nk/Q==
X-Forwarded-Encrypted: i=1; AKwUvBw4aH737oRUwyjoLfTcxaWW/le5b/b+ckioRnJRMicxCugqFnXKxYQrHvVIUGigyPzBQo70eOLRqddJ@vger.kernel.org
X-Gm-Message-State: APuU4Z8klZBnY1gX3iI/P/+wgaM/z2SrcgIwbInRaSwOlhqs8PyzTGXa
	DCPjKGy34/78eiPPq0/6BBeHqQdabjX1CYe69G5QgiEFTBZgNHQ2cBMbh8s+YBTORoeenw==
X-Gm-Gg: AYBFou308JJes0vCA+5GPIukplPR5MBA2FTnrr5vbKSbYd0LOIwccZN/sfG6ypkF3IN
	td/cRwrIpJ2HvY0ub5cf3HbLxysgwN/Tllp20dFJiEshGiVsDjIKsCyyi4AKKEODo/DhwW+LiR2
	+EYdEK5hjkM8qc4hbJLidKqGzaXIE2du6W8eVSgNY/g2Pb2QHKvy6f5Nx4tbsl3DJE4Fmt2ueNh
	7Opy/ouX+aJAzjwfqyBjG3+WnlaNd70jOh1Exb6CUozFVv5n+GXOZRZUky0rdiq5W7cNlMZm9/Y
	advf195pxjYskflra5aCBGnpKLOMt8DFLDcxzwFeNVwhi3HZluecnAUOQpAtEgJVoH7qjAAyIHA
	FFBuznT6YB6MYPUtkM3mNY81T7e0krbmePcyCehpR677utwRptDAxecKLgLdFIa31qoBzzhy+x9
	QFm+JzRLz6l+B6ILVfGXn/ochYIpfm1F4unFCe6VFa30th+WbV8B28e1T34+LSYqcVQSEdgMuHS
	uIaE8x8VrR/YAur2xG40eo5NKdrR/rhzJ79vX4Hedt8QPI/YqZprPkNyeh5vbz/jKXceANz4VXT
	vCXh3Mh0aM10lajgAINi0y/oC+CohsfzIuuWW6OIOp2504e8xOoU80vgo1I4BBKORBw=
X-Received: by 2002:a17:906:c113:b0:c40:b477:dfa0 with SMTP id a640c23a62f3a-c4d35446967mr58339766b.18.1793915876992;
        Thu, 05 Nov 2026 13:57:56 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356ea6e6sm20249566b.84.2026.11.05.13.57.56
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:57:56 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4ced671398so370602966b.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:57:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxvYB/YIdlDUy9UxH+9EkK5bEwbSR0KIjd8yoSr3D5WrpBqHuweT4wmREwAuLih8LcxK/Zh6dODs4uz@vger.kernel.org
X-Received: by 2002:a05:651c:a14c:b0:3ac:ddd9:7820 with SMTP id
 38308e7fff4ca-3acf3b201eemr1185331fa.15.1793915531874; Thu, 05 Nov 2026
 13:52:11 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sm8150-ice-rfc-v2-0-d697bbce0278@andrewgigena.dev>
 <20261104-sm8150-ice-rfc-v2-2-d697bbce0278@andrewgigena.dev> <dxb7s2d25ixowmfifhvetctpckj7h4y5puiai7orhkimgj7uxu@ekhwvpm536mk>
In-Reply-To: <dxb7s2d25ixowmfifhvetctpckj7h4y5puiai7orhkimgj7uxu@ekhwvpm536mk>
From: Andrew Gigena <mail@andrewgigena.dev>
Date: Thu, 5 Nov 2026 18:51:44 -0300
X-Gmail-Original-Message-ID: <CANn8UmeS0Fvdkamzu0Cgbv25+WdjHsXvCLMpsL98QSo-Gd731g@mail.gmail.com>
X-Gm-Features: AclHuK9TNVNMsMH-gS3LyhmcwXP0L8JEpTnOqnWuyNklory8rcuhuvvX8_jSoFw
Message-ID: <CANn8UmeS0Fvdkamzu0Cgbv25+WdjHsXvCLMpsL98QSo-Gd731g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8150: Use standalone ICE node
 for UFS
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Andrew Gigena <mail@andrewgigena.dev>, Abel Vesa <abelvesa@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>, 
	Stanley Jhu <stanleyjhu@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Andy Gross <agross@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I understand, I'll keep that in mind for future patches. Should I
release patch v3 removing the "Tested-By" now, or wait for other
reviews?

El jue, 5 nov 2026 a la(s) 5:56=E2=80=AFa.m., Abel Vesa
(abel.vesa@oss.qualcomm.com) escribi=C3=B3:
>
> On 26-11-04 18:38:13, Andrew Gigena wrote:
> > Convert SM8150 UFS to use a standalone ICE node.
> >
> > Move the ICE register region and clock from the UFS controller node
> > into a dedicated ICE node. Reference the new node from the UFS
> > controller using the qcom,ice property.
> >
> > This brings the SM8150 device tree in line with the standalone ICE
> > representation used on newer Qualcomm platforms.
> >
> > Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> > Tested-by: Andrew Gigena <mail@andrewgigena.dev>
>
> Tested-by tag should come from someone else, other than the author.
>
> Authors are expected to test their patches by default.
>
