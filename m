Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919B63FD139;
	Thu, 18 Jun 2026 15:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781796103; cv=none; b=ASanymzg+ULsS68x0XK45dmSUXqxdlhF5UXA2watnKgls+5ySB5covPBUXTxo/khsaYGb1lKVDVeNmOfoI7FJXEnfFtrm4ZnBWieyuiLNn5TYB03ZS+PVXGAqZrs4CCpqLnouicJjvM01xjTt/MsVSQCIEyMfW4aD2Yoow0e+kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781796103; c=relaxed/simple;
	bh=t45MIEkRQOfK4hGcKkVdoLowN/bGQEo8SwrJII5tK28=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BQrG1cYBuQ6raWyRH1vTJJDLFcuPe/YqZfKKh98clKlMSW1pohJmRUiymNUN6w8xhkpv2/TjxsZRHvtssN+ixAlyvZLApznj98+3++ie8k9r2h9/UlAaAHgN7jBR4I4BGtINBvd8D+uWDN9Z4YwdDDQ7t+NtQX8Lk7Jywp0Ypvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from albans-vm.. (unknown [94.134.109.237])
	(Authenticated sender: albeu@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 0C9F3780502;
	Thu, 18 Jun 2026 17:21:14 +0200 (CEST)
From: Alban Bedel <alban.bedel@lht.dlh.de>
To: driver-core@lists.linux.dev,
	devicetree@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Zijun Hu <zijun.hu@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	Alban Bedel <alban.bedel@lht.dlh.de>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] of: property: Fix of_fwnode_get_reference_args() with negative index
Date: Thu, 18 Jun 2026 17:20:34 +0200
Message-Id: <20260618152035.1600436-1-alban.bedel@lht.dlh.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fwnode_property_get_reference_args() should return -ENOENT when an out
of bound index is passed. An issue arised with the OF backend because
the OF API use signed indexes while the fwnode API use unsigned ones.
When an index value greater the INT_MAX was passed to the OF backend
it got casted to a negative value and it returned -EINVAL instead of
-ENOENT. This patch add a check to of_fwnode_get_reference_args() to
catch negative index before they are passed to the OF API and return
-ENOENT right away.

This issue appeared when the following pattern was used in the LED
subsystem:

    index = fwnode_property_match_string(fwnode, "led-names", name)
    led_node = fwnode_find_reference(fwnode, "leds", index);

Unlike the same pattern with the OF API, this pattern implicitly cast
the signed return value of fwnode_property_match_string() to an
unsigned index leading to the above issue with the OF backend. It can
be argued that the return value of fwnode_property_match_string()
should be checked separately, but I think there is value in supporting
such simple and straight to the point patterns.

Link: https://lore.kernel.org/linux-leds/aimVRwJPhlGxsIUj@tom-desktop/T/#mc43cbf7e0599991b56dd0d9680714d28d145fbc8
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
---
v2: Fixed comment block to follow linux coding style.
---
 drivers/of/property.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 136946f8b746f..a4e9ffe1a4121 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1157,6 +1157,14 @@ of_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 	unsigned int i;
 	int ret;
 
+	/*
+	 * This function should return -ENOENT for out of bound indexes,
+	 * but the OF API uses signed indexes and consider negative indexes
+	 * as invalid. Catch them here to correctly implement the fwnode API.
+	 */
+	if ((int)index < 0)
+		return -ENOENT;
+
 	if (nargs_prop)
 		ret = of_parse_phandle_with_args(to_of_node(fwnode), prop,
 						 nargs_prop, index, &of_args);
-- 
2.39.5

