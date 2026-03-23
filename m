Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079773AE19E
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 16:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283013; cv=none; b=mVI5MlZm90seXAqiHyrzBv5C1JY6H6tnrRrgB0HJ/+qNbTLDZ5XgiHh6DWTIdhggJtgibjSVE1dJGk+wFG538Bghu9ETNhiMGKtQDs59OqGGs2gfKNaA/i2r0zE5O3KA2LaEErf9CGA5GhxqehO/Fn8E/yguTYb3nIvIwHIe620=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283013; c=relaxed/simple;
	bh=wlROWR2JvmCSzmq6xZdptsC8bpqUks8BZe2WwV78JhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JG3NK3k2FzDD5N+Kdoy16iBGhaXt8LIzCVKiO71uTCzdT5zZAJkJwETU7W4lyQqzzry2P92WrUpVDE7zU0BBpF9gkclJ710NyAPJ8TQMjDIMJ1x31lnmZDi9U0ZexPs5yTlK6hd9hm8OpyvhurnijDMJJ52hrCazLTas/8O6U2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0Arakyf; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0Arakyf"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b04e6a989eso2344175ad.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774283011; x=1774887811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJ5qrcsx/y7g2uR+DSKlCpc4EBVmOqsFnYDAG9z5aG4=;
        b=l0ArakyfQvbtl51gfHJoHRj2bCiBn/OEkpU6JEo43VUL2ozlbFyZ6P9gCmJ0suChJ4
         zjS1hUSYqev6JxF0NA3I03gxp480DkPEo2M1Q01znWJf8OVoQJKJL3fhLWuwfIfSO314
         YuFWuiMKvaZyNsc+j+YRPRdgARHlB+/tSuXO82CmQ53gcuYz5lD1nbj7JHmXVVRDd8x1
         n3Oj5IfG4ZJ2IZHl7ctdXqGcAeA6vUXe/FQjc3hIfO2iSJX9i3XDwA+IgFpiQ82Kqruj
         thJx+ktmKj2AYdwhh6KVLgZven097lMZgAQF92nV8CP70xjCvIcU6eFYf4q4Qf8FeD3t
         Sh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283011; x=1774887811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NJ5qrcsx/y7g2uR+DSKlCpc4EBVmOqsFnYDAG9z5aG4=;
        b=I+1RQtXmHIG87www5xx7SsmUwA4ql4sizrvzV6SiIxGHJfDN9olwKe26Wel/M98Ork
         1dmetLN0O2K1hzTbAqkJdXVtUrJ+ZbuPcO6zLN2GqoytI4xPRc6Bzllnkou6zy6TB0G3
         n5R9myCQ/JgSCx+ur9t6IcqXsIxLT5ZcPEf40oghb5qcj3s1OTURWzeiGHxKO8vgtiVV
         T6qVjkvjsY8HzPF3Kj8DqZcxyXkGS88f7FoHeFD9+tD1FJQlmFO+AD9PfcvhsiiK287v
         PFJ38p81ekVHEf+ALke5s25WtKzIz8/Y8VZ3yvZ2Z3+jNxGip/zo3u3pmNCJzu5Itgou
         GtAA==
X-Forwarded-Encrypted: i=1; AJvYcCUxygJwQCxLxK41KFPdJvQCN1pOm6PnXxP+PnmAX1sKMM8V6yiOkTXZbXL//Ht5s0PDQa9QmDodFkav@vger.kernel.org
X-Gm-Message-State: AOJu0YystGFYMrvscc9QY2ep/ej6HKnouH8EVdgXo3u5c5+wACPqZZCU
	1wrUmb7+D/BjfNKyb30p9yprgcVvHRiFBe6mA5QVaQ+ab9YsJPI020q1
X-Gm-Gg: ATEYQzwEePKAVvUz7ua6IwCY5BBHoYHAjxu390BrIxBQna6Lp5pPx2BysUF0FUcU6da
	FkgikcaBiIauX0Ej4Kl08TA0KTbi0NYTuU15JFVcLPJ46Ne+BSniWPDOjNPwYgWmAI659jzcD+R
	r+jRbgQixdlR+8J1QJHezDt+fYKEiW3lf5ghre2/rT5LF82SgGB8fE7Jm65OyA8QMa7NIlV8HAO
	RWN6ezlO+RlPomXeTlce81oAptl/pFgwGNZpSA7dzwHDOMQ5XIv/BTxXM1MRqK1BaQtr5yciIaS
	/k9z+3DbXVyQkaWN486QM6mRUH0I8Qmqj8DuxGRRGE5IfrRBllwSpxw2nMMKQwldu3k66m76HjO
	qMQgaesCb7hwI6J5iuxDBtx4I0yCz9ARoQlKTm4c5wsqI1j0TdlXWM1nhQLYoOC7FU/fXC8u0fO
	72dGxnoq76mIORDVa85TH/KGpKycz9vndpWJae+OJYfx8IIUPwetVMadoj8MdrlIWBqdoYTvMrA
	vQtQFVCeuJ1cfJTiJItHJ6k+37aQfX0ER8GLzbFBg==
X-Received: by 2002:a17:902:e542:b0:2b0:9101:1b83 with SMTP id d9443c01a7336-2b091011f9amr66516145ad.53.1774283011199;
        Mon, 23 Mar 2026 09:23:31 -0700 (PDT)
Received: from lakshay-piplani-HP-Pavilion-Laptop-14-dv0xxx.. ([2401:4900:81e1:cdf2:5b00:592f:5488:918f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516cb9sm118477755ad.2.2026.03.23.09.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:23:30 -0700 (PDT)
From: Anshika Gupta <guptaanshika.ag@gmail.com>
To: linux@roeck-us.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: lakshaypiplani77@gmail.com,
	Anshika Gupta <guptaanshika.ag@gmail.com>
Subject: [PATCH 2/3] docs: hwmon: Update TMP108 documentation for NXP P3T1084UK support
Date: Mon, 23 Mar 2026 21:52:51 +0530
Message-ID: <20260323162252.15508-2-guptaanshika.ag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323162252.15508-1-guptaanshika.ag@gmail.com>
References: <20260323162252.15508-1-guptaanshika.ag@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add references to the NXP P3T1084UK temperature sensor in the TMP108
hardware monitoring documentation. The P3T1084UK is compatible with
the TMP108 register interface and protocol, and the hwmon driver now
supports it. Update the .rst document accordingly to reflect the new
compatible device and its expected behavior.

Signed-off-by: Lakshay Piplani <lakshaypiplani77@gmail.com>
Signed-off-by: Anshika Gupta <guptaanshika.ag@gmail.com>
---
 Documentation/hwmon/tmp108.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/hwmon/tmp108.rst b/Documentation/hwmon/tmp108.rst
index c218ea333dd6..cda280032710 100644
--- a/Documentation/hwmon/tmp108.rst
+++ b/Documentation/hwmon/tmp108.rst
@@ -11,6 +11,13 @@ Supported chips:
 
     Datasheet: https://www.nxp.com/docs/en/data-sheet/P3T1035XUK_P3T2030XUK.pdf
 
+ * NXP P3T1084
+
+    Prefix: 'p3t1045'
+
+    Addresses scanned: none
+
+    Datasheet: https://www.nxp.com/docs/en/data-sheet/P3T1084UK.pdf
 
   * NXP P3T1085
 
-- 
2.34.1

