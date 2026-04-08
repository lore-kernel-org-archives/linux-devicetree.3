Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066793D522C
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 14:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775659767; cv=none; b=fFUI2IbtCZ2C5U0scvVPBV8hj3Y5/z5qibmZxZRcAjrrx/Mg2DdOp9BsKhwbWj3FQ3iIxaSIBti4A1BKr/UNlFfXE4Q3R/8yJBs0MDG6ybzG0v0l6+5r4lBg3wjOc9iGVKjA8UH4CEqDymZAaXvUdsnNP3mtO3j9i68Nobpa0CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775659767; c=relaxed/simple;
	bh=8EQsRJiGkX5iRTB/AZVv6hwVd/Kx+flU2pF6ssQXU+8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=lqzqpJyqHae7RQ3YoMAnIMbDJlV/sfH3ALdDGvSQBIFSX5ggxtdVBjCZ3203pA7h1YXvpR3iZF8j2fB/73MJBu68THJs7EVdJyFTxl9YLqFdazxQ9mp71DEy+BNHG2Y6Qp3NwxIzHCayGUMllRSoVez0Vr6680nI2Bh1BrEWix8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NZBqGxwQ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NZBqGxwQ"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cf7683a28so3825278f8f.2
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 07:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775659764; x=1776264564; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8EQsRJiGkX5iRTB/AZVv6hwVd/Kx+flU2pF6ssQXU+8=;
        b=NZBqGxwQa7Yi+HoWDlbHzdr8kfrEjy2wYzpIDKQsN5HRVoPjsOlu2cZc8JUh/RVHyO
         S153dvYOW7qj5l03qYuxav89jjBuphJwHpd5u5MD9XtDcqDKO3NklC9c5SRZzVoykN3p
         nZ28jiR28CutpJdpieCgPO6A1vsv+a0qz29eJl8EgGCZ6+mcoveySnzAZ73yDm8pqb+d
         T08qfHEHbab+TZKR6Bncnas/Z4Yi/LSSV7ajGhw7ry2/9rzdlnPLhHeFkzMR+46h99Er
         CLEG8CSlU8qtTJeNZ00DLEhH3zMOME68L7XrhFDgBkn69INy1pWnP+zUZBBysBaF5SG3
         4JPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775659764; x=1776264564;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8EQsRJiGkX5iRTB/AZVv6hwVd/Kx+flU2pF6ssQXU+8=;
        b=MRPSb367koSUN8JhaqZRIbVH5YRpj9OWe6oPn8/S9prp2h56Th+ZHoi+jAzDPdkrGZ
         S1pyzus656ERsA2lBq5T4G05G/3N84cSOkcuN+zkvF1Cse/ymRqcA+UlzANyXozwA1Yf
         wkGnH74YMgkKL+EObCelVVL7xt8lInEu7zjKvkbpSfTR1j0tMyiaXaHJ94KfVGUchFvt
         wbjhbf8cALB7dmPRNqMnWr1HjKZzquia5iOJZwZtwBypU/QcnpgXv+Qrz5dmyJbEVLLU
         TmzuVMgmEglO6FyC5pB3D8ym0jC5A78ZoJdGUDmUXlshSOL97Hfska6AVcIjaPgPbjiR
         Xs9g==
X-Forwarded-Encrypted: i=1; AJvYcCXG/Prrhsl5oxfaru5wQg/zOGiZVg0v8ijzyRrVmb0fhwuaGlNigmR5mk9V/td0j4RgUOP4uSWRANDo@vger.kernel.org
X-Gm-Message-State: AOJu0YzCuQE5MnLU3YiQxNNNzuJ7WD5EobnF0S4S1jJpaf6gfzT9vHnG
	/qijV9MdDSNREqN9b1+KgO2074gDO4SMDYUqEXRF6+6MzU1MJUph8B7G2Vfrifn7+GM=
X-Gm-Gg: AeBDieuOQB8rRbqLGUi9rgO50enZTM/4v97haBwegkyRYu1VN4QvK8/BgkTQySGJaks
	7AuM+rFZysucF0bdZH/Il40biRLa53AtkAn113kIGxMcQBxeKr6JVAi6YnYtsArpJZFucZuje25
	z5lktTwCDgAIJv6ON8bKHop0r5qCyNzYiOxbxhYT6aqASXAROxy2NyTnfOWaBfCY+sYbwLneLz2
	p7kwVimnQRBdcHej/v7GYU9pcI65Ml2GE9bW1ERbV2y6eM3KEsRgkPBlPfva2Mx1Rm4lutHWgiI
	CkzDwadylTeeJpMCSmClZpr6ovdmCPATuOyvuxB0Cuzs4FFVcrhGbaIzZAroAhAEfnyKsagZUZG
	6af3YaEcIrpuC2hRN7U9zv0GjEs8gev+MKVWmxZbjqa2BHmtB0Zw/Ei0KAmgrzx/hHzfUbG3CSs
	2YVeNzpmIMZ3GYSuXj0kgTkNbR+yUuAUhfuwr1rWZWn+bEZvCQsanAaXz8V6CKnND9SCuhr4PGp
	27Qpw9EvFDwOwIaPg==
X-Received: by 2002:a05:6000:2885:b0:43d:1c21:ead4 with SMTP id ffacd0b85a97d-43d2927bc28mr30909918f8f.18.1775659764374;
        Wed, 08 Apr 2026 07:49:24 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:9775:58c0:569c:bd74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e5890sm57988952f8f.31.2026.04.08.07.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 07:49:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 15:49:22 +0100
Message-Id: <DHNUUPQPD5DR.18P18VV0LNTI8@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, "Daniel Lezcano"
 <daniel.lezcano@linaro.org>, "Zhang Rui" <rui.zhang@intel.com>, "Lukasz
 Luba" <lukasz.luba@arm.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Bartlomiej Zolnierkiewicz"
 <bzolnier@gmail.com>, "Kees Cook" <kees@kernel.org>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 <willmcvicker@google.com>, <jyescas@google.com>, <shin.son@samsung.com>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH v2 0/7] thermal: samsung: Add support for Google GS101
 TMU
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
In-Reply-To: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>

On Mon Jan 19, 2026 at 12:08 PM GMT, Tudor Ambarus wrote:
> Add support for the Thermal Management Unit (TMU) on the Google GS101
> SoC.
>
> The GS101 TMU implementation utilizes a hybrid architecture where
> management is shared between the kernel and the Alive Clock and
> Power Manager (ACPM) firmware.

Do you plan to update or work on this series? If, by some reason,
this series is postphoned I can rebase it and re-send, for example.
IIRC it needs a clean rebase as a minimial change.

I am constructing some code on top of it, so it will be nice to have
newer version that can be (re-)tested for Exynos850.

Thanks,
Alexey

[...]
