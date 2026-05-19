Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F6137D130;
	Tue, 19 May 2026 06:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171013; cv=none; b=Ged4RHvBdGi4nYAzq0AEEVA5lweOT6mKWVosfISq5DlQ+6yoYnKpMy7viOIT9j3+9F3PGp7gMx7O+GJ9ADb88mZH5wbe3A7bDKjbw3bDha3JLq0LUyE159eq8NvJyUvtCfx6GNqD//XvAt304KK0EvD5HfzBw1PjIHNrFf90hxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171013; c=relaxed/simple;
	bh=q6rby7Z/QurVEf6glmO1A+Aax63NyuzVjNDSoZEKwlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L5r3HHxdBRweX23F/MF4cVK9KrwHTVHtNvw3WKYwL8OFPQCgo271xBEPN98rJSZDKs5RSE1FtXg+awvuIkSteZLXxae2FNU+iIWITx9RjWmNYSZutHeL1MTo4zWKA95ShjJOD+GhJ7pbEUO1J7Ek0lAXQvr+/pXXmgARTKmd+1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZlakL1TR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZlakL1TR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F71DC2BCB3;
	Tue, 19 May 2026 06:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171012;
	bh=q6rby7Z/QurVEf6glmO1A+Aax63NyuzVjNDSoZEKwlU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZlakL1TRjtjmwAPTsGC2Jrqq6V9vqNHo6bboiQh9aJgXjA+ETzrmpWG14ryyEjwfm
	 C6/ti4LXRp5HLsRiAldKYg3O5c1wCRScevLiTLcNMvq+YKPXnRp2o9at10mOxdgfcs
	 xfJBKOMEu/ojyywn1iXfxdrcnHdVy+nox9nz9+2QJLhULYv7JBmK321BBD7K32ydcx
	 bh9ph5rE5ZYSBDBVqgLJ9ntCDgMtcKmSV6jHmpk4JmB1nZNNQIbj5sNzB+2B8ypy7G
	 Ia8EqrSapZzDzvjUgWbbhnw2RZUM43Z/xJTqxOotYNVUc7XFm0tFy+dxuGl902aF4Y
	 12ggriEeDq8/A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] i3c: dw: Remove core reset "_rst" suffix
Date: Tue, 19 May 2026 13:51:02 +0800
Message-ID: <20260519055105.13079-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260519055105.13079-1-jszhang@kernel.org>
References: <20260519055105.13079-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's redundant. This suffix has been in the code from day1, fortunately
there's no such dt property usage in all dw i3c users after grepping all
dts files, so we can remove it.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/i3c/master/dw-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 655693a2187e..c4a848cc978a 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1587,7 +1587,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 		return PTR_ERR(master->pclk);
 
 	master->core_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
-										"core_rst");
+										"core");
 	if (IS_ERR(master->core_rst))
 		return PTR_ERR(master->core_rst);
 
-- 
2.53.0

