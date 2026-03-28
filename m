Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25E634D912
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 15:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774713002; cv=none; b=UwXrz0HtjIJ/h1Mz9N0E3jhRudUH4rsd3cJ2Fiy7yXiCMIlCCsxn/d/HsJkaVM962jzvnuoUybOSaHmN9OV7IxkgFEr1PDYq98xavCZAwtiAZRKBBgkk6HehnSdfepY7NDte9VzGsu8CVxfMZrCXmD14WLSMs7jeYolJXZRM/ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774713002; c=relaxed/simple;
	bh=7AMiTOQ8EUJRVDLSBUYIDQzrDIXBfDzrdG6iCJ52u54=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jpV69ckPGtKm1wYTOYuYm0jqPAxXoInZ73OvwwXGT6snm56p8QldWjxPTwV8KphcJrQWYzMEgLD1T3ragPWxA5MI8XF1O8RPdCHCCQtL9oOzwpSVNO8uCUCuhgJsJB7aTVm8rkfZMEk/TvdfpB7kNTBgz+jMrV/j8Gvs3bMy6Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=UtIgK/bk; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="UtIgK/bk"
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 180313F29C
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 15:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1774712990;
	bh=AmGH1X8Qa83XtQH7PIlSrQ780qd7bFqezVJtPAuTxjQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc;
	b=UtIgK/bkidhOqbvSEUmF277A827eGeMy9yeEilTYrKaKuTdFEYWbO+q9GACsgG2cT
	 rUlPVp0y77/2V6CH7BhfMP4wsIry5MnPcDQeDlDRiE2PMyAdwSpWFfaWasPlyWhb2V
	 AS4NDiubtTiD9z4SqxtaWqyc+fLMITWnWf45mCHULATZNksvUwA1RCAAioWe0dipkF
	 /+hAh796lHANwIL6EsjJDn2qEA2l/+ZRy0K+2oRvtZPv6zepk3m0ivxl1wKUE9mvsM
	 D7Oaf4rYB8tvgTHQnxPcqJ6h7ZYv69aJNn4tDiUJR0uuVp3+cmko7SHe7tgCuHpYwJ
	 fiy4hV47SJ3oA24FVh4IQ0mch9WZsptfLZLK6pWgXAsM/JmP7F8m6LUBWtjx/1pVrJ
	 sycb6F293GMvcWCSIoEbOkMBb5yhaARKgkRZcXlp0wu18s5c/fF1QJAhSDjKLNqUTJ
	 FWX9NIDTp74+DXSdMNSd/1mVAUThzlK6wBkmbGJNKPFn/MqmScpuW+r6b/MOuoVtNA
	 3JHqyQ6JPB+m5e2quy6304wQA3G6j0kpmqWDlbZsPujSrt3WNfpYRkwTWZXL9VHelk
	 guTNEwt/IaI4rI4t3d9xjt0LUiboEbRKTp3ep9YLByUrfHGA1uHO1qJSXgwiqMHslm
	 mHq94XTVTkGAB5YUT+iIs8DQ=
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-48534941525so40745275e9.2
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 08:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774712989; x=1775317789;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmGH1X8Qa83XtQH7PIlSrQ780qd7bFqezVJtPAuTxjQ=;
        b=r2CT4fJPWH9EyW9sKm09rdRe+tgAnekMiMbHMg5vBFCLW9OOZhNhvac7qImfC0Evqv
         QWzxMv9YRnYa4cXJolTQxamuCCiyK+8dNdlk7vFXTCSNqUPOXG8mi5cHImOtYbTYq8fH
         NYHfmlLcy6aV5Hpj/cHw3c6/mnl2y1THQK0VTwyR2F903Cd6gDwulutDr3HcH0150Lti
         Di0VkiBRWwkhwMBBE22Uy1YQWsVNfEi6tkVNQcRDWahJThW7GjMn57++xCsbjQ+PRN+u
         jvmGlM4jcueN6fEXSUD7FL8dEheLUfrq/arIlzOWRoWFgUtPuHjyCBSkq38c6BOncIic
         2HfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXo7/gtFPLq0HH7L9bSh2DBrrDiPFgO0bNFpj8NaNh7FvtN8m1YQzA2f7seZjw0Hzu70oN1YZATmuCw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj6q1pznRGrbF6oUEgRbWvGHKXtwazU3UJOAHvbUI4vmxV0evT
	reXw96mpTBkWzLhnk4gbd5v+2+jByAXe8kcnKD6ez5NS28q0WWNQKi8iIhmUoQs9UK8IkpMmuPW
	8mN5IzvxKUolH/9KFfp66nKqkOUKCp1ScS1Vsjm3Xn7qvMemARpc8Bgg8DR0n+iNwbkDTz/HpRv
	aNXWg=
