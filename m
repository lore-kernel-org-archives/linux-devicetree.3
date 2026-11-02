Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793645721;
	b=DypDxcXEWmBy5iPaybFQr/mp7j3rteJmABFriYw2K8xRi1f6K63PGkRb0fAW9ufiIG7Q
	 f1bpk5R3HV78OhInILhauP0bi9jbQpAmy2U+rkKlrS+37mED0hQXt6806DmFOKEg+/CPR
	 zmyDl0BS9VSAgLc6P0o6OMXE10PlkBmLPyN+DKIqgjtJ9bZbso8AxH6gIJ1jR6vIo3kOX
	 2iWol5oddvW39C1YPU0WHyHqj1bfYgPmTFl9+JmdgekwJ0/3unvD9Bi/J7FpYMYIZgb5I
	 RpC5ZhblZw0Hem2Q0VdMFa3heWXfds0Zkdwq85Zm5CyCBODod4lO5zTAxElCvWU78hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793645721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OXL77zZ32z4nvR/569ppBfTKmHJlxwpJjlMvH+VK56Y=;
	b=BJOxDz8CDu2A/ASK79994p8IZBMnt6ge4yDcIgIMVuOVbdF5F7GoD3QSjgGBamCbI7if
	 yux7evhc0LgG2ljOS1gBvU5GhA6DkrwBFjyEeayYEePMMd0+nF9KdfkzHhwoVAnLx3p2e
	 X96OgRMML1wesOvD8akY1mRCBRN7dZ4AlSFGUOigqqf8xVz1/ketjErHWegN6LzW7OPvh
	 j/mXPRMoOAPkW5VlOtfMZmA1pZt6pUGnrNboIMucx1fBB8Nmia7oK1mNAqvXWVF8W/gRt
	 /h0PP1SrQstXJ8g4UjCW7pQt0YGd3ZMNsvGyoNEQYExvzYvcLHGBj10Tu5oUiung3wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AYIMQ2QO;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D22606A32E
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 18:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38D22606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AYIMQ2QO
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e47347279so2080003f8f.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 10:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793645720; x=1794250520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OXL77zZ32z4nvR/569ppBfTKmHJlxwpJjlMvH+VK56Y=;
        b=AYIMQ2QOyom9hvBKw2Z8ci1Fmh5uDweWzMg4XJyBGbxphJjwq9ebj5trX/YSUe3uk1
         V+4KmbombX0NwhNNf2jclf9x2HyOqTLuEBx48ZHidXHtKGuaDnM62FKrjGRgw7A384id
         adB8KrcB3ah3klye/gtbcOJrBJRy3poQtF/jIgxkLb7piS+ts8KW/ZhG+e8uNKiP3N3+
         4S8soDC7E/hPvK49jhBThjjqtrNwwvvjDuZIFf+0ibmPlBwhFCJpdF6VaI8hPL5w25ZN
         JY+1qqEP3VOi21FH6eEdw3pYEn2au7c462ARp0JsqDq9z4L0+Xe0qGWKkWwgTaPsqqjC
         764g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793645720; x=1794250520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXL77zZ32z4nvR/569ppBfTKmHJlxwpJjlMvH+VK56Y=;
        b=2eLOb9i1CcxVBt3+azHYPlvzGaLyHQzhk098eKd0kFwUgTHkiQJMuxiz3flLp4nXvC
         PRd2beaRb3RjFVP7dNBiJZ8wnkhfyyQgl0wzkqW5tQiBhjv/czCBrP5jcyjtzV8KhFXu
         cHvIyXISOkMnSwTloN7GPDYbYJ0CBDw2CdUaFxI7Bb/3YfBtvbOwNjSKhaKzkNAWbiuF
         lsUu5diN5sHEBLV/FM7an6gt1wnXmJd77mATFZkMpzsN2b6x5VBjbI8f/+47xuGQXNtn
         ptso9/x9rCo1HGUWm1wOPzAI1Kqhdmh/3V0LlsJGvar68lqiBTsTi58rrAZ3Kjvghcgm
         3Dkw==
X-Forwarded-Encrypted: i=1; AKwUvBwc+HEPpxa0oDCmzzOqsQlVHtFiLKJw3/wA+4Ex86rNJxJyRDzIjKuly9PP1Cmid3060P04zt67PWlt@vger.kernel.org
X-Gm-Message-State: APuU4Z+I6ZPFJJ+KeTqi1iIIQUAwmdYLIjhHOfOSuEYLs1qzor6cuD6b
	n8hQvqy+olH5aktLW/jXGAn6jFJyQCYk8KgFZIjTt1XuPf1DFVqbuTVe
X-Gm-Gg: AYBFou0sL5KEPnOu1xBwKQogWa3f2De/i2xsQrTEgtbVWcWewzFeEDLwDLEj2ckf/0Q
	Gph15obgSFmlDDTLhHGicBXr1YcGmZRec6d/+BP4n6kdy3NQUA1hX5pe3UExERppsguIcxI2xzu
	hpydnkd7njacgSaxcun4St9C/C/gTGNs6/RBhuMUMzmLjnukJ0uzVoJN7dMeZCxmWTdQXXGfxlj
	u2CM/CDx7Iad288PTh2j8HKUT7G0S1i3BW/C8JsEjRcrEGURgka1EDxyqEzle4RL/ZzgacmRS5n
	fXLwOg7d1M9KAgWFSoSTbZDKGtXOgBnmqO0uNrva+5vKhbKVBiEllLPV6zexI3YD9n2t8y9rGpG
	NwSrm/SZDKstulKm4nsOa81BgmYdJZPDdP/cBlVndJG4/fVOcCi75cTknGEXTp+H05dBKuf1FOY
	GZ7C3UwKi9qnWk9ouZpcitU5Zf4fRawn9Mdjkmyba5a+yVZHUaKc7RaJWOdZ1KLdShlIepnhY0x
	G1xH/wqhDD5sQZsDD7J3vcibrIeEUSMFKUeSEpv/eHOLZUE22ZSPrJW3m+IlEBm/ZUHtIlL8LTo
	leaLeyzCInjvwOsp9l2Rm45w4grLjDqzMq1gR8fUEaKZBhJJDsHhQtm+8KzEh/ihbWwStjs32yY
	kAlvgF3RCWAxU8ZIJu56hm2MSyIDsqi13yqMIm+wlNZYk+d54bYmrfTCrgJXEYQWmAz2+VCLZiA
	==
X-Received: by 2002:a05:6000:4021:b0:48d:e6f6:21cf with SMTP id ffacd0b85a97d-48e6e306900mr25328622f8f.31.1793645719465;
        Mon, 02 Nov 2026 10:55:19 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7815fsm21965403f8f.22.2026.11.02.10.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:55:17 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 0/2] arm64: dts: imx93: enable UART wakeup on Variscite boards
Date: Mon,  2 Nov 2026 19:55:02 +0100
Message-ID: <cover.1793645417.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series marks the LPUART1 serial console as a wakeup source on the
Variscite DART-MX93 with the Sonata carrier board and VAR-SOM-MX93 with
the Symphony carrier board, allowing console input to wake the system
from suspend.

Stefano Radaelli (2):
  arm64: dts: imx93-var-dart-sonata: enable UART wakeup
  arm64: dts: imx93-var-som-symphony: enable UART wakeup

 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts  | 1 +
 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 1 +
 2 files changed, 2 insertions(+)


base-commit: e20daa6eb46fdb339be122a37211aa408488a3e3
-- 
2.47.3

