Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F7B3D410C;
	Fri, 20 Mar 2026 17:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027586; cv=none; b=nyjEA3bm24KI87N/8c8vzc6WWXRxigzhibxWywDo7svdLbJoHNG765E7MhXUmhmmKQqJaE18VtseV/gf17KbuUbEGMTSWNZhkF0K06AXHVeDHP3KxfDXGmC2B4rjW5RKTi7KLnfgCWNtC7JzOONYp/Z5beAxo88bRJRRfBhDMD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027586; c=relaxed/simple;
	bh=zUA6Zz4yV8SPxqQ56DVLw5sDxp3oorgKmfkr1wknfMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kHqWmmLn0RxrLwJ8hPzFdWh17QsnO0QMIxDtPpj6Ft0yTbEA73Do4WNtmDlYKxBys+tvHrB6GW4gnFJmHsK0gmDRe/wFv7hQMV94q7oG1bDuXQ3/lfep6Tolo0DoLVwuyMaXvtUHZs6icLVnrFafZbD+YjDOv2I8KwS6SejWNuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=oXN5TWgG; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="oXN5TWgG"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id E8E9CC000521;
	Fri, 20 Mar 2026 10:26:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com E8E9CC000521
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1774027576;
	bh=zUA6Zz4yV8SPxqQ56DVLw5sDxp3oorgKmfkr1wknfMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oXN5TWgGDEmucw3n5TdZQlQj6VrZ4gcPKnCLdpH4aqu2SoqHmQoLJ3sO8kN9TyazK
	 Fn0IJPKGBr0aN4nwyGZoXqxO2g2z2sU6SXsSEKd6ueszaqBifArto9feXVZrpg7EEi
	 UtxLuv1Ds3ToJRbGhARvQoeCmhVcQVvZshBMrDQg=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id BF504A83;
	Fri, 20 Mar 2026 10:26:15 -0700 (PDT)
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
Subject: Re: [PATCH 3/6] ARM: dts: BCM5301X: EA9200: add LEDs
Date: Fri, 20 Mar 2026 10:26:15 -0700
Message-ID: <20260320172615.3072049-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319035324.269905-4-rosenp@gmail.com>
References: <20260319035324.269905-1-rosenp@gmail.com> <20260319035324.269905-4-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Wed, 18 Mar 2026 20:53:21 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> Allows control and configuration of device LEDs.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
