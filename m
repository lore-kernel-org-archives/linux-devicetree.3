Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738849;
	b=QBT2HNIEgMDz95EOK4LbHzblOZQi4OaEY5EEojOUfkdonmEldrfqCLfhtiErLrGuiPd0
	 ZE6bLcU6EXFBX8k5GjmgpNVPzBmINfSJLpDQxGGmUc3zM+mkmBECJ+G1mgMBIhMPpqBIr
	 u1mz2z1H1FHLi4t5ISR5RvOEl4RveIYz+d0UM1PIbtgIfTfB4+0cN0IYikR3IjlFFdzBm
	 St8psSc0OMsDEwsB0+KpBY9jyH9iN0Vi6QC4YRrdWtRM7cEu2xU3BlPS6CzZfw4+dMmMZ
	 03TaCFU5Ue0SutJ2FjLgONWlFGiRvhyQiZZaZegfzzYnPWgQPFD5OJuQpgRyR/3QmEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=g/w0MVtXQhj8idCIpqV/0m1Lb366EccRtPJCicxmKT8=;
	b=Iu+skEo6Hw0tmhLEbODiqJO8CyjaskO+s96JnUMW2adVlREABJG5o9+d1Tk9iMaJJ6Fo
	 vk94eJAypgKKSmKdlm+CSTcoD+pXj9IEtJP37cDW6YZ0Bco7oWTOaEcNJgkIoWNosgAlr
	 B4cSKonLAeT/PH0sUw4SxXVIaZVd4a1sdFhBGjTfPL33H2fRzLq1fI02/gyUPqSHzxhU4
	 NQquyNE20Qt8MVdJT1B8vHBLpkHzqRg3M+C5AVY4YFoanUmyJzYjLhbbpysXdg1HRtNL1
	 jZiopwAS7bS5vVzX+pvMDRPzpgjquKFY8ROQgcFjmA6wqchhrSO6eKiEOPTT0JrvfwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eGDKHFkI;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE202606A331
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 20:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE202606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eGDKHFkI
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eae1276409so1417029e0c.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 12:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738848; x=1794343648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g/w0MVtXQhj8idCIpqV/0m1Lb366EccRtPJCicxmKT8=;
        b=eGDKHFkIYuSThdJnh3/stZRyXq4kyJZeE5p0lFwaibsPet/IsO7ITeTfndEHxeAfOw
         XJh/aGs/U7lOHnXy0bKEfKPz0mYfFggD+3xb6zbFwntaszebb/7lxluVIAcd5tGaeQwH
         tjtzECLsffglCCXdVfSRRFqow2IFhdbG9aNUVT/9XQvODXTe4D+REv7aneH7M8umPbSr
         Mt690CkBoASwN8DJnPFPvS0uKAn/MBO561M9Z3wO9DrJhptyT3nrthiSgC4rhjUaFvz8
         VyMnUyQBmGTgRzHXFCtXa+sKL0GcLMzQo1T8EtVQVrOh5WZSXsJek4F0STU9MK13k2kY
         rSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738848; x=1794343648;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/w0MVtXQhj8idCIpqV/0m1Lb366EccRtPJCicxmKT8=;
        b=Pbz7PNmzOsojQeoYYaRXMYG2NTQZ9l0o2y5doKRnZENNMf9IFcYQ1G7lZsx8gXbE9S
         UeJBeAdJkS3+6SFFZ6E8qmCxaJpRCU4NSEvaqJaDX8KMof/XO3mVsqictZIHGMmHEj0Y
         0QLDEBgpma4N51Vi/CdHnj2M/wlizOpMjhwQ+cmOWjVYlMsQbHRvDQQ+kRQBUV5Qi6bc
         1BJ74rAlFAwIl1c4f2eS0Om0Lo013A7yUWmFKzQQRd3eIkVerc2sVN9LTho3fnTqw+NH
         WfuCZU5EdQInroKDBe0iJfGKNjTYbWqtlpzpsKNz7vxnAP45L0Eu4ov9dr8rOinWU+z5
         OQiA==
X-Forwarded-Encrypted: i=1; AKwUvBwu6f0+nyrWttU5YIBxJTN1PC0doyzu/381O8IWWzOBVZsvH/e4JW5uqKuGQ8eeZUuPUJBpwDpz2KR1@vger.kernel.org
X-Gm-Message-State: APuU4Z9ISKFzpmKkX5nW+RuyBnsp96IAECH3xKoYbRiF0UWrShWqki/r
	FSpdZChvnK++a1cb6/p7dsfmyLkyo0xBoUcuE77uAWpda3v+hFRGh4k=
X-Gm-Gg: AYBFou0/DVw3Nbq0hLMf+nrh/cgJP+Juh75J8XqlZyfdDT/fMfRBFhEdDlsRbWtYd9B
	zS2RM67hf8z9MFmz8PZX+kCj+lj4MYtXRIVQQl4zqXo4M0X2BEhlqR5mIAK3rITNBJEburP1nc4
	yjiCNPp2Nk9mXNLo7SvCcOwivcWxK74t6u89AGLxToRzv/Yn1NnHxUzYhBsvSWznWJ0WBPYGeUI
	S2bLCYUabpbFzOBrwaCy7W8yyPCPioE4h2ZOcG/7I3poJR/1mhOKWY/S2bHcCBVCe7UrsovWSzo
	PjDCzh6AcRc+TI41Mj4jRTqBx+zG/DGsaNjfpffIvv8jwKOaxxTLlzFWGUHi2+SCrRk/bY7amHO
	eaYihrASF23PKBsxxnaEPrvMwtM0WWnSzQsh8lyTNjP6OB50ICwYWbNVBEuJCdH2hfnb7MYJOQG
	6wcg3Iou25yFuN9Nycnk3MduUhv/XmXgHUY0enCMi2KXxZRvOr0V3BCAj7mG7QIig9d+lCdr1Qy
	zW3Pu2wsmv+8XLDDEQhvExeTRgYtzPnWNbujV7pKsGzeDI1f195C+IYe5BqbSg5X9etYQqDjghM
	EtBmhHvznP6O8whjdCFGbTJ9y48ueRalZRV/9z6PjBMbpBte/6MVw2EC+V449iT1zpJDvPqdSie
	qpaDr
X-Received: by 2002:a05:6122:3c54:b0:5ea:c11b:432c with SMTP id 71dfb90a1353d-5ec68971961mr6087782e0c.15.1793738847860;
        Tue, 03 Nov 2026 12:47:27 -0800 (PST)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca89b81b3sm119618e0c.2.2026.11.03.12.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:47:27 -0800 (PST)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v6 3/3] MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller
Date: Tue,  3 Nov 2026 17:46:53 -0300
Message-ID: <1deac1052da01f892b385f0061c24bfefd8d0594.1793735996.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793735996.git.nico.antinori.7@gmail.com>
References: <cover.1793735996.git.nico.antinori.7@gmail.com>
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

Add MAINTAINERS entry for the Chipwealth CH1115 dot matrix OLED
controller.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..ada64be352b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8285,6 +8285,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
 F:	drivers/gpu/drm/bridge/chipone-icn6211.c

+DRM DRIVER FOR CHIPWEALTH CH1115 PANELS
+M:	Nicolás Antinori <nico.antinori.7@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
+F:	drivers/gpu/drm/tiny/ch1115-i2c.c
+
 DRM DRIVER FOR EBBG FT8719 PANEL
 M:	Joel Selvaraj <jo@jsfamily.in>
 S:	Maintained
--
2.47.3

