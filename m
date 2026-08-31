Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C292E4A0EF1
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 14:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186569; cv=none; b=HlV8sk5tDf4ARxoW0FvU2l+6S5/AaZq9joVJ9a1QIYIvNZncWJuMPiEPyLQG1XCTIhi2hrA6CjgO7NuDuQuRjHCsxe2Df7wE4T6RVPsL4UJHDYzGYIcn7yWQ/qX+D/vkkzK7bnBfwItx33Ebuvm/azZwuV74gO6ax49Ovfw0mdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186569; c=relaxed/simple;
	bh=dYj69jFFjRWn7Sys/t/m3JYBC1fu8Ks5fI5qkXxrx3A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cqp8Q4VEy5qekIl4VlSdeM9Yai3cCsgVdoHo/loL3soZ47xTtCzJRJ1ajrNP1Tf2fMZz56/YJU6KeS7rLG1d6HWFeS32m0Oe6KRgpW2yitqP65ScmLfG3Q8gWH8XZFOGTdBHyo3brOQitzQ9bhSY8sc8iDQvNoptwFkpzoxdbxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hhysf+AX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hhysf+AX"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso40778245e9.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788186566; x=1788791366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6E89hI6dDsHxKquITrLVBigGlAGgfkia7MnsBoaZjOA=;
        b=hhysf+AX6SaSD38bFEwIGJuZQ3U4y1NxVqT7eg5CxU5iI74lJudY6o74QyhWVS4xqz
         BkUZAodkqHOONBJ0CDbMfLzizJAH1Zoq+bfuCCXE3UgJ9Tm8yaNoMVww+00hDqF/0Unx
         6JKeYt/4ABzaHG1S573cuEc6sS8j86r8Za/NfMpUPJgTl/srqLV6jhiL7VAzYAadNNa2
         VPBfjPZmgUP1fQqGbba75URUKqZraXfBcD4T3Gj947iCkobRKXKdaEzBwmbOap1nSAB+
         NIHGS8q1jA7r4Yvr1oDtDE9ORUPx8NNofVmuAPtsi8qSPGbCQrJ1iUGJpjrzXKhaiuKU
         rGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186566; x=1788791366;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6E89hI6dDsHxKquITrLVBigGlAGgfkia7MnsBoaZjOA=;
        b=YgLDrPz/wVroLI3cIUtSOj2yib2Z/kniG6z7x9Gseg6Z7yDBzeoyAzXuWB6uDyK5Gv
         Qb3b5TRtACinMjbvHLur4faq/6cSH09sP25CMzPp0zU00uIfN90vT5cFLg4Pw0xh596P
         8vkMP9f8nhH2amZfsQrmhgNiFW6Z4WxyLuBbjXsEdowiNiAqa+f6MaOOvd9qgBL6mhtb
         OJsvpTzDSB6S4x/LleHvw4HoEsHrLBqjFKwnxR9ZKUzvgLL98T7/Z/cfXbda+zkyk2Hw
         xHdvigkybzg0BjP7IwdcQkY7NHFDq3LAd5D5pbxYPu9zMrDEvf187rYDJIyGhI2vsBSj
         Wa5w==
X-Forwarded-Encrypted: i=1; AHgh+RoC+ZvDRlr/HYxNLiuJsJLkJa7Nhk1tfCz0mxA41bab4NWbuGWBH94N0+UKyMPbjzJF7CQiAJeCVEJO@vger.kernel.org
X-Gm-Message-State: AFuF++ny+ij7ZCDRDKwx7osziX4iCXGKr+Ffj5e3ZxR2TJ37sG6aVHdN
	OKMCWuZMYAsahpeQNRJMRTigKsWkpudoAJkFJtHnXRXvODMBnNmRr5BRN1axJYcY5/o=
X-Gm-Gg: AR+sD12NBrC1XIeeaz/BxRQLZvGqVMzAuXU3116BWBY0MK7v0Cy+TKCpGTY3GRjqW/j
	uFfittBu20RX8N8y4mjyK6gWktyGHyFkuhDb7Gln04jQ806EfVHwnRy7mv9ELLDJzp+Yh1WeyJW
	mGE61i9iBnBUPo8omZPHUQDp7u7bUFL1OeJ9URe7z1YpWL9y40qEAMiUMrD+YWaVEydjZrS/uFB
	xijn6nC01FT1GCV/8+lJ0351nFWyGKu4P9f/2sUn20mbWYFJvzh1TKGaq2mrK3fMbMHVLIp5bB7
	NP8C8iGW8qISabSMWKIzKY27SdSIsNSvUBR1kLAQH734qIuqrF4iZkJdFNOpdxKnAF3YsVJlln1
	wF8JX9Y92/Gyu1sNTEeWrTIl9NP54qbB4LzizfuBDwxnUMJ8gJAShrnsDMScPUBQ1Q66zv4W95V
	dDE9MJHfVycFDYRDP4B53oKy8KR4WiItnW4pv5x9eYqQ/t/DaEIU7ITLhkHQ5AlHYKBIslnER2f
	0Q=
X-Received: by 2002:a05:600c:1d11:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-49b91c25414mr366990155e9.7.1788186565847;
        Mon, 31 Aug 2026 07:29:25 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0e:1005:fa8b:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea87e1asm145266605e9.2.2026.08.31.07.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:29:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: jesszhan0024@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 Junjie Cao <junjie.cao@linux.dev>
Cc: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com, 
 mitltlatltl@gmail.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260804073419.84727-1-junjie.cao@linux.dev>
References: <20260804073419.84727-1-junjie.cao@linux.dev>
Subject: Re: [PATCH v3 0/2] drm/panel: Add support for Novatek NT36532
 panel
Message-Id: <178818656440.2615924.7721380988384497454.b4-ty@b4>
Date: Mon, 31 Aug 2026 16:29:24 +0200
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

On Tue, 04 Aug 2026 00:34:17 -0700, Junjie Cao wrote:
> This series adds support for panels using the Novatek NT36532 Display
> Driver IC, a dual-DSI, dual-DSC controller that requires DPU support
> for MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT.
> 
> The first user is the CSOT PPC100HB1-1 panel found in the OnePlus Pad 2
> (OnePlus Pad Pro in China) tablet: 3000x2120, dual-DSI in bonded mode,
> DSC 1.2 with two slices per line.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Add Novatek NT36532
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1c523f0a930107191c95d96340c69a295a086e5a
[2/2] drm/panel: Add Novatek NT36532 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/47b823940e38607dad180eb2f82094ae65565a4b

-- 
Neil

