Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628783C4540;
	Wed, 20 May 2026 23:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779319333; cv=none; b=JYD11AsBBOekUZFrtQvwzs8NnHcEewZDrrEQDuxXBankTIhwYrJx+Su/8j6p9z0ORN9EVOFl6cVaxtETciSfcjTq00h73tiqAAnl82bn90DUM22jFUIIIvFTmGzH8AlDbolhaQ6FCk/PzbB4jYMKoBoHQKfuL/YhHdCHVnGaYAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779319333; c=relaxed/simple;
	bh=AbKXH8x5NJxJDSg9CvvS6j9aGhFhmyjJILTcn+NTtmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t65z2xfXDfI2sNTgzDG5qt15A4anSxn7rAnJwwLJILNrjD4NCSkQHwAaJps9oxaeFQal/q1ntPs/btwgrs1aHBWUjQsKkdxNWa339oiOs3Uqyl9tEdpXyeKm54nTee6vGHDRtEcuSo/p+D+8D2L9dbQsJf5nhwg1jYknjN/ZMyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bjk07dc6; arc=none smtp.client-ip=192.19.166.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bjk07dc6"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 5EF5DC000572;
	Wed, 20 May 2026 16:22:06 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 5EF5DC000572
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1779319326;
	bh=AbKXH8x5NJxJDSg9CvvS6j9aGhFhmyjJILTcn+NTtmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bjk07dc6Dsuwrb2c25e7P012ag81zLF8Y8yOOewIx9aCJKNg1pbYD9+rp8oGWdVn0
	 jVOw104dRjGU5Oxg4u/Ul2LNvlt8sp8NZ2c8Vl3tvum/YivP4nOFOxcdJBlrXSBTSg
	 kV9J+0LDn5xYGDrWqY2/kiOCPtQqQsv5wdnZNwa4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 33DDCA83;
	Wed, 20 May 2026 16:22:06 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Rosen Penev <rosenp@gmail.com>,
	devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	"moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: bcm958625-meraki-mx6x: move pinctrl conkfig to pwm
Date: Wed, 20 May 2026 16:22:05 -0700
Message-ID: <20260520232205.14423-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430051612.700050-1-rosenp@gmail.com>
References: <20260430051612.700050-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Wed, 29 Apr 2026 22:16:12 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> On boot there is this warning:
> 
> /axi@18000000/pinctrl@3f1c0: Fixed dependency cycle(s) with /axi@18000000/pinctrl@3f1c0/pwm_leds
> 
> Fix by moving the pinctrl configuration to pwm, which is the actual
> consumer.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
