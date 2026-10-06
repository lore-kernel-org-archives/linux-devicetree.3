Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DE548BD26
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791299920; cv=pass; b=VQhf2KhgasuTUYStdd6gBzEXdCf8gL+dq9opUnnwfbUQTFZJLatRUsw7CZM3nMZJdXQU0JRhX50sce/go+gvR3xHSmh08yc8TUkVnRkzTzO/Kx9ud/4wDg69a7R+TWEgaYVRDvhv36BGc/ewwyYviwtVhYJTihZ1hZtl/yxWBAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791299920; c=relaxed/simple;
	bh=Z6WbsAnp0/k5TRam8CoApQG5u2b0ang3JjfGRsR4/LE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A5/b2SsPOAZlK7jRkT8IZsd2Myco4I9tvWGwza6JCRNX1GKeLN7U01oCTdMScH+jvm0nfY8y6PCJ4eyGKi6ZgPCeUsG9qD0ELMgr46N74BVuQrj69g+A9xOPC/2lVGmdc2WhgiTqNNFfb7WhFW+HbgLedjdZfwGmkscmLtwJGxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vinJemxj; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vinJemxj"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6ae27f06c2fso4777967a12.3
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 08:18:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791299916; cv=none;
        d=google.com; s=arc-20260327;
        b=WJdnyylPzVXb4Onq/9/xByCy8MW9YtP//Ke4euVARtf3tpLEOM1ExFmRebkgGry84Y
         BWsVeYLD1tSqPVwX/chZtStuCy2LErgRytqaDz1e39kl8w8Q6k41u56jTSDx2n7YZNiL
         MnWbFJMrRRUofjILawRfufrcrgK996dNcrKRS8b/e5AV7lAueoXG6u7xEzPOk9IA1cYu
         1p4M4CHxynyxKw2mJJPo7kQeQoPKbJF/++HuV+cP8F4xMdVVDDfprwY+kKcMDujU/4MH
         Rhw0ZIZILuGISdQWX0Efl2zY/9VyNiEaIwPmTmqHZSRWgSsmamHpW46DxM0ayiRcc/3u
         Wv8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S8HNQKq2PFFrdWWXN5HW5t8uFb87m5DPyp4zd5PK5G0=;
        fh=cCYGt1Lu78Rl9xxza46K5QUTDiTDu9+sHpoOclTH4/o=;
        b=o6Jc1l6nwJdzE/+XcOQ27C92oBeQQpiQQl/eHF5vMk27BzgTD0/PEeoqIunx9XI+ne
         8jHBZ2ljwhM74wHANvTZRRqb3HQxmNZFA7KNvBQunAcUMiWRAt7gkLs5kWqpSLxQuFK6
         kVdl1rLD3tXkUsS0eVSAm/p8QPH0ATeBgMN1tQDZW8e0oCz8p/GV+KI1yOJwZAA4RYbu
         4PA+UwcUvPqA3EhgKELfiuncuP5sB79hifxY4I8AnTTla22E20AKfsiO/ubXjfRMrqot
         5ErkGbQst/CUGXhVXa8riXl3rSDxlQkh1CKuEjrlYjgvxBatNHhw/hPLTBEoLAB9Nhpr
         /mSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791299916; x=1791904716; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S8HNQKq2PFFrdWWXN5HW5t8uFb87m5DPyp4zd5PK5G0=;
        b=vinJemxjfo0wtpRpFAgFolIEmK5h1JEjPQcX/AMCwCwhdtc+zvrWlULgduJ50Pr9VO
         xJX9/pmQZFWu0hcikEmrYOWlRLmLDMxRZuf60EZ+XAlxd8fuVz7tyIxfQcxqxTAOq021
         qh0RQqMV161mW7VccuYWu+k8wFFtFyKkK5sgM0yybLeW5h0iOBx/RmkZyTLDOY0segSM
         +24sbA92JaazYatCvTIfx3KBp2ZyoGvIwavOILBdB7oYuVHNCayu1x3d7J4dP02weV2z
         N99S/vtuJlv34K4IhkZSwh8a/JPfbU8CbQGg1p0CTAJLX0L4vsAGNozXrFWsb9OngU22
         h9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791299916; x=1791904716;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S8HNQKq2PFFrdWWXN5HW5t8uFb87m5DPyp4zd5PK5G0=;
        b=s19SAdfH7l/QAKYIFjP6QHgtGiAqnJTAaowXH+P2ZENjXfkTcQvrjAY9BmQRXJpmnN
         4Om+FRTbKI2dK9+5JnzXAq3Te5Mp8P5EKZ5qB87xTfiDzk3CLvrjIrNOYLkVI6OdnAb+
         lOLdJg7boQcPGa++It8mTegQs5nMxlIEw+Y9iHdCMh6fZCCy76hnOebIctVhhmrng9am
         gNQbToSArMfNznjhQhsCMzte60avRckNZa82aR+NnI/VrrD9zbBH0cd1b78SQCdZTAR5
         VpEBUvWLJDqh0TKwGC+ID3YNMLE6b1ZTy/UwWL5GI7Qeo4xqctdVV/VzOZhBlQJIrzgl
         XnHg==
