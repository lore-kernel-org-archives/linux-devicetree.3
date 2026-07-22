Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD9635E1D9
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784730532; cv=none; b=Wyp4r99LIzKzAKZ5cATt0TBt1kC4k3wP/in40RAJCBwmSdCQRSdD38PSK+u0u3VTLblfIToLc+XzPORvfIGqoif0xDQgBr56XjnPaTt2EkEFYDDRGKfrf7lH3zBz09Q4rA0bApYSWbZoKcOPfufvimunCWi6dlROsb9qhjWhodc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784730532; c=relaxed/simple;
	bh=Pu6n8LL5dMOpPPGNBvEodlSC1hO5hFdlFYqoIC0Rw5c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bf2wRTr8UCh13dF/RpVdXLbJYpCSwDLATnZgTNdQ8h9aEh4BMd+3JxAe5kkBXhblt7XkHvRDrN+Yc5O850WYk0Tp7O+8DpHBfU+MvE6qO9rEdXwEjnokOwEbX8Xk3NJnpv3a0ULCWHjxH6cj9hH1goIaojGBBu9p6FhsIAT459U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rUJxJkxX; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rUJxJkxX"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-495590ba856so32459935e9.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784730527; x=1785335327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ePYWD2iTRHxJu1GtsXub1IW6UWPr8JBMi02BG2MjH5Y=;
        b=rUJxJkxXlAIja3BNdm33I2tktv0KOu25it/eZwyg1H1QVmHf/xRSJ2G53maon6rU5p
         QKjWsFGW8BFUlQG1rJ5qvvfUKy1rWewa4UsfOK1R0U1SZPhW8qXlS87CyH3BYJa8VlZA
         RHoNw2wdMrbfKSd0hN9INrXgWYpC+BlNiRc/xYBFJqxrjv/gQHsvRmd3RtS3/pNUPOzv
         st2g6hiyl0IYiTp9/I2HkHI1sywETDztjpmtbvpmB2499PtrC9JQEiXorBhnYwkDzMGl
         4Mp6NX/lqbiV9IBmFiTpd/G7W4tNxPK90sDmm51LEuuEHXdulX6295dOgSe2EZWPy7Pc
         Mzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784730527; x=1785335327;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ePYWD2iTRHxJu1GtsXub1IW6UWPr8JBMi02BG2MjH5Y=;
        b=Of304dQBuuOUmLtX0ww3S0KmovuZ7Curk8RA3TluOUIdqE57bzxsLJH2yrp81rT2xv
         d+2gLc7ClYPIuC8ohe8VhS7UlwgEF+u46mKr9hcvfy2eS73igf2fJf/aM3cJHR1Jdpxc
         C+i0rE1Rm1LXU658f2n2XJPdju804s3eSb2AVN5Wnrr+WryFn8+BF4aSfOnKQegFZ5YJ
         bUz+LKacPpGJWBOxZ8Hcr7UT3wDLquh1exF9OkcMdEnNABQuya5J+iWPQi5BgVTZbbNb
         zszIWJMdNs2gBRsQyiztdy8WqesXNkCV3+9MFvYI72Y6WpdL+DpMCdc2ftf7NBYjPNYu
         JuGQ==
X-Forwarded-Encrypted: i=1; AHgh+RqB+clTZ4MdXvoLJzkZ24q9TD3u8QEWP8OlDDUmh6lxW7u6mjgz0hjvbcLW4YqCGW4cTzlZIxYaKjap@vger.kernel.org
X-Gm-Message-State: AOJu0YwV4phU60X/uZXnXT7l9N+0DdoEoZ7qasqdm3xAES8JN2XP611m
	/is9HEVUJp6RcsHmCbpvaqw/Hug2m5PfOSnIHuUvuRcI3GEnO90ym4rglNHsptsOtjrld5IBt05
	P7PlN
X-Gm-Gg: AR+sD10qAGtkANYl7WUOLJSa/nbioAXUx2pO+dkze03ehmy/djac5SD4BJ1vTjXCjRY
	KsQirgPTgUmhDScWM5w6jbprbzyiQcR8pGaodT20bQOnIG4HbzbptF23aNoTwKgPgEudftg3ga3
	Y/1IerJomNU/5k4a7a/Q6NJes9OUeabcQDo7I2y1TNIYTZi7BUkcaDF4EBf5H3wVZSwS/CaZCCh
	nHSXk+Q9T7886vNSqCB2xROb59x0aUEdbEiMVEzd+vLYWjiuDqV+5Ll4r2ZENZ3twLhe5+r4TZm
	Z9w6IColrWgUJrUfYSD6/5+nyJmOoUNsCu7XDdGiNjP4Pueoz2ZNQ27QJnnzZqyKHJ22hEO3x3d
	KXrleuCoSTk83NHEzTxRExLrEuemZiJe+tWO3afJCBEoRji2yfx6wzrZWbEQLNCWZcpu4+Kvrpk
	4sTxIhJT6GXuMGfRR3egvvrOU=
X-Received: by 2002:a05:600c:4755:b0:493:c2cc:aecb with SMTP id 5b1f17b1804b1-4954a51590fmr286003695e9.38.1784730527209;
        Wed, 22 Jul 2026 07:28:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956537c7desm218995045e9.7.2026.07.22.07.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:28:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: laurent.pinchart@ideasonboard.com, jesszhan0024@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, kristo@kernel.org, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, thierry.reding@gmail.com, 
 sam@ravnborg.org, Leonardo Costa <leoreis.costa@gmail.com>
Cc: leonardo.costa@toradex.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260623195741.495734-1-leoreis.costa@gmail.com>
References: <20260623195741.495734-1-leoreis.costa@gmail.com>
Subject: Re: (subset) [PATCH 0/5] arm64: dts: ti: k3-am62-verdin: Add
 Toradex Capacitive Touch Display 10.1" LVDS
Message-Id: <178473052640.1949706.11360946998734187321.b4-ty@b4>
Date: Wed, 22 Jul 2026 16:28:46 +0200
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

On Tue, 23 Jun 2026 16:57:36 -0300, Leonardo Costa wrote:
> From: Leonardo Costa <leonardo.costa@toradex.com>
> 
> This series adds device tree overlays for Toradex Capacitive
> Touch Display 10.1" LVDS V2 on Verdin AM62.
> 
> The display addition covers two interface types:
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[2/5] dt-bindings: display: panel-lvds: Add compatible for Opto Logic SCX1001511GGC49
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/6ce748682f746a0c1ae311191fb820b08151ddb6

-- 
Neil

