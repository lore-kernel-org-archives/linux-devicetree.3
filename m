Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2882E88BD
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781599171; cv=none; b=eQDfdCjIdRdFU+S+gx/+nLkphAwp0QNe6L5XVOs9u56uFMYMGFivJixNHTUR1wR9mFwQJY9casMxmlNdk3Dauw9Rd6+P50xor9/fuj//mq4WgRlEhah8MErHPRrq49f7QmsyeL64PlnPtbVbBt/qwLDA4o/cHZ2crlO9eKtrMMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781599171; c=relaxed/simple;
	bh=+4Je8IwSJvG/jfPJ4CeCInyfi1a6CXtfdj6NR9s+scU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DqWJJLz+xnBKMU4lvlc0UiNed98/cBx0pQ6b3pzZq96w4Ot8+jhTZQXFxFnJkv8oQ7x+wJZBMnZRKCy0Ul2zNsatDTcTdP5SkR4qqF5s3sIopAy9kFmPdRefCC0C5go7QDP4R/cDJBWiJcQp3QD1UGkqXcI5C7GttrVn4TjpbJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhjBK0PS; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhjBK0PS"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-842358aaf36so1664736b3a.2
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 01:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781599170; x=1782203970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4Je8IwSJvG/jfPJ4CeCInyfi1a6CXtfdj6NR9s+scU=;
        b=NhjBK0PS63XcvtOqhjQEeZL93+hDzY4GG+i24qbdPkNwd1hCJRdRbSHu+5JQdkzr8g
         O1VOYqF8neLOCeV1rODwKyRmmOUwhq/saz9ZBKg0BKY9NW44MDzyelAs5akuxLVsXupp
         pjX96YuqSBQplhQ3DN5pCHAsn1jFcWa/ciR71oV8Nkk0lvIgRHyArVxqGZi9CwxYaMAz
         nYWsjesgEszSEILHKeydDp8lXeq/9HquX6mljWHBSiBNicNKZ8HURmiJvBvfbzwcEeNu
         IrILdHbUUIwlfvzWm2w7nyGKV9Mi6TRH6g5RPeP/knm6AUfY1JyxUmDg98Q6T4LN8303
         JCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781599170; x=1782203970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+4Je8IwSJvG/jfPJ4CeCInyfi1a6CXtfdj6NR9s+scU=;
        b=Z1vWJGwaBt5d/NAYu6+W0X+KtzTWc/dFv1Y3M+NFDp8LkLDi5r+0GposnBMT9kTImu
         jKy5ASakhzZ1EAEDi7i1Lu/qieqdgjMFq8iaPzuTq6fzj0f5f1hS5GXyT2ssIP+B1SYG
         u0BuNB6il+yEhHOPW2j8G5VqOoayQkXjQjZjzvr1UfPE2TZXFa5PmGia4iMftELdVWUD
         T7Pa/A836AWyQJumdpNAYOnoDEPvq+SCb0rCIeHVTVjffSe1DTHvxwAmYQrtBfT8LQk9
         3e1+ZTiXvEc/b+2Xlz40dJ/eb+ycwO05Yb18aJ5UDSHseEFv4OgSVZCigsZt/uX8Mn3I
         uYAw==
X-Forwarded-Encrypted: i=1; AFNElJ9eHaXmISeEyVla3Uz9SsoAQtAvgpqDl1ZQXRU3YGPFJN0hvnD7+3rTgbdjKG+FQ/WjQXBuUhiAPyDj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2u/YROEgvwC8R+GnHrCwF+j8saPRDx4mFJFZpT9vF6HbS6j3u
	7BGtaKGrr8xTGIWoMvIb+KIHOvIASBjgs8sDJL77Yn0d+qj+qUr8C1j3
