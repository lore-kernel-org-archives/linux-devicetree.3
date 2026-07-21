Received: from relay.smtp-ext.broadcom.com (lpdvsmtp12.broadcom.com [192.19.144.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57754401A18;
	Tue, 21 Jul 2026 17:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784654889; cv=none; b=oDEsCq2zoZGWA9w8EUTXpCJjcj9dsTubkoNHXIbaPqmPiCK/S/guxeIIKeCJadTN2KhZfvSB3kwQo+Mp55/Ylcuuw3CAhthtO6knRgQaphj/V5hkGwttfm6RccNt6ADZTAw6D+pSBgmhCC32SqutAWLiVudUldujzEYr0mdoDyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784654889; c=relaxed/simple;
	bh=K4Wr3hK/UeHHvOLabIegMMO1mwkuMYZ+mzBNeFKYGwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eNCGJZkw1BRkZfEu6MtFMdwk3GeHbj9faVrtaZ8TnPmXO4me+8qQgEB4tcZk5xNOpYPX0xACZO34igVPEMxXZ43zjwjv9cwUdTvbOpMvaDd/BYTVTOc83zeYTq2iPFoiH2p9Bi9FMBfhtoKA9OR2izO8P80VJWSgZJ9oU42ajhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=F4iW9WVF; arc=none smtp.client-ip=192.19.144.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="F4iW9WVF"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id A3A57C0003EC;
	Tue, 21 Jul 2026 10:28:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com A3A57C0003EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1784654882;
	bh=K4Wr3hK/UeHHvOLabIegMMO1mwkuMYZ+mzBNeFKYGwo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F4iW9WVFig6J++p3ES34hq43vCeF3AjO4f8XSYk3bGRuFQdgN2zEacZSG0HSQEcWN
	 AqLBx5uw1XHaMMSUxCHG6GXA2As7bWOQloQGhkQlSLpNKdvoIU9wa0xwyywx5lumYY
	 /WAVoNxUgMPju5oYfPu+3lW/veJ/MiM3ryGaqNoQ=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 3FCF9ACC;
	Tue, 21 Jul 2026 10:28:02 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] ARM: dts: broadcom: bcm7445: Correct indentation
Date: Tue, 21 Jul 2026 10:28:01 -0700
Message-ID: <20260721172801.3591970-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706101920.341586-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706101920.341586-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon,  6 Jul 2026 12:19:21 +0200, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
