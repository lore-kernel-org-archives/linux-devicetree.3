Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839397;
	b=ENwfEPgYltos+ET1Zi1xeHnsc7QHK2Qbp/uaibdcWGWP6PXmRJr9TwOS5CtRSzYtVFus
	 XXznoBBFR0ClnkkK93BLrre6W04323D3/pAz9Nk/gDwHu+xBIsTXvm4Q5UaynF2IMlDLw
	 WVf7wrudx8VVOrLHRSn/LnROPL01rYFCpbkS8DKsnaZ3YqS4bMen38+iVwKS/BVS7BF+l
	 OA6nzOmUa8J7OMJTY9tbdY9ep1PPeCJzc7oKjO1BOucciSsnmweMFAXaV2h1xfc/EEssi
	 AmXAUPO5NXuZ/8ftDL8DVnPmo17vOKgZcrDvUp6WFS+/08BLDc29RBUydXtELBW27dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=x2dqwrMB+tnBoA+6+42KIBNT73Z3cpCJD8k5B0qA0aY=;
	b=MLlH2+DS+EifW8iv4thVCKnx4iJV97EsC8z6bbSeBmCncsmSNExyIBm2AJGzdPRNd6oE
	 rupPDfXwq85JpYCHMSRldm4nygTkgyets4/IHuii2chewBvwExde1K/iIsDxEjqVzxD4G
	 LgKgfplCqdSnVYJL5q3cXGsh73cXXVw9DDuFNP0le7LhUHzCKFe8qR0EXEn2Gh1aX1yQ5
	 iDoBWQXCMYqdRe8G6kX27Zct2NrsorP9vw+SIQnUg1pPhuuPK935wWxCf087hPzLBx/vC
	 Fpf/PKcFP8Ee6WQC/QIMGWw+NjnC5caK7Ck6PFY10HX4g+xXDXZnGZGvEZ2aBiDMrwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VHBe0KMV;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032CC606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 00:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 032CC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VHBe0KMV
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so10496965e9.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 16:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793839395; x=1794444195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x2dqwrMB+tnBoA+6+42KIBNT73Z3cpCJD8k5B0qA0aY=;
        b=VHBe0KMV+u5jMRSkLnXNHnK0mTosWLIroj2ejLHi5ZRnZUiscTEHSsspxPZulOp8Gn
         twYUDF3uIMUTxDhmLF1w6238je3baH01ZhSyQDC6ZmRr4vyT+AB/GjGQg+akFB9mxQio
         RD6blvWxlg260yKErdKEoqZXyXooOcTCGpAV1Fv2hYh0A1WlqsItwIv5OwI1pjC5B6jn
         jfczZTroBf0+gHZxte1FnTzXjIiaDirC9Xx9ex0EFXvZVl2crZUSX1XJYZ2cWDaJWRaf
         oYokvnvRrbkIY0Srp+Kxnsx5LrxlPvUbftXS6lyO4VevEQqFLnFlERvZozojCI3rvulY
         fKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839395; x=1794444195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x2dqwrMB+tnBoA+6+42KIBNT73Z3cpCJD8k5B0qA0aY=;
        b=XuOHUNiVS2yET/5UyjxqNKsUxdOrqUwzCRQdcIwDqOlRLAqNn+I1ID1megc+2eiblU
         qQGKtqtAHr9mZhjYAQ8jKoAKA4Cw12+NTiwgEdbMqol0H6QBRUuNoe6HFKoHmZpUSPA9
         rbYwjlsr6Zi233jFvW90fxQ1WRVS9YJr03GD3C5tjJQec3zqXmCAft2QANLGCQ+DnGYk
         qhhjgAm8FsmAyhx6KhDaIPNvydzjiKPWwveReofrHFkIqacm3E/uKCL4WFOQlGIZRemt
         1VdRWyKZjj9rxoVnpBJ3tFQo9Hsmsl8E2BIwPhXDeQvTJx+eOb+4d5pX1Kjz5cLp+Gi5
         6a/g==
