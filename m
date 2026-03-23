Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD233B27E5;
	Mon, 23 Mar 2026 14:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276719; cv=none; b=dk/4z4NroFLK9hXxLJpIi+JZeu62E2SxJwkKteZlVGbB4dtw9sYKnkUzcreJcqimIjt1lU/funM7CldoZSMYZ79fsvMpjCvbqMhzhLSMms4f7XeYwWPpQom9CjVeQNJlOTJS3lpSOlAu+a9a3D/pswbRKz/2u5DGr6i2Pp+6bhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276719; c=relaxed/simple;
	bh=tg/1j+MtWFSu3HIZju+e7rGXKpeZKJnXzZ6gWOgWWzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qc2cjSTU+uPlvp4aWxI3zHbpKe6+7qf4DGNGBaidGITxjh5JHawBcB873G3vhHGJSsLVLiE7BMzEFIOwjvrIZoKBSPekMxpuov7gedSfVcXkS/5ob7O0ikRb7L1TBg9gH+ucFszYC0LaZ839ukkKc+4MSQvo49kQx1g1paPt45U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IFvQNp0r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IFvQNp0r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BEF6C2BCB4;
	Mon, 23 Mar 2026 14:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774276719;
	bh=tg/1j+MtWFSu3HIZju+e7rGXKpeZKJnXzZ6gWOgWWzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IFvQNp0r/cBFUept+6MaIhL3TVVcBFDpOx7T5aTy72PA3Z3GO53DsQ0AbTqZ5O3ks
	 2N04mZl1EQRrGXsJ69IBq/bXjyzvoiezo39xLNTs5EX/eanHuxjMUrA1WH5ffLANDN
	 6TInotEhRj7a7YT31A0HFiey0ovJhL4ngYA0XIiFbZ1/Qvr9IASLnH8dMj5hgjhYD/
	 H/OknuWAN0kOMEITOVp6AnjLIPYPpjNVm9OQMaDN/1kPvIDHXR5BtTO1merNpsun8m
	 lYzMx8YS+B0SpCGDYqo/thCmJU/+YC1zFlxee34kCMAvkTFI8/ZeJGY70mPKB2zJmu
	 JwGN41UdxitKw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v7 0/2] arm64: dts: qcom: glymur: Enable SoC-wise display and eDP panel on CRD
Date: Mon, 23 Mar 2026 09:38:22 -0500
Message-ID: <177427670536.11515.1784220622481370950.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320-dts-qcom-glymur-crd-add-edp-v7-0-ca415560447e@oss.qualcomm.com>
References: <20260320-dts-qcom-glymur-crd-add-edp-v7-0-ca415560447e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 20 Mar 2026 13:16:42 +0200, Abel Vesa wrote:
> Start by describing the MDSS (Mobile Display SubSystem), the MDP
> (Mobile Display Processor) and the 4 DisplayPort controllers it brings,
> then describe the PHY used for eDP and tie up the PHY provided clocks
> to the Display clock controller.
> 
> Do all this in order to enable the eDP panel the CRD comes with.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: glymur: Describe display-related nodes
      commit: 0953d8f2c4f9bd8db371d74712058079dd0833a1
[2/2] arm64: dts: qcom: glymur-crd: Enable eDP display support
      commit: ec3cf3801e1376d4b4f9ebf93ac39d294d53ec7a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
