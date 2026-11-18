Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017028;
	b=ImdLqZQVzOSflxBOg9Ype8PxlGss0cyk2GJUCloguYcGHQLRmDeKfm4CWRCLgqtd6xJp
	 YoPClza5e3NabAopdrbrhUkbZ5ZmRjiBiqYkIVLSkaGAY5ITvPRFIIM586VKr5SYmrgvd
	 yfwLbYvHRhAbB6FbWQqor45nG+/oAYBag22Ruu5VqIzh0SES0LhaC6ikWVvcX78t3rncJ
	 M8haD9UQ36fK1B80OQriGIpegZiV98ufksXsNLS7SekoGsRq+y19Yu9+CjAPVRZyx6i4X
	 lbe3V5QjCdrCNIlqejp5T7c8GE5k4ndJSwNV01hRvqDDquuBT/6Zt07NWHG7SDrzolA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=4lLupD4z98CK9UrD3eQfsjdZUJgyZTecsH4A98HzZRA=;
	b=1it9RHWo0oDhINiptRSjgxIw6OFaVtt/VMZbRfFxY3aCk5nNonTGxWgeqctj/6tw0nel
	 OLgXQ8iXX9JmLb9IM9OPGR6d/clUjYPuKypNqNO8y67oFLNWOyF8QcKGH1I3F1H3LtqEs
	 7KNw8oGjdWkCYOBw2wvjBoIIt9QHVrpLrFjMUspJXW7AF7aK4OEHdmrRzHI1WOe07g6k9
	 9iyF9tDjcnBoT6FO+ylBeN5TvYsMY3Lcj4JOjzJEUyCKg0760bRq1iIEuhEBoNwt+NX0T
	 AMpuM1SCJtiepheV+b5NKfT+lSa+BTgOqcGUpsF/KhfU92YC6XTZje8gwA7I53lt73g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MSO35Hm6;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B543606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B543606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MSO35Hm6
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3adc0ac3566so219733a91.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795017028; x=1795621828; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4lLupD4z98CK9UrD3eQfsjdZUJgyZTecsH4A98HzZRA=;
        b=MSO35Hm6I/4kMAm6rw/yxcLf4rXYh1V8nShplW0798fPwvqCSiPt6Q6viUQuxOWdSa
         DyUQrEukZoLJ6rxQwsHQbvzI89LmfNKBmSjiwWbwXEHGbmhvAudUjl+7HahYcdqoE67W
         VB2ehkQHIxUfqpiD/4BlgAuK1gu1LrsWI7Ml1ahXovIaXVDUj5OMvIjAvFcc/XOG4iFt
         eH9VteH5wHSfuh7G3AayJU+egp6im8+fKsbpPe2uxVWftUhmK2dIJtsxDzVeP5hPU67D
         t1h5lsPSrR09qZErNDCpKhBFmtChIoTnhCdgYBkJcW4iYINPBhjETDS0Q7y08j9EJLcj
         5PRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017028; x=1795621828;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lLupD4z98CK9UrD3eQfsjdZUJgyZTecsH4A98HzZRA=;
        b=JiyX3lC0oqJ3a2PyWj63J82EhqyRd4FxpS5W8aCIZnom4TpOsOVVDGlTAzGFUK1igw
         8O17khZDjGdpeV/gP+F4HLGRgNWZzJXZQ1hbi/Tycyh0PCNh3BCLUo7ckOURoM9bae8v
         +J5do+lS0iLyMx7yXxRXJ3Rd5KA3YG5uGAN+qSB4bvnCEkvHHJ78dCtX6pR9affVif2j
         k3DiacvccsTY0EFdKh/jq1E7gCvW35plxhif6yLkfhKIcKXDPo12fq5NIWk8VGYRM7ek
         3g1rTTOM/8gEKiqEdAvcWyRcM/SzYDIL6DFNU+ZcxRbvqLjQYwTIMrHXFwAqVDOjsOLa
         JO1w==
