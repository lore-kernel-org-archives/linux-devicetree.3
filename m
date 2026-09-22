Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D3652E07E
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067366; cv=none; b=mwLi7/DaweBbYWTsC9UO7ysDLAT5mubd5hRmJC8R8tzt82TeAU3pHYiWANjyHwmI29KL8WEQ3Eyq57538zihnWS+6fRK70uSn8qhhIaPORdUe+VABUxLx6CFye5RbObE/Me/5kbGF8m1BmmqCdB26dQXPXIXZKUaq5w69zt1nS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067366; c=relaxed/simple;
	bh=jHvRFtQyx9UQ53om8i4AUQfufcwc3sWn9Gux2Mdm/VQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OOWzH3pkp70COgHYtNDAC8twaZPpUUxp+SF6RixkTiBSv/3KaPdruY/kJNnGPUp3l5lIC32sJnhE9tMpWfI9UdRaAVC9jxCCMoU3aiWNR7u6amCaJvtaiOGzGlqfAeosGWxtv7AofaNDypNLGJl+ZgeBrxGOvNz5oyfGiDsfTvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcwSgb8P; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcwSgb8P"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ddd5d0aso1684885e9.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790067363; x=1790672163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jHvRFtQyx9UQ53om8i4AUQfufcwc3sWn9Gux2Mdm/VQ=;
        b=BcwSgb8PESGiEHRSB8rU42O+kh7XbBP/eXgYknFVk2ofYd//sb9r1R9Mb+mb7yUCEU
         /Zdokqi4DKnZ1OsvOx0xzYuMWO5Wiyj268O3SIw/MfITyrw0ak+VUcAOl9/0zxLuIQSr
         Z55/6DyZSCxq2r2ReOr9FEk1LymRES6AbqIpyebGqqlydfXQffF1ijVCQn0+4pVlc9CC
         mebOzsH4L3+pO+1eZFdVnpuESxP7x3n1ALqfd57BnGgYFuScrTUDLR1rPrN3bA7FjiKU
         Y3DHfQnxvIscvIXlwqKOkM1tAV5lICFMF29JNqVmvr/3kslF9WVOKzrp9CrP1eQEvsKg
         h72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790067363; x=1790672163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jHvRFtQyx9UQ53om8i4AUQfufcwc3sWn9Gux2Mdm/VQ=;
        b=uOZk0q3KVeffrDZwF8ZLovY6R+yOF1IcqXGLQPEXdEn8gAWJmONPrPwpikIndP1lzZ
         69uqNiT017PSKXuWseW542Nnj8pgtL5L+hES28sZ2FjOl0R/o1uwrigLQ2XWTs4f0+1V
         Vj1VlvvZ0yjHjnsiCKRfCNYIs0ezMsxBa+/C4MfcI7Ubi7J8VucAvPh1Okaczekq9Krr
         rC/1zVPE1DoWN9Gi75u+RqjzdUVh3PST1+TBoVLEwrAARrnQcoyuxc0VKobyNrz8KG62
         RYke0BzDjz0JjUjyhcjV/quQQJffzvpnQareX+Mk57z2/kATiKnfRpbkDtlp8M7NiQBY
         1h0w==
X-Forwarded-Encrypted: i=1; AKwUvBziW8LkZyo7e0RVnAEMLpBmk7CqIn219ERX8/FEs9D7+3uzRV6VodJMEjt44bd2+1VsqiLYQP24x4lj@vger.kernel.org
X-Gm-Message-State: AFuF++l5oYa9Yewd3I0XwWuzhmpPJtFBX5KlbDzpIhiWf/mM/0k0q9fd
	LXrOordjC6ttj+nIwe58zfugdT/AewPuzV4kszFgt7TsdEm37fjQ3uSX
X-Gm-Gg: AYBFou1mOnKBPPw+jEON5wOu9kaTkFqco+g67QfQ2ktaDiyjFR8/iPmMQTNkkLD0hHb
	bcLOzzbzUAcgYSaPP/9GixTErE6c+RlthoPUrXu/offNl+ponkH/6u3smS3v1tRnvOJt3DzBP6q
	lOsECYgr5ELAUrv55rHVzhPwhbj2ogPuvDUabo895azdCmZhUpS4pnA6u9ZbaQVrSFxxpNw1lBx
	BJF29FWxaB5dEtDPjX/Co5uRuHG6H6a4y2lrY/4C6oPD4KeNB/BkiB+XM9FUUqh/3nFSGvc33sh
	MCZv3ncdqP8GCr2aoRGLmYQvFDHxH2TdEuPcFMu4bb+/AJ1F46xHIlefuzOjMk1oBdpd20DRxug
	MVT/6P2MoH8CrnMYeLt4BcvK5JkWdI2YTJpStsUQ5a5ubNBxXBpaoNZxHqLKr8toMThQ5vHOWIb
	fVDqS0s8spnjWlU4a0mlXquIAC4r2+UebwDCvJwbRkZ+RmSpx9hZ8CyC7TdU1h3pgLaZRik0ykd
	1QbRfD08BGmLuo4qBph68wwOjZ1OzEFVZ8JYl0qFzjnysBlxsPHneZZukrvEo639jTPRaJZctDF
	Ed4=
X-Received: by 2002:a05:600c:1c13:b0:49e:7186:f36e with SMTP id 5b1f17b1804b1-49fc7dc1e75mr211705895e9.1.1790067363190;
        Tue, 22 Sep 2026 01:56:03 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B80530056971C6280202175.dsl.pool.telekom.hu. [2001:4c4e:1b80:5300:5697:1c62:8020:2175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886277e611sm3538781f8f.18.2026.09.22.01.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:56:02 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/11] accel/rocket: restore the NPU clock boot rate before powering the cores down
Date: Tue, 22 Sep 2026 10:55:37 +0200
Message-ID: <20260922085537.53363-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922081326.B46651F000FF@smtp.kernel.org>
References: <20260922080114.44662-1-royalnet026@gmail.com> <20260922080114.44662-9-royalnet026@gmail.com> <20260922081326.B46651F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the shutdown question from the Sashiko review of this patch:

The gap is real, but it predates this patch. The driver in drm-misc-next
has no .shutdown callback at all, so a reboot or kexec with a job in
flight already leaves the cores running today. The callback added here
takes the devfreq device down and puts the clock back to its boot rate;
it does not stop, drain or reset the cores.

Quiescing the cores on shutdown (stopping the schedulers and resetting
the cores through rocket_core_reset()) is part of the same teardown work
as the use-after-free under "Not done" in the cover letter, where a core
is unbound while clients submit: both need the driver to stop its
schedulers and cores while files are still open. I would rather fix
both in one follow-up, once Tomeu has said which way he wants the
teardown to go.

Igor
