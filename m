Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B283367F22;
	Sun, 10 May 2026 12:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416292; cv=none; b=lRTomFW+tHqPqKRvGizc5V0rih/4xuQQ35v6O0KbBL/vSHw+WtRMa7t0vG5dLdnyPBECi2ShKpOaViFN5eS5ObqIficlqQrfM6aCWEW7/Eq219pHh1D634E2lhIathgieiMzqIzdZ3Yzc3jf+lH7qQYcseZ4IG8mSppOWmLoUGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416292; c=relaxed/simple;
	bh=RwUVSceGXN6Zj3eqGbRDwsX2wsyuE+M7//II/W2UAho=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aa85NlKpMcISXobEMELcjPq51OcttB11jNWBb8IJlos0FoI/DdL4e5T7whf+3Strp5ZQW7KnNtDERGnNkXHUPx3Vcq5LCLxr4p64Lw415YSQ1uT46qWZULzau89QAAsC/jzkMUE3BJKXvfbYnhNEFB3yy1/ueKBs8rg6jdlzvno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VtHvbgrm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VtHvbgrm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92FA2C2BCB8;
	Sun, 10 May 2026 12:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778416292;
	bh=RwUVSceGXN6Zj3eqGbRDwsX2wsyuE+M7//II/W2UAho=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VtHvbgrm2fF7OkZo6Si14eE4HWRkHjFKUhM9ZBKjaDB8g31Wmg1z/YoSeI6gA6rS0
	 wlzUfPGaVuFiRSGbyrG148WxUGglq9d7kDGXD4K7zX1Z8nMnoamcLW4FXMR1YzLoxF
	 OnQ8DM7AmHQsm4+2WgrZGhrJORCHld0Jop4wY9djrefOy1pJXdbZSMCMaWUNJgTWR8
	 097Z8XyNEf58eg+mnjMJQRmp4kZHLuB9t2RpRtlJWlBHikLVGPGonrfHTaJo3qDObL
	 yVqsWVftS8gY1aPYS5yeLLahR5E3IPm0x6o7XW5yfWCZYQyFp3dTFU9IXDCyY4jPp6
	 FNyHO65bGdzzw==
From: Vinod Koul <vkoul@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260504081442.825908-1-shengchao.guo@oss.qualcomm.com>
References: <20260504081442.825908-1-shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH v3] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy:
 Document Nord QMP UFS PHY
Message-Id: <177841628820.434434.13627667642408446843.b4-ty@kernel.org>
Date: Sun, 10 May 2026 18:01:28 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 04 May 2026 16:14:42 +0800, Shawn Guo wrote:
> Document QMP UFS PHY on Qualcomm Nord SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document Nord QMP UFS PHY
      commit: 6d6ff64e01ddeb579bf0078e5b6d50c04035541e

Best regards,
-- 
~Vinod


