Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443D736D9FE
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 18:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790967117; cv=none; b=KSMjfCt+bbH84AxNONMPigy59VyiQYqR9cU3EvzFkBpN1yRv1b9OzfGRMJMw83Ao1W6yZw5m+Gcx1CwpHb276yz9nOi0pUYH1SnOm6WaogVfKUQjNGUlB4q35Ff1rJ5dBbreschtUYh1XB5ccwTNr1o6WJiTwpLbbRRZrciGxOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790967117; c=relaxed/simple;
	bh=SvlLnlt6KHX1Jrj2D3pJtCaILFR/9gRc9iadqwmEB5E=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=kah3awtuWsC7orIjOLTfGMPX9To8o2JauNS3Zhcdo/oqHpBp1XfVzJr5XRAWVmUFhCX3lam3lLxf+A3ibjtFbv+ofHgk6sB5u/DlHXIh6pncIvh4Ka2ozcmO1JVVOwSHuuxk/bkrWxS1ZQ2dnMYqpaLYDUqhOM3cAkafxT55gwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i1tlYHHq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=p6ftKHjN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i1tlYHHq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="p6ftKHjN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790967114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lViRkD+J4l6mElusP3QWY+NSQ6ORF7js4Y4aeDT+mp0=;
	b=i1tlYHHqOg6DzfQzDRI44MIPzxcDl/GPCYu4hOKXI0SjG15mCsJO/R1sbumyZKcmEMyAD1
	rl/rrxETyAjH9VVcnU/mln5FoYFScbuuw3OSuEqrvYDK092YSLkM1wULSZbCmmdGW8lXrl
	MlqoJIBSc4wcQhQBSTzFCnvuMbTQA2Y=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-hyElftBMO2Sks8a5FsLsLQ-1; Fri, 02 Oct 2026 14:51:51 -0400
X-MC-Unique: hyElftBMO2Sks8a5FsLsLQ-1
X-Mimecast-MFC-AGG-ID: hyElftBMO2Sks8a5FsLsLQ_1790967111
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179f0ffb96so3289726d6.3
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 11:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790967110; x=1791571910; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lViRkD+J4l6mElusP3QWY+NSQ6ORF7js4Y4aeDT+mp0=;
        b=p6ftKHjNYQtBqZI/7NBFPU13edKoK5+rVbCZqPUYL+bnN+zzBb0VYDLjONRe3oH8Yq
         ZsO5Q1pJwyJGZG+G/oND+B9ey1skQW61vSQ4TdCBkzOsWHmunJsX22DJaOgB2tflQHn6
         HJa3zqpocSCqFnsooTIhhls4jzwv4sp0+iyZmgt3WFdPGFuylrvB6qPpb6+0fqdrE5ZY
         oqQU/7o9fYFHjEeptqHx2HHLAgcaDQ+XcCllPzX7xGseIJoMNa4BYtsA9qSmqXSTxAbR
         GCeXPnDJwPZmN0A+fl87/s6OHcx/DBO6J1tJ5KP8UB1yZdQz/aATPw81DMB6kU8ScYQN
         9Eew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790967110; x=1791571910;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lViRkD+J4l6mElusP3QWY+NSQ6ORF7js4Y4aeDT+mp0=;
        b=b57AA4yFq9JltNy0KvCOgdsxCmlAIdOOA6K610fddhvbLZ/7KzQnZ5hjhjfydxYUw9
         P6degh9En+9Se52293R11G0FBsZnOmlsFSHP5t2iu0fRl7bGKPby7Gkbn0uhloD4SdPl
         xQU1H8uDiyjB+f2EnccLx3S+XeEYAt1nKumEgvrqACdHzryWPvQxu1Zxb2ZeYzoO+HiM
         WomWu/dW93nAEqJ3h3FVIpvpVmZoxb0Kptm9LJQIlY1zdpWC85Z/24visrQxR0hN2gpn
         Fo+/zQ3FK4VMaijawMIxYsnyTj1FQg2jpxx2O1ntCP50ynU72vFSeADFoRJhd5+hRzs5
         7HQw==
X-Forwarded-Encrypted: i=1; AKwUvBwi7hQIR+UWt/R3yMUaJ4wWRCsflvW4lvSIAgg3S5dnAjLZUJpICi8g/iCrOMrXWvFz1ZgaTTHc/Joh@vger.kernel.org
X-Gm-Message-State: AFuF++lphOxtfQfM3drrmryv6gl95aYqOlJVhM6kTsoc09WHEseLnXxA
	qkAOY75A5wUdYjx4M3JJBknrOj1PA2bG18U8vRN0aDscITZ8UQdhPN9YRi6rxgIhd1QmvegQJoH
	lpD851XALNxPt8sLTujlbfi6LFI+CzYGTmigfgYHIvNOvSNtSoTV3qsHQby4/iiU=
X-Gm-Gg: AYBFou3qKde8fxhfZC9qzpNid0IInsg8xzOjeQo4iOd6iv33JUXdGOQLp3RQy80ypOe
	Eu+52ctms5LFBmbg1g7jsq1ZUoeIPhwPKFhx5N8T9GS3zf0zgZ6hankzg9AcK5+nMkSlk4DO5xS
	Eupy+xSh3FCF1Y4dkR2inYqht29vy+qk4E60A9w9kgRNRsFYg3eclf0AjBP/8gTHt4H91aGsA5O
	r3eDFNGv4RaT2ZXYS1jIFqrmExpKUhOJGv6B/B8r7UZZJAGOh1cPnv5mCC1BgnquvTbRwZluvui
	xyyi+JABkMqbQpldbZtSAaT3C6pM0EMZG7vh8b3JmuSOFuBjc61OlyP93TenDVt0yMZBTv14pbQ
	T7SowvOheHpePmw==
X-Received: by 2002:a05:620a:bd4:b0:93b:c58c:d3be with SMTP id af79cd13be357-93cf17664b4mr670122085a.37.1790967110488;
        Fri, 02 Oct 2026 11:51:50 -0700 (PDT)
X-Received: by 2002:a05:620a:bd4:b0:93b:c58c:d3be with SMTP id af79cd13be357-93cf17664b4mr670117885a.37.1790967109968;
        Fri, 02 Oct 2026 11:51:49 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb ([2600:382:7723:4eba:66b1:961f:1a2d:af55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca03a1bbsm290352485a.1.2026.10.02.11.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:51:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 06/23] clk: starfive: Add JHB100 System-0 clock
 generator driver
From: Brian Masney <bmasney@redhat.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>, 
 Kees Cook <kees@kernel.org>, 
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-hardening@vger.kernel.org, 
 netdev@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20260930124317.5648-7-changhuang.liang@starfivetech.com>
References: <20260930124317.5648-1-changhuang.liang@starfivetech.com>
 <20260930124317.5648-7-changhuang.liang@starfivetech.com>
Date: Fri, 02 Oct 2026 14:51:13 -0400
Message-Id: <179096707364.821688.18177370718453496156.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=922; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=SvlLnlt6KHX1Jrj2D3pJtCaILFR/9gRc9iadqwmEB5E=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL2/7X6vESXVZZr6Wxj3c4lz4Xy5qcm7nt4+OjFy0fUf
 A+ZPjGe2lHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEEhsZ/ue2hf3l4ON+PnHv
 SvOQsrfpJYHf/Bvm7VBe9Kfo56vsPbqMDKs+HVC7yjLx7g35VuZFnkG3JLSO37uqbflrXT1jv6R
 dLzcA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Changhuang,

> Add support for JHB100 System-0 clock generator (SYS0CRG).
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4f72b4ac27ee..a0e5b4df96aa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26097,6 +26097,13 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
>  F:	drivers/phy/starfive/phy-jh7110-dphy-rx.c
>  
> +STARFIVE JHB100 CLOCK DRIVERS
> +M:     Changhuang Liang <changhuang.liang@starfivetech.com>
> +S:     Supported
> +F:     Documentation/devicetree/bindings/clock/starfive,jhb1*.yaml
> +F:     drivers/clk/starfive/clk-starfive-jhb1*
> +F:     include/dt-bindings/clock/starfive,jhb1*.h

The spacing after the : doesn't line up with the other sections. It
looks like this is using spaces instead of a tab.

Brian

-- 
Brian Masney <bmasney@redhat.com>

