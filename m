Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779C148A2BF
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 06:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789712725; cv=none; b=MKhW8WVxl6CfclYC84j5+RDSeq6DSviTWIOm0Cl/R2pxJw29bVUdl4buJfatxkqrJGVcVtNSGzvFPqCAbhRWNLV8rWDLNRepmuqdo1039aKMJpkEo81USgU4yH/+GTrc8EBiNbtl39ROBLbRWHaa1xNMLTQ9Rns0lcoupLWSqY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789712725; c=relaxed/simple;
	bh=oc9sxhWUrwi9Su/8MAtYMSo6TS04FaaDxZwHE3X+zKs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F3BDaQQkQAz5ilkctPqAPvg3eVjbXANw3SgD08J4fTtecNeIa7wqqhnTd3RIJrZ8llJAg+RO7Cylr5Ixm3vL1eUzj1jm/A005Bia0VcjteXEb20yHUHSb6/jdOLkd8VExftw6FXRVD1IFQlzjO8vt5egJEDMbZKblAkrep0ZdCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJPBN8a7; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJPBN8a7"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e211a0so477034b3a.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 23:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789712724; x=1790317524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jt5hpx2+UWES+z68ivJ7kyasbH+hZp5tfP7Ph5RVZI8=;
        b=FJPBN8a7IaXsRtt3254MJHEMNZkTnWRlz3Wif+gA+MT2FnFyPmYTO/6GepU6K1nDq5
         Vk3Tl6tnXAV5csfX7yzul93DEBllBTerV3GpMxAnHBzBwgZpe+Zpq16mleGt1CI4vqzB
         Fi9x1WwMLL5l922KMQoXCatWxHD4WRG48PEtNsZKZ8g7guLwB1DY68+OhAw6ZODR0W8h
         MBLTWZ0bfwfwNi0ViYza1TzOvabruhTvuj3iMVIzEV5kfY7NYOVB+Tj9dtkvnreVLbOd
         oH0b5KInDBrSYAaXCuB1zZqMh6m++MalqFiPI4RKNMYo4wPD7Vod8rNq+rs6znrZrryD
         veWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789712724; x=1790317524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jt5hpx2+UWES+z68ivJ7kyasbH+hZp5tfP7Ph5RVZI8=;
        b=UO0aQZ+1S+GqPRIV87cDN1KidVAi1BeortBAqdgb9cthKYDUbyrRE+2qcfyIDQaJFV
         hIMFay/ytr5E5kAp/sUHNRY/oT4dq8lx86i+2VOP3NqEuzhPc74Xz3LmWyf6mis641Ec
         zQbvdl4Gcod0K6B1IKnTFEV4Vs+kGCrktiTSYl80uLyPWv/eRa5sdYelB+aHyzUc/3ql
         6cVgkb7QRTEuddootaaP8Pce8lfAV/bJChmwLAMYURLsjCia9NDQbSlr/ZmcWkv/O6rs
         TlWYZu+KlV4Dcx1Jt1U1ae6G1PDPNukHTwhfmz4/Jr+ysrYPn3abW5WAk1i8FQYyIvho
         g6Sw==
X-Forwarded-Encrypted: i=1; AKwUvBxGSlHsTRhKnutB7pqr+RQRxZZPqifLq4wpANyWZw/5pP3wO2HEA2XNLaINpwP+voxY+UNsELtBLOoz@vger.kernel.org
X-Gm-Message-State: AFuF++n8LOGPrBoH42aK9NyWeiWHcGdhlllhDgscBAYwDiBmcgfgY0bB
	DeaO/WhJYA1dxuJBkBR8cxf5pnNxkJFFUfMZruOikm5pmkxHqyktoAux
X-Gm-Gg: AYBFou3adb4SPj8A3FeZPV5NMbeJmB7lqvLqOIKls8qsmeiTJ4fFw/vrEUdeEqgcER0
	9LTQAo+dgvBsCy3z96qwjXOzLjhkyZSO7/o/HY262FDrINHCcwEaCZ4aEHAVeebsVmus/indDEJ
	wSqQp1uZo65VVHxbr6BhuhlF0Y5ME7B7XjiXZZT064H94RI+VUxOCZGpxzrCKHP4blgz5wlZ97J
	VezFB7f04mhxHA7kL4xareqVVS5RgCq8JLX6fdLkVie5tl1ao0HkhwjS8yzLsa8TY/cpYMYK8aT
	EAkGr7ZbSEh1UtRSOz72/3uUcC2QRxQIW64QDWmFkgMCztKBX5uVlClf6u3/4qZHmRq4OO4jYHL
	6F/4Lnkt9knNfrxPyoi0kc6LjaFaOrfwqfhO54Uq1eF27f0JLbll4nzqSJp8JAXtMjHb+NQDF0S
	+jmHsyeEpKVlginB22+nxH3GgZnJ24FtNHGi6iWIP8Z2JwUVmquXGwbsavWtH0olD0MvCJfvbnt
	xopaUDBkuIbHaJn6TX5gmwPWsoELzlyJLHDTx3m65D1s2G2nbVKeeCUbdcEC6DBGZFEkd13D8YZ
	gHQH5ZPajpY=
