Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED754399013
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 11:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857116; cv=pass; b=p03pXZk5JmM6WdUj1O5ej/QkkBdYOVphDUgsXB4dc1bHzjbQD7kkgBGQXCt8B/1Q2TE13ghHU/jqmqwFOoeN0LpszGSVLJVFf5QiEcZpLzz9MSn/Hq/U6H/BJuLBWlfCGyflYeCj/X5+SVA2UcqNribIY1kMgiIbCDG33gtdRRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857116; c=relaxed/simple;
	bh=Vq61pPu6R8RhFxhzO6MCMoN7B8JnjWnfrnKR8iKrLVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s+1Ux35GZGQCYOjkZ3k9TJ/PslodU4DpjI3Q06W19kjvub1gCkZeJypF1dZdIUm0v5ATSjqoAdzzCQCFeHvkhUc2hxp759kG7rl0FRaHI9KBZPPla0rHkt5dCyFtE3cBedUMu1ggZ7v4CY5/H/ufVp4XIcWZYA7SUTd5wyqTDng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=URUmaZ9U; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="URUmaZ9U"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84874b52eabso2858581b3a.0
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 04:51:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783857114; cv=none;
        d=google.com; s=arc-20260327;
        b=IMeuoUIrSVsryMHkzSrHf2v5wXnw1JH87SCkQzWWCOk1I8OAIbc/lPOxygcErdvGtQ
         /p/5u7FrLRIUrC3cArhmL/iV9UHOsu1yB0bDRH1YHuRPhdQmP6iS3/CJCeAb7UZv4TMN
         F3Rv+d487dkjBg6XJgzKg1dbGDLIKT60MNo57MXB4Un1Xq80LB9A3OsXKX0dEs8Jg4+7
         LZ0Obts2ZJMFL+vhJaXRJ1rL7A5N3jYBuA2GJQIHlfQJwiTkvmLuses76uBMFGkbf8j3
         0dG/IdpC7ggob6JDE89f2xyVGeUWFjNcMqYmR2eJPcxqWld5tkk1T9Aa/yOQNFJiHFxy
         NFLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YsQpUC4iSbhz2nXUUh9/l1xqUNQEcKgCsyiqdbNE7Cc=;
        fh=pNbOmpD35P2/qs4lYXLp4S07cZXZhEf+fP6DLBYjsS4=;
        b=rOE5Ypz7rJnXzvBFY7fV9VnQAxZcQizpC/HqPI111bwi+dxVa5IaaBIc+IaMujMXGz
         2IPyBdEk6vSFLmfxWD430b5BFz/O2THoCdbpcZdKZSi5fp3Owxp5EOYcM7MBrnRWfjf+
         FunliZMRR31VAw/dzqZMoGjUMBwqAztQbhDDdQYA0Sy8KdTaqUcLGozR10G7s3yMBb47
         uQJmS1iglEMMwXN2SS/d7MDU2NyJmN/oTqxDjgxohiMXHHxRlG6OEbMm26V4AoFhLMDT
         Qf4gVjWvbNIhBTpbFeSfHD6mxaNrT8fWJVUZJapvomTmCYjypTn31HvBUlgaclhD2paP
         m13g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1783857114; x=1784461914; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YsQpUC4iSbhz2nXUUh9/l1xqUNQEcKgCsyiqdbNE7Cc=;
        b=URUmaZ9UW7ebsoLPmv2ZwO+NMA/F/cdUeLiUqXEHvG7svopSwPCAh2vYO8eKQx9+Uq
         qIHblZvsk0rX4E3NZ5TVXxD941gvWnFAmHodF0VYobDRHdLxLkftPV4gzn1z/DEbX8la
         WR0e3xpTmTybNyRCJN6NPBqgRiYhey1vgPKa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857114; x=1784461914;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YsQpUC4iSbhz2nXUUh9/l1xqUNQEcKgCsyiqdbNE7Cc=;
        b=jTxu/o7lG7adzSpbYPSXTAz0qQ9ym+3Gfa8eoiKqnTW9z+Bwm8OBmVto6p8qjyfgp1
         fiBkLI+9M1ZmOShRJ0OPeGWCNAoFuX0RX8ypxefuWbSDIiyXxQDPdFDGf3RuOpv4aoEm
         pvso8ISEpMJtW3EEsidYkt8r8D1ZaD/VoV0M6e8yLiBTKTqcnGDc2Lsnvcu2A0IdcA9F
         hdaJMiW4KJ7hy/cKnI2CPKmSkxone9oR7NozIKTYTd9mEQRc53ICBeM65N7XC/8IQ/HM
         +T803pGBx/AneTBEaNRkyUzk2SDHAVJ7UGxi+dFa43F7APtYgLq/zT4YZD52WoI0tmfX
         Fh+g==
