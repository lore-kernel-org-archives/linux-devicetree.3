Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E527F3C6A51
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347084; cv=pass; b=qVcvOkOe5W1MQ1y9Rdp/vbPx+655cqDYvXsYPnYCn928UoL3VZ/XLJkDsIREokav4IZGn3zGN5KJDQieAuTbU05O4gpQzeUVy0wkMJJwdyUqsZfMYLyWM4+SZWUr+obFqzlw/6ysP2mZZYwCZV3gZc2scrAviZtuTj4KHzMKDXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347084; c=relaxed/simple;
	bh=mTVpBdjjI9oKXuDpma/uOA+GO9QV+eMtEK8P/UbJDZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P1GusatU0Opkg7zwVqhWqGopbI9wVa5YQ8O9J0MhzBihlTsJ/xevfJzK0kNRLM2q/QaXwLBB7uUz8B2aF8c+k02+NFQbWLJyIR0kDCq9ul0as550oQIGShCXUX8piEbl+HKdq0GG/FuzUmkbTtpTWltc5JO6L9J9K4ITs/UeJ9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=dvILqsjE; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="dvILqsjE"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50d58c513dbso57330471cf.2
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 06:44:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776347078; cv=none;
        d=google.com; s=arc-20240605;
        b=TrnA6pvyGN+S+sx5r/DJ25a3TBFD9mMj019pT8eMvhvvEitQmM4LR5ZPu+TK7mnfOw
         F1KDJqcXZ2vep4gSGlnTYufgXn3ro+wcZTFsIEey7vkX3FQ3D/t3X7yXo9ho3VfVOAZ1
         HROTmbYgmd655vaabGKZDE3JhcdpZvMI8dC+9VemOAadk1e+MpWK7AmxgQFGtkGd3jo+
         EOb526k1ZsuWpSo0YDmPvGYb55kUAaKuHcO0lrmYD8xnBNb3riVwa384FsvkaIBeQXuT
         ozTkTmiM9mlGEDUqPBB8VPDoa1TxvPsb/RWckcSypdWelCdL8hthjtp9GAFQrEQWm7xF
         9urg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vJytEO4edAXWK8urZx0Wgyg6Umc0OrtkWTX64gcjRrI=;
        fh=baWx+SdHx18ZbJyX9VZQqoVU9eL1MbpvXykI35TCVgI=;
        b=DTd4KR6CFsBZLc6oaycv8XlNmAPhztv65PSsu5Cp62A3bxAajD+pY4hfkHwPoHgpeE
         YvGQ/l5SQ744acabKjidMoJUEbi18p5+Dh44CDQGlFduvgTuOyTW1Z/KpFnwW4/koVuJ
         MK45+Ak/N32VK1ttaxyInjOjrCAkU3hMj9xKx1DALOUN8Aoq/A0OnFdFT8IIq68lS/AP
         UH2k416CDBoSNW1FP7nQRSdIgGZM1v5kMrw7D5fkTrKPSA3MgJ7zVx1V16KkOMuoAtRW
         FLybJN3mwmqG1VRn6WhKECz+foV9i05CTqs/s+0YMsmrt4a/tkN+J6+j/dgn+Qy5KBz4
         dj8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1776347078; x=1776951878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJytEO4edAXWK8urZx0Wgyg6Umc0OrtkWTX64gcjRrI=;
        b=dvILqsjEArZ6xXUf9nYlPSJ++t74PRSTEGhkELZj/hAPpLmm+he1LJGGmc1g6jnUO7
         FLP+kppvDjX59dgv+y8Y/tqp05UZuxCaa+7IPUQHhLwH9xdY0PmuStcYVkjsrVIhOJgm
         RpHJJ07mJFAB/rKshCNOe8rbDtXLImY7xVKtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347078; x=1776951878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vJytEO4edAXWK8urZx0Wgyg6Umc0OrtkWTX64gcjRrI=;
        b=dJl9uPG4pjxhb3PyXQcsFrzXS744k8e8rgSsDPG26A87Aq4TUk4ohP6INH0ugJd1ZN
         3sMJPQ3NnTwPUBmK/xJUoWZXAjzYuNGU7g3feaADv+RwhMfbuJ+vifgi0SUicbCoPHJQ
         oW0HRcAvNt2ltfMpwEi/T2AMQvOKo+06yFwKHmv312aD/y31xsOtXhONI3w5DQm08qiQ
         J7vdIeI+vjmEQ0Uq/X8zzO71agBPfjv18xnLArgiBCTGMV/x1JvUTcmLRiVUS4KqPTvS
         aYewKkuEMOLjjngImdnDAjO4af1TaJLup3e2TQ1xBfjDyCL4/vNe8R8QkISrzjCAFyKu
         NRug==
