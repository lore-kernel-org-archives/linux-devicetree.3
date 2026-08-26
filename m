Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08853A1A54
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 18:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787770097; cv=none; b=GC8ox0EeiQut8kgsDxkRvWHvoDWkGxHDv7VS7HHblwL7mbSxwkKJTqpfz/fYwqAhMXxWXut7/aYhl9f3QAtxsgVV6Sdq+2EeM8Q1XxZ+4lj7DWZ++kopeF+7nrtqievQG6lNLPRRgWxXaJYO4LSDkVFtDNOYIte8SqutYADRo9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787770097; c=relaxed/simple;
	bh=3zTrUNP97wjygcEyxUmUMs4ernWyBlapMobTCcEOsLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eeeX+PLMChug2d+M3CGwlpK/dU7gkSPPdfuVWdrRxNbKXJOc7/Sl9fkB3rKeN3MNy6sth41KJHraZbzCH8eT4CFqKHkQ0HN4CJf1w+5XQnjmosb8JOLt3TR8gyZuPkfCDM2Y6qrYVYnWA/Zapwu1Xu4SNR8YkxXlIv0mW1EJCyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5LWND5o; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5LWND5o"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2074710751so205868066b.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787770078; x=1788374878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yNGuRramHsyQedVrqROIzZg6iP7sI/lSPknDcuWVUUc=;
        b=h5LWND5ouEDslBg7kR3By1Nd6rW9nS2zBCTUjBfNhU+KfI8IrzPndcYemsqZg6Q+nU
         wN/r2nP5LILJsZeBFvHP/ZzDHCtQSmInciJeQYHkxaoBzuezuODM9lbSgn6t3/8z051P
         QJfB6/7ZllyUYLjhBmFjAHD2+00GUSSKuexpR795IKNisRUqeYWWk+fXUDJ1520sKjDP
         1kY4nP+Lz7whfSKEiQfozgAhRSuDWhe0m6iS0asQuqE+o0bl31G3GN9Y1ZrDtAFh199N
         gLHwfyx71u+ecnWFqFkgFYdgXC0rIJ7TY8RD2okHKDADZdhcyYCrlN9YbPChLOjlbyfC
         vP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787770078; x=1788374878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yNGuRramHsyQedVrqROIzZg6iP7sI/lSPknDcuWVUUc=;
        b=O6wmz7Dv1vxuE7cCJDEDkY/OVTEsGh6f8aIpiuQR/Gn93SKi8ZzVhk/uxdArKaPauM
         SL1VV+5hj2YOKD6U58GLYgCyr8jrM0d/DHP4+/CHY77r3ceb/zdaQN2bSTBl2Q2FQroo
         b6cd/d7B7Tzf3qYSy3XsMoBZ9dEt/a2wGSvXrweJrGiSO3FUu6LnDfG682z79w5eNbJO
         lZVIveGVx+Ptrduo8Ty3GO8dFw+U2gG6wsNfO03dT5X0RdEDu86kPiN5jbX5x2CqHfU8
         GQjZqOjPKWJjOc409+wV0iqFVrgH5OEY1BL77oQKyMFFyrlMiThvtWfgk0z0k9imktN7
         OLEg==
X-Forwarded-Encrypted: i=1; AHgh+Rov9AUZQsF8PHqur5wt4aQpKgsFnSfPxWb7Tfx2apYJ/N6+5l1zFYHJaM74VsC4pJKbiARKWnNEXPub@vger.kernel.org
X-Gm-Message-State: AFuF++n5048rbI9xYXxaWVhB6CHiVoCrgvBz+cIqDmlVDZ1JnbG1VoPa
	+QrRMHiluBxC0O5JnmYk9MRpSBb9aA0FF2/NlAZHQfjittzmxB6kPpcE
X-Gm-Gg: AR+sD10notOBrmqzxfdCbTtt19775yNGGJGedLD1NaGVu8ecXmDQKxOVej9ZiNI+TZI
	Nf6IZh6q4WOtGYUPo8YtuILUWzVj2n85pzzxLD4gOIAKAyCVdoXzKDbL3Ot3c97oLTRRylu5Vjz
	CUZNc2VU10x38kwX5Oa3OSkE6IGeZksVpDj2maPbshMeglZe65/UssDpfy8eFv8HW7biypJvc17
	xt4y4uyUnLPAJB7cS1lbWYlKG07qTrV9vSdBBeW0dPwKCEfPm7lyruFy0BBb8e7YSALSCQTYmbv
	ErKAsnvhSHFzXuflEyXRzLnapheDs85sHSjR00jGboXzG0tQphlQBdOWaHaBudQ3wu1MMZCddTE
	UFafBrIre7TiRX/HyJ2qw6SaGP5jATAUBI+qI68WSKLAGJByIbDr0Md0LlDFxn5c4c+HLdYb5M8
	lkurDRXvbjGcpnQOibNgz6/8J2J6diGyZhaAiO7R6s8RpeW75YIfuL4kwdn9PQkMCDGyUlT8yZL
	KjIQsys3SoQ+eoLw2CY0iFIvqt7MTNH3vAWmpHdwdoX0fit
X-Received: by 2002:a17:907:a713:b0:c21:8a0f:56dc with SMTP id a640c23a62f3a-c250c449b8fmr1129537766b.4.1787770078207;
        Wed, 26 Aug 2026 11:47:58 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.67.216])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2533945d0esm114523366b.9.2026.08.26.11.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 11:47:57 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] hwmon: (lm90) Reject channel 2 on chips with only one remote sensor
Date: Wed, 26 Aug 2026 21:47:49 +0300
Message-ID: <20260826184750.4798-3-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826184750.4798-1-flaviu.nistor@gmail.com>
References: <20260826184750.4798-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Validate firmware channel definitions against chip capabilities and return
-EINVAL when channel 2 is configured on devices with 1 remote channel.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 drivers/hwmon/lm90.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 1c603272538a..3faeb2c6ab01 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -2712,6 +2712,11 @@ static int lm90_probe_channel(struct i2c_client *client,
 		return -EINVAL;
 	}
 
+	if (id == 2 && !(data->flags & LM90_HAVE_TEMP3)) {
+		dev_err(dev, "channel %d is not supported for this chip in %pfw\n", id, child);
+		return -EINVAL;
+	}
+
 	err = fwnode_property_read_string(child, "label", &data->channel_label[id]);
 	if (err == -ENODATA || err == -EILSEQ) {
 		dev_err(dev, "invalid label property in %pfw\n", child);
-- 
2.34.1

