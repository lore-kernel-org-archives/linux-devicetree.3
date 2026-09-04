Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0C43DDDDA
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 12:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523664; cv=pass; b=lUBtL1TLk7KkZmvDREvHioyKZQEN3dhgMm2U7za0IvA4McocfBWP//Hmez+pXVcor0bHwkghDwV2yPk9/ujqTqwV04qp5puM2C4d2G+8uKdPcvD8WHssXKCqsSR0chF4eGSnJE9ibGAKEm/+nBQeNAceg3RtJYyx8k5nuckz1GU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523664; c=relaxed/simple;
	bh=bQ+ngubuSMUna8wGHEH6mnd/d/43/ckY+sPNpIA3LCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dkd94RMmvzG7rqH880fVHTKjlnd//d9Bqb3nnQcvewUJEcZIf5+K8X4XCB3WcI6o2ytMKYoMR2exC0gWg4LM/Wdi58i5we9QQGPsTUQ0YVk9sQ5P2fGIazLD9SU7tjUU9xxwaL5b9zWpGijs9qgKV4j5X1q1n+roGZYwJ5YJKn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OatkGXkt; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OatkGXkt"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso756017e87.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 05:07:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788523660; cv=none;
        d=google.com; s=arc-20260327;
        b=Yn21zpxENe4+3oruMPmfAMZf89aHFEyyohd0wIZbEzZgRYMV5Lq7Z2Vk03mtrsYnNN
         cp9wIqIeqnRqRCKuZp9vjpnLfKVIGZ8c6nbNIFfhWC212fS2hLswV3tvHgcuYpN9sih0
         iMrccCI+IjaqdZZZlyvX+P8Z+ZQt/J79a6hbfo4460557DfqowJ8CSRHiRAfMUH7nG62
         pRmd020dPdzq0fgjfFpFttVK+CU3tFCH7BChfDBBYOvD4PhejOXt0xGMhmO8MHB3iV0L
         16l24Tf9AalqkAaxYCMjUwHK6agsrNLXuNvU0udSogAJdvIuN0bLrIw/2ks27q1vt+Ez
         u5nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bQ+ngubuSMUna8wGHEH6mnd/d/43/ckY+sPNpIA3LCs=;
        fh=rw077W1yMJqBAupkkD8YJiTxDnfN1xJrb37nDfW/A0M=;
        b=DK3UxIDJrDzaCAG5QwTpHYKMGFE0hx44qF5H2O6d+9bafEmMLRjytuw3mVY9ExT1/P
         blIAOURhaJOYp+zbAyHKpHfykPSMlCx9iOw8iGkrDW3ULLx4jENrHEXnokv8tKdvQ3Al
         o8sdl4H/7X0LhZj7Gy9R8wbQzAsKqQCCrwox6PMaXAgj5hiIeqv5CPghon4cCwCAzTiY
         pmvTHINGwK3AHrQpp0xqAywrjucpLDrOnsM3uASip9YNsUEx6UGHLA/R39BuuAgBberY
         ZXDxmKIJvTe1+VW+3+S45uEccWIbTbR0aVQRobh+0G8tl9tzbe1PBu0Yiz9L+2YcAVWF
         k49w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523660; x=1789128460; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bQ+ngubuSMUna8wGHEH6mnd/d/43/ckY+sPNpIA3LCs=;
        b=OatkGXktQqBbMFJyV/yZC7TjKG9N2qYzPa2flDtf+akNPDdyDgYhOyObWHUSPf1ncb
         DvrStqC96dB4qU3xzGCp1YJ4uuPa/pbMale4mfsWUJixAh/+zZCspug1/dO81N6DyloP
         kXmq46bmhdKMGS4NY/yN5llZ5y2YyJdr+DI51+fDgvfxwFXrX+MObn3cdg7XrU2Ss4c4
         KMsidq20yakXMbaZ1PH1RQ8lH8UNSpNeMO4oNzxoF7No1cA8ysXUHi5dasOieVGuQL29
         kFZw3pOTGJm2EU9R9JMcP9QW/C90E5oGkPsO9T/RpAQmTB7vBZKzENaFuNmsV/uqfF3x
         bM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523660; x=1789128460;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bQ+ngubuSMUna8wGHEH6mnd/d/43/ckY+sPNpIA3LCs=;
        b=KqRATC26dvqZ8WVfbj+G9b1TimeJG635deqrj0R+x1q1odFE3DRWIbowwfpCRKPGRK
         p2uLVVHp83Z1bI9LmVoAYRwSj6zJOIkeb/L2N8NqwvOO2PSuOy4Ulm8uaT81HDRFEZWV
         MBq7zIdfiRNbsjk25Q9K2HqT02wuRbrFlOtJX+8pjlbLdrGhr6EVGgU3qeNy0kbmvHrW
         78FsdbCwa0huXf0OSdVQ7QBe2XZXhCXqBAW/kiYda/9d9gqq17gJgiJtpFUlRP0VAZb5
         IwBHF5ulEQEYLc6D/qiFoRFlTXR78j03kJF96eu2EtA75bOof+XddbqR+rxLhzUVFK/6
         IRhQ==
