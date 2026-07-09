Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632653BBFCA;
	Thu,  9 Jul 2026 19:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625581; cv=none; b=F7LaNQdK5bAVdRBzvCE4VTpA1OBx4fDwuomH1s5iEjl2u28c2jJf9JUHBQ4RNKpf9svX5ood4gX+e8A8CMdMQD9hFHNPd8yjYoTJhfbtv57ODDpq1+TLD4wVRa0IbfM/9ougmZJ5XeT1dCZUFyIUO5uKDWU1viZZDTpSFdURALU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625581; c=relaxed/simple;
	bh=3Yav75tMKEREx391TGlRti6ewxaMEaWve/hfw83hmTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZXGmgCKsbrTGCzzxsRPWCErpGqeP092o9g6ISIAYdXCKa6CNbR6kVrx5bL8edDjnvwiv2zc2jLd/EUOiHIEDD9NudySU+p6Hu2W4GW7Rji3NwFmOBQuOUjPm6zeRP2h2kQu8F88+IYglt0qmxXxVHkPNmQ9ZGbPI4OmZrG8gp5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQ4Hi1rT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQ4Hi1rT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E741F00A3F;
	Thu,  9 Jul 2026 19:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783625580;
	bh=cLUcMQ4PyzPc+R+4vch0y6Yau7lgliCUcpfK+IDlCVI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MQ4Hi1rTvFsp0uCHf0qxul4rZypSyz6vLhJs2PlDquT5ssJDMOt8KS3OXivWOZYjY
	 sbO69TwX0MkMVxY4qVjR1pbVOUgEZSRmt3Q4qyrXl5xNQdAE8+owjSBxKftkI7YkXV
	 +6kU6k587WyrlTC7Zh/E4RojjZbeoxibAZPTqXU6nnOggdNU0ipbfNS6S3gG190kF1
	 AfFHfHhdztiOGVOQdPUFmCi8BD3OhCWqQfPJmj6ziOh12T5DPzYCgFB5ys6mVgNNXL
	 usPfOReQ+VbtNq/XJST9XNDSoFoEAyZCaCUHxfyIavdyuNwqPRFCeeGbnaYM3iTaGO
	 dOq5sKOG+qH1w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Enable first QUPv3 wrapper by default
Date: Thu,  9 Jul 2026 14:32:54 -0500
Message-ID: <178362531887.2423236.14255233587171205101.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260709-dts-qcom-eliza-enable-qupv3-1st-v1-1-e9a6904d0dea@oss.qualcomm.com>
References: <20260709-dts-qcom-eliza-enable-qupv3-1st-v1-1-e9a6904d0dea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 09 Jul 2026 12:12:11 +0300, Abel Vesa wrote:
> Since each serial engine will be enabled as needed in each board dts,
> there is no point of disabling the first QUPv3 wrapper in SoC dtsi.
> 
> So enable it by default. This is also now in line with the other SoCs, and
> also with the second QUPv3 wrapper.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: eliza: Enable first QUPv3 wrapper by default
      commit: 2b36a8327827a80523fc4ac08cb80b42765fca55

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
