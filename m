Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7990130E858
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 15:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785771434; cv=none; b=tBHqgYXRv8DL4g3W/RX3Cc2xFCXH92s2xJ8kJoueipwLPPykZ5mRYcWORjOtXtysT3EXL29sVsqmJrmw4qseaRxmfVY/IMbv4DhyjhffWcD0lN36jJLaCLapwuile8V0Tx8OYbygToGoGZdgDdstvnH/9kN0ryINA69jRPUxSb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785771434; c=relaxed/simple;
	bh=7ITo30yVDRiyNeaOTza/RVMMjSQ4GUAnzLxiGkDOBH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YpMLotT5ZCaIN0EnL4l+0tLWZbKLzFS9H+hFHaLV5JqHPfQUvqqMLq2vOAeSxVUkUE8L16YcSbHekobAHPCeV65o9li58IKcGgh3BQWv9+t6uXKrSwqGmJNVGdaeJ3KBPxAyuFNzddBheiN4KEQVnXjBiWTWpGWRHzbQMHkF/gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYeVSOEg; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYeVSOEg"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49802c418b5so18299595e9.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 08:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785771431; x=1786376231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9JR+n4XOC99wox2307V3vRuKtHHH2tWYkjolStlp9b8=;
        b=iYeVSOEgVAr2zjv7iShP8WQWc3wrpPzIt+3EQ/vs5gBwaqz5O0bj7fALPcGBjc+p63
         Dwznw91rcFO0UHwFLyihB+lCNGRRgv66CMEk05kSv8q9maBwFXYm3/IFzQ+X+fe/5hha
         9Zhr9Eh3HZXXyfguAsii7avBKsB4L1kLgxmxU7mVQQOCa8SaL6Yef5/Ds0gQwPzlsbvp
         J18MrgRI+4yfTzfU7ZS5qpa26s9dpL76yHBmLnyXSXAKKwFCiEG2ZpwheR+1A5OhuzTu
         Ee82J6qo4zPG44CkdUU5Ze5db6J/+D5fd4NUkhhjl/KWvjOb+skPkP8mQeQqlvsgpBdH
         NXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785771431; x=1786376231;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9JR+n4XOC99wox2307V3vRuKtHHH2tWYkjolStlp9b8=;
        b=DEm916vjv6ODEMP+d0Hk4J8ua4vBErpjImFdnF1FroeYlfNmawPPHQF2YelfXtgdhP
         ik2J4MTdIkhTcxj/r4swOZfR/BYAQopiRIBASLXoS6UdijSk8gyb0Vvg18+/tiks7uTW
         kn8MW7C81sdBmpXeIVVBbs+B8qmlPOGT4jBa2QXekkSfygeiEK5h4IEOHpb/SjZ3h4e/
         8+51eWA0h4/3y3VSv2EXz3iVCqKi1pVIbPFzOpf2YO0+F+C6BmWgl3g5AOGj0DORus45
         XWQU8JZTqvhknrF1B461J8zIfbGm774G8wgLyEyFU2n2Eppqn7g4pX+rUHFBj9j8teg+
         VtKQ==
X-Forwarded-Encrypted: i=1; AHgh+RpSYVealA7HNMCxZnFPuXn1NiqCFq91jeIJwzTunYkyCKXGDCIIj46rXtPC7roshmvlLsgjk85947Vm@vger.kernel.org
X-Gm-Message-State: AOJu0YwlcOsPf9oOhjGwa/v4la/lAJNYhCsO8jny0AgKOPNAIRZ5R4pK
	bOWmO1uw751OEtuX8fdcx/d8NA7vMA28SENGFO/mZruinVKpsBz2/Yvg
