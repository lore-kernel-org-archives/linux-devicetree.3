Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB463CAE66
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172097; cv=none; b=La7gM2qkDVV/eVNvB6ZLTXHMh9sed+ivB3Ranu0C/6NBeWJYg2dLqeFvp830pX9GAGLHCGoHNu2bZV+ucE3GPWVPPl+kenm55i7YVp/XVZHpI4Gu7ZRlrS9lbIaMRgxGiBG17oPhfnijnG4adUu27s4A0c/xsCGjARh65zAlSD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172097; c=relaxed/simple;
	bh=BkqlSsjGcX3YrWJRnGyFmjujGd7WbYe/KgGnMV2dbnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bS7vUkJSI4ZBshcmjKNvcBA7GyI3G/YBc0S7QKPG0QjAZ11MPVRt2Z1BebyMpG3lUaG/uHlbIvbs1i0wQqX68teanucYz2WvF/w7at2ko8UYErB66ILi8KHqo3je+Yfu8FzQekOmmBzaPl9tVuUZxbmM2Wau0L8R+m2WKe79c1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KqaeaOVj; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KqaeaOVj"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3966e5e7cebso9129481fa.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 03:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781172094; x=1781776894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6S7G7H1yZX6es3QmcIIuBRUMbZtpN//hujuIUHm018=;
        b=KqaeaOVjI2CMDuBIiV5aYcwu7/00dTJFE01BOl6/Y+uYE4z8cdDNIm17epJmtiX4Up
         b/HOr9W7lXlOHPYuc3JMc0GGYoLNi6N3mabeTJzFFz7iYnzpevd2zhCg4eIyF5lepdS9
         YBzAs7cdk7c3QypkFOZ8ivjoMu2VH47A/n9Pnpr5CO3kZSi1DlSpQEJ0qfSDDyeaKjU6
         x6sRTG0M3nN6W7k21lLE2gIl2ypMJDsQ0WbIypUar9lYqWIcTKdQXpDdArjfn1Q+V2gw
         DqEf1SzueD7w64jNYlcTPRxNtBDt/UajmHcwENaCOnFAPDvQ9m5xXrSyKkUMUeqMlg/J
         B4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781172094; x=1781776894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z6S7G7H1yZX6es3QmcIIuBRUMbZtpN//hujuIUHm018=;
        b=GTMxEwFmoCO7R6JLoSwxAaLEHVbU8s33JrMlAAT8cW0+6K84Y6BYEqWp8qpKltyffY
         Uh+YeKyWZam0CTJHlS5gc4nvgpcBSjMQdATgC6P+jW8mDNqY8hhv4WIpWLM9jbEigwM4
         AR+SKbDOCnzMvWRv+d3wAhAgGK22uiPk3JKP1Lti6PrwKlU9aRj7EYT3KBnRVl8k9FwW
         nzzJd18sDdeKCycMBuSSZMVnjFbhp/0Kpic0MZYqVlYgSTBNrzDmpxG/6T05+XkhbSLP
         ExKodA34/MGuY+oR8mtnwCSiFyiW2vR1WqmoLdCF8BAvNBGw4THvyqX9/e0Go/+M5OXd
         u8BA==
X-Forwarded-Encrypted: i=1; AFNElJ+fcGfg2ElHokF709Iavaef+unDE2ufLkAROReQzaDTFHHQr8yAVfxrq7tJpzz71NfDGWITwEgBvQtm@vger.kernel.org
X-Gm-Message-State: AOJu0YzLqXOZHrrA6PY+SAFL4HKaGYkjYjCKrb+064xuymxxYl3Mrctj
	UmMr4Lsdj1nntFj1Bu/mfHsX4TXwayxnghdcSU2VW5fXGJyfjJXCsVa9JjdaCxqsW1g=
