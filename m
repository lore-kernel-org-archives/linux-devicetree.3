Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC002F0680
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828324; cv=none; b=r8mf8lIlfB3c3Tg5LpMANg/5WRrnRDlii6gnJvZti+5p1LbUMAJAQhx+LJlWZzIq8IKwuCUaGOL04U+HDVPCtXyNnBANY1W7DiLIlG3G7/lDvmVRScBSXelmhUF3BhkEDU21Tcwh2nqptYhHKn79ar9PUslMgDLbmq3jxY5bq+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828324; c=relaxed/simple;
	bh=h4Bk2vS84/K+uN7N+3iFwUXv7x6OXYbSuSCpCdgMOCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KfZIOgZOjuFyHuX6y5stfUMZJKPCG88p9opBfZrU5OGvLDnrO4a/0xE/uYOzPzEW4d2ehmUKebbhbi9UPr++HwgTZDwRAVUwhKexPrfD/X/VTDTeyt4yGT2wtSYSQWRSlc7JL4UBbqx5T8oPe6iQSiqi+yK++eBPKrqg2MqG7+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7BepRbR; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7BepRbR"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4704d652e9cso2388369f8f.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782828322; x=1783433122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6LhOb8EsOqkumof6PN234kRqnlpHLJfaxXGP2ixv0M=;
        b=H7BepRbR/8PmRwAKRqndLR+nEYUr6RuDFE4LyPo4FYdYnv5LioyoWPQhQUflNpC0BA
         WA8qF1gOVtAt1ryjpT5gcS6x2c0Eotec97douipPQhkAZbq0/UoXII96pWk6+f9W9u0W
         693J/033GwiKmH1eGN7SiC2v290KKptijEDg/yieBqYIWh7BNwZWA/nyXEUpp8r09Btq
         r1s5Jh+Sgs6q5ZTgEEfQspmDzfq6KKO+gRf1c3Ipwa6REjOdztsuQ+rqjFavT0zHzm2J
         gToHFSAOkmZjHvjxJ4bSaAXXyo+tgGSC9Ah4m3qggLMTPb2A4Iibb5YLXKby6FaGWnH6
         LUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828322; x=1783433122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O6LhOb8EsOqkumof6PN234kRqnlpHLJfaxXGP2ixv0M=;
        b=dlE5MTKKH7dp9djnAdEPEUtmjbm3Sfo2oV6iAcUrP/6ew8XJ4HCEzX4mFdIXjzqZVe
         VEB30+0l5IulBydG76nNWwRvScpmjhQG9lLuk+E840lC8gRNPwa/O7YonH2ZOkW4dMLk
         VfDLCM5RQDF66OcyB+j4qgSD1CC+GTRWOq2nu8Acso7RT/LVZC3tKor/8Dn646mzuYL0
         Cvila01J+j6oyN/34Z34p5inL78fuqmXW+dLrrUm1l6uMDtMFwO/whvNqXWaa+bPZL3i
         m843Q2a5FvZNk4Rf6K3RaFncTc2Vm/p5W5oa9gSJ4QnTprP3GMjkxds+NxKoyOF+/S/g
         GbfQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKUU2461dImOX3jMrzLCWly5DoL/WFpZi5jrRbLknzhKXwvpwEZbvF5mGetHeqFvmB6OfpZ9RihIKA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7bOnGL4wj5vBna9xvMu+yr9/6aFxTx79RBJKsln5Fb06XgTiP
	3kW8y4nWoNGGBDY5UWlFhKHouliStQC3T3dI46veHa9sS440Rs2AQbsj
X-Gm-Gg: AfdE7cnWjlSp9BJL3oBYm/Dqonz1kutkBWvwV17TwItDPRNA9rZ0/iiqiHyCZxO2Vg4
	AcMnWe1lUdOXG7Cn5IZJ7tcxfnYKREXLPCMV3k9QTxLBlLftmwC8YEGplo7oHq8HeHP2eokMmtN
	HvUpKVI1iqsM1/ICs+Ejg5zbiw/pYS/+bEtWzfH2VV3Qxk+6g0BTfp3O3WcXKrs7IwRkZHwlipo
	udMpzndIoK3nMDtMl75fAf95VofARKsFEUheF3Uzl1Gfzm6q9VehoLwkG17v5pj9lwwTT0QN8me
	MgUP/dyb9D8BgvWFYMkCeF3QngPjkeCGhGQR2KWo9SYovTPqOLTrtJ09ptiYYsOZnNuOWJ0vSgt
	UpSMUuY/jjLuAz5QtcOSh45IGCa/Wnp2wK83AQNQZNdo9/oM0YLNBrxQLlyS5XKGToQcnma0y/e
	tqMMWnp/9oCwb04EL4nZk6aMTSS04=
X-Received: by 2002:a05:6000:2510:b0:475:f0f0:9ed0 with SMTP id ffacd0b85a97d-475f0f0a0d6mr2897097f8f.59.1782828319713;
        Tue, 30 Jun 2026 07:05:19 -0700 (PDT)
Received: from anthony.local ([2a06:c701:49b2:4c00:12ff:e0ff:fea5:3d2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756778f015sm8456382f8f.31.2026.06.30.07.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:05:19 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: javierm@redhat.com
Cc: airlied@gmail.com,
	andy@kernel.org,
	azuddinadam@gmail.com,
	chintanlike@gmail.com,
	conor+dt@kernel.org,
	deller@gmx.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	gregkh@linuxfoundation.org,
	krzk+dt@kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH v2 2/4] drm/ssd130x: Add RGB565 support to SSD133X family
Date: Tue, 30 Jun 2026 17:04:53 +0300
Message-ID: <20260630140453.78029-1-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <87jyrhd58b.fsf@ocarina.mail-host-address-is-not-set>
References: <87jyrhd58b.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Javier Martinez Canillas <javierm@redhat.com> writes:
> Given that we don't have that, I suppose that we could just get rid of the
> DRM_FORMAT_RGB332 support for SSD133X and just default to DRM_FORMAT_RGB565.

I see your point. In v3 I'll remove the format_rgb565 option and just make RGB565 
compatible screens (ssd133x and ssd135x) use the higher color depth.

--
Thanks,
Amit
