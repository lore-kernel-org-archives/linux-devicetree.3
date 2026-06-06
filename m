Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E094305679
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 06:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780727982; cv=pass; b=YAPTnmOTO3UU5kZ+EALl/nez+rU+i+OYW+9hPvOtSTscabDdYIyxXc37rO2uUzhne83qy49BiTTnH6yzsg8r/SjJgflQS4zR3y0oV5iWq7TDoBXKQPhQtueDGghJWXdBMhDu2iboA/+rENXrSgdIqUl1A20csiAwVSs0FW/Htyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780727982; c=relaxed/simple;
	bh=nw2fodJT+5Wo9YW6pF1TC7cMx3symmS/TuugS5g9JKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DtATkfNYjmIKJDljlh/aRJdhpGBKBlvoHSIBiY9QAp/cFnTwTAdBnyb9yetuycv4yrbAYYO+sT0Ra+TOv/2jWRvvu/pM6hinEDn/am4nxgpIWVDvznQskvmtqKIA/jbshw76cayJzo2JiPLBLk2A5XL/H8sYu+KsMqm7SfpVz0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOk2s/kP; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOk2s/kP"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6608c1a4215so3339144d50.0
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 23:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780727980; cv=none;
        d=google.com; s=arc-20240605;
        b=WComWDl1xEhcHWsRFbg2xcCGPUPMQ/y4SSFYgtPxlYrnGxYwNV58kexGszc5tlJiCN
         d9so34RMTabni2S3h9+pH+Ey+3/QIgOlsahrfCowp4w8APbSdC6CJjlvuwTqNlSLsG9P
         tzIcFt7/vJsF94bLyauNcjRZ+d5MoJ6FBY1rk4SNjvACZmBKjpCI7c/IW8H8ZccbptDm
         N5CeYgREjovlCo2kzAnvkxyDNPWrBKP8LPor8LSy2jGJ8j3Os/u8fsiP5GOduyH9SfNk
         bH2LumJwvBZAgej8BaY8uvxSg3xvfV7YgY5MWCFb3K40egRwUJhiujks1Th8/t3oGOBO
         QKiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nw2fodJT+5Wo9YW6pF1TC7cMx3symmS/TuugS5g9JKY=;
        fh=EUrO/0kIPuz3C1wR/FTrOXT2ltub5tClSu+dnRbyQpc=;
        b=AF5zUdsr2aLyYm6aQKcEeTTVRdiaqZyWL7GrtiY5JrdkALwM91oM2TGDQXXgO5xwr8
         YnBjsCx2P1uW4XMBUewLzYLYKPlhI8/VaT02ZKIxZY5EQoRxlZNC4IUlpvTYL7tJiZYK
         4Qo0lpUgNbt9YhG7JAlicc83LoXj481gIDEAnAbjLr0aAHxKu34D0dL512GxYeOHmP/x
         MEwOU4gBbQlMeW7s32DAqHUBt08fp4W5KNMMhA+Fth4QrLN2rMna9dut1gjLgRbIgukc
         aweHPDlAoiH9fZYLSXTb4CJddYcLzwqVrlXCAhF71WHfVCviyNbXClWTbu2Mv9cJrEe2
         AMYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780727980; x=1781332780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nw2fodJT+5Wo9YW6pF1TC7cMx3symmS/TuugS5g9JKY=;
        b=IOk2s/kPEvCZTYxX+WayVnrqDezYV1qRin3RMIy9ZDkfF64Wg2HSnCW7Rp4N1l+3DD
         ImqLWM8eF48+BLYQpCAb+i+Is0MCBF+Ms6U4nV1YGo/RT63d9PPW5WPvBglWYfrYZixk
         OtQysrmCxYQaDpKQDLh1lXRfq2hVnfYFvlqW3HipCdBwGzYTBsYGzggDaJXUF3Nlwy+o
         y9jSFHxQL7TsMvKGxiQnukriPCpeJIjTBdJ9KMdM44OWq3I+Uvk9IOlLISB0/wqwjSjc
         uJi2e1YEO+pThGV/MzTapxYVPX8yh+rMT7YpJqdql1CiT5TwFEkj3fcrhDHgQX50rTya
         QZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780727980; x=1781332780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nw2fodJT+5Wo9YW6pF1TC7cMx3symmS/TuugS5g9JKY=;
        b=HEfgq9e6dJwghop3H5S3C7X8TNM8fyhkXw0Tc+pzsr7KLld7wj1umSczT6FNLqgm9s
         unL49LQc4mMuhUEGf/7bDWTNZjuNYuBQP63ISjknZGVa2rel8yimhWRsFSH+id45U/rs
         Zh7KViWfMPiVOFn6rbBcNe8pAF7y6pXGUMZB+qNNWm0LEMt7gwhFFlT7aap8Ejpnb3lE
         s2LiQcvxKkL/hn0pXWQdTJSoRU9HZkThkok55KCv+4MICKbylei4a9i29vTgKT0J8drr
         ZJnmK1tFsge0dMxUBOtxZLkhpaQTZJUVH3pUuPBSE780/ApgD2XA6JwZyuDq0RPl3RO8
         ogKA==
X-Forwarded-Encrypted: i=1; AFNElJ9TXzdPqaSz8tMXQ2WarrQnLgfKozl1MB3CyFTwHBkCaz6pHJJGBJJ4PAt8bOxyxD4FJEswSwqzk0a6@vger.kernel.org
X-Gm-Message-State: AOJu0YyPCAe3bgS07/OeyEo9k4lI6A31vNLIoCi2tsZbHG+3GhMaFkpq
	P50Zr4JXM+/cJs/mPJH6ARB+9oW8+ze1ULxjWgT8ObLD9+Ap7Ec7r2hnShO6Xym0HFGFJ+C7kyP
	zu6lyqNtzwSJojDoueO311Oj7LYjyHJw=
X-Gm-Gg: Acq92OFh8q1kxn4QK6iUl1ZOas96LCLJzlzQxQgf8BmfC5MaB9bn+VztiqUihm8niS0
	pbiISc/Y38iZXzajOL29KOB55KVSO8+Cz13jaD2h7vARUQTLbwIvq1lo7K7IL2ETkjVPI5uEtmf
	it2rllC8L8N5jOqZEuUOcFJ4hSFhNtXDDYNxoUXvCNlQrbumkFOAW1JSknDKs0rfok/Vc75JbCb
	1qChEwWLivKw0bYsFqomTWFjx3X/i14xc3fZnmz7nJAfkh/hxHPzOw6EGSZCXkUWw8SWcARNTU1
	9wwwtsJU4x2O1d23eyk=
X-Received: by 2002:a05:690e:1183:b0:651:bd7e:c04c with SMTP id
 956f58d0204a3-6610a6ddf47mr4012236d50.21.1780727980224; Fri, 05 Jun 2026
 23:39:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421085635.4490-1-chaitanya.msabnis@gmail.com> <98e79ef7-1a0c-4392-aa9d-ccce988593a3@kernel.org>
In-Reply-To: <98e79ef7-1a0c-4392-aa9d-ccce988593a3@kernel.org>
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Date: Sat, 6 Jun 2026 12:09:28 +0530
X-Gm-Features: AVVi8Ccj7u4XYRUN8w-cgWUbHlOu0vYAuvIAg-MJl6lvBtK50qp2GlY_3CQJsk4
Message-ID: <CABjkosFAm17BfURDq2z0AvMNZrz3=QJcLsvxhVZbrZkKwd0rXA@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: cdns,xtfpga-i2s: Convert to dt-schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Max Filippov <jcmvbkbc@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,
Just a gentle ping on this patch. It received Reviewed-by tags from
Max and Krzysztof over a month ago.
Is there anything else required from my side to get this merged into
the ASoC tree?
Thanks,
Chaitanya

On Tue, Apr 21, 2026 at 2:32=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 21/04/2026 10:56, Chaitanya Sabnis wrote:
> > Convert the xtfpga I2S controller plain-text binding documentation
> > to standard dt-schema.
> >
> > The hardware requires exactly one memory region, one interrupt line,
> > and one phandle to the master clock. Verified these constraints against
> > the driver source in sound/soc/xtensa/xtfpga-i2s.c.
> >
> > Also explicitly define the '#sound-dai-cells' property, as it is
> > required for audio routing but was omitted from the original
> > text properties list.
>
> Ideally you explain that driver uses it or in-tree DTS has it, but I
> could clarify it that earlier. Anyway, no need to resend, it's fine, than=
ks.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof
