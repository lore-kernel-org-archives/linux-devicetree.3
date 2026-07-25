Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E369E212542
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784983624; cv=pass; b=CvjyG/JgxuQ7rXct4zaTjIyFYk9wzaEP5QGhl4/P1TCEjDsfmuY4ThhQ3CHEnlkwVd3sfd+WDZm3UAi5z8Sj52kChC7RJgfA1EausDA1gzd0G/ZiJr+JlHevst0AWRUiDUp96NC/4QmakC53a3dCfo3/O/m4lfxO98LnmSRVp3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784983624; c=relaxed/simple;
	bh=OvrNT+93qZFUenq04qZyqRBg/XnwRXOAV++TlHjqWj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sDE3UqnREo9mC/YeUI9PrxpTerExWzdKGMWr9y+Gk/UesgGfW0BNKEaxAYBPcjHzZgkZatSIWDlAmzwG/AReDK9XacfRSmg7r9YonCnFTUCzMlzbMUKCFvhsLkwATFhhsf7Y7SAqtMx8GJEtmYYU59i/mo+wXQI1xVHrW9XltiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=VDSZ/t6G; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="VDSZ/t6G"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ca88130e09aso935361a12.3
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 05:47:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784983622; cv=none;
        d=google.com; s=arc-20260327;
        b=hePt4j37touhV8A/AZ9udihJ1eUz5wsRVBQSzgg+msHh45U3dWS92rlMaZtN8Z2pWB
         lUlqP0LIrALHo7yJvjRuUKIzuhdjSxRybgPjloP+RAqqjNY8PDy3zN6GNgDJfc6gtQ5z
         yc5fqSIUEOQuOsuACfkP4vpIVklfuw575QCnyCiyI2ttRTVVJD+OpgUR+zY+k01JeTpV
         BCrjZnC5Lv41jdsD2BeJRmgi6/ewgEOKaWNfwMUSH1IfJD2KiUIzB89GhxzgnXFqElTL
         3KEoCtRxRHVVogNtToYG9qabYrT0XYppF41EPR8gCer2YvGAgswKZYaDZM9ttpsF59GQ
         3U4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SABMkpCvnpZQFfCqjkujdH0sHrHtEaNsZiUpRammpMY=;
        fh=avMKm7k/AzFliM5Q1TnkTd0fmJtu/eBs7uwsQQRdFS4=;
        b=PPJ5HJQvAFdM2vZIdVdLQ8Tg5rYyUTZN7VfdC/MB9Jo2Fu/aZXsVZPrnCeNLg+nhv4
         Mggyeyw2ngrqYbzi1Rc7WyKpd9Bp1CsdjdTuegpPj0nZRNp2ND8OpdKQzTpKRmN9MZnW
         tzpPMYw1vdvVOKzIyf1kfm0bIAPbTIl7z4soN2bSglxzxgOcPO+OUXQ0FIsO7VwLpF2s
         ZuAg+bfhQEyrij4qOqZT+JYzI/y1Wk0KTzMBeB7VIpAVFTRlonG4f0PrrF49WsThMEBs
         uBjCgYEUTWOTkMCL+GcidYlfp3Yx2XdzMGCA3T/oASwFzFzsHf7taDb3JLGcLUT2R0HE
         Y2kQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1784983622; x=1785588422; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SABMkpCvnpZQFfCqjkujdH0sHrHtEaNsZiUpRammpMY=;
        b=VDSZ/t6GfsDy310tFkkEXjR/iFq9qAkdkm81dNdcrTPYS/NwS7jGhBzDmc2oNjFKYf
         Op0k+/wMSeABxhExD5CvZntxJ/pDTEAKghPjrO9BYzCktmj9WF5Ae0rgIFuGvbK6BbSa
         FnkGQ+acFaoUX0owBowE3Pn7jgYDwsRMReq1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784983622; x=1785588422;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SABMkpCvnpZQFfCqjkujdH0sHrHtEaNsZiUpRammpMY=;
        b=VLS1Wud+OTPGZVCU+bUQPYldfkgxKnyg1TEHt2DgxC5rhAXoCCAch1C9MNnop3JZsf
         8as7Ts9nSjleZpD8vPfDNQAecVvjQTKFTwIlkH5+1/G9T3PjjBjvyp7ioAuSQwrE9nC/
         jFUzWXCSIv5w2Vve9EJsnmPrk3bSIjHiPESUdUrN0hASVSnowIW1pOeKgtpQgTVGZswX
         hYzvsnSPGqCazzubw3bmovjcsv/7uai41/FiMdW6sZTqo+mxT7Dli+8I+qwqMOtoMnlW
         IdhQ5SZqseWlCBkI2d+KiL/qbGF98mApcpt00EhHFjHAggFLm6U+qbs07flPGy7iQYdn
         eQnA==