X-Forwarded-Encrypted: i=1; AL+hErEc+MxaJMHkFAVq9Lw2AMPnM13UNAXcTU09XEqKWyaEy3JDNfnNWZ9DbT+A0mNX4Cm4GthF4rqIjhrL@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ts0HuAp4C0nDdCa3G+wjTMO4xxLREJD0Os76di/0jw1PBhMCB
	23vAo43Y+JPy6vARusZIZDy3Zc+NfqCf4K/DcXs/Ba3GeiWSau1USNtQ
X-Gm-Gg: AZFdTZeQXveGHlygN/wKfWocBrwvZlcbhm9hRUmym3bjOrDpStLMDMfi1h5HsKaSZDo
	6PPZLJYO1V1wFxdOU+xOV26dHYyx2oF9dnGAmWNIypxvChLw06SrWCU046UASIxUC1WoYwHn0e6
	AFfJVUEf53y/yUt/KWGUf5pWfhHFclCXbZ9RmnsZVmYj7lrUEXkQWWmRKw7fGu7Men+D9+69B7n
	eFQc+DVwxmcqqJQkPLc0vm0H3F0Dc5T8pZBVXUZJs17jZR4GQOX+PuLj6Z1DG9iTXrMK/4r/Hys
	MqUVnGX1Nm92d5GUPYTdv4bxSs1vT2zqtWwhXghkhMAJo3pg/qbtQBf2xCdDiU7q+1f1afL9HSJ
	TtPRlP1lKHw7qQ9IVB1ku6gj8BZgQPNrjTYre7AYFtLH3TSEQJRpnC4cm6TuAe0dUA8+r5l8eNu
	RsbR1/vr65pNemwPzMCgXFZthLAV4R4u1SjFQrNhuwfG8L4RGCSYQYVhYhDLV740cvtam83Nlgd
	XX66jrqYc8/zXDGnmXhdb6Iq/SDD7QsHyBeScsTAvq7OflVoW+BALzuqBdzO+VVVaGGcKXsHzwV
	L1g=
X-Received: by 2002:a17:90a:dfcf:b0:3ac:9d14:feb1 with SMTP id 98e67ed59e1d1-3b3d07c9ca5mr3201351a91.43.1795017027692;
        Wed, 18 Nov 2026 07:50:27 -0800 (PST)
Received: from localhost ([2403:2c80:6::107b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534ae0edsm193214a12.21.2026.11.18.07.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:50:27 -0800 (PST)
Date: Wed, 18 Nov 2026 23:50:21 +0800
Message-ID: <aee275aa2ebf093d8518e53c5d264064.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Guodong Xu <docular.xu@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 11/17] drm/spacemit: add Saturn DPU DRM device driver
In-Reply-To: <e492222feabaa5c72229c93ce75f9500e4346da1.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-11-327d7910bf71@gmail.com>
 <e492222feabaa5c72229c93ce75f9500e4346da1.camel@icenowy.me>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Icenowy,

On Thu, 03 Sep 2026 20:07:32 +0800, Icenowy Zheng wrote:
> 在 2026-08-09日的 21:14 +0800，Cody Kang via B4 Relay写道：
> > From: Cody Kang <codykang.hk@gmail.com>
[...]
> > +	drm->mode_config.min_width = 1;
> > +	drm->mode_config.min_height = 1;
> > +	/* K3 user manual: each DPU scans out at most 3840x2160@60
> > */
> > +	drm->mode_config.max_width = 3840;
> > +	drm->mode_config.max_height = 2160;
>
> This is for the biggest possible framebuffer instead of the possible
> scanout pixel count.
>
> The width here should be based on the maximum allowed pitch of the
> display controller instead of the single-GPU maximum size, otherwise it
> won't be able to drive two 3840x2160 screens in a side-by-side
> configuration because this will create a 7680x2160 framebuffer.

Thanks for the review. Agreed; will fix in v3.

v3 will take max_width/max_height from what the RDMA registers can
address (a 16-bit byte stride and 16-bit image dimensions), and move
the 3840x2160 limit into the CRTC's mode_valid.

Cody
