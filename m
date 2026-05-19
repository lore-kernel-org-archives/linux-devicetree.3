Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F263E7BB3
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180296; cv=none; b=sWZ5ObkW84vrSkMl4oqpOozcUiqUX15Ls/v2xD4GD5SKWYam5OT8HAKGrL+0k6h/v5RwraC+G0YmPFxi1gQ9oymA13LRYqjXvvFGHg9/QCA1kGWUiGGN/ygsEE9Umw3sdmrfuhRYwkgxsCI/6GWSIpZ5pHD56r0HLU511wyGgSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180296; c=relaxed/simple;
	bh=uowJO01cNG3wo8CJLveZ9KUMF6CjpxDDZdDZxhbcjXI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BslUicIWXGgVGOBI5laE5EtXwTVkeiw1qWdFJY704xAuWo9p2xWgzpHsjbOg3D3QfY5L01ONFiSEPcQwjlcaK0XNF/TvcAjcJ6DH1HhDyomd4cSKqaTCk8rpZgQuE+V1CJ3a0g8daHgWPHj5gVSmH7G4Rv+6KyV6DRw6FhsJw+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqXdmbno; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqXdmbno"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c796163fac5so2798498a12.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779180295; x=1779785095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uowJO01cNG3wo8CJLveZ9KUMF6CjpxDDZdDZxhbcjXI=;
        b=eqXdmbnoGVtXuS67HdKKkxC7S54apf0PJpOd0pKZwhpMRZV8xpyGa/O1jaNMyCDpfw
         7zrS+c5fA7+D79nxIURrCEJDY4OgAQnNy2JeuXig8WBmTIoTLiZLdtQC12tYPg7ZShrl
         H2J+L5eBHVakxxz86Yjohhhf2AUKlwnod9kAHjWxazSfUbqGLN6Ryx1HwdH84Cui1CIF
         YnG3iDiE6d9Zy2+LU2R46NO+2QcVPd/KJ1FaEOAs2NRfguVAgjhmRZhePTxVIMDY9f8R
         NFE1TpJqMyRqjgdy3oeEtrRfHF1YK3/vCFQcypAXNftf2g3yE/mmePaX/t7iZm6+EWnX
         +HEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180295; x=1779785095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uowJO01cNG3wo8CJLveZ9KUMF6CjpxDDZdDZxhbcjXI=;
        b=LVaNiGBC9eVaxAXePn+z1u/AEx9lHzsWsrC+LsYRw/4aqDMt8BzepFwD4rhXE2ZmIf
         rsIdGxRCiWxpIJjSzzVseWJYLzaf6HdxnEE/WhZablNHzFfjm4QNmm8vJCByzbNH016Z
         SU5kE3GaaGDopQ82V9xNMiWT/z1aO+8lcfxmpplfu41ufjlcfe0CCgPpuL/t1sZLh4+N
         I5xrofF55CGsecZc+G5QxdC/dGs4qKqDuDxrlhaXvIL+WH3EnNIcDbQk0qtnIzBSF/RX
         lVruV4befta8dSSIwybRC3aH0GBsU9qI0XvqReKYXBQuG7RIhG9bKcU4nfHh5UiGInqH
         pb7g==
X-Forwarded-Encrypted: i=1; AFNElJ+UMdEb70e2+52UwXgDDyqkfE3toAcdEchpjrMQMWwm6/i3c64WoaAvxcLsosri7blvzqq2FKPKpYny@vger.kernel.org
X-Gm-Message-State: AOJu0YyKa1f+epDphfmqdzq0sRiA2fdvmm83ylcItaiM/um54Go82mZT
	tl/dSWELMR9+3bVLtvhpdluEb7grL+1MOdE5iI8sFhpWyJMfPqRzhSST
X-Gm-Gg: Acq92OEdCOHdmVOkXRrFq89zkmCaivXiKLL2wW4z5OLvebVhG8dNyDekOfdaicarA1B
	dNaMbzsbiz1qeKUclj6migI5K/TGnZEUnPeFuTpMvPyLcJkdAjMzcMbqb9mwzC6BzplW0YHlYXY
	0XfL5TO3Nmx6kaFnwpO4EQdPMeQBaQ/vxVfsUPbV53OeQ9rUKQj5brtEt/WgFOKe/bRNMQb2Aco
	rFIdAG1ZDaijWhOwadvD2H3QKFwKquHvKHDkmkyrY3hkBflqt6L+JuFI9lXSZ8Forrizx/gN/QV
	+aTqpiUhHqhhI9KTsxQYcKtNTZF7FyYOLVEuykgnbRi/gnS4HOYHZ8A1kKZxkuWMahuSFsfJdkN
	TpS8qDj++ApNq8ABY4EsMhjw2b3DKElkdlNu423CJ/CPynwsmNXIpQkp4GoM8pltvsK8CGNwA64
	kzA8WfpXjZ3ShZ4EsoB7NyUJVv7B34+vOP14IGeV/Poxrebgfqj9iJo0tKSnOm8OGjTW0cl9jPs
	LJD1J6Y4Sc3vjy/r+5yVV9mZKlhkz31aXmrwr2C44LO5g==
X-Received: by 2002:a05:6a21:6f88:b0:3b2:86a4:ab57 with SMTP id adf61e73a8af0-3b286a4ac81mr9916342637.1.1779180294752;
        Tue, 19 May 2026 01:44:54 -0700 (PDT)
Received: from lcwang-Precision-3630-Tower.. (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb08cde6sm15636619a12.13.2026.05.19.01.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:44:54 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: zaq14760@gmail.com,
	airlied@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	onlywig@gmail.com,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH 2/2] drm/tiny: add support for PIXPAPER 4.26 monochrome e-ink panel
Date: Tue, 19 May 2026 16:44:51 +0800
Message-Id: <20260519084451.2021850-1-zaq14760@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260506-bar-v1-2-12195406f4ef@gmail.com>
References: <20260506-bar-v1-2-12195406f4ef@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Gentle ping on this driver patch.

The DT binding patch has already received feedback from Conor, which I
will address in v2 by documenting why this panel needs a distinct
compatible despite sharing the same DT properties as the existing
Pixpaper panel.

Any DRM-side feedback on this driver would be appreciated.

Thanks,
LiangCheng
