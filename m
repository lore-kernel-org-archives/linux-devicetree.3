Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793531678;
	b=BTYcTEGL5MMruCt+kcUdHllQr9XjTW2TrJXWJf50fqD4JRd6GvedH4d+qmseCId3BI7Y
	 LBW85LbZN2PGZYLZf/JHWS8wxNDDlUn3ymRBpU5aWizj7pqVOj+ipj2J1iDyuMFXg3+79
	 vHr4hUleWj54K5QRCxatsI0LPTptI7vpeZnsJRHgi/Ze/Jgv/YfXdLubQG6H1Q0jy7X+b
	 C05r+34RMy/8ng3PGhDyKHSax3LmtGCC0vJYKxcs3J6cMfdppUVekOWH4u5FwhAitXBfu
	 rrM12Vhv+eTxDVPQpFKHcyPYJrHQo7mLtBcBCcU+vKv0kT1NK3PDd6hiNXxLFElefeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793531678;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=/oQHUhKqn5eQp3yIY2zRct0sepeY5dK7XRobzhwN+qE=;
	b=n8AtkMaqA0zt3W04DoFbgOlo6ilXT3cB8eVzddrR5JV279V76bh7+XBH+xNFtMRDeQpL
	 vhfrEmkFSkPnkuMMzEBeHNZJoT50znnARC0BgWLs/SgV5AoZVww0FuzE0hU3x3dxBNsn0
	 56LQvqYdMAJPe5PBEfvAziqMH71rKp8SDbmy/ax6yWvnYw1J5GimTKykRccJTyQ/baElw
	 ahPl2O7Jl3uY2D1/1wNUN1s2p5tXIl4AhddQrk3XKv+bVixlUog5Q1SZkvWdctPbtJtkM
	 JFcIfnM3+J0/YeBMmPIR/QZXKTLao8PLWXy00GPMOGtT0ZV9r3dsC46tSkMaiGVJ0NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c8AOBRHI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4B6606A324
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 11:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c8AOBRHI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50271F000C1;
	Sun,  1 Nov 2026 11:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793531677;
	bh=/oQHUhKqn5eQp3yIY2zRct0sepeY5dK7XRobzhwN+qE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=c8AOBRHI95zbbWRnGxzczWrXNtkUqVhRp7M9+ERH/EusyP/bwwtKZNCtPBHmgm7S6
	 2eklhdy33Sc48qLwbJGhlumF5+lnsoK6aczkGG2wps0XMymZS6c9G2plTCQ/RCKj+d
	 dNH2v0zf+Wgrb2mgDOFmqM+GWRrJ6HpzwxKC6/COBq5K2HDiJvPIW0mJx2eAf/JKep
	 4woTjwrQZrCCmRZ31cjW0wQm5aP/1I/kZTx3U+fnJcqs26zzRXjx/v04+vhxzxhWGF
	 ZjuYn1F1GuW2+kK9cANsCMDHTzWv7wRHzt1Mpr2jVLqWSxHSscIr6P/5yn6DU+9j9d
	 Veu47Gm1a+iAA==
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/2] phy: rockchip: snps-pcie3: Load updated PHY
 firmware on RK3568
From: Manivannan Sadhasivam <mani@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Vinod Koul <vkoul@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, 
 Samuel Holland <samuel@sholland.org>, Coia Prant <coiaprant@gmail.com>
In-Reply-To: <20261026074003.1169669-3-shawn.lin@rock-chips.com>
References: <20261026074003.1169669-1-shawn.lin@rock-chips.com>
 <20261026074003.1169669-3-shawn.lin@rock-chips.com>
