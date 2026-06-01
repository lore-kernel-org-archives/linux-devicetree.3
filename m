Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C0F3BE645
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 14:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780325033; cv=pass; b=rVZI/NrvfKv8tj/kBPFXXmTUIJGT1gra+O6rLijMAFvolwsxXGx/h/KdVyFCAbF+Nf0IJbacycr+d9WJD8q1JJ4of9i8x8eLl1lO5FyXIVQEZuENZoIo8XmDssssDbR0dOyMkVvQciEyszHwyl9pj0hnGhAsbiz+6b6TEgj8wnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780325033; c=relaxed/simple;
	bh=SjbsHlFy9x0kgDl+4/irECvQxHpJEXXlnDbBP4VzqKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOlUBmwfghDXcxICYHv8qa0jTb9skZNLB5f8XxrBjpQuw9ElOQYG8rlaE3w1cWZ+j52Vi9MmhXv/5RdjwbFQmsxGHZTNpHUGr+VQS7+YUGNnqtHkFqnQ7+yXwC9KIw480Q/atpYppLxZeuLNabwkPa3aafDPpoJeW0pspr9rRDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nd0yk7CX; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nd0yk7CX"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4904c1ce4c1so114319635e9.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 07:43:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780325031; cv=none;
        d=google.com; s=arc-20240605;
        b=BOG60zyVq6YnFyc4P0W5pvgon1jleNHa3zWy+ILecv1rv8kULBwnm1S0ZaqkB69jZo
         P9IIsRnol4i50GT/PDihei57qzVxaG0KDkQihMG7EdNzKylqZMVbho4jFYBM/UqD8qdE
         4MErgO1+x5lGc3TJR/8NWVx5lvhrbmn5EJtlXnYxwPGQGL2UOF66RwqFeTFCxTiBh05l
         GfQQrm4TRgW+fGSDlqbn1aHrQp3qr1ZAggQ3ZDIfBqqhh7ZK+YhCBtup5x9F2nFZGr20
         UpYviaijJjGXQD5C6EMz1A5qogSq36+vyd5x6V2rAcsgs2Ba5iqRarEEGHk0bDItI/S0
         CBFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FaJ3M/Cax1Tl8C/6XQMVNUNdMZtIFF89XnpPr7Qd2Vk=;
        fh=cx46FAvR5bfq6IwkRdPuI4U3L8bSpvGepBTMCV/F7cA=;
        b=eeNhW+AzyFKYrmvp0JH3cumYoF5wjHt6uT9mM/qSBOE45UsiPcYe1hIkV/8hv903Dn
         vi+HbQzuQAwGpd1wGItIXosLeYbjsJebxpX97BuFrXrYt7f17r0EqVj9paSyORqSCYni
         L2ZtrBmUD7+kfoYUxO/VmZhTljZFXx1k+1EvqKFS70WUpUQkMomw2PkT/qj2S5w59pQ1
         7HP+oR+QmMOdwGZAfZEHeEmMzMtlP58rqtg9LcMVOfcHMZG18LUu0Q7fgR89Gh1JBDo0
         aAlZZKb1JjysunGHTH6rUo11UHGnRC0Qbj1zyrhlYE6pKlpex7pxNYrdpvq5GD8fsQH8
         deNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780325031; x=1780929831; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FaJ3M/Cax1Tl8C/6XQMVNUNdMZtIFF89XnpPr7Qd2Vk=;
        b=Nd0yk7CXMkSnlXp99V5xmUSkaCfg37tSayX45ze7MuDWiBsLVzshKoH2fJ/GV59540
         ZY3BORToO9cgRUSbqtyMcmd5c79G0X4RME8YnHQz52YF5QxmRtfeekfp8Wq07u3unUHn
         Ec0FN/+Z2uN1tlpiKJweo0xzpLTZV9ZEwiDJmCCLg//4GLWuXB4mCylydEBUKLx/eC+Q
         ejfE41y5oPFa/QPTTEn6A9nn6uafZAB8yyUC8hi4EFEG2vewQmWI4FZcWpRrYNYmjAg+
         ipUvfJVexkdC234JQfKrb6TwxyV8+zlx8O9m325y4loXUb5i1xjjtOJrnl2p+80NHVph
         yKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780325031; x=1780929831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaJ3M/Cax1Tl8C/6XQMVNUNdMZtIFF89XnpPr7Qd2Vk=;
        b=KHDb+CgWW0rR6Z0y1C3UisIR9NIaUZxCVjHnVQyrQugw/sBN/0JFmuZZQyD2ke7Dnt
         7sEQVqo3ePvCEqkM0li61fm8wwq0HlJ68utL1lhFKgbvfhU6KgdhnVCqrxu1UACKdjGn
         CwB9kzWPbU6Z3QyhCugOZVrdL06oKfL2+gAkfwxLBuBYU710RJhPklE6UFl4BcYsYfSV
         MDfDDtjgH0kKF5en00Pyqg7Suk3vEFRI6/THg+mhzdKTAKFsChK0m/drJ+veyeU5hIJB
         QI0rVpKbUPYn6MeAg8mdoWXDXMJVKxFiVXWFqdrxh/bcmztRIzyB1jLght2DjQprhiQa
         /Xhg==
