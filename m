Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDA73B8128;
	Sun,  5 Jul 2026 20:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285109; cv=none; b=dFuQ9Q1F9bl2jn/X04YTS53EQsrknFIa/nLuXLF1hhhoQhRxSyGdF3WbaAvxBtR8DAYm8qqSJJwijeURGu+8ZQgS8TLoCDwCnURBUTphWw1OTAS6j85j5EzGNkn+8rOkwEpdw5batkLoAiK7inTIp+DpT8m31KTXc93JazaYY3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285109; c=relaxed/simple;
	bh=PQ2lPTC7NpTNNgxQP3TW1oGfNbL21feBWthcc9qvV7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hOBiJffEY0vYKd5jOhMDbsOlOZADtdVegEM2Rq9drE/kQwiEPsLcNvj1B2zDNJx7wyAOeBOsyGYhimkeKet5sMjJ1tz+bwffxCUowoXTP8rg047NThFpQwac/KMxNeXjhdjuCmyP5/RU3sctOLRumJUrlFcti/Gxnnm1L6jfV04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eOiVejbD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eOiVejbD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8F61F00A3A;
	Sun,  5 Jul 2026 20:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285108;
	bh=Bl1Jxdvc6GwyfXCq5ELid+03Ej5gq/wsr021ZiMEBPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eOiVejbD8WPzbsh6xPCinJfU2Z1oTjVwT2f0q53XpLUqfhGrdugDoPV6bmu3AzlN7
	 rMNC3GsmDZH8W7NNQUCsbLUzHnEn+Pln4Ki1SZIIYm7PoIDskVFISzN+Xn/7i7rO3R
	 PRHPjAk6qxB0A1xcxTaB4JBMslTI9UmEHONPLKnK/6r6qEg+5oKR/zGX1DjO/TqJHZ
	 ee22+3qCbFPw+MZpA2iEEDputVOjpARC1E9CON7cDQ21TEvsBpZAgdwPimdqxdLLpO
	 SHwmiNOX2Ld8zx+lZpd2xEoW82a2/8Sf14r79pLiTfId6rqbFccA5u/ltZe7M9P9mS
	 q7U5gYu9nc5Xg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manish Pandey <quic_mapa@quicinc.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	Nitin Rawat <quic_nitirawa@quicinc.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: wire UFS to ice instance
Date: Sun,  5 Jul 2026 15:58:03 -0500
Message-ID: <178328508281.1157743.2836982929405843115.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429-sm8750_ice_dt_fix-v1-1-2540dc337082@oss.qualcomm.com>
References: <20260429-sm8750_ice_dt_fix-v1-1-2540dc337082@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 29 Apr 2026 15:05:40 +0530, Kuldeep Singh wrote:
> The Inline Crypto Engine (ICE) exists as a standalone DT node, but the
> UFS node lacks the required qcom,ice phandle reference.
> 
> Add the qcom,ice property to explicitly associate the UFS controller
> with its ICE instance.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8750: wire UFS to ice instance
      commit: ac456227d22952b656ad291ebd2d3d3e498e3d95

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
