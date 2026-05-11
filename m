Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901BC3BD63D
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778490695; cv=none; b=nG1pmNW2o8thaxl9DXsp/Fdv3cfnpI8do3YhkmDF+wDZR7xdiQvxXursejRna4pcrBRbjJg/l6jtYVZvmmpq5giXP7vk4648b0JDVxlMBYbYZj8AuGgZIHRb1FMPhctYnVXf2Dja4qLLbshN1Y9q34y8ph3oEzR5qKMGStD2uUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778490695; c=relaxed/simple;
	bh=2Fbe+51I+NHaqoJEm/Ia1P/RkOrsQ8sOHQ84+D4jX5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NRhXaTq+Lq+CX2GmOdaAY47j84k8FZqEMxhOpnJM0nQo1sJr6PlYjPhaCcq9AIYjhIS6Q774jYinR4Jb5ASSPUZ1nwPsQEoEVdTn/8UOrhA+prkiZDq5CTyoy4ZpZZhIal+JAq+xO4oWZE5fPzNCYduBUj1m2wRu9rZ9MVFqnUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOXjKgBI; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOXjKgBI"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c828daf83e2so339499a12.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 02:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778490693; x=1779095493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=;
        b=fOXjKgBIrUxxlZjeFfSpBfmeSr06lnAC4d5lOm/VuJBSZ+DfFbQ28rGcumpRJya7Aq
         Ep+DOmMcJgQ201ciw8u4WJHAknq3991Ef2eH4bUeeYHI5bQ4CeyFxgoq61PzvpKeY11U
         OrZxA2SefhJw8MynFVzCKWYpCV/cDmjEsfdCvf9SWYXJ+UIfu0+wde4VMaw298nk/vj9
         Zctmjl6kDX68Gt4RKKS/ybYK96T7sv5ElZ3wazkUfYCrwr5vFACA79BzlQnC//9pAUVs
         RuTNy/QyZ5dOPdB+yqJLMBNBYfYUEnnWtKiS+qZ6zvLNPRF3mKugYMLbqOlMQAVUGx+P
         3a6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490693; x=1779095493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=;
        b=aDHiRY2JK+nGImhxyNT4XXvIEiKjeVyv3Y4sChJ8umi75uAf/nQk5kbpIPN6r9cXOQ
         YKgYP9Vn2WvhVXKmkja/3Nm+erYiijsR/tW6fRFfwH4IGyxL07QGD6eEVbF2n7WWnaER
         sOEvi7zpnJoJx8xJzD2Z/vtbjNozqjUSvGjeMIRcVYZazw8I7OECLr9lTcG4Xj/TtxSf
         gDgs6Ct5jRD0rIKJLuEVzruclB/RgNdom83DCQU9c4K+NnWWfBEQsRmiyQ/tfUtGPjFY
         sIhNJJbwW1Oxfhkd7eU/CyEvkWplhUWt2baB98s1cWcriOVwa0I4C9AyAjgkhd5UmtdX
         Zq+g==
X-Gm-Message-State: AOJu0Yzh2dXuwi+0fiUmkIjkAr5nM54ypx8mP3eon5Req5fH+y4OfUN9
	8hgYeXT5cY04XNIcAsx7xlKcZqIdD7XDxNU/8RWrinV1lu6XrYcuA8ME
X-Gm-Gg: Acq92OGs3q54s787iaNgRuBDmaVSCHo8FWa/XLk8ClDZMd5/EGhGxd9btvt+FA+Hvks
	dPYui54vMbxXRoezeHmntwdw6Vszct+Ap+71Zhmbtoa5QJ4RqNCMDgomEkooHL+JQ9cZ5naAJOF
	D63VdQTus3fH1oAfZbbLINMRrEmCQf2t2UBhx7oipfS6r4kEY1tBKLDwVPz32v8kzgN9xm8+0dh
	i5bfWfAn3uF2An6qHnzKaJqf8NsR1kTu9u+ja6dLqtJ5S6ua7wS9wC7CdfZDUfRrFQm9okz47GH
	dX3BOvqURjwEGdfFFuVOXaW6VIKNaMePoWFasj/Jmf+wNzAGRVtaRSH/YuKjSA9ezfpuPLWy4IL
	b0OJbOGU4XbfQbLanGLKA0VREFCtVustGfbBtOC0OvZR0MOVrHUHTXTZMlZ4tZrZEqUh2PatYgj
	kVAlwerGJu4av1z9WbZkR0cGU=
X-Received: by 2002:a05:6a20:3ca5:b0:3a1:d516:36ec with SMTP id adf61e73a8af0-3aa5ad31592mr26172526637.56.1778490692746;
        Mon, 11 May 2026 02:11:32 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f37:1974:abc5:99cd:a924:4e86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm24775517b3a.3.2026.05.11.02.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:11:32 -0700 (PDT)
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
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v3 1/5] media: hi846: fix hi846_write_reg_16 handling
Date: Mon, 11 May 2026 17:09:20 +0800
Message-ID: <20260511090924.269106-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511090924.269106-1-mitltlatltl@gmail.com>
References: <20260511090924.269106-1-mitltlatltl@gmail.com>
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

