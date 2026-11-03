Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721117;
	b=t9tcczLXBYoopGesvvN+jhFpskjm4iRuNoZ2itrsr14aTgzCWrzCl6t1Zl5XsOZLARo/
	 NjHPewaUBv2fJofDFQ2Y6hIQleL/DOelPq7DzO9yDfpbPZEK6AtsbDc+9OLTXPirqDAoc
	 WLZmiNjhM6ULR+ElF9Aq4y88cpsF+4g7hO+RhG8UbU+LelhTD8GI/eqGpWeTQAwvYXh45
	 +uEvnFp9PJHao/PHnVst09joRQ9+sGt0T+LcxHZOL60/FB+0tCHe8bnHpANriwZ2E8ict
	 c7xSpZPDdKdm+EaRdqq2ucMZ4eK0sk0TVJhK/75JGDagOzTlqVwHUdO3sAU5+6kJnEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=48ZgMUAmWUootHlVRFgHd/O1MI4u30L741/hVXfoBok=;
	b=YXB/ybrnysGDFXPA47svibAvyIS8ZZxqd0biwya3+fU2zg0B27FFeqdl7JYYArVnVXHT
	 /jKCLFuuidajqqD1z+YE1WQKo7P5LoHYiQ9Zi4vpiuUJ8s/5cViQXu5J7JUQvCZxBPxFt
	 en8BnvbQxDVgHxfoFkD1tbq6VBCSQ+yBoLWon1i2Mu3BxiBzjrxv2eUp1ocdpyGKoubh0
	 O8IkkCATnEWJV44zWMrtsogyLwbkzi+0ZyYOxkY3w+fmBrXD+WzuHKpK4yXbMzqijOFzD
	 LZSaCo5n2Qa11jyAdaK48z8zHYebuBPHW90DLzmRe7Tqt/e5drKv1H85pXvQpibU/5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QnliSMnd;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D159B606A337
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 15:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D159B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QnliSMnd
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso515354f8f.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 07:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793721115; x=1794325915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48ZgMUAmWUootHlVRFgHd/O1MI4u30L741/hVXfoBok=;
        b=QnliSMnd3rlXtRor8SHtaOolv1WFVAVppgOyQH/qNf5MKmkOXTHkzQTiWRPaPwWA46
         cBb7O+UM5NyRBoA5bhBrtzYEyyJnOcP/jysxngd+AFlBAanf8ZsUY2chdshUfvDaS5E4
         Dg4muARPLfyIf6u1eZ2aAZUoKcWoZRK6qbl8XY1cWFKHUp+O4yjg8CrcwEQ2gySVONsK
         OHGjxF2W3FjFZecA6ehjE+NQPnGXkpQUwDQhBrB67/G2Bua6QrIc8y7ectJX1Amxec8X
         aMGsqkIAHx8ThqNj8J/c+DKYrXJLjHKwnGt2vrOUaZRellJCf+13HQbxVnZAc5zrmy98
         Mrsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721115; x=1794325915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=48ZgMUAmWUootHlVRFgHd/O1MI4u30L741/hVXfoBok=;
        b=xcdonyMqIDHkWrDvzJLXQsgwzBuHnPUWp5Wm96SYtIAfMwhp36SFYHOXUu+AdvISc6
         URiAL7cGCDKPpNtKgFpL4H0Epg9K/PvksaRPw3+7GeE/d21MalABMr1d7sx3/jzMVXPA
         LlcQDstpjBMmOo78KgCPPLsLNMAh42omm4yhLyk4/rYpieZExbv9MzarItIzXkYs7Q1V
         gWHkNc5wYwbcnTSFwBL3A9Um0BbexA817eL1DZdTDVaAUdYpIMp0pAlF4fmoL7S45FjX
         mc6HH2/+gNEd+75N0d0n7jxrqoPrKOwrjTNrRND+G1wScMW9dWjVm01hJw7KXTvlHm0r
         Gwrw==
X-Forwarded-Encrypted: i=1; AKwUvBzuFMkuJDlmocg81K4d/A1JttyYUFSiqI/mfk8KEBUnbBHmC/Z9/fsIvbJo6SKoHqYjL4rVlAlXUock@vger.kernel.org
X-Gm-Message-State: APuU4Z8gqELjBXGSFTpnD970wJqV8psMKA6u1LkrhgY2g/iBEiQToFJ/
	Y8aCJ/47s2/xMIefyBYxC1No/if3NF+LjuY8TptC7OAAUro2DWOJzY6h
X-Gm-Gg: AYBFou0ZpYXcze0BJjN7jNQnuFnd3HEJklhWwfeRmv2r61bg6iddnXB//QVquhXWmTX
	sEW5UAvvu9A/eGa7a8r9h+b4BSlb9+FtHzAAbwd2T6NZtOUoltEfqUhRj93pp0RnDHK5f2uZOnd
	E9sgOLBeIhCeFAvBF8lG0nDaiLRMJ3xWHqFOlvbaoRIfODQWhD/IBKF6X6UxGO4FHntBRAb12Bd
	/OhKeRCtZ2og9Pk9FW4Doou+Sj4wc2lVBE3HL7iETfxKeKNcr1iepDVLfYN+auqUS89pcStQ9bf
	zDlKKP/TVhaRw6u4JfWqS4Nl/ZBUjtNKJ5C5cF0cGEu+Jt0AkNjC57yUlKdPi6yHnPOIZCYn94T
	UEImYmPqL2Wj41OzLTvjqBlnVL7HFKQYdevwoO6lVKczADfl9u8+Vu6ysLQcHu4rFX0+eVQiopa
	y3DewCVwkvlmodIPHu3jFCcJb+IukJqfWp/upxE3WJ+vpLcnNLBbqIIVYlAYBzIrj+7EJrIWrwY
	hiEdYvMiQz3mS7bu8P1eAn+CmPD8UN2PI069fveEHR/c3I0OaZNvCCAcuVutAvyMoUB270yLd3L
	BmTnSuftu8LEbF2nuq4654GaNQGvZicTEXCGDk5fBnYSyeZ6Ar/HXBB2Scpkdsva75umNBsMPKk
	vQ+PdpoeIIXQ5DJcr/eanrPlVW/7FClUaCNFkMmTgrkwPWPHjHu5w
X-Received: by 2002:a05:6000:2c0d:b0:48e:661e:8766 with SMTP id ffacd0b85a97d-48e661e88c5mr40085813f8f.17.1793721114894;
        Tue, 03 Nov 2026 07:51:54 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b964desm25680750f8f.46.2026.11.03.07.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:51:54 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: luan.r@variscite.com,
	alifer.m@variscite.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shitalkumar Gandhi <shital.gandhi45@gmail.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Johan Hovold <johan@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	John Ogness <john.ogness@linutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Fugang Duan <fugang.duan@nxp.com>
Subject: [PATCH v1 1/3] dt-bindings: serial: fsl-lpuart: Allow wakeup-source
Date: Tue,  3 Nov 2026 16:51:25 +0100
Message-ID: <51b4d26521bf708d7f74f0ccb49fbe515d673ae6.1793719239.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793719239.git.stefano.r@variscite.com>
References: <cover.1793719239.git.stefano.r@variscite.com>
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

From: Stefano Radaelli <stefano.r@variscite.com>

LPUART supports waking the system on receive activity. Allow the
wakeup-source property to describe ports intended for system wakeup.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index c42261b5a80a..5c1237294a62 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -74,6 +74,8 @@ properties:
   power-domains:
     maxItems: 1
 
+  wakeup-source: true
+
 required:
   - compatible
   - reg
-- 
2.47.3

