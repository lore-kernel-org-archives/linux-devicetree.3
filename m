Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872257;
	b=4M92WmWdw5TS3J9NFyc65Gu6gTYro6EHQxIOO1K6JaQs8itaPaM321qQVITSH/9/pbgA
	 hVFazWtdkE6b+o3KVrzoSuc1qBX2BeadIbDMEH6NJaeFCTWGSZhk4DV4yY35vbTudZ/1x
	 FmIQps9O2+8iTt/TGeiT+cnnBK01LtD2Z9zhpetAbZiwVS3LDh0KjbTtx1kSlBqh+nwRt
	 3Mt4657VJDAskg1u+DmLJT41UoNOvUfP0iEnnLNsuLiueHudy7ZVgt9rdk4c5HRbM86VA
	 ZUrGH7cltIOVqOZME0PViEm+Skzf3CGejrSkEabNqa9TqrwOxxvomDWouslMVk0rmRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dyBthqcbOdm0JBXumEJTj6vVAKyTrhFZS6V5YGIPQiQ=;
	b=odF8FSsRG8wTCpQV7VhMkt4h8GTAg3C62l6xLoQK+zxKwvG0GBZiZEyxavJDllm5PoFi
	 +TViGs3IMxQ2yJdHDLohDN7iTDOET51EKdyOs3zVWf3niy0QITbFxD5fDk/3ZBpEPhJ5x
	 AEaz8zr2znAVpQthqpP8s+QoD1433ZzSYlrLPhaDioCVwhJ8eqGsKL6+YGnIf9n+Yvlky
	 c7DHqR5U7oCJqLvTl36oyVoBMfjcFSrwggXUTxDgD1zWm+lxYqkk8m2VnJLrkpO6MeC6C
	 dFGzX4yUTHioE5at/cVwxN1RzqpbsCp92yJC2i79Vn82lCF63SPJWeqjPdwi077mqtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MuatEXYp;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC28606D83B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 09:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BC28606D83B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MuatEXYp
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48df54150dfso1128873f8f.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 01:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793872256; x=1794477056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyBthqcbOdm0JBXumEJTj6vVAKyTrhFZS6V5YGIPQiQ=;
        b=MuatEXYpYw5XB606NqlQPnOrhLM+ru/tYWtVbN/B2SnvQlfzf5rLbz2XYhFsx5mFxz
         CFMhcUVhCGgDe3tZCFlynn0RuDRRoMY4DnZcB4jkCuOCmuYm+B4MTy8Am6omYrJ1BxNa
         JQQBCEaU0BSP6/nDQeb9Dzst5j1pYTT4NYcmCiNQpqi7C52qLAXPG7FFy1LPReoselXj
         kQR/EPVR3+Pzf96RkzGWCh6wIa3t/uYdxfpRURkMnwxJQEALfb2zh1wM2wF+O9FPszHY
         4pUdGYaX34ysNMqvTf6RkQDYDl2EiFPE4Wm3ybIq1tjH96F85EfqvBDU05xr7i2X9Ecy
         j6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872256; x=1794477056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dyBthqcbOdm0JBXumEJTj6vVAKyTrhFZS6V5YGIPQiQ=;
        b=EpwZ/dQy/v4EDljo9U3havMrui22Ba0Li8Y8+K9su6Dml3k8JBPaGOjcuRCUyc2s6I
         7SAql6brVcC4VSNkw54c+mCAxsDPHjmGRZpdi2IFz0A/F/1rhF9n7qWzk4e4FaCfDbv/
         lvocPoAwVkmkmg5/ohNYHLcKfx1dB/u35ZQAhcwIOn1UrFu72WUscZd11wHSyg0L7ibZ
         34KgruT49U4uFo2nxewASaaYHhgqrGqnkGO7I7MBj50tUGeUWmQSK68M70GxbP2gHYrZ
         jYRuaq5Nkj419XGR+EtnnD9kmM79RBBh/wn5EI1tSBj7IGtUs2VZX7vkMK2+ok4ktmXf
         LXQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwD0aXEazwBPoBdgFr04TdopqISIfnHL+uVdqYcmdhxA2ccA/V0coNFVMJn+UDPv4nb7b/oUyXy1X55@vger.kernel.org
