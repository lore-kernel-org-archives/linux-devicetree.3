Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7CC394783
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 06:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791268970; cv=none; b=tbuN4eeEcESVN1lVOhliSH7/V5Bacw4diCaHfM5ZRAu9J7vHG4RmWje0rQQ7hW9Po8eibwP3xszBlpMP0K37ikg3M6DEwLqDclce2x/Zhm92+Tt0a4LfjEYJgT6KHemplfKNMpXRQjkFml8D5BWD7KRqpSeQIQrYJa19hrCAHNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791268970; c=relaxed/simple;
	bh=/89uV7ti2K11U3cB31sSgf1JcllbYfkCwr4VKRFLXo0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jAMd1qeC/ekk/RgzGZeWD8pArmHC2/5h4DdZYy2TTZ3fxxbtuUXdXuVsqTAkQdEYhzFzbwb8NHB2skapZ/0axfR0/nI7mQKcyBDAIVo5TtTza+l0rWqPZD8z9CNv3re7HfFyKwubq87vreloV1i0lQTD4G97WT6/afReKExh3QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0c29tWA; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0c29tWA"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-34ef8f66a6bso327712eec.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 23:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791268968; x=1791873768; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Jj0M0FNSVgErT6nNNDG/5xniUjNErRGkcSo2LLHcxBY=;
        b=R0c29tWAF4PalyEtX6wbtcrtPBAISA3Z2010/RluzMRWqM6u+lqKDilUMd+YY31CFh
         pa+FSiLRvdNtis1UUHNPZW+cfTvFV/GH08FzQ3ydBYB9StfBl7VMm+VNlLAsF8+0mqho
         9F9dpVsOhUWVnzzYFKWceItUygfEx7dhgcJWDvDQ2RkQ7UqgR7ouXmxFbKhNiPKocLZZ
         eT9Y2k3btLHfSFRgaGXNfT7mje5VidLv5dE1AoFyoqfP3Y487ImCiTedqDRQ5sm9B7l8
         1+/S/az4xetLIopzXCDTtUMfdVE5lX145MAG5N4j//YiiKKErcNFCFHavLhlnTnZ6Dj6
         23Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791268968; x=1791873768;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jj0M0FNSVgErT6nNNDG/5xniUjNErRGkcSo2LLHcxBY=;
        b=DWC1k9F+GlIx2YANgKpAeAbw66d3/kw2JU7rUs5XH8Z1yiYosQdS4bAqqnDgjd4wBL
         /1s8NaQSvTj9gTWMwi9OcaUhrTpIZID86m9uKl0zrwSCi6DwWAz8MEWWPS84ws6p46XS
         WaRq3qnSaL7ja0rATIeTEmkRwW57da+KNcWwdSn9VerzvzaLBXhstizMkW2oYumuK3Pr
         ZxlbWWY4ZmxwvjC8zHWM+qS7g6rlRGeLpAZHA99WXeFrkQnzboE9D34HC+6nB8bMCBOB
         /S8CmI9N7X2/rOMxyvjqZDjJEnBpXCi3JzmRsdI/Juuk0/dybiPJG9CHVzhzUrhQQR+y
         3Zbg==
X-Forwarded-Encrypted: i=1; AKwUvBxO7VocJDoQPRYGANwv31AhBvycXLksNve7+kOT8X/l55TE1En6C7R89WqxpRgqikfa7Yr2E3C2xJNB@vger.kernel.org
X-Gm-Message-State: AFq9FYI9LE30/W6WuYyTZnKnaV6ApVue33zEa+55zWfcOY8ZPYpnX+J3
	cjNGvOYODw815AKfKjB5av14kZIeJi+mw8jXagq23IXqGDgBcvzzaAJP
X-Gm-Gg: AYBFou326I1fjCB2XtjEPaN0JacjsyZ+hmQpZio1UYSX/HMikOtEwqv7Zo7Xll0D8yh
	v602scyiffdGF4tToFGOQpVxUeiYd34W+TmEzSCAbkkVpYtI39DxPtEkM2cx/ZPThiVYj1wW5Sz
	8j0am3dJvAyDr36bMvpbRzLdKrpE4ShqXdPBbRRRTBrdc4UA5vx2UH6vvYhDbcAvyLzacHbHUCV
	f3hx5hiiiG8BPELXSjyYpf56ZQ9ll1lnFZmYDPyEhzQPl1E+uWQsGpDLEfKjjP0dk5W8bEKG2Hy
	BXb+3H8qygO3e4OJriVVNmjK2potG+9PJOMfoaS1vtOSD2J6d8NGmzVMM50Kd4I+7FcuIKTcJzX
	xPLLbKQhUrYqn1WfSl/H463svA9oFI68o7oK8cTab4Y60M62A+IuS/kyBGW0OJMevoTop6HYiCK
	uuoxYrqZitrzb5TuZMDY0r1UpiS34+mznwkmsO1p+d/t7b1CHT5ntE5sZo6L1fMeLWl6+PkdudT
	4MBKufT
X-Received: by 2002:a05:7300:3e8a:b0:34b:fd9e:ad4f with SMTP id 5a478bee46e88-3514e314fbbmr452029eec.22.1791268968324;
        Mon, 05 Oct 2026 23:42:48 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:55f5:25c3::3c3:b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a2c991sm4617347eec.14.2026.10.05.23.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:42:47 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH 0/2] Add MT7629 RTC clock selection
Date: Tue, 06 Oct 2026 14:42:22 +0800
Message-Id: <20261006-b4-mt7629-rtc-v1-0-e556386df816@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQrCMBBA0auUWTvYhpA2XkW6mMSpHbBRJlECp
 Xc3unyL/3fIrMIZLt0Oyh/J8kwNw6mDuFK6M8qtGUxvXO+Nw2BxK6MzHrVEHO00LeRtGChAa17
 Ki9T/7zo3B8qMQSnF9Xd5SHpXTFzLeaNcWOE4vjjXKlmDAAAA
X-Change-ID: 20260926-b4-mt7629-rtc-7488fa94b1ab
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

The MT7629 RTC mux can select the 40 MHz crystal divided by 1024 or
1221. The integrated Wi-Fi needs the /1221 source, but the clock
driver currently exposes only the /1024 source.

Add clock IDs, the /1221 fixed-factor clock and the RTC mux to allow
selection of the approximately 32.76 kHz source from device tree.

---
Chuanhong Guo (2):
      dt-bindings: clock: mediatek: mt7629: add RTC clock IDs
      clk: mediatek: mt7629: add RTC clock selection

 drivers/clk/mediatek/clk-mt7629.c      | 7 +++++++
 include/dt-bindings/clock/mt7629-clk.h | 4 +++-
 2 files changed, 10 insertions(+), 1 deletion(-)
---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260926-b4-mt7629-rtc-7488fa94b1ab

Best regards,
-- 
Chuanhong Guo <gch981213@gmail.com>

