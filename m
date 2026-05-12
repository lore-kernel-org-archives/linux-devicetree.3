Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E623DD856;
	Tue, 12 May 2026 20:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617442; cv=none; b=tP8B+cV0/cPlmUh7A0Vn04g7UepWeffXvsP7Tf/Z5e/K+OC+gMVJ0knMzEdrno7GrAFNRQjW74nRx5txS24F+ornVubfwugOnToKHANXlO0ID8TnXN8DNr0FNzUNn7QUMBoJ4wNcoVDoGaPD00m9UxdqWX6rP7kUvDP2xNvSgao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617442; c=relaxed/simple;
	bh=FB0JZOBS8gepGT1GnyWBeoGe3Afj+vlBtrtbFhBvZeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Blnpi4KirG9H0M7ZPflpMohAWJKC2Mqikyhsde15Fa4kJk+OMtkPvAJqtoxaQYxS4X3QbnyZO0dyf5M3lkYnKresuXTwRD0cawlK4vqYX1vXfCoBzZrVvTIfEJWIMLyhoX9qFrdzSGAyRqXQYUEXPf30V8KGInAKi8nOLWR/0uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BK4XmmdC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BK4XmmdC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79ECAC2BCF5;
	Tue, 12 May 2026 20:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617442;
	bh=FB0JZOBS8gepGT1GnyWBeoGe3Afj+vlBtrtbFhBvZeE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BK4XmmdCUWqleX/EgB4KdL0fnayh7Ktcvb/vjdZzc9zMSw45fc4GXq/1fWTLS9Epq
	 rV9vHAsHFt8wQe2FNInSa8/uuY/iq0VRDTXlPYGFD3xb6CK/zLq7Wd2Uwexesni2N3
	 Ais2yw+N+Hk5zfN85h9L+tsMyDsENJwp4WD2tttlCNnjzp/nF+T8kekGljKtzgDmrX
	 SBlGQ+m7mqRGf88US27/p3u4x32wPybIPnwLR8dR3ToCUnTd8UEJBDd/4X76VESXu1
	 CNiM2OG8AgJyACkW4kTz34UkGCWf/i/0cW9X3EN+gcJ6lRZ3GpxC+d39l6gr5WYs84
	 G1QhP1PDt+HCw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: sm8750: Add camera clock controller
Date: Tue, 12 May 2026 15:23:14 -0500
Message-ID: <177861739392.1242344.9920484810943583221.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511-sm8750_camcc_dt-v4-1-eab4b6c3eaea@oss.qualcomm.com>
References: <20260511-sm8750_camcc_dt-v4-1-eab4b6c3eaea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 May 2026 15:45:43 +0530, Taniya Das wrote:
> The camera clock controller is split into cambistmclk and camcc. The
> cambist clock controller handles the mclks and the rest of the clocks of
> camera are part of the camcc clock controller.
> Add the camcc clock controller device node for SM8750 SoC.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8750: Add camera clock controller
      commit: 4a1779f42e21962381a9696d182a2620c830ff10

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
