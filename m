Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50F33630B7
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283482; cv=none; b=CIYrevU8uqxf5YIF2s/j35JfxnL4OXalHslinp2oneN2mII22+DcSkdNJ12BdCQBPe8tKhlO9ydhtb8b3y+iT37/9a+igqsO2pCu58Dzn32YL5LonlWtRAxWwzeqSMk7MI7XshJrpoaQdsAx4ZmQVWwg7BX2lMKY9qAJpTSPiOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283482; c=relaxed/simple;
	bh=8EFFZFKDLlmHSOZPUE2j79AeUscpnwAnXV/yy2Q87SI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r3qyHt2okD9CEKAmCskTxRnsGv0A8mcFzWuqBgGxS9qw6pztcQtg0evqBtVOV1eFhdC9fdvvXD8Me14LJq6PCd7VO4Yc0Wq95jZySZb+4OOgVifx8NthjGmoMy3F+wxB8429db+b3TbY1eMc8aDxQwk/+Ir7pBxMX8xL9+70+EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qv8IJct/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qv8IJct/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20366C2BCB0;
	Fri,  8 May 2026 23:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778283482;
	bh=8EFFZFKDLlmHSOZPUE2j79AeUscpnwAnXV/yy2Q87SI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Qv8IJct/DG5TaaB7QOrfOK/hJUpfNjVFmU2W9YI/F+3TSGjAq9y4z0FYfkZKT2RhS
	 qVuqj2LXdDNi7DkSWsUStS6BbGjrgLlXRXKKI1v4TYaxrZY5R8CCQJ3HOBpFpCy+6X
	 ePxSJ9Ztp8W7U/qL6utzi8YnQVgZ+CWxzG94Kmz4GCyWUhLRuWINh9Or5EZtm5Pq0j
	 vj7AwKQ0iuM8o+bbpd5GBbs5OfOO8ZTEzupP81xVffkm/tVFNtg2Z2cYaK8GUTe069
	 RMvWWDDzKFkcG5LzAq723dIUv6TkGZIC64zhXnTY6TrEAp2lPIMy+/ACD8FU3tbDUf
	 2aSz+B7y+NHIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/10] phy: qcom-qmp: pcs-pcie: Add v10.60 register
 offsets
Reply-To: sashiko@lists.linux.dev
To: "Matthew Leung" <matthew.leung@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260508-hawi-phy-pcie-v1-9-237b894353fc@oss.qualcomm.com>
References: <20260508-hawi-phy-pcie-v1-9-237b894353fc@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 23:38:01 +0000
Message-Id: <20260508233802.20366C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The macro `QPHY_PCIE_V10_60_PCS_PCS_TX_RX_CONFIG` contains a redund=
ant `PCS_` substring.
--

commit fa9d92bd2f41dd643566d490312c4a18a8a68214
Author: Matthew Leung <matthew.leung@oss.qualcomm.com>

phy: qcom-qmp: pcs-pcie: Add v10.60 register offsets

This commit adds a new header file containing the specific PCS PCIe register
offsets for the QMP phy version v10.60 used in Hawi SoCs.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h b/driver=
s/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h
> new file mode 100644
> index 0000000000000..e4a2bdc7c3f03
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h
> @@ -0,0 +1,26 @@
[ ... ]
> +#ifndef QCOM_PHY_QMP_PCS_PCIE_V10_60_H_
> +#define QCOM_PHY_QMP_PCS_PCIE_V10_60_H_
> +
> +/* Only for QMP V10_60 PHY - PCIE PCS registers */
> +#define QPHY_PCIE_V10_60_PCS_POWER_STATE_CONFIG2		0x00c
> +#define QPHY_PCIE_V10_60_PCS_PCS_TX_RX_CONFIG			0x018

This isn't a bug, but there is a redundant "PCS_" substring in
QPHY_PCIE_V10_60_PCS_PCS_TX_RX_CONFIG.

Should this be named QPHY_PCIE_V10_60_PCS_TX_RX_CONFIG to remain consistent
with older PHY version headers like QPHY_PCIE_V8_PCS_TX_RX_CONFIG?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-hawi-phy-p=
cie-v1-0-237b894353fc@oss.qualcomm.com?part=3D9
