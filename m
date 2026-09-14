Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5E231F9A7
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369652; cv=none; b=QbXMgPcAcYt/xgSPWhEY4OXA5v/IKQWdFdRIZb1PUAxEirRKUVxePfgjte87pn/ndcAYaBevHvDNVQ5ZgVKt/cGESX7bRiaCq5VvA5lym1Z7+2xFU2IPEIPhocP+ug6YpmIhQvYCcvXaj1UHL8e5XPVDMy5kMtbKvrMlC+R8aAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369652; c=relaxed/simple;
	bh=Va98ggKdhMVk724eSW+LbLPDcasPafXkGaGAqOEyB2Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QEfClZh3UU4gsTkWzxpnxpSM/wsWfa/UkuZI/bnDLaAqFSmqt4DNdkZuku2HAxF/Nwd3mRU205YPYTN2sxHWhi2OzFsThLORhaExofsrcYlrxMWzYKKT6kerqu7NSucAEFFvyG6AIkR8nqJq1UgtbwtV7WutTd3wxMNOIT6cOao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CfCvTHmo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=P4IZafKl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CfCvTHmo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="P4IZafKl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789369650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q3T8MmJHP0lKCHrHGSLSWbPMgzGHktYBz/oTT4ophsQ=;
	b=CfCvTHmo+Nh3LIYg7aCsRJT8DwYSBtMUSFlK0JTWMK6X4AeVq2QtL5/OaBKxAJZ03aFffj
	dWYfR8qCvn2U5Pd4Lw3M+Dm9t1i8iU6FbAj6+aKl22N9RlD2ESi+jaOGiNfUSmeHIBDYS1
	cWJ3+u2VQcS9p3F4pLe2xf15aStIJ3g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-_DciIpVKPFOaSyvpR6dY6Q-1; Mon, 14 Sep 2026 03:07:28 -0400
X-MC-Unique: _DciIpVKPFOaSyvpR6dY6Q-1
X-Mimecast-MFC-AGG-ID: _DciIpVKPFOaSyvpR6dY6Q_1789369647
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48700cc7243so275360f8f.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789369647; x=1789974447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q3T8MmJHP0lKCHrHGSLSWbPMgzGHktYBz/oTT4ophsQ=;
        b=P4IZafKl9TFoyTWA9T+SplhqewN14TKBrDsBzdxa/wuM7GxWT/FAOJ4u5Vbk+ZZyNb
         kShGawhbiOOSI0DerFEdH9lg+oGqihzK/7VlSBImR22Ro0pr3/KBBw1BJlHqP7JkndM4
         0uCCgm9R8v7tkrV/cxFopC23QBjbxut3U/jkGO5ZETbQsTb1eR/PZsFAN4yYAFZMAmpp
         SGpS8X2QPN4990b/qsp2B5suTjVosLBDK/PB/48jPmcJSRxSaWZsjKUfyALc6xF4r6Fs
         BqKF9tqdQpR4LZo0Tn2rqoPPFRDCVXDTi5bd2wXsQ8Vv35ZY84MRaiEWiM1grzBI9Bdh
         TgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369647; x=1789974447;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q3T8MmJHP0lKCHrHGSLSWbPMgzGHktYBz/oTT4ophsQ=;
        b=jvCLTT24vRdGs8KkjIVwgc6JREEWBc3PGrsKH6DrG/x5639RelNp8OGuKXRB6uSMGl
         ZPaWjFdf6reuP73sQJFf1W5uaVHWHCIzUrCJkcXYacyay0bNIgh8QowysZgVCJVdITg5
         W+g4HyvtdyhLplmlPIA+wr9YhrAbp4tfcqcMT5RCAGlkhG9nQtPgrKqtVaotkFrbMsci
         1s4SSKLtJmP372qXdAp8vfn2CRzwbgF2pviOPd7IJgSWnPf+/zmRnyKfgKqQelpEEdE1
         Lr0Upp7PCb29oWrjoFHWMXEDDmtH0H50pemqPAAVpavlkvhAmFpQdyQvn+HooLiobGQm
         Rlgg==
X-Forwarded-Encrypted: i=1; AKwUvBzxhddJfdpksJL1KFS3eRqc+bvaguTZXlago3+ekHXmU1xQ+S3eOiMlSU/meicnAEMdL6yzbFlzAooA@vger.kernel.org
X-Gm-Message-State: AFuF++nQ6toFAvKyKy/pSQoWVo7BJz4TedA4cNK9D7JaEmSa4GZ7smJc
	OHOZSCwli40+BL11JBCCxDdvxKznmx4TCq4Kcwels7r0CG6CQ3i6EBr+R3JIz0jEdJAaMAiyNou
	JI/0YY2dzB8T/9Gi/nHBCK3vy8KU28RB/TpFyNhc6KDXl4rBgRMdRImYrNNmXUg+nkUoS2iA=
