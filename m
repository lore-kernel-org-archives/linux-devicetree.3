Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F9F29C35A
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 21:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776981014; cv=none; b=qyNCzcD/AJRWHyN0py+p45JyDzGAFpxRNUdJJRGib6cZYZ/mYFVxvRa/eUjfUAvFmw4oEDDR399TjT5jtfwbnY2TU+Pdo2G5ov67awNbovccUiY6B2L5aVylf2dqYkxSTuOkH+wN9Q9YqaMJE03blNgP86GwK/ZuHHiP/5FJBTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776981014; c=relaxed/simple;
	bh=LSRVDpEOamzQs0THbHW6eRIUrSeuuslIY0FvfldgvzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NNUjCjJnYPnD87lZUXg4JC/qbdjnvOI9iOapWAtmbtvvOGXgEz5aqkq0z1sCYPBtJbP+XaBMOpwxw5wvbbKiKFAmMxUvHMYF8atOGXHKl/K4mlJlA1836TRqPY8fRHhVCQFj7MsPOE4i4gAA0Q1zt99Qd14OZUO6/xxAvZfkN7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WqJ9v8hC; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WqJ9v8hC"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ba3115fe0d5so1353102366b.1
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 14:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776981007; x=1777585807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1fiSCPkq0DML3luJPuVMp7dn80QlXb/vZ8XRZ+msWc=;
        b=WqJ9v8hCG+MuP9NTx7ASrbPEDvgw2mjcWm9XbCwM0MRIXL7LJl7rlhEUE2tgrBngKc
         0ouVF8BsX0hEDfZQPtwT6oEJYRvXOj6oXGZFRu1x+XfUE7kD3i0XP94Jakgai0n4QZGs
         qGj7T6mRiVei7q1It+OfObJS7eGxNeHOHGi3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776981007; x=1777585807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G1fiSCPkq0DML3luJPuVMp7dn80QlXb/vZ8XRZ+msWc=;
        b=N3PpOrwSlfpuSa+I2psYmlbKokk7WJ/b9kvCQKV3IAzPSNjxeJT5aAAJ16nRwnR3zu
         nMOsibnMYlQBkQCuzHVOTxmjHNCd7tpY4NRbtI7NnvV3hrwgkrEUyt8m1f50bUBBVo8a
         lzXREGlKb1KB0ZJX5pyr/Tb0ZCSGmC9Pl+rcgYaE01FiYKAiOweVSGMqn8njKo3AyBO7
         tt1S4NprN373Tu4fKD5fhxlkKARTqD85poe5KKx/gUXKqhHSidCoIKSW0ej7Tj6gTZOZ
         fz5SeGRgF3UUggC7gi/xb8HLiuBrfWZ3FM06e/52Fy6S2yKIXM2e2lMST3pTk55ZsyRT
         XfxA==
X-Forwarded-Encrypted: i=1; AFNElJ8MyUyz60T4RibBdD4FdE0tfAd3LpD5qftmPVAEb1+uU74O8F6WSvXp66iYylsEd35ksQR+A1lik+vr@vger.kernel.org
X-Gm-Message-State: AOJu0YydKLnX0CcTw5nKKkx3mYS1QKe8UoVBHX92VPCx3aDV69HZWY+C
	VI1ohuT40C0va2AFQHm/izLy67WoVvcBO+c8XrfXNpBCi6ChjqtQ8BSorVK+hmpFz4VPbq3Ci/k
	K8N0CmQ==
X-Gm-Gg: AeBDieuZpySkHjws3QU1r6iSD6/D0VdZJ7xW53tbls9n2iJW9CTYcfM4LNjRchqp5Rb
	OzGzyQ0AYYwyxH5U/12aQKdIkhXLJ4hE7RMIiXKnWVYsXIbt+rmv/B/sTjXC0/8EilllZzfZ0T3
	EaXfCPQJ1oMzJBwg/p/vDYNwVrmPS++p8I3udilWKdT8zUsaDdtCTNgkKJrGzvsCew8ISflaeRx
	ZQZUUk6/WYQD4HJyW8+dxW/tyRSOyuwdMb6xTkcY6jUjDF69ZrSC8vwEtBwAyjIlKYe1KKFHtfh
	7rDELxG4IOtOWCJ+O1fMljvtgOsPNUwbfLe+IqXkUSjA0DOyaiXCJPwxMvzZouOoHoNTaUPd1Vx
	hVPfLMmw7RmU1cda545hy2mRuPmiSiQ4qyE2E7rf+lQJ/6SHR4+VuGNhg6BxmTlMbTrswE0wpfB
	jIQowdRWy5s40AMAiMCk1hDs/Wk9pHRSz5M5qFuv2ZFf3SSYHffqEYTpUWplt2bNXakWkNaz7p
X-Received: by 2002:a17:907:7241:b0:ba7:79ef:8694 with SMTP id a640c23a62f3a-ba779ef8ea0mr955166366b.14.1776981007259;
        Thu, 23 Apr 2026 14:50:07 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4555398f8sm700177266b.59.2026.04.23.14.50.05
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 14:50:06 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-441209fb77eso2474986f8f.1
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 14:50:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/SkrbvDvAxEwb0mWMNzefsPsyu5uEx3L+E6J1c7Rcqn0oOJDdXDFrT1o3k7SIjl497eIZ1xIJlBK5Z@vger.kernel.org
X-Received: by 2002:a05:6000:208a:b0:43e:531f:720c with SMTP id
 ffacd0b85a97d-43fe407383cmr43673395f8f.11.1776981004287; Thu, 23 Apr 2026
 14:50:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space> <20260423-manta-display-v1-2-196f80c5673a@timmermann.space>
In-Reply-To: <20260423-manta-display-v1-2-196f80c5673a@timmermann.space>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 23 Apr 2026 14:49:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VNvPtG_f1W942SKJfM4ptK8Wvd-nZs4geBCG3bO_A0BA@mail.gmail.com>
X-Gm-Features: AQROBzBZ12eQ8JPtoHklunZA7baGhpheKR11CnReOtZ62TdnznxZp2PUusIRrN4
Message-ID: <CAD=FV=VNvPtG_f1W942SKJfM4ptK8Wvd-nZs4geBCG3bO_A0BA@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/panel-edp: Add support for Samsung LTL101DL02-002 panel
To: Lukas Timmermann <linux@timmermann.space>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Alexandre Marquet <tb@a-marquet.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 23, 2026 at 2:15=E2=80=AFPM Lukas Timmermann <linux@timmermann.=
space> wrote:
>
> From: Alexandre Marquet <tb@a-marquet.fr>
>
> Add a panel entry for the Samsung LTL101DL02-002 panel, as found in
> Samsung Manta (Google Nexus 10).
>
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)

Adding new panels like this is discouraged these days. Is there a
reason you can't use the generic "edp-panel" compatible? I know that
the exynos5 driver is pretty old, but a quick glance shows that it's
based on the same analogix-dp core that "rockchip,analogix-dp" is, and
that seems to have support for aux-bus...

-Doug
