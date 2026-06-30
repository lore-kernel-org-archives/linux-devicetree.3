Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C064A3822AB
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817387; cv=pass; b=hkz4kg8Sce/8P4osnMfbm0MezV6ZDAg/162v0Ji7g44O2AEHCoSApneHCNtxiC/aHSmsaaylS8BK0MWI7q1zHHyEqN5KDvfR8fuKpuLAX+g1Z8Am8eHbmBjhMlGpcErTktbniC3eF66ivBoRQLLZ48qGJl09muYrU+M6Bk0V+6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817387; c=relaxed/simple;
	bh=bvJH40d0IrIetecFCQlgRVfs0FrCD/qnuQhwohU6QjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r2yPV5NbcTzIzrXM3QZkOtN8KJj2j8YmpKiImqMyD1RaYiQvw/ch/ggXFH7JE+qr4ry3k68fkcBKKP60arVDRcsJsq43uX1aZmOWOs2TesZQ8q5P6JS7ZFdVVRy2pJoiMXP29VNttPFBpPjUjgal1aenD4ghT1y7OiNKnsiWt/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FI8Mm/CC; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FI8Mm/CC"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6983f8b0aebso721367a12.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 04:03:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782817384; cv=none;
        d=google.com; s=arc-20260327;
        b=BLZSAIyMZ458t4Uw1djup4AcDbpF09e9fB/nC6Qz+L9b7E3+luVR5NPcq57bgm74tY
         2RAWIhz+/Ly/2S7YlAhTw1QJctrRkEuIu/PTpvVnPH7056S6Bi/cJgS2ze2HU3aqT6Q0
         xjRAP/bFzw0JgsxgmGr59WZtC11ifdd2C7jUCuKuzaFGn6bagWV8GI9AFbgImzHFtCem
         YwKzgFh8OZS+bKmNMtzm0CruzDwCDrrCEhkR1WsUyBYIHjhCHkAE+PoW8rxzT+hVFM0a
         5zpNIR+O/wQ65xtrcml/B8mujSLbiaP5zMBlg0yDrJ6XzRiVz+Nam56eIuJowldI/Jh6
         SfcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bvJH40d0IrIetecFCQlgRVfs0FrCD/qnuQhwohU6QjQ=;
        fh=x6ihVMKBgtbTKMaYI1Ci/C2gLinqYyK8XZkddRkekgE=;
        b=J58zQT/pEmWWzCO5qNTfA8PFne3m+ygEPzVsJjXBU6dtSEx+4aNWWNsTnmyT+Z0dMB
         fVabDMeGH5aN3vxd9NVmhzfGsSfpGbuSjuC9o8g7CZ64N9t76GYdGJ6AJf3c9QJQd66j
         NBxI34DHL79dGSskpMWtguQW5JVZc3IewZiziPWM8TLJqXukNrzGi65M9tTB+YUbHgv+
         0+qt75rK8ZcNBHhYRtKncTroKCIEgmkc2e1cgHWNYoDS751D9HnsZKvut92CBkcRwisT
         Se2VNBfh0zu2UOAP+KkNJF+ygRwBnv45WqSI+iydiLqg+D/xOe+K1t2FKNa90oRUfbfS
         LUrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782817384; x=1783422184; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bvJH40d0IrIetecFCQlgRVfs0FrCD/qnuQhwohU6QjQ=;
        b=FI8Mm/CCqhCN5gcgXwiyaPrReLZg2XBTJl4ZBvTdsTX7PhNxJs00V6wYnKXAYxxWnX
         FX4gLOzWpeTqYp7exZk0PkPyvxeGbAwHEGHunoHT3vDYpu2UscNwjV3mt1ws22WwkNmX
         2pLmtNtVTJilFBX3JGGI6dtJgSCid7bPHoll31MGB1Z2ZilMfFxMtV5OQs4AthXUnjVp
         evxDZVYjI1bxzDvCov5PVDzdOhWEFqmcC7z/knhMJZF5SNBiMLA+7LcrMiENw5+G5iTj
         ly6aob1L79tjfy/fd8mgxTgbU4+4mpktN1sU+74tivnd1xbZeXy/wiHdRbHneJ39SUPs
         2UbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782817384; x=1783422184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvJH40d0IrIetecFCQlgRVfs0FrCD/qnuQhwohU6QjQ=;
        b=fv89FM31r0kFHGNXd/igufNeMccS7fMM9Nya3TnlPOoSMvKnXZ9wpOdAsWQhx7fXN8
         0B/sQyUYE0tHNwgEE8Zv7KAP0BrmzY1VZ7ONRUT7ELs7FNXknbQl5G2tkK7zZAETKgdu
         xlEUplxxKMeOJZyTCsJO7K0kduwDyTqk/EfXRLu3RFa2R6934e+j0lJ8E6WPycba+2MS
         4ptn8FvVxu7HWPZD25qDj6RGKLXyiiy0RHFzt+TOkYtO8XUSOOwnjHxHpEs0pRyXtDRu
         /nzhJuzGiDb/HDZY7VGNAYh019b3/e9FcOaXKL28QJHWPbHFbhnfpubLZC7OKyldVFLt
         UYCA==
