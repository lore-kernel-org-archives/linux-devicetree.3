Received: from relay.smtp-ext.broadcom.com (lpdvsmtp10.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CD03A0E8A
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 19:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786519; cv=none; b=PAr9ikJQ908Gm6DWCZ1cs3WEPPyUOdW0ceVVrSfmaGXW+F0WMrMLK5AvLEfj/qeNOTxvu5sS2is/K52nBwSJ5+hnNDfc6cRnlNojrrXzx8+4YXhcDHyVNQ1DODOu4SxXwBdQ8B1H9X+Cwc3XA0A5aQ+KxyTk2v/4w14KF9HdDBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786519; c=relaxed/simple;
	bh=ySQCAZcnRsbzAlSj5gSQtev7QJxmxZ1Dlv8+V9kSRGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rI0Vggep0SCQnhBN25877S1iXHtUfgQHI3bunaccU8HTxWvRxmTxLzLeXGnb3f8IE3cezvVKKZCzOLZLn5jKMpG1n7Y/W99vUXPmIIw+LjwD/zCAMZd331v1AQCCr+YbLeFwF3I1qAzPGXbWnJ3+aSZtguLjXMv+U+mPHgan5PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=et7NKpTk; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="et7NKpTk"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 07707C0000F4;
	Mon,  3 Aug 2026 12:48:31 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 07707C0000F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785786511;
	bh=ySQCAZcnRsbzAlSj5gSQtev7QJxmxZ1Dlv8+V9kSRGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=et7NKpTkdioeBbQXNvoO5BbjGZb8DyujC8abUpIjXF7WX+rElnbhxac2sAxPpf/I9
	 3z4tPnVMGGb8n+0bwndzJSPBebO3rATooXVLBzc370g8i7xDyXSFdugtlf11Mcy+0a
	 w5CYMMnOTqRTFxAEuccS6H5nz4n4HF+rosxAlDm8=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 979E9A9A;
	Mon,  3 Aug 2026 12:48:30 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Peter Robinson <pbrobinson@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v3] arm64: dts: broadcom: bcm2712: adjust display status
Date: Mon,  3 Aug 2026 12:48:30 -0700
Message-ID: <20260803194830.2964919-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801165430.598302-1-pbrobinson@gmail.com>
References: <20260801165430.598302-1-pbrobinson@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Sat,  1 Aug 2026 17:54:26 +0100, Peter Robinson <pbrobinson@gmail.com> wrote:
> Typically non critical IP in a SoC are disabled by
> default in the SoC .dtsi and enabled on board specific
> configs. There are usecases, such as some CM5 carrier
> boards, where display output may not be desired or
> connected. So disable them on the SoC .dtsi and enable
> them on the RPi5 board.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Andrea della Porta <andrea.porta@suse.com>
> Fixes: 25d77bdd7df2 ("arm64: dts: broadcom: Add display pipeline support to BCM2712")
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian
