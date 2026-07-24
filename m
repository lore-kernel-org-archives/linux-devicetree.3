Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63020438494;
	Fri, 24 Jul 2026 13:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784901230; cv=none; b=h8l8i+LE94uK+OE2GjadN6kOEAFRj7V25hBr7Ki7e1bWD/s5dG1reBElKeoSDd6gR2TPWsCzR32Isej6fyUE/yrCchMaj1VUYTFVPH6kTvUPSR06AYlCP6yMcbYTvh+0goNe2O/RApET47kZtqRRQyQWYcP0JWBo/y5ezMuj6I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784901230; c=relaxed/simple;
	bh=l/m9/rzr8GHaHw1sZHXfdIdZDZ9HIusy/M7QUjve/24=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BkQpv54EswxzBVNIWovrFRoJsYH3FPD3AIcCOe2iZ/m5VwsJFwXhZOF/Pe4A2Z4tQYPjp/fux8ALB+DK3Usv7WF83HBW+rXLpYFelMgICpCkC+tNq4XjFUkdWqylmQVt+erkHGKnAI5OXlPd+1EfMoP+b3coP81+28O++kwJd2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hho9MH2U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hho9MH2U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F4E1F000E9;
	Fri, 24 Jul 2026 13:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784901219;
	bh=1xJc4tf9wgQ/3dEns3BWeKyJ2jmK21p2ryW65vOwSYY=;
	h=From:Subject:Date:To:Cc;
	b=Hho9MH2U3KOp8JF7s5erG7iWT+G86prKNIHRE6XZN9s9JBhj4beNFZeKId8P80D3s
	 yECR83SWqi7ytUFsOuwg/TCy5Jup/8Xql36TYQd3bHmEeMW3S8ZrMzTPPLKfIpN6WS
	 P2B8OKtWNiLdxhqyZjRlRoSPMhxhtCCBgDu+IGiZ5DBDEd2VKoKr9jCldlmYPmU3rC
	 EcPoFTkNg1KtT6aLPIFX8p/m1REh0tLacH9hUYo8fEO/7DNBEgWI5xonfuK2KbOT34
	 HJcfd2l0fGGPi9Ytqr3VUtq4UsugG2HPoIOPIm/ssqX0HfsjINv5OpOs6Z/zdh2nLN
	 Pc6Gn22ju9Bww==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: [PATCH v4 0/2] Add support for SA8255P in the qcom-qmp-usb phy
 driver
Date: Fri, 24 Jul 2026 15:53:25 +0200
Message-Id: <20260724-phy-qcom-qmp-usb-8255-v4-0-a90014fab476@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XPTQ6CMBAF4KuYrh1TB0qnrryHcUHLKPUHsFWiM
 dzdohuNMS5f8uZ7mbuIHDxHsZjcReDeR982KeTTiXB12WwZfJWyQImF1JKgq29wcu0RTscOLtE
 CoVJgDBVGaldZZ0S67QJv/PXprtavHC92x+48YmOj9vHchttzuJ+PvX8b/RwkUEUKS6MyVdnln
 kPDh1kbtmIc6fGdMb8YTExmC4dFmStN9MVkbwziLyZLDGtKX0ub00Z/MMMwPADjUzQzWwEAAA=
 =
X-Change-ID: 20260708-phy-qcom-qmp-usb-8255-9986907cdbc9
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Sriram Dash <quic_sriramd@quicinc.com>, 
 Shazad Hussain <quic_shazhuss@quicinc.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3347;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=l/m9/rzr8GHaHw1sZHXfdIdZDZ9HIusy/M7QUjve/24=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBqY25gy/TIe+hthKSOUDUl/yl9pXgqXkQfclB5j
 xnP5cb4ljWJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCamNuYAAKCRAZDR20Zk4Z
 NYCWB/9Y/MyZhWY61MiiHmUte46W6poVCoumCvKxK3Qdk8giMxBuys/Vspo0fhZy6tdre4Y5zgE
 mhMU+tkoSTJi+T+FHOZ0XdZR3s+BNBbJDq1wJ6IiaHcH9f3l9GFxYvyHY28bJNkD0xvO9UhTMpJ
 10rtGJwEcrB8Wp2Zd5P6GfYfNTb8vq1rUdkxvdglgb5CGWdlwX4S94w9IsNUJZpUc1XfRUWOxF8
 xlURKAvUv5nqUznKB2lVtuNPtaUto8ijwIX3ycSSvvB1tH9K8zfgoozyEEP0fNU3lGzSb+DabbV
 Q3RqJtm3ZRob+vfZkVakSgNB8D3QOPhMJb5X84seQlYQDj40
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power on/off.