X-Gm-Gg: AR+sD13qO7J63ByjcWa8qlYZfPFFt5RLc/7kE8p1AVriWuClSLM+wVdfecOcivP7zxQ
	+YrHxQIMA4rJQ0U5jc6OwSums11Kj1rqeSk/XlQ/hqTmIvYd6LWo6TAxMPPyAwANyyApyP3iAVj
	JedwyJ0P5k+ypXPAQHu7rGS4yU4FsXrOP4F/fljq0mv4qaUOpS4R2DXIIQ38sFa+hkRi7bosPFd
	kQ8+PV1r5gAU1J7wY1Swlw7IQPLupNKDG3xSASG7O8+IRSxhDUBUCArjTexhbUvKIKh4IAvxohn
	YPOP8qrR9Gv8xQ1fEXLMv0/UmDj1xrGMhJDA1j+fRUlDEHVD42+7Ns16+lns5UmE+PILL+BrBbd
	HQohxBzpWnjCmJE5az0Rf2ha28J75lLzhVWq1n/9McV+m5ohxCDTNPeU0r37SMny0Utmp72xXu/
	B1ncgfp2QxULD+FJ4POw4IF4mrC2t7KxbSgeCBDRPPS757Pg5f6xTFdWvuwwpOcVKBiZY+fJRFw
	7yNT5gOFIsFahAcvBfDA2o=
X-Received: by 2002:a05:600c:c170:b0:495:4749:16a7 with SMTP id 5b1f17b1804b1-4980c673ca5mr280126695e9.14.1785771430446;
        Mon, 03 Aug 2026 08:37:10 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc6d82sm751455e9.1.2026.08.03.08.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:37:09 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: wens@kernel.org,
	andre.przywara@arm.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
Date: Mon,  3 Aug 2026 17:35:19 +0200
Message-ID: <20260803153519.262827-1-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAGb2v67CGcaQmSz_tTbSTQ7dzfCV2+7i5t_34iHKmyU05h-yRQ@mail.gmail.com>
References: <20260721223956.13665-1-andre.przywara@arm.com> <c539e5c4-f21e-49a1-b0e3-d35f42893fc4@arm.com> <CAGb2v67CGcaQmSz_tTbSTQ7dzfCV2+7i5t_34iHKmyU05h-yRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andre, Chen-Yu,

> So can you please double check this?

Checked on my Orange Pi 4A (T527, GMAC1, Motorcomm YT8531 PHY). You are right:
PJ10 is not needed on this board.

PJ10 function 5 is RGMII1-EPHY-25M, "25 MHz Output for GMAC PHY" in the A523
manual v1.4. The RGMII1 bus itself is the other 15 pins (PJ0-PJ9, PJ11-PJ15),
which mainline already has. My claim came from a stale comment in my tree, from
when I was chasing the dead RX. It is gone now and my rgmii1 group matches
sunxi/for-next. The Tested-by I sent on 22 July was already measured on plain
mainline without PJ10, so what revived RX here was your withstand fix alone.

> Those settings differ from what's in mainline. What are the results with
> those delays?

Measured on the same board, DTB-only changes, TCP for 10 s per direction:

  A  mine (rgmii-rxid, MAC tx 100 / rx 0, PHY rx 1900 ps)
        TX 0.938-0.940   RX 0.929-0.930 Gbit/s
  B  mainline delays (rgmii-id, MAC tx 0 / rx 300, none on the PHY)
        TX 0.941   RX 0.929 Gbit/s
  C  the Ethernet path exactly as mainline has it
     (B, minus motorcomm,auto-sleep-disabled, minus PJ10)
        TX 0.941   RX 0.929 Gbit/s

All three saturate the link, with rx_errs, rx_drop, tx_errs and tx_drop at 0
over roughly 1.6 million packets each. So mine are just other values that
work, and I am dropping them in favour of mainline's.

> ethernet on the A523 has other problems. The performance is really bad
> (even RX), and there are errors or packet drops.

I do not see that on this board, not even with C, which is mainline's Ethernet
DT unmodified. I also checked the YT8531 auto-sleep: the first packet after 5,
10, 20, 30 and 45 s of silence came back in 0.21-0.24 ms, no losses.

The kernel is my own 6.18-based tree, although stmmac and motorcomm.c are
stock, and this is one board with one PHY. Chen-Yu, which board and which MAC
are you seeing it on, and how do you measure it? If it is another board or
GMAC0, I can try to reproduce it here.

Cheers,
Juan
