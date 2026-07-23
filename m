Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEE14D98E1
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813635; cv=none; b=eczq9fqKQ8HF86bcmKmKqjPpo3JAXY/azagEOnP9azoMwWBj91cXnnrp4uukU9hcVKgvyMZFXz1tei3f1Wx8avTeJL3IXNSEuLvYKOjIKWFUJ80YEEKN+TMH7ycc5pjOV5NuKQg/rKocDO1Vhc2PnZGqipDhuNQ2sl955pmFplk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813635; c=relaxed/simple;
	bh=oGX4ehONu4h9p4mayzZ8S0o9gq57flmzP3e3mv/H6ms=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Askw+KTmf/L9xleoQgpnXYXzsq8yfOZoOWAm+GQ0hmTUMZYfmW509WekVwz4OGHMXz0uasR9mAcsYoMcg9+t3vkinNmKbBIuSke3koiSxM3Bq1H/ErzgOpPPaUPmCwBS+tePjx5B845w1zNX/peC34DsjQe/hxfemdv/3XRNuEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Pf0+Y+tJ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Pf0+Y+tJ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49550ec592cso3404675e9.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 06:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784813630; x=1785418430; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zhcIOjXiRBNb4q+2wtE6whcUaVIgup7Mvj7rqBenmhk=;
        b=Pf0+Y+tJc9OqX6lAOIsDrvuahw0XstR8RRNq+hcO8WwfdsXnOwsIKIywbQsVLeShJU
         q1SuCbFxcgPh8Y0XAHJSyyvPMc/vjnWRQpuLd+Ab7TH9OvBMiLajaItMe46D2P2bns1z
         KqJdojoi4U/hyVr8WSX3zmOq1R1PdMZ/oRfgbOvQ/ersxxDXqCv4EU24bC4IAbU4Utkt
         j1/0k0OOhQTVLEKudQ2laF81VhZf5ctCH1KAuIaAB5FCN068g+MvPb6wZUJwtTkfpVV9
         o7ZMqB1bPEOgqoyk0i9wEBvmpZrS+Cv3ldO8PZSWRPC/syZ5oM7m7atXkuEWnjCeJYy6
         iUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784813630; x=1785418430;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zhcIOjXiRBNb4q+2wtE6whcUaVIgup7Mvj7rqBenmhk=;
        b=UsLF4OO1zADE3YOa6SGbnkX3LAhHKdQGBa03KH1uW+dGVzkdJIyX1copDPyDPOrkBt
         S56CbpeNQQ0RWOWlTWRhGyko3HB5m5xj2utornHtJ/b5NJgV5kcuKoq6x5OgyyQ1JtJ8
         bToXfVtwPA/sRP5D1u9xhSafu/EL94kD0hFCnr57gL0DpND/It15F5eNpvn7LFcmSdJ+
         x/v705AbD97pOYZkH1tBjzwjgDLnYoN7RT65HUIqVDh42A25+O+J2Rly992XDBfwPHw7
         t2l7KiVyHwOUDbhLXlibcwl3oLvBPB4402qiFqp7K6wdS9Pf2wyGuPrl4ybwA/hDFM2y
         r8rQ==
X-Forwarded-Encrypted: i=1; AHgh+RoRlIeJEILwopL4VT03MXxkAXTPkEJmG/YtBndmJb2+HgxOxRnSxq9aDszssag6o7no/ej/Xc6zX/Ew@vger.kernel.org
X-Gm-Message-State: AOJu0YyzAU9DbR6KfIpiula9WRspZciVoRU1uJQXCrtcVn8L/m8NEJEk
	O1wRiFCReGxNGefytFmq/hbS8AXDXpTMD7Y1ZL7Ucxoq/QHA6w67IEuESlqixP/6Whc=
