Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463875;
	b=4MQAt5k4U+6QZVMqe/PvzSgEEXb8R61yOXe0lWiE4X6rlcFxgvtjUkJ4SuXuxFZaBi2H
	 a9ZwjlIfrjjqoVqNEWBGslVM+ZvXXoL7hLpNwX5tHsIBfJ5SeyCPVhoyWA1loWuj7viyy
	 uwWN9F0g+CadHBjhYapj9IhlrZ3asxWFkA5LW62jPb7bcgIQm8DUO1CKzwkIvmyYHoqGV
	 lCIjVua7+Sff/BDnNZQf512xOz5p1LTnr+W/DQTnBb58Bw3nHRZtgn4HqzbFkII+hUGd6
	 tUDvtbLW7u7zNazq16y/QywbB+vFRzb9iststCHDN4EqKhanEvdvhT/bm1dJetunQaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=C7vIh0omWnaIKHlyuOp9GFFfcNaXC5AjrWL9J1CqIMk=;
	b=KxBjz8QvW0FZ8QiOEqpCG9loulKSKO0a3/vIbzhkuDmHs16LCZjJErVJnljHgeWj3rIY
	 wUd/kNclGetj/RxU+Yunqz5WemTx0U6VSNGZ0gq8wmFv3kcnxsLVCp8RMO4FFwVgOEhay
	 T8Moa0volFsEqsp+/ZYJr8Od9LgDQN3ZXZyvCVny7wnMYpoWPM3fyQvtApIcmDc+sGU0k
	 kW11wWCEOBU6/ZfCmV5c82VpqOYsnnNSCwnsMD4VceYfSGv6/BXcbw0Nf2EsPtlABz23A
	 cVhYgGTiGoJFl0CBtHnRZsGOMyO4GNBpQYfVDQkitDz1yoJ/bxkzTwxNcbGRYzkeiSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NOSMD9fU;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C42C606A322
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 16:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C42C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NOSMD9fU
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-54465f79af8so6690411cf.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 09:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793463874; x=1794068674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C7vIh0omWnaIKHlyuOp9GFFfcNaXC5AjrWL9J1CqIMk=;
        b=NOSMD9fUaSlnnAVs7rDQzs+EGkLJpl98bLE6Mp6L+MVutT9zwJaazzQNB8EAK1qifs
         bBwwM3+WLfOICY3Is7k8e9GZ9J8ydKWjTqNqv3dfYyGA6d6MhYwNsR4IwfftTsOoXr7N
         yOdhx6IWTWxDVZ6lhsoPzzq9bRhXCsPl8T+iLhNsvHxBSzSoDa5r77nD0JplJm5EaH5e
         WTG75zqArnuzvweE9XoFWOtZfUV5VHxjNTixWsaMVJZzWz/6eXhsSy37tnxN/8os+LU6
         G1ac/Van4gaAK0eTWbF/qqg/SfXcLSCHQnCzEVuy6B+TGr5AA4A+JQV6l2BowGrmlYYO
         2lwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463874; x=1794068674;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C7vIh0omWnaIKHlyuOp9GFFfcNaXC5AjrWL9J1CqIMk=;
        b=ta0Uc0CFnnYzRrffPMTJrOi6PstNaYJzvymad4bXxkuVMaoRfvw7EvE8RjghCRu957
         2bw7YUJPl8aDSQExXiwAcNzKvpVD+wa3g0WrZGffRIgjqqtvOY40GfNTVFt7XQdBDx72
         LODsF5YVFQX8qGxlLo9KsconS0Zv8QtMq9NrA0FcamluJVHJjeKt00fHeOqKmsYhluMO
         VEXuVGFhGcSn6Bs9dZ3KsLhxSvEmGufCW8PptTdyf+2sGTAFVrm62l6EuiuiUcOE2vBg
         xLbgNqBn2XWNXL+jE4E8i3QEiNu1ZUFg66sxkJ7oydvi9Qr+xKUEw0LqrwY/NpetuTKn
         zMAQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/Bn+KqSShWAJ8FKjzUXsAY0Ijy0szRqH8wPvc9Ad2HA09Xp0fyNXqpQ1lZeZNOL5RWioElz9Hzht0@vger.kernel.org
X-Gm-Message-State: AFq9FYLN1flQQJRF5g3pbFwx+9PXVHe4vDbPG4G+5J2aH4JJbGWd+RIx
	GueSm1xS/jf+/eEzBfjlfNr1hB7bDhkJpQZxZR/SyZVOdvYE6eXvBi1z
X-Gm-Gg: AYBFou3fBUKmVvxsEXhe8E3OVIWfyuyOXrXsE9NQJcq/dewKSatIhkyEgiMl9CgC7ib
	uYdqG0re7Q9mVs6BVLGPbaB/N1GcmJX3ayjr8YoqQAUGArmGaPLm2FIi6/9ax0MI68KUH5O36N0
	YGH0SDKJ2NNQ9M8Q5Q8+RhAnMZIb9bokiQV1m78K3vq2vEZaywzdSeTgsAVwy0a8tHF43+mfU3O
	5KbxjaK1tIonUf9lXAWWclSZn1qgE4+QlT73kpH/u/WBdk11TvOR2engyTpy0uWa5zBkOtz41+X
	miUx8PX0A1guXCXTX+jRca236+MOY2iHZtvJCu1W7Jj626nNRbWOSYh616A5FfwYMstC1G7f/aZ
	l9Dry3IAocCspzhLFGR+0jcHCC+T2xm8/QKTkNZH8J3J+p3ZJ8+4KmZnhsAicV4w+ty12v/yllN
	4LAPjUR2rwcBzUJRKJfo2jryhaCC2PhavNZeHkVs9ysA3cR52MbBomHVMQubr0Sh/BKhBzlaLNK
	HW00zj7CvYy3R2OKklNE2OEiD8qLJR7zyyETgg6SucAilGEXQQyAYqymUK7OjkUsQVqMh2mTCFS
	Q6UYyj1tA+/3MpCJm9/1BrnIqGdKqE9XYhkDkM4+NXu9SZpq0HWHsGQm5jXFOXDc186qKt+ALvX
	zsVygKg==
X-Received: by 2002:ac8:5f0f:0:b0:536:6378:c805 with SMTP id d75a77b69052e-542b7b0a58emr89957211cf.51.1793463874088;
        Sat, 31 Oct 2026 09:24:34 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f47685sm45340756d6.18.2026.10.31.09.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:24:33 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/6] Add CCI and CAMSS support for Glymur
Date: Sat, 31 Oct 2026 11:24:33 -0500
Message-ID: <179346368177.44447.12360580299773199469.x2e-share-camss-dt@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
Content-Type: text/plain; charset="us-ascii"
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

For 1-3:

Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)

With the PM8010 I2C series v3 and an ov02c10 on CCI1 bus 1 and
CSIPHY4 (2 lanes), the front camera streams 1280x720 at 30 fps
through libcamera. The A16 node is the CRD wiring with ov02c10;
happy to share it.