X-Forwarded-Encrypted: i=1; AHgh+RraiUitBscByAq5ks+MXc+oB7khH8Qq3bZnDx8OEixg566wIBxUJNhYSn1ehqyAiGHCNqg5Q5rWC0HF@vger.kernel.org
X-Gm-Message-State: AOJu0YzLMaKyi/7v9/nCcOWMiG6cG+iCxHRDSRgomkQeAPipFxI1OBhT
	eXHAq9lAqkNOXADIIu4nkM9YybCsWACsAy3aCsQp3RAFM2JfpGdnHnMQz9Qrrjz55zxohnh7wwP
	FgSXE1/RuyKl/fOxLd8RwYwtPCmaqW7qQxROwriQphw==
X-Gm-Gg: AfdE7clNyxbLVn+TlTLt8yichAnLaSL8iy2+8QIh24VcFIlGH421ib6FK4b7ita5Lo5
	q16m7xoG40vPCXM+LERCr4UF2RzzYhi4uPPhYvSUZeh0bO9HH5/+nPRkQrjhOSp7U95A2pU/u2q
	KL9e+gMjvAMjWAM5qBWfw+ngwfWzzYjmyjz9yGk5qgd4XDMFoTi0VEIqCOsf4UVnOngjB/nFHjY
	OuxdmvneksmOZC4At6EcDStY3qxO5zqczrLOnD49sV5rO2hJXFL6/RSC43GRblFbcyTKWG0aR+3
	w2Sv9UqA2ZztEkF2Xb8ALGsPxMuOjw==
X-Received: by 2002:a05:6402:2695:b0:697:fbe7:2028 with SMTP id
 4fb4d7f45d1cf-698819d524fmr695334a12.13.1782817384224; Tue, 30 Jun 2026
 04:03:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
 <20260613-exynos990-peris-fix-v3-v3-3-2b230db78ae4@gmail.com>
 <CGME20260629123246epcas5p2aab9da9ef417274bb0b70f74c386f7b4@epcas5p2.samsung.com>
 <CADrjBPpNQd6WgwVo-a3Mz74d1EptPm9D9BisLEmoFRsdUb3izw@mail.gmail.com> <0f1e01dd0844$01190c40$034b24c0$@samsung.com>
In-Reply-To: <0f1e01dd0844$01190c40$034b24c0$@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 30 Jun 2026 12:02:52 +0100
X-Gm-Features: AVVi8CcnyhJ8d9gnBSRZyCKu3M5tPQ4ftaBlF7F7oCbmkRZx4xm5fGDGZptwHa0
Message-ID: <CADrjBPoZ4G09WGC_b59YWq3_EfTaPFyp0dD7VizKLYBW_eFk+A@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock parents
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alim,

On Tue, 30 Jun 2026 at 04:53, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Peter Griffin <peter.griffin@linaro.org>
> > Sent: Monday, June 29, 2026 6:02 PM
> > To: Denzeel Oliva <wachiturroxd150@gmail.com>
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>; Sylwester Nawrocki
> > <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>;
> > Alim Akhtar <alim.akhtar@samsung.com>; Michael Turquette
> > <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Brian
> > Masney <bmasney@redhat.com>; Rob Herring <robh@kernel.org>; Conor
> > Dooley <conor+dt@kernel.org>; linux-samsung-soc@vger.kernel.org; linux-
> > clk@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock
> > parents
> >
> > Hi Krysztof & Denzeel,
> >
> > On Sat, 13 Jun 2026 at 13:36, Denzeel Oliva <wachiturroxd150@gmail.com>
> > wrote:
> > >
> > > Correct eight PERIS gate clock parents to match the hardware clock
> > > tree and reorder the GIC mux parents so mout_peris_bus_user is the
> > > default source.
> > >
> > > Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> > > ---
> >
> > Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> >
> > @Krysztof: I was thinking, maybe we should establish a new rule/best
> > practice for Samsung clock upstream submissions whereby patch
> > contributors should link to the downstream cal-if code for the SoC after the --
> > - line. That would make reviewing the patches' correctness a bit easier, as the
> > downstream cal-if code would be readily available to the reviewer.
> >
> We can leave this choice to the reviewer if they want to refer to downstream cal-if code.

Generally I would like to, but I also don't have time to hunt around
the internet for a downstream kernel tree. My rationale was that the
submitter is most likely to know where the downstream code is, and is
likely using it for the upstream clock implementation. So, linking to
it as part of the submission should hopefully be fairly easy.

If it is a Samsung SoC for which no public code is available that's
fine. I didn't intend this to be a hard requirement: "you can't
upstream x,y,z unless you link to the cal-if code". I meant it more as
"best practice/guidance"; if the cal-if code is publicly available,
linking to it would be a useful reference for reviewers.

Thanks,

Peter
