Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F1E38CFFA
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 01:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768644; cv=pass; b=BY+MiTgSkK1a+ziN49wXKQiau7fwRkcNDLo/Le0sCNDkgTQIlnAlfl3xisWyxxtcW1YQJ90zDEY7J7ntMAjmkLxlGOcvR8e8TfD5Z5EILpYWN3rXPdPAbuMBtrsPY5j13sQWqzg51lORjglq6UUg2c6alvBU9aEuOfVRe9T/F18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768644; c=relaxed/simple;
	bh=d1fEXq1Mkk4vkb58a3C48SM4t/4EvTl4q1MeMOc9GIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u5kpCJmJ0j/0JyC4GOWq/tWdQEt9BW4NnoE3ZMLaO6w6fito7vGllNlQTkthxNprko5arQ/ybChZYAHpudUzIi1jExHz89PV1s/bhAV0soh4kpKx6NRkl+Q22rUxolb3JzYn/SpgSmvNpD1NqdwTcsXUHS9da8ysBKVymhiWV+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWbKhR8F; arc=pass smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWbKhR8F"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-49dd13a91d0so516884fac.0
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 18:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768639; cv=none;
        d=google.com; s=arc-20260327;
        b=J7CITCJlzxYDvsJ9oq+nitseeWVUlwphRTyoLFxCXjODcAQaRaGsJPkt7y35jz0wZ+
         dRic2i2n35fDnL0IyeWMAJPJfBuQ33GrEvedgt1FaJ1SRXuJYW1ZjnN9F26I9yu0crSd
         iiYmWx1XAt5qR2yyDdRmNWob/TMx4+V+OLZpqXSotxg8CA4tgEsE1L0af4ZzgCxwmX/f
         20gm/bpcNxafSAk16U2mBHWuxl+m2Zu/MyHwbPXcz2I9Qg+YOHETKcchU8RGamKXkNqL
         oschs21D+a7ntaDgTf9DpvACcPxznj8sPc6HHXGspYVyyx/W3jnq4+10ihfmeFL657sS
         3o6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L4eXsmhlclpfowQz5aqJOp7PZGMOX+eSHE8u7F7KW9Y=;
        fh=gamKYKmSCePGgIV/+mlwXqfXHpmIOwpnrBXPd2SuZZo=;
        b=ATHDuhglACfH+TZsV7P70arNJoEDEo41f71PJcE04PF3cDnrGpUpvENObSmY8MaehE
         KborO+CghUMdK8jG+1VPo+pbyQydeexmxeZ3a6pzsCnRO6w8C/8ls2Lb00csY6ndJYiA
         HJoFtfJCmf9ezWVDZaokTA+g4OE4Li/3NEG7PfSwcMY0Nw1zt7m0kuWtv6R0brXt+4xK
         n9784bWfd6LYgFsO0dXMxOR1ER6LMct9LjF9WJJaZ3lOZ9Zfjs8YeJjFeUtPUEmGa4Lr
         0wyp8ekUnK5YabVJD8B+zwlQFT7KxrCvHUrWideNMNdNDlBRtwdkC8jsq9t656NtBADE
         bF1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768639; x=1792373439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L4eXsmhlclpfowQz5aqJOp7PZGMOX+eSHE8u7F7KW9Y=;
        b=QWbKhR8FC+ZA8ab/OyiZ3QAmVkJMbIp9ruiItLr0mmxhz8ZPZS1kktkeSM/iHwVFUH
         WPw7OQgUthwV6PTibwNzbvn+7WeI+soz9GIO+LQyIjlVCyR4lUL55KZOzOZtdeQXHNSM
         Q/fvnoRxJEdZ0tQyo3djUw2SWDxi0GajwLcBTsbWktFF5O7MambHhTsJTGhxNJli2Rjh
         5/TUsDU5l4kuRKTwwM6Ei1tzorYXmdACj5EJaNqC1TMqJwfUOsYBmmZIgKtMGsTqbCoe
         SIwqIAV+hK6W2wSrd6CdyCNKOLXYLDm5+tWexbzX4jFVmGOPiglwmWJRJMYMNVNXkqWA
         tULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768639; x=1792373439;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L4eXsmhlclpfowQz5aqJOp7PZGMOX+eSHE8u7F7KW9Y=;
        b=NJRKHDAMzVAatdo8bcI9GCAI7ZKfiRR/j5P2UkRn6ekeKYwZapO74RYVvv97/qpNI5
         g4fbAG0cPTNUwUe/Qx33tdFY2qRAgePGRGLOmH6fQSM5JmDZnAzDGyvj9MtlMsAmNmTo
         rOGH6q/3aG6hEye+P4+bRzokCo6pyKjzModk6p3sjlrJCYh4dK5diLc8cK7mraNfd7EB
         qJj8/N0/2VZKVoeLDLzWontldpRKk/PnYHgxm7Rm49NJX+6hpfC5REc+pZHXDq+RBNkr
         iqxVFdGHbdpU7WOYaODp1kVKEYGqaOd2oHI5mBw9wE2n3E89Kb/TRTZKm0502PRm++MY
         1t4w==
