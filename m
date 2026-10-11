Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804D1445ADA
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 18:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791744987; cv=none; b=IrWXCGkt/ChKzQnZux4qsqEPQ7/VCl8+9HRz8pE8pXIIZQawVaT+9dwgCy6H1mTteGMRw2uQRQABrARsnH6Au1h61uQl+pCnMMkW/WH00V23NgYWfV5UYE4XZYYmR8PXdnr1j1Z1EnM9+t5vkjYuwbUo2j3DTywOAMDbYgc2//U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791744987; c=relaxed/simple;
	bh=Z0/zwG2X5G545TpYyvmtPcrzRIojbHRbtm+jKd1Q5yw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GIGT3cJaWnAMAU8JFrvhQFoaE3Ccert0EAg3Qnp/47wkU3LHNq3FxkLXacvQIcPOaNX0vtA4xGMvPXLyczpV41eC1pNsGRY3fpgHTDIELl+A0l6DtX51Fp/1WouAq+ePuX3Wj/P2HGffl8vTbPkt0ZENamIxGOysTSrIpW+IvvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=uEUnN5jU; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="uEUnN5jU"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93e6f83f0bbso127438285a.2
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 11:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1791744984; x=1792349784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0/zwG2X5G545TpYyvmtPcrzRIojbHRbtm+jKd1Q5yw=;
        b=uEUnN5jUm0xuhxAvukWdd+4x0F0sab4lz2Y883YYDXwoi1JbTIgY6hnvsNECJZXCT0
         /ufQslEoXOt0yl7lQG9bOzcTSRQcwpAMBwtW5Bk/VNNTf0z5Z1HXEwWq8sxKoZlQuxIR
         X4LEEnJ+h52/3h5XH9XyrHlMTjDm9y9AJOSUBbcS/wuiPjyGfHfQ3qfvQ106xwqZVqs0
         0QneORcIve5fDr1CaCIa0mbovYc/dQE6vx/qqgmLw4AiQrmXcAqiPXYDOVYajBVEAlu4
         3DDk9Alm0FhX6BjzpAQDLXnz8OdZBWvzElndsq7QDGM5oek2IBabrLO4uqGz3WF0/LRR
         7xzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791744984; x=1792349784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z0/zwG2X5G545TpYyvmtPcrzRIojbHRbtm+jKd1Q5yw=;
        b=lpQNf6rxV76hNmGpDhsTbgKIc/8xyYx8wp4E0dLoyxDK1uJCmAipgnndHLVEwtTNxt
         2oqi2qrjIa5lnAR0KTc71lHvtnGOhv1c9p4VZEQ5/Vln7hZpeMLDdkZhejtRuZVOzScO
         wMscPopd/he0RSeamzcvxz0nwYcK7h7GDCaLO19nx3dDt2+IqR5Q+BP7JHgjyXdN67ij
         VftzbTAC/qlOwLOjAtIzVGOtuoLURieKCGU9VCRfpfJLMVu9orLZ0ullTV0Eu4wX/9Go
         d5ra7JCk95NSRmzYrtES8ac+qKWlIF9O9OiwV3iXvxidEWm3aQD0Mpk+oP5WcKv7r8Wm
         4DVw==
X-Forwarded-Encrypted: i=1; AKwUvBxVWJ/LyqYGXAp3syUUDORoJi1XjE7aFMGfT1Fve4qiMnYWdyJIoqGPw0IYIgdlpQ7y/wtQzJXbsdVW@vger.kernel.org
X-Gm-Message-State: AFq9FYJt/khZzo0JovhV7wbWS45Q7Rmd2feFC5p7PYp7yWWhj1Lp8HKu
	m253myG4OBvDnVZl+ERxAhTPeoAaTAolPUqx7Lrn9VZQJ/B755gBcTczzQMAuTDeAo8=
X-Gm-Gg: AYBFou3/rU5NK1+413U4qVmmhAmZp8Cqk4AlCn/0Ih/VuJKxQ0aQfrDNhA33RAVkGem
	daGwibWOqVQCC0y5dqpFxy7Xl72IylNfZ4CSWEHQxpFg0nqqlLch+yq+VI/4721ii3scMiW5zNu
	j8YfVAftHCwiSOe07MlxrMhyEI5ppc9Nitp5vkosjPqeoRfQhxTUjybAQj1vm8WPk5vRRZUJ/yF
	cL7BG/YuRW8LVsucRXYt6ZUhhuDp7cVBnEnvjdAQXRbd+zmLgZHS/goDGChJTFBESmmv14z/1DB
	xDoH4PZEEKXPdFKcUMZdoEb5KghCd2GW1NNAFvTXfAuCjSK8YYrOsmsmcGduZVhyF+gkV3NjpJ3
	58hD3iTpdaTJJwApA4jLAu//oCRGdb0ooXTJtfa2EmAyH1Rmqp6YaMQAWqupFn7bEYZ8MAfaXaC
	sRP+0eRVvXWqxLNo9q9WcJGO4wvsYJXgR9NA9wmXVxDrEKAFA=
X-Received: by 2002:a05:620a:2993:b0:93e:9508:8360 with SMTP id af79cd13be357-93ebd1dd868mr1265964585a.27.1791744984201;
        Sun, 11 Oct 2026 11:56:24 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98c5633sm685992985a.35.2026.10.11.11.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 11:56:23 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e80100-dell-xps13-9345: add the front camera
Date: Sun, 11 Oct 2026 14:42:57 -0400
Message-ID: <20261011184257.28668-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <b53444dd-c273-4d92-9502-046978303d47@vinarskis.com>
References: <b53444dd-c273-4d92-9502-046978303d47@vinarskis.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 11 Oct 2026 18:28:30 +0000, Aleksandrs Vinarskis wrote:
> The initial patch for camera from Laurentiu Tudor that Abel was referring to
> was never submitted upstream, as it depends on CAMSS PHY and DT camera
> series which are trying to find their way upstream for over a year now.

Thanks for the link; I had not seen it.

> Just an FYI: CAMF_RES_QRD.bin is an AeoB file. Some time ago I made a
> repo to keep a list of already de-compiled files for other developers to use,
> might come handy.
>
> IMO this comment can be dropped.

Will drop it in v4. The dump agrees with my read of the file.

> Windows may only be switching one rail, however there in fact a 2v8 rail
> provided by LDO 7B.
>
> I would recommend to add it.

Will add vreg_l7b_2p8 and avdd-supply in v4.

One question for dvdd. The sensor's DVDD pin is 1.2 V, so a regulator
on the module or the board must step it down. On the schematic, which
rail feeds that regulator: L7B, as Tudor's patch has it, or the 1.8 V
behind GPIO 91? That decides whether dvdd-supply goes on vreg_l7b_2p8
or on vreg_cam_1p8.

Thanks,
Liviu
