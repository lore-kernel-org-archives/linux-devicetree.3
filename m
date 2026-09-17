Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE31B3B2FC2
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 18:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789668788; cv=none; b=mYA1EIICDmLtWV/m6tsdJZfkfsAQPbOkTZ99qYrGDc/Mt9cRV2NRlNHlla2E8xKSqngI8qMvLJzmQAEiiR/DeDnPa1eVjr+kVOFtRehUATqZ31Pc+ku4thJ0UMi3u0tXIjlB5VHNuDN36Lv3EUG6an5FBb4t2rnuPvUVT4xbE0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789668788; c=relaxed/simple;
	bh=rBWaCN814kHmYVV+q8AElI0MqDoPN0IJdHskleXzFrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mQrahi9CG+vKhrv0zTdKHaeLt3D3YZj7Ydm2svd4aSGiwIu4/SZp+mAnL7ZXkwxXPbwwFQq/Ro/4i/Rlt825fusMzj481iFXm/2rENsfEMWwG6z9lwwx+hrZ/10lTXqr+w+/ky8i6C7m434Ym/WUa02YUwcm89RgecbnhrKJQKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cigLMYHA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cigLMYHA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso8618745e9.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789668785; x=1790273585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rBWaCN814kHmYVV+q8AElI0MqDoPN0IJdHskleXzFrM=;
        b=cigLMYHAq3HXFTD8YjNTGkS3l4pmA1m6gU26q46GcNXpz7uYr/HnNYk3j18Wq5/BdE
         ZyNe/1J+9ccrw+0b35rAuakTs7rdPX88fY6CDxGEDU0xof8eNHa26rELlxmvlA4Ztgsq
         00InF7VnnyYhNLb83btDZnGREbBKK4HyRWvQ8Vi68UMP+YzYEtOlwf87dQ4iANeqXQRD
         qGq20qiLByDUgH4Czb6Y9qCd2I3ACQiyiQXGfD0c5Kjy1YRmW4dVhfsZzVIUeVtc2THZ
         75td/qiJXi5b5XyyxrTvGcoo/4cHPBafUOvKnGsKWeYiswhkZaK7foUwD8bG1ooXZcKb
         zTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789668785; x=1790273585;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rBWaCN814kHmYVV+q8AElI0MqDoPN0IJdHskleXzFrM=;
        b=N34gx5VOS6VYPAAlNW2tZI1Ssb0OyF0sCCgojcnPQG4URGm+6OxmxAG1WxDdtb1Fjw
         Vl2woHlvSLXJNqnXsdAtI52suSMQ+z9fyWpVMzv+YJaLd3ZWq1hEsIZspIi4Qwvn6HFi
         jAPz1m9xy0nI9t1El2COts6yZQU+7RwezBKFsNzaHzK8LOAQDjCByqFawRr7xOWIqG5j
         lFR6eM33maH5sAL51DSmf5b/hIcTfcLXwOwqPXrGqFFFfjcS12uOSIPgDXVkFj1jTN2h
         rSjZ4+tEwv1VSN+uoukaQPLyO2TM79A7/pUpBkUxJdQpVj4a4rnRgQh9Zkq9lXTv13aN
         OPfA==
X-Forwarded-Encrypted: i=1; AKwUvBz+ypPwUEr1NgbFv5gNFRHstC650vtethnEOW3nGfVmp+vtfBNYa3BEOCur/XbgwPGXyL1HhnZpIIPD@vger.kernel.org
X-Gm-Message-State: AFuF++mwRUpmTWIRnSIOD8IH0yPoHUAxOmf2urswMxiN+stFShEbhdsT
	igjXBWdlyocx6gM9Tw2q0vnLAQCiiLbDUaVfz+HfZAD3X42cnuhGBHke
X-Gm-Gg: AYBFou1IbKYvZYLmc7ORYRHLgfa8/96zed9dfiGKDEUhvkDwE9hCk5IaY/ZLIkm4oT7
	IpQ6i25wAhrOgyVSi2o0alxZTi4YDzRUdTLb9J8/z3VuEvUpAG6X1hSVcoNRC8JxGfDMz+SVSN6
	IE6UTZExDG1shkDuN/sNKW6QhoGnPmBFFXx4F09mvbuBBMwzOipUCiCA0hlONPfgpnUXlIng2br
	q3LOAsapfKdz9ojOoEVmRwzEdFkHpmhZdeH46oOC5hDckJmazq7+rZ2+6KIGhMez3LDi2dxGCow
	YHEARBdX6fl0Qv1NPkyp/TJT1XtSMNLCzqGFwoNla4WELZzm2N9P+2/J9KDjdGb2IMKDUnRd2J2
	5xOHp/EARXykWAKCKgrFl7gf8WGSMgwA2xfdUem+Gkab36Rk15+WQ6oeCcChvk8FcVB61vz7MDG
	0R+Qo9BcezizAufykgXd/L9xvHAeq7IyMmh+O2R858uXiWT0y0muJUMaMuvmNEAMLFdpSQCppAu
	imkOiGo
X-Received: by 2002:a05:600c:34c2:b0:49e:6c27:d093 with SMTP id 5b1f17b1804b1-49eb72f7043mr91713485e9.15.1789668784618;
        Thu, 17 Sep 2026 11:13:04 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.113])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fc4855b92sm3165935e9.3.2026.09.17.11.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:13:04 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Felipe Balbi <balbi@ti.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v19 0/5] Add phy_get_by_of_node and devm helper
Date: Thu, 17 Sep 2026 20:12:54 +0200
Message-ID: <178966877406.2239.2890857291530516772@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Bryan,

On Thu, Sep 17, 2026, Bryan O'Donoghue wrote:
> Add phy_get_by_of_node and devm helper

For the series:

Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)

ov08x40 on CSIPHY4 through the standalone CSI2 PHY, two data lanes,
data-lanes = <1 2> on both the PHY and the CAMSS endpoint, capturing with
libcamera on next-20260916 with the x1e-csi2-phy v18, Kaanapali v16,
SM8750 v6 and Nihal's Glymur CAMSS v3 series on top. Streams, including
after the sensor is unbound and rebound at runtime.

Thanks,
Oleg
