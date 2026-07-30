Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A303955CC;
	Thu, 30 Jul 2026 23:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785453965; cv=none; b=thssDZt0vWxwVtDZIG8YASFMFD9/cKHTGdpG5I0ZxRX0NOJm3bFOqgz8eXYYX9X1Rnla2Xd43NRmFqPf+5n7cEYpJqqpKIR7r8EHNyy8sLRzCb04WVj5CTzkTNGfYoo+QCNI3cZM9BKxFxanjVaweiFEYIGo2KzJjPtN/kcgFI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785453965; c=relaxed/simple;
	bh=77/sbrLLqgTpymVXILb2mY9H828DXe6nW6ySkXv13lY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OondEDmpG3abTICAkV7v+ALQg6MaWHQ7tHiCzymTcOVzHenYGsX4nsu8EpWm3ajV7hvNGgP6dqo/hsSF0harTbBu49N7v9np2mgwbAj0sVJC5tREb9oQ4giTywxMVPa0cLFZGUBefX2tMGBmkBuZrmEu38vTeBOiqQci/K1OLmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Do1Ni0FH; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Do1Ni0FH"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 20E1EC0000DB;
	Thu, 30 Jul 2026 16:26:03 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 20E1EC0000DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785453963;
	bh=77/sbrLLqgTpymVXILb2mY9H828DXe6nW6ySkXv13lY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Do1Ni0FH34X4xhN2tn7Qq6aKIkyNDMm/R+IbzTrAlSzPWugz9q6c6T37YEz/RTQmX
	 FngYvqGy8MCvwr2Z3B2tbFAPoaHutk+HpZAS9RxKfTW44zYFK6RBtn6p+C7Bgguo2X
	 JD1ZHWb3PZ4cNIOtajB3YWgcSViH1VnIF35VPW+w=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id EBEA6AD9;
	Thu, 30 Jul 2026 16:26:02 -0700 (PDT)
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
Subject: Re: [PATCH] ARM: dts: BCM5301X: SR400AC: set WAN MAC from nvram
Date: Thu, 30 Jul 2026 16:26:02 -0700
Message-ID: <20260730232602.2706827-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727202817.22085-1-rosenp@gmail.com>
References: <20260727202817.22085-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon, 27 Jul 2026 13:28:17 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> The WAN MAC is offset by 1. Set in dts to avoid having to handle this in
> userspace.
> 
> nvram size found from a random bootlog online.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
