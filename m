Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C6A3DD50B
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 14:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781791324; cv=none; b=MenBr3tHeFw297hCJo4r2C/BnByRIulIt3uYDjAmmXm4OFfxe9FmDdE7ssZWyiGiGtqxf9pwKJ0FEZEjrVL4XvnySRNRFLQSePlIIZuSpNs7EMUx4qltsAllzIHQ/XybqGgytlUPUWMSo8oSifWjlgwCuvDCBWDsZ9/vsqIheJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781791324; c=relaxed/simple;
	bh=Z2SMe4UNKa4UxIm3IZIpXDdOMhQ1vAgVQ4kXwkookSM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BDp2u+QBxonGUqeKVE6B0DyYR6WCDw5edSPmN27v1hJ8rCa+R7hCQ4mOS0vZXCnEzq2SmBNf/GSnQM0Yx+R+St5q9WDOnNRZ9WI3agvcED/cQimh/oUPsvYFQFMFFuVM/fkYSkOC+qMz+X/tMpxlu7BqPwAm4ZyNzu1PuGfU9qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zzf3yzOK; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zzf3yzOK"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4905529b933so8858505e9.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 07:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781791321; x=1782396121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2QWH3SS1Zf5injWkkRJm4kCxe62QJri1fUeqGxCiOE=;
        b=Zzf3yzOK5/tckR16kNnRNCKSm+HzGsylcWojJOT3k60Pis+qho8zJcZBeK3yj3NZUU
         NMFoStLMkVbE2GuTLckdpyeNBAPoJ+kxE9fuE2GW3fSGjcyeWwYJT3opTWMPFRLXMTXU
         C0SwJCTOIapivCF+ajUnHVuIACJPkDGPTbdi1817w+a3IRaJD4bkOVaf1YCfU9kE7o5J
         OuWICX4bWA/iEXlRsDK7Ni7PZo/HbgYR1gIfDifus2i2Jw8L25fnRKzAb37T8+upU+H8
         eJb0GFnWI5UF4QQhSQFYMRW2Su5MVMFVWlSEINts1Tk8zQBpYk5D6E9PCoQK+jh2schp
         eiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781791321; x=1782396121;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q2QWH3SS1Zf5injWkkRJm4kCxe62QJri1fUeqGxCiOE=;
        b=aLnfNKDlYRuzU+b5SaF/N0cmuBLJ/rcgAqRXNAkVOpWtWbdE7Kvu+CO+wlwILHhUmO
         AmiGU8ClOvudAhm5al1DhqBoogRJaHtIkT+iVXlTcb0QW4I746ryAOSvfzkir/xwFycC
         N2HOqbTB6oNC9yT7jMH121Fj+r3BF/mfgRcHtfIpwxVYQZUkdAScc/5wV+zOrzx2WUdL
         se2JTQ5CqK9XRFq2nL7zQWd9UdL5Ba0DflqlDdR3O0+PxAW+pjMvLOpS1H7h8DZJy8WK
         mZxET6znBEQrQTQCuVi0TpmoMlbCFv7GSxg1lcWgoDp8Q7WyjtWIQj9XZ58SDo8mBRc7
         MpWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/jgSCt1m7y79nbntm08qXo2/TYjxv3m6CiOPg9NBHnDghPBMxMjtDwySDiwK+dt6UJTNzcXxNY1oZc@vger.kernel.org
X-Gm-Message-State: AOJu0YzIDErrByjgfEfxzDZARx18rKMOdJzkYSfq6YEOIe58oDOLl20e
	Ua+hR2vQ5gxvhxqyiQr1S7K64c0zIfjPorjD+3ysFemjud3sHFZryhhdRRSAjKeUrx67ISey9xX
	s7MLGqp4=
X-Gm-Gg: AfdE7clWRvD1ZCplXxlaYPjmOa9AQltEK7/giFwwuDWaGBJ0k1q4Z/3oTmr8K6vkEtV
	lkD3Inq6+JtC8qt3i9FXdWOzeXVELrpQzEOSLZ+XR9eEZk+pTa0ggNhYEXC3HwnDAWik6qLUYas
	Bxrr6tsk22FK9MYysxWQtGSnhkDKA1sUat0GffFuljw33rvNQ90uAShhynLbNB81rzsRN/E8YVP
	/7V4YrRkOmWpAM7tvaSpeMvkxHS4NnoSfiFjP8m3J6wCx/J8jC61+wfuF1FXdvFxnB4KoUxh1NF
	Bo35oBshNGgK3FXyGsgRa8c/Ol66lWUegc2YImn6r6+mWvKcxrdzN/Gh69vJ6JRBZxIjgpHKW3A
	JMhpEVUbwDHdNbMjiVCoinpFi0Mmhbn38lRcvUs31Q3T6Fxy1d4nsfRUq3ZdstSEgGnJZsw3SNk
	5NWVeRVY4d4YHTeyuxdYJButL3qjFzup+Xcw==
X-Received: by 2002:a05:600c:c491:b0:492:28be:6098 with SMTP id 5b1f17b1804b1-492333bf72cmr148965315e9.11.1781791319742;
        Thu, 18 Jun 2026 07:01:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4620b3ed0d2sm27901309f8f.22.2026.06.18.07.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 07:01:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaron Kling <webgeek1234@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Teguh Sobirin <teguh@sobir.in>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260503-ayn-qcs8550-v8-0-d733f5e57446@gmail.com>
References: <20260503-ayn-qcs8550-v8-0-d733f5e57446@gmail.com>
Subject: Re: (subset) [PATCH v8 0/6] arm64: dts: qcom: Support AYN QCS8550
 Devices
Message-Id: <178179131851.245596.10889069443600186081.b4-ty@b4>
Date: Thu, 18 Jun 2026 16:01:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Sun, 03 May 2026 16:48:42 -0500, Aaron Kling wrote:
> This specifically includes:
> * Odin 2 Mini
> * Odin 2 Portal
> * Thor
> 
> The original Odin 2 dts is not currently included as it has not yet
> been verified.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/6] dt-bindings: vendor-prefixes: Add AYN Technologies
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/fc917a533da47a5d0fd2f3df9052ee6dc5e6adad

-- 
Neil

