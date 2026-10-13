Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F10511E78
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915508; cv=none; b=uLaX1ihfNw1lGIKthZOmgzOqRnWwR0ZZIYwC3mDizSLUiac8XcOiCCelPHFDtQWwbTvdpdd4DwxCdhCW3FRWwonxC7Jt4NzIfzKueIthpQnbEXvYGkS5x9avq9YboWAZ2CSiHdUv5QK0xCKbmpZCse+8Rf5omvvxrMcEWnBPZ9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915508; c=relaxed/simple;
	bh=nxoM6aqmzwRV8bE4p6kF3mZpEO4PV/m/0sBGUc2ECkA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZonNFjRpN5JACfsaVbFq95ThD7VwM6kTt0YcFHfzocmPD32oX3uYOdPwmK9Ga0eU6irHzWT1de5NPQkqPTv6esKuS6tVxHvv1OhA7zejNbosS5zw6RhH8PFbKPvQ9W4Ufm04wFNKbYu8N6bjVzSx8gewAEquHZ1v7MEmlWAs0hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0EXaT74; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0EXaT74"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso18212575e9.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791915495; x=1792520295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E3hQjmEMreIOp/z0zH8ILmz0PDZuKIXrXvhSTza6jwU=;
        b=Y0EXaT74IxmPk6Gm057hWy/QFEVGQheYGSjsaVWWit6ogybM15dEsBYkRDKJuJgYkB
         ZYFRDLTfZkDWguhVVfFV6caxQVLNmWC7DrqTDkwW9+6tqF8ti/BVy1afyjjIjJuM3CRA
         dJnZxUSsVFppFFHviNheWzjNmMdZc0C24biruwEealLwGoMfsmhOEZM3wP+/jfjALKeU
         NiQhy6qGD468Dla54HW6s5WqwFqAU07WftGTzl6SL74g3ek+y9agntGB/VLWbYM4kOBZ
         B6XUzOpYNi5+JAoP+AoSNL0Pa2a5cKvpyOU/eb367ed+ELHryuQLAzE9hvtKWmndxto3
         oYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915495; x=1792520295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3hQjmEMreIOp/z0zH8ILmz0PDZuKIXrXvhSTza6jwU=;
        b=nyhPALUS+7IXm/91KNVScdVXTpwyqHT+oNTVpDxQbnH1gGAQahV/z5lFf9lSU+rFkt
         cjhdDe5naqVp0VHXdLijQt/DrsU0Ya6tPZGqWc37ktKSTt+3kVMFy71WGmAIOpYnhOuj
         5ONGPc+J3FMxMhe1n/M0E7Z2nSfaYFNcLtVFv9UGycJwE724ItCdDo7YLAB77TqaNxR0
         TS7cqqm4ySt0yBqoPfW+gLJQzX/Ab7hOR4KW/LWOErM8EKn1nBoJM7fzrXcJ/iSgmA/T
         yjF0Jw7nzidW7AY+xtgAfalTfQQZ2TtGRBOD/jM4Y/aNeQbH10TYdma1jejNBbfLWCBV
         pDsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwn1vt1YL77fvg0pXJleiCFd4gAgml9VSIIDynPnkYROZla/XDH0+rrxGHFYvMB/DFvgprHLh1kxHjJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJuc+2jzDa/RSWPcwqzLe2VWUE2swMU/zyVr9PXGidccmHTFX/C
	loNSKzD4QMdpEz32GzdF4RF4mQANQKuj/jFbtLBpcFeXdSO7/VLpJC0+
X-Gm-Gg: AYBFou1v8zLRNQmiOpf7icTEpuSvTre5eul4hOt8epS2fzB61zRy1IX8dQXhT4StPVd
	H7PTpP1Ca01usyCiyXrWEgisPbGPuhqqm6oFg3lyd4c0XsAs97SdiMpdw5obkuvUecd51Hxx8Qn
	U5pnwMHKPwOEO2EZoTyZrWHZJGk841LZlk36olcUSmrC2pfwkPLUKpgRmfq59RxRaKY6eEQ/8eL
	7mEn4TgrpO+ZkWg3riN/Wjm5RlWPuL15RjvzdCJXE0lY9RKQP+HBoKfLSZ9OhilHp/eTyPtANht
	bgWuFnAxhZC+MERvSZd0Ur+7ncOfuqHXn2+RBV28DApaxyOd+n/YfSuZJnz8Yg5tVoDZ32MS1bd
	L7c0whGHH73BcWWdyjNhs06emzLcRSdK3cgdzr541sdlnO8bsoWTL2jRugNFLnpTb60TIrhSLmd
	nO7cvW7wL4wqnjz0fOU0/D43mhWBxWstHlN0xi9lRgRADs+a7lljr96U9OQI92JVm41Fg00U6PP
	fFox0BIIZ97tbs6fh8=
X-Received: by 2002:a05:600c:5391:b0:49e:7a10:1b71 with SMTP id 5b1f17b1804b1-4a18e4a003cmr266822965e9.11.1791915494922;
        Tue, 13 Oct 2026 11:18:14 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm6379903f8f.36.2026.10.13.11.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:18:14 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] leds: aat1290: Add support for AAT1270
Date: Tue, 13 Oct 2026 21:18:00 +0300
Message-ID: <20261013181803.496627-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document AAT1270 and FLINH pin, adjust driver to support AAT1270.

---
Changes in v2:
- added formulas for calculations
- adjusted mm_to_fl_ratio to be set according to chip info
- adjusted timeout configuration to be set according to chip info
---

Svyatoslav Ryhel (3):
  dt-bindings: leds: skyworks,aat1290: Document AAT1270 Current
    Regulator for Flash LEDs
  dt-bindings: leds: skyworks,aat1290: Document FLINH pin
  leds: aat1290: Add support for AAT1270 Current Regulator for Flash
    LEDs

 .../bindings/leds/skyworks,aat1290.yaml       | 13 ++-
 drivers/leds/flash/leds-aat1290.c             | 91 ++++++++++++++-----
 2 files changed, 77 insertions(+), 27 deletions(-)

-- 
2.53.0