X-Received: by 2002:a05:6a00:2d26:b0:857:72f8:dc99 with SMTP id d2e1a72fcca58-874dddfd214mr3036061b3a.26.1789712723672;
        Thu, 17 Sep 2026 23:25:23 -0700 (PDT)
Received: from lcwang-Precision-3630-Tower.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dd9e08ecsm311788b3a.53.2026.09.17.23.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 23:25:23 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: Devarsh Thakkar <devarsht@ti.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wig Cheng <onlywig@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: LiangCheng Wang <zaq14760@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 2/2] drm/tiny: add support for PIXPAPER 4.26 monochrome e-ink panel
Date: Fri, 18 Sep 2026 14:25:18 +0800
Message-Id: <20260918062518.1824876-1-zaq14760@gmail.com>
In-Reply-To: <1f59a88c-b0b0-43d7-ba2f-4c50aae87ef4@ti.com>
References: <20260529-bar-v3-0-5c2ac1c751ee@gmail.com> <20260529-bar-v3-2-5c2ac1c751ee@gmail.com> <2bfb73e6-dca3-4d93-af04-3c644929dd19@ti.com> <20260616083921.4066690-1-zaq14760@gmail.com> <423c3dca-9589-488d-8462-c3d51f05ee4a@ti.com> <20260617020926.114947-1-zaq14760@gmail.com> <8fcfab0f-6b98-478b-be4a-c5b810fb3524@ti.com> <20260731035705.3198816-1-zaq14760@gmail.com> <20260916082924.956116-1-zaq14760@gmail.com> <0a13ccb8-8817-4223-a4a2-0de594ac8c71@suse.de> <20260916094453.1062125-1-zaq14760@gmail.com> <f4c6feab-b1ec-48df-81a5-888444b243a3@suse.de> <20260917025644.1262504-1-zaq14760@gmail.com> <CAFOAJEfnDrGTg40h=R0mfZasroPkrSsmbVmmMA91O9uOzu_gYQ@mail.gmail.com> <0259fb51-acb8-4b07-a6d5-2fe25fb0de9c@suse.de> <CAFOAJEe_7Cqo_=NWPGyYBTu3mD3CjPMC92ZZR6qHPjAhQws7pw@mail.gmail.com> <1f59a88c-b0b0-43d7-ba2f-4c50aae87ef4@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Devarsh,

Good to hear from you, and thank you for picking the fixes up.

> Kindly let me know if we are aligned on this.

That all sounds good to me, and I am glad it is moving again.  I will test
v2 on the PIXPAPER 4.26m as soon as it is out and send a Tested-by.

There is one thing worth settling before you post.  Back in July [1] you
wrote:

  Certainly. I'll exclude the pixpaper-426m support patches from my V2
  submission so you can handle the review and validation on your end.

That is still what I would prefer: the 4.26m is the only SSD16xx hardware
I have, and its binding is already acked, so I am in a good position to
validate the panel and to look after it afterwards.  Unless you would
rather it went differently, I will send the panel entry and its binding on
top of your v2 once it is out.

Please reshape the three fixes however v2 needs - they were written
against your staging branch and the driver has moved on since.  Two small
requests from my reply at the time [2]:

  Please keep them as separate commits if you can - git am preserves
  authorship; if you fold the first one in, a Co-developed-by with my
  Signed-off-by would be appreciated.

  I maintain the existing PIXPAPER MAINTAINERS entry - would you mind
  adding me as R: on the SSD16xx one, so I stay on CC and can retest?

[1] https://lore.kernel.org/all/8fcfab0f-6b98-478b-be4a-c5b810fb3524@ti.com/
[2] https://lore.kernel.org/all/20260731035705.3198816-1-zaq14760@gmail.com/

Regards,
LiangCheng
