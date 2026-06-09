Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEC937F8C3
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 04:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780980090; cv=none; b=RogQ0xvk51KsTQXW+dj67IztL4kV9J17G7koHeOPOBNRwt/100spmh2zBJH/rUc7l2OdwTYQMmPtY+mcXcXlgnN0WhdmZmEdzrlPP8i30fsQfYOPI8s7ZWgd6YoR0NXL8OT9ewHo+ijce4WVt9RE+UNOP+lnSJm/EI4mJMoD4vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780980090; c=relaxed/simple;
	bh=JA2M7AiLUuSc6veCi/kbJrYplg8DlHt3oDIafgdkMi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jH95alKO/tyhIkOvp4KNRUfPcDXB7T0czoH2xMFcebCELkZayZX8xby0E4BzpHJpeqAmjui0ztkY2YXo/waeegZz5Q+q1um/PDK31tYE5UD9zxkTnctOID1iXZf7BbRZ+Ievt8GOuRbsrpAt1XkT/eF79b2Qa4e5Cw/MzliZfCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FtNIrr5b; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FtNIrr5b"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0c2c7d45eso45716375ad.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 21:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780980086; x=1781584886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eA0puiI12gkUUrChccEFoedZkqg321TG7vWV3+7W2Ns=;
        b=FtNIrr5bpJw5cCz9yjGqXFQxfbfSh3Ro21BPtakPw+eYYgW1GCRW2n+jFCcGA9ohoR
         7mjyGbCQrtBVq8BhEqKd9fqKyN5DBV7ka7zdhHI+gQ6j/3y+ZCrW85jrmjax2BCqvTXN
         vmWpQll0TOTG36Wgs1criDWj9c8+lDH/r17S4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780980086; x=1781584886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eA0puiI12gkUUrChccEFoedZkqg321TG7vWV3+7W2Ns=;
        b=H9cAf4Rwy+bFio+4EoizfDDrLmnjh0UPLikrabkt6tPTLpmbJttg+p9K9qeCLsAKWM
         KnYtkMeo4wGXYvA6zRSkvg8ywHegZ2KzkQm/mOJ/r1KNgehw9OsiK46giTOkwGdzEYj7
         lSx0rvk318yGIMTohH3gEKPavEVPQtoLZhxGYe1gfLMN0fshl1lLIpmfG4cfg4qocl7T
         qrrrK6FODioBJ0Z7bpvNEhFaQPTDzNdiHYmx+uzufDkSfA+nVMDIuvVfO8eo1bKGrf8A
         8Sa0MnzN9P1CwWWegj6uu2s9JV87cZ3XIkllMil6HU9rhL9FRXbaSBsz6v9BQegQDHyU
         KkVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8k3qhyPOyK5/o2OEx6/G/8AQvJlYERewWhhLGqpao9O5wiwawVhKnBMdhe7JFdNP3qLPHLMY3FhdyO@vger.kernel.org
X-Gm-Message-State: AOJu0YyhVnhrX3YkZ8g4yqxZCR7ekLuR0MasuIAnpCpc3DRXUlgmUao7
	X2KrsrBL3aToAi6W6DQlAISPrskA8uc7QYB9rhioMtYWkdaYPcjeDYP4sQrli3r5Fw==
X-Gm-Gg: Acq92OE4+TMfUOejTlKe2cOPVuy9wqoM466XOoZLFJBy4TkNCDA1ADXUrCFZQkgifof
	HNDjpB0LnS5yCzttel9SelCcg3HQozQs/7gLtEEfLmJtuZZLCL19tcctMrGVCaUquhOUBg7Roj3
	XYhwz+tXbGUAm6NiRyk7oU7SuQRo1XvVv3mXEiwnshZktzJraTcQaJrRHcdMQeJU0z81e8Kw1gO
	lp5ae0yCNz91kO94/NE7B+VwNw0uE+v4KaT8O4U1VjruyWa8Q7dxDhAJ9x9qBoiwVrIZH0WJv0W
	HrmlC+4Rc3IJkG4pIvO7icObT7wcPaN2Ds4Un0Ik2o7Ld7pVq8yAKRlPZBWQ4D4/wcBSMA3Y+79
	lC4LDvLzapeF7PERmysjpSpavbxlGpijSI+XxJ+SmtKBHhYVJgcpZfJRARj7WeyZzHbMYtrX10T
	fAraa0OtxM5NCCPdF1qp1D10v2NtoY8JEhakS+JR+pbIFfBJ3NRjtOmmybyhZNT5jS9nrgi1BHd
	YRsz/UoNnF1nCeLu+Hi30MLb5o2S0B+KXNdAC7l3ZoZ
X-Received: by 2002:a17:903:41d1:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2c1e85c0cbamr219282855ad.30.1780980085929;
        Mon, 08 Jun 2026 21:41:25 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (111.169.168.34.bc.googleusercontent.com. [34.168.169.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664a67b0sm200736065ad.80.2026.06.08.21.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 21:41:25 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 09 Jun 2026 04:40:52 +0000
Subject: [PATCH v4 01/11] Documentation: Correction in HID output_report
 callback description.
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-send-upstream-v4-1-b843d5e6ced3@chromium.org>
References: <20260609-send-upstream-v4-0-b843d5e6ced3@chromium.org>
In-Reply-To: <20260609-send-upstream-v4-0-b843d5e6ced3@chromium.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, tfiga@chromium.org, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Jarrett Schultz <jaschultz@microsoft.com>, 
 Dmitry Antipov <dmanti@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780980084; l=1213;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=WgXF5HKmPVI1MEtrLNcqmUizKiLvnC1/DeVVEsJVV4k=;
 b=MRn8ThmipL8aQeFe4El0wwHcRed1esJP/XYC9aYnkuywJVUaIVxu3P8Moai80Jt3iW7OzC0El
 WxYiULYHaqZCIsSH0OhJG6kcJ1FO8J7LYW+q6zH+Xa0pPw0DZ8OiK0e
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

From: Jarrett Schultz <jaschultz@microsoft.com>

Originally output_report callback was described as must-be asynchronous,
but that is not the case in some implementations, namely i2c-hid.
Correct the documentation to say that it may be asynchronous.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 Documentation/hid/hid-transport.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/hid/hid-transport.rst b/Documentation/hid/hid-transport.rst
index 6f1692da296c..2008cf432af1 100644
--- a/Documentation/hid/hid-transport.rst
+++ b/Documentation/hid/hid-transport.rst
@@ -327,8 +327,8 @@ The available HID callbacks are:
 
    Send raw output report via intr channel. Used by some HID device drivers
    which require high throughput for outgoing requests on the intr channel. This
-   must not cause SET_REPORT calls! This must be implemented as asynchronous
-   output report on the intr channel!
+   must not cause SET_REPORT calls! This call might be asynchronous, so the
+   caller should not expect an immediate response!
 
    ::
 

-- 
2.54.0.1064.gd145956f57-goog

