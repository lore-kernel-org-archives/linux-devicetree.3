Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7D23793CE
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068150; cv=none; b=LmAlxgkVpFTrNVEDWl/RRNPxOtDH9PgS7foTPayjoSimLS8YofJrq8gMPxB+5aMsPcdSIf38TG8d3MrbPzjv/gcQJ9Opk+WSdZeP0mEAPb+OM0KkTd5UuogNvfMUVpnwQizH26tgrhAOVnfxIoxqkuy6dt1Mu0J8gYihuRDNsXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068150; c=relaxed/simple;
	bh=+YCmrkr62ImlHnOn240RCni/4FJZ9LXyVf7QtvrN5Tg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DFJp6MG5IAUDmBdapyOZk2MznZo5sv4lNOdqdYjmWIBgxSQWg8dRy4wftx6KuVjuW4rZ1Qt58wi2/4+Rf5T4xeWuT87/a9v20ZwztMP1RJCSBSX/33wRtRPD7zNho5AopBVxDrmQTFKy40B5CbGs4mQJyuWheCxMcKQZVYtLD/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=trRlDV5X; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="trRlDV5X"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so2892035e9.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783068145; x=1783672945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2BvWoVYKkcPj1zcFMdBoaWfsieqjtxdGGOhjIbmmoc=;
        b=trRlDV5Xy7d8q4OnPQeoc5aJAdbXaGFqZRQCQx3mja/pAHBFAJGdJppLsrOdxQyubD
         f4YiL5Kd5izSn6VvcwUrTMxUpCBjFkAdr2wKhyOE6bI3cHNP23fuXHqfkMMc26+PhMNg
         M+SdVRM1zHxMv9RQlsIGz88CPTB1omkyjXEI14Q56EP4k67fr9G/PkFjUF6+c+vVgfUU
         +TM8F1/k5uPEvzezZ4DLSkaBHI//q0JUkHYKvmhEBt5JWEpfRQl861B2NkgXZttfAA3Y
         tMIM4NsSd91O6NR3dNyp+PAI3NkZBwGVGoyjSdhGvRUgiaBKFjD7hBg/a/xDq9l4HWRP
         Eb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068145; x=1783672945;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E2BvWoVYKkcPj1zcFMdBoaWfsieqjtxdGGOhjIbmmoc=;
        b=f02iHjKqVaEpwZdAAX/dAQb0j6J+P6qdJR7LYNAgxMknoigCoGX22pTQe7r8hgQvyk
         8vzNsy0xncisk3k35nlg/0OdUd3T+8XJdwNdICmLCCmt3Jye54T/00B2PEtXfNp9n/ZI
         6vKHRtgSJfx7ASCwSrfxJircBDoPOnskPwM96VW0GiLJRCzYN69mnWUGwgWGuRjd2as5
         5kAy8QIZWqwmpqIBLq412HsHms4b0c0UGI5pVuJiBuQYKoZXiuaL+mjUy/aTwiKlBKXc
         06bYrD8xyuqJ2hacruTBrlfTOmW7sbRm4x6c9VDRo96Tedk9lOsAo33MyLh2zSP22xwZ
         Lyjw==
X-Forwarded-Encrypted: i=1; AFNElJ/nRmNZuZyHHl/IVY0cW/bqTlEWZztbp73Gt7APT2WvcrYBj0L/vshsa7dTFZX/cTqVwdMtkVIOMFNx@vger.kernel.org
X-Gm-Message-State: AOJu0YxkxNDYJQVeFVcYa5/8+UYEeQZBgT8x9A2T4Wu6ngty7GfcDOe1
	bHB/5SNp4LZlGTJNTe/zYBDopd6vsKtv9IW2TmlUm4HKf4GX4bGAqohrAQ6QUJ7TrUE=
X-Gm-Gg: AfdE7cnP8JubHx6WBnUZRVERuc8H0NE8HP7lLCCDpvVwDnEQuAVWNOsEUuSOZL4eHJ5
	D84eDF/T2vacA6YGZhTNtr2Qw7uns1P67uPWYe9NHWC9tp+Z5Q14+cynbYDMd5IfEFTWVd4YR2t
	dLexYFibXbZ9a1mrg/lKQmoCizr+PN5pX6PR7keqwzgzBqie5+7MBl4M3ogbVu/2BBLzYhlaUMk
	/AuTryn690rNm3BpiFiL9IUCvyPNOPlEV72Eya1bZLzgV3LromRmtHMtRbtFAFebOvsIWjYE6YY
	SkF1Zbk9EuvmMppIg5pDYzpRFOS2hHVKjc/9BMIwIPaRfhoU4i3bA1UPHxI8SwPB878IEB2+pfu
	W4ZP267FmshOltm7zBFcfep9KjPyYLl0HWjrtSQA0aCRmMTifBuM0IKs5XO5I6L4ieCaufiEV3r
	iAnedsjm7/2UytMiCu1VA02gb49P11sNewuQ==
X-Received: by 2002:a05:600c:64c6:b0:493:c337:db18 with SMTP id 5b1f17b1804b1-493c3e135a9mr113800625e9.16.1783068144642;
        Fri, 03 Jul 2026 01:42:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdab27dsm30001575e9.4.2026.07.03.01.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:42:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Doug Anderson <dianders@chromium.org>, 
 Conor Dooley <conor.dooley@microchip.com>, KancyJoe <kancy2333@outlook.com>
In-Reply-To: <20260625-topic-sm8650-ayaneo-pocket-s2-r63419-v8-0-8570e692143e@linaro.org>
References: <20260625-topic-sm8650-ayaneo-pocket-s2-r63419-v8-0-8570e692143e@linaro.org>
Subject: Re: [PATCH v8 0/2] drm: panel: support the R63419 based dual-DSI
 video mode Display Panels
Message-Id: <178306814343.3165305.11547200028737735771.b4-ty@b4>
Date: Fri, 03 Jul 2026 10:42:23 +0200
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

On Thu, 25 Jun 2026 11:29:06 +0200, Neil Armstrong wrote:
> Add support for the Renesas 63419 based dual-DSI video mode
> Display Panels found in the Ayaneo gaming handled devices.

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: document the Renesas R63419 based dual-DSI video mode Display Panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9c04ecc893f07d001e484e6c420af19a970f755c
[2/2] drm: panel: add support for the Renesas R63419 based dual-DSI video mode Display Panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1190fc8d7b8a9cebea8dcbd2e544e43990ae81d0

-- 
Neil

