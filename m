Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91B83C3425;
	Tue, 12 May 2026 20:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617407; cv=none; b=fSU6lEeO8yegFIMxdvSeuN7Tr2IEiABxwGduC1PxwIOpVvBra9dXOGmFE7uaUSCrpIfHcYn3ZErJLItC4bb5Dfi1jCrOpctqg+eMVXVZKLTVjCtbZdwMZOTdmNm5VCn1lAHdH3t5g4RRCyYFLajloYvzCfaaYMahbKILF1L6dOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617407; c=relaxed/simple;
	bh=chukIX+T/btmNaTArLOyiZMQPLB8ZA7TdWweHZtdVgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NPpDyRYdsBhuT0VkxmuGlNWh1BcY0NzqHgl+l5FfG4B/9oRucPX5joVZ5WqCHV+5Pt396lwhmQmtMlzNfI+2k+2CF0PYSEnj/++gjVHtLo6IukLK76UfqQyUyEnCUG/sTu6ui9QVhyb5oXvrUy7mXC1tPdHG+0/vdaI8mnalfNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yf+r9pc/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yf+r9pc/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F373C2BCF6;
	Tue, 12 May 2026 20:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617407;
	bh=chukIX+T/btmNaTArLOyiZMQPLB8ZA7TdWweHZtdVgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yf+r9pc/I7zPkiWRO+YPLGsWTMgkSocrd7a0ESE1nERRskTqe6gOvfChbdoCwvTUH
	 nlWr77IaqRfjF2w44dT8OmibcuLFQEaAIgzwWbgteKhgzCoqhbYqdyW6BfRvm9T6SN
	 QUg3T+TY+xdG1PSwiO+VyxHWQjg650JbrT3H57Hmf3ZzchzM+pVmmkvXPPWmjZttk6
	 WJdHU8yvvVjif/ptVOSf+9jbmDkwlgfXazWjL26baFOekcwwtmr6ELnPJ3cCJCHAnC
	 IGhiql6VZ04K59h4Ce1B2ThsHFqtTui+AJ5GaUOnDNvHti21JzDi+qqMTHedEQAK0i
	 4rIm9rn9NiK4g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Drop RPMh CXO clocks from QMP PHYs
Date: Tue, 12 May 2026 15:22:39 -0500
Message-ID: <177861739387.1242344.12258692295804353296.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414-dts-glymur-drop-rpmh-cxo-clk-from-qmpphys-v1-1-ab12d77c4aec@oss.qualcomm.com>
References: <20260414-dts-glymur-drop-rpmh-cxo-clk-from-qmpphys-v1-1-ab12d77c4aec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 14 Apr 2026 20:05:51 +0300, Abel Vesa wrote:
> On Glymur, all QMP PHYs except the one used by USB SS0 take their
> reference clock from the TCSR clock controller. Since these TCSR clocks
> already derive from RPMH_CXO_CLK as their sole parent, there is no need
> to provide an extra `clkref` clock to the PHY nodes.
> 
> Drop the extra RPMh CXO clock inputs and use the TCSR clocks as the PHY
> reference clocks instead.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: glymur: Drop RPMh CXO clocks from QMP PHYs
      commit: 12c97d1c15f926cd430bf5cdf8ffe878cb478165

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