X-Gm-Gg: Acq92OF+Rod9eU180Om6ITN9zPjGaBbHlezyejG3benVW8dFTrKG4rDEyeDYpNYvf4P
	w9vgHcGyUs0Rmaymsw3IrfN5IQpIINlIDnhxzWnGEJ+Ru0eFK4sJbg80hVxI9BjCEalP2NEAzrV
	61G4E8SfBonGYaMcL90P+C19CmOW2iFHwvrZtCQouky616L6DB6w0RYnFuKSTpK8BDRrUta1M5J
	TzMBhw2JB7i5/vK6XEwlxyWLNQAKEDuDtvDo8q8fTgTBNSiVSjcCkYsMaEerXWPZg/F1ICi1nxb
	p4drFlQLS5T4FzGhYUKt7pSjkDsmbgaXZN2+2Qcd+hlwof9SQuLAC5KNyRM6dOpHFPSLkc8BFTA
	lDCf1BzEO7wzsT3jqvC82vfkRBJ5cy9QdiUxo+XvLDHYU58OKnXjkiuufiTbpGLheJ5b74xlxb3
	nAtxkjFhrLJo/5cQNJQhizXVfemhIDaJDi5YzSGEsgA8MukRgsocdnyLVIVcXNc4QAjA3WNtgtM
	/rF6xnVkruFDkWfZXJLD8Jo+InNlRCenHU=
X-Received: by 2002:a05:6a00:4399:b0:842:2419:6c0b with SMTP id d2e1a72fcca58-844e19676f0mr15311972b3a.10.1781599170061;
        Tue, 16 Jun 2026 01:39:30 -0700 (PDT)
Received: from lcwang-Precision-3630-Tower.. (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9dc87sm11497535b3a.4.2026.06.16.01.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 01:39:29 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: Devarsh Thakkar <devarsht@ti.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wig Cheng <onlywig@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	LiangCheng Wang <zaq14760@gmail.com>
Subject: Re: [PATCH v3 2/2] drm/tiny: add support for PIXPAPER 4.26 monochrome e-ink panel
Date: Tue, 16 Jun 2026 16:39:21 +0800
Message-Id: <20260616083921.4066690-1-zaq14760@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2bfb73e6-dca3-4d93-af04-3c644929dd19@ti.com>
References: <20260529-bar-v3-0-5c2ac1c751ee@gmail.com> <20260529-bar-v3-2-5c2ac1c751ee@gmail.com> <2bfb73e6-dca3-4d93-af04-3c644929dd19@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Devarsh,

Thanks for the detailed review.

> 1) Could you please share the datasheet for the display controller used
> inside this pixpaper version ?

Unfortunately I'm not able to share the controller datasheet publicly; it
was provided to us under NDA.

> 2) Does 0xFF or 0xF7 mode work as well for your display or is it strictly
> 0xF4 which seems to mean that analog and osc bits are disabled ?

I'll test whether the standard 0xF7/0xFF sequences also work on this panel
and follow up with the result.

> 3) Also could you confirm which display controller IC does the PIXPAPER
> 4.26 use ?

The PIXPAPER 4.26 uses the Solomon SSD1677, so you're right that it is an
SSD16xx-family controller -- the commands it uses (0x01, 0x0C, 0x18, 0x20,
0x22, 0x24, 0x3C, 0x44/0x45, 0x4E/0x4F) match the standard SSD16xx set.

> it would be appropriate to add this panel as a new display panel entry in
> panel-ssd16xx.c rather than a separate driver to avoid code duplication.

I agree that consolidating SSD16xx panels under panel-ssd16xx.c is the right
long-term direction, and I'd be glad to converge there.

I'm not yet sure how SSD1677 would fit with the controllers your series
currently targets (SSD1673/SSD1680/SSD1681/SSD1683) -- ours is a larger
4.26" 800x480 panel, so I suspect it may need a new controller variant.
Would you expect panel-ssd16xx.c to be able to support SSD1677?

In the meantime, would it be reasonable to take this smaller standalone
driver, and migrate the panel into panel-ssd16xx.c once that driver lands
with SSD1677 support? I'd be happy to help with the migration, and of course
I'll defer to your and the maintainers' preference here.

Regards,
LiangCheng