X-Gm-Gg: Acq92OE0aAzlKI1gd02B6mz96oW+7o+eLAl8Mcjmd31Gmcvlk/BVgDBAK0u1HgrnQHQ
	MfQrfE8bxySjY/WL12T0ACmMj7XJhnCHkswKlsHLLFR7XaIcS47IL2l2r42/9EzqV5ZZdzFgLyJ
	dbET/J93jo5ZXXaETi+GKy2UcXPIXYWx/YuANYj7hIr2Tb4STaH5i+h4Tq+iPMMq0UUZBP97KN0
	mCqruwKXJfG3tM1ad/xTVPD9dIWEZ+93l1nZb2XgOhuQ4FPKGxdr8W+I5A+yVLsCQ0PhFlEMND4
	rH9rbbD6fqXS0wydi5qdX9/0qatyxBsua/fVs+24nLo3TCSS4ojQrDg+bwGWWnj4g+ToYo1isdq
	9tZM5TQpbSMTZMiGXD1reryavOuC3jtFn9G8/V6lQmpR5BJouCpoS25eXvHlUmiS642xctWa49l
	OS3620HS4XglS4DDUrsuc4SYf8P1ghqArqcIOUq4gcTCJwXFojIzjCVKj+OVBjiHxpsqMLqqmVD
	Z4fhRONIa5p2ASq
X-Received: by 2002:a2e:a90f:0:b0:396:7e06:4ecd with SMTP id 38308e7fff4ca-3991a0f7804mr2442451fa.7.1781172091878;
        Thu, 11 Jun 2026 03:01:31 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3991adc355asm3445981fa.41.2026.06.11.03.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:01:31 -0700 (PDT)
Message-ID: <8be0a964-e2fc-4c0a-a5ca-0e9e42b3d747@linaro.org>
Date: Thu, 11 Jun 2026 13:01:30 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] media/arm64: HM1092 IR camera and ASUS Zenbook A14
 (X1P42100) camera support
To: Ramshouriesh <rshouriesh@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/26 14:09, Ramshouriesh wrote:
> The ASUS Zenbook A14 (Qualcomm X1P42100, "Purwa") has two front cameras
> behind the SoC CAMSS: an OV02C10 RGB sensor and a Himax HM1092 mono NIR
> sensor used for face unlock. This series adds a driver for the HM1092 and
> the device tree to wire both sensors up on the A14.
> 
> The HM1092 binding, driver and MAINTAINERS entry do not depend on the
> rest of the series and can go through the media tree on their own.
> 
> The remaining DTS and PHY patches are the A14 camera enablement. They sit
> on top of several series that are not in mainline yet, listed below. With
> those applied the series builds on next-20260609: the A14 dtb and every
> module it touches (hm1092, qcom-camss including csiphy, and the
> qcom-mipi-csi2 phy) compile and work: both sensors probe and stream
> frames on the A14.
> 
> Prerequisites, in the order they apply:
> 
>    1. phy: dphy: Extend phy_configure_opts_mipi_dphy to support position
>       and polarity (Bryan O'Donoghue, v1)
>       https://lore.kernel.org/all/20260325-dphy-params-extension-v1-0-c6df5599284a@linaro.org/
>    2. clk: qcom: videocc and camcc for X1P42100 (Jagadeesh Kona, v5)
>       https://lore.kernel.org/all/20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com/
>    3. phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver (Bryan O'Donoghue, v8)
>       https://lore.kernel.org/all/20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org/
>    4. media: dt-bindings and PHY updates for CAMSS on x1e80100 (Bryan O'Donoghue, v11)
>       https://lore.kernel.org/all/20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org/
>    5. arm64: dts: qcom: x1e/Hamoa camera DTSI (Bryan O'Donoghue, v3)
>       https://lore.kernel.org/all/20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org/
>    6. media: qcom: camss: Add support for X1P42100 camss (Wenmeng Liu, v2)
>       https://lore.kernel.org/all/20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com/

That's a long list.

> 
>  From the videocc/camcc series only the CAMCC block (patch 6/6) is still
> needed; its clock drivers and bindings are already in linux-next. That
> patch adds the camcc node and sets the Purwa camcc and videocc compatibles.
> 
>  From the x1e/Hamoa camera DTSI series only the CCI and CAMSS-block patches
> are needed; its CAMCC block duplicates the videocc/camcc series, and the
> x1e80100 board patches do not apply to the A14.
> 
> Patch 1 adds the OV02C10 node. It is Aleksandrs Vinarskis' work, carried
> here with his Signed-off-by so the A14 camera support stays one chain.

This patch should be removed from consideration, since it is not based on
the upstream codebase.

I'd suggest you to upstream the sensor driver only through linux-media, which
is patches 2/9 and 3/8, all other changes should go only after it.

-- 
Best wishes,
Vladimir
