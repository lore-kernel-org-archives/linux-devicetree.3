Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C6F344DB5;
	Tue,  7 Jul 2026 03:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394515; cv=none; b=eoipHwrHCpkyFEOeqlLS4IRpT69l8jSnztU+amgZpF/2qXS2JEOWX+Aln7kmv9Z+IdvhZrDHrBOss2N6LAGPrauSpCy2yV6bIpwK30C1N/i9XlwsLS6smu1RVlsC+GSoQdIMZuDqHbryXYjpmqrcJfRIF0kudmWZhs4nx17N00A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394515; c=relaxed/simple;
	bh=pnaPgd1ljcJtytvq/ioU+HjHcTtXkaRIXAF/owqceJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mA0r9uYeBRSogAiaeVavJttpSu0B5MW83CKj5QTR0ujg+Y7+xWUcndziNXNV7lcIXQ6dAXiTh8LsJ6HQnclwJEGIXhV49iBCZYrzqPnxnDgW+wAgqc6TnA7WvXnZcxj/00CxQyJXcWHFEgW41Bf06IGVqOBXedP8MXhQJlN9Sy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PlW6VQ0M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PlW6VQ0M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B41F11F00AC4;
	Tue,  7 Jul 2026 03:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394514;
	bh=Zo1j0X41TZWp7MtLyzXFSkH33VUbHq8e3f9IeM67dbk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PlW6VQ0M7FupS+br9H0ybJVae1YSHbmCRGg4BEyZWHYtESvldaSiEgAbvlemt7PeX
	 5908NFLrwB3VJouDd8u4cNunOL2ViQDmEtHq7GsNjoic3b+ScSNzR60M7ph2BmEdwc
	 tARa4R5dU8P2R2ZlPSeKPBVRo9+fAzS0i/YyZzoVgdVOcnGcXEBBqU5eW/Ne20rZ/H
	 n6Ar8V7LNH6FjkS2MGw5YW657mtp/4jOe3kD9qOnl3UZwsYS2lRyGCJX/xiFIk8F6L
	 Arz4DcZQyy1AiCNvjKzwwTd8SQAEuSa5EA/Wm694mKzKcOBBh7aG+ILpVI8vkHhqst
	 cCPKEM/DWhkgg==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/8] qcom: display / dts: Few corrections of address spaces.
Date: Mon,  6 Jul 2026 22:21:28 -0500
Message-ID: <178339449937.1938770.7041355905157380217.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 05 Apr 2026 16:33:56 +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Patch #2: Add dai-common.yaml reference (Dmitry)
> - Correct subject
> - Rb tags
> - Re-order Eliza bindings patch
> - Link to v1: https://patch.msgid.link/20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com
> 
> [...]

Applied, thanks!

[8/8] arm64: dts: qcom: sm8750: Correct DPU VBIF address space size
      commit: 4fd832d6aed496c7111746d2c1e36b006659f89d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
