Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4249138229E
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 09:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777629451; cv=none; b=KvCc1si8dYO7+FURyiYNsq8ekKk4jXFeWYmQIFb5Em5KBTry6JWQzR+6UjxIjITSjS28OSdoDTwqWqOqEJFHU6b1ehTbwZzJjeBF1bKAHa1b0uPq6xhcoObPPWPUtFNRve7sBgCnh4QChjZAw43gunVSlNYl6V1BARxWg9OWxlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777629451; c=relaxed/simple;
	bh=2DUEGmGBfiPDJoF4glzsd2tFfRCHmiYNGIfP0DCGq+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IdQeEX0bI8In//Fe8olh/NICcb2nb/J211gm1tFf/m3GWq88BvQbb0LUz1vN+lVi+LJnX1HfExALGyAGR2TIHcZVP28aS8jfsT1pQWS/VS3Ly63BtlAguut58tVYcupCU7ccofv0N+neJquc7ByHFwRyvs+vGybdTDVRRBgKsXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwZOMb5C; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwZOMb5C"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c79662bbd2eso1062774a12.3
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 02:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777629446; x=1778234246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtSAsL8S4A9Pm+EutLuBtDes8X3zjz/YG0VQuIH4tno=;
        b=dwZOMb5CpDEnflCXEZAdlHqGEiK/YSzD26v70I+yW7X6beGdfRlYYQun4r1KOnKdgZ
         flz1btELguqel73XwmyFt4cQJ65l2K8A3uST2LMq5N01TjaY9k/Iy+4Ti4CV1ZhwfFzE
         p/hRxBxKzK6RoxQTkkFFgP4Qm3ySXeoEtGdM8YxbGIPOfULUrqPVDZ31cnzlz6hlkE/B
         0nXjvGv2gxQB/eEyLPoDrKmUqy40xnOLrGLErq269dFTvJDEP9hhNuNy5J4HWKM0X7T+
         KeklZsU2P2JU5JRfq37thb8yPNYSV/A8ikP2Di+8JDSSMlX+8NCgyj7xO2HxfX1bn/2a
         G+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777629446; x=1778234246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JtSAsL8S4A9Pm+EutLuBtDes8X3zjz/YG0VQuIH4tno=;
        b=iKuM00LnOMHkH+7icSMRtyTWnMf7C+SLJNy7ghhZt4SsYRiO5QkoLgrjog/1MniCS0
         TG3alpGYG+Lm7VTMtPx60/bsPtuHj5oBKVkGcZz6UHNiY6pkHYcASDU0EILRptZ0iz/1
         h1milhJa0W7HFDp5KAvpg8cN8am7+IRuMZtnSEb5ngfo9aG8aiYJ1YONEWbeqAzibKg4
         Nv3+o3TAinubO3qmwf50SL0FQTs6sPtmMeJsCqwsPdaoG1wRa75Iz8SCWYZokoLmROXr
         fQLRiewEUKsQqqhibEXKzkKo9ip3+vy9l6p37U3w/dBH6XrtqN1FrJBV5ILKkq1ehtco
         LPsQ==
X-Gm-Message-State: AOJu0YwfHK1bfn7EIYAjvd3wCsJm2kWHNeE1JTw12qc7A66kZsbw4HXF
	3k/Hr3MWdM9PfWJhC8XtG7QCr2tO1IvDtHlMHCApkQDpkP5nTkyVQeCx
X-Gm-Gg: AeBDieuy1L+JqG1YQJUajmuA48qx1ZyS3tz7bSxNNpFKCoBkvPgiHhrjZenqnd0U1z5
	UE2vBG1D7Anm0NSoOdsOaltQt7fx2EkcFv3buZPPdO9qGUae+xLTG+ouoNL0dg03Y6TSYL7Pdbt
	WQN4DHo1FYS4Itj1CD7V7pnoXC2zxVsM+rfKSA9uUGtLgv/mTxUjwJhQQLepIB22alXBxQyOA8O
	M3yHPKjYkxO23amT6vaTzcTQ5Dt8Djl8I9kwxevjVJofWuboAFsFyNm4IGGnYOxrPYmdEMhD10N
	gdrOVYxAYXlxk6E26Kxfn9N4ROk4PRqS8EFa5mOHjMXVsubWfXDNWLl0585yW/tNlSKteiBPiai
	p5DkD+QeIoq9/s0BsXySkVMeryhnYnotqHYGxI7PwMJ9OnFW2uXotDQ1wlE61KF5f9JAh0NkYnq
	KpADoQ4VchtTTz3g==
X-Received: by 2002:a05:6a20:3ca3:b0:3a3:a177:11f2 with SMTP id adf61e73a8af0-3a3cf8f73bbmr8146741637.56.1777629445727;
        Fri, 01 May 2026 02:57:25 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f36:7c14::f7f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbcac2cfsm1731381a12.32.2026.05.01.02.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:57:25 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 1/4] media: hi846: fix hi846_write_reg_16 handling
Date: Fri,  1 May 2026 17:54:30 +0800
Message-ID: <20260501095433.1609309-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501095433.1609309-1-mitltlatltl@gmail.com>
References: <20260501095433.1609309-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hi846_write_reg_16() does not clear a positive *err value on success.
pm_runtime_get_if_in_use() returns a positive value when the device
is already in use. When hi846_set_ctrl() passes &ret holding this
positive value) to hi846_write_reg_16(), the function returns with ret
as is, the positive value propagates back as a return code, which
callers interpret as an error.

Fix this by resetting *err to 0 only when it is positive.

Fixes: 04fc06f6dc15 ("media: hi846: fix usage of pm_runtime_get_if_in_use()")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
remove `else` in v2
---
 drivers/media/i2c/hi846.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index a3f77b8434ca..7f069aca0fce 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1271,6 +1271,8 @@ static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
 	if (*err < 0)
 		return;
 
+	*err = 0;
+
 	put_unaligned_be16(reg, buf);
 	put_unaligned_be16(val, buf + 2);
 	ret = i2c_master_send(client, buf, sizeof(buf));
-- 
2.54.0

