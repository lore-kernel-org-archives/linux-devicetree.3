Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D003AC0F3
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 05:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789278405; cv=none; b=m9AlclGSF2KKp3qGOLKQONDhoctjSAGrxmQZ0WW3EDU03xZvI4NHIh9DE7su74aG2Pd9TEPHfY0xSg58gtKAVgLZbGa/4WWHrw+hQUQ0EODSx44sMgIVihXIZlY8dFfOy/3gib+a82o8cWcoYfokFNS5IGnC51igYqA+ONJjB8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789278405; c=relaxed/simple;
	bh=go6oz8+xCXd4w3muWW/18hv9nuLa13rdSkVXoFj2oUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cW13g+Z4siG30Twh/90pZtYUX0mjB7tIjTRdjlxei+iLDdU3l7aWmQoB62f5heOGr4gZY7hKhXvoXVIw4LJGUj4Kj12NaR77oMJxp4h6GZpfcD2kcT09QgJXiEhEHckEWLY4ht+IzUHw0LcmhgOgQmiDWB4E7JvrnZL6rL+vYGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asTRFj6d; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asTRFj6d"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-86a25369f16so1707138b3a.3
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 22:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789278401; x=1789883201; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VaHndl2K0pFULmTR4xlAbGHwp91x25cpvpgq3imyoWI=;
        b=asTRFj6dUc6F8B8mUOx7OACjuszcaPYx7VvKy8TaY0H7sWrV7aoWOyMJyExukvwVDr
         NiATn3aEew5BrbbyASHdG3YjKY1SHDcKq13/gwAm90+5hMV2FrKblSwglQWm+yAsFIBv
         dbLqTdCUStpmCLiBAKO71TG6DlM+A9DoGPXpw+D+ljxDvfGVlcapV12ZmVQKyWL5lZ1Y
         izdi8/PNeT/j9799HlfwVFi3nFAegly78JnJyanLAI4VRqQROtN9IwNnWnCMKaSt16Te
         j+3KC/ef0aSCt0nBXblZv/7kMmA+jtOON+wQJqm2rriZPFD5Jx8qbBeBJgpjxt7zw+kZ
         H97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789278401; x=1789883201;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VaHndl2K0pFULmTR4xlAbGHwp91x25cpvpgq3imyoWI=;
        b=f9Q1yYVaN+M+NEhClSyboruSEccVJyh6INqChR/zaaJzJz6riYxDi+xaFfEb77Q2zl
         j7I0207Y3ixdfVEeDeuJMTQec4TmFxpPg1ZAX7pm0JaKrtEBDh46W/Y4uIaP7sFuidJM
         KqGpj5ERK7QHtJbti4Y/9EESj8VyFyGskhAURxzwuLM1iwjN3mJFT0QcWGX/F7pvHaR3
         2NFS2jiNFFWhPNri+2Th4zO0gxblI46znwDU8xDdDUdXfbIGfjepVhZUqGXtcOnRelBv
         YtmuJnTk+U4DfYYeEqSZfUoFTadFa7xyDYLytNhSUo+tx76MxHgQcjMA82wmabwZjBT8
         9NDg==
X-Forwarded-Encrypted: i=1; AKwUvBycfG/g0yGmmeXOSYqx0P7RR0QLxc2sgx0memH5jU9w75tVdDQLU0NLxo9tgCyBAQowOBOKqy6Vfatv@vger.kernel.org
X-Gm-Message-State: AFuF++lxrXVRca3FjdVli262qqwDy+ZByxhGS7cb8bBmkTDrqDgkOD2e
	Yb9MU3k9TL5IN9+hF6TBstZq0TINO8OL+K91dIJTqO6Kuz1ObIR2io6H
X-Gm-Gg: AYBFou34GDmxRropVgr72FGkj0+ziLrQl6OEgnFRHpsLtXE/ly3NIoTWTleEsLFiRc8
	38/Ftd5TkKQbjWeI++VgNZuaX5078si1/B0TTJt+HKM00nzqwwH66RxC7ROLwcR+ycxrFhAJ+vj
	3AloPCf73IjvKHGzu1SEs+Ms6ESNH9FKEGgl0rwRanr3KP8XmmAXMebPg2LwE6k/8v6HGAfUU9f
	kV1LfWGl8W/Td3LbAT6p81/a64TCE/IDd4zSeGxk2ZwKjvzw7vnr6D2qvlmEmw0C+R3nTRTSvuV
	xkNDCrJuOzZ4O9S9dMAeXCwoneNmN6GTyroehyXhAEQBp4B/wvz1HFWbTpAZ4dxNsiWy94xSOvr
	w+ZEmabLXUtSPwWMgo/XJvbJg4EX0BMvuKZS/lH5JIIxnyvKFTIJk9P/7CRLKsJ/dGGQj767A1W
	LHnO4LlRGK5ByIh76bmrkK4nDEUizRYXcrNGLVhS2ptqngGQLGIKVLbBuWr9kYK5+jwoD9jMWk5
	djVwRDXke6yhUdf3TEzehVoRqU1zTdSAmncvLuz
X-Received: by 2002:a05:6a21:3a83:b0:3cd:7ba2:e669 with SMTP id adf61e73a8af0-3daed4bba12mr23004520637.10.1789278401414;
        Sat, 12 Sep 2026 22:46:41 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:318c:d45a:8797:2b03])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e4fb3esm17772221eec.7.2026.09.12.22.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 22:46:40 -0700 (PDT)
Date: Sat, 12 Sep 2026 22:46:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?utf-8?B?yJh0ZWZhbiBHaGXIm3U=?= <stefanghetu9@gmail.com>
Cc: Mika =?utf-8?B?UGVudHRpbMOk?= <mpenttil@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: touchscreen: convert sis_i2c to DT
 schema
Message-ID: <aqY4tgXZzfiHczw6@google.com>
References: <20260821131039.37525-1-stefanghetu9@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260821131039.37525-1-stefanghetu9@gmail.com>

On Fri, Aug 21, 2026 at 04:10:39PM +0300, Ștefan Ghețu wrote:
> Convert the SiS 9200 family I2C touchscreen binding from free-form
> text to DT schema format.
> 
> While at it, fix the example which referenced a non-existent
> "irq-gpios" property; the driver looks up "attn" via
> devm_gpiod_get_optional(), so the correct property is "attn-gpios".
> 
> Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>

Applied, thank you.

-- 
Dmitry
