Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433167;
	b=DQ600y+6XQdBCQIolJiuTZJ2++tE6+bQiWxvq+xT8X528bDh+QxjhV873aVoXjt7IVqP
	 u3GzK1mVbo+1t5CbMg9TKS+gjvw9c8K8MzgDEPQyS0yRh33Lb9IrFm1dFp/G/CLLyQAkO
	 /WA4Tb0qUPRxrVmb8I3D5NCsIXKaGg8J5KEbH/OZvv4u7NnFluLQs9d7DBvDEhZBAnEKL
	 2imCbi7eOQYCiRAvxKnP3+f1rh16z73eOpDlwtIcUzlk+pf8wEGcRmVblJPqyknjJtSeF
	 aZSaLYmhgvU90egte+HBZdkW/1facW+tluLrtLJEP9fuK5MQiQrRXYFn4NVYdBptTqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Io7ujKNNt7SQhbgiNtNsmPHGRtWoUuLSgdS1AFaBjnc=;
	b=pVhkIor7T5V2DCDoa2cboahxgqKPYAjhkKSc0tY/g5GpgPf3Qm01jl6RYJw+tAyLkfde
	 cnIaCuPCQIJvGNKTRfyHLJnlmTEumkThsT0u63LX2tHCmkvSQR2fKpEBRNp23ic7KLFah
	 ObnSQ52l736xC2X949HKX/MWJPWMh1gSdLM4CHJtZeubIHf5Ami1nVo8KgDvZ94v6nDT9
	 5Jj1158CyYcSdF9IEDKHbo20NLIVx8f/Ly3oSR4rUzbzOqrwKdlb4Rm797zqcKDeMWY+1
	 g2dcJQ5IbPKhpqv5XFX3bXYPdYoOWVKhz/kEi0kDPk9XSJAUQcz0goNb9UCkdwZzTvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DmuyGlSV;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6F3606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB6F3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DmuyGlSV
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ae93a86008so1736498a91.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 03:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795433166; x=1796037966; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Io7ujKNNt7SQhbgiNtNsmPHGRtWoUuLSgdS1AFaBjnc=;
        b=DmuyGlSVyG0u5kdHOp1ild90T4N/HC7n+JkFjIWZ7Qz0SJ/qFf78h+3H1j8N1TLC8/
         dFYgp2JnaSmUDKnkMd4SWTZ7Sr/32VbO71cd5+kUIBjBCy2YfgrbHSjV4Mi774QTss4L
         58rqlv5QMJZSVsd3hLGM1ziY8Udp8cnfbjZGpQRuZYH3E5ojg/owA6GyvNumphsyF8pw
         F94jWV42N+KzboOAVlP0DCuL38oHmXRmrrCwE7OY2+nFiA72NaD7E1UQnts9UqCt1WLD
         zhB31LMAV2ev4ZD5wC+U/dscosPhA+hfIuN3zZZGQWXcML0UnxKaGSjP8sIH7mdWslFM
         KlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433166; x=1796037966;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Io7ujKNNt7SQhbgiNtNsmPHGRtWoUuLSgdS1AFaBjnc=;
        b=hCMqNTMQNGnBvLv3l7tG1XWmkxz19n3crIFvzFkz+hDFy3LXH4wYmgG4DhdSpftqz8
         qtvOQVfjD5SOps2lYEns8p4uDQA9CRryqwVkiHVjHVMesOlhlGxepijsTgF0yFhfMTB1
         hDCyxJWLTcMiWAOI88dSDXT/Q797u5YL7jANCCou2cU/JXnIYI2aFCpz50csLQlqmchr
         q8rDk5hQCHdng4ip2YQf8Bapfr6enY1qk+IeJbTrjwQl85yD4vfi5xwhVRVhO83cuDkz
         4JJUa2ITYw1p2U40OVgZ+jZbRNVN0XLyTU9n8doG1gQ6IeQHYgjOgh9Wi3ekLBYGxdWr
         TFDA==
X-Forwarded-Encrypted: i=1; AL+hErHsABBgjJ6CDBM+uNfDQK8/PvTuygK4MRb8CxL4EWbccRcU8pJknmX2QhZlg7zaD6eR5KUGrJWx5aLM@vger.kernel.org
X-Gm-Message-State: APuU4Z8QB6n/s50FMDAF13dgcO+2Q8lYyxyY0z899TKAISQJOg7MozBX
	AtB2bEVOrjmPih1TdAL9ml6Ibh/T19A/opKXGg0utpt0S4BhSAL1G0if
X-Gm-Gg: AZFdTZd3LhJ/1sX5G36fVJHZ6EndI9v8k5qm+Hahqg/5mGVGNWWpQ60zsHWTC0PVmTJ
	twQf2o2EO0b8PJ6X4NdAXnD0KJvqWSva9d773jDexvcNl1NQpWVnTRiO8s9K2l/YJFl8xVhG8YG
	CLZrTlEwKWX0EBCDU01uidW5zspexU0Hc9wtB/s1rgI5Npyowws50nPS9fVbeAsNZrLVZpumCoI
	I8IlK8gAD4q7RCBtjOd6TLguKL1DYU4IhLlVHknuZe4B4wZGcTPzXfyreJuN2iuLAIRtekNWTU6
	CnrClMOXqttwdAX+EQnPxoVtOhnzu/ZLxXuiggXCf43m74mBrTpB53GVsoK7jJsGc5xynHxk7R6
	ACfRyVcIr6OZwGZ7DqETGidFl6FUCPnAAyhBc1goZ6ao2qMN35Uf45/tYcpdZ3rxZ+B/aG3Ha96
	oc10Ma+ftmwT4oHVUKoDvjcTIDMTueCmoIwwzCViUKLoKpkeT5TSgjI7WUlRD1mnnnm5sDAy2xc
	k6dNwI7JhJArAx8ro4rX0z0RgmZBlmpMzH+jk5v5FUWNpYtywByXMBMneRJpGF9ieZxEto4pz+p
	wtzHnU00cMzPa5guwQ6utESoc64whe2JuHQ=
X-Received: by 2002:a17:90b:4c07:b0:3b4:f92:ade7 with SMTP id 98e67ed59e1d1-3b41cb20eb8mr10517519a91.52.1795433165943;
        Mon, 23 Nov 2026 03:26:05 -0800 (PST)
Received: from localhost ([2403:2c80:6::10a9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8e93asm17449770a91.11.2026.11.23.03.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:26:05 -0800 (PST)
Date: Mon, 23 Nov 2026 19:26:02 +0800
Message-ID: <f5c6f44bfb6040289653cdc079b1cb2a.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Yixun Lan <dlan@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Guodong Xu <docular.xu@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Sarah Emery <sarah.emery@canonical.com>, Ze Huang <ze.huang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 10/17] drm/spacemit: add Saturn DPU KMS pipeline
In-Reply-To: <awPxPHpr4NYxqdmf@houat>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
 <20261121-k3-display-v3-10-ec419e8e96b8@gmail.com> <awPxPHpr4NYxqdmf@houat>
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

Hi Maxime,

On Mon, 23 Nov 2026 08:55:40 +0100, Maxime Ripard wrote:
> On Sat, Nov 21, 2026 at 03:40:49PM +0800, Cody Kang via B4 Relay wrote:
> > +static int spacemit_drm_master_bind(struct device *dev)
[...]
> > +	drm_mode_config_reset(drm);
>
> You need to use drm_mode_config_create_initial_state().

Thanks for the review. Will fix in v4.

Cody
