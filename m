Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793446957;
	b=foi0teuyD6TIEB+GIPpzX8H21H5TY0gqi7W+bKx4o9oNpiwuyboV4i36WZOCMkmeqwyP
	 VGn6Kkjp4pZp70OySP+gOU/vnoM/F6l410odrZ9eR9DaN7kESh54OmIs5UWpsS12cMvBR
	 ZrtY7NZn2FRTf924bioLr/Fzu/DR9eDJAUceYZo2UXAb50tJBnu2q3eulo2hdyf2wUg2G
	 hMypCs3PsS970sMVK0b7oO8SkjKjszxBexD7Fgbb9NeWLm5memZ2C9JFI5L3yITkmNPVz
	 AcpF2NXzP7rfzfu5jhu2tJiuJdJUTqpMPam9e/iHyBDzB4nQU57evAGozN2fUuPTJFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793446957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=upwfxi0DBGFEpM8kAk0eqTBac2ACweYPhkRwvSbMeZg=;
	b=EAF0AlatOxjtsGefxlFTZrpElEGbKp2fn8TvNO76hicMLlPDS9YZTaD60KArrapNSo9P
	 T+4BwpivkxXfL7K/zj1HmRUeoWrY9QsEuxa+wYsW3PWAgerK0a1q1d9J6y4IuscDN2B1A
	 SlHU2QrZJQHJ5Vvp4fLP3E2BWqEPK2zznUnOL26kMBS71Y5ZsacrdluEWZhuOrE1EFaxl
	 mVIZHhiQjvNZGvLF5poBFsKpbOJ5qMec3RDowZK9nNFchrlPYQItxarzHQbWzTY2d7QY3
	 OL4DghBcF8alhGm0JNVBo19TDqoa/y6wn1jTCngXoEalWNAxgWWYGp3hy40XMbNbkOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NkoH1ROu;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C299606A31C
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 11:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C299606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NkoH1ROu
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be4716d76fso226296e87.2
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 04:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793446954; x=1794051754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=upwfxi0DBGFEpM8kAk0eqTBac2ACweYPhkRwvSbMeZg=;
        b=NkoH1ROubAkIWDPJ1im0+DFkTYQ+QDsHYpHJ1b8JVv+AUR9kcj+duOMIfsmFLCq1qK
         enT3w2pAHrpQwp47W6dI27rwi8EKz3Iym3s5uKJMLdj2KZj0A/NjGOeM3+lHpRb/LdSq
         08bXx9xCxLgeuqrMci2rD+XbGl1mFl62Uez72WHtSsnnX+HEyTmEV4tDW+n0x6alneih
         VqRZSvP6mnGJy7CI3mEWU3+ity1xemK5Rfjr946pzrYEcW6GZtcUOqgZKRBRD7MmnrHW
         OZxvZpWCHTlwzTqocCke0IoUBhtBN5m9ZqSbDbFUxPTzysYHxj9nCiT1lcBDF5ZuKL0d
         W9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793446954; x=1794051754;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upwfxi0DBGFEpM8kAk0eqTBac2ACweYPhkRwvSbMeZg=;
        b=mXabQUc0BwjVtc7MdyJvET7ir1N2AYEo0weL4yGYpRCplz7QbbsuL2E412Oz8NtSGO
         t4Nwvrz6rpSdlD4+Ptz+WLi96NozzElzUWi6CXQMZJN+UkgECFqQ7EX9GRb2X02jM5SG
         XT/qEN0PN+eIvXXzU1UtUTxWbKRLhTRT/Q0q6uljkkCq+7br/A3TcwdMWwLIa8qfKvFy
         25pQCyUSJGjKqPUXudT0v4IZ7hhFosBDYfGBvh6eW0SsowD1fKoApX/IQNSu4Cca2gEX
         jBVewvrtRix6pqwNRUPFS0Dpy9WNMnTxyvyziYxcW3i45r9gvDAf2iny5eN+PZuRIkBX
         9kvA==
