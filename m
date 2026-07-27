Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A762D422E2A;
	Mon, 27 Jul 2026 16:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785169928; cv=none; b=GrDNKrDnJeO6UIEkO5kHW1W4L1JiKhOzdcbspLWuXJxp3svH1dlypt0mKn8Vh2uh+j7jFOKwaI/RjGlueg4dUkMHV40G1LcAcDHw2I5+eccLxU2pLY5LkY7Euhz0AXd/cO4MbaAmIYOnAO5jkwh5WIAGLJJraPi+IhsaYfeApts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785169928; c=relaxed/simple;
	bh=2/RO3nDJR9AMWgwvPqAnyU3swl7joPnEBTu6AxeDEAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ianTBst2Nj8ryCC3KQOHaqtfSJPcgEiK8dd74pwMnYwSJMIFpU+xax5eIWRaFrX35tco3JGpF1fr2o4No02EBNFvhMwyLs/cDfqkohGtDZM+uaTLX2Jr4+XrJt0r0B4QjQI9d5CnW/IirkqG0x1lfkAhh7aKxxr4YMFLineB4RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=QSRnAGjH; arc=none smtp.client-ip=192.19.166.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="QSRnAGjH"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 66F84C0000E5;
	Mon, 27 Jul 2026 09:32:01 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 66F84C0000E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785169921;
	bh=2/RO3nDJR9AMWgwvPqAnyU3swl7joPnEBTu6AxeDEAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QSRnAGjHpOHUKuVMFKpFp/sMeAPCFgKNKjpLPJ3RvC+ZDxCqByS3kEEndmlgXctAV
	 cX04Uq553v/WIlVQykcT5zcii5Yc6ZKNOPCQlia4l9EraQwKGmAOzGVTdCR4Y1ihif
	 j8KkAaeEhw5C9yuEG5grBXY6oNlhI0O+1VSORtE8=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 3C736ACC;
	Mon, 27 Jul 2026 09:32:01 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Rosen Penev <rosenp@gmail.com>,
	devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: BCM5301X: EA9200: fix nvram size
Date: Mon, 27 Jul 2026 09:32:00 -0700
Message-ID: <20260727163200.1087374-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260628231049.1248899-1-rosenp@gmail.com>
References: <20260628231049.1248899-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Sun, 28 Jun 2026 16:10:49 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> Fixes:
> 
> [ 0.182121] WARNING: CPU: 0 PID: 1 at drivers/nvmem/brcm_nvram.c:85 brcm_nvram_probe+0x400/0x480
> [ 0.182159] Unexpected (big) NVRAM size: 1056112 B
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
