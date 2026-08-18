Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9731A4766BB
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787057772; cv=none; b=UO1ILY4pekQpeddhKv8m09Rc48KYCg4d9qpynQKvzSWeky4Rci0IqHHz5PN07u3g4pF6dGXFhLPcZFDSNVHfdxHZ7LAjY/dd3jut9U/Lwcqv/yvUy27O38J8lvaVTEEJyZYmzH4VgOxJF41eXe72qMERYH2bRAgD5X+wP/46wdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787057772; c=relaxed/simple;
	bh=O+uSJ6l/nC8L/Knw7obnre4I+TF6Q0+iDF3z0NVIK84=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=KO4KfwJDzcGyfEAuQjtPtlcAwgBO6RlENuykYglSWFgbAKpIlPzIKodo0EjjYI8nYM2qmD7FMQXO14vNtp5r1WQb/W97MkrSBDS9ID8NabBkvhkoiI/M8T2vazMAVITua6+JRP84yOubnPEt/DdGfiiA/s8Yij+CzmbJGgsAdWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Ar900zU/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Ar900zU/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so51281395e9.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 05:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787057766; x=1787662566; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XKi7bHvcr4VfrcOT9VHCYlKY9RJwWhe/hZvFzt6Sx4c=;
        b=Ar900zU/LW0ppyVBZSmOh/J3jppGr0qAcApPoUFWm3+qtsjMtGJjmuNePQ9IOp0qaz
         VwXIFuj0pK5lQtQavHV4KYuF1Y4x1aLjyxI4wNImIb9Ze9Rxy9xyYy+irCF8urCb91w7
         c+Ok8Ozbw+0GkEXVtlhii0OOxm/7bWsEy0lzeTfoPckH/7ZzsKdwpGNbAKLd5KHTrBGO
         RubLQYT8F+mKK4tO3wpkVbfAtH7zQ6lCpKfVWZCkDJDKxGAsTkPTsA/aGoALXh1nJL2a
         1gpTTScjEW52o7F4GB6h7R3H6Y4KLD8H21uLumDqMa0g3IW6NVHJRFqCiV/3fDaWtFSk
         jULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787057766; x=1787662566;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XKi7bHvcr4VfrcOT9VHCYlKY9RJwWhe/hZvFzt6Sx4c=;
        b=W3qq4Rp6yiFAumckCNDqm2ZrfuxIo2ATr7doVBVjZcwa39CScEXnUQAYD1gKnrG6I8
         a/g/9AhebG6Z5yzeIVzQ8V0mfNeeEsVMGaeke+CvtH1u4WgGZJ9Um7Nc1JkRmhzGoDRs
         DD0k5MWs0VqyYD22vz1romCrMd3lk7V7p+WjIsPpTjfsIb8xudZo3Lo/DFVuO0eZ80nG
         lM6l3XD1R5qA6n6bFbiRVGhx5q7MmQ0OPXL5ln3H6H+l7SZT7sLdUo/6jwHVhkEuPi+4
         YHFjXlNUAnLJz/fRl7JQTRgH27cYT/oIcIPd6SpE5nT9/AbJJNixn+jIJmYTXsAcWtff
         LHgA==
X-Forwarded-Encrypted: i=1; AHgh+RpS64GrWmNWVApB/C1iS9DuZu634dvYS3pDekLBHaGi3+A7XCN5duzgaMTtylMDroEMxE9RH28HDtAu@vger.kernel.org
X-Gm-Message-State: AOJu0YwXbKBulYXw1PmMhu1XmmOh8RB/t3BURJpGVfZfdKg+P8czRgcT
	ncapnuV7lCSPeZ3rmRggMHH11Hhq++A3d9p+ChuM7LcMjQ0POznhDoMvj1y+QLkTc5g=
