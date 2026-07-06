Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E43539E17C
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327182; cv=none; b=e976uh8UQAXkqfOiez/3R8aqLp2/9KOqOR+M3CNkxSn9EINGbP83GjFnUo63AUG5uZJoZcc/Y4nNuzE5qs2jj/DAsrwmIt4YhvLOh+e1X93dDLXSQpEgmUIDDg85Lg2qW2WLf4TDdFhaGZBh+QLziPrPbGKEPLjWj5Hx6xknNiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327182; c=relaxed/simple;
	bh=D5whuOq+QlG8L8X1qHqgY8y2NRAujgBvpsz93xSPRaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WOon2kU71dwBzQgz0C56DwxVeQGprAtMgqqn1QY1dyFvi3MgmyaBuRFWL3Z2LM8G0qtgWShWyEijwPKc6Qf/85MDot/MYnJqJetx/qc0ZM1TTmNpKcPMLIVlQCezlbPKbHQz4DxMDG2EIiuJES7uVgpVgNNXhJden6NwBOHCoCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRyrH6MM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRyrH6MM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493d3135f62so8133345e9.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783327169; x=1783931969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhgGnNuXnWH4hPrMvepsO/9ELPw89h4l69pd3BoNRLc=;
        b=BRyrH6MMm1Fs9PONBUOYx/CKCPLSi0eSexBcMe1+KxKdug1kTG9D6um//sy9w6MzvD
         pnH1eFITxXp1tGNrGswfVrNpdjN4qqZdbyMnfr5IHN4IGeGAY+JxA5wXiJhDho+DcLCX
         60R9zRFGIrbUeu8+EWJcfHQsvVLJ0LoPlI8dMCdlps7WEy4QNLH+Qvjo8ocUASQEQ/Eg
         k5Kkaiu7cNhIx9c8KLgKbN91f1c+wwYvV1Yzlob1zdvs4D15+cI9tsDHMCM+nEMZjagL
         YHjWc6bASp1s5fgp0n2RHi+jfLmBt/bZqxNz3vyxtW5P6q2CnVEQOtj+OKO6PnBq3mQF
         Rflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327169; x=1783931969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MhgGnNuXnWH4hPrMvepsO/9ELPw89h4l69pd3BoNRLc=;
        b=YIimr6qSFpLSJvZfxggnm6tte8DHrYlwokHPwzCNVSThUk35IjZejukRhjuoAfX6LR
         4WalB5r4nWKWmeVc7RZ0wDRpAcn/dRqI3UGavWEBeX6GHMsUW7OII2UJkRMiR/n4HA+e
         Rr0t0iO201UC6meNS2K93gxVk8zq7PA/styseSw7Es06gXsKZl0b63EKto61TZkqLHpO
         v8DkSWKP4Q3CkjjxxJP9lH0WO/pAW76EkNQPoiqLqZJalcsGLxtNjaIRuomRt1O4BQI/
         eoPGIhgNw/rqIRCId4YyQJxqD860J9X+vEcpePz8pYa+/wFsejKKuivRlbzrZDDRtPHc
         c8HA==
X-Forwarded-Encrypted: i=1; AHgh+Roqclw/zJFIDzXYmtKVXJ5QS8YtllrQG/UR5S5Ym1DTbP/oCWIsG9UJzD310bmYqIrPFAN/bmzqj3eG@vger.kernel.org
X-Gm-Message-State: AOJu0YwJcBrzF2hyibIOlts+LaV29JSLq1T7sVniHMTSU2d0j+T971Ko
	Ay3YRziaJH7l/40VbM0tV2V+Gy3h85xaKFHkucmbk3RPg4sSHsL473Ja
X-Gm-Gg: AfdE7clcx/pGrgUfkEjc9lbNySfxlE3WpVRivdZQJsKEhZXOGam72pDYai3XsKSyuUQ
	Q3CH0+n39hn8Y3deVTxDy95k6Uh61kfYKAv3dq9X9x3Ladz8YosLq6TEKfE9abWvwt9aKcOkECH
	BxwkMdjzw+1DhK78pJr1PivaLT2jF7vuoGga51oFsEEfct8iAAQZYV6y3e3+TUfT8vTB7KmhU56
	eEiO/4qiMS2T/VXx51LWkVdkeSkliK4j/gOhznuZIIGIRcG8EfJM6HeNaG9X8bMFZMhH+PisiU6
	A+mYVwnkoir0xryqFm6VsD5AURNwQWRWEqx4YXr8LJZ/9f9VBq4GoNzh7D62oPSA7tG0738vRhu
	siuPWanWnhCxmSynIF+2lVIVs8htfFVBbbolxlVCjG6UrFhDXFooKbIB7z+GfS2vp3bU+UAVf9k
	4BiXjeIOb/sY6KHf8UOtBw6s3ZaFg=
X-Received: by 2002:a05:600c:8b67:b0:493:bc88:ddcf with SMTP id 5b1f17b1804b1-493d11f35f7mr101767645e9.23.1783327169115;
        Mon, 06 Jul 2026 01:39:29 -0700 (PDT)
Received: from anthony.local ([2a06:c701:49b2:4c00:12ff:e0ff:fea5:3d2e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c636e9e9sm338236185e9.2.2026.07.06.01.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:39:28 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: sashiko-bot@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev,
	krzk+dt@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: Add Solomon SSD1351 OLED controller
Date: Mon,  6 Jul 2026 11:39:13 +0300
Message-ID: <20260706083913.19172-1-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260704081758.0BD4D1F000E9@smtp.kernel.org>
References: 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>>     Assisted-by: Claude:claude-opus-4-8
>
> [Severity: Low]
> This isn't a bug, but this Git trailer does not follow the standard format
> `Tag: Full Name <email@address.tld>`. Without an email address enclosed in
> angle brackets, this will likely trigger checkpatch warnings.

This is a standard Assisted-by tag, see Documentation/process/coding-assistants.rst
for basis.

>> +allOf:
>> +  - $ref: solomon,ssd-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - solomon,ssd1351
>
> [Severity: Low]
> Should there be default values defined for `solomon,width` and
> `solomon,height` in this block? 
> 
> Since the common schema `solomon,ssd-common.yaml` indicates these defaults
> are controller-dependent, omitting them here leaves the hardware's default
> resolution undocumented in this schema.

These defaults were present in v1 and were dropped for v2 following
Krzysztof's review: this binding has a single compatible, so the hardware
default (128x128) is deducible from the compatible itself and does not
need to be restated in the schema. The driver applies that default when
the properties are absent, and the properties remain available through
solomon,ssd-common.yaml for modules that wire a smaller panel.

Keeping them out, per that earlier feedback.
