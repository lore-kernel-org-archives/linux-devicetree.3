Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCC3363085;
	Tue, 12 May 2026 20:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617406; cv=none; b=QIVttBeCnBzldxOzLZXYrBhckc4SLxasqTPj/ZRw9xpV91TpdDj0UcmdpjxzaDNLgXevLMkZfZkXlKsbj585Rxbh60+SWcybMMYHkpIYN6VDbIwtKnzHV+8jrPxrBk7K4k2seHKaA4ptd7XVw/5r24Jizt+tHes/SX8xp4BlBJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617406; c=relaxed/simple;
	bh=UeZgoookbiJjBrM8+9uOpO74rnOX4IETwk6HxQ8RsUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m2g68Tf7Qrt3MSR/zKktVt+YXIIJEDtUuTwUR837KXN+q3Z0IuhLQzKypaCON1tqfm181tzS0CXQIaxpFVUI8+QS1Xtpw5Bs+Jn+xpXv8RGUZG2WtTAnkHvLSJ+b08QKOZt0FOXMaJHaPXd2RX5KddUz9ozhY1pV9f8TVrJSwHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRKvHeJR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRKvHeJR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B21B8C2BCB0;
	Tue, 12 May 2026 20:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617405;
	bh=UeZgoookbiJjBrM8+9uOpO74rnOX4IETwk6HxQ8RsUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HRKvHeJRAv+L3MnRUXQ7RBCyo4FhnRFNkCJHgAqS6r++JXVdFcu7BCx7NG6C0X4bt
	 Ya0KHLrgNROSs+RMPMyGeHp6a9VP0KRp6fC2ZL6F59JKbwt5SqDwS9lYSpEYojg3zo
	 lbqyFncOJtbrRpINZx2GaRJ0zSmI9DL5tL7LQR2YA3riq18FoJ+qBBJpEH090hGgXD
	 31ggDTSbw69bO3q7Qaok+uJ17pO+ZkZmLP4inl6CURVfXCCD1F5yNakZaFi3f1kwKR
	 qPPDNExtVwui33Ki76n3TXyRlV6+ibA3bqB8WOdx4JeuR9Nhq5j6M//hY+TvDqfnqZ
	 iOiryyTeZ3O/Q==
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
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] arm64: dts: qcom: glymur: Fix USB role-switch configuration
Date: Tue, 12 May 2026 15:22:37 -0500
Message-ID: <177861739386.1242344.7252675220044410615.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415-dts-qcom-glymur-usb-role-switch-fix-v1-0-409e1a257f1f@oss.qualcomm.com>
References: <20260415-dts-qcom-glymur-usb-role-switch-fix-v1-0-409e1a257f1f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 15 Apr 2026 10:52:55 +0300, Abel Vesa wrote:
> The Glymur USB role-switch description is currently incomplete and partly
> self-contradictory.
> 
> At the SoC level, only USB SS0 is currently described as being able to
> switch USB data role, while SS1 and SS2 are missing the 'usb-role-switch'
> property even though the controllers support it.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: glymur: Mark USB SS1 and SS2 as role-switch capable
      commit: 347fa2fa64e1cef0c7897522896c0c66e734c82b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
