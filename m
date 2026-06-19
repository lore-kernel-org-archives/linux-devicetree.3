Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB643590A9
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 08:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781856542; cv=none; b=ee/M1Um6Ez1QToSgPqt0d9an3HnevCWwWMES7etBN9+cO85CA0oHcaUCQu0cAbeVPoOTXOPr4bh/JSGE6Rhu+ZzySQn2Ow7VtjHH2am2w6YI26KCGEZV5xBiQmuZAcyllPS/4aHJ28gej3htfkhg1yYNGDeChFClM3fsi4w2VIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781856542; c=relaxed/simple;
	bh=Q8PmtqTflgVoZpw6WgtVxNsuet2v+T19+3e0QsGeEes=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=l4wxnpLJ/ljz8/VU9b+nnmLN1ti9U+ynaTvWmiSkO5IRiWz29drEcs16XhM+cA1FXk0OO6NH+dgjeljuU3TjaER4patu7ieVdEike9p09dxyqv9vGdZFOPdDDbR37m46/vGDU8ra0Sr4mDVxPco99EX80aF90O9iy05prLbiZt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GlkfFiYS; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GlkfFiYS"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4627adcf4d6so1188374f8f.3
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 01:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781856539; x=1782461339; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I3WNaVa6u6+Nzfb3NV3ypwCQ74H2NIZsFLsn4sFU7yo=;
        b=GlkfFiYSXy9uL2i9jTllv5WhkYSQs7xucxFgq/ah4ps9ZjZrk7zBTVKd61rJm4AC5b
         ox2EgPc11GPCxZ5EfSK/0sPxPnzlCREWNfp1Ynr72c2n0apZqoKMhkxEe/obVUGdDoCw
         tKGDKu5sI9x+PdFcQOP+8rTnrCVFsYCwKQNW0IqFmxK4JlCMGTWFyoli3LNblJMTVmg5
         2dTCljvTmicvRtJmgw4R13SMaRbntevBsKdkWVBH8Mg3PZ4Viq5FjIgRgsPScrBA3aod
         LD+BeLa2F/hL7KhgscpRquuUgelW+NDooSuPD63GS90+fKCxuGZ10NyprYMpZZpWmIfU
         4q3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781856539; x=1782461339;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I3WNaVa6u6+Nzfb3NV3ypwCQ74H2NIZsFLsn4sFU7yo=;
        b=ppWWzt9sxKIEmsnMMIrfrlEeBG97PdFfjjpUKxwQPEwJEXKloEGy8mlrozQMjupOJf
         UB7XvJrOeNB6KsPbsPuJNCjBQ0SoaoukKUUxvUViOMiHa52UmRp7ACgrKsD0nTxZqApw
         j5pAOu1Q5foxb7UeA4jTBNPt2euONX7M+YqniNMcj4kBLCMzMT0QX2N6/mdacWZjfJKD
         TAzWs55CVMvJezK07gxI+gLHPeGxxnM/pH3MQcTdNUeimFBNUGRq0sZMqgLaEDsKND2t
         cPxla6Kf7ZkMaEbT07gPeDxofGm0ysilFSOqlavL6FtahvCw1+vLVgmIHpOqP0VGVFVA
         aWBw==
X-Forwarded-Encrypted: i=1; AFNElJ/fueUW16U0hSevpIZo1+WV+i52MoBww6L73909oIxSDHtK6IlFcB6owIL4aeXiFl1SxJFiyxNiktlr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw11gJCKUK6Mmt2eyD9xKm2COVi1Ufx/l4STBGDp3DwCGhuJchT
	cVUuAyWaTon/u2zvjAVM+lPjPgRMW7uM+sjs9vBds5c9suehjDFuWz+EOqDtTh2pGkw=
X-Gm-Gg: AfdE7cm1UlLdknwaC0j0ZEUpIjtvc5ETXbkzwIOpWFcqUwHG1o4occf8dms9JwC7fGN
	b9wPiwY5t9dEp3RuMfX3lYGeEG8QfONQbT9RvdEdFq8ouXZuvb1jhrxF8EaSJqS5MdSyopXGN20
	RbWnPCe8vP2Jp0/bRmZHK6nz6s6ZywPvoMx1mA8UD1C1z5GGJiSCSj/bc/bIhzEF2nSIzf3Kji+
	acoxOTwCWQA+fhePtsmiytcq68DX6V0DGQU6h8Y6ssftv0fNPScB0B7hMi2QAHlmmznhkzMitc0
	t/rv0WC0DQR8V3JBA3Z2w9kJ7e4O9iOfECcB6zKBAzYTytZPo4eG93I4idARQQR7tNCdvcKl4/I
	FKlxA/oJ2ulL5CXlLJPS3HOUUzrnqktvhKyWDgWc4MJQZi9pioRi5M3UjkK83avDWFax07dHvDt
	2nFlvFUMO96yLoIdwXhiVOSg==
X-Received: by 2002:a5d:5342:0:b0:461:946f:9bb4 with SMTP id ffacd0b85a97d-465097867ddmr3541283f8f.23.1781856538850;
        Fri, 19 Jun 2026 01:08:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:95ed:eac1:5731:4e21])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4650b67a33csm5299452f8f.17.2026.06.19.01.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:08:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: jian.hu@amlogic.com,  Neil Armstrong <neil.armstrong@linaro.org>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Xianwei Zhao
 <xianwei.zhao@amlogic.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/2] clk: amlogic: Add A9 AO clock controller driver
In-Reply-To: <5af78bca-7c49-48b1-af8a-cfbe55ae26ba@gmail.com> (Julian Braha's
	message of "Fri, 19 Jun 2026 08:48:49 +0100")
References: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com>
	<20260618-a9_aoclk-v4-2-569d0425e50c@amlogic.com>
	<79b1a519-5723-4e0c-904c-b7fdf9564ee1@gmail.com>
	<1jbjd7c7ip.fsf@starbuckisacylon.baylibre.com>
	<5af78bca-7c49-48b1-af8a-cfbe55ae26ba@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 19 Jun 2026 10:08:56 +0200
Message-ID: <1jqzm3ar53.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 19 juin 2026 at 08:48, Julian Braha <julianbraha@gmail.com> wrote:

> Hi Jerome,
>
> On 6/19/26 08:29, Jerome Brunet wrote:
>> No, regmap clock are directly used so this is necessary.
>> Relying on other module dependencies is not enough
>
> What do you mean it's "not enough"?
>
> Functionally, any user of COMMON_CLK_MESON_DUALDIV can also use
> COMMON_CLK_MESON_REGMAP.

This driver directly use regmap clocks. This is a direct dependency,
required for the build and stated as such. If the module needs it, it
depends on it, simply.

Relying on indirect dependencies is incorrect and fragile.
If those dependencies ever change, the build breaks for no obvious reason.

>
> Unless you mean for documentation purposes?
>
> - Julian Braha

-- 
Jerome
