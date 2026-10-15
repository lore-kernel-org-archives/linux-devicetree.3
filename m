Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A237955C338
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 19:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092416; cv=none; b=NDInM6hQPrJj0j4cySkXTHr5dLxqCfU2J9BsdU7QG0On5K2ihHrOcyUiLQCOgGAtXybhSZXhdFECBOnYG+dWaY2sR8cBfMVW2NsNXT53nsC/cCpNnFpQEgAnYl5rcdXGxGnbLULjAtbbpS9K7cKJKqd7gMYSTf1mO5+SaPfysSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092416; c=relaxed/simple;
	bh=KfP/vjeGWsuZ4w73uZHQKGJi0F/32o26SPzn575BRdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A9Lka0DV5UrMJNIDCe2465L+co1ztDDc8gHeGIO8iIyx35XfL//2j2tm1QjK3OOdTEfLOxlDkcKtJZecVaW/5fVIJufP+k4+nhhg1vt6JxhRrB4IIO0Ik0emh9/aNf28rdS8A964qaC/llkfm/3dkmj1OzM40p2bo7xIlPj8gDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghleTTrA; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghleTTrA"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-535179e995bso70106541cf.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 12:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792092413; x=1792697213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1BOiR3HjstR3v+8dWKVs/nFPkMjZqmy5flCQLz7ZGEc=;
        b=ghleTTrA8sN3BkxMrEg+fVh8FkC3NAswPWRc8KNteLq+XWUBrCuH3gy2skylDXgdkk
         2Kw6RcWY8I6DoT7Bk5FPSU1UgXyPJ57/1J3hnFDLfHFYdCEzz4SrPkQNJPc2RzmS5CLd
         4zAzML1nBpVVqAnDE9xZZiQ4TJHyFLALOgMn5HKKTZ15PxJTsNPLsf4L5zRPe+OXhh/J
         YwrsvGQcfpiwb90OSsB3P2MjvSRRxu7VyFbpnYrhIZoJxlCVZqKejy1JbwvcNUES9K/F
         lSi3aGkeLfw59/s35p16i+5mLhuPk782zXkclllo+iDEPaBtZ89srxGR575AKiCr4OK7
         t24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092413; x=1792697213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1BOiR3HjstR3v+8dWKVs/nFPkMjZqmy5flCQLz7ZGEc=;
        b=ORjiV9434bJV6gjNbfHx3hHmtzQ2zXu27bsvffBf8crQYR/NVRSa6a8nMHhTqPdn82
         OxKJNRes4q7GeEyf47pK/wZS3Z5in+gUBKOiJqkYiKx3df52dDvnr04TqjeE1A1XyE54
         KBD3a+o6MW1xbi2Oj0D6X0uolsfb6So18ZCG86RtTooSh/WgJSs3k+IPcymJv6BOZmA9
         7iTu/8vuw7NpOPbmyny8PplbrghfuRgF0wyvjfRa4G2U9BNeRvuQcyC+zp8jY5gxyzgM
         xsXzUXQVGgShvUSyzoz6OiCV9poJmMOGfaPZ7YlhwM7QZvheAZAYPXewbwLmP7FueYEt
         1Pbw==
X-Forwarded-Encrypted: i=1; AKwUvByPBaYKGoaERJjbY2Nygp14i/nhEvbwVgm4/A3yoofaRzL0safKuNq0wuArbM/VxHO/sKBzgYQi/vPG@vger.kernel.org
X-Gm-Message-State: AFq9FYLSGORoKLw0uxPY3Ihsd4u2QM47X32uZELoiFNklTyhPSKVvR+0
	wCZPmkvk+vbvs2gq9k22DPJtxo2b9Ukc+mj09r5aORLBQ8rqM9k3FHqN
