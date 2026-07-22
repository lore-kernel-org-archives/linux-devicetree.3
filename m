Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944A947B438
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784709447; cv=none; b=Hc60kAAIQifTGBf68GfcjvPv2a6Aqav/H6eNmLCy7w/EDEXP7Rg47+YX6fevLiPGHCDPf5rxsHjoS0qfznOIClV/qmtqr9UQQwYqASYj0Dxc4peYA4E2VTL8k6QhlW97+uR6Neua8VIMQaVxqmsCl/ipa3OpdRJOTBxW7j3Uv8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784709447; c=relaxed/simple;
	bh=R1aowIMLUKz8Mx0Il2jJ3Lj0sfhpmxClc66d27gkbKA=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=pILSJ7Kg6hL+MYRdOg0Bp0lfe/iCQ33hwivHFce5qnkY6RtNSJWxhL7Bmv7p8yzT8PRFFu4/pzeeyHzzgnHHzu116RyW7tpsejF9JVUKp4L8hlztmV1ucm2HeJoaiG8Da3OLt8QnthERv1MvWRKhU6c+aP00e2QcdjhJ41Epu9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Pbw628D3; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Pbw628D3"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4955de8797cso18968495e9.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784709444; x=1785314244; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hOhJGwQ/jTppwk40BJWO/omCtNBGTT070lPHgUjC928=;
        b=Pbw628D3LlwMuBl7Fro2NfESKu4hM7l/dcrQb5v3odRrQlEHbAqGELZORib0AAoUxh
         DSxPizGtrny/LreGvmxVKMWATOvsyTh6QwmQ2jtt+W99apXQ4iHGoddZXcJpNWvI8Atl
         3qApKiXmpICM8jJsexbJ52M0jp5K9l6RYb5z1OEdC+RONbFD7mYFruj65phXv1tOmJ8+
         PT42p/0kwW0ttC5oAqjs7ZIjbkTeNEaHjdOTJkya8pfFP0nGpjsQ/UOtUfpN6Om+t5tp
         cRGS+INKxT+/JQQh5avc2ZiDPDCq1PWpjp/lBJnQIzCkHWomLOb9QBV1KA10AMxo6ps3
         QTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784709444; x=1785314244;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOhJGwQ/jTppwk40BJWO/omCtNBGTT070lPHgUjC928=;
        b=Hi7/ld/19LRE0V6K5VwbotG1JO9xe5DGwKi2WHcloH9Vc0CqY4IyScQItuGVkV+fm8
         jUO8ywhmRlYJ/wKcrgfh2VY46fJOTCrbdbUNnnpUFJ07QvhknQKNyGf04ALIsWmVzuXO
         Id7zd1p0WdGfAbqM98zvOQ3OmP4pWFoIMp3ZxD5dahQn7K5iy2jVR2GW9kYD9PrbcC5j
         hTdVyLzTVeGFBR3WuT4WBDVV8yiwXq1pre4XkKQ4ax1jNNXJMxYen1OEGY1gIa4FzGQm
         PZvys8ulaQKWKptgZXgtuQNzLczKHoCyieazN7oyUeb9CWMuRj0kvzD1dZzr+cYTU4wJ
         mjXg==
X-Forwarded-Encrypted: i=1; AHgh+RpS4y7rVxklV+VV/suk1/6r4bZ0abKPctHi8x9d6EEM2LgoGbepXXbR7p/tuB8v6WXc6CVeVfvhi4dW@vger.kernel.org
X-Gm-Message-State: AOJu0YwohbPKsErP/AHYvDHJ0qlWF2hx2PoGZlB98reg1JOkXG58Ru5a
	VqjFa0dLNYngpO92e5+QW01peEWp8kI7di6AYTSHjNiQfT4LErO6ktlVxgp5cZer3mQ=