X-Forwarded-Encrypted: i=1; AFNElJ8K/ddh930JcUpGQH0TKHO2c30nNV88PyKtWJUmP2i7pOlTZPd3+lmDY5X5Rh7ZT8swvXvTEO3/AaAO@vger.kernel.org
X-Gm-Message-State: AOJu0YxxAxf+XJd9RmwmPipwV58pOG9utoFx66G11lFKIsk8ZmfcB8MB
	zcGywHOMmo0XF0y9nYgqUQCsATEgSRHKecnq3ahV0DEeN6J4q30JCfQAUQ7kGAp7iqmJxlhy4Bh
	wdqASLUOBV2MwnsbATka7b+0GGSkYkW2TJxqbMn9N7w==
X-Gm-Gg: AeBDietZSsah3c8GHQWrR04cnBHKtjC6tuZLVUSrhAMIoy2HJYI/54eKo97RZDCDJdb
	eUWz5shlz1+71OJnH+i3y4xAPxa5YabjkpMExEZYEo6TVBwCPwuaGsVrj+lnbkRR6qL5yzLaL6F
	66Zi2ENm8d3TInXV+ZmmWy6b6ypYbQmVplp2pNao6d+FuJKolmayihjnKwh6o5qcwMg3Jwvj8eu
	P0LoxRXrb3/7j5mU/zgnb2V3IgT5q5DKOecLBhwRTgBDvl5V7HF1jVqKmfpNyqbJusD/LSdQJNz
	r17ZV3P7cobLMNT511BlFl01GGFyKZKUNVVRKpSnA+SwrZgYHkD+d0vnslh4CuEXrbd/mEi2AoZ
	hOxc6O/4S+8z+kg9Nhddzw9TfECcIBV7UpO95eBBEWuYJ7g/RuLt3C6bGEQ==
X-Received: by 2002:a05:622a:244e:b0:50e:5db:ec5c with SMTP id
 d75a77b69052e-50e05dbf7f7mr213657131cf.52.1776347077910; Thu, 16 Apr 2026
 06:44:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318071808.817074-1-pavitrakumarm@vayavyalabs.com>
 <20260318071808.817074-3-pavitrakumarm@vayavyalabs.com> <acZL65nbtfMCPHhq@gondor.apana.org.au>
 <CALxtO0nFEG2Lm18Fnb=YVQfy4-Qjb5+WtOxsHNOwYTy2Kzyb4g@mail.gmail.com>
 <CALxtO0kj4JfL94qY-radGcLwMeTnq4NQF7vPqs6giuhBinvALw@mail.gmail.com> <ad4iJhEM-ZwgadBh@gondor.apana.org.au>
In-Reply-To: <ad4iJhEM-ZwgadBh@gondor.apana.org.au>
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Date: Thu, 16 Apr 2026 19:14:26 +0530
X-Gm-Features: AQROBzDWPjMyI40iDcqRckFcLA4-wp9ja-BQn6tZCrNmb6YScm7vzgbCOU3Mfcs
Message-ID: <CALxtO0kZX58X1Yk2cmGuBJa98Gcroy0b-wPxL=1h+ph5rT9ebQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/4] crypto: spacc - Add SPAcc ahash support
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	Ruud.Derwig@synopsys.com, manjunath.hadli@vayavyalabs.com, 
	adityak@vayavyalabs.com, navami.telsang@vayavyalabs.com, 
	bhoomikak@vayavyalabs.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herbert,
  I have pushed the V12 patchset as per your inputs. Dropped SM3 for
now, added other code improvements.

Warm regards,
PK


On Tue, Apr 14, 2026 at 4:47=E2=80=AFPM Herbert Xu <herbert@gondor.apana.or=
g.au> wrote:
>
> On Tue, Apr 14, 2026 at 03:58:16PM +0530, Pavitrakumar Managutte wrote:
> > Hi Herbert,
> >    If the above snip looks good, I can push that and some more code
> > clean-ups/improvements as part of V12 patchset. Do let me know.
> >
> > Below are the code fixes and improvements
> > 1. Multi-device safety handling - All packed up inside priv
> > 2. Minor code polishes
> > 3. memzero_explicit inside setkey, spacc_compute_xcbc_key etc.
> > 4. Algo registration clean-ups
>
> I would prefer if you left out sm3 for now.  If it really mattered
> someone would move it to lib/crypto.
>
> Thanks,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
>
