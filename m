Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD4F449EB8;
	Wed,  8 Jul 2026 14:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522634; cv=none; b=Gp4rNYplVpadXSrD4q+kG0alwhgcEZzpbgGjheGWOFmE2Z3MsGRfYHlQyv8se1JhELGr40r3rbberbvY1zwxc7QrzWlszmDHMOvHc/cIDyFs2ByS2c8kCJOsCbCDnEnjEfPQbZvVbWjqvUbHITWWOslTFc4kGvWM4dUFiPGWIx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522634; c=relaxed/simple;
	bh=pIGSnfnIYwLJBEI78MzuESZyh91XSirlEed4svHdw0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jMDcLoHDDSKHxoUegzkwNfYy/Rbb+e68EnEHMJcbxJC5CzRcYJVVZjrljffRJIonXA5KngeRtxMTqRCTawpHlx6YFjMhgfbmHnDMAvI2Lr2N7WfpJciqePsP6LfjejlmtG1NdFBuz1yiTeOR30cBFurTxTa4KRc2jwrv7CYnaXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTdnqPoR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTdnqPoR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B824E1F000E9;
	Wed,  8 Jul 2026 14:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522633;
	bh=4uQ508Bd0bc7mLaC8m4/5Bx9glijirQQhS/Y3+JS85M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lTdnqPoRR2/WAo6YbJXwb3q9OuIrrTONc1Euw681gfZgUVeOEHhDfWn4bD2QMO2qn
	 gueOmOS40Em6j28bhSYYjitFMaAZ1ww5NPg6RKqh3PBYwx2VNsJIMpdW3NVbh9XGnM
	 MLxbGd8QUcu67uuQDdwsLmkQ2ZulJ5J2fWLN2tKyCz4GDAe5/7hrkZWTXsNdm3uEhu
	 0ucloBjzgGuKiPcePpzD7OeXX57ljiE9tL9KE4zCbHE//U8dsF5i72V3VxB51ezt7t
	 GFOuWRQWQRuBFHptqVgUSy/3NJvW+ePZpOkWY/jJCeJ+nFa/P+qmCPb1IypNj2V3w6
	 BJgyDdG/M7pLQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Wales <daviewales@disroot.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/2] Add initial device tree for Motorola Moto G (2014)
Date: Wed,  8 Jul 2026 09:56:14 -0500
Message-ID: <178352261576.2235436.17200055989994996286.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260605-device-motorola-titan-mainline-v4-0-08a7be31f05c@disroot.org>
References: <20260605-device-motorola-titan-mainline-v4-0-08a7be31f05c@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 05 Jun 2026 23:19:10 +1000, David Wales wrote:
> The Motorola Moto G (2014) is the second device in the Moto G series,
> with codename motorola-titan.
> 
> This series documents the motorola-titan, and adds an initial device
> tree.
> 
> These patches have been previously discussed and merged into the
> downstream msm8226-mainline fork:
> https://github.com/msm8226-mainline/linux/pull/18
> 
> [...]

Applied, thanks!

[2/2] ARM: dts: qcom: Support Motorola Moto G2 (2014)
      commit: 28236bb8f50216fe98f895b31d593e8d8ddb8a27

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
