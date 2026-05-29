Received: from relay.smtp-ext.broadcom.com (lpdvsmtp10.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E900D3FD96F;
	Fri, 29 May 2026 18:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780077938; cv=none; b=GXQQO1h3FECnw4CDgXmVsXy+lfdNZzAv5P+bWsxzkjt9ljc8k9wr3smHm6IggNF21AVUs5iHD69LS8O+yoFb7jgJqsmrGAEDmbi3rdLR+AIcWIlB46rb4WyA99PM2IYChy1VidiutFU1HFpanWpuAipz7ADEVNptMuBNTvi/5iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780077938; c=relaxed/simple;
	bh=kVjEbFCep6psnJdNDaGa30uxymNBQQ05ldgukqBlb1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RHclG+851NQwe6lqAuULz8+CUoHqT84p5QRASYRjFTDio/kkwe0PpA2WA3dwFqPxRzS+4nA0U5+YB5vvRBBncU4pVxm6YJtSNH3SrrCXXNxE21lF+cPXE8Lzrf9ouvHLZ6IhLOFimbxk0Ot0yj9fAfpcT9s9FD3erw4REyGcLX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Ge8TzkMB; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Ge8TzkMB"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 1D1FFC003AC1;
	Fri, 29 May 2026 10:56:04 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 1D1FFC003AC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1780077364;
	bh=kVjEbFCep6psnJdNDaGa30uxymNBQQ05ldgukqBlb1s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ge8TzkMBztpgey37lHFstWjI22lwJcy4SRuTcbwbdQOKMJeI+ANKreKS0VXwd5Jvl
	 pj5x71WhIQgw5uJVa90XERlAaU3zOPFvTcvPGnEvgaAjRqpfr8UWH+xdsfu7lJPSmP
	 3Jfi2Rjn6qjEsiC9MwSBV+calpagVGxN+/cPlbis=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id A9773A9F;
	Fri, 29 May 2026 10:56:03 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Jinseok Kim <always.starving0@gmail.com>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm: dts: bcm2711: Fix typo in gpio-line-names
Date: Fri, 29 May 2026 10:56:03 -0700
Message-ID: <20260529175603.972759-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527103930.2973-1-always.starving0@gmail.com>
References: <20260527103930.2973-1-always.starving0@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Wed, 27 May 2026 19:39:26 +0900, Jinseok Kim <always.starving0@gmail.com> wrote:
> Replace "RGMIO_MDC" with "RGMII_MDC" in gpio-line-names.
> 
> Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
