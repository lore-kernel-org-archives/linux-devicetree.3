Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496942;
	b=jrTPL0zTLYi7sTUTmo+N3Tb0QCHFSLLbBDZ3eKKT3vJXdcOc7f9BpmKAP4ViHe6a0Jf+
	 nLSkq3b/9dGWhpJXGUze/aG/EpbZ3/UCpwj89JgiEFZHP4XJD4HBfQVhBvDvrIPAwy1Zz
	 Jun8AfQ1yeux4J4GFhDxGA9ZPuKFzziTmFTSD4/bcmjl4dj5tz0bcWxLPccncgfH5fKES
	 B9T88jQ0kTVoDOYCoKckm4O/6Z9LOsPsEWC2oz1/rH+t9OQHOn2/HRESgW9APb4LToal9
	 fbzhLX5zBuXVnJ+0MYnqZPcGqoZzJpPPvzzZEs7TPTSX9/kUDIRfL9seCrsfzutd7eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=E8QRxqca6MPKKmYjqBq9RkAfrZBWcYxQ/ymz9RyAO8Y=;
	b=PCVHsMwDcpbHYQA0UmM6HghR/9FBC6KzUS6NIpHLuTG2mJWtt3ynAGQyChihebyAINqM
	 walAQ1lEkhl+DhKWNAmV2hettS3hL1XBu5kUB8npcBX800E1T4O4EFzi95Ci4xTcNhyiB
	 494jNztgNYZB6f26iV0PORABdgAi/+zH9W3INDd3Fw8KkkYO4VC7Ft4zFYSIUkB0vNV2V
	 UXYx2In0yblu0U1W9Ozw/4FMSVaum3UfcT9YwIhhg+Q98eyoPOY5ma4GA8nWMmGPNCCIw
	 EZWKExOnTsudf/IURACZTLDQ+ugklVAwVjemY9qYaRcgTSo7Gp5nq+O2Qnls+Ji77ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFNCS1RQ;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD6160A382F
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AD6160A382F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFNCS1RQ
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d05d51553so31114835e9.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794496940; x=1795101740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E8QRxqca6MPKKmYjqBq9RkAfrZBWcYxQ/ymz9RyAO8Y=;
        b=CFNCS1RQhtbSxMwdv4RT7HaDOzw5D755nrRVwkL4k/OwRxOF9nDaPmGgbE6aBTSXWH
         msk1dQ3pVIxMk4yUT4CG9M7TNrpwaoIvNpJ3/pm/e0iSCd4XEBJKI8p9xJEwtSIfutCC
         stsi/5l34qljqB3RcnE4mIfJDNGptsv048CrwnBwOr0aEQYAk0b59wCbdRvQ6o8OL+fb
         cvAtr7bg4Ikai7/soQQ6V0PODVJ4pPFSeLLwUnbQMGtni8xKfY3UKMvp3w+fEstsPVjc
         i5FAdugW53dj2trdg9Fn6RkfhC18gt5RpmdSGsBIKL2h48wr0gH7pQH+a3qJOwITfh9h
         SU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794496940; x=1795101740;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E8QRxqca6MPKKmYjqBq9RkAfrZBWcYxQ/ymz9RyAO8Y=;
        b=RnV8khoJZEBQKYTEOsLLSdIwNIrEnSgUMjZnlqSUsxljJpwsNlUdUkxZzpmRmoPmtN
         SjNSMezIMUZjV9NvT8XyP6vtBUsJ6oWAHh4htPq9xupuvp1OM5Crv0g7PW7tnLrzGHlh
         G+TzPYHG7WXV9xcxr2DKcHl33cz6zBPRoy2bWvqYE2Kc4uevcnaxmOh/Ir7fSJ2pn7co
         PWF1kJAoThE/f+dzCSEgUgxtU+vMtaOJbLgUVRGjqKVeiyvobPqwazz4iXWoEF4BEFEE
         t2EAQUqex3hvTBSpVoCyq48uRbSDRVLZBvCLwOJGbkKtD+JFhiU+8Kn62cTgHmbqDF62
         Jshg==
X-Forwarded-Encrypted: i=1; AL+hErERJhGehkT9NQJUyLZo/i/BZzz6px9ND5gUnDQFYPmp1i/Huaxr5mC09lMnQeyaWPWyoMvAONPys82u@vger.kernel.org
X-Gm-Message-State: APuU4Z85v+vBe1ks9ewL9p4QkHjuWp1oGfGjpVuU+dRbhWHyLACbJoCI
	rdq/4OnMkLi6bX+yd6lFsIT2cChshVq6X+wwLRVVsiYk0sxWnCCDetWu
