Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913796;
	b=aiyJuDbn3Wl9fz66aUj/40f92eOiRoLjbbuE1DfxGs6GVFWkvqtqG8X7Mu5og/AsRSZE
	 LicnXcbyXQBBUJ20PvWQ1ByCnqNCk9EiqEutHZfyQGE6WReuciVAWLe6J48AVlhCQ2FXv
	 nDZYlNLQULVyrEj5HjAW1NKYcbZ4n1zKf1+ExoxqZRqJAUuXmelCyQZuTeWoCyOCh8a1s
	 BLv54LLwjB9Nd2rhfz5lLW/8cYUNRoA9FH11OuFdIhmV60AzA49eAkfNPUNaiqx8sT9MI
	 IeJ9EZ8hk/zbvwjBBPutNyVfDli5/CjfmMgSozmFfLo4GdWTEYOp8AxvYYM7gGOiHiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fzNmcmH6DQZPnhRJu7d5EWZ5XHOrbm2NPxIubtKTIT0=;
	b=FoOp7GPoh0otNyvfVsqrClOcRm3bNjSJ5YJRx8F4EVjRpNZx3GVugEbFaiHY4RKRehOD
	 j4s+FFfKIh4Jmnt/E16NpDAtEoWVdIKUL7V+qUfs/5K9rizc6cKTDCZpOhJmM40PyGnyt
	 UN8cPw+HXXhY6NyAchbfCDOtsV0Ohv5E/1oGNnNYRMd+OP+BlbXtTMZ9jd+6U22o8ZeXp
	 HIm27tYJyuk8h5TUT4nuDqv4cLgd8fB2G5g8dmAVyaLUCyiRM5z6M5prTpHtFMTp2maP5
	 2goyb9lkhJojBo28bDLtde8XLpi4Z89lVNXz8BLoSdOhLRowbl+IrmRSSFQ8zfHo7pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PMREe3SG;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE73D606A331
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE73D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PMREe3SG
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-380b40319bdso1978092eec.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 03:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913795; x=1795518595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzNmcmH6DQZPnhRJu7d5EWZ5XHOrbm2NPxIubtKTIT0=;
        b=PMREe3SGV7qkwfAfexg6hLXqIDQVT2NE+9apeRycnZWfK+un0+5zby9JX/IXIRYuX5
         waGPua0sJAQN+wOzn/dsHJitxLf+/PuDt0PNU9yT8Sx1WnITbRoQa1LY4LDyrNaVNsI8
         1h5dsSKFHyv6/bvU1bomDGinZ/KJE4+XOcBdCk73CvLvJfygYr+3StSQ7soCvBIGLmAu
         mFeitgVPOvvjSyJgBsns2LS9R2Mybd5FPKu3DzK/A1edRKySA28GAh64SeEJMulRA1ko
         0hGB+nI1i919xKAYIRECr3TIDraH3ApX2dC54IYHn3sT3+NDC/bc4ucLsPPPFKEdlnFj
         tMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913795; x=1795518595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fzNmcmH6DQZPnhRJu7d5EWZ5XHOrbm2NPxIubtKTIT0=;
        b=p7VGNlmD2B4eCAeZzb5Pf8LmG8ETCfsCB6IZeOJ3brSf9YfZyEDjmcY5cdCbgq6HuM
         OmSqIqcPK8cHmh1xw/HCdISz6XVJVX+aqNzuwBho6y2ueM1CQdQ/qqbRJQ+pobpRSUDS
         sOGyvdsd1wP+WgcEpYOf5UUnDpZTD4Cic9jSyO4mcTDGAW/IV6+T5Z67qD2gsB7ylp2w
         +9ldzJWG+anpR4OuQV/ElxZOBm21yhb+hanW5Wh7imkDmH7coG4+bgfTLXi1V5IvbId/
         DDIhcOZuJnm09gtTWS/58/zsMBGlJ556vEoXg23sq1W1YJWd59W3et/9OezL73vcDdTV
         baqg==
X-Forwarded-Encrypted: i=1; AL+hErHgIct62Bxqz3YFtv1de6IqM1ISKQl7kunJPc7BShfMvOUclKdv23sykrOD0j38N6wnQChqRmPKWoG2@vger.kernel.org
X-Gm-Message-State: APuU4Z941iLk6qes2jAFXwTdMm9YDswLmwkA43M/XcMOYiD/BY9l3VcS
	FaYMoEJz41Ps4tSZPF5gzRfDIEailbNzmkQqwxPMwjVQjyWw5gLbWEs2SzT3+J25KoE=
