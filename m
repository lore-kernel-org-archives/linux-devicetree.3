Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8928396D3D;
	Mon, 23 Mar 2026 14:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276716; cv=none; b=MmDvex0+mWSsDKPULOQrrE4qToRJTGxyT4aQh+iCMJ+4keLhMeUIizh9Bag90O0+Ow8HfnJAp5gf+pvm5Zwz6ASDhXdtd1HDv39J5KuBKViaSJFTJ1c6JLsYz0+2Rx1d8TkO08Y2P8lA1wW58zrqlHMrq9B2UT6wS0iUHHX1/vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276716; c=relaxed/simple;
	bh=oi4IW15tmrSpvxFdHjnhmm9Z3VYOP4V5rARn7ED8/G0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HGyU9w7OQjsjkWTbBxR6nudy1+CFmhIeuovVhEjhg+Qiz+GnhE6y7d+V44px6NpuZqj9iXyIVSP0WcnjbbL04XNpd1zYmG6fDX5ZS1+8mCVzbgUuEY+Dxqt+V7SaS4s/s3+pIFmDGNq61Cs6SYak2/TN13XVXEK6XBK4+weULlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQ8zxHB+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQ8zxHB+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488BCC2BCB5;
	Mon, 23 Mar 2026 14:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774276716;
	bh=oi4IW15tmrSpvxFdHjnhmm9Z3VYOP4V5rARn7ED8/G0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VQ8zxHB+/ni3KfYocGcXAmhjsJ6QAKPir61oB1NVCiX5lbt2l6qDtWLBu4MzNKEG8
	 uCuIvYm0XVPvegIdW0bHsLbsHgNLXVToj4P8qQgqgHMK8KB4Zc+GD6ymMHxHCS06kK
	 o88UTyHPB8MoGuU1ZHb+ZOjj8dZUFPSOEq/gSvLllYnFMpg2hTtaA9XbM76R8Ov4FU
	 hn81AJ51gVvKfGU1EH/0cJlOFr5jJVwjo7ux3M1ORrJLFidTYOjfjvZhwkgEWn4JnL
	 RMN++cD5i32BAir7EtM5LilS0B1jVQBxSxDUJ4p5cph5LYQlk4JYOtgSwpjR/HC7th
	 gFCF5KcV4A+3g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6] arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad and touchscreen
Date: Mon, 23 Mar 2026 09:38:20 -0500
Message-ID: <177427670537.11515.13662094462598334686.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320-glymur-dts-crd-enable-kbd-tp-ts-v6-1-626d008534d9@oss.qualcomm.com>
References: <20260320-glymur-dts-crd-enable-kbd-tp-ts-v6-1-626d008534d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 20 Mar 2026 13:35:03 +0200, Abel Vesa wrote:
> On CRD, the keyboard, trackpad and touchscreen are connected over I2C
> and all share a 3.3V regulator.
> 
> So describe the regulator and each input device along with their
> pinctrl states.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad and touchscreen
      commit: 1ca87acbf91495f8e337311605bd8850c0d80d05

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