Power domain "core" controls the GDSC, resets, and TLMM (GPIOs)
whereas power domain "transfer" controls clocks and interconnects.

Patch 1 adds the binding for sa8255p. Similarly to what has been done
for I2C [1], this is a separate binding.

Patch 2 adds the driver change, which is based on a public vendor
patch from qualcomm [2].
I did the following changes on top of that:
* Use devm_add_action_or_reset() for dev_pm_domain_detach_list() instead
  of implementing a driver .remove()
* Drop the .lanes struct member since it no longer exists.
* Re-order some functions

This has been tested on next-20260706 with a Ride4 SA8775P board that
has SCMI firmware (which is compatible).

[1] https://lore.kernel.org/all/20260617-enable-i2c-on-sa8255p-v7-1-ad736dbeab57@oss.qualcomm.com/
[2] https://git.codelinaro.org/clo/le/meta-qti-auto-kernel/-/blob/LY.AU.0.1.0.r1-16800-gen4meta.0/recipes-kernel/linux/files/usb/0011-PENDING-phy-qcom-qmp-usb-Add-support-for-SA8255P.patch

Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
Changes in v4:
* bindings: Use additionalProperties: instead of unevaluatedProperties:
  (Krzysztof)
- Link to v3: https://patch.msgid.link/20260722-phy-qcom-qmp-usb-8255-v3-0-e789070b48f7@kernel.org

Changes in v3:
* Binding changes:
  * Use a separate binding file (Krzysztof)
  * Remove 'usb_' prefix from power-domain-names (Krzysztof)
* Driver changes:
  * Remove 'usb_' prefix from power-domain-names
  * Moved sa8255p_usb3_uniphy_cfg before sa8775p_usb3_uniphy_cfg
* Link to v2: https://patch.msgid.link/20260709-phy-qcom-qmp-usb-8255-v2-0-3b6c26a45788@kernel.org

Changes in v2:
* Driver changes:
  * Fix comment typo tranfer -> transfer
  * Fix print statement to add a missing '(' in the string
  * Use dev_err_probe() in qmp_usb_domain_attach() to reduce log noise
  * Fix pm_runtime_put_sync() order in qmp_usb_d0_to_d3 (Sashiko)
  * Fix runtime PM reference leak on usb_transfer (Sashiko)
  * Fix runtime PM reference leak on error in qmp_usb_init (Sashiko)
  * Reorder qmp_usb_d0_to_d3() to mirror init ordering in qmp_usb_exit()
    (Sashiko)
  * Reorder qmp_usb_d0_to_d3() to mirror resume ordering in
    qmp_usb_runtime_suspend() (Sashiko)
  * Fix error handling in qmp_usb_runtime_resume() (Sashiko)
* Link to v1: https://patch.msgid.link/20260708-phy-qcom-qmp-usb-8255-v1-0-8d852a9535db@kernel.org

---
Mattijs Korpershoek (1):
      dt-bindings: phy: Add sa8255p USB PHY

Sriram Dash (1):
      phy: qcom: qmp-usb: Add support for SA8255P

 .../phy/qcom,sa8255p-qmp-usb3-uni-phy.yaml         |  52 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            | 182 ++++++++++++++++++---
 2 files changed, 212 insertions(+), 22 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260708-phy-qcom-qmp-usb-8255-9986907cdbc9

Best regards,
--  
Mattijs Korpershoek <mkorpershoek@kernel.org>

