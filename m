Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694824;
	b=XtBQfXyAeLy/RUmkHr/Q/yFQePEr6B1rq7byX6e2PkkTFHUEfSi1ihVzLFlonOf7/T4+
	 FDZp1eQCca+6/vA1bgbOTTsEteVEtzw5l4kj+ONxbhWXRC3bYqikCR18Ug6aEVdnc5eWA
	 qfPkloyjs4Z3liKImgYMXGPzGx8eIIg7+ZcRsWtCUHKzoMrBAuq324Pv5HO9xvvUIm0lG
	 roAk4T3mSz2lCpH19BkKuD0+nBWKENfI5SlCtKK1Fx/f4YM1DrextQK/U8TNfJHR7X5wg
	 8ET+0Wkqk9NPhtIYEO463IVzk+oFRMY/oR6ZxPWrOtjfUU6G7SZqhXTVM8jcLGSRU9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dfUT22bku5FLHKqPn9/1kA2CO+HAUQbPG++n30nYh30=;
	b=RyFU+i+ikJ8gTTwhGP7KPqbJcHd11OB/Fx2ejdN3qXGXaEv/szuBUmPbntGCUGoy/5oi
	 pKPx/tv5SLBnl+hlZiVnU7ksGRFz4bGPN3wU+MKa9gO4Vc36bUy5e/D23hAaUT35mIQvb
	 aP3BYPprV4odzTz6MW4jhd6UYjOjoztDcr1w008/mdgpcsi/54AKZOOUdtlX1VhMTbRkt
	 yNF3Es3iGkgEKpTJ1jX3nNG96huIuPxZQX8eJvPcpXFj+1tHgASZbAbZAuj9oYyemkJ0j
	 7LNFkP8ag1NTYg9fM1wvgqSU7MRbWa08EveJvjw/0S0EYgKvxkBtRJBxrer4uWcad9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CFGkWggt;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591BF6085091
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 08:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 591BF6085091
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CFGkWggt
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso232881a91.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 00:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793694824; x=1794299624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dfUT22bku5FLHKqPn9/1kA2CO+HAUQbPG++n30nYh30=;
        b=CFGkWggtJiqKgcI8kguVGVePPB6mdpn5iPMSh48EKxF87yIus53FzC5tAPA6+k2AYq
         D6nXgSTyCtLnaYfmuASU2SaILl7s4mtJkAZ60eFkyJqGbM+8ZbLjlry/HJtbCmoNWoTr
         WVlARKkdEgZtB+Fl2Hqyd+dKhbhXKJafbjl50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694824; x=1794299624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfUT22bku5FLHKqPn9/1kA2CO+HAUQbPG++n30nYh30=;
        b=nKvRJqJMGAQzBxpfwS7E7HRldNMpgRK30GwlLD5RpI+PFnnRN30BLc84c0h1cOHxPF
         AR1VNitebhNZwULvQpwjeDU94XUUptZHV4Bxi5zI6CZc3AEhIjp8WYYWGDvh0bYVHS18
         FjOoWT8hbvrY4dFJEWYLmycDwtwwMZkaG7PnZZDOR5TUwyFWjrURhnQC/ZSLbstUOWiH
         Hg5n+RAaqplp+SkjRxsBndy1gsiduh58oyqtf3fCbxW5RbomG8Zf2+MR2oY7z6NYmOkS
         IYDHL4MkBctVRQ6vMG7m0ZkdG6OXnElF7KVo7+L8CPzdjYyjlYROb3gXfXJBRLSFQUDf
         AYiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrg91Q4KkA7kMlaAJxWHriR7+pIrka/vkOzNjD0/nF6hOiRPv+iS55TS2oXoDzpYvjSnUNatihOR7q@vger.kernel.org
X-Gm-Message-State: APuU4Z9PorTv5Ke/HhEDMaHMZ3PFs3aOnm2FdiBcvvFIPWf5CUhtq07E
	GZSPCzBsr/dErZMIIr6zZ522tSwhuMp7VixsytcS+jbRe4OxxVAG6N4w3ONtDXud2IRCSQXjoO8
	gXtQ=
X-Gm-Gg: AYBFou1KN6w90fiTZ0rLU+cTDkbBHqJgFbe07nBaW8zxMSTPo+TpTbhGENUcnUPFka3
	dhCd0KOtO3/NBDlIIvsLViDyYAdm/yggqUUrOhhu0IERYfHGQmJ3OSAMHQuueB7c025pA2MEtrV
	I1fzedh6d8VnQJek8tUAQ0+gEDPMfDq8oirgU4tktVgOyL96KlxihnYSZkkg5YTflUoBPatFM0k
	uWy32+aNNrTY52g5GUHSV1TEg6UwvT9oB2UmciHDSHch2B8q1TNjESlE6wMLbVXHDN7cS1Gl0F8
	xhAzNYo9z2fQ+dGXTEtvmWndv+XMhp38CLbp5gaTJ276snLxjAj5iGuHnD34KGmlOqqa4REUnIO
	T9OvcxlNvV+JNa61AbMGhObgAdOWXtAJs2UqRlZ5mY6cMmqfssPiWzLTO98oS3HdcU/7B6rON+H
	p+cJhgJ0KiMOHwj30+es+calBPYPxSD4CvCQ7vSV9+QjR3HmC75fu97GVleIStOzlNRuv7ixFwN
	rN2UIxK7mta71qEzK7Veh/QMjwt19iXgM0Gv/I0bkvbk5ZSOSMOudOlwd8EBuwDbI++OOpObqVT
	FZnX+xuWbV0KmU+gafR7m1DmTPmMDJFfgrrfX87xLcKmvy5eiofvNmRkg8vX+yYpBJOcnT7Ka4M
	l8qtlQ15+FEKSxA==
X-Received: by 2002:a17:90b:1b0d:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3ae89776936mr6781818a91.28.1793694823651;
        Tue, 03 Nov 2026 00:33:43 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8329afsm3192790a91.8.2026.11.03.00.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:33:43 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: mediatek: mt8390-genio-common: USB fixes
Date: Tue,  3 Nov 2026 16:33:31 +0800
Message-ID: <20261103083335.2944847-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
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

Hi,

Here are a couple fixes that came out of the MTK XHCI binding fix [1].

Patch 1 corrects the USB type C operating mode (host mode only) and
graph connections.

Patch 2 moves the pin mux for the USB hub supply enable pin to the
regulator.

I don't have the actual board to test this on. The changes were only
compile tested.


ChenYu

[1] https://lore.kernel.org/all/20260916075745.3549953-11-wenst@chromium.org/

Chen-Yu Tsai (2):
  arm64: dts: mediatek: mt8390-genio-common: Fix type C port mode and
    connection
  arm64: dts: mediatek: mt8390-genio-common: Split out USB hub enable
    pin mux

 .../dts/mediatek/mt8390-genio-common.dtsi     | 57 ++++++++++++-------
 1 file changed, 37 insertions(+), 20 deletions(-)

-- 
2.56.0.385.gac671c819a-goog