X-Forwarded-Encrypted: i=1; AKwUvBy/zFMOVIwVutK9PgavJThwDaMaTF5urltcQ2ZAlrgTR/ZlSBs7Tf8pQdPFH8hX1co0aGbpubt/HCYs@vger.kernel.org
X-Gm-Message-State: APuU4Z+S+jOFr7So6EdAwfgy6vCmH6rPG/6nacUJwv6Cd20P/uReVhVs
	3MYIWGsbaYhd9Vx/u60U/fSiIKNT1rB8qVllMqU8YH67G3MWOWGyflbs
X-Gm-Gg: AYBFou3Wz3HDhoBUAu8Cx3WMhOSb7GcNsSmOpzHXnTy5UPJDqcdqURzlhYmJdN2I8Mf
	AAlqUGLIv4WziQzV1q2TTl9bLOCIGUBahE8i7sLWvbxJV+vN12qTj16qbG/uG9plyciLW3WLLY1
	KXkzaVyu7bRsl3GfMxF3FAUwxooKSL7Ky/ycrLiPAiA9IAV2sRJDV+rcWAfbaWgp31kPP533MMi
	I59TKMkFszfh51gL3tSoNvTbJHxmoXoW7YLyMZXsmImqBBZ02hlm5fJ5hk4ASpVH41CRHwIXCXy
	G6TGD1TcyxUneMiL+MbzN2tyb1zVdCE2YIzzS4WyaDgHdyFUhWbwmE3hgkZW+UlrTZY8HCAkwjM
	enUEpjlNXmsnMqGwUMmYKZ8ziWClhfdHjv49abXvOQnPctanwhc4cIZb90bY5+02I7L0neLi6pf
	KgK+VH2Bd9Mz1jsKxyJtkkMBlEeXAxsdovoIxQwlHYoXrxsjFy7fuULHn16BRDA7o2cy08Yc+pr
	h55YpdI7B7jqY63ukrb9msHVFl/X3OS77T/uh+ZjQeOByfRGWB0eQuOpYh2KPu8p2rbpr8dRIHr
	KivvJs4TgmkRuoSaR4PQvSXBoSpbEaHnKoSjY3gCO8T71r8s4sjNePnpNEiodcp85tJlzGInjD1
	inUxTpX8H
X-Received: by 2002:a05:600c:8b2c:b0:4a2:5267:3cd4 with SMTP id 5b1f17b1804b1-4ac151a8c26mr415678795e9.3.1793839395161;
        Wed, 04 Nov 2026 16:43:15 -0800 (PST)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b414b170d0sm62276595e9.1.2026.11.04.16.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 16:43:14 -0800 (PST)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Marshall <pm@petermarshall.ca>,
	George Neacsu <geocausa@gmail.com>,
	Hao Yao <hao.yao@intel.com>,
	"D. Manresa" <dmanresa@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] media: Add the ST VD55G0 global shutter sensor
Date: Thu,  5 Nov 2026 00:43:10 +0000
Message-ID: <20261105004311.144035-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103103235.94397-1-lsa.uz@pm.me>
References: <20261103103235.94397-1-lsa.uz@pm.me>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sergey,

On the Surface Pro 9 (Alder Lake, IPU6 8086:465d), on a 6.19-based
kernel, with 3/4 and 4/4 in the bridge and 2/4 adapted only for 6.19 (no
v4l2_subdev_client_info argument, and the "dvdd" supply name this tree's
int3472 uses), plus an int3472 that passes 0 to the clock _DSM as on
Hao's thread:

 - 4/4 gives the sensor st,leds: led_mode appears without the GPIO 1
   fallback I used for v1, and at manual exposure 600 and analogue gain
   8 the frame mean goes from 15.9 with it off to 32.7 with flash;
 - with the clock now at a real 24 MHz and the link at 396 MHz, R8, R10
   and R10_CSI2P at all four sizes run at 59.14 fps, as the controls
   give, except R8 at 320x240, which now delivers no frames rather than
   the third it gave with v1: the IPU6 limit on narrow packed lines from
   my v1 report;
 - v4l2-compliance 1.26.1 on the subdev passes 44 of 44 in both exposure
   modes.

This covers 2/4 to 4/4. I did not test unloading ipu-bridge, since a
warm reload of the IPU6 needs a cold boot to recover on this machine. If
v3 changes 2/4 only as in your reply to Sashiko's review, feel free to
keep the tag.

Tested-by: Fernando Rimoli <fernandorimoli11@gmail.com> # Surface Pro 9, IPU6

Fernando