X-Gm-Message-State: APuU4Z8x0tRfdUVDNO0KCBRCIkuVtn6V1EhIVjzCuVzP/9GKJ57bcsIS
	8OBxjRYnE1A4xXTiGKCcmCuplfvWGs5sS+gD49G3QX/ggDIHOTs5Xhq1
X-Gm-Gg: AYBFou2ytQfVaCQWQT4WmmCBEdnlRzwp6i+4itc0mOWtVyhm6RoU6U3ktnEN+PhHEKG
	9rdRPjZ5DFKrd72XPh36Dys0sfk6RE8oWPrm/X9x1GqsrK8PrnCoWLxqYIaWBl1dCwFHaXem4S9
	kPmO37mGEIqWW4JbdDdgUN4yYubtYHo4M/vGpsJSGfiHbylyWDpC53w8kP7h5EAtEPwwAbfHmh5
	0wE4ob/wXzcMtaqM5pI6NhTzpp6jY7hnJEZQycLFz367UOvJa9KAWKyM4sm8d/NdOS2vnZ/LOZr
	Tg3tALyEddjwsJbBeYDoZV1Fpc1FNEhOYNyUojp/FA0eATsNXcA0lGDAL0kB2wAzde5gKiHTpS4
	P0CMZv3mNDGcp+VPGebCFThsGzlimGBbdgXULGy6Gh8sHEqAM5cw+2WlZXF8Uin3ewLlCXEByl1
	Q6qHviDbb2aLzFEncHA77RgQc1/3lh0RkCWupud5+pxIAi4JZaDbGtMLovPjBQbHWs7iqGpxenO
	YWMfjiPPHQBlSMrzU0qqF18CCnfDii6vs9crTVwrbdPkwchSyO6K8nArzYOgYhrRXLk+PkQapxJ
	EcEtXJQQC//jNKoiMcB44WPDJh9PGUok92obl+xyivPP5oEN4vjHc3FIS4eSaD75NYFsJr4Y16b
	wVTTqveTuJfKXjS0q5ypYfPQli/M=
X-Received: by 2002:a05:6000:2282:b0:48d:f14a:9188 with SMTP id ffacd0b85a97d-48e73851611mr39371636f8f.17.1793872255636;
        Thu, 05 Nov 2026 01:50:55 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.lan ([2001:861:39c2:e340:c87a:3b37:3ef1:5ced])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fe7189883sm9331056f8f.0.2026.11.05.01.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:50:55 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Igor Reznichenko <igor@reznichenko.net>
Cc: airlied@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	jesszhan0024@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH 4/4] drm/panel: ilitek-ili9488: add the PocketGo S30 panel
Date: Thu,  5 Nov 2026 10:50:45 +0100
Message-ID: <20261105095054.117210-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105040526.26323-1-igor@reznichenko.net>
References: <20261103110524.2812831-5-romain.tisserand@gmail.com> <20261105040526.26323-1-igor@reznichenko.net>
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

Hi Igor,

On Wed, Nov 04, 2026 at 08:05:26PM -0800, Igor Reznichenko wrote:
> Minor suggestion: please drop the implication that COLMOD 0x66 causes DSI to
> display at 6bpc; the datasheet doesn't establish that causality.
> I think COLMOD only applies to DPI and DBI, not DSI. The initialization
> sequence can remain unchanged. Non-blocking.

Thanks for the review. Agreed: the commit message should only say that the
init sequence keeps the stock COLMOD value, without claiming an effect on
the DSI path. If a v2 is needed I'll reword it there; otherwise maybe it can
be fixed up when applying.

Romain
