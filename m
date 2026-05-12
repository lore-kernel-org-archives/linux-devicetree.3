Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163403C2796;
	Tue, 12 May 2026 20:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617419; cv=none; b=oDiUXtXRgwXdRZPuCWvBgiaO579apN3JcraiQsuzIzV/CJmPjpQtIzjc4xdFcQSWg/kDS8GxIuZDxu27WmabQoHWrZS/WVbeScXJ0mRO6E6vObH56Se+c2itKctpELZLSWd9aMz7b4y9BqGaoz54jo7GwwA8uFvvtoXGP3Mou9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617419; c=relaxed/simple;
	bh=kbPSID6x1pKa04766yRopPnzdXjzwkqVcYlIOmjCvWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GTjefCEjrZtH/nVce1/0pBXuTqn+SYJErZVTz2CIvSXAQnTH5A1fz9nZ5CVbflNcJi8HVrZC02PPO97CD3Oy8cfq57jH5OtKJATCShL/Y+e/iEN8Pch1BcUqzJFFGA1QmmTqVjHJxRiwY2SKizj4YiidsLrEFoS6qm9nBwK4iEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1mVQEsR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1mVQEsR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5884FC2BCF5;
	Tue, 12 May 2026 20:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617419;
	bh=kbPSID6x1pKa04766yRopPnzdXjzwkqVcYlIOmjCvWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B1mVQEsRYQwThSXe8KvTzotJXe9HQuXnJgauMhuzWL94NGKvms+ZXftHmi0e+fxcg
	 UleQxlvq6a8HxQUx5t5JX4OJoMT7eljQeh1kA0XA4cAzfxAMmWHxDsxkGFsAvVg2pB
	 0ymYS4ysnj/1d8CKtoxz1Xoy1AXfH3Pkc5pPnlnkfoZEcjwrNzdp+/cIeG4r5FPqLm
	 OAXX6LwyL78UkRN4DlLd+BQTC4ebsViqTeWibKI4oZoy1oS4IrS5NA0xRIMtd0FZ/O
	 n2IZTUgsqgkR7WuOTzRV6qpKN5sWPbL+Ydt4RPYqsxLnfjs9VXBXxSrbD17Qk+h2Sb
	 91xrrFc09NeQg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add the SoC ID for the Qualcomm's IPQ9650 family
Date: Tue, 12 May 2026 15:22:49 -0500
Message-ID: <177861739365.1242344.9320797041140163119.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260408-ipq9650_soc_ids-v1-0-e76faac33f77@oss.qualcomm.com>
References: <20260408-ipq9650_soc_ids-v1-0-e76faac33f77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 08 Apr 2026 15:28:33 +0530, Kathiravan Thirumoorthy wrote:
> 


Applied, thanks!

[1/2] dt-bindings: arm: qcom,ids: add SOC IDs for IPQ9650 family
      commit: 8baf66cc4ca9bb72e97254af62ec8306225bb2f5
[2/2] soc: qcom: socinfo: add SoC ID for IPQ9650 family
      commit: 6fe5ea1989ad12adf181eb7872c990f9f32e89a8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
