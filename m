Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F130B3B059E
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 09:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018932; cv=none; b=Az+F17pVEDKL0EuFZPWsXhrlj6xUePlnQexWNWTxyvQLYY1/J8+ulefR+DNuY4zXBm3Jg1wPbdSbMqOygL7yBUt5BvH66fCkk4qC7Go3EaVsnomBRqiWpRiNx6ZJf3+8dslkqCnsbJ073fWTuAHseI1IIrgUSYM+uvoFfSdX5lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018932; c=relaxed/simple;
	bh=1VdfXtjk1IWiBRIjglsN7Ax9puUJ4ykuJi0WIKUi3zU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B/Yvtm48h7csGRQ5qUBX2C9jyzNnqVUDXfAisMm35HF7HukKbOHVSphDa8i3ejX9zdJ6zwbOdmNsaLC8+47QPwYPCL/kuxZ94u/dXRrTIq0x8OIBn8h0J/jOhXVcA38aDSjzvfxxhwZuODnlLL6EO3BGx21HqZBrHedR0bro2DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s6yDFug9; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s6yDFug9"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48aef5d66c1so85953f8f.3
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 02:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791018928; x=1791623728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KGUcNzjtQXTGJm0X6jZGQPUmM1QBqOgA+Fbqqq48w68=;
        b=s6yDFug9JfWs/ngyyVwN6Z/ta4WVIvORd04zR8EKAguNpB2LlktDF7ZRPGc81ZbgN8
         dcJgLXw+mrpET46eFVIAcp2FlazD5ZO5edmub2mwmu5mdjSWYc2Mhe3DoCaOXMLUdH0w
         eKpXAWk7Tbb3VA92ULOM1ZIPtcTAk5UOWsF98ZUpBT4Nczsubp7QD9uBuKdD1rho5ZdM
         8+Iz8Ej70md1mqN9vU3Eov3At+JmXssNLBvj2cFZ57GSdJRoP5nLjaTNJgYuL8vP6nvN
         VInPE56aZLGkensHPWctVEvK0Xbv/rsswQia44risgjAe3YyVCsqX1/u/Vzhckdi5aEd
         XBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018928; x=1791623728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KGUcNzjtQXTGJm0X6jZGQPUmM1QBqOgA+Fbqqq48w68=;
        b=BSAWufqBNE0GSU11kmchfrgX9Ih8REDCVW0KeXRotou1cEd6uhgsSd0EcJmozu62hO
         JhLyGHp2hbLez8rQo5AjJiE8rtjmfAfeLyaQFr8SegYnGx55l/CUTRGo2jV4ZQtQdn0N
         lMqP2i7kpvJVunJ8V7/OorCPmi0iWjCjSufKSBg2d883jL2GYVeqA9xzzu05VgPKtvyq
         R4G8VLga2ingKGmlnGGnn/u0JVhUS4dNgCHHX0nN2CWhQK1aChHmXcyOmSpVMVrYs4ii
         b12VKYlxlXxdSItjMK0zOJ2Dk/HTSIX3DJN2QZRe+DwTkKBjPBEqUFqUijs9abGrbTkx
         gETg==
X-Forwarded-Encrypted: i=1; AKwUvBwHbUf8eN8XvvmDySZRejp086CE66M7bOvQ9ItL5TxXLwiyxBSwdjcTTJ4bDud2yi9LSFEdd2GsNfl2@vger.kernel.org
X-Gm-Message-State: AFq9FYKBAVuyJKk8zLldh2cewAM0cxHx+Wuj0Sh1uow8F0TIokus7vkx
	p6YGWxiZpjsYCeY8TPKv3JeCMo9B1+UFoED/ulAlnxz8PhNjVOcDyMyk
X-Gm-Gg: AYBFou3Oob6I3EfJBvKqBlSRxzwOp1UDAtDcB1NXNkL1g7w997QxJOPefwuPr7lvuCG
	iQ3uWOjv9Bywjnl71PcJ36yDR3YPh3KDQI7htsGQOQ017A7nQz700hVm9IScjL+Q7e1uMckIxtb
	SG5Mlw+NZWL354EyspyVf5s/9f/MT1aFMRSTOmD60MLiainO4R8xeQGEoNVWJC81PXZyd1v9LrX
	fUMIVuCLnawk8LwCbTeHZY+6Qd29GFd9PwCeSv7mFPrAbNIzgW8QjCnm/cwUEbGt94T9ynz7YYt
	SdJQVPLzWaZtHzBRRCikBK/AYOJdA8bRs5rExFe1BN/LK/R8WyyGpVXK7yzC/uQG+7ekMXXVrmg
	ZlUV+z74WFBZtdYNauqq12Uxj6ASmLXcbU/Hy9AjccaFD4sTVBzfEpGsQDA3qudS8U7EjLVOQs1
	CyKjZZQv4OaQziWDoi/uxm1rQFQH+z5Dz4eAqIaenumfcGMGGBvv0wsxXXJsRw5AIrfXuESmPk6
	gh2G4iGzRI=
X-Received: by 2002:a05:6000:26c8:b0:487:35c:6513 with SMTP id ffacd0b85a97d-48b12720148mr9951532f8f.42.1791018928132;
        Sat, 03 Oct 2026 02:15:28 -0700 (PDT)
Received: from FranzSP11.fritz.box ([31.31.60.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253dc9sm11336161f8f.3.2026.10.03.02.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:15:27 -0700 (PDT)
From: Franz <franzelfranzel@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Abel Vesa <abelvesa@kernel.org>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 2/3] wifi: ath12k: honour disable-rfkill from the device tree
Date: Sat,  3 Oct 2026 11:15:08 +0200
Message-ID: <20261003091509.4822-3-franzelfranzel@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003091509.4822-1-franzelfranzel@gmail.com>
References: <20261003091509.4822-1-franzelfranzel@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ath12k_core_rfkill_config() skips the hardware rfkill setup only when
ACPI says so. DT-based boards have no equivalent. On the Microsoft
Surface Pro 11 (X1E80100), the WCN7850 rfkill input reads as "radio
off", so the interface is hard-blocked:

  iwd: Error bringing interface 4 up: Operation not possible due to RF-kill

Also skip the setup when the device's DT node has "disable-rfkill". The
PCI core attaches the node to the pci_dev, so ab->dev->of_node sees it.

Tested on a Surface Pro 11 with next-20260929 and the matching DT
change: the interface comes up and connects (5 GHz, 160 MHz).

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Franz <franzelfranzel@gmail.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 0c72948f3..8cac84917 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -83,6 +83,9 @@ static int ath12k_core_rfkill_config(struct ath12k_base *ab)
 	if (ath12k_acpi_get_disable_rfkill(ab))
 		return 0;
 
+	if (of_property_read_bool(ab->dev->of_node, "disable-rfkill"))
+		return 0;
+
 	for (i = 0; i < ab->num_radios; i++) {
 		ar = ab->pdevs[i].ar;
 
-- 
2.56.0

