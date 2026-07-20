Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D753BADB2
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532155; cv=none; b=K27p1paNQLQA0LukE6pN6XEgAbO9OtM3Zj+8gZ/sfSBr7LRSvVFNAhnoL6K1XWAiEwM2mzy3T8B+X1+U10k5f2VnVMXHC8Q+DEgsX9aYZUP0cOocK77K8n1D7T1iyD3WPhjc/Hn2zaGlUMK985A82WMwSHhqW17+17TKkBDnCZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532155; c=relaxed/simple;
	bh=xKIYy9gLfjK0ErQeo2wTtFZ4ZjVBR6dJaUHPV79mAoQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=lQtCogFZAdezTHBDzr0rsQTmkroec8olNXrfTX3KFsi13sTkPtzdYRCdMVrWtc117ovsOqQRTVdl2xn0yRISD6kEkFh8K+Q5nFBcODFkD5g9dd3UUWUDYgxwyyMg2Cs47m4q8XoB1OWjqZBQeiEabj/pXQumV9sb7yySUqdcj+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCRHRtVf; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCRHRtVf"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e041ea211so7551801a91.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 00:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532147; x=1785136947; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=81wMdawUXuj3EXOCHXXMqn3Ymvgxt/Q4XO2qMQYsZSs=;
        b=jCRHRtVf7dYTY5GNaR2bjf5gXsjsF8w4YiThme2M47Kn2Z6eH4ksYC+FnaDa90fIqd
         OJVUGMElqlQEN1lhPCm/d3FWjl7wqxzcguxAf+sepQfoJVJazGxD1gNmoti1GT6KyRR7
         zAI9QYCP3wRugouNHWXuRGeqqCgNfwGVZC20Ni8Yl3tXTS2VpDf3uo1iyDvnMfQr9asj
         JNnPf58S2EAYDCrMegmQaUfdDkY5EVEI67dmweGnoFqIqR0OZwn8Xy6pbVN6aM/Qy1NX
         jTa5cYRiNZjubvKwbQUiXItr8VopFraOPe1/tVV4nmOwDROnMwNT5oL6SIr2vqod3O5t
         QKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532147; x=1785136947;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81wMdawUXuj3EXOCHXXMqn3Ymvgxt/Q4XO2qMQYsZSs=;
        b=fu45Q/aQUhJLLlUz5J750glyS70hRvU3BdjISJ0f+moF/AWYU14CUVJeRnAbqGBPnA
         s22dGl4RB/V85+WUjrDtWW2uuK3JwmeRSv8MvvQEJi+wtqN/IKvzoNfzi7hDElbraYwT
         zlEJkQbpJlZO/0XoucDPa49vl6ifpXenChI4Mi83MjMz1A78fSXACWBDuOBZkeDcRE3V
         ARKTnzsvk7q2Vmf6JoPHwHu4WXhnpH6HOfGVJvA2ZgILu7jTVwXjDRqn1hMH+eeD8XA6
         JU9ngmsvR25OCDgvM71JeQsVdGGCKsM007go9T0D0LYZuag58qVJ2Qsv3v7LvSGVoNNJ
         r1iQ==
X-Forwarded-Encrypted: i=1; AHgh+RqpJQ9o2YZ5S+psxf+VLLa9IwDxMbmx8avc87ilTB8QUqWfRzu13B2Chr5B+1HsAJ8OpcUrpSAu8uuK@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl5fBZluwkhtT+ccIXdE0+AStOEVYXN88/ijKvX+6DOPqjz9ES
	c5sVxZHoB3STQyYfflDE1A9HTdEgQVihHUUjArhZm0E2K6VVHkicOZEZ
X-Gm-Gg: AfdE7ckCW5SkYMfq3zyiEtcBrXoyy8XihIsRVn0c3Wmqak17muRkkYhZes6gStIcUPW
	hpoaXRlcE7rrnMaE7zZDMqg5ISd/oO+JF6+d8C/AXdXOOXOA7ndG0PCI7NBciw9xWTFCQdH3cPB
	o2l8tItMM0hNo9G7eo66bStZ1fTwq7VOlMyz0h/6xPc7CD+WaITlXubuIIBYt2LCQ74lmNVCBxm
	T4NUGV7BCDtxsNWtcMmQyVFuNVQSh/rFG6pQyNmRWHTMqOBDl9Z2lJFattZ/IxmKMWXoLYbIMtp
	vCq0AH4LEiX3ToGMwc+vVe+htuoSAjXHOMFumoKumuc+Q/sQXytYHQ5Mrvg42iFX4LkFTAuzd/s
	2DLnveH/a1sEK15+Uk/WRRpwar+5SMRJDrSjrYQ6FnO38Wn74D64KzVHrx+AvZWoijKD42MpquH
	EqGFT+UhcgCw3GxaErDsQaBFRBkhFf
X-Received: by 2002:a17:90b:4e8f:b0:38e:2524:7272 with SMTP id 98e67ed59e1d1-38e4b57d481mr13255018a91.39.1784532147198;
        Mon, 20 Jul 2026 00:22:27 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 16/22] RISC-V: perf: Use config2/vendor table for
 event to counter mapping
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
In-Reply-To: <20260701-counter_delegation-v8-16-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-16-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211939.543975.4098345314278669087.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=949;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=xKIYy9gLfjK0ErQeo2wTtFZ4ZjVBR6dJaUHPV79mAoQ=;
 b=Ly3CRkq9fX7mfbzsfqw+WnDr1CsLgIAkSJ/QQHpnAJqY8KMG3MPlUEx/DORUyeO8ps+EOVR5Y
 5Eq4Nbwj+loAsV8sFj39MhmKvuNa4s0QIzqT0Bx0tILO0RH6WWklGo1
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

On Wed, 01 Jul 2026 01:47:04 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> The counter restriction specified in the json file is passed to
> the drivers via config2 paarameter in perf attributes. This allows
> any platform vendor to define their custom mapping between event and
> hpmcounters without any rules defined in the ISA.
> 
> For legacy events, the platform vendor may define the mapping in
> the driver in the vendor event table.
> The fixed cycle and instruction counters are fixed (0 and 2
> respectively) by the ISA and maps to the legacy events. The platform
> vendor must specify this in the driver if intended to be used while
> profiling. Otherwise, they can just specify the alternate hpmcounters
> that may monitor and/or sample the cycle/instruction counts.
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie

