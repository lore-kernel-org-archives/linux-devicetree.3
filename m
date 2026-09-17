Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ED04432E4
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 06:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789627404; cv=pass; b=mQB1oB+JQF5ecBLrPJztU1YbYPTeddvM8+RD1Uk7czaQc0ykgAneVpH6S2ZGOxf/KLlD8Qm5eYmhueoQuUD3ach8GBjMKX5AzB4NbrtTeOs+R6UTEyDLVnpYSMy2Tc0aJ3BxMQwZ8w85WakC2N22aQpqfsmU3QTORzpWsxb1qlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789627404; c=relaxed/simple;
	bh=iF9IC0Ww9P1PQeAOVHIvIeKZQhHeM7arIW5mQv7Oi6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QYimxxWg1u3lIjI9LinwG5cRd9KdFkE8ruCTWConf0BcfXyC/0X+xQL+JDDDlfH3TXKiCv080LUYFswYF7dQujPiYgP+hq01VXk7dLB/Petiu7m1iOJvewoLTPN72XQG+ZPNR8ROWgEZuKUZYQ16uwAtoahMwWBUFu1m8rXCYgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCrgmO7O; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCrgmO7O"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb767d286so3904601cf.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 23:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789627398; cv=none;
        d=google.com; s=arc-20260327;
        b=ggcaVAIiTX/L9yOkD1Y4NMK++EaixLzbRiCxYkSLKtUciU1ESdVFdhqRxT8rQ3JUMo
         FAHFhEJT0V0tU4yn6Dii8295sKx7nm97foJVmczgy1y5ZhUv6pTFwyAqUZNRwHKHr69f
         ir8SmZ/k/98en9/OCEQjqC7m6dVt3T8wN8zHq5aSs+4PxaPUR4Og0PMjM5CKXY7hrv4r
         nUhy3RE1mo0ZxbN6Zgrv6AIGuq4yz+HYONlJwq/n2CW9MRIH2PCFUc00ZMJpF4LklhDy
         X8Tgj89toKgL2l1zJFyod+ipv11Dpbp7mSzwE97olkkMrHQA3IahU1zUaRIRc2Wk610o
         uSeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iF9IC0Ww9P1PQeAOVHIvIeKZQhHeM7arIW5mQv7Oi6E=;
        fh=sL7RRuGQoX3eEN1/2+3vBOllZk6fKB9TrONamy+kLt8=;
        b=sLepR1eOOuT1gnBfNMCjUsOsDM2uCql5PzOwCAfT+gT9KT1Yd7zoRjMnncERXauaxv
         RYpOTIyjXl2eBb/3OA5CTL977z0BdNcdi6fvn+kzY6jeyze4p8lEcyfrN5rb8r80javZ
         c0+Mik5+nAFoA88bxbAIoU/5EMK6CIDQnb7zAS43dp0UGF+IoaCEXWLsFz3mjg7gW+MQ
         kV583jOTPCEHLRWAwWV0+a/O+KgSdd2e+uAehM/9NFMirYbAYuahogh5mdewPfZ7GK8O
         ar4cjFTfhkxjkVyILDry79IIQ/g87xzqKc2cBOrT0r/j1B9d0CAdWvgT7KXWa+aK3iJJ
         WoYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789627398; x=1790232198; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iF9IC0Ww9P1PQeAOVHIvIeKZQhHeM7arIW5mQv7Oi6E=;
        b=iCrgmO7OPliEQzqBbml3sQiFH/C+xCYALws4iKaOXNhOtOr/zh3gi0W1CO4QxiANez
         D3wO3I8MigUbUwtp7E9unoRqQbF/9k6bmm0g2hNfwma1ZvLF6tvrqgX7fbbqDnaAVOMl
         x9EOnUTH/xmnfzTD4TOhQHVBtBSRgDCNwC1tNMRbe0dGe6SvBRujz3m98w9EKvlvvTMl
         b5yjOuaEF/Hkc1JCrUXfpucbppO/KXqnme2jSBORk4kNnrLc3icdpdo2p99w5OVwXkSN
         KdKdeC9UZn9o6zi52ADGdw6XaalLYRuYYEkGjrub8GZkYOJpXsdRAbQX2iCWqk35Xlwy
         s1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789627398; x=1790232198;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iF9IC0Ww9P1PQeAOVHIvIeKZQhHeM7arIW5mQv7Oi6E=;
        b=Ra8Meb9OmYXHngaCveLYc/qDbWfEGepZdwGoUHJdf07FdS4Zqvs5ELHUw+KhHo+Umt
         UC8TqYAr7sfJSUXzFiJG63z9YHhdxOC/ggjiSTXhDpU68cd4pgbk2/nJikZhcNGa6SBC
         NQBshMKZR/flmVotwTc1HE6XUr4QJKf/wOzeSiOzynKmrWIakxNFkZJkX6gzcdXDcq9N
         JnLmaAhOYYnyTGOiSGIZ+dpsNCIX8SS07P1FjwfwasNy3UKWtBOwrfVUSeXALA96qp0Y
         /nJCuA4cFC9FRGwuPKmkyDh2j9iYCNTTZuiUsMk1xgO5b1qhyN63pRSbNYTiNpBP7JWw
         sw+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzzPmrva2XgoO30ZPLIkowjj9GGPmAI6XidLi1f528AGrQITr8zKlKhjOVp9ZHbF/CMW+kY5eT44aqb@vger.kernel.org
X-Gm-Message-State: AFuF++kqJMovJ3fu1ZIRY+r0Y1tJOKBSEFDas+uFhPilSh0Ct9Tdtpth
	NFUIkXRInWzrdmpjFAuTWyyAIxkrtJ8ygk73HBbgT3FCCMu4vY/PxwOaP8vT6kC3HYFmY2MPUSj
	s3RtSkue4uLiFBE28QhXh6V/i9uueOVE=
X-Gm-Gg: AYBFou2qaQBRBAT02svppyznHjnSAHBamFdwlEx8xVsu1HR9lk9aHQBhGB+qzhiZa+Z
	TtWUjOoiX/cPLV2WWAAC8tT1Kofmc8/K5qkKyWWsXufPgFSemPQ5411hmuFJE4D3S1ovknRB8CU
	1jAEhgIAs7Rp6lMyZHmxIekvkkxwNvzTUiQGtPvDBGZ+jmtEhGAG7/RGBB+aBQ3+zcSX6aKU1P6
	Zq8ks5g8TLphL2mZMNeoFLW9Gh5xNvDH/7dIKBUi1cHXwzRsnKVBgxkfskAAUPZ3poRkAXfCK1o
	WzYpmvLR/E8ysD4LmSxzHjiMjUGRHCW/LSP55kS2XPIA2welVsphj9do
X-Received: by 2002:a05:622a:58cc:b0:530:feae:130a with SMTP id
 d75a77b69052e-5327ed75c74mr102732471cf.11.1789627398229; Wed, 16 Sep 2026
 23:43:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917060948.14700-1-palaomer100@gmail.com> <d0ba41a2-6d4b-4bba-b147-d287bcd9b179@kernel.org>
In-Reply-To: <d0ba41a2-6d4b-4bba-b147-d287bcd9b179@kernel.org>
From: =?UTF-8?Q?=C3=96mer_PALA?= <palaomer100@gmail.com>
Date: Thu, 17 Sep 2026 09:42:56 +0300
X-Gm-Features: AcwNN1W5u0fdpGa4ENT0dZ7irXfB5ehQ6MdwksADrwwfNdm6bS_Me35uFnyAKQw
Message-ID: <CAKhZXnp_oYvhmcjv0piYC5MpmH2Lqsy_Z3-ofzKPX_iRxnP3EA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: misc: add xlnx,axi-fifo-mm-s
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Same day? Are you coordinating this anyhow?
> https://lore.kernel.org/all/20260916201253.483877-1-matyasdaniel005@gmail.com/
>
> Anyway, same answer.
>
> Best regards,
> Krzysztof

Oh, i didn't look up archives.

Sorry for wasting your time.

You can drop my patch.

Best Regards
Omer PALA
