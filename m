Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B153E6DCE
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779872958; cv=none; b=EKGOhpkcvgIL2UhWDbJVvphD07USBUxZeOvzGFo3AwGz/X0YylfUD3JRMAYflRlraLirK1wQIeiTo4efRTey5ikIm9KBLCBSepJQTR+u0d2AcTtgaXrPw4nKcr2FSG3DcrWkfy4wIHOBsY4LKZ5uZNaJEoTyWnIkR9UE9+SXC0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779872958; c=relaxed/simple;
	bh=U6KnoeAETP1m5hguoRuypA196uPeJEMIIHuIq1Tny2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dyljly1v73UFo2RWHsvJrA2eIRnxSp/gy8Pg/ERD/ziK1AatQs3APQZPE/WCwUrSiDlxpmNGFM08z6V6Ri3HPjtzADxynDzOsMexEVOwtHYENoFUndNoB9dw1C+TYhIjXYvMuFbWOIO+gsCzDR9ERinAmMSlAnz3hDT4tAl412Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=qA7/mKAH; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="qA7/mKAH"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ba21d32776so84346605ad.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1779872956; x=1780477756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9IJMJXfRZjRGguojSjLvij17reY/DFrRYdSWxgmMi0=;
        b=qA7/mKAHXBRU/Nef6pQLQELb0y0ZGATx2x6DtO1EPLN52xt3E9HNtAv1AeI6axykLs
         aLGtkha6XG08COzTM1X4xLQPBt/D6TwjXMi27gU2ownOzT1PHlCtdFS6B+45bZGoe80u
         q9BA6P9yI3MhAXVKZGMMfYC3j3a8duOjgH/5cgTdIe0dyTmnlaUM4NWYgkRdXYNoBtIx
         2kjf1+wD0O06wBU8rBlx14BEsDt3PqCoTnRwIYuhQPUSvwg9KRZ8PIauC4OBPlSxK9Kg
         +b8zGYxzT9EhbPxKSn5NdgLjajRoMwg/jVPosw4Za7EZfl/fsuSj13iEvLkqfCgvAe3L
         luVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779872956; x=1780477756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g9IJMJXfRZjRGguojSjLvij17reY/DFrRYdSWxgmMi0=;
        b=lUlPlO+OEpbVfstmDudC+qJFQtVfZSwkptgxrBRe1SVP7kSBKUsVjemqnL7VSt9FaT
         LvX3e6cCGXtv9dyByNE4awmhuE8DqwXF7sIEVFDQd9n4EavyH6Z2bVpihvYqmHK6OeYK
         +/CyTb+YyAV4uuylw4q0rspcVAJCqPx6auaWGnoEhrIzFj0ppXTtVg7MLU8tySUvvDKX
         c0/D3rIzDRUkQMN3j5qrbMZcxrMmYP3+mJTBpaKog4xOEpL+ZIce3u6Fibk/iFqGKiBS
         IBneIQ/ZgUitFreZ1gkF+y1x2v1+QLnNdNQ8D6HHugdgxEjNYIEh15BfWkgViGgfQzFJ
         o0Gw==
X-Forwarded-Encrypted: i=1; AFNElJ8J3GZ1BB15eqfc5vtedqvDO5omHEnonFFDXJnN0MKawGa8qX5yAOZJ9HXECg8DLEyPb+BaPVtIYNLE@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp35UtBEoqSpzymsvhBA79hDV8c7jZfvtelSzNtzr8FHcr91Qs
	GymeEOAl8r7aE6WckmiuQ3v9H4yX9RmIQlTypYcdx6HZ+RhRoI8jyxN9xK6QO+Wuww==
X-Gm-Gg: Acq92OGLhAHmpgsJL7tGhsP3tue9x4IJonBoQ8gnbwRyvCA0NTy9v3pNflaPUPw5Zg8
	8BQYeNBgkIzBgNyk7AGhGP+TB3nqnM2TINZtTOk887bpMrmFXiGU3sl1KSAhmbBUzjSAXbNGI5N
	kzl10tYTwJVsi6Ugty4LE81arFlmrBjvhBs1ZEysQWItjYLr2CHIChrbwYud7gTJG117lCFbfTY
	iUpPl456iDic7eIBpi+Lfva5W7WMDFj+MLZg2Xd/FzE1vWa3AwYyMy1WZc4CAiqTpiIF5KhLS4Z
	78du7L6zdIqalERDjNffmSCKUArR+rz3kaJjtdq2JKcJHLDFR78kN9ZWheQHkvTwSAon4WbmWTt
	/G8ELQJqkztnmppFJS3P8EKR/xVjSO8Y1J+GMSBpHwL4+D+TdC26ajLpy0ZSmBksCUE1a5pCWdD
	vuJk57i9cB1vuVjWV9n29lOfZ34Dwxr2cawofYydpzY0pyyk2ZhCnsoCIj0k8K1rmc6B5VDc97a
	QbbMxv9fWqYV+WuSCQKhMnKBLKBDT2XoyGJ8vM=
X-Received: by 2002:a17:903:198b:b0:2bd:9766:bd2b with SMTP id d9443c01a7336-2beb05b5994mr242492405ad.19.1779872956387;
        Wed, 27 May 2026 02:09:16 -0700 (PDT)
Received: from TPE-build-server-2.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bed2061c59sm92430365ad.2.2026.05.27.02.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:09:16 -0700 (PDT)
From: kaihsin Chung <kaihsin.chung@synaptics.corp-partner.google.com>
X-Google-Original-From: kaihsin Chung <kaihsin.chung@synaptics.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	kaihsin Chung <kaihsin.chung@synaptics.com>
Subject: [PATCH v7 1/2] dt-bindings: net: bluetooth: Add brcm,bcm4384-bt
Date: Wed, 27 May 2026 17:08:48 +0800
Message-ID: <20260527090849.3647601-2-kaihsin.chung@synaptics.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527090849.3647601-1-kaihsin.chung@synaptics.com>
References: <20260408083217.1915419-1-kaihsin.chung@synaptics.com>
 <20260527090849.3647601-1-kaihsin.chung@synaptics.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible string for the Broadcom BCM4384
Bluetooth controller.

Signed-off-by: Kaihsin Chung <kaihsin.chung@synaptics.com>
---
 Documentation/devicetree/bindings/net/broadcom-bluetooth.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.yaml b/Documentation/devicetree/bindings/net/broadcom-bluetooth.yaml
index cc70b00c6ce5..404853933b7c 100644
--- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.yaml
@@ -26,6 +26,7 @@ properties:
       - brcm,bcm43540-bt
       - brcm,bcm4335a0
       - brcm,bcm4349-bt
+      - brcm,bcm4384-bt
       - cypress,cyw4373a0-bt
       - infineon,cyw55572-bt
 
-- 
2.43.0