X-Gm-Gg: ATEYQzxEMIK2btXO8SHR7eOvJqtg9r7ODUrSAlWbnXcLyY/ycYAmWSqFG+2BX/0jxcv
	7gkW7cWbRdRzSKDE7mYPxvjnMyAK9HxeovIWvRnsxFArP9SGAZ6GN1egehQUKZjOPtbG/zw8iNc
	51b20hxLnb1AUV5hvehBLXr1eRUEby1YgN0D7zuVLeUwkOCTMEsUHcaMFApdbO1k9vXnRvaecIe
	C4muUb3fnyp/8gCOSEJJwEhzBc100NAvJDI7orL2cbS+3GQMjvg6diiaZOH+lqoiHBCNTyn7pWC
	hTGORGySG0iLksVHq3tNeDZdkfrseejC36KBMMVSlPJATOthStfmBkyxdUD0AXApCKlm6qosYDM
	1ouSe4snsQVKYbHKzkpvN57l2Jf4wIeLMaNM=
X-Received: by 2002:a05:600c:8b51:b0:485:40c6:f507 with SMTP id 5b1f17b1804b1-48727f1f47cmr130344265e9.30.1774712989556;
        Sat, 28 Mar 2026 08:49:49 -0700 (PDT)
X-Received: by 2002:a05:600c:8b51:b0:485:40c6:f507 with SMTP id 5b1f17b1804b1-48727f1f47cmr130343545e9.30.1774712988366;
        Sat, 28 Mar 2026 08:49:48 -0700 (PDT)
Received: from [127.0.0.1] ([2001:a61:35ad:2701:1e88:df3b:5eee:779e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48727192012sm38011165e9.32.2026.03.28.08.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 08:49:47 -0700 (PDT)
From: Tobias Heider <tobias.heider@canonical.com>
Subject: [PATCH 0/2] arm64: dts: qcom: cleanup remaining zap-shaders
Date: Sat, 28 Mar 2026 16:49:20 +0100
Message-Id: <20260328-zap-v1-0-f6810b9b4930@canonical.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAID4x2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyML3arEAl1zY+PktETT1JTEFAsloMqCotS0zAqwKdGxtbUAmP2z2FU
 AAAA=
X-Change-ID: 20260328-zap-733cfa5edad8
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tobias Heider <tobias.heider@canonical.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020;
 i=tobias.heider@canonical.com; h=from:subject:message-id;
 bh=7AMiTOQ8EUJRVDLSBUYIDQzrDIXBfDzrdG6iCJ52u54=;
 b=owEBbQKS/ZANAwAKARNJjwMsz+naAcsmYgBpx/iVIsuUUVIx+Ovf4h+KGZJdlf1pbNG9Rh/tZ
 /4x1U3j4WmJAjMEAAEKAB0WIQSbaT10QIAuim/4A94TSY8DLM/p2gUCacf4lQAKCRATSY8DLM/p
 2jawEACckiJgteTaeAiNRpOq07VZsfaqwQWhehlrNh3kjPh+36+A4VjjLqb1ZMjuHKK5Ve6947i
 blsv6sWGOTlWFoBGpna0WwVwbyep2g4PBcXypY7XHG0cXy9C6LnkuC9hOOABMsTgfBzg6gjezyC
 Lwby9+PPpsBCzOHpKdfYXOIIa96QrasM6YT8GPh+1MmbG2xXSx1kWqIZ4xAb1q2zsVcDC9/MwKV
 N85G3022QEzaHr0W9y0H+PvvnnIkbLx88GpzBRL1L4vWNO5vaLCkzvxcnyTRGxWFSuewVQEwRIW
 lK2Q3ulKlC7O1cx4lovqndjNHla/hnWFQhRbkFyrLgzPrnYlw0K5n2Fc6rU6FHfLIT8JKtyNXp6
 fyDc0d4ngmih8m8rT8iFIsycQfrpKTp+vEDR0OT+e/kw6bMtzF4RCwoH2/ZniA4q0ZhvjtLa5m+
 MCJWPSy0sI1T1gqt7Oet5U31MNrMm2omCl9LXts3kO5/8+DWdiidYpJ9narMV83GBn1UORjck9/
 /mrr3f6L+bWAZCVWM0R+PxW+XMumE5kaw/jt9XnYZs9CjH6CNHAZB3t/M7/ZagkoohTWj2GyUzt
 RMF9JcWtGUj4u8EvdkacTRW/DgTp0VvF0Qe6x/nOM/azN8M/E8ylPYzhaPtnZcTb6xaBcFhYIIy
 aldPsBiYO/L9HGw==
X-Developer-Key: i=tobias.heider@canonical.com; a=openpgp;
 fpr=9B693D7440802E8A6FF803DE13498F032CCFE9DA

In commit 2377626fd216 ("arm64: dts: qcom: add gpu_zap_shader label")
most of the Hamoa DTs were converted to use the gpu_zap_shader label
instead of patching &gpu directly.

This fixes the remaining ones that were added after the
original fix landed. While there we can also remove the redundant
memory-region property that is already defined in the original
node.

Signed-off-by: Tobias Heider <tobias.heider@canonical.com>
---
Tobias Heider (2):
      arm64: dts: qcom: fix remaining gpu_zap_shader labels
      arm64: dts: qcom: drop redundant zap-shader memory-region

 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi           | 7 +++----
 arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts | 6 +++---
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi    | 1 -
 3 files changed, 6 insertions(+), 8 deletions(-)
---
base-commit: be762d8b6dd7efacb61937d20f8475db8f207655
change-id: 20260328-zap-733cfa5edad8

Best regards,
-- 
Tobias Heider <tobias.heider@canonical.com>

