Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D12358D14;
	Sun,  5 Apr 2026 19:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775418033; cv=none; b=FGRgvCUD8SGp8q/5lV+kGMXfUSr8s69HoU+qtS3nQ36RV3s+4camjpPdzB7gzBh1HNgZLW4wOW+9SmvyjPdAmG9ynRvAJNEC4woCpv4HgX1tMy3FetSS9YklogeED0yx2QKDGLy/0giabtphZ22pBhz1U11lQjlpe2l7sdDX1ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775418033; c=relaxed/simple;
	bh=bQG+8tokdFWRPF53QR+KKOJ+k7V0FMPZVMnyxFP0OKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VL4nDqTcSLjV7aIQTIJwgaRPZ+j6FRXj7H+EiOGOxcb1K/T/NtUrpJ/gBkHQsHfw+7jnKClahvrZzhajZjIUXayA5cc5EQ59SjmxtL4a9decKHo/eJn/KZVBmbv9F4scOjJhl+YbQrgxeZhV68BVtMBXfJ2AkURe505Oj9e1rSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CxP7NmK3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CxP7NmK3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB8FC19424;
	Sun,  5 Apr 2026 19:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775418033;
	bh=bQG+8tokdFWRPF53QR+KKOJ+k7V0FMPZVMnyxFP0OKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CxP7NmK3vo68lgagMte0wEkYdZbHdDNqphggwt3+uDAUvnC7GzNU8pJZWkqIVn0VC
	 zoAW1psPXhax3l9egQtWkjMXfIe2dRetNzEpBY+1zPBCCDmUAsaozS4H/16jb/yN9L
	 6znUk/RFsRgHNvPZOue8nO4v292djQSkelf2Q9LlKqk7zjRt1xuKRRsSZ5OR1TyPNI
	 OlTvOvvpI7K2aLx2BqpWU38yy9d4ePk5UCh2NyX7w9CKSSy1fewFhUS8juiVofjAGA
	 FWGDSosKE7MwpPx/YSNlS5PIOfwmgtutif7paZVlOEqcK41cCCF10jYJNX+0hYnyni
	 prvP6SjIqS2Ow==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Jie Zhang <jie.zhang@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Qingqing Zhou <quic_qqzhou@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: (subset) [PATCH v6 0/8] Support for Adreno 612 GPU - Respin
Date: Sun,  5 Apr 2026 14:40:14 -0500
Message-ID: <177541802134.2061229.5000793765364460655.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
References: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 31 Dec 2025 14:15:21 +0530, Akhil P Oommen wrote:
> This is a respin of an old series [1] that aimed to add support for
> Adreno 612 GPU found in SM6150/QCS615 chipsets. In this version, we
> have consolidated the previously separate series for DT and driver
> support, along with some significant rework.
> 
> Regarding A612 GPU, it falls under ADRENO_6XX_GEN1 family and is a cut
> down version of A615 GPU. A612 has a new IP called Reduced Graphics
> Management Unit or RGMU, a small state machine which helps to toggle
> GX GDSC (connected to CX rail) to implement the IFPC feature. Unlike a
> full-fledged GMU, the RGMU does not support features such as clock
> control, resource voting via RPMh, HFI etc. Therefore, we require linux
> clock driver support similar to gmu-wrapper implementations to control
> gpu core clock and GX GDSC.
> 
> [...]

Applied, thanks!

[5/8] arm64: dts: qcom: talos: add the GPU SMMU node
      commit: 1d5c82f19b8a079767622191fa7478028a6ce79f
[6/8] arm64: dts: qcom: talos: Add gpu and rgmu nodes
      commit: 8de397a5618aaea810e447946a1f1d19c610fdc2
[7/8] arm64: dts: qcom: talos: Add GPU cooling
      commit: a74c7b347d7e1094bf16e5053889c9ba4d9a3ac5
[8/8] arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU
      commit: ed5ee207bc075d774ecc837acc90d02548cd5061

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
