Received: from relay.smtp-ext.broadcom.com (lpdvsmtp10.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E680A389E07
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 18:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790620051; cv=none; b=TgnRLs0qNgQQyjgo3QWjwUxUa1tibNXQb1UVBmTiVAtFt/Wqwezm1HKxC7C+575MXhwJ+uV6DgMYNzboy9KwiWQojFJ/V2ZBhR6AuF86D0xuGXBIqgkxqpgyaxFlewbSpykZlVmSiTgAhkEpq3/535eZ/W7t0vxFBpttVgUUGfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790620051; c=relaxed/simple;
	bh=VIe98qGS62Bptvrc67/xbYtt+XNucl3ZaHj/83F/Wfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RH4JOXyKGcKk2DDG+SLjoGD9qmLkZZmNl+Ga5k8V6DjWqnBKCmEYWiY+KraeCUH2FwtRLHH1fY3vVEbQOZtOgrm3gvV761NF76AfLJGa3H+DwzDliQAG69fwflslx7F4/opVnDFLU+0dVCwzfuSyyedFDa0BVBZ/uaIUWIiOVKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=qABasuEK; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="qABasuEK"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id DAB75C0000D8;
	Mon, 28 Sep 2026 11:27:28 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com DAB75C0000D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1790620048;
	bh=VIe98qGS62Bptvrc67/xbYtt+XNucl3ZaHj/83F/Wfc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qABasuEKAeJ6pGS+sCb4CeT+UL59sq9annOluwd5/TNPE9hVQW/siLc+TXuTZEZAT
	 mQYmZu0R/gHgVNpXOK9TBIoWme/23jnDkOfsCSYyQS4jBiY2uPaG87RaiA/DXv1JBg
	 y+zbzY3afRqVTF0G+rS4c9OxLxYzxeM06rzZczMI=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 7F0CAACC;
	Mon, 28 Sep 2026 11:27:28 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Peter Robinson <pbrobinson@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] arm: dts: bcm2711: Add emc2301 to the CM4 IO board
Date: Mon, 28 Sep 2026 11:27:28 -0700
Message-ID: <20260928182728.1268880-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925065418.2248731-1-pbrobinson@gmail.com>
References: <20260925065418.2248731-1-pbrobinson@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Fri, 25 Sep 2026 07:54:10 +0100, Peter Robinson <pbrobinson@gmail.com> wrote:
> The CM4 IO carrier board has a emc2301 fan controller. Add
> it so it can be used on the CM4 board.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