X-Gm-Gg: AYBFou10rfxPOHQ2CbmzPLGE0IMl2Y6pFnCQpR3JiDomCjez4SbZGNBDVfsdlAwiasm
	bdkFEH/HBh38YOKSmxuTpu5KLV/RTJV/9YfG5xh0I1PElZpgS0ZI76t+qELHuUe5E0WfrKH/oAF
	Efid753oP5zit1qtsChfLqolc1m/V4SiOcNUrL/NYLVIdPqptD+YmU6C5qtMGTs6FfGsOxGUfqR
	L9BIuqhswhhoXBGAoHwqN1/WmR+yGmEeaL4mwTC1JFx/4TyRoS0IMqegl8pMjxjWS68Nv5ckIdW
	Y8Zo2Mrf9cPIx4S6jq2U1PHjJBXZKi/WpWnVKNcKXS0u/BepfGMN/jgaG0L/eazX4fKHvozrQpT
	pZbiWIy1aDCxMStQ5mwdVX9S6d+vxPtMjy2Dn1kL6Y1f3ocGAUYAxZqe30A==
X-Received: by 2002:a05:6000:386:b0:485:8bc6:3caa with SMTP id ffacd0b85a97d-48702acc272mr1050453f8f.16.1789369647568;
        Mon, 14 Sep 2026 00:07:27 -0700 (PDT)
X-Received: by 2002:a05:6000:386:b0:485:8bc6:3caa with SMTP id ffacd0b85a97d-48702acc272mr1050421f8f.16.1789369647201;
        Mon, 14 Sep 2026 00:07:27 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fd3bsm25154298f8f.19.2026.09.14.00.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:07:26 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, dri-devel@lists.freedesktop.org,
 conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: display: Add Solomon SSD1351 OLED
 controller
In-Reply-To: <CAOEgbEqd6pGUL6o2CbyePUWm=NBy1GJJaOm+_7rg3CsEGqEfYw@mail.gmail.com>
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
 <20260823111959.17029-2-amit.barzilai22@gmail.com>
 <20260823112814.896AE1F000E9@smtp.kernel.org>
 <8733vhmk4p.fsf@ocarina.mail-host-address-is-not-set>
 <CAOEgbEqd6pGUL6o2CbyePUWm=NBy1GJJaOm+_7rg3CsEGqEfYw@mail.gmail.com>
Date: Mon, 14 Sep 2026 09:07:25 +0200
Message-ID: <87v7881fbm.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Amit Barzilai <amit.barzilai22@gmail.com> writes:

Hello Amit,

> On Thu, Sep 10, 2026 at 2:16=E2=80=AFPM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>>
>> sashiko-bot@kernel.org writes:
>>
>> >> +allOf:
>> >> +  - $ref: solomon,ssd-common.yaml#
>> >> +
>> >> +properties:
>> >> +  compatible:
>> >> +    enum:
>> >> +      - solomon,ssd1351
>> >
>> > [Severity: Low]
>> > Should this properties block also declare default values for solomon,w=
idth
>> > and solomon,height?
>> >
>> > Other bindings that include solomon,ssd-common.yaml, such as
>> > solomon,ssd133x.yaml, establish default geometry values for their spec=
ific
>> > compatible strings in this block. Without these default values, device=
 trees
>> > that omit the width and height properties will lack a schema-defined d=
efault
>> > geometry.
>> >
>> > --
>> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260823111959=
.17029-1-amit.barzilai22@gmail.com?part=3D1
>> >
>>
>> I think Sashiko is correct here. Let's include the default values in the
>> DT binding schema to be consistent to what is done in the other bindings.
>
> I included them in v1, Krzysztof mentioned that they should be removed
> since they are deducible from the compatible:
> https://lore.kernel.org/dri-devel/20260611-psychedelic-funky-foxhound-a8e=
39d@quoll/
>
> I personally agree with Krzysztof, but I won't die on this hill.
> Let me know which way you'd like this to go.
>

I see. I don't have a strong opinion either so I'm OK with not having it
in the binding doc then.

> --=20
> Thanks,
> Amit
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