X-Gm-Gg: AR+sD12qSJJX2NseSU3TW8wNyLYccus3/6kIy4IqYQ72xQ+hrinmzGxaBlCes+nbCkb
	oz8HY2SWpSYMMRl5EgkgSiGetfYMdyJe9tN9H2tH8S4JHXvonRT0ARDPwHd0qDwxq7hYQyk/Olg
	T4uYwRL821ZwBNYuHtkvnZtArUh4G6VUvHmnLxcmKcsRd8mdmgd5sD68/jGlVQ4cW5WyvNeNcEn
	DFdjKvnl94c7iBT2Vw1GDwQtZbZhFlMwXEbY1mq4x8Pd5ntIdXNPiubGLt4+1Te2ZB7fQX9sVTB
	RP9tQCKF3rgxPc4UvaUNdifRo2zybstOvBdrqmIznl9+mqGT4/sZuHXNhIK6lXWrf9YXgds6lwj
	KwS9DHJuMCrmNjcgUDi4t3CoHY8f9KKZKBXvzd6XQH+WECCF1S4b68wtwy6Q2BlXyUo7ZovF4KV
	IQTIh4Yaf9vSnLH4kJLFES
X-Received: by 2002:a05:600c:1f94:b0:495:3da3:beb with SMTP id 5b1f17b1804b1-4954a3dc491mr258598315e9.10.1784709443731;
        Wed, 22 Jul 2026 01:37:23 -0700 (PDT)
Received: from [192.168.5.218] ([88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4956a63fa41sm57819035e9.14.2026.07.22.01.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 01:37:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/6] clk: qcom: negcc-nord: keep GPU2 CFG clock
 enabled via critical CBCR
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
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-nords_mm_v1-v2-2-17e5a445a512@oss.qualcomm.com>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-2-17e5a445a512@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 10:37:12 +0200
Message-Id: <178470943209.3016846.4248808809182663974.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=557; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=R1aowIMLUKz8Mx0Il2jJ3Lj0sfhpmxClc66d27gkbKA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqYIE+5J9Gg8PbLvC5hMVwlZfdB242pjzBhXe4h
 S5SMDXwJRuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCamCBPgAKCRArRkmdfjHU
 RRFTEAC/ouSPXHdha4O6c1bMccpH6wqcdaKXdI0tUhSO+53+iP8xLJE9f2LygyxUDuK42ps/Pwj
 ndEv5DMMf+pVNfsjHlXjTEVmbbQOBHwIXrFMHJB3aYZUfbFkros0KkUkgvMQcksQG1p2P518g42
 NBZ1Hy/fA0UKPlMhLvMVl0YkKoI6Wu2n55tOn38NFfBEoh5pwzPyNrgkIZaghiNqGyFaIzooJhd
 CEb4ichOlrmboq2SrCkYOVLYg7SeM7pW1c8sbUt6M5nx2N6HZkE2SBve78kK4lnWAAL/+5MjiMm
 wUPvgiDmr5yCrnOJuEUqQoZ4lzF+G2gR5aSopqgUNTKLvAAkPf2DfEuRHUS2z62hdLo7YoYFRyc
 4gV2Z9M11K2SiKnEfR6U72Pt4j7Rc6/+uOf+JJmGaRKkKuE780Erh+iP0IYhxSDuXsEyI/yAj9c
 kLA/FC9ihoZUQWplfTfyQcZcuSuH7f4rkJGhFGj0vXHTKvT3HVDuqKtlXa2TnYPlizGPIeQCXzN
 YCAhLjPrVMTYzuYGdNCDP+gCXdTC8LrHg+AgiA1z8wWiSpC5v4vl7R2SbRqhA2skfMGOU/41JdO
 WpmXMpKEeftRt1nz9vwVA7H7i467ejwQ0kQbb2wSHWQr/HBt3gxPmrDFzLCqD+O3Jleep+lIual
 JeSfTRBuX4Tr9yw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

On Tue, 21 Jul 2026 12:37:17 +0530, Taniya Das <taniya.das@oss.qualcomm.com> wrote:
> The GPU2 CFG clock must remain enabled for correct operation and
> should not be exposed as a controllable clk_branch.
> 
> Remove the clk_branch and mark its CBCR as critical instead to
> prevent unintended gating. This follows the same approach as
> 'nw_gcc_gpu_cfg_ahb_clk' and aligns with other always-on clocks in
> Qualcomm CC drivers.
> 
> [...]

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