Date: Sun, 01 Nov 2026 16:44:31 +0530
Message-Id: <179353167177.2955.5136050090949662870.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6933; i=mani@kernel.org;
 h=from:subject:message-id; bh=YLwhTn6zY6k4kfxPCGjJou8tWFFsXTkuFCVMxPYn9jA=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5x8ZayTKqaOaCCp5aOmP3eBH7roz8dXFh8i8m
 nH8/W0prwSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaucfGQAKCRBVnxHm/pHO
 9fLFB/9STZDwuas+EDZP1tqT5so4eHQrdSoCdrja16oyWDA/q9Utjcg6+/4J6UcmQb6k5pbcpOf
 WRmdh76jmcAnEYI/p3G7E/RoMjbryPn+JNOsz6tVqjsqkYf6pQrVEWcNme32TNFVXOpciNX36mQ
 OiTHtg9rcb3RIhD1nhH/Vf1WD++cUAjevzUi51JnID3ygIrxdYZWtgiE52zjGScotFEFu0QRgva
 rn0x71iRS/Q2l6+3i6xz6GDMH7PRqf4Jgv3gidVbWWMx5vHYuM82E+qmIkfrGbx7ntbVl7NPac6
 0jK/txyxdEAYmSkMKzOFR0y+kzVVX0xsybmqDKs2FmZwv/iU
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-26 15:40 +0800, Shawn Lin wrote:
> The RK3568 PCIe3 PHY can load an updated firmware into its internal
> SRAM during initialization. Without it the PHY may come up with a stale
> microcode and fail to establish a stable link.
> 
> Load the firmware named by the optional firmware-name DT property during
> probe, so that it is available in the phy_init() context and is not read
> from the filesystem on every init. During initialization, clear SDRAM
> load done and bypass, wait for the SRAM to lock, map the SRAM into the
> register window, write the firmware and finally signal SDRAM load done.
> 
> The firmware is optional: when firmware-name is absent (older DTBs) or
> the file cannot be loaded, the driver keeps the behaviour unchanged and
> uses the microcode already present in the PHY.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---
> Changes-in-v2: None
> 
>  .../phy/rockchip/phy-rockchip-snps-pcie3.c    | 101 +++++++++++++++++-
>  1 file changed, 99 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c b/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
> index ce7d8db2a7c5..bc1b4d0adaff 100644
> --- a/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
> +++ b/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/firmware.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
> @@ -19,11 +20,13 @@
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/units.h>
> +#include <linux/unaligned.h>
>  
>  #define RK_PCIE_SRAM_INIT_TIMEOUT_US		(20 * USEC_PER_MSEC)
>  
>  /* Register for RK3568 */
>  #define GRF_PCIE30PHY_CON1			0x4
> +#define GRF_PCIE30PHY_CON4			0x10
>  #define GRF_PCIE30PHY_CON6			0x18
>  #define GRF_PCIE30PHY_CON9			0x24
>  #define GRF_PCIE30PHY_DA_OCM			(BIT(15) | BIT(31))
> @@ -31,6 +34,11 @@
>  #define GRF_PCIE30PHY_WR_EN			(0xf << 16)
>  #define SRAM_INIT_DONE(reg)			(reg & BIT(14))
>  
> +#define GRF_PCIE30PHY_CON4_SDRAM_LD_DONE	BIT(14)
> +#define GRF_PCIE30PHY_CON4_SDRAM_BYPASS		BIT(13)
> +#define GRF_PCIE30PHY_CON9_SRAM_MAP		(0x3 << 8)
> +#define GRF_PCIE30PHY_CON9_SRAM_MAP_WE		(0x3 << 24)
> +
>  #define RK3568_BIFURCATION_LANE_0_1		BIT(0)
>  
>  /* Register for RK3588 */
> @@ -56,6 +64,7 @@ struct rockchip_p3phy_ops;
>  
>  struct rockchip_p3phy_priv {
>  	const struct rockchip_p3phy_ops *ops;
> +	struct device *dev;
>  	void __iomem *mmio;
>  	/* mode: RC, EP */
>  	int mode;
> @@ -70,6 +79,8 @@ struct rockchip_p3phy_priv {
>  	int num_lanes;
>  	u32 lanes[4];
>  	u32 rx_cmn_refclk_mode[4];
> +	const struct firmware *fw;
> +	const char *fw_name;
>  };
>  
>  struct rockchip_p3phy_ops {
> @@ -96,6 +107,34 @@ static int rockchip_p3phy_set_mode(struct phy *phy, enum phy_mode mode, int subm
>  	return 0;
>  }
>  
> +static void rockchip_p3phy_release_fw(void *data)
> +{
> +	struct rockchip_p3phy_priv *priv = data;
> +
> +	release_firmware(priv->fw);
> +	priv->fw = NULL;
> +}
> +
> +static void rockchip_p3phy_rk3568_load_fw(struct rockchip_p3phy_priv *priv)
> +{
> +	const struct firmware *fw = priv->fw;
> +	int i;
> +
> +	/* Map the PHY SRAM into the register window to write the firmware. */
> +	regmap_write(priv->phy_grf, GRF_PCIE30PHY_CON9,
> +		     GRF_PCIE30PHY_CON9_SRAM_MAP | GRF_PCIE30PHY_CON9_SRAM_MAP_WE);
> +
> +	for (i = 0; i < fw->size / sizeof(u16); i++)
> +		writel(get_unaligned_le16(fw->data + i * sizeof(u16)),
> +		       priv->mmio + (i << 2));
> +
> +	dev_dbg(priv->dev, "loaded PHY firmware %s, size %zu\n",
> +		priv->fw_name, fw->size);

Doesn't request_firmware() already print this debug log?

Check fw_log_firmware_info()

> +
> +	/* Unmap: field back to 0 with the write-enable for bits[9:8] */
> +	regmap_write(priv->phy_grf, GRF_PCIE30PHY_CON9, GRF_PCIE30PHY_CON9_SRAM_MAP_WE);
> +}
> +
>  static int rockchip_p3phy_rk3568_init(struct rockchip_p3phy_priv *priv)
>  {
>  	struct phy *phy = priv->phy;
> @@ -125,16 +164,41 @@ static int rockchip_p3phy_rk3568_init(struct rockchip_p3phy_priv *priv)
>  			     GRF_PCIE30PHY_WR_EN & ~RK3568_BIFURCATION_LANE_0_1);
>  	}
>  
> +	/* Clear SDRAM load done and bypass before loading the new firmware. */
> +	if (priv->fw) {
> +		regmap_write(priv->phy_grf, GRF_PCIE30PHY_CON4,
> +			     GRF_PCIE30PHY_CON4_SDRAM_LD_DONE << 16);
> +		regmap_write(priv->phy_grf, GRF_PCIE30PHY_CON4,
> +			     GRF_PCIE30PHY_CON4_SDRAM_BYPASS << 16);
> +	}
> +
>  	reset_control_deassert(priv->p30phy);
>  
>  	ret = regmap_read_poll_timeout(priv->phy_grf,
>  				       GRF_PCIE30PHY_STATUS0,
>  				       reg, SRAM_INIT_DONE(reg),
>  				       1000, RK_PCIE_SRAM_INIT_TIMEOUT_US);
> -	if (ret)
> +	if (ret) {
>  		dev_err(&priv->phy->dev, "%s: lock failed 0x%x, check input refclk and power supply\n",
>  		       __func__, reg);
> -	return ret;
> +		return ret;
> +	}
> +
> +	/*
> +	 * Load the updated PHY firmware into the internal SRAM and signal
> +	 * SDRAM load done once it has been written. The firmware update is
> +	 * optional: when no firmware-name is described in DT (older DTBs)
> +	 * the microcode already present in the PHY is used as-is.

Make use of 80 columns please.

> +	 */
> +	if (priv->fw) {
> +		rockchip_p3phy_rk3568_load_fw(priv);
> +
> +		regmap_write(priv->phy_grf, GRF_PCIE30PHY_CON4,
> +			     (GRF_PCIE30PHY_CON4_SDRAM_LD_DONE << 16) |
> +			     GRF_PCIE30PHY_CON4_SDRAM_LD_DONE);
> +	}
> +
> +	return 0;
>  }
>  
>  static const struct rockchip_p3phy_ops rk3568_ops = {
> @@ -250,12 +314,14 @@ static int rockchip_p3phy_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct rockchip_p3phy_priv *priv;
>  	struct device_node *np = dev->of_node;
> +	const char *fw_name;
>  	int ret;
>  
>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
>  
> +	priv->dev = dev;
>  	priv->mmio = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
>  	if (IS_ERR(priv->mmio)) {
>  		ret = PTR_ERR(priv->mmio);
> @@ -268,6 +334,37 @@ static int rockchip_p3phy_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> +	/*
> +	 * RK3568 can load an updated PHY firmware into its internal SRAM. The
> +	 * firmware file is named by the optional firmware-name property; when
> +	 * it is not described (older DTBs) or cannot be loaded, keep using the
> +	 * microcode already present in the PHY.
> +	 */
> +	if (priv->ops == &rk3568_ops && !of_property_read_string(np, "firmware-name",
> +								 &fw_name)) {
> +		ret = request_firmware(&priv->fw, fw_name, dev);
> +		if (ret) {
> +			dev_warn(dev, "PHY firmware %s not available: %d\n",
> +				 fw_name, ret);

Again, this is not needed.

- Mani