X-Forwarded-Encrypted: i=1; AHgh+RrQOxU2yrY3zK1QDszij3NFckBMBg5vITpB8iEAUkzSzgI9prggI/LojVRht71dmyAPrh+eqNGXLKHz@vger.kernel.org
X-Gm-Message-State: AOJu0Yynk0uaKigD50CrrV1BAwi5hAmf8bvdZnB4BINvnAeKpjuRLd8V
	+O1IH+VN8uEe4TMkLhm2RX1NVUA6QL3Ss8oXakBSfGGmUXKh9ozKzA+z8YxQiF8IL/N5hgxij6c
	GONEtkRuO4jnnES/MAnO6Lrw7JQ3M+IsCdxa3k+krVQ==
X-Gm-Gg: AR+sD12/SkhXNAmC03u2PNhU+NxTQSrC2AxYDXJzPn4+vJJKgE2NEIv7Xo2TlfARVk+
	fSBe5cFHG3X/DhnrRCgawPeUBifM0cSPGAsYsfH8qPeXtoaBMUFDyboD+fN0HmIEJnWCDGKOC23
	gPQR6btfKX/d3M0oEliaYsR2XNvfcQugHaBknaEmDiZyboTUOj43e3n11M/ZsCGlwVseMFfjzhn
	FbmfFLLXfJaljZus8leat1Fhdd3WNS0fH+yBEEItrWICkpoqFRPClDpjul4P3gpdOFm4E6jiu3r
	ddtqP5JuaiOIBOmzYOpSmnlJeQjaxvhGsfTasFQvuhr1ZrdUp3unQiV8igdoO+RI3eFQ/T2Mjo0
	EKcwn8WRruY1TrwrceFAyKg3HPanl5EuRtfKiskoZ7NtnRO4XAnyJHoGARW3s1+lOczCTRPtcXX
	noF5A8W8qf+vwyE5neGUoEK5HLr3qY8crv/Ny9KI9NtGyKCqeh+2QbNHWgX5I=
X-Received: by 2002:a05:6a21:918c:b0:3c3:8ce8:1fd with SMTP id
 adf61e73a8af0-3c67e0821cbmr2043147637.73.1784983622294; Sat, 25 Jul 2026
 05:47:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
From: Daniel J Blueman <daniel@quora.org>
Date: Sat, 25 Jul 2026 20:46:50 +0800
X-Gm-Features: AUfX_myLwI7kMfc-XbFzlYvC_Qj91PEJsD-glXmxVIjHTMm2QKWFeYyYEBStVBk
Message-ID: <CAMVG2st=wGNYF0AbqRqadVqJL6x_F8G2u6BJd6VOweQ0nNebKg@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] arm64: dts: qcom: Add x1e/Hamoa camera DTSI
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Christopher Obbard <christopher.obbard@linaro.org>, 
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jul 2026 at 08:44, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
> Changes in v4:
> - Implements agreed port/endpoint bindings in CSIPHY series
> - Depends-on: https://lore.kernel.org/r/20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org
> - Depends-on: https://lore.kernel.org/r/20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org
> - Link to v3: https://lore.kernel.org/r/20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org

Superb work Bryan! This works for me on 7.2.0-rc4 with 'qcam'. I
support integrating this dependency into 7.2-rc to reduce complexity
later.

Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100

Dan
-- 
Daniel J Blueman