X-Forwarded-Encrypted: i=1; AHgh+RptvVnMWrFI9wWBmfWB6X/SV+M72oDQIKXHDzXstrniYT6DjhxGkEwMENDXVhkSyrL2kIL/lvKrkZ+t@vger.kernel.org
X-Gm-Message-State: AOJu0YxWd20E4ZAhAE7AOC5db2N98q8XeCFB5RJMNNiiw4l+0lCaZ3y0
	jl69DQexcNoUa/lGl197KFJmqoY+3id4TcJnq14CdCFfqPDoUVachYk3Ndj3aYGDpOit2UOWiJt
	yKGE4Wf2JKTlgnQedlKIRDcTzMdR3Tn+/C8/R8531/g==
X-Gm-Gg: AfdE7ckRlqmFrLyzEci85vn+BU7cHpObMl8aIO5mvOe2eEkoZ4S3sQnIv/c/zWICf71
	qxMm9WbZRClofI1II5KoNNKeepcXZzMB8+xAQUuHR3qncYLmIlKquAgqK0xcuCjhwQ3JkKC8tr+
	IHv7c94xXEmKtmX9qu09eTaISCTCSgbGZ7snXCXjRxUD7WDFoZVs6yzrdntZxrgNIPRHsviin38
	bbJzzvps8JYtD3qfho6LS2j7/FBkWavTqeTrhhx3dWt4kfUPLpBbhu4Q332jzQOCdPSX28U7OCg
	+yagyjxzmTHrLQ/fZLqohMQezs5DLt7Y52+EtAUrt8lQunkGAAXYcGA9WwoOfKtbMvPYYdV3eDp
	Zl19E+NznHSC2ctgbbXrkww5jVVsxNDuIemcYm4krinM24oEmcH4c4XG/cNT3CXfrbeeSgSldWy
	XdgaXLw+bSp0Y6VD+m7vpSwnGv+tJYKi3cKljHgecrtnOWwannFoEUkqNp1fycAdFgdsNO7Ng=
X-Received: by 2002:a05:6a00:c88:b0:848:2f77:e2dd with SMTP id
 d2e1a72fcca58-848897a7553mr5221254b3a.70.1783857114306; Sun, 12 Jul 2026
 04:51:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
From: Daniel J Blueman <daniel@quora.org>
Date: Sun, 12 Jul 2026 19:51:43 +0800
X-Gm-Features: AVVi8CfIxi4WIpFkevKCP00_7Hn3fE6sIEYaOzLrzMtk6xLs3rWmXH2GtZ7E-hM
Message-ID: <CAMVG2stqOscN2CB5Uq4qVvb3vXOze35-JzqH4GpS8z4R2dr+Mw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/11] : media: iris: Migrate iommus to iris sub nodes
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Jul 2026 at 20:35, Vikash Garodia
<vikash.garodia@oss.qualcomm.com> wrote:
> VPU hardwares have a limitation where VPU streams are associated with
> dedicated addressable address range, as illustrated below
...
> Mapping a stream outside its expected range can cause unintended
> behavior, including device crashes, as reported at:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
...
> To address this limitation, the subset of stream/s are now represented as
> sub nodes, so that they can be associated to the respective addressable
> range.

Amazing work Vikash and team! This patch series applied on 7.2-rc2
resolves spontaneous rebooting with parallel streams eg when opening
https://ui.com in one or more browser tabs, resolving this platform
usability blocker. As such, this is absolutely relevant for -stable.

Tested-by: Daniel J Blueman <daniel@quora.org>

Thanks again,
  Dan
-- 
Daniel J Blueman
