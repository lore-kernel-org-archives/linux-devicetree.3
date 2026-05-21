Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B593155C97
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 23:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779406373; cv=pass; b=S1Ky+9cMgKEkDdsvTCtxejB7oPhHr2Dr9CC5G7LspBq/5ucFsMnTcI0ZDgyr6UC3n4xDUN9pCPDOi7DLBm8Viq3gFmig20doh8iyo2OjtAIF+0g0YvO17t+0uLbV4F+ginee3X1/YESMpMzbKuGyEKoO1ekbtGXfnOn+o3SigIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779406373; c=relaxed/simple;
	bh=DuLgLK6LxN/BaTVUbI7ZtKOlZ97j/KwP+aPI08Sik24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IpMvLlml18b1YyuPlQeZqRWYayjcVB0Njrm3NmGmbBuiQdVMgEvwrb6BpjTitg9uIv6mgNEnuA6vWHRlDFVkpjDmu3AUYYWnCFHPMyEWtU7nxMenKgkW1T/rG0un+tABfhRZd5bfW0hHrEM5JCb2S9vtUk0+Ok9qgpU5ElGx4DA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VuibmWH5; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VuibmWH5"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bdb3eb93e20so333726666b.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 16:32:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779406370; cv=none;
        d=google.com; s=arc-20240605;
        b=cpRjH0MD4FBFGA1EBwpAemr8c97P78JOEXYNG+Sla9ZHU3/hl4/noalPcQg4MDbfcF
         2KJOeh9PHg5uWpfJga+xab/uaNSRABaaZcLsC5+71G9MM0xiIzmL+tSc+MKUCIl+PeFB
         jRhfNgjIe4FRTIfOCT1gO7Zka9KVxPrFHjA/yDV/eaV3qqRLD/jxxC2f+6uhieo5OZLF
         Tt85oR7NOkGDsFLT/Jdc4p+Z/iwI3SNqmnY05wwIPJII784cqREiuJRhSYGH7JG6vcCi
         BIBwnhAGzCieDz2lAtpuXUCFVuqHrXu3xi/pn3G23ACOsJwI8mh4S3IXNRIe8TnOpeCK
         Z30w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DuLgLK6LxN/BaTVUbI7ZtKOlZ97j/KwP+aPI08Sik24=;
        fh=nY8UEX3oB/vqj9pjiph/W6qcQgBpYDcbWov1fHx++yA=;
        b=DbCo9gL0f9Ytnm9OvMfLAnA6g7lpinoYX++D9rNuCLBaBvMb9+XJOtBEzmJ5JUrjRo
         kbW2nL8pHF1wp0LA/slVL1+G5P8NIhIBJj7P4loGmNSIFSCOF1iZ0HL9XkmWwTfHmRVW
         y0tKOYa7Kv2A0sdNjlbVXyFI8cq1bo/8QEfCq+6QsHV5ehjy+8yturrMZBeyYH4Gwjzg
         qQ68SF0tJGYj61/MK4WiOPt3igYUTmhbYAJyjx8RLANSMk9f+PV0mtcsBJR1hlVYd82k
         iFDkPUoFLWS9KdB8nx+fRKZhc9MJ57fzODknBOm91Schmo6hlh/vKGey/Fe/AvsXqOgp
         P0Wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779406370; x=1780011170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuLgLK6LxN/BaTVUbI7ZtKOlZ97j/KwP+aPI08Sik24=;
        b=VuibmWH5jT4l+QIP7cdWFbisrzA1Kx7ZqbwGC2JPWTzESQXHZ3WCGFAW4G9m5zZ0lP
         PG/vFie5cpLmgpWev3MD2xiTd/Sf7ujoMSa57ZdAYNqTjjFUJCY2lU+WAXy8IagjfVt9
         kLWB4nAFPKBNLSH/vKfIm7o7HoH8aWWVfd+MqONAISOBRKGCkeZFcFjyv457sMN5eaep
         N0LOhsR+tsCydA9toROygpmUPkyuEAHqMWxh1S5ATO0H2vDD+2Nk5gpRQGjdNWGGZw2L
         UKR4Xv8KZu516u5tyiVYN/pUxqt6BdnOkfcj4xBmmm1jMBCBvbxnPv3FJ4KXIm41V3hU
         kW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779406370; x=1780011170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DuLgLK6LxN/BaTVUbI7ZtKOlZ97j/KwP+aPI08Sik24=;
        b=oaytiRW6mVbCT2EhmgqMdpvP/C2TKFyS9E3elARluUs8Zf7w2twfLCi+FN0oDZBh2/
         i4M1Skt8/VHTxBJyKaY+3QVNzrbGpOddlJNeb/jvxyeGRfnRVFakj568SbFmZobX00ye
         hAU3ngUs4SBtzUpC8I6aJNcRtHf7FRtBPktNeSu1gZT7kEdHrVwpZgAMf1Ch2gAmLPhe
         wME3QOUQ/FvOhEIdH9Y+a2vVFJdEeDBTsYLKdsREdw7pTy0NMYXPeas4nXkW6/wx1zrz
         0W8JpwIooeR6KMqzMbM4zwNy7YZ7VWfQiGSDAOEkzgxQTgKgjns+gIdH7JDcc3QYP3KZ
         hnGA==
