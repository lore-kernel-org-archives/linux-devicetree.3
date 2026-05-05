Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AF3335555
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777975515; cv=none; b=bWJo1U8fPrdSt4ctHimUUOx8ZniTwzJJfIhMcpfQpKtgFX71eIGfKfxX5f1cevFfzi/PgTQm2XUDREQkFvVmOvnX4hX3vatHh20H4B6CosgnCI2AulcaWVqBDMtwGhQevl77U1Bxx7Eu5iu/fQ0cG3BLV0ZdJg+8OBPYJA8f5rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777975515; c=relaxed/simple;
	bh=85ZMPLGpxoRpy2f+r9DYTWj94EYD6Y1LmgoIzYUd+t0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ATm1KYO+afqoObk4hdyaFw4ABiXEqu0+09vlJuD8vFrBaCgw93ybEa7pfoh4yZWjrmzUmHZsCDAk49PD70ToCpj50fcMU2xqqr+nzrZNr6NEK0Ge7067xxy9yGr/bol74IJy/lO38tqV+yQJmNX//QM7kP2FbLstXUQNEkX7t6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x4WeLat1; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x4WeLat1"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso37808255e9.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777975513; x=1778580313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDcU1VfHbCGuJTy56GX4ox0vXLw5tdTcv15F5Q8EwE8=;
        b=x4WeLat1U49eluxR/Zvl8zQxcAcnqlQB1mNh1wB8q9hUMv2UcoCIb3Zxp8/WcV3m0m
         Q9FvUSx9SYXpIioy0YPH3qz+MNB3/FCt9P9pNpb8CYkzbZxnaoKryiUGkpUBBT1eWrAL
         09gAqjHKT53s3vm5q1dGMlumGlU4JvIPkBqqTqcY0vq6K1SHdcJkZxb1IY/bIaww+wv2
         8ei/mXZbnTa4GxCuvfIHo0kOXnhniqQIFAU6GbYzwArsIA/k7M2zYm0UzR4mD0NBrpn6
         V7XtOrpuRPCj33LRorWFVLOiEgU+0nDoPTLfPX1HlnbHi3vjfL7d5pAB07yvANgTPfc4
         e5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777975513; x=1778580313;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PDcU1VfHbCGuJTy56GX4ox0vXLw5tdTcv15F5Q8EwE8=;
        b=loQ7qfcDv3uD/GsAtqX9wW4ILPEJAypxnXeB6NiVzsmRU5f8YLIB5r6au7pMNH30hK
         NZPh8FfqzsLiUj+PmNmY33vtdo1HlSOrT6CS+bmpf3GvEoQYLm/0/FzKPJeULlBLAy+c
         pGoMuTkp8NQsn6d2B/Whv60x1vnXvXYmqdCMbpREYbmljrJmXd7D9yhjo2+Q/a6jjW62
         tO4V2nlNgXZkY4DS7TSr+3mCottDzf50FISoJ6/AM7AZHxifNPfDd10/wT/5GPjB9kSi
         qutTiHxDR7lRm8jADA3D/ea3KpT+cwSJflODiT9BNi34z7/FPjvZn47vx3uH1GAPlObZ
         ptAg==
X-Forwarded-Encrypted: i=1; AFNElJ/tfTExDafAGqLInivSCjbP6+r2E4Vf2CfKjQyI4NasfYY7GcYKxFqWFkmUqz1Wp7g/fzY8Id+coZo+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4yuPRbUVnvNMgxkGpXly4Ws02r+qo/lPbKC/pIqHGw40ojJL7
	cgRcc9TvOfDykfS/McD3Z8npFS4xZnrpyt2OKmmOAmFSC0N1qfiLsqnxyGNGnlan7TM=
X-Gm-Gg: AeBDiesjtq03MMVf9cZetLrcEWzukHB1TRMJzVEqhvJUnO+bu35EHCy2reqjZK6GKzJ
	nrTfCD+HV6Dt5n+qWJIyrxA/wUjovOBtNF9mc28fZ5jVloFu7oIkczaCjB94aQcwNxRcpydkruw
	DwzpsCqrKeJr1LbHp9ec6aWiiDoN9PvRKWfzW8lir0caNNkkAvU3eVSjxLKriyvYaNGZpUIYZMe
	dQUXCbG9gbqdV9tVr5xrveejJvdZldCqKKXZ+wqHubcd2k/go8GmUWLHPDqC7i4lnQ/eotKKRzL
	N+FwCWDYtIBH+sOBzHYK2uJv7M4+C624csHwcoUDAFH1xjWCFjXVgQJbhvK6ZL699gVkwo7z6ni
	HeST6zeLdl1+VP8X/PRTiJLC6365uXVUMw+BMAZ96il0mSSbRfrq4r7a5uHz7QDD2661JdWWuVR
	CUx4MCIykLkTVBVVX3n35UKWvfJRI7DCoy+BixkoYb9WwgMr61gaDtTm0kbRNAY6NFWw==
X-Received: by 2002:a05:600c:c082:b0:48a:5821:5ff2 with SMTP id 5b1f17b1804b1-48a9887190fmr152119415e9.8.1777975512645;
        Tue, 05 May 2026 03:05:12 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c8556sm381856295e9.4.2026.05.05.03.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:05:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Stefan Kerkmann <s.kerkmann@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260407-panel-simple-startek-upstream-v1-0-76721696655f@pengutronix.de>
References: <20260407-panel-simple-startek-upstream-v1-0-76721696655f@pengutronix.de>
Subject: Re: [PATCH 0/2] drm/panel: simple: Add Startek KD070HDFLD092 LVDS
 panel support
Message-Id: <177797551157.290023.14211642204638721298.b4-ty@b4>
Date: Tue, 05 May 2026 12:05:11 +0200
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

On Tue, 07 Apr 2026 11:31:15 +0200, Stefan Kerkmann wrote:
> The Startek KD070HDFLD092 is a 7" WSVGA LVDS panel.

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: simple: Add Startek KD070HDFLD092 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9252742eeb74853cdcb7972eb2aa39fa6385752c
[2/2] drm/panel: simple: Add Startek KD070HDFLD092 LVDS panel support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/247e7480c13e77079b71e783c478fc7027974161

-- 
Neil

