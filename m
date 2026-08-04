Received: from mail.zlab.su (mail.zlab.su [109.73.193.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2FE396579;
	Tue,  4 Aug 2026 09:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.193.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785834304; cv=none; b=bpnyRNYjy9hzAA4RYI8Hx/lVUIgCUw15uSgYN8eG37AfdwtCkuELoouFrpYQpPO+Af1sdzvM9qLMkGIPxbO9TcoKXujjz3XJQ0nOQSYLVW9FkCbtW0c/HYLPgemLJqcd3GsV6jgXPBm+LMvRX0FtF8JE5PJfp4fSx2vueNby+wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785834304; c=relaxed/simple;
	bh=7LGYalmhQwZrxOtGKmdSjC1WD7j0rRgBEPhRoGP+KSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=taC5qmk0VTlz8TGP2YhQ+z3gSDyTnzfjZ9jAV3/+nyKEB+silznUyjHMe4jt9/O/DDjHhh0JkUu8UF0+T7Chq3B3c6l6qvIa8JnSAPMjx8yL7JiLHC4aVx4ohhJibDRFVXpol94u27kfemvZogMe5G4JM1Qb/useDfe2V6kKK58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su; spf=pass smtp.mailfrom=zlab.su; dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b=XA+D7KGC; arc=none smtp.client-ip=109.73.193.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zlab.su
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b="XA+D7KGC"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7EF21BFAEB;
	Tue,  4 Aug 2026 11:39:14 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1785832766; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=7LGYalmhQwZrxOtGKmdSjC1WD7j0rRgBEPhRoGP+KSU=;
	b=XA+D7KGCymenwT0xyMUSjJEQPPERpnUrMdXzeklq/D4KURrG8s8Jixzmcs2Jvk7Vn8xXgR
	cQt+eV2EPMe5oIRfQD5jQqCBeJUXO4KHluGV62eRFvXPBewayj0KeSE+UOxgYwfufYlVNn
	KEmNM3RSaSxjp/HVnAJRDxBwCKAxBSNIwEa+chdiKERBy4VPmyNJ8fr+3fVdE/0EdL87fU
	80bJCYLBgg/D75n6RLRaf1fB48caXUq50Croscbl8I5LB7eSFNKs730GVx7hz7EjYvwENK
	d3v8Yb0+wU/9Z7ZamYCqowwsHhp83r09HkikMfRX9oagTKpcL4Dr0xxOu07Nxw==
From: Vladislav Leonov <vlad@zlab.su>
To: sjg@chromium.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	festevam@nabladev.com,
	heiko@sntech.de,
	hl@rock-chips.com,
	jeffy.chen@rock-chips.com,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	michael.riesch@collabora.com,
	robh@kernel.org,
	vkoul@kernel.org,
	ziyao@disroot.org,
	Vladislav Leonov <vlad@zlab.su>
Subject: Re: [PATCH v3 3/6] dt-bindings: soc: rockchip: grf: Add RV1106 compatibles
Date: Tue,  4 Aug 2026 11:38:56 +0300
Message-ID: <20260804083856.11447-1-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729133609.3465563-4-sjg@chromium.org>
References: <20260729133609.3465563-4-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Tested on custom PCB with RV1106G2.
Comparing with the V2 series, GPIO now works without any issues.

Regards,
Vladislav

Tested-by: Vladislav Leonov <vlad@zlab.su>
