Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626839;
	b=A5Rn+pk5y7yw8vUc/t53wDpI4rNjwFcbbOIJeFfxvxUVVw31a6wc3LKU1HlQBMrHSkAN
	 UV6+huD5cCEUNBDT5S1j8ufPwrQfNo1HRdNq2+88FJJHa4Pqx87epI64P4OZZOIII2PO1
	 vg1DvrqT4rKJysQhzPPiPpb8PzL7QnT0EegQBWwgKYR6Yzyn8VgV0pYfSo3QYiaW0Zgi5
	 2i2n8eOFmMLLTb9VboOejQS9h+1Zc2ijDwM/EEnSg4uCF5WBfyU01oeWoHFjOzT5dBrNP
	 kCppfa6scB4W+eT+BYqifUptJaNx2dgKwYrANg3QYg3aynhS5jS4Wp7PElFq49LzcqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626839;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=mvU1kpigz/fcmORnKiiTtGBCSmbqbtXn9lCfHY9BiQA=;
	b=vjzUk+RijwTb4eMsHDQ3szgTgURGMuaHzoVgm/EiNq+8a2BCIElWrHidjK2/wnd9oHen
	 NnQjkBZwGCI5LBtSmvKBuAeMp+P67YpD7IS2/654Hb78n3LI+6E76QBbM36Y5rBzinvcW
	 BczoR+6KKFx0SJy0H199GFiLO0U1/EQfTGwkZnywcpy5p1sI1a485fJStVjDLJgrNt8aW
	 14PaFq2RH8vK6l11Iq3Frz07l6QH/mBqjnrkmhzDBq4CrczUYKxiH2rHeONx4sS+hkxWq
	 fRL0ASddw+vT0Q8RgJnLDZeYa/Gqtln1ucSCjTZrrO9blCu5dSKJSIoAoB6N/vM077w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dxT4BuY5;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1FE606A883
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA1FE606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dxT4BuY5
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b09c07b3d2so985045a91.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:27:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626835; x=1795231635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvU1kpigz/fcmORnKiiTtGBCSmbqbtXn9lCfHY9BiQA=;
        b=SzM5nefL7t3eZgL4KJ/aS+zcRdKOE5FQrPT20ZdyBOojvrewTl/PepEk8HbrELAUe0
         5EDkI4aoig3l8W9ZD2Odo/VYW3MJCU6a3AqmJfoviYPHDM0n9GaCRv6WbPvQuv0aPNF6
         bzicfw4HMWq41cw8uhoqSgPLXRERSj00n5h/3b8pTlV8Zf2N5f7QrD1UcNcMGztbS9QH
         KZeMXAvzZuwtTNqOgKdSxI70yix/T9XCh9YFe/glP6x5lufngdEdfSu2ZnyUOidaP4dk
         6i+gfuwf3oGKO7cnXkxH8ZrdLUVAgeGWHb641MpDE64BWjNgMurTUHq963S52p74iJJG
         Z9pA==
X-Forwarded-Encrypted: i=1; AL+hErEOWOmp8z8s/Xh2o9intRvcsECCW2vAP5AILRguCe7Tp/fhqDOP66/ftfKfkGwYaqjCvYuuHYKAeXPC@vger.kernel.org
X-Gm-Message-State: APuU4Z82fQRjKh1eiio/pyRNlurTKc9H7bDwr3Tz81xZExigmAWNE0Tt
	9fa/TPeP450xzPtICup4G12quz0na8cENM9D2QCG5Vx2Q+P8lhmcyBBLM201+OiskZuOzCoBxSb
	jgZY/HMP+IZLAm3g0UbBz0isSKpGpskPqSvKpZujHjIRKlMOd+nNIGd8EbECoEk/RDj7qR/WUPt
	z+ccy5If9MF8AZyJCa23+4E4R8RgU77UwWevsqId1x/6Cw3lJeRo9DCJOsTefEuZgxGOEWZiwko
	RuZXTTSxB1EzPmpOwWz5w==
X-Gm-Gg: AYBFou3Q2/Y9DgCDRkLdB/v5gnwthQ05M5ITqSV8TkVYS7iplHxtTiDfxNYPIsYT8Y5
	+rpJFZ8mCP7uAoHter8bZYfoLAbS2oEwuLv+sYE4OvippZo0YO/364z93dnnUSNNp0hsOaY36FZ
	fV1/QlfwVy9T39HxVdaFC4cp6mhnKPynPFeGvrlt/pMsFfksdwHGOUGYDpGpi3kvHOflxC1XDxt
	zRdRDPSaclZlzxAcw7Yv+a8CtcD3fBmE2yvUur2mOA0lFOOVUuaSCAfMsO6Dk3MJy5CGRajocXq
	7Is0J1IHhbAim0P0tFyscB7wBHXoOiSkya0+gaikJp9QiZSnJwc28EpVx5ONcjW3d8U0+9zyYY+
	wM9p5TFsdjDfRVS64uRjIhmBsjo0MqnwIDZFlR0vHPydLZRxXRNnc/XL61JjkAfTe
X-Received: by 2002:a17:90b:288a:b0:3ab:9c73:12e with SMTP id 98e67ed59e1d1-3b1b0815b34mr3575254a91.6.1794626835064;
        Fri, 13 Nov 2026 19:27:15 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3a17086sm3081325a91.3.2026.11.13.19.27.14
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:27:15 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f26e6abe9so1975046eec.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626833; x=1795231633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvU1kpigz/fcmORnKiiTtGBCSmbqbtXn9lCfHY9BiQA=;
        b=dxT4BuY5lYOccoIhz9Pl/6RXdduJznH54HA3Pn8yzoWvxTVJWyds6vz0tjAX0ZCkEk
         0GzXlxC5PRPkBsM03oxBYMoqA6+aN5DwpNTriJVdBLz8bUJbywgZxKzLk89+sg6w96Jp
         RAg5d3rD+U/c7Ut//HzEFFujr6tF6GhY8HCPM=
X-Forwarded-Encrypted: i=1; AL+hErFE7JN0iAoY6WnNB5WVeDVizQs5FNRzWEibzyZXMS81KPnFke+f4v1Au1wV3364Ln1wLspQnTq80IFn@vger.kernel.org
X-Received: by 2002:a05:7300:c88:b0:36d:7f5f:7e97 with SMTP id 5a478bee46e88-37967dd734emr5998520eec.40.1794626833010;
        Fri, 13 Nov 2026 19:27:13 -0800 (PST)
X-Received: by 2002:a05:7300:c88:b0:36d:7f5f:7e97 with SMTP id 5a478bee46e88-37967dd734emr5998462eec.40.1794626832269;
        Fri, 13 Nov 2026 19:27:12 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm14228212eec.27.2026.11.13.19.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:27:11 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/5] firmware: raspberrypi: reorder rpi_firmware_property_tag enum
Date: Fri, 13 Nov 2026 19:27:10 -0800
Message-ID: <20261114032710.874144-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110-rpi-tryboot-v6-1-56f680ef4734@linutronix.de>
References: <20261110-rpi-tryboot-v6-0-56f680ef4734@linutronix.de> <20261110-rpi-tryboot-v6-1-56f680ef4734@linutronix.de>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Florian Fainelli <f.fainelli@gmail.com>

On Tue, 10 Nov 2026 14:00:11 +0100, Gregor Herburger <gregor.herburger@linutronix.de> wrote:
> The enum was once ordered by tag values. The later added tags were added
> in a different order. Reorder the tags again.
> 
> No functional change intended.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
