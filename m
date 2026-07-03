Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7943C37A9
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 11:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076663; cv=none; b=JN5qhgisHPW1Ct0Q8trtIIYaZ0CjThIf+uhxhY8Wdx6lEhus6LkfI6668uGB1MGSclVreFohJbSMbCd/KeJ2cc1i01Z/+4Fiq0h63F/PxC5E+GzQbyFgLpTFCx+8C3V6F9HLzCnc7H9Q/zPHkb3ZHvs1Ow0G0goC65hnaF3x7xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076663; c=relaxed/simple;
	bh=Lc67Zeaser87yY38PSmcUxCA/6lJ69+b9RUjeSaNZyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IfBEeup8xsd23PGlZl66qBS0pmBRZYcKDJ7fKfchDBT2rhEF6IB6Gd+avKkuUStPf7ql38J0WvQkr/fzgq96h8Y2sV6TGVezlGM+30udIl+HwjYFn/xQs9a+4U6ckCt+ZEeDWf3IrERuTPBQbQYJGMfQE+DiEqKiZE7YWocuYZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I8Zwvsby; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I8Zwvsby"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c9878bbe88so10404985ad.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 04:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076660; x=1783681460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRv90qFqU2a0K+pYyATTHQRQ7A0Z3yoLXaJNbxqKJ4c=;
        b=I8ZwvsbyWv3A0bs4Vqvux09WzEm/aMxBMmZQly8sPdjlqvH57tf4IL33B+cvTUrsa/
         7IqPhw0gznmvruexhfFiq3vcuvQ0r5OdWRfjl4kKmvbgWQU6f7xb9CCjm+0veGfnVszg
         CY5pUKeaiJ94UR3FTjTvRF/pc9jDn0TUNv5rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076660; x=1783681460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KRv90qFqU2a0K+pYyATTHQRQ7A0Z3yoLXaJNbxqKJ4c=;
        b=MwmUy191gu1ZL6Fi9JIRW8ngf+C/JEU3T9dxyQlmu1wRPwyvmM2gI78wZik7AO6BRW
         z8/84BSsd3czk4UgVhiScPFrgYD+/F98gboRFHAA5Yt4mOoKWwYwbkJWriePVBnb3VvR
         iE3rMoetmLpLef1m7V+p7QER6nggB50n1XXvT5FG6gttUNgXVTw8SHO8wo+6N/TPYGU3
         jarKf/EdrWzXSxsdTRiASny3MkQbogpobCpqU1xMmIck6fOK0em+umZI3+OYxvtWiRP9
         dtts1rBWEzIkvDFs3ZYV4ukwVRdJ0FyPAiCAabWAjSEOujwVJRs4M+HcSWshCyv81fZz
         EK1A==
X-Forwarded-Encrypted: i=1; AHgh+RrguE/Ra/kJVY+ypz/qfI+0ZeE8oC7QD931GEkeewxTLdtY2KtONaKBAWjQAy1DCDLRfWWOCM7QGRNX@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ0rg9S8LAY6qqpsnE1oiEiE9IICb4SBB6ccA9ufHMD/tgiBqQ
	SQYI/9T6SY70YwO3atvnSB6ApFc+fDWhb7A1GJHa8ATqjj4zugVhf57ZMTYHHKlXZg==
X-Gm-Gg: AfdE7cmL50YKGt3OwJ4WrRrJ4V02wiP/u0VWDddd30AxDzPUuqJMq52acsvwSXu4SbH
	79Lw2cWas+lpkX6VS1SQoqW5b1A5LMsmcLlBdw3JJMKMiGzd6O5E5eiTwHGWIcxnuoCl4rLIjmE
	1/WovJRCVrx2gVWc5gZsSHAJINp45cCxPTUbl/ibBY9gsK9W3fIO1ty4Gvyl6vAwzmReoRu8mll
	h4lJyh/glxtx5J0VHg+FyoJPV7YLvuBRaE2wocfagUtYDmNPN7N6OoExT94etOVUronMdx+m+fY
	iECtqPr1YQh17w1LCcNj8Ww+j2I3hjuG0YmR5jU2mAX4Rgl1rLevhaY9DO5gf1Uiv4ro5l64KbV
	yeANaDoSebRsDJXxr3EN+y5gPSaTh/MRfeaMN0HzXrysEdXBq9zOtZSEHr4553i49c9FztacVwn
	Jn5dOdMgAfnYM1nucUXGG/4QZRPb+tbqYfsJyuL4HvovZZnUv9kifrjlTQ1qZLeZjnnO5O57lVz
	K74JOf8
X-Received: by 2002:a17:902:d4c3:b0:2c9:d584:49bc with SMTP id d9443c01a7336-2cacaa911b2mr39932695ad.3.1783076659705;
        Fri, 03 Jul 2026 04:04:19 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:04:19 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 10/13] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Fri,  3 Jul 2026 19:03:11 +0800
Message-ID: <20260703110317.1283411-11-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A USB hub can have multiple ports, and this driver needs to
differentiate which port is being matched to. The USB hub driver now
associates the "port" node with the usb_port device, so here we can
use the remote "port" node to check for a match. Then fall back to
the remote device node for the other connection types.

Also rewrite the existing "remote == dev_of_node(dev)" with
device_match_of_node() for consistency.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Use device_match_of_node()
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index c8ee6df42b81..16a47f76e7ce 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -175,9 +175,18 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 	 * parent matches the OF node of 'dev'.
 	 */
 	for_each_endpoint_of_node(ctx->of_node, endpoint) {
+		/* USB port devices are tied to the port nodes. */
+		struct device_node *remote_port __free(device_node) =
+				of_graph_get_remote_port(endpoint);
+
+		if (remote_port && device_match_of_node(dev, remote_port))
+			return PWRSEQ_MATCH_OK;
+
+		/* Try the remote port parent for other types. */
 		struct device_node *remote __free(device_node) =
 				of_graph_get_remote_port_parent(endpoint);
-		if (remote && (remote == dev_of_node(dev)))
+
+		if (remote && device_match_of_node(dev, remote))
 			return PWRSEQ_MATCH_OK;
 	}
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog

