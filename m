Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D571143B48C
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 12:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787227793; cv=none; b=O/KIh6xnm7rRyBGPDvUOA1uSkfJFnyWe5pH7VC+XJaoMQZdQu4hlcw86tvGy6/On/gbBM8DzZLqJkoK4dApEq4xU6lllt9M6Uzw03zVt/47lKDt3cmNb/9ZlF7itCFV3683lNf17DoZIMg76i4JBB2BAUem/Bb1Q7VT+NT/U170=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787227793; c=relaxed/simple;
	bh=rPH+D37dk71VIiVD+rP2fjxEdLNBcwUs5rdaO7GgDm4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=RAnzz9Swkm24MpZdmpzOyRhuElE5JjTNYv1rfB7dX5KYcno6Ng2dmBJzI8FNmXXUSiScdX/M0oTsDzZmBunS2xCCTTzRjpSOVNkXKU5GwzJo4ywTBTYVrU2/nrYRO5RIlGycHECc8+afNKpuwpGRch4jBwyK9K2NNL8Ee8l1dag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=R0QCV44J; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="R0QCV44J"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d58efc7356so23149775ad.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 05:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1787227791; x=1787832591; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rPH+D37dk71VIiVD+rP2fjxEdLNBcwUs5rdaO7GgDm4=;
        b=R0QCV44Jksy87aGdj1RDnPp17lIHenJwxSRb1SGjAo32P7ZpXefXmXvrXYpH5n/g6O
         Hqvsj1JUOAiP6+29F2PBQmc4uJwS7EDF5ZtN7P0Pa4ghQYfYwa5DAsYcuGCIdS6GGOJM
         2iEQASYXB5RDVkOgfQwvCUWd/5UZ2GxreqaFpt1vGEFnuSmbzNJ/+mbGfr2cgdlDyHVE
         +3BLSahCNKE55um+/3MdnCe74bXfhmany3mFRMb+L6hvPy7IhOvWHuD8LXyekmrfAqbc
         ldVsWQe/d1giJNd5M8EeVOGhakX9Whokf1UabCxOVOkdMZAd2m/B/6+GhWz8qVtC+O5Y
         gC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787227791; x=1787832591;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rPH+D37dk71VIiVD+rP2fjxEdLNBcwUs5rdaO7GgDm4=;
        b=Px2k6cEbPMvH3ssPC8elEI+274jSJgb0iDIyodP8QgVkqStITSO5BqoVSNMJBvnI/7
         QhyDfF5v+chEozx27q9so2lyZDT7EGQAOkR1HhVU4T+7e8Y6a1ASwcgRLOFCWmwZG3F+
         hGWvldw9AK9s3/wHhdTASFQeRCnKVsyyW/fWwMErZCsMcmeshiUjLA+jMoRB3e3Z+WsP
         zMHMA7GeyjrtORsDYXluG4vlAUghwh+meClolCucpsoDNKJIQVqWu8wpLG1VqWZDRFI6
         qLrcGLbCnFYLYMr3GIpzgCKHsAzHK1d++nK5i+IDIZ3FXFyIZuCX2/cwSDQFDTsiasDz
         Sbmw==
X-Forwarded-Encrypted: i=1; AHgh+Rp6sOWJ0kxZTTduJEiXsi7h29Id64RubHSgRZmVzMw5zhSUF8oY9oTTM0oBw2Hy/YIQo1yr7f492m4Z@vger.kernel.org
X-Gm-Message-State: AFuF++mVYp6elgZjv3Lg2eLnHZoHd6JrL3YWhJmonwzs24Tkowpj7TRT
	mS5W4ktVnWVDHI1zh/5FFZZTX0/20j9VveDeWn9GFhKaSRPyA+2KMusbpV5G8Mo/f0E=
X-Gm-Gg: AR+sD12PTfAdWN2RfCkF5x+JSvoQWqDs3E5ZuYQ5kDQtkQg97s1LfSr92141RIWUtMZ
	WQC3N4KdDZmGjHY9nnJWC9oKiSWJOs1nbxiHJsfioyXhF6V3/WRT4kilM2ZX5YWEwILOO5Zk+0i
	plcaZDxP+Hq1PD+EkpIGKZsQEtQN2/IHXqu/+wl5NJA3uqwKGCame/w7ji9HP7CwKYD4CTO5PP9
	qw8MjqdKKR7Jgddc/zAVWL1rJF7nUGJDaxh7ZgpzRRShmCCPnXVE4bjVFPm/ifdgBqHyMFQs3tn
	y8YVc9DWVWC7625jBkkwirL/kgNvkcz2sizMj9zA1d/Iu5HmgyAZ+Jhn0XKVL3iBbo8SO4jWF96
	iix4QkVmMJ1gM3o2hwuTiBi2tDXSrEtO5a/UJo1DxkUr+7bapzJwPRyDSysjZSrlW2xxHHdVRfu
	Q7XrbfRF8sAiQVZjMYTBEZFB/Cqu384X+taFoPbdI1rTyGYCpTeRjnHauWpLZio7eJ5KK5smI=
X-Received: by 2002:a17:902:d2d0:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2d5fd5ff29cmr209183185ad.7.1787227791024;
        Thu, 20 Aug 2026 05:09:51 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d554411sm6054245ad.10.2026.08.20.05.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 05:09:49 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Aug 2026 05:09:48 -0700
Message-Id: <DKTRDJCXAQPT.1AST2BL5WGXAT@nexthop.ai>
Cc: "Rob Herring" <robh@kernel.org>, "Saravana Kannan"
 <saravanak@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/4] of: teach overlay code to keep /aliases in sync
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Herve Codina" <herve.codina@bootlin.com>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0
References: <20260721-nh-of-alias-overlay-v3-0-7001028fe2f5@nexthop.ai>
 <20260819134923.0a67838b@bootlin.com>
 <DKT4J20H0F84.17L06ULMZXN4A@nexthop.ai>
 <20260820081748.5fb0d97e@bootlin.com>
In-Reply-To: <20260820081748.5fb0d97e@bootlin.com>

On Wed Aug 19, 2026 at 11:17 PM PDT, Herve Codina wrote:
> Hi Abdurrahman,
>
> On Wed, 19 Aug 2026 11:15:35 -0700
> "Abdurrahman Hussain" <abdurrahman@nexthop.ai> wrote:
>
> ...
> =20
>> This series is narrowly about overlay-declared /aliases never entering
>> aliases_lookup, so of_alias_get_id() returns -ENODEV and alias-based id
>> pinning falls back to auto-assignment. It reproduces with no mux involve=
d
>> and doesn't depend on your talk.
>>=20
>> In v4 I'll drop the "underlying cause" clause; I can keep [2] only as
>> prior-art context or drop it entirely =E2=80=94 whichever you'd prefer.
>
> IMHO, the talk describing the DT overlay usage in the lan966x context
> doesn't add any benefit in your use case.
>
> I would drop it but if you prefer to keep it as a reference explaining th=
e
> lan966x use-case, no problem.
>
> Do what you feel is best.=20
>
> Best regards,
> Herv=C3=A9

Hi Herv=C3=A9,

Sounds good =E2=80=94 I'll drop [2] in v4. Thanks for the review.

Best regards,
Abdurrahman
