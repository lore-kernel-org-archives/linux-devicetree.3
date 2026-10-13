Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0953A470421
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915505; cv=none; b=Q42l1kdJGUCDfHnEbog2AFLYEyHGfSykapMZ82eHR5a3w0SaUKfRBrK07S1EZ5neHl7onSZFtas16QRsDKmfV0QBaK+n4uYkZn64707nG5TA+Eg1lr+VbOy6BIGGH5JjX/ddbqDIp7oA0xYzOiBpvNp0XRIFifRjb1OYvCCnD3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915505; c=relaxed/simple;
	bh=lU65QQOg/GcibNh5g7Zm+usPEygQ/b2DT9OWNFxlqSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E8jvABV749xtoofxctEn+7pOqtDmst4eSYtw7fA/IRkRBsQAs6GDhnJRBN0NA5hHAY7y0flzTtJlq86zlKW5G9RWUEY8InpGWt6QwAJ5tFoateDWuFup8P0zk4vsqnF2qqGS3d7sF/GbF8m4L0cIoO7W0298J6iqtEB9Cgz74rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SCECqCcM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SCECqCcM"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a01933b584so29275935e9.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791915499; x=1792520299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Bk4II3Yi7edkXaVIjuxBcIHECnvxgrsvWyjVkvqUUw=;
        b=SCECqCcMswpP1Jqe/3SKc4yBh8DNfsTlhoUk6WxJNygxwBO6vCwn4v3T0A08M5/HR6
         3u2JLAllLO+YhIUFR6/0ZMqITR7j4FajTS3EJDxUSMt7J4T8HfJPW0w39OyY25VvsEUa
         FFmZb44fcIuNgN1hJFvLc8Gw+93W1Qgb0gM10vGkEH45ReAdfyhOTPaTEBE5cyirikMh
         KwlBOKYwhP6XlDtaJdX066xnvYytbAJaTYRZz9mYE11H1YztPyYFftrKmSU8t9q43daJ
         jrrBuEECvy3umyrGGAG2VMR+pIagIbsNoFn3p89Lp1vTbHobKP6DVV5/bOsk3qFlv+11
         E8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915499; x=1792520299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Bk4II3Yi7edkXaVIjuxBcIHECnvxgrsvWyjVkvqUUw=;
        b=WbDJvjNwHxemrhTnaIJRfNXrcN+qZKh/3mkT0+mhLYUSTHS9Sy2hMi6UOxsiM1Jsyv
         rgL0vxYDnbG4TWZ303iuNCIwzvB54lbL3QcvnWo5jox3Flv2+8828BRKWfK6Co5LHb1s
         QjhTyYtWlIwl9wpHI3yl7RnsYRnVCa9uv5/tUvd64j5YAv0PpVDSwknGZ52sKUHbVHSC
         N4NPE8aa49GuulzCE87AAGbQxzt94vQDsr8Q7l9629qWpLK4H9B5bEMG2VMb37Xp18sj
         M4Nv4T6t/tRaJ2q35tzg7mGrcWIkBoTKP3f2PPoVw96Gxa8uT1g9h9paBDndMMGHShZj
         Vy/A==
X-Forwarded-Encrypted: i=1; AKwUvBycE5ZjLz3WKLyvfGMlhLLF6rzfZdiMA89D+lbo++cUlLTUibAqgkwbD8eI0kDgJhIZqz4OYo8rbojh@vger.kernel.org
X-Gm-Message-State: AFq9FYI+e6Ifdacu3zz/3+8X9/Rg9wBGtuYbsZLCdhE49WuY09eWtIiW
	8BzLrazDvfmgAYdFbZDtTXxL3JiRJbhQEbFO+ElNMc5UaYSvdZHU7WZc
X-Gm-Gg: AYBFou0Qk17iDB4R5NHOIQOKe8UlwClOVrqBYKJkXnPvlaqo66paq5beNTUEc2GPrmQ
	ZJygn4s78rHjlpkxR4mJezEqEBWgohYvfoGvlmIIgCoEXMND9UrlB+P60UxJYk5wEFOlaA1efLC
	KdXwSICyP42gK6ZF9zC4Ui7nqKRGwwjaou5iTupWNdwRTCeR1gR+TEhGeXXSq+Hb/1pBRFPJ0kQ
	Dk60ABNjHJUzSo8/Xrsj29sf+PiUK/ELVfB+tvddJXrFRvE5x1seCG6f7twKPp+T/pmT81ljQgr
	O1LQahtviAozqJDow28OpcP+YYbmSkt98WSKOo+DULJipSweF8j5LtK9V/YQJtgRgKBBpDT/PGN
	P5iiGYnf4+sQgwUNNMcOtcKa88VUy/AfNj8vJKCyKkOJ/hUp0fQhis0Ar2wgyP1xEFddURzeLEY
	epUHe7TT+FQ5spLsvVemSwEVFrpwuTLrozCFzWtkEO1bgUxZ8n1z4oUi3v+a2hmO1t77lOiPcMg
	WuJiBBhD4tVevj9zZE=
X-Received: by 2002:a05:600c:630f:b0:4a1:9f59:ee7 with SMTP id 5b1f17b1804b1-4a19f5911f4mr137303645e9.0.1791915498902;
        Tue, 13 Oct 2026 11:18:18 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm6379903f8f.36.2026.10.13.11.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:18:18 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: leds: skyworks,aat1290: Document FLINH pin
Date: Tue, 13 Oct 2026 21:18:02 +0300
Message-ID: <20261013181803.496627-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013181803.496627-1-clamor95@gmail.com>
References: <20261013181803.496627-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both the AAT1270 and AAT1290 feature a FLINH pin used for mandatory Flash
inhibition.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
index 7c26bb135c0a7..a5f3eba7d6480 100644
--- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
+++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
@@ -31,6 +31,10 @@ properties:
     maxItems: 1
     description: FL_EN pin
 
+  flinh-gpios:
+    maxItems: 1
+    description: FLINH pin
+
   led:
     $ref: common.yaml#
     unevaluatedProperties: false
-- 
2.53.0

