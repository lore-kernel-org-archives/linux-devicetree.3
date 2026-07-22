Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD533D3D16
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 03:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784692097; cv=none; b=ReS4rZHNH/ETyZOTg2NCAMyNxM4lxFPMBb5V4vspU6sZyit9Q71Wzn4wt/x3+V2LgpwHIzxaPzwQ+dZU5puGfsBA7aQ9U1+dTyoB2YEJ5I69dJb/wP9wDD5bjAJ+Hs/j7DLvk6Cy19HFZpD5JIT/Rgk2/JSseZlbasBjWGjqYp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784692097; c=relaxed/simple;
	bh=VSzjPKR4lLklgDn9GCYwHvZgAaAkgB6hwWlqO0HIt1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=noEXFtVxHzz1VC1AzGjVheGODmUt7/2fnYNlilL89xB7WT1jmsZzhewcw6SYDrQfjbLiN6DiK2DyHGyyyzjownpEb2/Nx4ofrwicVbI42fg3zaqHx0y/FlOsvKvYQqtXqInIyT3P2OuhNhrtCNXPmiMi+lLsyh7RMPyaH5iHQw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXrMDRdB; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXrMDRdB"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8eeadbc5e21so57230506d6.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 20:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784692095; x=1785296895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQuvP1fDBqO0c7MvModbSGdOEb+K8fGjvHhbuLs5Alw=;
        b=AXrMDRdBRAROwgtDi93pCK+tK0NAHdU4nggpy8hAlm5y8TSup/7zni6Gw1IC+vCzpn
         61EE4xeW8LzXp3C72Q8xf0B8jlLlc95zPFsnlWKit4C3i8qWZGlhwsmKXPVULBJMyG+v
         rESZZhzG44A+BqMbW3m8b49OWbLas9iA1Fn0RXJj6FDI+9G+DbMOw+sEmTROTpmgJFN0
         x3coQs4TeTi/uOF1k2/1w7p4mT8qMsa3CuJxoNib51L9269oNEtH7QKaEkSMukgmAT+N
         IzDj4KOAWzdn3Wzm4dDmjOgc+aNYGpX7/6hEJVXbUFttbYmndJIPqXJmBzzrvAG8hyo5
         EnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784692095; x=1785296895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQuvP1fDBqO0c7MvModbSGdOEb+K8fGjvHhbuLs5Alw=;
        b=fOmmLtdOsViSp6ODz6KzbejHOvwiL49/fP/byvXv4BQwqYVA/Av58zPJV9KlumnKli
         oH3f02+qYaeMKQn4EWWbTgILUSrB9h6hgAe4fuB6E3Rjx1RHMwgs7CoLcgVQP5FdfAur
         DBRpVxjndctuKon6V9F6QRj5NCAbd+cH3xFIX8qQWQ3GQB248ygAzQC30FAfaDY/bser
         isDcg29sMow9Ptrx4AIF9pMVXRzBKqXtNRCvMtqZ0hGanW/bZvKQDlRdvF0ZFLCa+sk8
         wJn2S/vRWy7TP4QXgwtJeWfm1eu1BQPlLDkAGISXLUQNWFRgx/VOVQYD3kvpcMHqY34y
         Tl3g==
X-Forwarded-Encrypted: i=1; AHgh+Rq4MrT9pNEH7g6By/JRH7ENlf6QQGtGgOez9RLWrXV15P6TNK2GaGajF6EuxDA3QECd0JzJ0L/SHpLR@vger.kernel.org
X-Gm-Message-State: AOJu0YziTFGDCINqKSET2XAtCgoEB3/11SRDmoPBC8C2tjkLKp07xlNU
	3LZon4XBnOV04ZFbALIuG7ZcLFxvzRcGEO3bdtme8KO4v+muyDdpNc05
X-Gm-Gg: AR+sD10Ps0oaYXRpd+8JGKD0sKhTQHhcP4j2Sd9rCR1ZcjABShfqwvj+M4Ae0vRDA3Z
	NUaxkXKDiqYgQuVPtBE2OclftNJ8W0vYJv1eqIQpgLmni1f3Yr7g5/1gyKjGMTXATNXkxuKKlXf
	w+QI86aPMFLP+ms54lBxN8yx4lT6jmHtEJMa5iwZE/3IMGD5z7LlEzVHSiy78cfRUDzVOh71PYX
	6vlm4g2DHYI63gXpY5plW3amtrVZhv6FbmoO/+xVyAY0j0a/wGgHFsdxpsELDrxy2XSlmuDZ7SJ
	0VGgAg58dRSnLROHS9oOejSOZa7dCufJdtMwm8wuqdL2tdmgWMunmp4o3KtmWmKG/Qao8eRAPlM
	Lao10PEw0ILR88rjut9bMcLl+Ek1TIxqCQcUw+xKz9QXsqPtb4XcGGzpZOXKgX0zldttvYNa2PH
	NAdWEJy1MOxVWqvjHuUn4GMvUUQ17iVPZ+Ob5lzBYB4YM=
X-Received: by 2002:a05:6214:e81:b0:8e9:f62b:8f99 with SMTP id 6a1803df08f44-907783cebeamr237912806d6.46.1784692094667;
        Tue, 21 Jul 2026 20:48:14 -0700 (PDT)
Received: from thinker (syn-072-043-128-189.biz.spectrum.com. [72.43.128.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba9e19f6sm11466546d6.27.2026.07.21.20.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 20:48:14 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: airlied@gmail.com,
	andriy.shevchenko@intel.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH v3 2/3] drm/ssd130x: Change SSD133X color format to RGB565 from RGB332
Date: Wed, 22 Jul 2026 06:47:39 +0300
Message-ID: <20260722034741.12572-1-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87mrvrbabo.fsf@ocarina.mail-host-address-is-not-set>
References: 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Javier Martinez Canillas <javierm@redhat.com> wrote:
> Patch looks good to me now. Thanks for the respin.
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Could you please rebase on top of latest drm-misc-next, now that your
> column/row fixes landed? Then I should be able to apply this patchset.

Hey Javier,
Thanks for the Reviewed-by.
I'm generating a v4 for this series per your and Andy's comments on patch 4,
I'll rebase on top of drm-misc-next and add your Reviewed-by there.

-- 
Thanks,
Amit
