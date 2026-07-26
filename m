Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C189724A05D
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 09:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785056770; cv=none; b=Me4xDARdRHGxM0zqahAaW9yJyhC1boWtcpfsvPfLVBooPoePGKKw47aK4hiLRsGq6P1tQs02Bvhe8dBbvUQVPik1xu3WQJ8QpqLCJoNiGhOWbhYOGtHQZHNKY3LjXyqWXe+O/qmqyGG9zPSwh6FerXKVsQW5LemmSCXKzweFvQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785056770; c=relaxed/simple;
	bh=V78hChhCrscCnvnv5/pHiVVnsud/AwwRRDowG7jh4Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KN8IIDbpI/wsfk6ZFg2v1SWEGoZUdlVGwSHFOUpZdCjeeq2wMIkB2TK10UTRTAAXwcIjHL0qAx7BJ7xYg5SqoZbG8/sSUoj7Gvy0R7TEHDbm2vwtUTT42WI4YZMJQqflk6UkW3lfiyrE+gw6MJcaIRWNkWzILmqEGRU6nDLBnJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmRWezpn; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmRWezpn"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47de0093c42so1337726f8f.3
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 02:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785056767; x=1785661567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mzYmvsHWYiBx5JQL06JjS0oT2r4n8LrZRrz3cjBVBr0=;
        b=ZmRWezpnkuKdy0E27CEHE/Wkw10wKkwes8px2lc/uAzWAdW696l1BNZUGxi1jGlr+u
         wF56wI6gwyUsmSdvV/1mYn3h/PO9stNiPekvkYrgl/RV45kGEcJAQQKKkGPa1wuDyITr
         OhctRJKUlLH436evIFq9HnV6QImGRbKn4cleXRS9yfBK2fKOSrJh5FJvSD48YoWuH/Tt
         VgA9o8mtqO9ZHB3mN/pCGMdTp9mApnErrwh0wqi/cGlEImiRpjWJE9IKANisOu0dE7Tt
         LEHUMofwijnSn9OqUnnJriTfIbVqQN3UfO4diFzQDCJoQM4NGBDu7EnN1IkUzIUIJT8y
         ZKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785056767; x=1785661567;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mzYmvsHWYiBx5JQL06JjS0oT2r4n8LrZRrz3cjBVBr0=;
        b=K55PE2VOd78ACvtUDiLnrc++/qFpNrK9tZtjm4eu+5SAfN/oEr6ALRfO2yfC6GRRKd
         4WBiHtyiUsIxz5tc6/n4z9EVA5tiDneiZ7pltDaP7JRRgb7fDJ40T822UBLsyWhnrnAJ
         fZnzLaioE1m6vbJYW8CpFr95ncf5oMe8z6cNmlxIX6lK/ft8Y53Q+8/yh6bjsuXo3SRx
         EPw22N4YN/1fY1owd7gBRJze2B3ca+NGKq2oTHiY8v4v5xcCt6SYU99O3mP6bOakT9Fo
         36arhkMMq7RoD5PY9SouT/L8mP315Pcb1Fl8LYwY1yTYGfnrewYMb6i5UAQCr20x6sJe
         Q0BQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPTaThAHGZ/bXCW8V0w3ZFhZPSLGgUxwK8BDKhvf11P+rt9M2Vimldc8WEyHhHTeD6BnqS1xujAviE@vger.kernel.org
X-Gm-Message-State: AOJu0YxDhiUPOkhCTBCBizAajnHHsVwT8uHrg5UgWjieooKbTJpDIclN
	CXbxvF977bY9+IAKe6veHusHN6y+BixxzW1C0YZGOALfvef0GpnBlRqH
X-Gm-Gg: AR+sD10YcT1KEgRQ39S5kXSX1plDofC1uZaWqpBj3fqKIWM3u+BxniIbtolyWLCal4F
	cvSBGoRLSrawHGJVOU2sWS/U0UnOgAFACb9xKSQ322Ab+2d4L2sLTVlPk4Xe1gjnqwnjJH8P608
	lwsi2T8TqbxGOwoe2UEpFyszCmXtcoUZ4ugt9jd+vBYfUdVv3HJPaKAOpggCHjRhMBH39fJGzXC
	yMCxyp/c7UpALIPGgJ6as8jDHowZxSo92XlWwx9APuNqJMKDZnfEN44d5g8iMdkWJBU7nMX4ICb
	QuxuORwgrT5+wyGUbhUjPq30RwP0kI0JrtdblJd7FKcax1GdV+51DFwL2aVdpLnRs9TA/MIs5Ev
	jP+G8oCZVwu9PBYJSyA0D/fct6wFl528q+a6jPYDUVv1w5naIkLO7Iy8c1cYuT89V7LTibjqWE4
	aNCMny5y5BWvx7BLoZI1snvEsoXWPxL2DZpoPacAyc6gvvFjNCSrlIJl8O12SKcanltIb1oEJdk
	Elj70pE6uegxKpx2TY4I0lBxjJFgYI9Im8NQHriInLkGy+n+ivL6CMtzgqQHxunBRgzUQmjfU0s
	bWhAffsGPONGGp0Qswej8p8a76gChtH/2IEEm3topzMHrcQRVImvHdvJaEGn8a5cmauYJPhKmLj
	8xnbdVq34rbE=
X-Received: by 2002:a05:6000:25e7:b0:47f:9176:da23 with SMTP id ffacd0b85a97d-47f9fa68b26mr5532266f8f.0.1785056766844;
        Sun, 26 Jul 2026 02:06:06 -0700 (PDT)
Received: from systembl0wer (ip-86-49-244-181.bb.vodafone.cz. [86.49.244.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f864305f5sm37570794f8f.17.2026.07.26.02.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 02:06:06 -0700 (PDT)
Date: Sun, 26 Jul 2026 11:06:04 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: "shaikh.kamal" <shaikhkamal2012@gmail.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, linux@analog.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: iio: dac: adi,ad5791: fix 'referance'
 spelling
Message-ID: <20260726110604.30622c6a@systembl0wer>
In-Reply-To: <20260726055609.18326-1-shaikhkamal2012@gmail.com>
References: <20260726055609.18326-1-shaikhkamal2012@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 26 Jul 2026 11:26:09 +0530
"shaikh.kamal" <shaikhkamal2012@gmail.com> wrote:

> Fix spelling error reported by codespell: referance -> reference.
> No functional change.
> 
> Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
> ---

Makes sense.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
