Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E772D9EFF
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787234770; cv=none; b=mtYio1haVjAFAlWXCpRfjjRzgkbAGrK/KeYe3FF/mdf/eHqvVZR6hpyPY1OD1k0NVaHUjuYnRXfj6T+nAKjiYiiVhqWkP2JtLN+CU5h3skMVSsz8YG6x+222oX3A8gScQqHyNAuGvIHklt2DSMqKkDCApovKZaUxlGhu8XXg724=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787234770; c=relaxed/simple;
	bh=4VcLySiLNrs2HXanq3NZ/9gYTI3Tejy+OvNDIdy0xSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qvjWHHDZ/WFrDNCTMIf1vsbIBsoiTQzwe9oTS777sJxRDEDK7aY2Y8OMoTEm9jJzETKGXqfFSRYVMJBdVxSa4buCOI1z22/nbT+dGxJl/Dz4b+OZKQeU/3fw8v2xpefcEFXPXqgGgJbcd9EEGmm9iMOZ7QXfzUriKTynUIgRGro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=jEOB9YTn; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="jEOB9YTn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-2eefaa527c;
 t=1787234768; bh=X1cEzBJvBztMxBKiQQCNaB02Q/HGS+t/XW8M/wtGoQ8=;
 b=jEOB9YTn31nrXW9MHrrVTWLwwZcv/yHiR2X9CVO4AwTh9Sf+FUVISYnrsPFpNa1o9gjQcdJo0
 rHwk+Wm2ayoITmPub8VXV4rb62QSZwoJeO/Mh149LAFSqsESOoY7S/8zzkIpidPkn+yVtp6XcJs
 F363FWGIdzbFzb34otOij0M=
X-Forward-Email-ID: 6a870985d69df34e1c49334b
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 149.28.215.223
X-Forward-Email-Version: 2.13.16
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: semen.protsenko@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Turner <tturner@lineageos.org>
Subject: [PATCH 0/2] Exynos850 GPU support
Date: Thu, 20 Aug 2026 15:04:37 +0100
Message-ID: <20260820140439.83220-1-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260820110620.1881-1-tturner@lineageos.org>
References: <20260820110620.1881-1-tturner@lineageos.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,
This is my first time sending patches to linux so apologies for
mistakes. This series provides basic GPU support to the Exynos850
platform, making use of the Mali G52 GPU through the panfrost driver.

Thomas Turner (2):
  dt-bindings: gpu: arm,mali-bifrost: add exynos850-mali compatible
  arm64: dts: exynos850: Add GPU/Mali Bifrost node

 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml    |  1 +
 arch/arm64/boot/dts/exynos/exynos850.dtsi            | 12 ++++++++++++
 2 files changed, 13 insertions(+)

-- 
2.47.3

