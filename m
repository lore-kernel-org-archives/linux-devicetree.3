Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701AF3B4EAD
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 12:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566302; cv=none; b=f+c9m4j9G93vB6JNCfxwnjyHW9kdK5cJ38SLCE6G64xE7Q4p6qk1rZzRdjp4LQILIMRZ/bZwzG4Qcu0r+9kS3O9sMUkC7z6tXtJlyJB77EFhT3u4KmIckHKTvsG/BT4kY2wlTyHLhXDqmoCkrC67y84O/PmwS42DHX7lArRE3uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566302; c=relaxed/simple;
	bh=MWfccEFrjalT/iz3u7SOUElkguUlZhU5FGjm0QzY0lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ChLdDxmGg1qgLsH4//PnEX4xOXQzjhv1eKbW1XoQl0GtDOrNGwy3KI1YYyMqWJfLfV7RYGBh8cdzUo87tNNsGsjxBVdlQhLzZvQJFFjLjeP0r1bYkRc+fnSjdkoTwH2J+c/RQc57kFkPuLqiLfOM0cNUvibJ+nRsbZHZ6od/N4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=iFAKhpxU; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="iFAKhpxU"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d0deb7ad5so4530071f8f.2
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 05:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1775566300; x=1776171100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWfccEFrjalT/iz3u7SOUElkguUlZhU5FGjm0QzY0lg=;
        b=iFAKhpxUXWClzqGZ0gsgh5IHapvqSZreqkK5r5UMi1ljBQGth/mk469hCOjt8Hgbdw
         l6WCkroDNgifMIqg10Qh98ugFXhiRAi9LPdWeLzpOD0uas7AzKNWBQSardXpeS038gdr
         qiGhX+Wovf0HopTYW/bJUhQGgXJS8gWcz3FCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566300; x=1776171100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MWfccEFrjalT/iz3u7SOUElkguUlZhU5FGjm0QzY0lg=;
        b=BEcB9HMsEfE9s4/ARlSUFaP/NQKW1wV+dzqSLPJ7GRMmYgwNnElUEsdxtXNhymXufy
         +DE/RVgB2zdormxMWT3HQtwa9d1DG5PeNPBdY5VcBFAjLbEEP2ckBOPdX21zdHuS5aLS
         HfD2RRwtR3BOcIzTNlgk4PqmXG4MBAtxhEGjAKOGLZkyJg9FFHI4yPmtNOWmzMryF9Cz
         Jf9hKQKs3Zq6+x4xU1VCGBRAu3vFJHSKfpe3QsCFzTo43EnMXlhbf7HH32xBYHIkrr+G
         dFZ/rNq/NSYt0kI2GQVOsgVaYsm+ZogYitP9INaRiX69IBwoNkpdn1b/4OAaGjHwE9O0
         VYGw==
X-Forwarded-Encrypted: i=1; AJvYcCXJB6v/VGH7atqITo/Z+SGxQdEcylo0eUDeZKN+BP+wCVPWHOCi63SyQ4p1CqEYAHtFUOpwtqgS4bRN@vger.kernel.org
X-Gm-Message-State: AOJu0YzZID2xYIa5kDtAgtbIJ7hv43Tgmi11myrYvpz1ZaP1NfTdAPTr
	udl72vU9KzvR0qf3WZq0HNYDpFafDXc+2gm4Bbe+Y0Te+G8bqtjSgPneBDKPGY5XA94=
X-Gm-Gg: AeBDieuDwPrIj9155fCS7GiB6ocaewQFuoQVvmHPlDjkzN17I3t00XvdY+GJ1Kef24O
	fs5nwvFqI/zQcdg0JukmUHYS93mVdqSD1RHhoRMnGfnU8VPtrraiheOWSCbvnOaVDs02EP440P6
	lKSGTBeSjcLS8d+PQIAxBALKOmojrZx8PhyLHmK5WLn/sFixVVl66VQNYYhi06okxiSfYbUn+/n
	Aiefb3EGDQOAV6seUdkmX9LE6zasBlGvdiot7M1/VdOpOWf1diwH+rG17m7VIhq37ET8uTWAbO+
	z7MpGZXJbBWEx7UOOoU0xR6KbYSupBqLQqQgkOi5n/KKaUhf0vNOiMFWW5ctCxAWBTfJ2jvyyWt
	gONUObCuLGDnyFwESlywGX3iOcgtFr3jMDt73ye26EiokgIG6kAAsb2ZVqH/KLuDIimBL8ylXj7
	SzcBMcA/1wOTqW2rWxYDe2za57iAM7hPJqlIwTL7Svr6ncSVdEmTg03z2+
X-Received: by 2002:a05:6000:40da:b0:439:bd70:610f with SMTP id ffacd0b85a97d-43d292ecc9amr23145975f8f.44.1775566299767;
        Tue, 07 Apr 2026 05:51:39 -0700 (PDT)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f843dsm48085402f8f.37.2026.04.07.05.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:51:39 -0700 (PDT)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: airlied@gmail.com,
	brgl@kernel.org,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	jagan@edgeble.ai,
	javierm@redhat.com,
	jesszhan0024@gmail.com,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linusw@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	megi@xff.cz,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	yangcong5@huaqin.corp-partner.google.com,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: Re: [PATCH 12/19] drm/panel: jadard-jd9365da-h3: support variable DSI configuration
Date: Tue,  7 Apr 2026 14:51:36 +0200
Message-ID: <20260407125136.282109-1-r.mereu.kernel@arduino.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401-waveshare-dsi-touch-v1-12-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-12-5e9119b5a014@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 01 Apr 2026 10:26:31 +0300 Dmitry Baryshkov wrote:
>From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>Several panels support attachment either using 4 DSI lanes or just 2. In
>some cases, this requires a different panel mode to fulfill clock
>requirements. Extend the driver to handle such cases by letting the
>panel description to omit lanes specification and parsing number of
>lanes from the DT.
>
>Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