X-Gm-Gg: AR+sD11+9NrgkIBiForQTKOUcvDOq6Zz9hXHf8Ekh+nEiPJfC0qb2EWjYZHzIaygVYC
	UNVsKEvYZsj40GK2Y3Q99F0RiN3cXHyzSyaJGS20YaLiD8884ZTC1HVgftsz1DSPxJsBUlCj0Hz
	qF3XvzRgWlclq2qBDPSp0UlFcNtH9WuL+8wQTeBqB7EuvaJpSfhc0r2n+gxGvDUXxWqvymfL8wq
	70bfg1fqekYXX4t2tAFBmfgDxU/U4eCX5x1bwV3ad1On5lxYBIQqbmb1McoAVLQpRF0nn9lTxme
	j1qK0FQgQq984xJyyzM1S5mXmJXbzPWXK+O6eopstn5+NntOCAX75jEu9tGlu8x/GojMfy/khs6
	ZVi/wJ/2tbupUiv03D2qL9fzaZbTZvbZz5IovXiiAAztFZnGwyxwK5W2Lkzt3SMnKrI10qK649l
	We5bM7k5PaC50nqS7cGvIR53m+vl5Re6Q2i9i8BZmkRw==
X-Received: by 2002:a05:600c:4fc2:b0:495:6193:c6c0 with SMTP id 5b1f17b1804b1-495745b238amr32083395e9.18.1784813629981;
        Thu, 23 Jul 2026 06:33:49 -0700 (PDT)
Received: from [192.168.5.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4956a63fb10sm153054095e9.13.2026.07.23.06.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 06:33:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 6/6] clk: qcom: gpucc: Add Nord graphics clock
 controller support
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
 Imran Shaik <imran.shaik@oss.qualcomm.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721-nords_mm_v1-v2-6-17e5a445a512@oss.qualcomm.com>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-6-17e5a445a512@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:33:37 +0200
Message-Id: <178481361790.189434.2110171943699195036.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=478; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=oGX4ehONu4h9p4mayzZ8S0o9gq57flmzP3e3mv/H6ms=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqYhg2CIQBFhEQIyf8jJ75wkDDPX/l7A//yMHP0
 PzwbiMKgKeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCamIYNgAKCRArRkmdfjHU
 RfuaD/47mpL8HyM/LyV+/mFI6j74khbSZvEG+m1fyJDeW9aPIyDwq5VBj781Y1GVWvibuYH93+n
 90mfEEdg+sm2En4tqBcf26ns+IqALkmjVhtax203rbEEBJG1N7aQ4i38sk2EbYNX3UBfDKN0Xkd
 8Aj2yyw6gYEFNP3QoLMEHnEz+6Xu6ON7QSCZXU43nnI+P1Rhqb5pDtDg7HR2+j94Cs6Ej8JfICC
 O8iSb+fltXJIwgpRBAUBu1ca+q7W78vvX9koqJfF+nIMgEXQxHFrb1NXBNspCaDwWC5jIm2u5rW
 vXUjCIxJUOIypmaMPcvfsxSFR/bhz/EqbegG7ZZPfu+91o0GJMqxyXvDRp7NawCN3HT9JUXifLt
 Zusypqm3NCCeF86Dvyvve99r6lmdMKhIpIcL6Ovo4cCpZoEUsE0tHPCp1JudSghCRQuwn4Uesw3
 ttQAeofYbnqFmG5ajjcC2YiSrfuFuz5Stjth6EaRnQ6GCuHz1zu7vr68DEGYs/CrkTo7uc/QSwv
 tYbowxGlUe/3J6ZgUk8Uncq93noCxzMBYqP2DweFY4h/R4cmCqWimeXkExXsYCZc+nacNWHOA0O
 kulSAAdbOZVY5IX93oSn62PWKF7JzUTArCcs1n/t7QUCD4TFr/9SCVESZOGfpK0BRAhPU6hZVzZ
 +Il7cmpGZwuYX9g==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

On Tue, 21 Jul 2026 12:37:21 +0530, Taniya Das <taniya.das@oss.qualcomm.com> wrote:
> Add support for the GPU clock controllers (GPUCC) on the Qualcomm
> Nord platform.
> 
> The platform includes two GPU clock controller instances,GPUCC
> and GPU2CC. Register support for both controllers, which provide
> clocks required for the graphics subsystem.
> 
> [...]

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
