Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E323241C30F
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791712492; cv=none; b=rqa4jd2JNwM+nTX1BmaqMqWEbGOOBxKhid7jEuVowjC3+Vq2pKwQO3hfjX1V3mDtje0tkSy+QoQcw4qwcAS/hLFWdZJKQPEPq3GpNJIHM9jfelXHB8Invq96aREiX1w4X4r6WvhuMlKe0d1Vcox7XLMnKtqrzhF8Ql+GsT9tM78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791712492; c=relaxed/simple;
	bh=hj+ukPb4HHMPPos0n3Rz2Fh8QZI+GgDEPHfKYAC7lmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LRirDK6FTaaSFgZV412qUwZFmLHXdqD+dTDq6xWVEno/yxJGQayKRqkXxXq3LGGiDJX7tocjQ+ItBORu/Druyl3l44+nl24JME1kJT0ruqC5OTOtdEz3F94Sx5hgMcEq9NYsuFrqtqcn5giPeNkXbl0VM4lAtUix5c2+WzYKhgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sE4uuFuZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sE4uuFuZ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a16c399641so10271135e9.2
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 02:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791712489; x=1792317289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bRjXaHnkBUD+ve12tt7bTvLX0p3FD2oX3FmKCTtwdg4=;
        b=sE4uuFuZOBZTMK7CzigpIi35DVsEsJhfVSCxDsiQT0XXGdTC39xyp+GtjUBZjAkX2z
         TVft+1PmgeLBtW3Z3MW2x1I+BGZ5gcXyDlr8A+PvDFW5OhX/5iqoXxPciUfOIzP8DUTa
         u4U2/WJoJFzB4vG3E/U/5ZGMX3azcDsOGdn65CSHCs1/A+in5wQEMipLf9qWiVtZvMyE
         tnysTvGeqoTWYyXQSHiR4LgAL0foqJQ6BL1OHkATHd5S4TYZMzV1FUS/pNYQOeCe4m20
         bN7/yiGlhCz1O2kWTE/0b/W0Ex3ppCjvVWVIIvQ1AHRevNlib8qUfA4AerqziETAevKq
         gKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791712489; x=1792317289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bRjXaHnkBUD+ve12tt7bTvLX0p3FD2oX3FmKCTtwdg4=;
        b=E22Y9o6asff7dHCW7p5pwXC051F/zikPZ+xoKPGgCr0rVAnKwyV/0590UhNx3O0ZN/
         XjUUZURGyElhmvJsTcDKM3mAyQJ5lOqPy9Csfwao3NJYVvCSNcIrB1SklKnYcJAG6uPo
         y1oNyyfW4l6W3qNE8bCGjmYo5zHttSyOHHkTXtIMzw6RGVIYZwuuiqEvmKjMLRRUhgYs
         sicv0Djie4j6+I9exQJPyYspPOQ783JPghhWKHHoSUh5h6hGSO4FQVgqvpHRpdGmpSeN
         9y3E/YVfJpy44QDW260AjOLbPJoncKJKWVVGtx9pyogTMOVRgGkOHN56MX3zxwPBha7Q
         3VUg==
X-Forwarded-Encrypted: i=1; AKwUvBz0iBiLX2kpL9bPXU+L8seGLqTBJhLAg8JVm68wvzaI/L3YCfPKCa+v95VxSRoSntLuskxcsGm2CoWR@vger.kernel.org
X-Gm-Message-State: AFq9FYK4+ZVEvc9kzZGP6/5sC0fqo3ho/27yuPU8SyGCMfdEF0E4Au9A
	QE3tYTzn7atYd5bB5Zx11F07rim6Q1Z45n7rsBv0goNIVBMcuT7u6MfB
X-Gm-Gg: AYBFou3cQaJGkOdtUtRE4rxDTVtMgcVKfknTLsPSoWQ/lW7rEuG6ONLo1+vCTuLuzuM
	g3KLNrdIDhSr8gtNXIAs5GhLI/42EYzvJQJKqjT1D4OsFPAhxUtAX/30qB97W99kevrNF1+6ocg
	cOU9hzfwB4nngERIHnv2p+ANB2htFZTU315Cm2Et7q3H98DZhDMtA+FkgvgTKSkzDFFC6x+3Cgw
	eIxAnucdZJefoGlgeslr7zPzIvN3GD/EGw0bRSBxl6dBZAS3UlqFwbN4ixLY0tyDYAvVUDLdgrH
	Aw4KcXQUXqTeidy1kgNdOMwwV8yGtk0FVidkNYS1KFy6BsBZH5MxQTn6AGa7lf1/Mh/Upqmxs1s
	5hLMnTIZGoi0jRCo+LAfcctc3wV/8HcZiH4BXiy4ms4GxvJ2uuSs88DJ5MsrTqGYOUWlHkXknda
	V27fAdG1GggPy5xjQX6+LTMle/qcFoprH5cAqeC3gup1/W/NbWJcvW1nT84PuMV5zlV0W8BItG7
	QLVK0CHx8NTWg0=
X-Received: by 2002:a05:600c:4e89:b0:4a1:96cd:2f64 with SMTP id 5b1f17b1804b1-4a196cd312cmr57392225e9.1.1791712489134;
        Sun, 11 Oct 2026 02:54:49 -0700 (PDT)
Received: from localhost.localdomain ([151.27.249.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm377837785e9.9.2026.10.11.02.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 02:54:48 -0700 (PDT)
From: Oleksii Onchul <oleksiionchul@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleksii Onchul <oleksiionchul@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Nothing Phone (4a) Pro
Date: Sun, 11 Oct 2026 11:52:20 +0200
Message-ID: <20261011095221.24767-2-oleksiionchul@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261011095221.24767-1-oleksiionchul@gmail.com>
References: <20261011095221.24767-1-oleksiionchul@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Nothing Phone (4a) Pro (FroggerPro), based on the
Qualcomm Eliza platform.

Signed-off-by: Oleksii Onchul <oleksiionchul@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557c..36617b485 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -81,6 +81,7 @@ properties:
 
       - items:
           - enum:
+              - nothing,froggerpro
               - qcom,eliza-mtp
           - const: qcom,eliza
 
-- 
2.56.0

