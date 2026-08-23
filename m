Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56EE339372
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 11:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787486033; cv=none; b=Ea5Mv59cm65ignESjhjn5DbzOWG90CSUgASi/Jx2s+Qzxd8HEzvOeIXBSjUNSU9Jt3RqcgZI5m+qsIicCN6bYtW4rbmnHwHBlAHbl94DtG3se0jYfp1lvpeCCpEC9Da3jey50EYcaMShgxuUEjX3hEdsgoW65mSIIXwxHAYoDEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787486033; c=relaxed/simple;
	bh=/t5b4apjuUqazPmhw90ov7CghXz1Qkh9CYOJwiCV1OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j8UFPWDFSicQQzHWad+JqzI60BmfWYEXFbqObik4NbVyvnYGk0IcUIU+/wzPR3w/doBDjSqRAYkMvQmBLDhVUQ/1jjoF8TiDx1MBx5NREg+v/9SRea3wjmWttahxvjbYkgqJMhAtzY6pHaxu0MVFLyz+CwUanVJCITrZEdEkiTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-495590dde14so20667075e9.0
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 04:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787486030; x=1788090830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJkLdfWqS4G1xdqUVtL2U3xbkMZdjpzIyL7R/rtgSKY=;
        b=YP7tTDzalfPqPMYzJb/KVcxNviblHODcVcJevJDDq+r4lN/9EuvQqj8p6/TEOAhA10
         vWpwxJzCWBAvrA1EgoUmlYWeNZOGjklH4VenFlEoVgDQ57vAgc1MoAZ2JWPB3oUTO8zg
         OVizk1VyewKU+4tPwlNwAgqLSjNGuqfBvoYAjtaRjbDLQ+7HI78Q+diyLeQ1Qt83foQk
         rciUS0rbZvx/bzpdwMTyJe+yrvZwqIbr5yO3GD4tTtL7MYjV859fSS922YxKgrdXSFvH
         et8xEUvXLTTARnWZhSKriIqzHJuWGcK1sL15k2P+LAy6/jLU5Mm7OY5wTHXDDvzhUTyZ
         LJJA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9Mi+74l2kJlR1cRYSa07zPGd2R2HIqCz4BBv1z3wpqdjMG4HacQMgzMHhUcKyB1tPCKtLsOH5jkYH@vger.kernel.org
X-Gm-Message-State: AFuF++lJa1Qp1QwAIic3u5QvYxWjwoqEbdkf9LrzCv8uMzobLe9J944l
	yq9/c4JhF4XOCJDYjcxHvbJuVsF6JxXJKsdUmSkMZcm4LJL0RAQLkNQa
X-Gm-Gg: AR+sD1017xeDj3ep2nqAIxvPoLjOUoHK2H/zub/m+0oxF541guCE7eHnVwGPSx745F4
	VXz9fHRm/IWaMIPmxT4W3EydjnzWa5OOV+0wfIUqBqAeqvMyFoOqEKO7IN3RXzgeOy1bvhwWFZ9
	KJtCkALUMpqnZzBC3K2qeBDuVvHnB516pEr/AFl0uIYV6um3O5vgPhsn7AfOboeW4z8wlcyIqaS
	hTOdQGRpNs7RGXTRAsdFWapePnefkyFRZ7xi7rBrGfcrVSh2/RkobNbby/FDaNa32yQV3GljFU2
	3hQw3u8rShqHFhccphQTiNhscy74HKcxMhWQOHU+dX6fAJ0BhwOe9wnJU315TZtjLbZZbeXjIKU
	/19sagZMIf+XHdyYvkVF0csboDaYqqJLZ1JlQnoeeu7uDndcz5rQgxcacaHzp1lcTGG98bfdxOs
	90xZKSFCSd3pnYNBqWpJBjXT8KLAGgMvXz/XmiFY2lqJnur8EtQjZ8DpoXRduf3BZSmKZg3hETo
	zmJLaXlKk8C2JkEOXaglUSU8blq/tRWkS+Wqw==
X-Received: by 2002:a05:600c:c08f:b0:499:be9e:49c8 with SMTP id 5b1f17b1804b1-499be9e4a32mr134720045e9.13.1787486030111;
        Sun, 23 Aug 2026 04:53:50 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c355e1ddsm48680935e9.5.2026.08.23.04.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:53:49 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: amlogic: t7: fix UART clock and SD card recovery
Date: Sun, 23 Aug 2026 12:53:33 +0100
Message-ID: <20260823115335.102219-1-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fixes found while booting mainline on a Khadas VIM4.

The first one wires uart_a to the real UART bus clock. It was pointed at
the 24MHz crystal as a placeholder, because the T7 clock controller
driver did not exist when these boards were added. That leaves the real
clock without a user, so the kernel turns it off when it disables unused
clocks at the end of boot, and the board hangs with the console gone.

The second one drops regulator-always-on from the SD card supply. A card
that refuses the 1.8V UHS switch can only be recovered by removing its
power, which that property prevents, so the card never initialises and
the MMC core retries forever.

Both were tested on a Khadas VIM4 booting v7.2 from the SD card.

Changes in v2:
- Update UART clocks directly in the board DTS files instead of moving them
   to amlogic-t7.dtsi, as &xtal is defined at the board level.

Lucas Tanure (2):
  arm64: dts: amlogic: t7: use the real UART pclk
  arm64: dts: amlogic: t7: khadas-vim4: allow the SD card to be power
    cycled

 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 +-
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

-- 
2.55.0

