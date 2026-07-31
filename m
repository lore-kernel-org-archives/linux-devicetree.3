Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F9B36196B;
	Fri, 31 Jul 2026 03:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468288; cv=none; b=jhHm5vDOubuJOTbLVJvrQfaI6v+RXTfwpeoRvVhmjvpgu4A8ZT/AejMlvykG42ufN2NpVEHtFoyqexWq8KL8IJB2vLQCwekeLUT13NcVpBT2PgSIGsJhglThXoKHZbTsC4odiQ27VE+DFwTBEH3EITgiXEQiCIi4qZzAV6G2r1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468288; c=relaxed/simple;
	bh=1jD+N40IuzEzNO8FlImeyHA/LA3hOMl2CWPjYyWmZ2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ue0FKwtxDMlR2iUkbzOlUzScKtA03o2Ymukrb530tWqNK8E9MNUXWUY0edwj4/ov7+yRI2HCIHSAiXwxOdNYMrpqc3Ud9s0t72c0IUocwAPDy+mRD/2+yCj9RbgaNTWJHcX6HTOApICe960pJi7OTiZFU2DKuLEkBlh6tXZRtmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5VKrdDK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5VKrdDK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1DC1F00A3A;
	Fri, 31 Jul 2026 03:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468287;
	bh=MI6yhNvvzjE3vx8ywRjW3g3QofJ87aIC5Pirpx8zchI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=O5VKrdDKuWrQGSYFZlROwI0lArDoHcrobi4b9h4VItOmgd06Ya/2HGSgyyXPnr/Cw
	 vya4K8Cl1sp4uEmX/DHmQRcvp8StQhGZjPL6ADvO1NMMUMS0riMr/kg4skVBoqe6mZ
	 QB44PlINAKW4qyhPNZc47zkI2rHwl/P4VtBsA25cEK0hfRkWK9r5/9zBLsd77OhydX
	 xjic4nLOB+ReO3ukMzl1EM9l3HIP68seFoupgjSOvZ+2rj+0WMgHx8ardaJi3hgarL
	 Hr87yjexJTi+7FWctd8nHROA4Cy6wluIQITBcpLAVYrx13Cw402VLjR9h0NDP7PrzG
	 HjmOxt6TmCFEA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: Rename pci@ nodes to pcie@
Date: Thu, 30 Jul 2026 22:24:20 -0500
Message-ID: <178546826815.316815.11389607405061776729.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701-topic-dts_pci_pcie-v1-1-aab8de213b39@oss.qualcomm.com>
References: <20260701-topic-dts_pci_pcie-v1-1-aab8de213b39@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 01 Jul 2026 12:32:37 +0200, Konrad Dybcio wrote:
> PCIe hosts/devices commonly use the 'pcie' for their node name to
> reflect they're not legacy PCI.
> 
> Every couple months someone comes around to clean this up because
> people keep introducing new uses of 'pci@'. Seems like it's my turn
> now, so do that for RCs and the downstream devices (switches etc.)
> defined in board files.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: Rename pci@ nodes to pcie@
      commit: e806c63ba51a70aa8e19f749eb36b4d81760f705

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
