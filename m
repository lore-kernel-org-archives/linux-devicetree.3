Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46BC35F5F4;
	Sun,  5 Apr 2026 19:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775418044; cv=none; b=b2SlHMzvWQU5mrb1yEwHsftZejjriYDKHgaM7FAl/TGQonHHNhuWv39PJOzjgTpl4m01/PIl97DXus19fdxmJ6HYuTUEQrJ5OJfKZhKTRmpKd4q05KB+hq11CPmWgweQviTP0cU+SFSwId8L1BiE7+ZJleqms5jBDQKHHkJ8vp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775418044; c=relaxed/simple;
	bh=fabW8z1F0s4Y+4YCmeH5e4SYzBK8WxvQgpH/wBU3kkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b0zeVZHN1eKHX3vRP6y+q5AXs9sSWUXJ+4v36iy1ilOhFifsWvhSUZ7NH9+7YhrGIA9DEC6ewYrb3blPBTdk2mJLcrysdBErlKX9x4p1MKYX97QL3aBqdzcpyZLctZeLrf6k92aHDavAbVOZ2tdJ8wDELiqDdSYAZF1i03TCwUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nz17K/3C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nz17K/3C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1496DC2BC9E;
	Sun,  5 Apr 2026 19:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775418044;
	bh=fabW8z1F0s4Y+4YCmeH5e4SYzBK8WxvQgpH/wBU3kkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nz17K/3CdoJGHoLMWHDtb2pTWrqKNDDQzhuwQHIjea5kvoWJyGeFooKVNV/ngHrfk
	 a0Fx8OYqPfQ6RLuAeNLyy3GgzJjcHB2Myue1NB47uv5MURnlQgKUsSWDWl2KLuYlGK
	 7MO+DM8TeaMlOXN1wcmI1gtMcGAYuuB9znn1AL2uecsb9496EXFqPxcuOtdiEuiGyF
	 MVGlZ9d9rl1eO1UYTjCfJtLMOwn3c/fB3IFGXYqUC9TE2rrSukZO8caWxVN5UDo9rB
	 ri4NTzBdOsOgW868wZJeMcAX/81FClEeonhKLUO4RX9KzPqpZIw/TNCgR2lOPW7VIC
	 WvdbNt1K77l8w==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 0/3] Add Qualcomm Technologies, Inc. Talos EVK SMARC support
Date: Sun,  5 Apr 2026 14:40:24 -0500
Message-ID: <177541802144.2061229.17382333861009359859.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331060107.501561-1-tessolveupstream@gmail.com>
References: <20260331060107.501561-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 31 Mar 2026 11:31:04 +0530, Sudarshan Shetty wrote:
> This patch series adds device tree binding and board support for the
> Qualcomm Technologies, Inc. Talos EVK SMARC platform based on the
> QCS615 SoC.
> 
> The first patch introduces the DT binding entry for the Talos EVK
> SMARC board, and the next patches adds the corresponding DTS
> files for the platform.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC platform
      commit: 44a47bd49a574bd6365f64d5d6f724c2e8d466df
[2/3] arm64: dts: qcom: talos/qcs615-ride: Fix inconsistent USB PHY node naming
      commit: 83a679d61e8d18787ddc6c2f406546bb80dd2a8d
[3/3] arm64: dts: qcom: talos-evk: Add support for QCS615 talos evk board
      commit: 0f9e6db8a2237e41209322017e2e9c45729d6d45

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