X-Gm-Gg: AR+sD11ZzqFImB9xEb0mdTV6Ao6haCt3vKBAg1eADEJZAqd2BEwXaTTYqX0O3zswklo
	pgmZAMMQ34CjXZW3Sm3rueJeCUWvw98OpMXf8/GkQMpPiw0RSR/WkN3A+Kyli2EssjrCcIhX3r4
	2NkDt90BjdY6iozWn1/zG1EMC36a50jvE2R6f5pS4abe4RJ4nHzOgUfv/b3Qx3bHQioRXVoPro3
	vGjBHYJR74iZ1yaWnOQbMSOJLYfxZGR1w4pgfjSjfnrlViU31nnlGUGXYdkbaTYZN8KZmKpzig/
	fYL+AdfGETYeWeGyIIBeZIZg1rUvO/pGL2d0CcIf38FGfyrHcsaOel0wK9sXyiAIbu5prdXdJqB
	+iX7CEsblUXS9oR01zTke99DGWziqwS3u1zXmAS/MkkxE/UtS1lvrA3Lh4KqOiWmjHs9XQTOiUr
	7q6GGrrgS/bsZrgGWGBlE5ttYn7sOAj+DqBeWYTNE+2c8jAODhOOrwAEqyRhOztn9mcIiXZwIPM
	SpD0czoAUbMRgK5ZUiwh3M=
X-Received: by 2002:a05:600c:848d:b0:499:48bb:417e with SMTP id 5b1f17b1804b1-4998933fd6emr506661115e9.2.1787057766181;
        Tue, 18 Aug 2026 05:56:06 -0700 (PDT)
Received: from [192.168.5.218] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999d0fb85csm174771215e9.11.2026.08.18.05.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 05:56:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 1/2] dt-bindings: pwm: amlogic: Add new bindings for
 S6 S7 S7D
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Junyi Zhao <junyi.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260521-s6-s7-pwm-v3-1-57b073fbafef@amlogic.com>
References: <20260521-s6-s7-pwm-v3-0-57b073fbafef@amlogic.com>
 <20260521-s6-s7-pwm-v3-1-57b073fbafef@amlogic.com>
Date: Tue, 18 Aug 2026 14:56:07 +0200
Message-Id: <178705776742.1733024.3702017266095180404.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=350; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=O+uSJ6l/nC8L/Knw7obnre4I+TF6Q0+iDF3z0NVIK84=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqhFZsDxMqI5GgmdAmlfldDO655rJFQTxUUPF+L
 d8MIqjEDa+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCaoRWbAAKCRArRkmdfjHU
 Rev8D/4xOPZLHUSXNhR9N4UAExW6eRzrUxnLfXcz5FmEunI1yUwDmFrVmLEkd41Pw64v3pthjd0
 iJQ8cYZbSy0yN69vhnEpXL0QHSSG9mXNqanBUNUCaCO+UWYu3TaC2305lJdH4WAFuVQAJvHRGfb
 9P9tFBefF663jGQ044idMqlUX/XYhiggcyPZeckQxpNJ6jTukcTWspEtbDi17EJjKoIQrHlpd2Q
 YsXOXCTNPdOSBNqvm0bwkg7NyNNqg4/6iPUUUZBb6BIA40aoABZyG0AP+IzDTShbYzkTyj+Av3g
 BH6u158isBZyMPTWw2dOh+8J+PSKb6Ems/rCGbd7AdTfn75NevMvDNXLE2KDVY/MDMiiZi/2bOD
 N+5URngivCT7AswNqQNEPLldxpn8tz+ZOSOuzCTcaTNIuqiaERtLBPPE8epIaP7CFoyDfOc3j0f
 7dERS4NNk2d9aMkiAiPtXdv4JMNSeGbDqdLC9JwfzJ02UbfbUmU0EGWKRQ7/l4JeveRzg4INCw8
 PXhs0QU5TJS99upeIQcH/wCMgaudjAz69F6hz3Pa5bfIVhwNkYZb9JXjWdDXgY6bPhzYg68j6Gc
 WZd2Z6EZd1hI9dlU4gd+7yWvzKlN2d5cNqeu2Q2+BimNmIA8p8zBvUDPxKVRvcnEKRokm9HNQlv
 PiLF74xfWXaTQ0g==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

On Thu, 21 May 2026 08:26:58 +0000, Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:
> Amlogic S7/S7D/S6 different from the previous SoCs, a controller
> includes one pwm, at the same time, the controller has only one
> input clock source.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
