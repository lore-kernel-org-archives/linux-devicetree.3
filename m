Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182980;
	b=PSJITi+GX7iLnAxyNqlgZKAKEHoV+KH/4DO+QyETCMxgTNGUA/IplPQW/qjTQmK0LToQ
	 Kpyrt9sNFZtOaOxpaR7ASGcaHDU7w9qR9VIKbzv9b1yZtxfD0JlMooSBJ/O9/hwjQ0Zuv
	 9MJNmQl3ES46I3P48SDbmFxh+zwSHNCwlNWSl8WB3O4TvUYMjh9XQgr+KuqWbCifCq9wz
	 /+EFvTrjrs+SuuxFSGC/1n8NQHZIBYTP0CEKGGFtNwbawhfGM8KHssq9M5PBq9B1Zof21
	 EReJ1w3hj9DnrG81HPuORxeT1aMJ66GXorbNOXb77SgGWw2R/u5ZbQDHhZ+Up/WBEsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182980;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=zF42Mi5y8Ib0X4sHCH0GaZJRw3qLxhz9wgJMlHfgL9E=;
	b=FeFSn2zL+14k1F1zJp9feUIm2cJfzsrD0NFLmJxqrR1aCV4S22bLigpaXmquujdPgMqK
	 aP1mA7hCe08qhMqttK54invqJ+i4hgfStvydOlzdTj0WDKQg9UPXqhXSYQ52tSSJNfZpp
	 9qBuzh5roUgfqFrvKW5EoBdiDiQoZ6PxaG45BwkkJjzT23C3B7RIkgoxBSqE9T+TXtOoe
	 jajqIV7g3oEIXs+ytEuFCC1+cAOyrujmFs82kh4EznEIutTMR8xepRkBEpVCbNrGVlNC0
	 Z41ajUf7pM4RcukLFYzCtYcBYtHKrNCeHzUWmCqlyaCA81AgDPOoIEgRc08t0H1jBBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mmByupct;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC61860A380F;
	Fri, 20 Nov 2026 13:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mmByupct
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A0A1F00ACF;
	Fri, 20 Nov 2026 13:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795182979;
	bh=zF42Mi5y8Ib0X4sHCH0GaZJRw3qLxhz9wgJMlHfgL9E=;
	h=From:Subject:Date:To:Cc;
	b=mmByupctFo9HTSIllwteEG9JbCq5ZTKBNwT/RVCi5r6LltM42qjnk1hFVvM9qZapB
	 zzyXVf/pk70xWbkMs2WZi8/KbXvxZZXeefgKbumN6SqOP/lqaeC8xbLDr+b2XAUEqy
	 /xUc57cJJCOfFT9BKhcuKtVWWJdH36W06LH8eIEMFeyozeK2MZGQvjoyBj4Eq5XXpZ
	 ZQDJT+KQPv+NMQtBPkL9Prj97QgEgO/H55AloW2CaaWmceVJbVR6wBqYaOv9/t/Hki
	 ySnJdJ8kzNtZb0K0zqLn98KB4r1JoVHIREYfSgXclgJpC90oGVtiydIvJb9rVCmPKm
	 xH0yFxvJ6KwsQ==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: [PATCH v5 0/2] Add support for SA8255P in the
 phy-qcom-snps-femto-v2 phy driver
Date: Fri, 20 Nov 2026 14:56:03 +0100
Message-Id: <20261120-phy-qcom-snps-femto-v2-8255-v5-0-86a9880ee5a5@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33Qy2rDMBAF0F8JWneKNHrYzqr/EbKw7FGstrFcy
 RUNwf9eOS19EPDywuVcZq4sUfSU2H53ZZGyTz6MJeiHHeuGdjwR+L5khhwNr7CBabjAWxfOkMY
 pgaPzHCAj1Kg1NNw5qkylOBesCFMk5z9u+uH4ldO7faZuXsm1Mfg0h3i5zWex9r6XJN9cygI41
 La2TguuW1M/vVAc6fUxxBNbpzL+YrUU2xgWrO+MaCrnehL2DpM/mOActzFZMKlQK7R9Yztzh6k
 /GFbbmFrPLP9EWXJr5D9sWZZPJeEkWMABAAA=
