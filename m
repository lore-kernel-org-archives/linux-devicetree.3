Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFC3340A51;
	Sat, 11 Jul 2026 19:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783799414; cv=none; b=aFBQ69wUjjGzhexol5IHdQ3uFnQH5PwFXlISldkN0cZDQ3KMBzK33b8Mo0l2abjU6vPTeWjfB4kTVLTPLWyVUqda6jgTjyLumzC5jLdEBC1H0AKR4YQQUEoq0K2mUszjuDW0Yg+Nvu3WEu1Y90ZaXZXmTgVgoPQZG7qGoCnkkRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783799414; c=relaxed/simple;
	bh=4TDcWVLTnFVi1l1/Jqt58as0xTJIHO4fn55i5yXx+9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Up97pY99kVKS2p5MzKMkl8e/owA4K+CQpklitRxpT8Q/VOwJAfUDkxzbd0eCYjgF5ZdrtisyEj6BoUov1fCGamM6dsRVvuA+5lchEsZkAP4vFegCLT+7OkqgHu2nxLdOHXSThLTQF/OdZ5pBjAT78PCIbUfuXFwq6H+AB3rzjl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aj9SRxsE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aj9SRxsE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08B51F00ACA;
	Sat, 11 Jul 2026 19:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783799412;
	bh=rdUahqtxJg50ApBQ7w/taQrMHkspc+FmfnbTmXgl8FE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Aj9SRxsEvxyqB/wtUbojXM+g5w1gpo6aq+71wgw9mu4hsFfY/u6RevYejNwy8eKea
	 44e7/5G7C6IdArnsOmbCuHxr4+beXitevDaVUDoMoI1gqssoPi+F7SPBaCs/WhApAf
	 +mdbGLpRoWaCFfnNHHpEGNHBVPuDz+kKeukzWnhZfs/J1FvLJGmRH9n8zsvUYPulx9
	 Nis/R91quzW6IotJMm/kvXWXHdf+tnBw34ExqQE4X4WT9MESEjUzIsVeQ+3YCjmGIv
	 yW7XqMeksJcprX0YHwpLARTfjf90ppzALGtWCPN+BRuFHbNvcC9Vc1O2XbKi/CjoJR
	 UfGnMcTZubxOw==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Michael Scott <mike.scott@oss.qualcomm.com>
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com,
	wesley.cheng@oss.qualcomm.com,
	abelvesa@kernel.org,
	faisal.hassan@oss.qualcomm.com,
	linux-phy@lists.infradead.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	val@packett.cool,
	bryan.odonoghue@linaro.org,
	laurentiu.tudor1@dell.com,
	alex.vinarskis@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/4] phy: qcom: qmp-combo fixes + x1-dell-thena DT maintenance
Date: Sat, 11 Jul 2026 14:49:50 -0500
Message-ID: <178379938620.163099.4648562543382010337.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 20 May 2026 18:09:31 -0700, Michael Scott wrote:
> Four patches:
> 
>   * Two pre-existing bug fixes in phy-qcom-qmp-combo that are reachable
>     today on any board which registers a usb_role_switch on this PHY,
>     and will become reachable on more X1E boards as their Type-C
>     support matures (patches 1-2).
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: x1-dell-thena: mark l12b and l15b always-on
      commit: e505fc5f96661f3e3afa4267ac9415d8559cf2bd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
