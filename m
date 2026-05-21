Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C310B379ED8
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 16:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779380501; cv=none; b=qQPi+UJwoDOY/SZLN9iAupqmx0bD5PUrqra6gOlzXfJjm0hSM5zJluefH1USmONo8CKkkCWaAS81vrkPIcxC1kzJSOvF1P1kL6LrYNKiCJCgaINiifyygDu3wry04Yc9lm6hyH2KIvC9uUFFhAKP3q4EDQGJnaBbLceN+Kht5LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779380501; c=relaxed/simple;
	bh=DgWFXLtzfponnnypUw4/tj4fR2zGxcUlWHS/gPBJB8o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T+CQwYm1yWQ6DJoZvIWOr4BZ42lHA7+iCrR3OY4BoxJ/gs6x5ld8j+lww/1vQD18gWqmfjQ8Hx0Zf78PKQgrpt9FcgsMtnUK4c9+fLOPCKfi7GJrsrPn/zwm/7RoKvAwJOoLMpwnJQTJZCQp3xXEqUaYv2qoDIP/0ja+r2dHOwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZPHR5tM; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZPHR5tM"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-651d6347a69so7397290d50.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779380499; x=1779985299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cL1sPLr5+ydzzDiEyMNfe2AK4DMdgM92vvCAubLu19U=;
        b=SZPHR5tMugU3d8IAO3yOMt0TdcJcv454xd8dCsiOGXZDCOkvS3QdR38CyRsRsxmmez
         lc7Dbw+xyMbnNv/qUozqhcpWq8je5QJt6QKVnSGfXh7/ulsFIrd4boLbgpBGZRJJxha9
         b+qIrE0Kvro7KG4J7jGa7jH9BW694dLpTMbhSXO71ixWQ7v3UG0vzljX0ejILAlptUJq
         Rne/CccigFxomC9t2Jw6dpJHLN8L5LfMsRvS8uAGaJ4wSCCn74Sz2R+g59pD7pSQqCDk
         gwoWH9w82JQo8RRsrUrJ18z3SFxr5oQilBJywyFqnQydU+D4x6R5TDuxmf1HEJ8DqoVw
         IMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779380499; x=1779985299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cL1sPLr5+ydzzDiEyMNfe2AK4DMdgM92vvCAubLu19U=;
        b=KDrlssmBE5gwciFDELsf6fMdMWp/LfhNh1B+at6oivfDm6LnpS3FvCorzt5VHqai+J
         PBEaX6qyID9QsylAhwKhtNgRJX7dm4MMBkttXezQunl7mOGtzZsVAmhw33s2fr0koJ3H
         NzCGqJZuerfBAH/nW7gqm7LIPbOM6hn2nMJEhJUEte+gKTMD3x59OMW59Z6PZnZHRU+7
         cK92ZDXV6K32pLnfVWVW/hOzPvipmfhPaLbkByugO4szt7e2Qr2rmpMvdy57fy+O5DJc
         IxzPmQQcY6S5LKc2lXWMoZ2KqtpL39DUK4w1QH43Oc2BL5RsiMAstceh6ehhYW01kwUu
         7UEw==
X-Forwarded-Encrypted: i=1; AFNElJ8G/8IxaNHlYL50xSe2EqPs7eKNJWWc0EiKQoS9eNZ+3xIokAUi3Wcboof+V2HAuc57mAbdEJpOsFQ3@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc+EGLcIl43eFbCtRbSQTA6H2K+VR147ArGe0XTRtGdNRaxny+
	7H5BHjhG2xJOR5m+f9ZcWVDqw+LAehb/WXxU9OtwKdR1O9hQVmclMOiN
X-Gm-Gg: Acq92OGWszSI7xodSGs8SBm2zJAMQ/w1tQNqA/nN7A7aIu6paK6N4i62ySvyNItk2u0
	ta165T4UIicbmaxvo2Lljh0aTQhiEmrhQZZJ5jru3C3F8flu+Calc3CE5wSbCX6U8OJIYGAB3VI
	Ko+QLIBkF+N0xlizzbapV/69h4F/w+a/hfZnRsODVcwpgeVJvT8UxO2VA9WxhY/Q2UgZtAZm400
	o2QSfw+JWb6Jd7KSMfAv91tJOpnVb9kAiNO4uZmwx6LuaQhDsR9jdQY7pfmL+FSTdN0SGyX7e5l
	2sGfFZdtdbtABcSThiIt3SDzXRdrDV11oXTlWPcU3fG0FOp9d1V2Wgx5qk7iMQyJL4A161lsuDb
	URhJjoNzWMgF7/qLlWppO50NaiNxXxgYYm9C3X8J0+buIovhwX/eEIBPkbFTKjl5rdICGbPlnTy
	MccAcGY/emFCnNYlC7qUh7INjFyxi0XfwlX5tipv4KMw==
X-Received: by 2002:a05:690e:bcf:b0:65d:29e1:970b with SMTP id 956f58d0204a3-65eacd52f6bmr3179382d50.14.1779380498797;
        Thu, 21 May 2026 09:21:38 -0700 (PDT)
Received: from fsh.attlocal.net ([2600:1702:56e9:4b40:ed8c:6b8b:1fa3:d14b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65ec1beb3f8sm391186d50.7.2026.05.21.09.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 09:21:38 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: krzk+dt@kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2] dt-bindings: serial: rs485: remove deprecated .txt binding stub
Date: Thu, 21 May 2026 11:21:35 -0500
Message-ID: <20260521162137.6325-1-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The plain text binding file was superseded by the YAML schema in
commit d50f974c4f7f ("dt-bindings: serial: Convert rs485 bindings
to json-schema"). The file now contains only a redirect notice.
Remove it, and update references in serial_core.c and
serial-rs485.rst to point to the YAML schema.

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
Changes in v2:
- Update references in serial_core.c and serial-rs485.rst to point
  to rs485.yaml (Sashiko review).

v1: https://lore.kernel.org/all/20260521150748.4816-1-akash.sukhavasi@gmail.com/

 Documentation/devicetree/bindings/serial/rs485.txt | 1 -
 Documentation/driver-api/serial/serial-rs485.rst   | 2 +-
 drivers/tty/serial/serial_core.c                   | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/serial/rs485.txt

diff --git a/Documentation/devicetree/bindings/serial/rs485.txt b/Documentation/devicetree/bindings/serial/rs485.txt
deleted file mode 100644
index a7fe93efc..000000000
--- a/Documentation/devicetree/bindings/serial/rs485.txt
+++ /dev/null
@@ -1 +0,0 @@
-See rs485.yaml
diff --git a/Documentation/driver-api/serial/serial-rs485.rst b/Documentation/driver-api/serial/serial-rs485.rst
index dce061ef7..f53043d21 100644
--- a/Documentation/driver-api/serial/serial-rs485.rst
+++ b/Documentation/driver-api/serial/serial-rs485.rst
@@ -132,4 +132,4 @@ RS485 Serial Communications
 6. References
 =============
 
-.. [#DT-bindings]	Documentation/devicetree/bindings/serial/rs485.txt
+.. [#DT-bindings]	Documentation/devicetree/bindings/serial/rs485.yaml
diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 89cebdd27..df4589880 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -3496,7 +3496,7 @@ EXPORT_SYMBOL_GPL(uart_try_toggle_sysrq);
  * @port: uart device's target port
  *
  * This function implements the device tree binding described in
- * Documentation/devicetree/bindings/serial/rs485.txt.
+ * Documentation/devicetree/bindings/serial/rs485.yaml.
  */
 int uart_get_rs485_mode(struct uart_port *port)
 {
-- 
2.54.0

