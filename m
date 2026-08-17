Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459843DDB15
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 09:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786958900; cv=none; b=n0ZDi9qnoZ83aafgKnXx0g7HEBcqu1QS+VyWW5P1X27S6AAczz2mk3KVZkSSGcZgnqcwGFsI18XOpjtoTkzuKTqyKchn2unZR/TEMcH/zW2EGcoHfPP4Kd36wLqyTGLgFsnTM5QuapZ5f4z23pzIWIrzxp820gqfCObaNZdj4xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786958900; c=relaxed/simple;
	bh=I77vCqt69BN/M4jLKGyd0p8wE+Nm/qGxZFR5eG8yqSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VIVgAkmTkE68lYjtVu55S8QG6tSL7RiXme+cOfEjNKzPzN3whxRZFFjfXqVodZ8WStkcJE8t4HlXKz3VdNFdDo9DeanWYiU3n2bGTVsfpmuUMySCVtrmtXhJFA6dDNGp10RH7lJN3H1yozvvqQQssl5An6mGYjUZATF/VXFEW9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=bkQHMA3D; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="bkQHMA3D"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so41313575ad.0
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 02:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1786958879; x=1787563679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=beWULb3CcEPzF1OvJZ87lJuQr51Mznb8fDkBwd4EFYY=;
        b=bkQHMA3DAzsl4nIJk2aVl16w5wXn7AH/OVcHiPJ/l0xm88vJIrBQbVlWrT12f/UniJ
         +eMcAb+zcwBCZ8rw59EJrbAZkEHvt9ov+wqbVXpJRiV+GadqR/D39HqssaiPaVkbGAUB
         QCXsT0LkYvMCtuk5QnL5i2bju4oSTpatECENFUWHcl8Rv7PTJ83eOkXEKiwW/mopj8zb
         qbIJfkcUxKM5HfHlU7wqCTxpqDNJN9/YwyYmHXP83CITOCBPyJ+Px7k4c2HwECyhJutW
         xSkTpFJ2kixpATuYIC+E1srIS4jaB5wxyBJEq3kCk7VdkmKIy36XKQPY8HfqMeQIRw4d
         7mfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786958879; x=1787563679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=beWULb3CcEPzF1OvJZ87lJuQr51Mznb8fDkBwd4EFYY=;
        b=MouYEqjWYaf6nmPDmDNTnTEnj2JNEjAGGOOeVNGF+/3hyGzfpKWPSEQo5/iD5Kppuh
         WGmYicUUZY3o9ejQeuuLiYZIdhj05t+XbEgBbtlI0DqFrJrB8Ge0jax3moMjF0ixt7zu
         ypZryCLTPHnv+Wpy8m3HfrckPi3+4wBxFdHP3SEiun32UDXhJeb4NE3JYpL1m6UOYFcl
         9Rnxa7mrV8NtVwBTLmInVTSF5n6JK6PS4AQvQOaTgzeYd5SJQsE1MjQ/l2E/Uc8SRXUi
         XjzPRbBfCp1hx/Mipts3qGFfz/hlt9P5FTVPOsbbIb7wcgPpAfNKFpqaVb5O5tqsAYCy
         xGSg==
X-Forwarded-Encrypted: i=1; AHgh+RqMM6nwGDKQ1CabuBtGfiWpn4jnc2hwiy/h4jZ2Sc2qmGAHZQxfdFVgdMpz9qIOKqojAQLBCxRrGmm9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1ApFhvMx3AVw7zZ6xx3C0JiuuLxu77ekcCumlJcJsxC1XcIX4
	gy1qf6dRL3BEn6Qd+8LxKsVxZTtcCfW1Gq2Ddea0Vf68ecUQJktsBUzSExlS9b1ayQ==
X-Gm-Gg: AR+sD13wW02fRfHIl061dj0pSmqSQUJty+U+yNg4crkQKsImxuC/FV45Rhw+V8Z1UEX
	B3u0qAx4YW6gAx3soitDC1r0zWhZpkwtMIvGR/91gbgfviwiTKaVtT4qEFp+tbk+6l1wtw+ZiqQ
	jcw7GrZTVQsHuhnkHPa+/tLZnUPiaPFVcPdSEcky3z9cGk1NuYPCyTVCCrx2qLY7NaYv0GHHqy5
	5BjVuYTUJTTdxruGzQTlOxrwLzZcBzi2fo7/0+qkwdl2o8pXuvkbZ2S2xqzmJ/fEYtvaooOj7Md
	ES1Vt4lQC17AfTsg+J4r2W2CrqEylC4s2GWsFdi6JQZLaAOx6Gim2DizbxkkzyWxcIYTcqF1qOt
	6j4XOhPXmoWqBiZuLMBCmRcIAhhy8JmPUl88n3uhhEHp3ZuzS1qQkAHzboMYCVak+qrGzYVX1US
	nrVDtfm9jk8lAvrsE6eAuK0+9sKPu2E7RAWsPyoMN8zMDDLkgMfKl1NDikGsXjXhkjr6uHce6l8
	upJCS5CBvGnrM2bIpiVff779gVBBB/rdBAQkuoba8hMygSV6V6uFfKTjKwZzbcX6w==
X-Received: by 2002:a17:902:e543:b0:2c8:1c05:16aa with SMTP id d9443c01a7336-2d3b0cbe5b0mr245366715ad.19.1786958878937;
        Mon, 17 Aug 2026 02:27:58 -0700 (PDT)
Received: from TPE-build-server-2.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb499e12sm2962455ad.8.2026.08.17.02.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:27:58 -0700 (PDT)
From: kaihsin <kaihsin.chung@synaptics.corp-partner.google.com>
X-Google-Original-From: kaihsin <kaihsin.chung@synaptics.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kaihsin <kaihsin.chung@synaptics.com>
Subject: [PATCH 1/2] dt-bindings: net: bluetooth: add BCM4384
Date: Mon, 17 Aug 2026 17:27:22 +0800
Message-ID: <20260817092723.637956-2-kaihsin.chung@synaptics.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817092723.637956-1-kaihsin.chung@synaptics.com>
References: <20260817092723.637956-1-kaihsin.chung@synaptics.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the brcm,bcm4384-bt compatible string to support the
Synaptics BCM4384 Bluetooth controller.

Signed-off-by: kaihsin <kaihsin.chung@synaptics.com>
---
 .../devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
index 95501e858e6f..612d21123aaa 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
@@ -31,6 +31,7 @@ properties:
           - brcm,bcm43540-bt
           - brcm,bcm4335a0
           - brcm,bcm4349-bt
+          - brcm,bcm4384-bt
           - cypress,cyw4373a0-bt
           - infineon,cyw55572-bt
 
-- 
2.43.0