X-Gm-Gg: AYBFou3Q4MhBKMKHbH0LJ4K0TQ0eARTKLpF8KVP+oXT0mmMEF5BeCloaj2fRDR8XWvq
	vYvZiv3U6BeuzZecV/STFnbePWOoWYV7WGKoLho6x4W1RvDl2V5u2PtLWf5GhqQGISptp9NE89v
	iyPpF7HRkk6n/heT7ojM5pybzrbwTCCamkBw7QnXwTHg0CSzn65mIvUQn9aHIrGvx0/gS+ju53h
	RuSjYp7hD2GlaZqXnIn6kxIJrFdU2OgAGNm1bAbAUO+0XO5kKjiKbV2iPaeNb15HLV+cgtfBz+j
	hS2IB4On7PfHfxh9slkpOXRzPvxFMfOmnPLnnxtMEiEyx1R5lQKixhSV/UvobOUgvxSKQXV7yl/
	wPr+Z5pextgUoXpQIEl/5fsgCi5axDGGn6BAPUwlUpbZplxQtZSxPtwLaNfPe3u3FUQW1LG2RZA
	6z+6nMNbD423lxG7EF2NJChJYGLGZMGDp0Suri65+37MiD+q0xkIslsmBzYruY5sbGGabIAQjGl
	xAV1RLwFAF85NhfnaB+JzlrL1g9Di0rRq4akELKpDEafHtSVqVgmjOdrxbxfuvEh6BhA4UvuPSL
	dpjVr303prUUO5tdV58Fi0kcpwMw4GRtr0AHXQEzueHqckw4mRs4+3CGQ3gM7Wl4GSr47vhMyq0
	RCZ1mTZADSaGHMySUytTD2jK/c2+VtlLv7V9cRiGLVzGXBHlT611MaxLhCHw0WZa0Yt17lJudEj
	b481bE8qjBwLmdr5ZGPen7kqfsUS8pHXCwkQXevlVMpBsBsu+WSB05FdP/D0eyjtE=
X-Received: by 2002:a05:693c:41cf:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-37967506841mr13060710eec.29.1794913794818;
        Tue, 17 Nov 2026 03:09:54 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-381a55555dbsm5560475eec.10.2026.11.17.03.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:09:54 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Gwendal Grignou <gwendal@chromium.org>,
	Daniel Campello <campello@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: iio: proximity: semtech: add myself as maintainer
Date: Tue, 17 Nov 2026 16:39:34 +0530
Message-ID: <20261117110939.214932-2-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117110939.214932-1-kapoorarnav43@gmail.com>
References: <20261117110939.214932-1-kapoorarnav43@gmail.com>
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

I'm adding a reviewer entry for the Semtech SX9xxx proximity drivers to
MAINTAINERS. Add myself to the maintainers of their bindings as well,
so changes to them reach me.

Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 .../devicetree/bindings/iio/proximity/semtech,sx9310.yaml        | 1 +
 .../devicetree/bindings/iio/proximity/semtech,sx9324.yaml        | 1 +
 .../devicetree/bindings/iio/proximity/semtech,sx9360.yaml        | 1 +
 .../devicetree/bindings/iio/proximity/semtech,sx9500.yaml        | 1 +
 4 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/proximity/semtech,sx9310.yaml b/Documentation/devicetree/bindings/iio/proximity/semtech,sx9310.yaml
index 775555d147bf..39059215cdd9 100644
--- a/Documentation/devicetree/bindings/iio/proximity/semtech,sx9310.yaml
+++ b/Documentation/devicetree/bindings/iio/proximity/semtech,sx9310.yaml
@@ -8,6 +8,7 @@ title: Semtech's SX9310 capacitive proximity sensor
 
 maintainers:
   - Daniel Campello <campello@chromium.org>
+  - Arnav Kapoor <kapoorarnav43@gmail.com>
 
 description: |
   Semtech's SX9310/SX9311 capacitive proximity/button solution.
diff --git a/Documentation/devicetree/bindings/iio/proximity/semtech,sx9324.yaml b/Documentation/devicetree/bindings/iio/proximity/semtech,sx9324.yaml
index 8fed45ee557b..301d502f210e 100644
--- a/Documentation/devicetree/bindings/iio/proximity/semtech,sx9324.yaml
+++ b/Documentation/devicetree/bindings/iio/proximity/semtech,sx9324.yaml
@@ -9,6 +9,7 @@ title: Semtech's SX9324 capacitive proximity sensor
 maintainers:
   - Gwendal Grignou <gwendal@chromium.org>
   - Daniel Campello <campello@chromium.org>
+  - Arnav Kapoor <kapoorarnav43@gmail.com>
 
 description: |
   Semtech's SX9324 proximity sensor.
diff --git a/Documentation/devicetree/bindings/iio/proximity/semtech,sx9360.yaml b/Documentation/devicetree/bindings/iio/proximity/semtech,sx9360.yaml
index ad0bb44f41b6..2ac8bab30cdb 100644
--- a/Documentation/devicetree/bindings/iio/proximity/semtech,sx9360.yaml
+++ b/Documentation/devicetree/bindings/iio/proximity/semtech,sx9360.yaml
@@ -9,6 +9,7 @@ title: Semtech's SX9360 capacitive proximity sensor
 maintainers:
   - Gwendal Grignou <gwendal@chromium.org>
   - Daniel Campello <campello@chromium.org>
+  - Arnav Kapoor <kapoorarnav43@gmail.com>
 
 description: |
   Semtech's SX9360 proximity sensor.
diff --git a/Documentation/devicetree/bindings/iio/proximity/semtech,sx9500.yaml b/Documentation/devicetree/bindings/iio/proximity/semtech,sx9500.yaml
index 66dd01506859..cf05d1b0b1f3 100644
--- a/Documentation/devicetree/bindings/iio/proximity/semtech,sx9500.yaml
+++ b/Documentation/devicetree/bindings/iio/proximity/semtech,sx9500.yaml
@@ -8,6 +8,7 @@ title: Semtech's SX9500 capacitive proximity button device
 
 maintainers:
   - Jonathan Cameron <jic23@kernel.org>
+  - Arnav Kapoor <kapoorarnav43@gmail.com>
 
 properties:
   compatible:
-- 
2.53.0

