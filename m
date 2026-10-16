Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A850C4AF691
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 14:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162534; cv=none; b=b+CvbWffe2N+1AC3bMZG6xpt76I0LcXyFyeCsT+q7z8MS9JmEvyaqfQmhxjji/2KlF61drWNDgzfiu0BG/7zy4EjVxNTCmTMwL7PRmOJ+azV8n9UDyYLGC1k6ksg0ycyaSVCXKG98IQCGwHhTsZIvIBYfDyHFneQVxxJW2RTbxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162534; c=relaxed/simple;
	bh=Y3d45SEYh6OWjaKY76Wdm/h0py2ZzLBTvjB7clZ6LC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GYpeHMeYP5+VUK0EZscJGajmaIonGtHoQU7BFoVemPnNoi96jnhzj/3ZwvS1s8ccWWatAUqUus1SF0T9BHCJJXvS2iCCAh7y3y9yKcVvc/zoDysypVd0jei6BN6738xfdIH5p2z1ilAg/OSifCUsLrSAsM256zmzCVBhAL6Vtlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azeUESbq; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azeUESbq"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so556785e9.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 07:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792162531; x=1792767331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y3d45SEYh6OWjaKY76Wdm/h0py2ZzLBTvjB7clZ6LC0=;
        b=azeUESbqOBkDCpB8Ky0uytp01D9QkVAe6Ab4e/Ah1T+BBUuzuQ8UQkJFiztpQcR6b2
         U4UQ8giy2ElHxqgO5vQ9/GUyQY34xHj/TgsIzPMMGnH5yoZi9zCqLYqHQFdFgGRQhhUn
         bKurq1chu3Bo9AwGSxRGgmalbZT47XBG1k5LkfVPuK+mtv2vAcyamAb/kaYDY3pzkdZ7
         en+w6JNs9SL1T4f7cgoKprq23cyP9Tfn+AqOp9ShkeVWaJuxQaxmBf1yO8uO7yZTpvGZ
         Rd+7bvdiWdK/iURLnTYkhm9mrzYWp/DwutewQK6ldVGpif/5IhSgYDliFekEcm0knlVa
         356g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162531; x=1792767331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y3d45SEYh6OWjaKY76Wdm/h0py2ZzLBTvjB7clZ6LC0=;
        b=XC78uEJSTXVMrn4Upd7QTuf5cbh7R2YfGnS5nxB1450gIwBWP+KNPZJC+jMbt4ljEy
         tNVlEZbNennoYU9U2ac2DusWUEEYJZ6UF1EVXkRv2Hjiamyg3b1i/60daTsjfpc08s+l
         F9EnkZUAPZGJtdrMwuI+TiLGsh7KMDXx1BRNr1xRMy7qdtUeACx1iHxJAyWJD0xfV7xk
         fdap/70/PYpSfdVfaXnNzOS4EyXxo/RfhG/PCBiw4aviZb69hRMHNA7Lq7iO6CdPE/H2
         hBvuSK6bxdlU5Y3uAGkkvO2d+lSCLPhjpbA2ZNqYTXDF3jbRs8vt6gzoaLWIW0IdhfeN
         NUNw==
X-Forwarded-Encrypted: i=1; AKwUvBzOFL60SSSa5+jAEwJXVrYiWJXwxzkSv7K1Dpi72xHQzZ4f56arT9315Mg4iQOk5/+v99g4XsR0F0Wi@vger.kernel.org
X-Gm-Message-State: AFq9FYKtiH2dTUCP9OxVb2s5v7CynDtdYjFp6ROXvX4AdMYw7EKFgg7/
	9OWQoU7ZImAaUgzubB98z66vG2N4Gy8sz5lATYdBqw9d4regWoIBdSS7
X-Gm-Gg: AYBFou0hW66SKyTCW0NC8J7gxIPYVxkeaxxONGJgAP8sXQtvsi4rUu+51hjQJDAsoJp
	pqYxgN3ZK3+mbFr4xodRbwt4ilVzo9hzqHrq5MbxLjlprMe45mcFtzJGhaeqygpIiML0Fwe4nbm
	wnfJtF673cDBLkUEcQSbN/B9xSKsmPu4a284rlyfAUPawb+c0qdqb8imLRwS8OBESuq6GOVwT9t
	04iymxnzxecBexxFFXi+D8Yh/mQYINg8neM0Jv4upfJd74KFFA/yEfIynbfLHnD2SDgPDCDoD20
	Mle609b4PtRXkxBuM2mpcRKu/n7Ueg1t9UmCDYTnX5bUoiThfQtqb7j01OIzllm+iWee/31dLe1
	yc/zqg6JtAOSXWRTBOZ7pbCjejoTn58XyWbsOLsS4kvdaIv388VxEzr1M3Qbb2MB7TB4X9k4uYc
	rckEYzeiEQXW7SdOSan2ASuEqJb0i+gxoMxPw7HUC8CZeVakiKD2SnW1drwLH9KYC+j7GgXm0hb
	iSerNtU1AL09pzlubZragZMtixW3Ea4sVNyRH1H3cUP3wsDZ19RWpeUVeTpWIktojwagZ8WkfVI
	KAwtkPg=
X-Received: by 2002:a05:600c:8519:b0:4a1:722a:d2a3 with SMTP id 5b1f17b1804b1-4a1d760d830mr1162945e9.23.1792162530858;
        Fri, 16 Oct 2026 07:55:30 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471b06sm6324206f8f.5.2026.10.16.07.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:55:30 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] media: ov13858: device tree support for the Surface Pro 11 (Snapdragon)
Date: Fri, 16 Oct 2026 15:55:29 +0100
Message-ID: <20261016145529.36811-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016070018.11932-1-lsa.uz@pm.me>
References: <20261015-ov13858-x1e-v1-0-acdd918f4fb6@gmail.com> <20261016070018.11932-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sergey,

On 16/10/2026 08:01, Sergey Lebedev wrote:
> Through the media device
> one test fails, Active VIDIOC_SUBDEV_S_FMT, because
> ov13858_update_pad_format() never sets the colorspace. That is in media
> next's driver already, not in these patches.

Thank you for testing. That failure is fixed by "media: i2c: ov13858:
Set the colorspace in the pad format", which you have since tested
separately.

Thanks,
George
