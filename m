Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F707484238
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 19:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933191; cv=pass; b=IvribZW6mXUcv51+QWoDJoNj7eQe4gkOc4+L0XYHw9GNnFqoPQK/mLwL3bR79MZLLV1CHAz0K2nzLLt4JpEO9zKp3WjXeq4XwwfPPZlFsu8UvGcHe/iggvZ2fShYN9IujQ4ClGDY5YtGLARKEqcxIR6UmP9mfLChdzEqRLzcX9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933191; c=relaxed/simple;
	bh=Vz6p4cr59OhOE0k1clmpsoNI1WGvNP/gGmXgC4bdz78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YzxoQhzhixISmCJdlMjbNFfdZgnDK5scxXP9Pb9FXnFNzp59yY/1wQHvc0ZCeM2hskiqtwbC06mjmy+mNmGLxhbidObxKaTNXkv5zHGmLy/SyjHt10h8acFw1XSthmsUIQsxKR+1rX7MMz9u9yuq1smKOS/ynd94mCfBh9rgR1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r2syq5RW; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r2syq5RW"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c795f805so996213e87.3
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 12:39:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789933187; cv=none;
        d=google.com; s=arc-20260327;
        b=ohiJIp08j11BeKDqNBo11vgBBHGU7iJMb7ckqDaXHKlwD+ZjYy5NNoYQaSF3I1i+sm
         qtFC0fQvsWGl54oDzIv6EoDVdzbfX8n8ksgc/Tc0N0yzQCoeFDEVGSHfq8y5BIVk10Fn
         V6LpFQ+dlHVV2ZA6nrkkPfABNT2vuNCYNlFOpANxYj50Q/rEebnfBXWrHu0zV7wWc0LW
         YuX2+N21Xizt82+j+6FJifFOOr0Mue6rHNMiZaXNQJBNEkZ97D0G5pMjM1L1VUs9ZVfV
         5V4DGuVr5uugRBcdaBxIgGKkr5Z/MK2u4QIXn+KkojkyWoHR5k/xB9VVQSxJ0VaS4Sjr
         uSyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Vz6p4cr59OhOE0k1clmpsoNI1WGvNP/gGmXgC4bdz78=;
        fh=wWCTO4QvZFOChYzPQcAly3/pMoGFP0qW0Y451ZAMiJU=;
        b=D1YTZecjDkQoxjYjAqyw2hKXfwJakYJ4O11tOJymZS4w1wlT0bj68kwZj/h7DqBeEg
         s/ZuUwTOfa3ngackkAvgV205V/gAcc9nG+1tzDhSUVfGeh5iz5k/YhSJ2AFQZYo8k+02
         48vvR4jnoyv42OWaGdiwoupyfjwOzUzYaangSVIG+TH6P7ptmmtUyqw3xx71odf/tPx8
         Hlskv6C3TIVoXsAh7TlFZiDnaeQNp+ekAUsQIvPCUayIL5qiId7y3weBnKuWRNjVy3rZ
         pD3ELREHnOSCHoV80Z9BiCl+y0xxUGN7U8b4WvDTfxpJqSmG6IdxPVFWzyaUcb5/Uumy
         YUyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789933187; x=1790537987; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vz6p4cr59OhOE0k1clmpsoNI1WGvNP/gGmXgC4bdz78=;
        b=r2syq5RWCTKXoy3DmrppuYS/ZUFhMyodRBI8YZTzjshnFl7VskxFdiTDDVL4buaz8g
         ztRwa2vT/XJsgZNllOvGeYgv4BvNL7yQsB9AuYb+97gEwJXpX36G4yZH/0mpYL6SO0m+
         XZ0hDiVfh2Lto1EK4w7+Z9mBdD5Fem6moosnqqYmEDenq7TZ5rHHuXEUQia+1OI9Q2C9
         RzKhAr+d7fITNV8BNZuXia1tvDgCkzdRNs8Sdzy8l5SZ1xd2nxaBelWzFZe5rBlUctQP
         RJCm4VZw2tNyaq+rMWYa0qwI6gU0BMGPC4sM/VU1uBGyWQ7bBC1HfqmFYQJXEwU86WIv
         QPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933187; x=1790537987;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vz6p4cr59OhOE0k1clmpsoNI1WGvNP/gGmXgC4bdz78=;
        b=nbIw/jy0YKW3bv9LKOI7EoLBtdMKP8lKuzfzQxqrR107JU/teb+MJlwiMc1pyk727I
         gE4smoz1L+oaPIhP05GI4baK9haEilo74qlbSiHq+B0+8WBC7Iz7CfyioMD1hmWBVByE
         mbdJLaxwnJKtZwo1ZPLEBvqTtkNNCRdEV4aXUBRDG1lP+i416Q3xCSKO7epUrg+vt0G1
         5coDPYX+fPiWXA6K6Uk9ivEWIKuPOIaQ59SR1P62SVwBnSwBO+edC9I/tjKA8+pCPodk
         pQutlfaEk2bQBy/C4ueKnqlZDqVaQLHDAMp7ISXNNiM8VPylfbzCX018BarM3rL64J/i
         ZSyQ==
