Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B413B19B6;
	Mon, 27 Jul 2026 16:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785169861; cv=none; b=UaGUzg4bRiIq91g7CPA+IbOucMNZKd4jRyeHcLU1bkA4HJDhJvBSnBG2icUQ5sQv4VJkHRDvz/ukjYk/9VpsZcW24rNNuIyz4zcwFNM1ghnwz2ohe8bamr1eDE1dnG6r3M74HMuXUn4Vsf/zLqOHBxGVF6R/AgsSdZRu9LDWK7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785169861; c=relaxed/simple;
	bh=GQM+bl3BlWiZ9skGF4hc3OUOP4V1vuyexLB/bEQXXAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r6pujLxAaUhaFHwpbWBIl3t4n8nf1y7UIOEAJIF1bvRAlpYR0zxlgF9IvPY57eiEcGMy3eZ8jH7BwJMKpD8j6232SlURuvob8NeB8YjeLtlvE1bmd6bFwktzWsTHAss9+sGz5AHUQGbETQyEMF0oq9LX9GPxsHCXqE83ZTdh4TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=elSfygsL; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="elSfygsL"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 0D1BDC0000D8;
	Mon, 27 Jul 2026 09:30:54 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 0D1BDC0000D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785169854;
	bh=GQM+bl3BlWiZ9skGF4hc3OUOP4V1vuyexLB/bEQXXAE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=elSfygsLEMwnusILTyYEvv8HBeS/0GFzYInwiruYsKOBiS3CPUPFvF1NADt1hbMF7
	 N3MPjcMK2JWSu4DtnccJbYHIXEfX8dylWsXcMBsl6yCns9VaOuqZ1NqjGNLZR4ASYz
	 KVXinQFaoxAeRQJwJxYFYlVYFqnpk8GSQcfBL23s=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 975A4ACC;
	Mon, 27 Jul 2026 09:30:53 -0700 (PDT)
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
Subject: Re: [PATCH] ARM: dts: BCM5301X: R8000 add NVRAM with MAC address for WAN port
Date: Mon, 27 Jul 2026 09:30:53 -0700
Message-ID: <20260727163053.1087086-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725215634.9181-1-rosenp@gmail.com>
References: <20260725215634.9181-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Sat, 25 Jul 2026 14:56:34 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> The R8000 stores the WAN MAC address at a fixed offset in NVRAM.
> Define the NVRAM region and attach nvmem-cells to the WAN port
> so the MAC is assigned automatically by the DSA framework.
> 
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
