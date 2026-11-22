Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795342686;
	b=0eBYxJCZCXhyevGHd9Gk4bq+PuypZgi11vgf5KIYpHpvpVbPmheO2V7Q9GBHnoLGkwet
	 mHmkqy+s/BMpqnUcUMvLwI1XnjfYZVSGiJ7GnDDEE6vhOIp88TL4VajlSmaIlxdMu2U8V
	 K7Me4M+2F/YT9OJ2KnmZibumLSGvlIRGoDBAv/2JwN1L91sRmonlKemHMH9r2VeoksHO6
	 AVPy4uCDoJIBTPbGWjY+WxgUBn0zxHy8CewV09on35F0dLp1NM5gz+XPlIVxcxHXx+8N5
	 vrui5exUvHro7pQSxngv9dDlSjMZKE4bxanLDWGHheLeELgMgO3hcTiNJwrXsnt34AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795342686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=99rrteyPoSG7Ruj3FSoV0/w4v3L/FLRH/ej3uZqOdyg=;
	b=UzaKwPcCvwYPr2CcNDUtCGjsO7DjF8i0VO2iQT2zJFKQo7+JlR96h0rAZAmRHQM6T1la
	 idO2tghvnjqhINi7eV20yVGGO/H3BnsfoWQoRmagRmgRb4JOhYO5iBFz8nTZ5FtvSzvss
	 b/1xCd/dtaXq2biCYZz0/YUhY4zFjHAvUQyi9ZrnabtNgu+hU4O2BJ8xZUF2GSeWCRM/b
	 HzgiIL48M3fZ/BZUgg4gbWuIGOtsN66esIcshzRYLslkXxHqwfkAd95GeJY/HkpM6lq1y
	 p3WqMJU+4W4LtRg1FCc5hiUpdVu/ZaUNnxy7p5SC/tofLBpCKU04VSS2uquSof43myQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LsaLevwP;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A06606A32A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 10:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98A06606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LsaLevwP
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cde7e8abf9cso381229a12.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795342685; x=1795947485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=99rrteyPoSG7Ruj3FSoV0/w4v3L/FLRH/ej3uZqOdyg=;
        b=LsaLevwPiy2iGPitCATJAUiD78mKdSXjEWwxnYRPyArukX/546ZPlAVgpd64YQ/Vz8
         CimilFbUE2IC/PePLL0IAk7JaBcJQ450M322LnwC8RltQOlCvnxtwXLVMMG08WCS9Y1x
         +Zq9cOBbnQFjv0j015FGkFnMvNnFOsXe2Fk4gc40TaHO/3bbaWKqro9ieg2h/gLdwKub
         URxsCaUWPzPo2dOWxSC2Rx8ErsSvB/LkKlpbd++psZJcmiwp6eVowsIPSWHhImYZVVbA
         bxakW5DeOAM72Q3QKXsCyhDYsKf15xehPNkVLiMGRcVQu9Z28FzgOvhZMb95ZSHnOWYB
         kYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795342685; x=1795947485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=99rrteyPoSG7Ruj3FSoV0/w4v3L/FLRH/ej3uZqOdyg=;
        b=dlb8WBvDI+tkkPbNB+6XoE5DYI3m+oBZ9SwbNSiDqzKQ+Lemb5cOIhd5Ki9CnQXp5D
         giK4IYWrF/2r9r6WzwL4lYKShLA1rWP/8pLO2mQgrfO0+MEnBswN4qqxJTskJd8HwvsS
         /dIGFSQ/coqUZviYGGLP5khLFuIOT+H+xW2aEOHRLBfgAzfKg6vHo8vHoYSeqy2XJ4n5
         ERGxXX4anPeND6ivTdkWjPvZS3ETUQfXBmQkmPP7YCw1vfVYhTIcoXGApoyO0oiMOZHn
         K/Kr855bFxkoUBFtcFFMnCOMj3Z1hqajW9eJWyQHxNjiEDtiDkta5uEtSw24yI18uSkT
         FK/A==
X-Forwarded-Encrypted: i=1; AL+hErFtJHm+UNksrz51vrlybSGnnkIIFUlmBIs+j170cJ9BDk2EeyC1sA8BKJFJMymel0WcloC6LaJcMvTR@vger.kernel.org
X-Gm-Message-State: APuU4Z+L42ve6/b1GfYLOO6kPAe+FYYB3A58+8fpX81rO5zQpYKak3n2
	uf7oiBOOmkYhZlJ2hubXQcb9CWibdzv/b/imtpjcQxT3RxyAuStiSgu2
X-Gm-Gg: AZFdTZfek/wVmTR59+3+4dtTJ0XVcfdoEV+AcFwr7XXYLs8lgJn88B3CiHdMQ/7ACX4
	hFTO3BUU+oBLnQCflJjkrtXFARanO8OWwvj5GwvGeqJTqa7sa5XyR8iFc+ZAMpifdO5o3xVzvCd
	n5dwfGth2d/UbLMgDA4gj0MhpCqjMRSypknfFPieaX6njLI2yBhTcszMmrQIB+x7ViV6IG4QE0O
	wD3ABAZp7EP3WPibnbqJ6vvwumGI/JkWkJOjASXol16J50+yh6INH1vIuvo7z5crWKZ6Vx+Xy8l
	FI67Fk4UEqi7e2JeiDeOXtgNhlnLxsJuh1r+EuMY3PO0Sepe6DYdaOgR1dTkj7WRHAMFr0XZwSm
	WcAEldUN54jQsgxOu7JKnA7QZXtn1wF0M0SNRWuqXk8Q8GyvoqUFm6aFbZV5tDGT+oX/nM41zA5
	WZ9uQcusyQRugKoDthQlcoyejKk/pb53NqP8eoH3RrztWHbC5T4CenoN3aP2u6nBE+wwrZCXL18
	IWUlcmTyvvO1NIaexKVcR0pwRdd3BryScb1CRkgQBSggNkVExZ3N1Wi5aWc2XifZz4jD9Z2zdJs
	DtpICWu23ze5mapCOEQN0yW2IXPP66TVGenF3x4Lfi7xh3qaY+c=
X-Received: by 2002:a17:90b:4ec4:b0:3ac:7116:434a with SMTP id 98e67ed59e1d1-3b41c900858mr6907329a91.15.1795342684858;
        Sun, 22 Nov 2026 02:18:04 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm14953787a91.17.2026.11.22.02.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:18:04 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	robh@kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v2 0/2] ARM: dts: bcm2835: replace deprecated LED fragment
Date: Sun, 22 Nov 2026 04:17:57 -0600
Message-ID: <20261122101759.206056-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122095225.200916-1-artem122novak@gmail.com>
References: <20261122095225.200916-1-artem122novak@gmail.com>
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

The Raspberry Pi Zero and Model B device trees include the deprecated
bcm283x-rpi-led-deprecated.dtsi fragment to define their ACT LEDs.

Replace the fragment with board-local gpio-leds nodes, preserving the
existing GPIO assignments, polarity, default state, and heartbeat
trigger.

Restore the leds and led_act labels to preserve the device tree
symbols used by overlays.

Changes in v2:

Restore the leds and led_act labels on both boards to preserve
overlay compatibility.

&
 
Add commit descriptions explaining the purpose of the changes.


Artem Novak (2):
  ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi
    Zero
  ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi
    Model B

 arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts    | 14 +++++++++++---
 arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts | 14 +++++++++++---
 2 files changed, 22 insertions(+), 6 deletions(-)

-- 
2.56.1

