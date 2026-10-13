Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCABB48BD39
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 17:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913076; cv=none; b=Ar7BTrc/8Lgsw76U3YNI0xXeEYIEwINmf7atejjDEYfFHBsXjul3QBeZiWrmQCzIQqTnAAfVavup6Mz/Nm9qf2OkVF7pKrhfKT+Nc7jV2furlcRjF/H+izOa4Qt/uyyIgQ0jS05vh/xk29GVz+AlT1gZ4xp00aMSHf5GSv/fnZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913076; c=relaxed/simple;
	bh=IBWm8OoDuOOoK6QNsoCkV6oJjvsDZlll7v/MDvILjss=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=alC0+IgmaH9X2t60/IgKrEOSsRTG+SAL1jW27+aR0KNBHtGtFqpcGnrsIKSHw/c9MCamuiBEXJP4c+n4aT/gqEoCmL1ZD2Y2iN8UufaAgDRw7I2znFx8r+iZ2lCTuihBSb+bIrQoxwYlGiiApGgC780tMJ+wBnFMnk02a6qqpwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gTaswrx6; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gTaswrx6"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so32168535e9.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791913073; x=1792517873; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kwog7Istc+fIBrJkEcS1h+8HETAF7LvLAVFr6xgg7kM=;
        b=gTaswrx6nfFaToncTJW6YJ6RXiySzqFT8IgmtReTR7IMiVGHPNunAOk6R2+cfxyAIj
         N78NmnvjK1MH0Kp/w7YqCihQSONA8XkB/hs+ZNvpOGrRsBPfXP58OlfETCwi9POaeir5
         LSzfXtke0WVjEKkCyMZx2CuXFs16h4ee/cl33s29arv9go5FUmG9q8JVjMZZzbohUU0E
         OwoVkva6gCILEwcvtH31kr0wtyq6e7BC9WdU5zacHhWEDp6u819vSodAdmOdFu1tOmtT
         T0jJ495Nrl/8wK5AW/9MKyzD78g050lfwSW8SkbkGAT7OCUJ13/dNPUToZnEbkZIYLMx
         joLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791913073; x=1792517873;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kwog7Istc+fIBrJkEcS1h+8HETAF7LvLAVFr6xgg7kM=;
        b=ZfLGqy28x4iTxGdtLSseDyrwKLnMi9+EboFQnGQtoefx/wMJF3YMQTm/5m6Tu0XYel
         VEM4QzdD8eoiDVGX6xfCZNnIzNPqY9EycBMX7chQBC/sGPCLU+WKuQ+Cxel1PV8ldq8J
         9yfsoLgjszzl3A34B1ZzIK4W78LmDtg5SOZU8MaMwQJHZuMndUIPpR7phKfBp1c4Du9p
         1g8QBLXjwFATgMSjEYqrktYhui6vHY3hj4l0AkUeW53sktblj5+gT+2sMmAsCh2VqnJ8
         Re/yQ1HumjjEwlCgP/NGGruSSLgB6DgFv3bqIKknQNCbPnmzj5GnLTjc0HpzgMeha8rh
         tEqQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9HTfm6pV+3MYJVICpRacsTRUZPHJAAEQJ8DTF5b78llsAVGmHlQdMPNPDJvCIBf/PJkyLZnCpOwmS@vger.kernel.org
X-Gm-Message-State: AFq9FYKRLVGqWlqx+AnAqz7QxV6BOympO36cXtxqhttG2XpFVxA70jM/
	cws7frivQ51V6rGgkH1SEaSUtpytX5r6hiaBin3s5/qi8ZZLFOdFdtfE62R8hRFso44=
X-Gm-Gg: AYBFou1CMMfmhG5/ClA4ijGPQ3lmHoML+IZOb7dXamyfhXAcoPF5dqcOAbPFoMU6+dU
	BqydKKExYgYTFA+lZrZg33n+/IYLVDlDEarfzMqStrFrlPKv55eVUNDpDjrHQHiRfbC4dO0n3xL
	yhsaH+z12QHmJbtQ6bKVtZzhv//MrOyq7cq1PeNFMqVeG+950aOMVNf2xckiIT+JOgEN0HBnru5
	IyeH+d5GyM//tD60okR41wLVRQLWhQMT/Xf51iy+qwp3ngZC3Lxt+XSRtDOXNx1GpoOZLCW/0P/
	WUTrMXZGZ2kV6I4u3qIwO1w2GQJUHNDZS0mDNpMYfZ4h3CRnVuSu+ad9R/m0WIJaOUEhcWY4hNm
	yNIL4Ykv07IOwmJRc8SGe4lKY6ZPLvT7m48jl4/0xmp0H/xJR3myLgmrax9orc7ii6KezLS8JQl
	iWZ47336dgYVFejVfY4bNKw8pDsFUcCg5/mZhxhATP/kaAtOvaRsqtFygNZkKZeG63IRNSlBPt1
	r5/XY4EKTXSHosMMatfv0pzIY96
X-Received: by 2002:a05:600c:4fcb:b0:4a1:811c:8083 with SMTP id 5b1f17b1804b1-4a18e4c3600mr260249025e9.33.1791913073155;
        Tue, 13 Oct 2026 10:37:53 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19303d518sm350899745e9.0.2026.10.13.10.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:37:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 5/7] clk: nuvoton: ma35d1: Reparent SYSPLL correctly
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
 linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <87ld81v8y1.fsf@bootlin.com>
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
 <20261004-perso-ma35d1-upstream-clk-v8-5-e1a106a128c0@bootlin.com>
 <20261004205551.6279C1F000FF@smtp.kernel.org> <87zewti2pf.fsf@bootlin.com>
 <1jjynw7bp8.fsf@starbuckisacylon.baylibre.com>
 <87cxtni7m6.fsf@bootlin.com>
 <179181904945.33566.17882786294681341398.b4-reply@b4>
 <87ld81v8y1.fsf@bootlin.com>
Date: Tue, 13 Oct 2026 19:37:51 +0200
Message-Id: <179191307176.266355.13493126045902473311.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=vwYzSJnJvZdAYWxZfVM9vG2ExZs8LLQUp+M4wnaHYLA=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFnncvKjl3suKowPOtp5+qSoXF5T18EXvDv/W8V/7Xjrt
 14gsle3o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABOJN2Nk2GKoapzC1Ly2w+Wu
 5vXmWObm6B65iODHAm93OqTnlmlPZfhnuvOiacDxqbXP1Tl0pFKOX85fd7Vr7bZFM57m5izU5nr
 OCgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9


> > So 2 possibilities:
> > * You just need the .hw then I don't really get why you are doing it differently
> >   for this clock ?
> 
> True.
> 
> > * OR, this is one of the those clock where you want to check DT first then
> 
> It is not.
> 
> >   fallback to a fixed clock, then yes you need parent_data. don't forget
> >   the fw_name (which I did not see here) and use a local variable for that,
> >   not a global
> >
> > Did I miss something ?
> 
> You got it absolutely right, and while implementing the change I
> remember why I used the name instead of the hw pointer:
> 
>      clk_hw_register_fixed_rate_parent_hw() exists, but
> devm_clk_hw_register_fixed_rate_parent_hw() did not.
> 
> So since it looks like most of these helpers have their devm_
> counterpart, I will add this new helper in clk-provider.h. I plan on
> doing that addition in this commit because I think that is what Boyd
> used to prefer, but I can add it in a preparation patch that is your own
> preference, I don't mind.

Separate patch for the new helper please. Same series is fine.

-- 
Jerome

