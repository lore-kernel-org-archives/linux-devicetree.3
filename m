Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF4C36B900;
	Fri, 31 Jul 2026 03:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468294; cv=none; b=Jit/6RceVVzkD3pXfY5p8OKkVSW0PBIalxKr8vPGPr6ZNV2ZGOaMKE/jhLlbPjX49njvRY8gUiDmIu4WCo6QOZyrvcbPBfNjfZc6es/UpGKQLtp9tt0Iw42hy9Qzs0LCgLYtw+yxtHKxi0SujIHPZSD9obgPRexPo2IYIJmihCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468294; c=relaxed/simple;
	bh=Vex8BZS1XeGX/FY7V4ODr2JrTuM3lW+UUnqUgBSeYh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Iz7PQRRdF82Cg+MuFOvrd9Qwdvo+ZpZz5KxiO14rTaxO+47vDtSnZYrH/iWPqgdmkQ6OiAMpqIDBAKjOZMFetq8Hsre+2d2RGPNVkG8pbu+hjtjt1JrkEAYmuNYD+VQPXD2FRemRBI9X1o1+tQP8uwR8w18cY+J8GyXUqYvrkk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iCMN/Nhm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iCMN/Nhm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08431F000E9;
	Fri, 31 Jul 2026 03:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468292;
	bh=ba/uGYdp/U29tCBvD0kSf/f+GWEUFjo/mscpIRZFOb8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iCMN/Nhm1GDVsEAAiAgqUQUJs+vTLLDmopXsP1MNqQNfRs5tc5OOoKjhiWJE+GdWd
	 etlvSAjq9v4on0MpoSiy6nIpIXWtkxt2f/OnmgQ/lZfPX4tdbgggV9DjwefaHZp9jE
	 ES0eI8rySfq3VJeVDzhy+EN9keDKvBJVkK47pRIoHEDNJrAdsbsiwibUM9QwQRC7u7
	 lbIiQLoR1+mtKqxylbFUM+qx8HI9gi9J4GfTwDFuJMBBLV9WCIkUM0JHbLrLb6nWwz
	 hwhV5TE8Kg68q4QFhptBn7aROo8VjqLWYZvRxFTXDjxuk/nRz20Eq/DyllboA3OXDI
	 FgRAdRV4+6QFg==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 00/22] arm64: dts: qcom: Fix the PCIe iommu-map entries
Date: Thu, 30 Jul 2026 22:24:25 -0500
Message-ID: <178546826838.316815.16289800420599761224.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
References: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 Jul 2026 13:55:41 +0200, Manivannan Sadhasivam wrote:
> Several Qualcomm SoCs declare their IOMMU providers like apps_smmu and
> pcie_smmu, with '#iommu-cells = <2>', where the two cells are the SID
> and the SID mask. But the PCIe iommu-map entries on these SoCs specify
> only one output cell for the SID and omit the mask. This went unnoticed
> until the OF core started warning with commit
> ccb2fd725d41 ("of: Respect #{iommu,msi}-cells in maps"):
> 
> [...]

Applied, thanks!

[01/22] arm64: dts: qcom: kaanapali: Fix the PCIe iommu-map entries
        commit: 35eda0e5f87d52ed9f015f8a44155e8ab2ad9c5a
[02/22] arm64: dts: qcom: kodiak: Fix the PCIe iommu-map entries
        commit: 52dac5bda29a3acd896fab2567605683d34970db
[03/22] arm64: dts: qcom: sar2130p: Fix the PCIe iommu-map entries
        commit: f605087abc70ecac53757a7ae0d2d8068342ec4b
[04/22] arm64: dts: qcom: sc8180x: Fix the PCIe iommu-map entries
        commit: a4548204821a56c23cd711cfad2a637ca055ff47
[05/22] arm64: dts: qcom: sdm845: Fix the PCIe iommu-map entries
        commit: deaea7e982bc353c8d3c406774970f16ed901adb
[06/22] arm64: dts: qcom: sm8150: Fix the PCIe iommu-map entries
        commit: d2e56fb42e3d10d7e711063cdc00523ddb31d544
[07/22] arm64: dts: qcom: sm8250: Fix the PCIe iommu-map entries
        commit: c41749e9554d4e03e7074f5d1e46140bc4ac77bd
[08/22] arm64: dts: qcom: sm8350: Fix the PCIe iommu-map entries
        commit: 80337ea3a154230621c0b4e3c831f5d81712ba18
[09/22] arm64: dts: qcom: sm8450: Fix the PCIe iommu-map entries
        commit: 9b10e56647fa8f7ab62c7e45ebf4b168f7befa7f
[10/22] arm64: dts: qcom: sm8550: Fix the PCIe iommu-map entries
        commit: 16d98ee918d63018eaa6cc260791b71319aa4faa
[11/22] arm64: dts: qcom: sm8650: Fix the PCIe iommu-map entries
        commit: 8ccba7b44609d58db088447a771f6f30cfa8739e
[12/22] arm64: dts: qcom: sm8750: Fix the PCIe iommu-map entries
        commit: 366a540432a38c1c1533a319bc07b333f53752b6
[13/22] arm64: dts: qcom: talos: Fix the PCIe iommu-map entries
        commit: f7e687d6050f27a03847abadc12d6821576d06ee
[14/22] arm64: dts: qcom: lemans: Fix the PCIe iommu-map entries
        commit: 19b4c47fc9733a953e9586bc0906a3be378b4cd5
[15/22] arm64: dts: qcom: monaco: Fix the PCIe iommu-map entries
        commit: 2e455d9278550c8886a94e30a906437a26c79581
[16/22] arm64: dts: qcom: monaco-monza-som: Fix the PCIe iommu-map entries
        commit: d7ae79013e6c9b2374948d70856045cc84c9261d
[17/22] arm64: dts: qcom: monaco-evk-ifp-mezzanine: Fix the PCIe iommu-map entries
        commit: b35b58535b45441a4521d50215b5668731857c7d
[18/22] arm64: dts: qcom: lemans-evk-ifp-mezzanine: Fix the PCIe iommu-map entries
        commit: 6ee8ab6ca91dcea05793809df8a1dcfa94bcf3f0
[19/22] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Fix the PCIe iommu-map entries
        commit: 82a10eb6aeab412abd83a57cc3a605213d1dc1d5
[20/22] arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: Fix the PCIe iommu-map entries
        commit: fc3c550b3847636f6c0732dc6c94e879ab5ff578
[21/22] arm64: dts: qcom: qcs6490-rb3gen2: Fix the PCIe iommu-map entries
        commit: 485dc5e557a8fef1374669f4ebe027c947187325
[22/22] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Fix the PCIe iommu-map entries
        commit: 770d1448435bca2b1cd00854dc9401320b584d5b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