X-Change-ID: 20260729-phy-qcom-snps-femto-v2-8255-90ffe7674001
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Sriram Dash <quic_sriramd@quicinc.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4187;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=jZrp9wHdk2cj+vXmr5WjanzvROeJV+DE0ZhEYl72FmA=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBrAFGA10fCOQaYHF42xNAxYqyPZpKSbWpcDkaC1
 PGFnPe9sweJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCawBRgAAKCRAZDR20Zk4Z
 NfptCACDIi2reevB1Uv+IEOMSOlQvy2z2QugJbB7Oj1lnMbiruEE055T8QlNxcf4xewYHAajdKI
 +9nxGADlW5obBWyto7vxXUl8IKdloQG5Vt2tUQseDCQEf1G3wLiGOYbDDHrB4H9Pc2Jl2YaYLq+
 QGM3dKThQsOZ1lQggQqsyqaN8lzje0Kiqe/8e9AwOA2b/6iEjOB/JQz/EikLSP/pkbCsvraZG3Q
 HjgKbIimI1rUBstodaATYj4q9q5IACtI9NuzcN8Jg8tvd/ILr+pTaO/88aqIFGHa3ARjLR/zDZ8
 Mkbu7Ul4kVzYlvrCDyyk+YKQqLjf+Eydc0hHub+e5P6To4NB
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

The Qualcomm automotive SA8255p SoC abstracts resources such as resets,
clocks and regulators in firmware. The SCMI firmware exposes multiple
protocols to control such resources which are identified by protocol_id.

For this USB phy, 2 SCMI protocols are exposed by the firmware:
* power domain management protocol (protocol_id=0x11)
* performance domain management protocol (protocol_id=0x13)

The power domain has 2 indices: 'core' and 'transfer'.
* core controls the regulators, the clocks and the reset
* transfer only controls the clocks

For example, to power on/off the PHY, we should use the 'core' domain.
To disable data transfer and keeping power enabled, we should use the
'transfer' domain.

Note: the performance domain (0x13) exposes opaques values (0xa to 0x11)
for which we don't have any information. Since it is not mandatory
for the PHY to be functional, we have omitted it from the bindings and
the driver.

Patch 1 adds the binding for sa8255p. Similarly to what has been done
for I2C [1], this is a separate binding.

Patch 2 adds the driver change, which is based on a public vendor
patch from qualcomm [2].
I did the following changes on top of that:
* Use devm_add_action_or_reset() for dev_pm_domain_detach_list() instead
  of implementing a driver .remove()
* Changed power domain names to drop 'usb_' prefix
* Fixed various error handling paths
* Added suspend/resume support

This has been tested on next-20261026 with a Ride4 SA8775P board that
has SCMI firmware (which is compatible).

[1] https://lore.kernel.org/all/20260617-enable-i2c-on-sa8255p-v7-1-ad736dbeab57@oss.qualcomm.com/
[2] https://git.codelinaro.org/clo/le/meta-qti-auto-kernel/-/blob/LY.AU.0.1.0.r1-16800-gen4meta.0/recipes-kernel/linux/files/usb/0014-PENDING-phy-qcom-snps-femto-v2-Add-support-for-SA825.patch

---
Changes in v5:
- Rebased on phy/next (non trivial conflicts due to IPQ9650 changes)
- Moved fw_managed to phy_config_data
- I have kept Mani's R-b on this since the patch still has similar
  changes to v4.
- Link to v4: https://patch.msgid.link/20261027-phy-qcom-snps-femto-v2-8255-v4-0-874023825a63@kernel.org

Changes in v4:
- Don't control regulator, clk and reset in SCMI path (Mani)
- Rename helper functions to qcom_snps_pds_{enable,disable}_all and
  qcom_snps_pd_{enable,disable}_transfer (Mani)
- Add some more helper functions to keep probe() cleaner.
- Dropped Neil's R-b due to the above driver changes
- Link to v3: https://lore.kernel.org/r/20261002-phy-qcom-snps-femto-v2-8255-v3-0-342542bd9bc6@kernel.org

Changes in v3:
- Applied R-b from Krzysztof and Neil
- Link to v2: https://patch.msgid.link/20260831-phy-qcom-snps-femto-v2-8255-v2-0-dc6197ffde1b@kernel.org

Changes in v2:
- Move 'core' as first domain, before 'transfer' (Krzysztof)
- Reworded binding commit message to be more precise about the various
  domains ('core', 'transfer' and 'perf') (Krzysztof)
- Link to v1: https://patch.msgid.link/20260730-phy-qcom-snps-femto-v2-8255-v1-0-8b8bf5105a68@kernel.org

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Mattijs Korpershoek (1):
      dt-bindings: phy: Add sa8255p high-speed USB PHY

Sriram Dash (1):
      phy: qcom-snps-femto-v2: Add support for SA8255P

 .../bindings/phy/qcom,sa8255p-usb-hs-phy.yaml      |  52 ++++
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c      | 261 +++++++++++++++++----
 2 files changed, 270 insertions(+), 43 deletions(-)
---
base-commit: 6bdfbe223ed4735073c299a6645ebd3faac3f51f
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git next
change-id: 20260729-phy-qcom-snps-femto-v2-8255-90ffe7674001

Best regards,
--  
Mattijs Korpershoek <mkorpershoek@kernel.org>

