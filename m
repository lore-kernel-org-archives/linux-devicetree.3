Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCE947C0F3
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934594; cv=none; b=McLU2Zom0h979g4l7ycwq0zzLDKckL8XOsfwPNIfyuMIsyKzajAjzal8z7Xm4Orl7M/2GzAH0nOf+iHW1/bxRirXDrrfTh0x8mSzoV1HGyStCWqEErVRn5CP/uK7Ukkg7vfFzDZID+7ajJ3qnK42yeIGlaSJYQ1NuVWaBJr1qMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934594; c=relaxed/simple;
	bh=cSMKtHhDDIrlu9/TZiEcgG2pQVjTFVtall/R40Ims+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PF1EvNahkYU5+vJjkExr7Gf6PPGvFzXtHTjgugLFD2WbKTh3mN+5NKVcxtsX8po+bSP6NqxhAjSZusc7HgWHXkzWQbSfez+dQBdKlYOhBtVcpYwSpgkRJHirMk6V4IpgL10x0id4yymwY1y5VrGwl8yLkUu9eCjgwcKwWH9Uv38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=RjT0BpcV; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="RjT0BpcV"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a022e9cbebso11477875e9.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 02:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790934586; x=1791539386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qtlxzGADVLpRg8uWTI/BZ9pWlYGLrKbVbyi3KlCt684=;
        b=RjT0BpcVCkKgNvQy0BrMfBVvYalTZXVXg56lB07HNdeU83RLXpowbRq1itEJbe/HOs
         3A7E60NFQpfQkWreeqi08HUiD4tIvSQvBtQ14Ax8AKgAcUGw+zn25IG9onYxB4f//Sd9
         5uzB4A9XQauPmwOAa1RPwN/hw7XIE/wD04pko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934586; x=1791539386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qtlxzGADVLpRg8uWTI/BZ9pWlYGLrKbVbyi3KlCt684=;
        b=B+Y5OekTrXVpR0VMKIkC1uAwMJguQkzmBEjvAV9IBJkFhF7YMmxDurXITfINdUSqnK
         fFpTEILRQ7WaxIo3+kKfMDWvI52bW01cJ1gFycn85upToy31D0lN/5GtppAOdGfkF6af
         AM7BwTQKCSg65uuAGRY1o7ufYp/EDimq3sMr/eX77whrIgcXKdGmn4vipOMGyygU+DVF
         Hkpn/C7zaGiuoFfrR68Oe/ph0u1e4/BuShbr62tUxs1SqiGd9n6o54wbHg9HAztoDMMq
         +f6hxvY3nTLoGOP6m43ogQv/5o7KRuXJHe+WBZvjRYCsyf4c8PUiRIGZS1KvAfT0gTv3
         idYw==
X-Forwarded-Encrypted: i=1; AKwUvBzKBJ0miTuMNiJPQuFBXeT0aTBYoehSLpjrv41jHxNKKDcpNCcGwniaNwJk0OM8TWzJd0UGlOVOCqKR@vger.kernel.org
X-Gm-Message-State: AFuF++nCI+aBYrchuZ8KkyBoke4TGAQ/91gDiGYizx6Lap/fiOpotQfi
	fm5SpRxx4SZ5fizNghaJBG/cz20dyRF1iJ573RktGTRCxkQebppOdfaLdMurhvrfx6I=
X-Gm-Gg: AYBFou21lSaOtaSavHRkZtUDpNTJs3K4gfQf08lfccpEpUWXG2wKXDRAMDGc5pXDA2g
	ep2fSh5B0xxYYOYrcZ4PW//T1ma+7//CqSqldl2uU6xwp+pi1o+OtBuyU5jYDystU1kVzYOA//Y
	3JD+4G57F48gDtc8Eye+tBY3qPhwnGvrnOmFIPp638qGJZtVLZ/heySpxJIvEy4P/vCGaT46vhE
	Lq+OgM4YG04JtuIWSOhCN35iCRnckTPyb9u3WBk0vKR455FxV7EYpKY0CmJt/Y1rpElHVxS11o+
	k4y/VLafA8w2WJKbi/z/+xJMO+TgsdGuELpcpFENtLqN6TB9FgBtrUfPSrJ8h2mJnnXmQB7DHRk
	HMrjtY4IXtnIyHiboRqHNb2FXIzY6NKZnXtvdd+8OaCdrZF9+w04bgiAVoJZqsGeGgFDOCSQt1h
	79nUm7QjXb2ysGZQnNwIHsHJ7SQQnexJIWg8W+IDSwtS2E3aTRcl2HoO/ncG75RYr4mHTkXSvr5
	Fg=
X-Received: by 2002:a05:600c:4e55:b0:49c:c0d4:53d9 with SMTP id 5b1f17b1804b1-4a02755a141mr40643525e9.14.1790934586627;
        Fri, 02 Oct 2026 02:49:46 -0700 (PDT)
Received: from localhost ([93.90.163.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03fef5950sm37281695e9.2.2026.10.02.02.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:49:45 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 02 Oct 2026 11:49:30 +0200
Subject: [PATCH 1/5] ASoC: dt-bindings: Add ti,pcm1795 and ti,pcm1796
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261002-work-v1-1-f0e53bc7331f@amarulasolutions.com>
References: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
In-Reply-To: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Peter Rosin <peda@lysator.liu.se>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 asahi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>, 
 linux-amarula@amarulasolutions.com, 
 Michael Trimarchi <michael@amarulasolutions.com>
X-Mailer: b4 0.15.2

From: Michael Trimarchi <michael@amarulasolutions.com>

The pcm179x driver gains support for the PCM1795 and the PCM1796. Both
are register compatible with the PCM1792A, so they belong in the trivial
codec schema.

pcm179x.txt no longer exists upstream, it was folded into
trivial-codec.yaml when the trivial codec bindings were consolidated.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
---
 Documentation/devicetree/bindings/sound/trivial-codec.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/trivial-codec.yaml b/Documentation/devicetree/bindings/sound/trivial-codec.yaml
index 9a35dfb17349..a24a21c855e1 100644
--- a/Documentation/devicetree/bindings/sound/trivial-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/trivial-codec.yaml
@@ -36,6 +36,8 @@ properties:
       - sdw3019f836300
       - ti,pcm1789
       - ti,pcm1792a
+      - ti,pcm1795
+      - ti,pcm1796
       - ti,pcm5102a
       - wlf,wm8510
       - wlf,wm8523

-- 
2.55.0