X-Forwarded-Encrypted: i=1; AKwUvByXdWFeyBy7r8ETZuFTJYU9k1rqFgLrMBPh9qLGGgpMsw+NLtzg1kH/qBjBOcAlRgynvvQ4uyiOIxwq@vger.kernel.org
X-Gm-Message-State: AFuF++ly+02sfZCx4Y+h04RnX03pxkrcUPcxw+GeAvHzsqmPvxaf+X1I
	HojoPzJ4iMXIISdlUqSw6k3o6nXyaUkiAXJaRdTnc7FkPvhqlOJ5f1lF/HKOv/oBrA60GcKK2Cc
	hJJmisbg3b2J0jtvRFg9DorQnkOjKeZw=
X-Gm-Gg: AYBFou0SnduFvTGNvFpBr50lIASHIXd7F0BMuPnJlt02Zx+c1bYDbpy7YDakAWBjUe3
	bGAvrfXnqifzBje+HrkLdRHXPD1XBpreE4cUO0G55UPpr4AFkYIY43oSV/l9zn9/NKvDYXl4K+S
	Gnw/xDFQVd1Lq+SbNbz8pyw8wiPo0mh6D4SXflxLrcGFxoP0Oce4I4TrfFNdANFUyJoWxkoMy94
	WJmsXHeGOMmTvJtNKxUUJnaZCJKz3ooW4JMGq+bxBmP6de7SPw0z+7qmgFBQSHfzyqfflc7F6be
	3cK/vroORQE6c+AUWkl+Poj2xSxnYLD16uS3wc6SPWm3c1eOJUaWglbIPS/mmTcdgegeg7EKt5W
	Iv5MGSe8kyNCk/og8Sto3oc0jgXzAAvv0wH+e5BinXifaNRD7E3+18IKI+cD04RuM03zAs0Q3OA
	==
X-Received: by 2002:a05:6512:3a96:b0:5b8:9c46:d4cd with SMTP id
 2adb3069b0e04-5b8c1951288mr2754329e87.55.1789933186922; Sun, 20 Sep 2026
 12:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913205007.118552-1-kieweg.leander@gmail.com>
 <20260913205007.118552-3-kieweg.leander@gmail.com> <b5bb9302-0f09-4372-a169-88deb52d5524@suse.de>
In-Reply-To: <b5bb9302-0f09-4372-a169-88deb52d5524@suse.de>
From: Leander Kieweg <kieweg.leander@gmail.com>
Date: Sun, 20 Sep 2026 21:39:35 +0200
X-Gm-Features: AcwNN1Xc595MmKUQVQovNFiu30qC4psJKctAnYnI_hrq_nWGZ8b92q9NSpZghk4
Message-ID: <CAMwcS0jPcjfJd3ErUfytFqy8Pu8VdFz+Qy0GdX684k-SwvOQxA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/glanda: Add initial DRM driver for GlandaGPU
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	u.kleine-koenig@baylibre.com
Content-Type: text/plain; charset="UTF-8"

> Hi,
>
> please see the Sashiko bot's review for several details that might be
> worth addressing. I've also left a few comments below. Apart from that
> the driver looks quite nice already.

Hi Thomas,

thanks for the review. I'll address all of it (yours and the bot's)
in v5, including making the IRQ a hard requirement instead of the
polling fallback.

Best regards,
Leander
