Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F673EFD0C
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 17:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779386378; cv=none; b=u3wxRtj/NcvLPtR5TMZmlzYvj2xUiOq6b7e7WFEPlmMJ/yJ8SPDsy/i7KpPwDdwyObok/ZwpT07plpOE1ULE9hSdKt1wgT/46hKDsNhE5geD+ynRj8nGSZ0uaQ+YA9eJEpnm+DmoAqthzUuiHf1s7/1JH4sh8Pn59xKrufOGyrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779386378; c=relaxed/simple;
	bh=qO+RN+GFg/xy2QDrX07JnnPFA9T4NFRlva6393jHk3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fq2oZD6JMbbggN/7gmBApPTECHMr7DGjcslrAWI7D/IzbRiaUUvnWD9IOXMV0XDy4VAiZ8AFrIwFAlIeVP+mWCg4dJjr4xD6ai4p9hIjWR0gEZX3aMu4qLRv6uyP6y1+iu/iVsxXLQRgzDaOJ44/XV7z2Dt6shI0wYfLL4+ux4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWWQQyNE; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWWQQyNE"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-449de065cb3so6053784f8f.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 10:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779386372; x=1779991172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CByRJY1ZmIfy6w9D1VtZFOKx1JNNuMZVWudWcvdfISQ=;
        b=gWWQQyNEs6mgk0eCTbTXvfHr+qoY3LpaPqjis3MpZoykSaMLVFYImeMMe/4aTD1wZl
         wjZRUvkLe9blydy8xoYmk6hoUW8i/uXQ23D9pBx8GKGLYUGh/hlsf6jQtLc6sF2RiwfW
         8OCb4M69JuTIaeQABkH2iDMyunm0LDo6oOqA+KWR6jrKh9oiDk/VZM6Tb5ynBT6VZ3Mt
         Vfu6yTuCS/U/FK6kx4abMfHHwwblPgueB0hpevzDNqCViaLHEjZyyTimRsmQcBHB6aL6
         Fxe7wcEtXHynUkCsJf0wG+KKMS0UFgunGeYqK2GIN2uMfB2lwNLBAL7MJOtdI6a7MqA8
         kPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779386372; x=1779991172;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CByRJY1ZmIfy6w9D1VtZFOKx1JNNuMZVWudWcvdfISQ=;
        b=R29D3y9RRi34j4aXFBvaRDgzyLLPbjpgmRBbWK5KUh9m36OQw2EbTGXyznZ96DmBwn
         Ms8lqbjW6DuU7yBb65oqjK0lKsA5Yy5K0lZdRrkM17KmQY/D6MFV6rT9lQfuk79dJSdJ
         hxucGJ/ykF0McDqi+mvFk+9MRxT48qnAZCckgpiBcFjn6SZo/dvxmCzDKu9BNQit6V5X
         q6/D+gkBhhr8V4w95ko54xTsonOtMjyebdxcKGK3Sbxfx22wIm7U7j0Uuw+lLVhlOIto
         Tc9j7yraTOKE9WeEtE4YRMJhiTyJyuBj3x2QbKvm8f/V6FnZ0eAJUM5T3qmzr6lSVNtU
         yBHw==
X-Forwarded-Encrypted: i=1; AFNElJ+UNXx/NlaVrBNom4l+/Y6bF45J4MflotxtQauNaP/vw7hpeGO1Yq9oRHaR53SgMIVi5k0zygmvXhTX@vger.kernel.org
X-Gm-Message-State: AOJu0YwdeO7kBclDhtmP2RzBj2gLzOYuxHZyFVj3/WGbITrQzS5H3yOV
	4jSUmIvLsycBesh+drBYtNvw8kfELhi/szIJueOtwTkxZRtvFhh6iMw=
X-Gm-Gg: Acq92OHTWiBhrWKsXwK+V/Qa0sPDN4tXt5Hj5u6elLp583t7y055Wg5Um7rNN/2Y3d2
	QUTnqzOMO6G8M0VOHF6PHRMh3i/b6T7gK2GDeKoGIyraX2MgorhkVQAtmFElRPhFEVh3q+IyKgq
	HZd3J+zuw0HVFRx0P89sKHKD8guGb/qw7syfW+eftcIkvytgrrzw0Lh9mIlwqxxDt8cvaNNMBEL
	gQZ0WeIqXjYVkcwS6n8UVXqEMEA6RDNQxY+cRS3geMxD7yMd/s3BQ5qwgOq3dXlSB+jnpxDgi4f
	al1VzZW2LtgvsCP1JO/o4r97AYl8xfcYocbJXwCGA3tmej6ICIwPyayJN6vA8SQc3VupBQ5zB4u
	rk+EbfGVu+0iIucwcvKzkS3T5hK8eSKgDyYd2rNoN2yiucvwptBVFIyvON+Pt3uXmCAOAEwVrGw
	fn7cHosED9jiO4faYW9xCxdniLi9xLEose5RxXI/WLBw+e7BH25UEyMObjyzN963k/LbMnx+UDs
	YmsWWzFiXyrjulT27mLqAYiFf5lTCVd2Rx7p9t7X766TXsuLvSwmyO6QVZ0c/sxfr/3Tw==
X-Received: by 2002:a05:6000:402b:b0:45e:73eb:2a75 with SMTP id ffacd0b85a97d-45ea3ae7658mr6591102f8f.16.1779386371837;
        Thu, 21 May 2026 10:59:31 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:52d:7400:bbd7:ca83:de4a:f625? (2a01cb08052d7400bbd7ca83de4af625.ipv6.abo.wanadoo.fr. [2a01:cb08:52d:7400:bbd7:ca83:de4a:f625])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa92f622sm4635686f8f.24.2026.05.21.10.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 10:59:31 -0700 (PDT)
Message-ID: <ec040a0f-9ee9-4a26-8dcf-3ae5c5aa72cb@gmail.com>
Date: Thu, 21 May 2026 19:59:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] arm64: dts: qcom: sc8280xp-arcata: Fix top USB-C DP
 alt mode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-5-9df52552bf87@gmail.com>
 <990a0d6b-ef5c-4d7b-ab63-e75c37825397@oss.qualcomm.com>
Content-Language: en-US
From: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
In-Reply-To: <990a0d6b-ef5c-4d7b-ab63-e75c37825397@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/21/26 10:53, Konrad Dybcio wrote:
> On 5/20/26 6:40 PM, Jérôme de Bretagne via B4 Relay wrote:
>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>
>> The top USB-C port (usb0) didn't switch to DP alt mode, as reusing the
>> same GPIO 101 as on the SC8280XP CRD or Lenovo ThinkPad X13s was not
>> working on the Surface Pro 9 5G.
>>
>> Investigation [1] by Jens on the Windows Dev Kit (WDK2023), the other
>> sc8280xp-based "blackrock" model from Microsoft, found a reference
>> to GPIO 100 in the DSDT in addition to 101. Switching to GPIO 100
>> fixed the issue on blackrock, as it does on arcata to enable
>> external screen when using the left-side top USB-C port.
>>
>> [1] https://lore.kernel.org/all/20250609-blackrock-usb0-mux-v1-1-7903c3b071e4@oldschoolsolutions.biz/
>>
>> Cc: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>> Fixes: f6231a2eefd4 ("arm64: dts: qcom: sc8280xp: Add Microsoft Surface Pro 9 5G")
> 
> Fixes should go before your sign-off

Sure, I will change this in v2.

> otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

Thank you,
Jérôme
