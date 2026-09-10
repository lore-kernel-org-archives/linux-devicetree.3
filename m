Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610FB4611CC
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 11:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789038892; cv=none; b=GgXnjH93F3BOIfaC2gB1PfALBjQ2Jz+UDAv4PeGDGcJNzfJQU3dTlaAKSaKr6/FV0g7TlabNz9smXB4nP4hbrKTuWMvfepS1W5bHv2pBRhWd75P8vJdPrRywIYhKtQvhhfIXV1VB0kwyEa2UKcAWlpAGvSms+hqtr+qVKppArhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789038892; c=relaxed/simple;
	bh=hM+j5vZvepjnpgp47k2nQCLQxo8iIPo4FwoLBdM9RuY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AuIzP2sWgFHhOTgrImliqgX5MMAHYK603zrx59qezKnCGf8BNsrrg+gdrMssWU6BxEif4QithhCpUTSwcT+Fs8J1B1kEANzxhE90nkjwgKgi2NqiznY1Ciy9KhjNiMy2FG0RW4gskSYXezSrMCiCqJmPQd3IMuceMw9dnvqUt8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ekcny5/p; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rOJ1Kk0v; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ekcny5/p";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rOJ1Kk0v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789038889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4aJeoI50tbrmnYJ3Ms6Bai05KfSCa+A5Ag4laiMRAqw=;
	b=ekcny5/pdU/lc4halXfVG5i53fOZ4OKLBo64HYK/9ccAE0NqSJWMdhqH+2nbzrcNtvHsY0
	1J7H3u1ocBfafotkL0kMt4TuBH9ifEa73VWW7qqhjK6/qrnNmfyaMMYcf7kez1ct3neqU9
	gyTJ47IifSTTZ146tXtvTpvBIVClRcU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-AR1qNF6JPlmBJwIGXdFvhA-1; Thu, 10 Sep 2026 07:14:47 -0400
X-MC-Unique: AR1qNF6JPlmBJwIGXdFvhA-1
X-Mimecast-MFC-AGG-ID: AR1qNF6JPlmBJwIGXdFvhA_1789038887
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4858f06e142so4117180f8f.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 04:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789038886; x=1789643686; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4aJeoI50tbrmnYJ3Ms6Bai05KfSCa+A5Ag4laiMRAqw=;
        b=rOJ1Kk0vVo68HArhUJyzWgI4S0/+2pskdr2LtTP/5jSFHxNyWmNlVCJ+wmNMLlpIxq
         Tdbxu6dosOst4FWjqPd77uTSaA2zfO07wZ44p22fBNegRaPrD/J963U0c2A4aWMSTIhN
         C9ENYL4qIiXbDkDeCV0hvcvVzLZilPj+vY3irMEKubWJTjTGvJVKltRY+RhXmlGQAeip
         VZ7uYXywHUNH2bfzQdvxnyfsPCu7sfYYtx2uimDBcEOJpbUOWEMG4mj2jWTYNUnbaqeH
         LsMDKINpv9ifoVeOdw3Uqd9+/AULK4EJ9ml740vFc4Nmww6wBlQjqAV6+wsPyVBGr0Wr
         RK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038886; x=1789643686;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4aJeoI50tbrmnYJ3Ms6Bai05KfSCa+A5Ag4laiMRAqw=;
        b=oDfmSWtT1T0WRvRlOpo6dK7a0A42dnSUxDgCAMgzJTOao7MvOhDjjLPqbgERpBH8Og
         mr/pV2KrR8KZmCmpToa7R/w4bzKyV6UnBeFjCRes6vQ4Yhq0OOrcIHt3m1hNdLBzKEIp
         9k7sgJBywGtAxhGvBws4xuwlaalKyh2YCZoBQVc60Pt0prJkLkW8OcsizTgMe3pHUGmH
         SsE3OKFCbzNFHVx73hE91OrRgVtA6py8tWktpKma8xKsQG6vtt2iogVcVuAb4QHTbGOo
         vSmu6YX9RCptwTqMxtcIdF87nOZOvAlhMqBKkwpo1gdQ8e6cSMjydNM9G5UkXQQs3WrZ
         F6wA==
X-Forwarded-Encrypted: i=1; AKwUvByl5cHDaLbc5IKGvb09E7YaZsHlbtwRXW6ZD5ihxjSnZuN7674c5zbTQgzQKX/HKecAqYKdhvryNiFM@vger.kernel.org
X-Gm-Message-State: AFuF++naVqVqTNnm9urwBg6Hf3i15jf/EaWkiYmOz/WPcm/D7gtZegC2
	qOdDtnheQRIQ0hSvMVRpXNzBI6Pf/9ikbffA4ok41HK3o78v+3IeUkJMw80XUohwYhhdubr+q0a
	9VNVNUbILFWu/jb66SrSeYZc5lb5/YB6bmzWUI8z0pvTN0ZKzDfgJUbpUbzl9zWs=
X-Gm-Gg: AYBFou2LkwW5++pu2t0DvPvx7J27ZbiTmavrAEaRRAlBJnSSe5dbwDGEv99rUaQePgS
	KEFgXnbiic7g8nOkXYjJLNIiaCpmHebRcfwZ6mY/dJVjY/dTiIx5IsmsCbGaANpZumdD08v2NR9
	GVyhBPrmkmtAhTsdvZFfaINjixsrG6TxElplAudTuTzCg/0DsMGp2OJESWbO7v6NA4wsX/xDZ+f
	vEgZx+2sH/cCGP3muf2nFD6igu0bL3d4jS+sMQnzfd3IvujsHnAIixclZBz/OGqdzHSC7RnlTrm
	qq7Ies1SyvS+uyBJIT+mlNdRxuAafztz3gUM0tEQXK66JhMy672nCFbWfTPFq+2Lkfu/T1sRzC4
	ArTPMlugkO+hi+ja3VPONXgl5cJDQfk1It2X1eSRhIDSzXmbq+gxfjY8dSA==
X-Received: by 2002:a05:6000:29c3:b0:486:4fff:da40 with SMTP id ffacd0b85a97d-4864fffdc49mr4596022f8f.57.1789038886593;
        Thu, 10 Sep 2026 04:14:46 -0700 (PDT)
X-Received: by 2002:a05:6000:29c3:b0:486:4fff:da40 with SMTP id ffacd0b85a97d-4864fffdc49mr4596001f8f.57.1789038886245;
        Thu, 10 Sep 2026 04:14:46 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883959f0sm53587265f8f.10.2026.09.10.04.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:14:45 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: andriy.shevchenko@intel.com, holofermes@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Amit Barzilai
 <amit.barzilai22@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: display: Add Solomon SSD1351 OLED
 controller
In-Reply-To: <20260823111959.17029-2-amit.barzilai22@gmail.com>
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
 <20260823111959.17029-2-amit.barzilai22@gmail.com>
Date: Thu, 10 Sep 2026 13:14:44 +0200
Message-ID: <875x0dmk7v.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Amit Barzilai <amit.barzilai22@gmail.com> writes:

Hello Amit,

Sorry for the delay. I've been on vacation for a few weeks and just catching
up on my email backlog.

> Add a device tree binding for the Solomon SSD1351, a 128x128 65k-color
> RGB OLED display controller driven over a 4-wire SPI bus. The binding
> builds on the shared solomon,ssd-common.yaml properties already used by
> the other Solomon display controllers.
>
> Assisted-by: Claude:claude-opus-4-8

There have been recent changes on how the attribution should be done and
you should just use "Assisted-by: LLM":

https://docs.kernel.org/process/coding-assistants.html#attribution

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

