Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D44768EA;
	Wed,  5 Aug 2026 03:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785900836; cv=none; b=Ilp8MaF+chN9qifDtWoYe9C/cYBBw5Myh/wzlhQkJog3NxBDD/aPHppqiDXbYGncrFIhUJkUdaVCGd8bki/FLHeTcU2u60nWsqLjmH3Od8zmOd46Ilrbss/ZBnZasmC5txNlWM0mxIVN0NjVC9XSxo0sqJ+QjxYBr9CNjzDUHjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785900836; c=relaxed/simple;
	bh=fh3b/2b0rrMsJL5kscDEq4SdTiQgLTh1wylVIjALeG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ucauJNt9LBOdkXGgXHxBzwbBBSXZiN7pVrB4IGVwVOMOMGmv+BeKAG5mlEBq1ofCLzYx03+z7V45yFiigxDNwuzl4ZHixypYYAcOEsomkYPhuMx5kuWivwj+K9debPyHQDrjbO5yECgnxA9yDRi/Cl0EfAZSzTFTV6PuEvpVyUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E1dOhSkL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E1dOhSkL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D011F000E9;
	Wed,  5 Aug 2026 03:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785900835;
	bh=IIY7hGfTr8dL3Jm+/wV6UGKdYfhCge7QW7NkNE4BCiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E1dOhSkLsotZNIOoHlRjULmuvL/t1n3OQn+X7/AoxeM/o1xUMTmMKiSX+QRyTKcq4
	 MtOnePONrudtzlY5YDlOnnFjPXPAEoYRdboAUeYwFMIBrpCTIwyn7dztRFPJ481nVq
	 S6EMymKfXnIsp30tLiX57V7uqnOnUhZC9C3Oi+w681ZMLZgxvCeNaIiQsIrveFnsvq
	 1RWQi2OIYhaY3Th7h6STPl4eBaY0yiJBNQIyOyEhOn42tfZ9Lvk31iDM63oAGOQuwU
	 kHAYh1+qTQ1QSD9RsjURDH21xywosDkzKfpvVBKzWMfEzvDXq4yucioc9bDLQyrb8H
	 gH6WCX4KDJSeg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 00/28] arm64: dts: qcom: Fix swapped QMP PHY vdda-phy/vdda-pll supplies
Date: Tue,  4 Aug 2026 22:33:51 -0500
Message-ID: <178590081581.458634.15171931800888861389.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 03 Aug 2026 08:33:58 +0200, Manivannan Sadhasivam wrote:
> The QMP PHY takes two analog supplies, vdda-phy and vdda-pll. By the
> hardware design, vdda-phy is the lower voltage rail (~0.8V) and vdda-pll
> is the higher voltage rail (~1.2V). This holds for every QMP PHY flavour
> (PCIe, UFS, DisplayPort and USB) on a given SoC.
> 
> A large number of Qualcomm ARM64 boards have these two supplies swapped
> for their USB QMP PHYs, feeding the ~1.2V rail to vdda-phy and the ~0.8V
> rail to vdda-pll. One board, sa8155p-adp, has the same swap on its UFS
> QMP PHY as well. The PCIe and DisplayPort QMP PHYs on the same SoCs are
> wired correctly, which confirms the intended assignment. The PHYs happen
> to work with the supplies swapped as there was no ordering requirement and
> both supplies get enabled anyway. So this was never noticed and got copied
> from board to board.
> 
> [...]

Applied, thanks!

[02/28] arm64: dts: qcom: sc8280xp-blackrock: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: ff7155df9a9543af1eb9722563e6dcda33c1a97d
[03/28] arm64: dts: qcom: sa8540p: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: 1960614611142e4b57f8a4e276f36ff8b6db2a1d
[04/28] arm64: dts: qcom: sdm845: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: ce18e4c1cfc77c2eda5f0b9839edac1b0e929c54
[05/28] arm64: dts: qcom: sdm850: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: ef7b567f54c72a91dec3fb0bd5d80b8e956f7cd8
[06/28] arm64: dts: qcom: sm8150: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: 3a0c5af9fb0e835e90c4f2439dc4534301be8856
[07/28] arm64: dts: qcom: sm8250: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: d57a10f2ebcf327bdecf8bb26e9f330b17b0b1a6
[08/28] arm64: dts: qcom: sm8350: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: 65cd57115c379ff0d0a200ad5a857afb8042a63c
[09/28] arm64: dts: qcom: sm8450: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: 6469731fb66f40ab873bf4c9fd97d295b390e87f
[10/28] arm64: dts: qcom: sm8550: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: f35723d6b6a2f6d6fc3cf2fc3ff556436f76ebd4
[11/28] arm64: dts: qcom: qcs8550-aim300: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: c0ea3b6339881c2a5fff0830557b1279d9681036
[12/28] arm64: dts: qcom: qcm6490: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: f6a787a5e238599f3543c3dccf0abd6030dd48e3
[13/28] arm64: dts: qcom: qcs6490: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: 83185fc5f51e7fa2d02f02e2504ad7b002c2d1d8
[14/28] arm64: dts: qcom: sm7225-fairphone-fp4: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: a3b3a060b696d964c769a7d9dc5835c79e4fe964
[15/28] arm64: dts: qcom: sc7180: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: 2c45c4df3079acba14920b14286cebfea24ec603
[16/28] arm64: dts: qcom: sc7280: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: b3038aac412d14538f135e6509e657997fd6825d
[17/28] arm64: dts: qcom: sc8180x: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: 8e1877c41c2ee4ad245e1c26c98f3b4cb2585162
[18/28] arm64: dts: qcom: hamoa: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: 4458dcd38295c8bd13957637ba98132ba3f089b0
[19/28] arm64: dts: qcom: purwa: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: 7c1d0ef2969e16a97bd03e8340f35a78c889120d
[20/28] arm64: dts: qcom: sm8650: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: 464fba94ac2e35b336e19c34336a07946da7128f
[21/28] arm64: dts: qcom: sm8750: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: 50c9658bc622888f9664a052fd98ef6026883ea5
[22/28] arm64: dts: qcom: sar2130p: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: 9d883d21fc12c873eee2f864f706c38a289bef59
[23/28] arm64: dts: qcom: kaanapali: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: c1dfdea72a9f59b1bdad64b8ec9f918b6c1a721f
[24/28] arm64: dts: qcom: glymur: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: c3c6b388edba50aad0d41b0b2a5e50482e320611
[25/28] arm64: dts: qcom: lemans: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: 932113c3c77814b4001ad37ea4383b93bc385284
[26/28] arm64: dts: qcom: eliza-mtp: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: 6b1195eeb204b455973fb05e10563a63bdd71c57
[27/28] arm64: dts: qcom: sa8155p-adp: Fix swapped USB and UFS QMP PHY vdda-phy/vdda-pll supplies
        commit: 3b50c16faa8452fd7ff021919c669c7b38227ca4
[28/28] arm64: dts: qcom: talos-evk: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
        commit: b426fedcef8c277574bd7beed0ae9d482c03605a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