X-Forwarded-Encrypted: i=1; AKwUvBx+/227r90z4YskUGHxouuOeoSyNJXbqMbAS7YPtBUOar6JZb0Fm/oV03PQbQHtllgzSP8YgGa+/hsn@vger.kernel.org
X-Gm-Message-State: AFq9FYKoG+gFQBX82EtqEq29i9iIaO++knR2v/WyiwjCkc4eA4Qa2ilz
	Dbswhe3ER3srmuDxZ+IiC/3zQiHSTgBK+vjPu1yy6cPGh6QplaxMZ9umrw6kOWmIImQ/z08Yra5
	5NN0ca6muR/OceZSTnI6xZ2YsWef1a+A=
X-Gm-Gg: AYBFou3DFCzz1nvbWldihHeSJnpttn+kBDq2YfVVXx1xI3+NzRobCrqEwbdJ/mZV8hH
	YjSkhh1ySCJA33zUXcyqujS1qi1bquTtPvxeb9JZfii5Hn46nSoYSGltwGzZS05zqPURa3myW5J
	c5zccmzs5Qu+Ad1/3gsSLDM3TyhNEqSz9ZBBU39I6ZkaxyAamQsEB6BIN6QcyvVSBX3Je/z0MTN
	zVAKiMfWwqvkjm0j7VfpQoF86K1nFSkzX8MdeWuyrT/KyuM4DRbtB1VRZltQSgJD9wMcAwg+Jsk
	6EeY0Thjik/LA4pZMCqQ/UWlnKoSG5uwx7ZInyr4yd4yir0rdBvah/4=
X-Received: by 2002:a05:6870:e2ce:b0:494:a2cf:8dce with SMTP id
 586e51a60fabf-4a2a870834cmr6526407fac.4.1791768639415; Sun, 11 Oct 2026
 18:30:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930172948.2901336-1-b-padhi@ti.com>
In-Reply-To: <20260930172948.2901336-1-b-padhi@ti.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:30:26 -0500
X-Gm-Features: AclHuK-lzcBr52y20tr2XLLyOQm2hH8-_1PyChxO-WGTtfJpSF8tAo9K4q3D4EQ
Message-ID: <CABb+yY1nPr0qBngbnmReKPbziNa6be7i4OJDdNut9V9eQTiAJA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add support for TDA54 variant secproxy controllers
To: Beleswar Padhi <b-padhi@ti.com>
Cc: nm@ti.com, afd@ti.com, u-kumar1@ti.com, linux-kernel@vger.kernel.org, 
	vigneshr@ti.com, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 12:30=E2=80=AFPM Beleswar Padhi <b-padhi@ti.com> wr=
ote:
>
> Add support for the secure proxy mailbox controller integrated in the
> MAIN voltage domain of the TI TDA54 SoC, which features up to 444
> threads with 60-byte messages per thread.
>
> Add a new compatible in dt-bindings and add the device data in the
> ti-msgmgr mbox driver for the same.
>
> Testing done:
>  - Build and Boot tested on TI K2 and K3 platforms.
>  - Tested that these patches do not generate new warnings or errors.
>
> Test logs:
> https://gist.github.com/3V3RYONE/8cb2e49ddd902180a920730b7a5c8016
>
> Cc: Jassi Brar <jassisinghbrar@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
>
> Thanks,
> Beleswar
>
> Beleswar Padhi (2):
>   dt-bindings: mailbox: ti,secure-proxy: Add TDA54 variant compatible
>   mailbox: ti-msgmgr: Add ti,tda54-main-secure-proxy support
>
>  .../bindings/mailbox/ti,secure-proxy.yaml     |  4 ++-
>  drivers/mailbox/ti-msgmgr.c                   | 33 +++++++++++++++----
>  2 files changed, 29 insertions(+), 8 deletions(-)
>
> --
> 2.34.1
>
Applied to mailbox/for-next

Thanks
Jassi