X-Forwarded-Encrypted: i=1; AKwUvBz3TIyaFhEwjSOPuooVH51VeOCxmgAjRm+j7o4fY/qjv+vkHXVp4aTFthJbRT3PWJeS7S+WCLfmm+2Y@vger.kernel.org
X-Gm-Message-State: AFq9FYI1PqlPkctpE+9a7jBq6Xmlzvo38kAnrFmV+2LgHN3xpL/CrzxY
	LDgFT67hkorKoPW9AuiPiKnK4RcuoU0pVUesMxqUyCVuewA60A6FiKQifXyVXzoW2cA=
X-Gm-Gg: AYBFou2L3afWnuUSNyp7baTilVgcaqQEoONwgkj4z8fx2iY36nJsA5vL9OU1+25SK72
	0OKAsaKTeHF0+YAooxh4UqizR0zQh/98HGPTQnODEhbG1JQIDP2t6YOmJKvE6FuKYVDn3upmMX6
	IrhWX+vB8rITVTq38Mn8odg1K7QuogPLKIJk6n1WPR3sZbmEBkWVoCqcR7iuRcgj8qtXvp0Z+N0
	lvZRfDhGLXe0RJbscIn+hwRaWIe5GPaMlQqJg61z8s/XdQZ75CPapoESgUDPWzYNSyoNps5pLcn
	dB5ub4CGtm6W0kxus5BvttnoHnIKUQJvb7i9E1OKlM6UJzoswVHqEI58CN72lqV0s7u4zEjiUyd
	DPXtzs39DAf/pfTdfqAWa/DZo+rvWrZ+t8TwOJkOjvJOd6JElPOg9wnxsxLCFD0hFgER7nFPvVB
	LoO7Cg7xXLTjXa4S/tQNt08f7fJ0pZNUeCWN26VXaZQ8tzd08G1kFz7MnZ8/kX8mzwexl+zMI4/
	8T7o7M+RMiuB5VdeR46/0GhUdtQM7jOfQthmsXaO2wjRt+j97yVvmBHgf7DYAnfnO5l2rmhe1JM
	Rfko8iUQxhymDWCCHnxMF8qz45ST9g0kUQjPhCUHynNTwwTUW7UDK+GnKtcNsCA2FamtKPEgoQY
	tL0aduMY=
X-Received: by 2002:a05:6512:220d:b0:5bf:b8f1:80ce with SMTP id 2adb3069b0e04-5bfd9578721mr1660720e87.5.1793446954460;
        Sat, 31 Oct 2026 04:42:34 -0700 (PDT)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0740446sm536809e87.61.2026.10.31.04.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 04:42:33 -0700 (PDT)
Message-ID: <c10dbcfd-b9d7-4ac0-be30-6b78594bfdab@linaro.org>
Date: Sat, 31 Oct 2026 13:42:32 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 01/15] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-1-95f250b18612@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261028-kaanapali-camss-v23-1-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 17:20, Hangxiang Ma wrote:
> The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
> C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.

Wrong, it is NOT compatible.

Due to the functional difference in the register offset, which is
described in the patch 0002, it is NOT possible to fallback to
"qcom,x1e80100-csi2-phy" compatible device driver, and there shall
be a new stand-alone compatible variable "qcom,kaanapali-csi2-phy".

> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index 1f1e2a4993b2..6e9eb8e265df 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -17,7 +17,9 @@ description:
>   properties:
>     compatible:
>       oneOf:
> -      - const: qcom,x1e80100-csi2-phy
> +      - enum:
> +          - qcom,kaanapali-csi2-phy
> +          - qcom,x1e80100-csi2-phy
>         - items:
>             - const: qcom,glymur-csi2-phy
>             - const: qcom,x1e80100-csi2-phy
> 

-- 
Best wishes,
Vladimir
