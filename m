Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684180;
	b=JJrUY0MewTCYqu4XN5Zko88WGxAKhP8z9hq7LVStbX7QXAD3u8ZLA0ctQs2b8i3fF+/y
	 ntgTqlQFY1sE4BJ4ESIjfqgjVaD/j7daHrxqSNTS6NQwFUopommzVR9hgo7TicvYzHfad
	 jLHL6KTqt/ZZGPN0FCsuq/vPQHgnx88onbwISigqra6U1zWgOPyElLmNfCuHDCHOGlbkD
	 t8FnuankszuZKcrVKPl2U2stP7yGpc7NTSDEyLi7SEkAp9bmVCId0oSp0hPm0zdsEoGoG
	 nR+qfQRG0w2k9EB63tQUfh1SqaR5cj3XDZNPmqzmMOEgQTeq5CGEtRpndHO7C4bcJyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6j+nTtkEYU+rOhympPIn3n18jdsCRRFadJNhZJaK9Nw=;
	b=bKMrCLO0MU1WNFuWhA1ESRdlzjw5vVLCKopB4axRvn9Oi6xXj1JoHatO/kQh/aRxs7K0
	 3zG/EpR2WTouO6eav57Z02OeHopie9ZQmhPh8czOPPQUYjEfU568hsJgaBBfJMFDJ4Io6
	 ilz3GWEIOM/YxwtqYkHz2iAoRVt3oDz74921oYFsfJ8AKkn8J22thNuSkvF8nET7JSSem
	 KCVl8VGGze3rZpPXP+UfXekyaLrSof0g3UdZshXoa11v3xq7qEaUjwdy0nQ4P4RzoJVkh
	 0nGKEjwFTdyjkwTftYYff6gNijAKCQ1/y0FPMgPcAyp9pzenUvOG+wSH2hVa4DTCdjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c0ofdAHN;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549DC606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 549DC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c0ofdAHN
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3866a784546so9262316eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795684179; x=1796288979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6j+nTtkEYU+rOhympPIn3n18jdsCRRFadJNhZJaK9Nw=;
        b=c0ofdAHNY6p0nzbi9Dd4vE0hr2HXmbCm+t/BaPPRiML3TtygeYvKsvz7coqZTaQw3A
         C8FKJbFMnncb0ucyGWpjtoBDkM5D/O6JRp/EA5oayMDp88hW/4kLu8UXec2L9L9j4ki2
         8LMVLFzq9EiG8IofVsgucdi4zooQ5tya4KzCd9b3GcdBWkAGuYMPMfiLVgiRoTwiLDzX
         m4ql+oxmeScoE96yqesSyiZSilZq7cflvrXk2ZeKypst+8CmcopPtrw4Bs3wmwVU5ro5
         QDjuV+fRpX0ol+8iydPMFK5kJtuUHTOV+M6rr9uYsn0uCSIPUs0QfswvegX5Tztl8iaG
         9oBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684179; x=1796288979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6j+nTtkEYU+rOhympPIn3n18jdsCRRFadJNhZJaK9Nw=;
        b=yMLFexARypDJ/qJyiJe/eaiZDGRi1mzZUsnQhKpmDsOSDk7Bvv5kyRo3DP0jNeipOA
         3sHoAqWj4vi/FT3WTgPzQBynZuEtQ9ms7ultr594GC6H1MtGfBww2vhPnHA1j31PvxsC
         XaCWa2BSZKeVKr7oCAeKygspCGaCaitZBeoDAKIJrnHHp4t8XPsyN6pQ/nucoWJIOE8u
         6Vj6Bcufdnfa5JVhFd0KwppjPCZnmtJSqdpBv2g3pgh1mS3fZ4FcugMoJ4dvDqmApfko
         7w3plB76i+84SyIWgw0ryK2M8D+Vy+dU9e/kWiZlTX853iYkaelvDmIf9q9cc5I+OcgL
         bQ3g==
X-Forwarded-Encrypted: i=1; AL+hErGSjN200zqBoZkdlVNgmiRk+RlZ+M9LA0H63+EHA6TA1RvMvUb7/7afsVj5ovKvSeyFFsL2VShjOrdP@vger.kernel.org
X-Gm-Message-State: APuU4Z9ozfcXavzThWrDI+z2yrpdk9+vKF0VSeBf0P0vkaKRdcI3m1nd
	aPUTVvkW91epc6+zkN0sXQWNqvfr3hKDW4sS4N0ibrGwvlfIQql5aRd2
X-Gm-Gg: AZFdTZd3huEXZsjnsH0x64lZrnL5xU5fezeXNrwvkZbYa4ObzDwlc5Ly4IufCwqQCjw
	sd7EUvoFbEYLheQ2PwUH8PLtyIXWzw9izZQcxhK5cruAIa3e3p5biZtm1FbuKy+GTNDK7W6ylaB
	e0gCZlvQOq8rmtwoYzc7sdPG1vZxjaktZ40XrD2PAzPiehqI0cxbGifmZXohgu96vtCGx/cyBMH
	1IhSZYzAnD/D8kxMnf/u01zxjRn7zkAnNtA02blaB93unypNvJ88B8UuQq33XB1Zr6wBQ+NuSvW
	YCh74YJjaD2oiJxxhlyTILzHHNmZ+tDt7OtvJhq+YzCZMuyZJTVNQxEqs6aqKTxEMZwNjypHCZE
	G5+TjqYdcrZiqAky1YdKsduobDR1lAwUDPKQah43XE6IrR1jtKUkXc/WrWzuOCI1l5uIDNGiuko
	x7i8FEpHmOaMGQAl/mG/ArgyRbTH9vwnaij2nKe5dny5tGMQkse4BkEvY8HSTUOaRGlNRQKQyCm
	LVgyGMhS/N0nv/pNVabtQBycmXqSlLjUD/BB+P1l/Lvhki+pW4mRDjq4/M65QKxaf43I+vq/wXo
	g6ZRm79Hhblbjq1/RxOCOTcJkHqvxBfud7ebtiuxGPx80jJOagoIDBXo/bZ9Hw3fhzvNduBijA=
	=
X-Received: by 2002:a05:7300:d08a:b0:386:240c:19dd with SMTP id 5a478bee46e88-386241b6dc4mr18249807eec.9.1795684179444;
        Thu, 26 Nov 2026 01:09:39 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:ad38:eaaf:b00d:c452])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm108374649eec.3.2026.11.26.01.09.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:09:38 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v3 0/1] arm64: dts: qcom: Add Vicharak Axon Pro
Date: Thu, 26 Nov 2026 14:39:27 +0530
Message-ID: <20261126090928.73637-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
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

Add initial devicetree support for the Vicharak Axon Pro SBC based on
the Qualcomm QCS9075 platform.

The board description includes the debug UART, UFS, USB 2.0 host with
an onboard hub, PCIe1 (NVMe), GPIO LEDs, GPU and DSPs.

The compatible string was merged separately as a917cf9dc0e9
("dt-bindings: arm: qcom: Add Vicharak Axon Pro").

Changes in v3:
- Rebase on linux-next and include lemans-embedded.dtsi after the
  platform resource split in 1f90a2bab7f6.
- Drop the binding patch, which is already merged.

Link to v2: https://lore.kernel.org/r/20261030074404.33517-1-blfizzyy@gmail.com

Ajit Singh (1):
  arm64: dts: qcom: lemans: Add Vicharak Axon Pro

 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/lemans-vicharak-axon-pro.dts     | 514 ++++++++++++++++++
 2 files changed, 515 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-vicharak-axon-pro.dts

-- 
2.50.1 (Apple Git-155)

