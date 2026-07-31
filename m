Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A179D35CB66;
	Fri, 31 Jul 2026 03:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468284; cv=none; b=VSpGK5otS0ozKaPoVUjXw/7LZvo06wm3KBI9XLUBqCwIVS8kjjSddDjZ7+eUt0DOaEDfsRFKsF4Ds9DNxGdfGU3nOyo9isETRJ+XjLe46QUaS+lA/bVFL/RtXYUnGvwik6atNvonjMTAUORdFviIWx4eD10T0VMeQY1/NqPTTg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468284; c=relaxed/simple;
	bh=bE4fxycWcf7xoRJxeukoyr6VrPMbvhVHsfdJuWfXKWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k1vuH975+ecIJbWfIdQaUHQCJ453TXTF3m0tmyDzYX1ppYni+8fLnlzI3fDl0EYW+GXROPOD9ir/kfQNPuKos1Hv2yq1QoOsBMC7Dlj0alRAbmRLqHiZ+b4h0zjMdsamePTWtuqMnnqcaWUmkTDwwTen4hdZSd6EkR6W/P3tpLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ix6YHbd1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ix6YHbd1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D973B1F00A3F;
	Fri, 31 Jul 2026 03:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468283;
	bh=qIJiyPH9jd/miLLTZBSoHkVtioP5ZXY94rhk/0+wV68=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ix6YHbd13NjFm664d4z8FAVyozXs42xBn94Vnl7fhjpl7lMlIt7orGwjfceX3fRiu
	 TtEgZVJKVRI1B/sIgFfMxdwDFl14sxwZj4XVf3R7Zr+RxiKvgxdn06NB2BUfQduy/R
	 Wng9bOYIYhWmrj8hffOzg4vT/859pvZeM3jkF3np+TF6LjTSqw9ShWHO8Um1KTu1av
	 3At0tDT+TXMkYmsApDhvOhbwjNf1k1Dim6uKLAOoiKxktxckc5U5stprayero7MkGC
	 sggpdB1EiyJMrN3Ns6IQ9p0tC1AIqkgF2sRqyWqYYI7H2HSXXc2jWZrLgmbLZkgOzN
	 I/v/JdS6rvZ6g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/5] Switch PCIe node to new style of bindings for Qualcomm IPQ SoCs
Date: Thu, 30 Jul 2026 22:24:16 -0500
Message-ID: <178546826820.316815.5812191334252451368.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714-pcie_move_to_new_binding-v1-0-6bb25887a0dc@oss.qualcomm.com>
References: <20260714-pcie_move_to_new_binding-v1-0-6bb25887a0dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 14 Jul 2026 10:11:19 +0530, Kathiravan Thirumoorthy wrote:
> To align with the new style of bindings, move the phys and PERST# to the
> root port node. IPQ9574 is the only SoC which did not have a root port
> node yet; the other three SoCs (IPQ8074, IPQ6018, IPQ5018) already had
> the port sub-node but still kept phys and PERST# on the host bridge.
> 
> In addition to this, enable the PCIe support on IPQ9574's RDP454 to
> enable the Wi-Fi support.
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: qcom: ipq8074: move PCIe phys and PERST# to port node
      commit: f1b63ded8bff1e6277a2b9f6e96c789ddcf90656
[2/5] arm64: dts: qcom: ipq6018: move PCIe phys to port node
      commit: 1198b7ff1fdd2ae77ab2e5b3cddd4fa2aa9f38bd
[3/5] arm64: dts: qcom: ipq5018: move PCIe phys and PERST# to port node
      commit: a95758e9718ad686e9e7e8addcc181bea853e5a2
[4/5] arm64: dts: qcom: ipq9574: Add PCIe bridge node
      commit: b99a594cfdd0862709ec54bdc356360e332377f6
[5/5] arm64: dts: qcom: ipq9574: enable the PCIe support on RDP454
      commit: 1290c03dc2d1e45928b427c616bc24a536e7601a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
