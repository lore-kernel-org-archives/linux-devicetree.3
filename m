Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C4434572B;
	Mon, 30 Mar 2026 16:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886510; cv=none; b=bl7qnks+zuHCcBRsy9+CR4RcB0/vojUDeo+j2GesJ9nzdWrLh3WHBncO94ZrwJDA+bN7l+PQILFbNjZ8tOyQu2wenT8HTVsmnlaLBWNMn1gfbiYabNrc1of+8YT4jWHBMYKGEb4EINQQwTB9CRwr64BBqU4y3Bnwk42oAPd830A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886510; c=relaxed/simple;
	bh=xVNnI2s9hxovAWINawO8TXyNqx6KZ45Jhq/gfbXBaBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EEDpcQJ3CmHEWCMvbjTbcpcwDVz+atTpDb6Ma5+z7cX7pKo5jw9jNa3TvivUE/McrAd62ALxdS/aZi8VtBt+1zz/BsaXj1eUhA7peb0YygRDVVxEN9kUGYwtMve/5Z8ErvSRoy29t5ncms0ZlNVIPndo+8QlkpoY5zq1f1yqHQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZXeQYRz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZXeQYRz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D41C4CEF7;
	Mon, 30 Mar 2026 16:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886510;
	bh=xVNnI2s9hxovAWINawO8TXyNqx6KZ45Jhq/gfbXBaBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PZXeQYRzi1Ovhyekdl6rKpPgtFCnrKHQp4t2ffezCt+u6JuVJHUAMmVECrcUjdmJ0
	 K6e0Aj2LFXEZvxxlwyOCcD/xWvoEJdIua5ZJ+Q17Ganx4/dQIbm2ngIjtRzv0PjpMc
	 ZwF1Eg9arvr1k2Q8/wPW5cbu0QlBSY+k8fl9HQPFAZH4Yf5OHjT1ip4ti4JiAmQ8Mx
	 LkErrK1nO1KreQgw2KVQA3/F/S4UlH71bUm0c8Bkrce500t6AvEta8GH31FHtbUJdd
	 WglnSJBzw4TLicJSkTHn0W87CqYkiL5sQq9ODVu4krIeIpfWGxdLufTsFlW1TBF627
	 B5f5rq4Z/ce/w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Thara Gopinath <thara.gopinath@linaro.org>,
	Alexander Koskovich <AKoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexander Koskovich <akoskovich@pm.me>
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Add missing CPU7 3.09GHz OPP
Date: Mon, 30 Mar 2026 11:01:09 -0500
Message-ID: <177488647787.633011.1811372743907758191.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260307-sm8250-cpu7-opp-v1-1-435f5f6628a1@pm.me>
References: <20260307-sm8250-cpu7-opp-v1-1-435f5f6628a1@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 08 Mar 2026 04:26:37 +0000, Alexander Koskovich wrote:
> This resolves the following error seen on the ASUS ROG Phone 3:
> 
> cpu cpu7: Voltage update failed freq=3091200
> cpu cpu7: failed to update OPP for freq=3091200
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8250: Add missing CPU7 3.09GHz OPP
      commit: b683730e27ba4f91986c4c92f5cb7297f1e01a6d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