X-Forwarded-Encrypted: i=1; AFNElJ/p42pdSf3kAb1bW7jTInnX18tKXPWyvWvgLLol0ceoM5Q4TnwtulnLqzygcQPspbGoGG7u38jVCNv3@vger.kernel.org
X-Gm-Message-State: AOJu0YzXTlsQMx1E78MnNg2K/ztOvbmKxCxi6ixHO2PxANBDLT33Rrr6
	fvMfFHn97TamGnKn/y/i1lfHw8h6F2RjuR0atWxcpTVr/7EG1hWNxA0j5uVQuZgOw4FLVfVH+Yh
	c52EbTGGG+9DTrWvlodYd6zXHWcJo+g==
X-Gm-Gg: Acq92OH/p/GZxT7H7HDy0Vz8IisL3vOxWZmoHdbtNB300sOvo888Kx1Xtm2//Un+XG+
	A+Ko9Nn8fAYWaJxb2NZ1TAmMj2t5UvZp4uh2ZfktbKQ+gPfBVKvi6CtP7bSXb/APH7pmz3kFj9N
	O0eG/NfquXA4AQdmbI70MExBbIXOpi60oa6x8DmXl60t1wx6cQh8rpT6LqbnaFTPnrUB5V3NlYr
	fWTHRP3y1sp5lIUsICNxuqbzGrGjx7+7Ejh0IqkMOans6GsVX7jn0jebQcHQRTBZMe+eXziWVsA
	Mns=
X-Received: by 2002:a17:906:ba8b:b0:bd8:e680:1aef with SMTP id
 a640c23a62f3a-bdd1fe94617mr92158566b.0.1779406370449; Thu, 21 May 2026
 16:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520191943.73938-1-arouhi@sitime.com> <20260520191943.73938-2-arouhi@sitime.com>
 <20260521-happy-celadon-hamster-94802c@quoll> <CALFSGuoWkHYmtrouvLk2M7bWS1=qTSPUn5GuabFvK92cPBfuZA@mail.gmail.com>
 <fa73a8fd-ee73-4a7b-b6c3-1d2edd73b45d@kernel.org>
In-Reply-To: <fa73a8fd-ee73-4a7b-b6c3-1d2edd73b45d@kernel.org>
From: Ali Rouhi <rouhi.ali@gmail.com>
Date: Thu, 21 May 2026 16:32:38 -0700
X-Gm-Features: AVHnY4JQDoN-cEKJ2IStW43hgsf5_SfhbkC65BCc6BKE_2udJvR8TOkbocEmIPo
Message-ID: <CALFSGurSUdpe_KPOkt1deWtVhu16bQkmhz69NLmbf6PSbPcd6w@mail.gmail.com>
Subject: Re: [PATCH v2 net-next 1/3] dt-bindings: vendor-prefixes: add SiTime Corporation
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: jiri@resnulli.us, vadim.fedorenko@linux.dev, 
	arkadiusz.kubalewski@intel.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, cjubran@nvidia.com, Oleg.Zadorozhnyi@devoxsoftware.com, 
	devicetree@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ali Rouhi <arouhi@sitime.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 2:12=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> Do not top post.
>

Apologies, will inline-reply going forward.

Best regards,
Ali
