Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB1B2BE7C6
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639397; cv=none; b=mhrMKmklJwKdOzE4wY4zijBDVUNiTv253boTL/yiz7p0CDXKEyWY2khk0LxIuSAsPOg8vKRCWJrwyLalHbOCTO8xxijUtRN7x4mPkDPyVjTcd62Mk71TnpaBfYhab9KVnr4VLwgLy8OzczM6Do0T+JLrmeZeVOqBq2wJdbjLxeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639397; c=relaxed/simple;
	bh=4eUF6wOx7oLK5u/LP/Ubs7d9j73K0COWAjVT9tml6LY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lrRKYdw+u1wey5J7PyVPy5GtxDA6kItEY+M0uzyYo67LcCeM/+XLfeC52JQ4Vm058KyvC9u3AYc6qqpRXDUs5BZJhBEn4eaWbvBA7QH3y74hoFmMQ76yzdx6fAnNQzyUNoxSGVvo6Ait5TYSclbmuu12PVEmk9OKoYt9UShTb+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iOqmBAg7; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iOqmBAg7"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cf906b007so3152206f8f.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775639393; x=1776244193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVQ9lyGxSeMxPWxy7ZZTOBzpLHNklj5caAwwtl+7bEs=;
        b=iOqmBAg7v2lKw9IRxg3ZdAFXybbl36t2ojtuWbV12tj0w7mmDjTRRCnADFkrlsvEGd
         AEhNUpSiLtt29Ng+srMGgJb/5WeYBQ6xCY8fFZYT1NPYNiJKTL+/eaQAtN5MKrY7czyC
         UdfApwAUQaUywqvP2RVdVwsrVjQcl47x9Ok2jKbLHOL8shis972+Xez6hkei+G/4d88R
         P0Zo6Ki52rZLCUYUprkvDu0Prs6KytMPW9YgSt/TrCoy2UdJpwqWqNk9TYH8E83BLTVY
         OCD/b9X1YWGSkM/HatmFRseunz9SYsv4mm7+15ftWM9atvkVhN4OofRdlGmrhJ1xgJ8e
         50sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639393; x=1776244193;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BVQ9lyGxSeMxPWxy7ZZTOBzpLHNklj5caAwwtl+7bEs=;
        b=QkhYjhk2zdYgR53QARPjow35nNFxsp6sZPC6zSBu5ddmFY4wuGVKZDR8JGnZpdR/dP
         S8Xd0d8kuPqA+ZZXf1EEobObFQSEx4onbJq9w1Cevh6dv4nH+/BXXXuTYdiCIbMmIRMd
         l99qCgeqA2mDSe3hnkHowecX70BUw5y12WYr3oTZqbiw+UB1k0M+qWHIZzf390Y8yy+Y
         fecsesR58QhyEHNAv58NB0ELu2hnqxhdQ5yGRpmbKIh0gfxkbrRP+/mV5zu2fAWD8/VD
         LRSKNabkNMTCCEDe9RKHx9h6kYNUizZmx05zi7L6N1J2VCcSdQdep88XoKiz88L4X9tC
         hjLQ==
X-Gm-Message-State: AOJu0Ywd0Zz5OyCL+FFrLH07GjckWmMDlurieFzYp8zgKgd09wsMEg0u
	ybKA1DEVZjezwhakRpMk+XzS3dxlxq62FrGkwM597KT6YplvuXUotgw0oca7u6pFo+hdfY6xtWI
	gjR2u
X-Gm-Gg: AeBDies4K1gndxoxgTyoKqSDPGx9cewM/VK9TXOfNFVMscaaXLJsCYx/yxf/DsQU2SG
	JvQIIMNUfGOTyB0Tu3CtN3hEsCrKdDl/QIJs9CrRAL8cuefVTObbvbD6E63iAIockaJLkfXn5JU
	Uedb3NeXDB9k87BI5LIocXGbvqn6RE276R+OsOtJr6s1ZNmOCVLL95KuBwsX1Zv65rgneXOz60c
	xtzYuYx0bRsOaa7ZiRXYlkdhK2MTRLzg1qTAwMkdymXCTGg7Oxsvxncijr7IOLecCD40alRdeqI
	o5IUcx+G0PNiXSqeNk3SfjQEI3fMWjXIm57lwcU+q3edfPlIXXnO5kuSLZXzeIuV/HlHpbEZC6k
	+8u+pE98SNl8XL3KucLjyIQIvVhFr9CLD8OoxNKSmvSwMxpUkY0MYHH8ys/DLz93fvY9felXJbd
	prAXjubMRRF7yQV5gx58ZhvUP0aMGB3ep/GCVO2lo9nrci
X-Received: by 2002:a05:6000:1a8d:b0:43b:3be3:9a16 with SMTP id ffacd0b85a97d-43d292e4215mr28461338f8f.38.1775639393127;
        Wed, 08 Apr 2026 02:09:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e1c27sm54424005f8f.26.2026.04.08.02.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:09:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>
Cc: devicetree <devicetree@vger.kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, 
 Ferass El Hafidi <funderscore@postmarketos.org>
In-Reply-To: <20260326092645.1053261-1-jian.hu@amlogic.com>
References: <20260326092645.1053261-1-jian.hu@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/3] Add the missing mpll3 clock and clock
 controller nodes
Message-Id: <177563939235.3407812.2098744320811836636.b4-ty@linaro.org>
Date: Wed, 08 Apr 2026 11:09:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

Hi,

On Thu, 26 Mar 2026 17:26:42 +0800, Jian Hu wrote:
> This series adds the missing mpll3 parent clock and completes the
> Amlogic T7 SoC clock controller DT support.
> 
> - Fix redundant hyphen in for gp1 pll
> - Add the missing mpll3 parent clock definition to t7-peripherals-clkc.yaml
> - Add Amlogic T7 SoC clock controller nodes
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[3/3] arm64: dts: amlogic: t7: Add clock controller nodes
      https://git.kernel.org/amlogic/c/5f727a999f80a72dae7326577e0d832799ddeaa3

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

