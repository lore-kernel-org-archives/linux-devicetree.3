Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C84330676A;
	Tue,  7 Jul 2026 01:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783387658; cv=none; b=NqzB1Cb0kDEqHw6EC+La60eByJemMTH+YZ+mMgcd/rPE41CQ2FuqnTX/uqUazs+ZtBW+mT+UGnkgKnjasFNx9IctGAupk5ZAwS8I/E/S7VF9C9fk3XEjY566N7bfDxNdwkC9m/Kk3wa+7+YJr+LcRBdIRl7rRQU0tFy0gXzXff0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783387658; c=relaxed/simple;
	bh=AZU8AyjKOFAXO5WS8G6TsTXy2Y9o8Yudde47F/D7Qx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lI7qZxigMxtlK4FXFD1VFmS2eoyuy/MOxFiYYOm083/Eo3aiqMdbBFaMzO48nAq2zyM13l6Ow+UxgauKJ5Rk+1FqoazWjW2YqL2c/5WB62msz7XFyk3cDxq+6mwhE5O1whnpVphhTQhVEL6z7rlIoBSRVvuxW/WbJdgHXTFN4k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o20qRvAl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o20qRvAl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3661F000E9;
	Tue,  7 Jul 2026 01:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783387657;
	bh=W+xWS6WiyIkyY/OjOnic8qYp4azRnXcYPS8PH0auCro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=o20qRvAlyJy/mgpUCrNqRqzKfRDyKfKfzo/GlmN4kKBowQ96t8duvAcZPFMa0eB6T
	 vecob9bG6k0PMFjOX7Z+BddmOK/TtKIjTuHZEXxRcW/q1fBzE11Pi7jiH8VLVO80nN
	 54ogRqZEYFND9glrTqYfV5sa1lJ7bELQWzgt9I9PsukKH9fyKvxocTsfjq/444L0Kd
	 XPp21OkOpLfQ5eovjLriHq9awmOEJnZnd+h64sCwgutYu8oG/zIIYo30ZSVfSaPX4N
	 xcf1RBE1JBixIbZcn//DKBDLw0j/0jn9P0XT93C02diMSktKXSLNmKK3iLcyH874ji
	 P1uqXH5EYIyXg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI cluster idle
Date: Mon,  6 Jul 2026 20:27:19 -0500
Message-ID: <178338764562.1558388.13019265138555746096.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429-c630-fix-idle-v2-1-ac867dad6f21@oss.qualcomm.com>
References: <20260429-c630-fix-idle-v2-1-ac867dad6f21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 29 Apr 2026 01:27:12 +0300, Dmitry Baryshkov wrote:
> With the default PSCI suspend value for cluster idle state Lenovo Yoga
> C630 isn't stable enough. For example it might reset if display device
> isn't probed early enough. Drop the bit 0x4000 from the PSCI suspend
> value to make C630 work in stable way. The bit was found by
> expertimenting with the cluster idle PSCI value. Most likely it results
> in the less deep sleep and more energy beign spent in the suspend state,
> but it's better than the non-stable system behaviour.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI cluster idle
      commit: 07db10de262f4150e24fd631a7a6c428f7bf80c9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
