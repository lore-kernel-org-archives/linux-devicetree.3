Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E57C377EC5
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068147; cv=none; b=rZf2MWXSNdbwYOn7IIUFWuld3MTy4ueHzm+tVwpL8zPxTZjtVRFAuKgmyWkuocJxEmKBoYqHneIcDhewJk4mAwMvAKaM2JE1DK5KTpO12nVy2JTP3sN5UnxpREk5hs12EUFFaDpI6BBdWvG3Uub0DiXYlCO4z+8vHU6tdj7PmQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068147; c=relaxed/simple;
	bh=6NeXfTk2TuTHIcLkZnXM6fT9nU7cgAhHXMrsjr44GZQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dnTE9n7jepmpTllPk4nlmwJ/TLQWNQyejq88R53/ln50DDNkdbluKnoEyjgvBsTMlOWBMK/VyNj3x6ND6z0JQu28xmhQL5hZa9WbZlA9xUnoypft5Lai5LEcjQV6BI/BYqsYl82hkg5dbCI8cu7/J+4ysxJ5q83SgtNI5QDVrHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MpmmgJRH; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MpmmgJRH"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so2353965e9.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783068142; x=1783672942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5y/LlnctUnWczLr55nRli7oZ/AlDp7FE9PGkSlaB9s=;
        b=MpmmgJRHXRSs6annUZ+qrMFEsQMEEWEq3TYbAudDBNjanaZRSRlGS/u1Vevk5v0LVI
         z/L28PBGilT4oOtpm3V+s10zIPBIwFZJUAd4Nf5LohBB7Ud6aQ/pv+CU65p3QIGNbkth
         WAkiCXbrIpF2tRvPiENxlyA8CmfgwFvSpt0yXWbN5F03h6XWWg6BX9r8sdKdq3KlWa7g
         fQ3kZyHVCVDJS3HGtjRS/moYx+PZfR6WAwke6ktq59OABpYocfozYP/rCXbKLdI/tztY
         tKgU9JtthqLYHTPLipwB5SAsL8pgfhpMvHMQrleEpKOE/EOLIqd4who63BU59JiOZMgi
         7d8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068142; x=1783672942;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d5y/LlnctUnWczLr55nRli7oZ/AlDp7FE9PGkSlaB9s=;
        b=jSr4E/gcM3+lgzJo0P0UHyKSqLnawzFiHb6e3+Sb8+Lg+kObCpzoePw7lvzSsSFbJp
         VDdzY3hSnDap42z221QWrJicNBongM0HDq1NBF6tOOyYSnROx21yZ/HXAR4vzSxYycjZ
         YuFutc8DJqBBo04Qj5uvEvTzPngAoSwOxYOQKX/huo80G8XAKBHb/TBwRYz08m2X8zzd
         R7hK/NdJrcbAzZsYMl4FWUd6M5yooXG1M6JVuhUKR04FI02aKnmpoHn1NAkcTuNi038G
         OIRhDuRtigjB8sMnj/fWZSN8xpYlpd5fqdzgaD7Ov9Xh4R+uJdhcn6T5c+zKuBpSnqIu
         xLoQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OZ5MwFVO/DMf1KSJD5v1bN36QkVTkZJbWG3LQ4nGJsbZFxj04QFwPzQcZlUHtq9sjbToZ8YtNvuVW@vger.kernel.org
X-Gm-Message-State: AOJu0YzpHdFHGBQZSTgjX/2bGnVjsEId1XnzbwUv0qUzdGqavJVwcAbO
	rfMahyasBVC+gTc8UXT4lr33QDT6R9bf/M2JG51sqS8RTGEi0DrdLXLK7NOsZOCAVdnPoOGxPhG
	4EF34
X-Gm-Gg: AfdE7clQoH0QWl24uyqFLLzM8b83+8V+0SDZwbfh1QDlktEQoCkU6rrgxcNUEmN/kxA
	fWf7o2HiYAxyyM7ikdWlPqk4azjVbApbjA2bbbohH2uyR+KWjpaGowIU3oPBlCv68FsNUcZrq+d
	tChJ5z7M0WG1YkUnLnM4WJnDdJOhAY0T5xi7thefTT9+47Vb9ql7/sbW4oaceDi84ONyCSCM6ln
	7Iq/S1nR9aAvJlGzotplFvnUcIfcNasx/UGCsUchj8TEFlcA0UG/B9Q1UNPS7N12LacUklnzGpO
	MvYSIfRRWMhoyqbR5vBd1MGy5MRUHFGxxdHLIcaRfXspimK7o0ISo6J3Sz0oVpVHbgZypKWbxgO
	2yTWTi+D0LR4P3Xi1jRu4MBUlXJ5MwHUXYtjFIaTK63KbA3Ojyfa7Ymg6csiQ71WJzDAsloD1zY
	tKP2JOUDFk2JEQqqYnGNgL39ce38xdJkHEhw==
X-Received: by 2002:a05:600c:705:b0:493:b962:4abe with SMTP id 5b1f17b1804b1-493c3dfacf0mr84107845e9.36.1783068142021;
        Fri, 03 Jul 2026 01:42:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdab27dsm30001575e9.4.2026.07.03.01.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:42:21 -0700 (PDT)
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
 Conor Dooley <conor.dooley@microchip.com>, KancyJoe <kancy2333@outlook.com>
In-Reply-To: <20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v6-0-16edddda9951@linaro.org>
References: <20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v6-0-16edddda9951@linaro.org>
Subject: Re: [PATCH v6 0/2] drm: panel: support the R63419 based dual-DSI
 video mode Display Panels
Message-Id: <178306814096.3165305.17752151699717315900.b4-ty@b4>
Date: Fri, 03 Jul 2026 10:42:20 +0200
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

On Fri, 22 May 2026 14:51:23 +0200, Neil Armstrong wrote:
> Add support for the Renesas 63419 based dual-DSI video mode
> Display Panels found in the Ayaneo gaming handled devices.

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: document the Renesas R63419 based dual-DSI video mode Display Panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9c04ecc893f07d001e484e6c420af19a970f755c
[2/2] drm: panel: add support for the Renesas R63419 based dual-DSI video mode Display Panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1190fc8d7b8a9cebea8dcbd2e544e43990ae81d0

-- 
Neil

