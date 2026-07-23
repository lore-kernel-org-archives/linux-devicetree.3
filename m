Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9805838422D
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 17:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828751; cv=none; b=j3GVavAtJGh3iGtZBljzVb6bttE0qvK1ea6v9eo391azmHUrAlBa8eIWkn4VFYuwwTL3NvZHlXZDN3f3tR7hqs2De6iReTbvZ/+6t5PD1Fv06QgPdeIfzvpGlYq6X1Nw1JLktTDTr8LUcokVZEwV+gk8I/6eE06yf63kwemBrLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828751; c=relaxed/simple;
	bh=KZY5Per6gqC//uqwYOs8Lx6+Xn/30uRA+CAzdNfsmCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JiYcDFO2X4Lbo1+iJoRC2oVq0q3Pt/f7TXDHvrV0XlsR6H3NtsvKkuEqfzvmtgS92/4gTibo6O37cpH+xYuVkBMJ0Y/TblBtcBvBbpGxpLXrei/smrrtGxd3i6FzVigCShBA1o5yWhR+aeZ/5neglWq4LtgwY4hFQh7vxE6gCC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pML5cErP; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pML5cErP"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cb5a6aa8760so633671a12.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784828747; x=1785433547; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2O4xFuAHBp+wc0jU7apiTfSbaN5z+iCv3LYdHU3FUCI=;
        b=pML5cErPOAAtVMKfuUfPf8PEO/flUn9Y51MYDcpFUFYnvZlsUVemqVvoVTPuJ0htZt
         uoKAWgDbOry4V/7Y6iXSRRa6ASi0r7KH/yAYiK4pFMy5vUE26Pb2XnhDQzql/cxfm4b6
         yn81KjB3h5Yyu2Tz9bjiE1vDeWxYb/tm270TNG3RYrMgQF/nBMPKlW6NSXsubmM00hUR
         UhxxRxplljfmm7c9foraJEN9RH2Tg1khZGnxw8V7Wofv4Ws5N5q8rzoIl1BjddqA9Gan
         inmwP8GVqRFiCFjW3xWHXrHKimVaodgYKhqiurqX6OfBg7QR8G2zNo2iiczTaluHGl+U
         DrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784828747; x=1785433547;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2O4xFuAHBp+wc0jU7apiTfSbaN5z+iCv3LYdHU3FUCI=;
        b=R0hS7jgSJ7WUAHmAF1KKl+5OzEEhTNjC8vG78MDFQS9sqPQKGnhfDLTSmOq44QBAIh
         cFabtYntzhMkjCF5B40pydiHccpKZKnyxh/eVZDVekf65tluZmKI+Oh7un+w8MbKIG/q
         SRTz70X9ShJndY9zzYYd3XvGkmGWW34vzRf4jbrXb6bE/p3uTbFUuUsssgqRQ08P0Zq5
         B9gd8dgZ9PTMqJgSIw2oFRT41JJiDGmSchgRfHcyO3n/MGcsXRTtAndiJh1lvjleoeqL
         Cwwa0zV79NoWR07q7/b/sTT0GAEeezKIUdg5WR/eCtjfw79Du1XpeRPaJFa+t/cq/T3U
         9Dtw==
X-Forwarded-Encrypted: i=1; AHgh+RrAm2xTwhLHYdUl/7/Tx6aj7ECGVU+MDfc9ekBnahvLGrOdVuQVpnCSOXzdFkOIkOFuuCVJWtziI8l9@vger.kernel.org
X-Gm-Message-State: AOJu0YzV4/JKum72gUHvt3IcWsVMlNqIr+yrqox0kdaWfTtzEfXUaQ9x
	47PGc5HmiKp9tEtpLkoUGXhHVm7azD8rMgx3NhiWoIhuzUl/Ubos2d5P
X-Gm-Gg: AR+sD10mUNDWmRLLc+Lrndj77d7LTC/SHo3mZ6klduEJKiltdgbvg83bgomHx1lFwpO
	WVKwKLOQcKcEYR+c122OSstqLwrQgsRR+77ddowxpgkr4s7U+6+N5kYwck5a9NN/sTuEqZf/hKa
	cwfh1dFKR7jp/tDSYHENJH0ccbHXaCVhcmml+IPkmtgCN7959UBIuBfKBxQl3infXQrhD16kZe9
	XwE6tvQl3lJOt+WqrYjd7OO/AWuPFOEF2moG6FCnIwc6c5rAoHkg1Tp4iVvgQm/m2hmwj2yyZ6Q
	9p4n+pAOdsm7V1v1lfuEl+sPV8GOy8EBv/bI9lp+0KKCyS9Kp0y5qDWpwN8HjrtCe0YMhrGkHZf
	MelaxQGQg2pR6CjprPpbTJbqdsIzcR1ivG7G1fecV7pA/rTJTumoFBporBnalLwUWoSCsMGzuIK
	KUxhcJWV6yF4aWd6Kp0q/Rf4JIRKbmNwvGJSK03INAWw==
X-Received: by 2002:a05:6a20:e292:b0:3c3:7fff:ba72 with SMTP id adf61e73a8af0-3c44b2b9706mr4676613637.70.1784828747494;
        Thu, 23 Jul 2026 10:45:47 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:f5d:dfe5:9bb9:71ad])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c7ff4sm23572393eec.27.2026.07.23.10.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:45:46 -0700 (PDT)
Date: Thu, 23 Jul 2026 10:45:43 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Alexandre Hamamdjian <azkali.limited@gmail.com>, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH 1/4] Input: edt-ft5x06 - ignore contacts with an
 out-of-range slot id
Message-ID: <amJSt_g5We0R-eJo@google.com>
References: <20260723-b4-ft5426-v1-0-d4b4e32be042@gmail.com>
 <20260723-b4-ft5426-v1-1-d4b4e32be042@gmail.com>
 <20260723114100.D6D641F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723114100.D6D641F000E9@smtp.kernel.org>

On Thu, Jul 23, 2026 at 11:40:59AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Unbalanced `disable_irq()` calls when suspending and resuming in factory mode lead to a permanently disabled touchscreen.

This is obviously not caused by your series but might be real, need to
check...

> - [High] Stack-allocated buffers are passed to `regmap_bulk_read()` and `i2c_transfer()`, which can cause memory corruption or panics if the underlying I2C host controller driver uses DMA.

Sashiko hallucinates here. I added I2C prompt to teach it that I2C is
generally safe wrt on-stack buffers, but I am not sure if it will trace
it to regmap.

Thanks.

-- 
Dmitry