X-Forwarded-Encrypted: i=1; AFNElJ/Bq5uerNvhyirgybmnMqCEZ7QDg70StzkFQXbnT0XdlZZvSfl0HR2AT0YdBd8tsRk3cs8sHIdyTKHD@vger.kernel.org
X-Gm-Message-State: AOJu0YxCILrAngJnaKe+EjC5pOo9MuwyuGaC7EPE1Pr1h7gsz4MapbJt
	kIQdTIk5tUJVvw0Om063GNMrcHVpg+p6sCdoXYThfALCuUAIL6L6ZU9esi7dXXLWM7jOo+1DcOe
	knBVdDJ+utJL+h83oATO+aTNPo9ApyrQ=
X-Gm-Gg: Acq92OFTvh6y9NGNJy1bcsxQJWfzwAPzUiyej7Zhk3UoTfHd+RIk/ETQJ1ITnaiis4D
	hGKDRlUMn3KPhPUBPJ6/xF31joiCZHiW7U7wxbkaK1x+GqnoEaZfvuWhntn8iRGnPoiIPWt0cZz
	bFLbkY4rM4V5qk4/5muoaCZiPe/1zBO07NVUatyFeC5hvnjLEGz9YMdN1LvVjfhEvtk3PlM7atR
	LeeIQOuV441VX4XblAn517RTbs2Oy9/fd674fvkLpFsqbB6Tjzskaq7BadKJFqlW7D9cZZ/gMLu
	pE0cWlfzWZPMAxl8J6pBTNBgGZ43+6sJ379pnJNNHIOZuppIUuv4oUj/6e//atg1onlf/oUgxPb
	hVtiuje6/fM4+l+Od6rBAiv6h+NO4VnNaJcrTeymVyCbNf3UhoKxQ4NyZS3IzQG2VLH0TFARXuN
	IKYSe6b1sBmbqcd7R6
X-Received: by 2002:a05:600c:c3ce:20b0:48f:e230:2a21 with SMTP id
 5b1f17b1804b1-490a2975173mr158041835e9.32.1780325030803; Mon, 01 Jun 2026
 07:43:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530-veml3328-v3-0-dd562eaee8d9@gmail.com>
 <20260530-veml3328-v3-2-dd562eaee8d9@gmail.com> <20260531101940.037d1d7a@jic23-huawei>
 <CALoEA-yEA5KcvXqZCCg76qFAgyNq8BQ5+gop442mju-9PiKaxg@mail.gmail.com> <20260601101726.203f56cd@jic23-huawei>
In-Reply-To: <20260601101726.203f56cd@jic23-huawei>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 1 Jun 2026 16:43:39 +0200
X-Gm-Features: AVHnY4Jx9jpFwIQ3QFkofnO6yXaTKK95j63cGKSeFtD73y_KSpdW0rK083otLxo
Message-ID: <CALoEA-w8zX+bzpEfvGoafDaOr6Kd-USgsyZ6SRpV08Yw6MaVrg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] iio: light: veml3328: add support for new device
To: Jonathan Cameron <jic23@kernel.org>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rishi Gupta <gupt21@gmail.com>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Jun 2026 at 11:17, Jonathan Cameron <jic23@kernel.org> wrote:
>
> If you have time to figure out the path that causes that, it would be excellent
> to have it recorded. I spent a few minutes the other day on this and couldn't
> find it.  Maybe ask AI to figure it out :)

Maybe, just maybe if I'm not lazy enough to do it :)

-- 
Kind regards

CJD