X-Gm-Gg: AYBFou1WmhVnZ52xW1ozd4rBZNjgd4xgLQ2/H3GyNvpeKgHykuZ3eFfgSqfuBrccxB3
	Ep06N1oYPsohpbTbjVLXTG+xE88pucY0NzrBLW4NVlg1yaFDfcfIxudSDcQY6fPdnLM7cy0iXH9
	o8asgv9O1kO8PfJh4n1hqVTH8tj0+33+LmpRRQRURQGk0wpCK8niAXVEYldZjQVocEN2pVtvjC9
	seQlVssHzlnOjXDCmtmq7MjpGqsm9xx/fIkzSxqBcn02oI+uN+OnQCTdr6lxTslbSb09P7OlEsn
	hqvvXq8O0qx+JCdbLcazvurUOSo332UvZ7IuOR/WLAvUdak/GPBi0W9dnjbIxWZ1tyEun20vFgp
	FSaWTcHq8skAQmY+uo/AwzXt7gd126y8m7TwGpXp9i3aI0e1qwqepYPutOWVVc6VyyJ9qDsB7MV
	jQ63+LjREnkf5B/rTBtpq8tlYMWqmnUxczEhefJwbtcGtHR+J8fA++gR/ZCLyQwNLu1oR7o+c8T
	HbZ1EyIUi+96b7/ldnSpieacrgjZpSl7NEEVohQe0Bki5ghTPb7R9hrQMYj37Wy1Lf9TZSyLMhv
	ce+BMpnoy0bKXwLdwCDMT7cnmxAaCMcpP6mt+O0DfajyUg2OEnTRrEA=
X-Received: by 2002:a05:600c:1c0d:b0:4a2:1e1:d55 with SMTP id 5b1f17b1804b1-4ba093a3cf9mr132094285e9.28.1794496939343;
        Thu, 12 Nov 2026 07:22:19 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e252f7fsm84746205e9.2.2026.11.12.07.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:22:18 -0800 (PST)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	Francesco Valla <francesco@valla.it>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Helge Deller <deller@gmx.de>,
	Peter Jones <pjones@redhat.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/15] Add splash DRM client
Date: Thu, 12 Nov 2026 16:22:09 +0100
Message-Id: <20261112152209.3297409-1-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <066197a1-aa2b-455b-84d8-4e2215fad764@suse.de>
References: <20261027135342.2003632-1-maximpedraza@gmail.com> <066197a1-aa2b-455b-84d8-4e2215fad764@suse.de>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Thomas, Javier, Francesco,

Thanks a lot for the reviews. I'm answering everything here in one go.

On 11/11/26 14:52, Thomas Zimmermann wrote:
> So shall we merge patches 1 to 6 and 8 first? You'd have something in
> upstream already and not chase a moving target. From there, we can merge
> the other features in the coming weeks.

Yes, that sounds great. v7 is ready and holds just those: patches 1 to 4,
6 and 8 of v6, with the MAINTAINERS entry squashed into the patch that
adds drm_splash.c, so six patches in all. The DT binding, the placement
and rotation, and the connector orientation will follow as a separate
series once this one is in.

What changes in v7 from your comments:

- the Assisted-by tags are gone from every patch (Javier)
- MAINTAINERS: I'm listed as M: and Francesco as R: (thanks, Francesco),
  in the same patch as drm_splash.c
- the firmware source is now DRM_SPLASH_SRC_FW, and the Kconfig options
  DRM_CLIENT_SPLASH_SRC_FW and DRM_CLIENT_SPLASH_FW_NAME; the BMP decoder
  keeps its name, since the BGRT goes through it too
- the drm_splash_fw_load() stub returns 0

On the CONFIG_X86 around the BGRT check in patch 4: it comes from efifb,
where efifb_bgrt_sanity_check() is x86 only too, and its comment says
that all x86 firmwares centre the image horizontally. I haven't found
that promised for other architectures, and there the check could reject
a logo that is fine, so I'd rather keep it as efifb does. If you prefer
it on every architecture, or gone, I'll change it.

The issue Sashiko found on v6 (a restore deferred while the device was
suspended) is fixed in v7, together with a few more that a later Sashiko
run found; the changelog of patch 4 lists them.

About your Reviewed-by on patch 4: since v6 the work has changed quite a
bit. Restore now leaves the commit to the work, a hotplug while userspace
holds the display waits for the next restore as fbdev does, and
unregister waits for the work before it looks for a pending firmware
request. Shall I keep your tag, or drop it so you can look at the new
version first? Whichever you prefer.

I'll send v7 shortly.

Best regards,
Màxim
