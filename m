Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794261246;
	b=L58NTvbqvGxpG5SXs5tJin0X7P9Zb6tfnAWbS1LOV+LNFQRb+8oayuVyhPX4QbJDxQNU
	 EPw9QfOjJ5UOEg6xXtF6mq7/cBePpFgIeSTupIEFnPKMWA0Phn1nx+VxAdoqtZ4QvJ7tr
	 ZES7aGvdnrRUNw+SI2hClb8HqC/CBE3WK7hDLgFwEGJ9shqFBMAj+MPQaXoD/8GCcj/yP
	 ZukJV0e8qicL6jEJoReQqtQo5i5cdaWviiiYZvHm+UpJ7D9AL7Rlpek8hmTwcaxbPkcsD
	 Kb1Y+lvljvg4Hc1a43zG5A34qBpbGCl4kScEEt+NmzsjZ9viy9klZVPni89kYwvhkyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1qMDA86n23QkRHQ7NDzdjzzCwQYU3ppwfnDZcp0lbw4=;
	b=SdyyOzFln4uv7LuVliRNC7D7k/aksZvDSM6G8rm8G3wnkhg2DeKSMzSGOr1/GpSMHXqC
	 HVWUwReDpdYasv4K39B8FOXxnUuzG7EJtRM9s6GdvNGzZ3/R6jP/oAfNGBalqkhiepXXG
	 ySd291XgcEhim//FmR/8ZsAzMyDyW7OKuCQOEVlxi5m/2O31m4bVgQ8Q6d6JJPCSpYMrD
	 0Rc1Avwyr0dyyBalLeME3wGPaWwndpLBmPDWCyCqwSUbDBmz3bGaPQKU+XoF+5aBwfNZC
	 WlGcgU5MkV4ki7q987J6jNaoWrRp0FYJrsXhupJP1zSguR5QRd51hGVuj+HQyGpHiWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JpGYn+ol;
	arc=none smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD93B606A325
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 21:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD93B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JpGYn+ol
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67c0ffaae1dso1557643d50.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 13:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794261245; x=1794866045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1qMDA86n23QkRHQ7NDzdjzzCwQYU3ppwfnDZcp0lbw4=;
        b=JpGYn+olxwP6g1AsWQ5JC0dZWj25OdrPJQSEeGtlGaKzWLxHImPHrLKLik/zep9f8E
         x5Sj8992XN7PYjydp9+BkADH+ehh8U6hx02X3mkJN59R02bg2az9+LivqTORKQ3BG0uD
         UTfCQAjQNf8/XheFYBjWMqrpk57fx8dzoOH3S2YJR02Dd2DHy0iF+KbdnHUPf2m+G0oe
         MW0vG3joKSROH7DL4PJ3voUH5wtCNhx+oFeYdNPVgcDSj3fLJaKEh6h9yf2YiFvO5lG/
         9BwhCJnK/YWyqVp5I6S2vaqemkSVhAou0xGHEQRTGSyLeIbZsGsUIyLkJRXQ5klG+D4J
         aKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261245; x=1794866045;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qMDA86n23QkRHQ7NDzdjzzCwQYU3ppwfnDZcp0lbw4=;
        b=naRLUf9bbwO/1T6MYFsnMxz0Cz1F+FCGX5q71dNQFql/6LyysV2NBmz6XqFxI8b46q
         oE5ltJchuyoetFHrExUAFywKjHE12NhEf6qyS0cDtiqWF5NNomSGNBD9tpo1MzoFXnSG
         nGTasc32YSGD5n8m/r4Kpa+Pd4oYHXoxDkGR9L3prHNZ25l1UnjwOGXMSYxHdpTEABcE
         G7HZ/uxAyyfyq/BB4cGxCZPjPpjbMUjNXQGIzxuxQOBe0v2ZEeXtUX81SFxFvu2ODUVR
         8To3tXakDbSr3AQdkNRy0ZBdjabdTDd4XPrOaqAMCL0UOdgxqa21U5vaSpjFXM+beWyg
         pU5w==
X-Forwarded-Encrypted: i=1; AL+hErG4Wzj4qd9mO2TJ5ycoVtjUMdeE9Ssn0JG/DLw+JxWTSbOR+cchrW7sSum+jLstSIOnY5NS2oMV2Bog@vger.kernel.org
X-Gm-Message-State: APuU4Z80NgnBZWRDNQ5GdEa0zB+LYedkJumPFY8KyupTy9pSgZoxr3nc
	/0PU0dvGOPAYsPfAY17xn75wqC9MXbwnsgJz89Wx7UdP0z6NKsukP9JngIDqNA==
X-Gm-Gg: AYBFou0r/QS4TG1sqKznpFZ9sQfuvBXJhVb+Vzt3qNYQXTBjdM9s7SXtv9AzEurnMjq
	Fo3fXAjYwviQllHVH1qfyV/EJAaKlzGcHD/ylLi6xEloXdsaj6LBHJxnXujym+eOcz1n2qcji8p
	kun0EYJpH3u+lK0V4cKFYsGqywq/7wLm60Vc4mHFrWcKjrDbY+EdBb4lJtrMhqtyO92lvSiSgoT
	DsZf7EpFM/Wvy5f3BlzatSxSC50Fh+V1ySLhylG4KGAdWI0Z9OibKl68M1RHdwHrxcYEyze8ewP
	AC/hBS9/Q7z3sTUh/mkpyUOCwduJjcM1KDc04BjiewY1vX3VYBW6s8VqwFZ4yrIGickf5snsiXT
	ep0ReAaMpiAeBte3Nc0uAbtWaOmxO5iczrQi9QKFNc65K53YWFJzCSAjaqrml2b9I6HB4SzzXGz
	dBDYotzF1kUolYK4XHtwqux8kcQpjsSsX+Os+pIiuHGl2Qjp+ew/RemUH+jBEifidQgXsM2N29i
	edRtLxzcRSkP2/ntzqb3l5vNlm//1+9eDcO8J5vtS4wxqX+jqn7gZHpS1rz2MfToisO6V9pWjGL
	Jkm7FUS9CTXryBrcalacbXg8nh5DyZgxAIvwUQYSIZNVz24b
X-Received: by 2002:a05:690e:4505:20b0:677:c21a:ea51 with SMTP id 956f58d0204a3-67c5711cc8fmr277638d50.27.1794261244652;
        Mon, 09 Nov 2026 13:54:04 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a3450sm334827d50.4.2026.11.09.13.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:54:03 -0800 (PST)
Date: Mon, 9 Nov 2026 16:53:52 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom: add missing tlmm labels in
 examples
Message-ID: <avJA8HhGiFzC-tJM@rdacayan>
References: <20261109-qcom-tlmm-ex-phandle-v1-1-b77b09e6ec9b@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-qcom-tlmm-ex-phandle-v1-1-b77b09e6ec9b@oss.qualcomm.com>

On Mon, Nov 09, 2026 at 04:57:25PM +0100, Bartosz Golaszewski wrote:
> Several DT binding documents for Qualcomm TLMM pin controllers define
> the gpio-ranges property in the example node that references the tlmm
> node except that the label is missing. It's harmless as we ignore
> non-existent phandles but for correctness and consistency - add missing
> labels.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml   | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,qdu1000-tlmm.yaml   | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sar2130p-tlmm.yaml  | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-tlmm.yaml   | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-tlmm.yaml  | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sdm670-tlmm.yaml    | 2 +-

For the SDM670 portion:

Acked-by: Richard Acayan <mailingradian@gmail.com>