X-Forwarded-Encrypted: i=1; AKwUvBw4HzdrdvAM75p+/3CUHcKh93ZuHoqASfcrZOYkQqbD0E0dF7QkIVn/tAOmVRf+3R35ycWJCAaOCSxC@vger.kernel.org
X-Gm-Message-State: AFq9FYJQDgEmGm7aLB3ItQeLJaEkYRzLFPtMIF54PvtkW0tuJwvJYhAY
	1WsDgjtompx93Nv/5hHBtF3sJnAp7iYJvLAUAleSulHRPhUNzXjghUGrhH6ctGQH90X9/+vPF4X
	wm+KI4Gf7+Zt7bbLYV59+KB695RVdKYfvCljAVSNrXg==
X-Gm-Gg: AYBFou2ogX7FoOHDWZd41WhsfXC83SUwCPSgUBSXS+YAFw5GPCJyoB3VMSj4p8Hp9Lz
	04RSd07kLARoriOsqRe/SsYfT26XXZKnvVgqb+32HCA4FlHkwfFvcXEf4MI325VMFipT9ZoB+wR
	VGLL3Jj4nox1ppd5EVKIlBTTUwQJy+uMZNwFABJmbdnZpSaxeD55QhmtkXAAkRehIkuKMX3gRq/
	9ue6xQoSeHRz29TyEoPK2KKIeHU3NhDNEpH8lD0KxWwbSyi3aJ3doiXEC/J0NBV3UALZdjxe3/x
	gid4Vzz8bQ8PD2kgwlMV7cBRMAw9owt3cKRqhzgdjBTEBFunFmz/+w==
X-Received: by 2002:a05:6402:52d2:b0:6a9:a5d6:622d with SMTP id
 4fb4d7f45d1cf-6afad731ef8mr8879468a12.3.1791299916262; Tue, 06 Oct 2026
 08:18:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
 <20260923184255.299034-3-shenwei.wang@oss.nxp.com> <20261006030739.GA3457522-robh@kernel.org>
In-Reply-To: <20261006030739.GA3457522-robh@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 6 Oct 2026 09:18:23 -0600
X-Gm-Features: AclHuK9X3bTaGpN7i7UclAS_3sT01qVYKxTd90Hh58vpFwo0cpRNFUaLVMAbBaM
Message-ID: <CANLsYkzcqapDYvKAEa2ZjA=q07iO=RM4TVNUbSqDrB0EmjeKyQ@mail.gmail.com>
Subject: Re: [PATCH v16 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
To: Rob Herring <robh@kernel.org>
Cc: Shenwei Wang <shenwei.wang@oss.nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Oct 2026 at 21:07, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Sep 23, 2026 at 01:42:29PM -0500, Shenwei Wang wrote:
> > From: Shenwei Wang <shenwei.wang@nxp.com>
> >
> > Remote processors may announce multiple GPIO controllers over an RPMSG
> > channel. These GPIO controllers may require corresponding device tree
> > nodes, especially when acting as providers, to supply phandles for their
> > consumers.
> >
> > Define an RPMSG node to work as a container for a group of RPMSG channels
> > under the imx_rproc node. Each subnode within "rpmsg" represents an
> > individual RPMSG channel. The name of each subnode corresponds to the
> > channel name as defined by the remote processor.
>
> Sorry, but DT defines the names of nodes. If it's a gpio-controller,
> then 'gpio'.
>
> I still don't understand where the unit address gets defined. 0 and 1
> look a bit made up. I'm sure you explained it before, but *this patch*
> needs to explain it. When you define a second protocol, the 0 and 1
> addresses are taken already, so you can't have 'clock-controller@0' for
> example.
>

I had a conversation with Krzysztof about this here in Prague.  We
have decided to adopt the bindings proposed by Francesco in this
thread [1].

[1].  https://lore.kernel.org/all/20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it/

> Rob
