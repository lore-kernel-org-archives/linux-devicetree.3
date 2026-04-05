Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE29B30E0ED;
	Sun,  5 Apr 2026 19:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775418036; cv=none; b=YK8i6AJv573E/Lyd+OzTjTov+VQ5Bv+t7WRhXhN/f30eIOWuMiVlDbNE07Cje+6kIkUzgJxQzx7nq8/VWcYg98l25KQWOkgCTnvfANliAk2Ro2bKbSGzbSvl2Xh0emHwo6Mx0Zey57T1vL2TmYmvCpJd15u73VXvMlV1OqTewZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775418036; c=relaxed/simple;
	bh=RFubEIFIE7g/rVMQDbOCyChR2cmIqDzoJTnlx9FqtIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M2L7z5kMA1zdECrTM+6K5lQwut8RUNxPk9YW4EE24JxCpbnTF8v3SXyCVBbS0ZfiEV6IfEoFMzcVVqm7s8AVmT131ffckwUaxLzl3lPlmbcKdCH9kD5V2ZWfr49nomMOb19goN96JtBS3O/uf8CB/4lRpe1n3ibChwTC7FSupks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKmRVjH2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKmRVjH2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08F8C116C6;
	Sun,  5 Apr 2026 19:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775418036;
	bh=RFubEIFIE7g/rVMQDbOCyChR2cmIqDzoJTnlx9FqtIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hKmRVjH20eCDc69m9EIXjLgDIqBmNYUbD2OHpwlRuGN/tNGbMYJOIWUuh8I87kMbx
	 TCAm60JCK/hRPVijivTZAOexphc1y+2aX3gGMXXy2O6XiLWxSeLBaL3K0mdQoqBZCS
	 VMw5m9pggHyyhhFN3TTxr+prDr2wSZufGXm56PnTXiMTegbRhOG9Lplscjy/vxpTY0
	 rta21mzHL0OAoAV9jX7u+tzPRtnYauieXWPYiws+8ihBfxcG/daz1Z2x1u6aA6co0Y
	 4DlemC7br9T+sdp4W5BHNzJ528iPXZ0IIp2lw1n7vldLsLGh52r4mOOGhS4jysZQWi
	 D2uSHS+J4kqjA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/3] arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X
Date: Sun,  5 Apr 2026 14:40:16 -0500
Message-ID: <177541802155.2061229.14503101139366883818.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401-ideacentre-v2-0-5745fe2c764e@oss.qualcomm.com>
References: <20260401-ideacentre-v2-0-5745fe2c764e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 01 Apr 2026 21:31:24 -0500, Bjorn Andersson wrote:
> 


Applied, thanks!

[3/3] firmware: qcom: scm: Allow QSEECOM on Lenovo IdeaCentre Mini X
      commit: a31ad9339eff4ce401dec816b01a94b4e3c47898

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