X-Forwarded-Encrypted: i=1; AKwUvByksjQPKfzegz43PnXwc7PWOg/OC/+2L1GIrVr2dlBQxLJIQBLxVdkXvSvDBcfpRITjVkrkwH2J9sqx@vger.kernel.org
X-Gm-Message-State: AFuF++nD9UkdAh6wJba32sQVDPXu5GuLyTfP7v7IaWuwJjHPjxMXkD6r
	kv17Ff26xUQnC7rs7FT77iQ49ZM9yiHWTb+I5u9Gyj0mzed/7rbEpA2/MFIzshW/pniHVCKjAb1
	4ocnE6RurmXO6eHvV2jn/XZhqwYKkBb4=
X-Gm-Gg: AYBFou00V9RWryv6lAjHemFvG30qk3beVAVRUgEViECdzXL2hL4uPxRtMPSw+ctGsTF
	MubfP1ZUzN9xb2d/7qAwyxBoizpvGQZ6q26LAEwMgLeOTkoZyx6rIEKfb+vheVbiFdB43/i9Wn9
	XvS/8X5VpE3hnhwA/WeyjrC2SutfpvOAHFBidAdP3eNFj7JFAzMIJ0fB5cGJORG8YazZc/rt7nJ
	coOszFiMF3OGiBECtyH7whDw02iS9lCBtbyiU+8iMbQkpouuE/lYGEO7/KVFI7p5y3xY5pwFWqC
	gS+1yTNvnkNVLqsUxSdikjmo0IHkm0drkwQtgfnldRDhvW9O2mvBP4V/tWs0JNod2hyL1n6q/0s
	TnGGEb5nPvMZq114B+otQWCl3HrlBO3EOKmqrhA5TPqNjllsGyBDv/iI7NS4mMNWY
X-Received: by 2002:a05:6512:3984:b0:5b6:1a7c:aa0a with SMTP id
 2adb3069b0e04-5b61a7cac43mr532668e87.34.1788523660278; Fri, 04 Sep 2026
 05:07:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824195418.17707-1-kieweg.leander@gmail.com>
 <20260824195418.17707-3-kieweg.leander@gmail.com> <79f25a88-e5a1-45c4-8b80-67830d7e63eb@suse.de>
In-Reply-To: <79f25a88-e5a1-45c4-8b80-67830d7e63eb@suse.de>
From: Leander Kieweg <kieweg.leander@gmail.com>
Date: Fri, 4 Sep 2026 14:07:28 +0200
X-Gm-Features: AcwNN1WZMHDh86DNK0rt2fYj74vso0lva0nGIJKgbC6O2XV9AFAo6Xx2PQUbBo8
Message-ID: <CAMwcS0hNeHFMcUBMS2PozTqgOr2A1E3BaUW8G=D8g9t9CpCM-A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/glanda: Add initial DRM driver for GlandaGPU
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	u.kleine-koenig@baylibre.com
Content-Type: text/plain; charset="UTF-8"

Am Mi., 2. Sept. 2026 um 12:03 Uhr schrieb Thomas Zimmermann
<tzimmermann@suse.de>:

Hi Thomas,

Thank you for the very detailed review. I'll address every point in v4.

Best regards,
Leander