X-Gm-Gg: AYBFou1xMLBGWegK98cC5Hq8/XzZgsRh79ZhrcibTlb+Yf9ZixzBsDW5X/5L9kdlAC8
	GwNCW21s51EZ/Ca56nlceGtgHta49bxyjboRPZoGaDqrwRKLIJzGvadJPLjZUegzh9etnqn45NH
	5zVVXAKMmjAi5yMHEZ++3fsM+15BF3TxSy0PV2a3MFaNhK1YGoWvjKzklIOIAlsqx8791IFaDvG
	ppEei20ZfdEAWpOE2s5ERxAI1WabyEQrzMdPefsfp4RFwwe7X0Wmez7dQSxvQQ39mb9SvI2aFhK
	yugHMGnaBD+tWDmoecpeKgx8d1egbTz4XhoLhejC8KFw3tPAU+igoDKLZrhQQLaBF/L2TgkBdz5
	Ug1pk/8Tu5suE46vSxOMebRODhcUImgFeoV1F4NjLdatpnkNG97eRp9v7AudDyC3PdUudD5VLOr
	iOIJCG+j/xI1ep0tpxtZ8StIVfsxU6f7nN4JSU5UBdDeJkvvUibMalXJSf1m19qaFbFPTreFGv9
	qrblzTJLhk2rSMREJNWHCMVPfQ=
X-Received: by 2002:ac8:5c8b:0:b0:535:cd9e:c12f with SMTP id d75a77b69052e-535cda02393mr232419501cf.32.1792092413486;
        Thu, 15 Oct 2026 12:26:53 -0700 (PDT)
Received: from localhost ([144.121.52.163])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb8c4a1sm3270566d6.45.2026.10.15.12.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:26:52 -0700 (PDT)
From: Ray Strode <halfline@gmail.com>
To: rshouriesh@gmail.com
Cc: bod@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	j@metarealtyinc.ca,
	krzk+dt@kernel.org,
	kulikeduard89@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	sakari.ailus@linux.intel.com,
	vladimir.zapolskiy@linaro.org
Subject: Re: [PATCH v7 3/3] media: i2c: hm1092: Add ACPI enumeration and the 19.2 MHz configuration
Date: Thu, 15 Oct 2026 15:26:24 -0400
Message-ID: <20261015192632.283185-1-halfline@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013-hm1092-driver-v7-3-d81a9b152ffd@gmail.com>
References: <20261013-hm1092-driver-v7-3-d81a9b152ffd@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,=0D
=0D
Regarding the crop-bounds question: the 19.2 MHz mode reports a 1294x734=0D
crop at (0,0), which extends outside the advertised 1280x720 bounds at=0D
(8,8).=0D
=0D
Reporting the native array as CROP_BOUNDS accommodates that readout window=
=0D
while keeping CROP_DEFAULT as the active area:=0D
=0D
diff --git a/drivers/media/i2c/hm1092.c b/drivers/media/i2c/hm1092.c=0D
--- a/drivers/media/i2c/hm1092.c=0D
+++ b/drivers/media/i2c/hm1092.c=0D
@@ -836,12 +836,12 @@=0D
 		sel->r =3D to_hm1092(sd)->mode->crop;=0D
 		return 0;=0D
 	case V4L2_SEL_TGT_CROP_DEFAULT:=0D
-	case V4L2_SEL_TGT_CROP_BOUNDS:=0D
 		sel->r.left =3D HM1092_ACTIVE_LEFT;=0D
 		sel->r.top =3D HM1092_ACTIVE_TOP;=0D
 		sel->r.width =3D HM1092_ACTIVE_WIDTH;=0D
 		sel->r.height =3D HM1092_ACTIVE_HEIGHT;=0D
 		return 0;=0D
+	case V4L2_SEL_TGT_CROP_BOUNDS:=0D
 	case V4L2_SEL_TGT_NATIVE_SIZE:=0D
 		sel->r.left =3D 0;=0D
 		sel->r.top =3D 0;=0D
=0D
This changes only the reported bounds; the mode's crop and register=0D
configuration stay the same.=0D
