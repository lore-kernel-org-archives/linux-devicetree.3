Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B903FBB6C;
	Mon, 20 Jul 2026 11:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784547799; cv=none; b=OAxaYcMQkOgQX1kyx4Xt6jQ0AqAcidkhkpmZkjxBViWnDQK58GB8HZz5nuaoRrhUyZzxWp+u3odXOwTBXrkaErgHr5xTuplEkWO7JYVePePpmIed+y1b+KSNf1N7i00SXzedE3eK4BI1gxhxvCzzDSK5490GgM1sSG+v4t4z83o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784547799; c=relaxed/simple;
	bh=GupNWRIk7hV/JagEZefUNTHOIyOkm5P5S5kXvX8eD9A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I7X8HxlnhBQjxoZhJga1Z65xQxsTEK7eDCy1ztS8C1lsKEKN+55Py3p5SKFBuhz7kfP7qK68MOpDE9LwGKyCRAI+6apTga9jGmB6M3qaprx5iNzs4dUzPfe8nDcJn3HqNqJaeIVGmAHr/R6+/XF7WV4Y/AAlulsGEqjtuoN7Ajg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BH/R7/rg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BH/R7/rg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A921F00A3A;
	Mon, 20 Jul 2026 11:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784547798;
	bh=IwbTmGPKkSmwUNAoJKDpbszDISUrVaoIYCDL4XOp0Wc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BH/R7/rgj1uJg16QxlPlswjF87TH/1ns2rIHuke2Z6aaeXtPoFZniBV9j3lWErfzo
	 rPAbtqR1HLgskNsM1XHl11Lz5/3sKkxvyyd6Hfp2iGxcxXvYyENPFhuLeVK8CbRks7
	 h/lrqecFZgKqmp1x6HbKoSeLATp3fTYndD4EFcafSi69UNplzUH/clVFSy5cWmv0EJ
	 BPQ0fVFcafmcjrUyrMKi4Xq038TGO2Z6rxej1HnFygEsjM6juusQgyYE6Bj3BCZlDt
	 TqbNXxDOwvvftOsTClqpJBADCZzdtOhF7RDPJDR9j5IaD3j4WRft2u0X531r9QJKkw
	 L7N1UyH3j5rPQ==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthew Leung <matthew.leung@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260707-hawi-phy-pcie-v4-0-8d9cc6324947@oss.qualcomm.com>
References: <20260707-hawi-phy-pcie-v4-0-8d9cc6324947@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/4] phy: qcom: qmp-pcie: Add PCIe PHY support for
 Hawi
Message-Id: <178454779443.1388616.1697222144323108998.b4-ty@kernel.org>
Date: Mon, 20 Jul 2026 17:13:14 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 07 Jul 2026 20:32:45 +0000, Matthew Leung wrote:
> This series adds QMP PCIe PHY support for the Qualcomm Hawi SoC. The Hawi
> platform features two PCIe PHY configurations: Gen3 x2 and Gen4 x1.
> 
> The Gen3 x2 PHY uses v10 register definitions, while the Gen4 x1 PHY uses
> v10.60 register definitions.
> 
> The series adds:
> - device tree bindings
> - v10 register offset headers
> - v10.60 register offset headers
> - driver support with PHY initialization tables for both configurations
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Hawi compatibles
      commit: d15224492d1aef8b28508f23b889ee0394b07b83
[2/4] phy: qcom-qmp: Add v10 register offsets
      commit: 0696cc735dc7ff53297ad2ee649ceed3b1f93d07
[3/4] phy: qcom-qmp: Add v10.60 register offsets
      commit: fdfe6417e2e699890f51bcc0b772734a0431e5d2
[4/4] phy: qcom: qmp-pcie: Add QMP PCIe PHY support for Hawi
      commit: 9ef4e520912e4966081e276beda628b69aac85dd

Best regards,
-- 
~Vinod


