Received: from mail-pz2-f17.google.com (mail-pz2-f17.google.com [74.125.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32592448BB7
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 08:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547372; cv=none; b=ZHv96nHUlb2+ZOQT7OZnS3I/c5Go2grjAjE2ch6/ozQbG0BQgUnxktnfLrj4KXe85BwTzbwVLHF7QHxr4ii+J3qO5twUTXSzXQqf7W6UXMLBTOd57OeHpPWp5arTqKYQs55SjMFYfTdmmF/VnQ0qbvPOEZBwI2ZpY2RdnCUtjyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547372; c=relaxed/simple;
	bh=mgP0U5nmhxHVOFGKUcGuCWBysre1xc+hrQKissKOZMk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IXjnzBiYB0ICVTh0M8LAy+FVHmEzcxzY/wd8xk1dPMpKhzlXHfDY/iRC8qM12E4S4dnRAZTDHnPoAo3OnJXr6TKfkirr0SeO10N7LlIJuqPPLjH1q5lVwZNX0Hkm7ZVUqMIqXGx2k0I9C2eF+G/wJr2/zsg4ecs6MSzYT3UAzAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mw5c6vA3; arc=none smtp.client-ip=74.125.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mw5c6vA3"
Received: by mail-pz2-f17.google.com with SMTP id 41be03b00d2f7-cc4c3304784so499738a12.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 01:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789547370; x=1790152170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idOsVahZustf70E3vcAEJkdJDD+K7D4L7o1uL+BpNms=;
        b=Mw5c6vA3WYZFKuuhLcTK1nxO3K3AouqKATKiEjpd6F6SNM1eu+4SClqtgxbmPuS5ix
         7kG+zxqWjpdtusAxrH4R8enOCC9KLNYztXfzQBwe5gDzHjVGsahs4hB5zsqqxJm6fqEx
         ctxCd6I7mtZunoB5dhigv/BuSUS6KHFkzup7XyJiTqriLzHomH5ZffTGojHSj6LFbwk0
         05swiVCDrWizP6r8EJzy809jA+zEMN7IipQdBzhDRNrKIYJYEXpL3norJfDo6maStoVq
         b55nU2OnrBq3g6ZJJw1aaLd3zvk0nq+MpkWotMNOJUkE0x1w9luX+ingp9KHbmgulRln
         b3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789547370; x=1790152170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=idOsVahZustf70E3vcAEJkdJDD+K7D4L7o1uL+BpNms=;
        b=rqoY1CeN/osTMQZjAmFaJ62kpl7ENEKicIKWCK4Xaf67TgOjzLfnVU+vlTNjeCFgyX
         1fI91Bd7P1QAP0wtBE9ou6Vi7rtaAjhnHhNhYUtoIeVogqtMsXcqIh+LPkCNOl3tA7Cf
         OgT283GJxoGUcgWM8kVI8iXUr4oF5EOzERfqTI5AquhjEvJHZzOqJCpqIVweWKhn0dN9
         ackzJF3m+yXdBnsp2w03fTe56NBcK1rTx6WM3l7bQ6vuzYcTX7zPI1EP4aELfy0rweIR
         SPYbBR0B8HYdXxqEIPJ4xxtTS3P6dgUWZsJEIAcf3Wx16C3bv2aj3TVNoCC45rpjCo2a
         o5xg==
X-Forwarded-Encrypted: i=1; AKwUvBzvYOCgemdqFNgvPz8qcWbjioUt+6DrV46DCz4CHSmbnyOXGuKKdNK0ARgopPplWz0NfoA4/pBBoDth@vger.kernel.org
X-Gm-Message-State: AFuF++kBMeJ18IcBBDDnFShLgAnWqa8RWrREe6rVDeBgNUNyGAqd9JmI
	1x+7xfdIBzSfg3lUklRvbHfKy0SiAyW0eugcpeaaViC7N4p1DSKSKj+S
X-Gm-Gg: AYBFou0zdrTYx6o0P5D8G3e3uXlb6ECZWjb4Z+IwHnRw3RwmqWXcB+/iegn6jPrb0ty
	xFCjzjZGPtnD5Mw3Jepmf0PSw7FkGNFt/+ElPnaJQQihMvwPIlclgwn0/CkmhNu5tavJSUJPRu1
	DomwxWno0RRxYq9onHXy7roa6vBQ7UlhLgtB8ARJfkhRtPiKe9Mf8Gmo5PnCEPzvGlCb+5HJx6G
	fyZTxmzVjhu8Ju2v7gL8H/y7z/CJn5tNSxDBWvm1Uj9K4tNYHKwCdQ5yvCFeGcJl4G4c2Y0BMXn
	dZ5ysfPr53KLfy4Z10pjKSZzQDCKWlUWbR3h0Bv5qnNdTAhTUSeXB9wF7KiXBW6BRU+VN3J935l
	xJXaK+GB+mnH/USi41jFqDb1oDTstGQa0arGFSSS18/AUaN2pi3bPmzqLsbQ3tcFJaB+slxxMBG
	BifWHaNDORX4au9snpfDxoUsf9zH55BtPlBMgae7nJWShkIxio8SGKp7h1UEBK/yImO8D/pcG/K
	EyBcipeBTCde1BVKIvLd+aubTHUqKNOzrIGTVkv0CBQxovWFdcGCeYXVqtliQ9OrRgM9XPCOtz4
	RWHq4XL33Is=
X-Received: by 2002:a05:6a20:7d9d:b0:3da:34a7:6444 with SMTP id adf61e73a8af0-3dd5f7ad642mr4109891637.26.1789547370506;
        Wed, 16 Sep 2026 01:29:30 -0700 (PDT)
Received: from lcwang-Precision-3630-Tower.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50aba9dbbsm1157594a12.24.2026.09.16.01.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 01:29:29 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: Devarsh Thakkar <devarsht@ti.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wig Cheng <onlywig@gmail.com>
Cc: LiangCheng Wang <zaq14760@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 2/2] drm/tiny: add support for PIXPAPER 4.26 monochrome e-ink panel
Date: Wed, 16 Sep 2026 16:29:24 +0800
Message-Id: <20260916082924.956116-1-zaq14760@gmail.com>
In-Reply-To: <20260731035705.3198816-1-zaq14760@gmail.com>
References: <20260529-bar-v3-0-5c2ac1c751ee@gmail.com> <20260529-bar-v3-2-5c2ac1c751ee@gmail.com> <2bfb73e6-dca3-4d93-af04-3c644929dd19@ti.com> <20260616083921.4066690-1-zaq14760@gmail.com> <423c3dca-9589-488d-8462-c3d51f05ee4a@ti.com> <20260617020926.114947-1-zaq14760@gmail.com> <8fcfab0f-6b98-478b-be4a-c5b810fb3524@ti.com> <20260731035705.3198816-1-zaq14760@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Devarsh, Thomas,

Sorry to come back to this thread after a quiet spell, and apologies in
advance if I have missed something obvious.

Devarsh, the three fixes from my July testing on the PIXPAPER 4.26m are
still available:

  https://lore.kernel.org/all/20260731-ssd16xx-pixpaper-rpi5-v1-0-18ffc0dbf59a@gmail.com/

I am happy to rebase them, reshape them into whatever form fits your
series best, or retest on a newer kernel - whatever is most convenient
for you. There is no hurry at all from my side; please just let me know
if anything would be useful, and thank you again for making room for the
panel in your work.

Thomas, may I ask your advice on how best to handle the panel support in
the meantime? The PIXPAPER 4.26m is the only SSD16xx hardware I have, so
everything I can contribute is limited to this one panel, and its support
has been on hold since June waiting for the shared driver.

I wondered whether it might be acceptable to merge the standalone
PIXPAPER driver as an interim step, on the understanding that I convert
the panel over to ssd16xx and remove the standalone driver once the
shared driver lands. I realise that is not ideal, and I may well be
missing a better option - if you would prefer to wait for the shared
driver, I am perfectly happy to do that instead. I would rather follow
your judgement than guess.

Thank you both for the review time so far.

Regards,
LiangCheng
