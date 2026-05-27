Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3520F4266AE
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 14:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892522; cv=none; b=CVKm3S4SGeckSngBuEOw3twY5KA+U/dfHNstMYoyqtYQMlhapMjPAjpHZsvqw1Q4G6wfeBYVJd86bAguLzdJ/vRoBqyie197J1Cw+jB3BFqTMIzi0VVA9jHkhDtQrL850yhWEsSprSqBRqRsk/RIkPOquEldItR/2fRgoEHoFPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892522; c=relaxed/simple;
	bh=R1JOmLNp9EHZ0WEabHw7L+RqlPFyqYvHKyOAqJ5brCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s1ahlMs0FsY6dIACIfS+AYlSLiQevx8tpvyt4WcKSIYGsIvScepos+dx6KZrHBbI9QxDvoj+cA7RhvHgYuIhjIXY5G5oPcLSzPhQE3ayKtZL9uQue6lFhJWtCj7wXh76+HOmy1UYLcJw5fAOeblbAIp7QNDR5OfaczfasKEPbjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URiPOihO; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URiPOihO"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-441209fb77eso7310109f8f.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 07:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779892520; x=1780497320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RZ5Q/PzDGNXsKLZr9eRwm4Xl3D/WdSaJJPxHZSkacU=;
        b=URiPOihOIO1gISUqvrJ1XGZKkKamc9tEakh05wtPKiLw6fBej/C01JH4lTvHGoud6s
         sZjpLxj1EFWnJYo5B/rIEuVXT09NHrv+NonUuNu3OBn4MXILiyvMgHier1d0vDZyJPGI
         4zgSvq0DJo57cMyAclwcE2F5an9xgZiqNgDzVDAOA4vLz3foPCqS2ERXcsRLGrRB0ztq
         j5IGmsde57z8qa55YQe91SpK4s+H/Wii5/U3OTpF67HnsJqMbAPlZItCL6nhmkWjCy/1
         WvnmMFvz0/n0Ldg911ZW25igRwJfzFZ9IkHH4HcorQIjJgWXCbqrt3Tssfc7YKMchWdy
         X2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779892520; x=1780497320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0RZ5Q/PzDGNXsKLZr9eRwm4Xl3D/WdSaJJPxHZSkacU=;
        b=X6MFAhXOpwX3kD18BQXsdaGVJ1HfzDsdiA17QZe3wpjx+aUXV1ntjegyazp/iEvbt+
         o86dAzPXoz/xN2B/3h05IeJPTqL2ZJOshD5AzNT+nOtZ2mliKTWT3UqCU/RxcegLWItY
         5CtD2zxhNOCgsgdwXCHYM6HADYGxsyfuvAUY80y2h1sYfyhQNyUZLaqDb5kNkNHZiAWG
         5GPMFimIDITLx3XWn1DCaLN1vEjXhITZbKEfqhBwRMWV6lAiRXinVaCqK/MvA27yY5Tu
         WGjf4XHEsk4hm6uwgRPbTXB+0D+jtaPLxUQZqFiPUp702N/oilaiuQs7it2lBIAK1EiV
         t5rA==
X-Forwarded-Encrypted: i=1; AFNElJ9A2XlRFjVwqj/wSsudcUx+ZoXCrCg57os8wcm23LwkSMYwpzzFJoL2HT4AcAM1gcHPAfgBzbQ3lM6/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgt5y2zS05sty1L4ApKm4eELHMOdZD/7kVXuoAW1XVrAaMkte2
	VZXXPBAhgyErw+D+zyQvORe//s9IQ11HOwov5g399EWhWD/loj3pBoI4
X-Gm-Gg: Acq92OH39tmeDCFYnDQwfrUTy2FyQRxrkZhtSlD5wsIwDe7oMiWHDE4+7B/T27fHomP
	QEU5+lGc7jyse213z1V5y+0X4n/+hQVAHHzO+EpgG3wUZBJHQexPg84YNs/OWsKpb56XF8Ou2XZ
	4fxqo4/eNA/QUJJ4Fb10fotwnboUoXHceRz92VRsHgBczOKAbwOUeoDVPRhPguFwRkXTBqpTejk
	87d32l6bnQ2vx9egGE+dYDQDFBIoyJUytDDrM5pdDhMhqIS0giXMzxZHIGAeWV4SdTkF9NvX7aS
	gmzIRTE7ajYIj/TkLwfMPcl2jQpLish70U93EzQyGDbtf4XJmRAgx5iVt5FIi2le4i3DjAB4iTN
	P1mrcvV8fAn0S7unkPKGwghjeQRNijiuen5eFXCltU6Wh2Hnj/HXjs8gFMZK20Qc6HsYGZg/uAT
	4oIueOUT/+TNC6rkY=
X-Received: by 2002:a05:6000:2608:b0:45d:2b7e:a20 with SMTP id ffacd0b85a97d-45eb3131940mr35157326f8f.14.1779892519687;
        Wed, 27 May 2026 07:35:19 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5584b8sm6239763f8f.11.2026.05.27.07.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 07:35:19 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	jdelvare@suse.com,
	ak@it-klinger.de,
	linux-iio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 4/4] MAINTAINERS: add entry for Sensirion SLF3x flow sensor driver
Date: Wed, 27 May 2026 16:35:00 +0200
Message-ID: <20260527143515.102794-3-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260526173616.256fd535@jic23-huawei>
References: <20260524205112.26638-1-wafgo01@gmail.com> <20260524205112.26638-5-wafgo01@gmail.com> <20260526173616.256fd535@jic23-huawei>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 26 May 2026 17:36:16 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> > +SENSIRION SLF3X LIQUID FLOW SENSOR DRIVER
> > +M:	Wadim Mueller <wafgo01@gmail.com>
> > +L:	linux-iio@vger.kernel.org
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
> > +F:	drivers/iio/flow/slf3x.c  
> No need for separate patch.  Bring it in with the dt entry in the binding
> patch then add the .c file in the following one.

Done in v2.  MAINTAINERS hunk is in the driver patch (3/3); F:
line points at drivers/iio/flow/slf3s.c.  Series is 3 patches
now (types, dt-binding, driver+MAINTAINERS).

Thanks,
Wadim
