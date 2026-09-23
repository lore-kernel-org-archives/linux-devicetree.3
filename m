Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E984C448CEC
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147394; cv=none; b=BFff9qFGMMaG/N7tQJJo+eoPqEQpjtGP82S7rXawMuxFwWm/zAYvsDgdr7JhKX7K/WCEaH/Wrvpmp6MyEN9xLwu4P9d89O+dOmK0TqmlOwYn9aicSF8R5Zzh5O7t5PUwqhaDuOpftaZIzMYgRYCKPDfQFB4IPSyeEyOhIVend14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147394; c=relaxed/simple;
	bh=eHfMOe6yj02YxaPLLtIkd4gQOtdahdLmLAMh8gnz3bg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XSo0oxOD8w/DNkMG9XPt8UW/uk3wvykjH6cQHIrsieK7URr7bIlrTTXPylHxlbR/0v0eE+O3NlFRRaPIhkqxJBwDqo9INSygvL6qCKFB/IFIBvpWJHqotbabzFCFGYvicY21JOEKn1eO+5z2D9ve1WJu+344xhIiGTo1QVBdQRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k6WRnefT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k6WRnefT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3733D1F000FF
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790147389;
	bh=eHfMOe6yj02YxaPLLtIkd4gQOtdahdLmLAMh8gnz3bg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=k6WRnefTPBUOG1x03Ga0DPz0yhzIZqAifGXC0g33jzH03dN+Q8zPmfpVL/JWdKp8Z
	 tzo6oDNE6myn53NNdLOkytHkU4sFatSFSsrhs5RZinoFHLi2pbRQbrbNi/tRzGS3Q1
	 pUDBjELxM6zUfGTc4YOf/fm9Hdz2lGs+s4yxaABW1seGLQizvzql6hFm0X8tnLYSw3
	 IFbh9mEJN/Ux3AYpU5AbIZiDj+kAu3aDQFRErMp7P6tC65EBnzT0anS0ut49A9Z/lC
	 2ZveVFR1bFku3UMc3jYdzUhGmyewHbMQmDsT4WHZ52+Hm+Ps1aMBy3kt0QOOfNabU0
	 Wvv9EMepHaZZQ==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a59bc470d6so5075191fa.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 00:09:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzStlCWpQuFmPfjbF8utlD9RP/hu6xw1ZY9FAN+//1HeoxLkcdoTVBam1Dg4AYoL6bQYcxORX3FYdXU@vger.kernel.org
X-Gm-Message-State: AFuF++lwh1MxlSlN4YW7KH2vRk+PBzJw1ARXWbdYJLqTHMlKUyGzO68a
	IlWJf2TZAjW3bkaxyt0x+Y92E5t8LPrjQPYSollCsmw1LT2M/DeV8EurAbdEejLTMIYNw860qoh
	eNq15e+aNX3vQTEXV7amiT1A+Vs3XOgzGwGG1qkvX0A==
X-Received: by 2002:a05:651c:1507:b0:3a5:dfd3:41b6 with SMTP id
 38308e7fff4ca-3a63056d051mr3233361fa.0.1790147387898; Wed, 23 Sep 2026
 00:09:47 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Sep 2026 02:09:46 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Sep 2026 02:09:46 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260922093446.493606-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922093446.493606-1-shengchao.guo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 02:09:46 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mea4jjSz5L5C0jMiQxovC13xSLODJ7ZGEJomCkjvuBAEA@mail.gmail.com>
X-Gm-Features: AcwNN1X3aGV2TxSGMG-9SN0VSQVmz27NKmgIHphO1b8cBVjG9WNWFgpOpDyyI7k
Message-ID: <CAMRc=Mea4jjSz5L5C0jMiQxovC13xSLODJ7ZGEJomCkjvuBAEA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add PMU node
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Anurag Pateriya <apateriy@qti.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sep 2026 11:34:46 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> From: Anurag Pateriya <apateriy@qti.qualcomm.com>
>
> Add the top-level pmu node so perf events can be collected on Nord.
>
> Signed-off-by: Anurag Pateriya <apateriy@qti.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
