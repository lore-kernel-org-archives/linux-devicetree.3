Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A660437E5F4
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 19:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786649151; cv=none; b=FS39NkBduYrwZHyW9Ar0DYm/MyB4A4s3aoRpz8OjVPMk9JKevtFVGZWHBfZPHrdjOyF3GxwkDnJPAToBc+dbWHNU4pPBLf7iLqScE3mYIuix0Y3a/7Kn36fExZfAh9DrZsqSad+oA1wks84hYGCRsmiZuEKXvQZpsdwKKXstXSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786649151; c=relaxed/simple;
	bh=AD+3lRL5dooLB9G2GOM1E1QrrdybWjnAoLLY1C5cufM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lFSAnh4hnGB5MPE8/OZyOW60BUXpXkBISGS6jrWg4ezl3X4cX6OM9OYpJWBZ4uOJ5sMHAluFxBq8kaKTAJCDLQy8WbWgc/Mt4AufgF0XMTRCkp1oVolzxxAncl4evHRB1A7jjbxwaoao7TY6GrQSZOEnfaSVmWxeer3bMLQNYSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=WYVMu+nv; arc=none smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="WYVMu+nv"
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso245311a91.2
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 12:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786649150; x=1787253950;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AD+3lRL5dooLB9G2GOM1E1QrrdybWjnAoLLY1C5cufM=;
        b=il9CjW0UlK0fRwijyTsY/mcEdPtntgSZKQAnZqJa0uKkeIGoMGzod78NulGE4CTmSe
         6/zlbks0tQ3QxtKsd+AKG4uvLr5+uIOYwPqH13OAtdkihX6pn56W/lqF6+fVM5hiXfkl
         qesndZOX16hQH5PRSwIWIuGsmam66gzsJR6WlxWjXUH5slGe2OxV4qQH7M8Abn6RUgso
         iKq12/Emfn+qhOPMZE9FYfIcj73TUtNAQ9kg4u40/P2hQlQkBS//wIgS5bg1aNmTV+4z
         5nvLpeNurFzjpsuRN/cL7gcH7jZsZeFrRqXh2zkeDvO+YgnigrSUlgVwPchmqel6zv41
         PgMg==
X-Forwarded-Encrypted: i=1; AHgh+Rr3CCEpbUafkU7K8aBQmel5p2SUsYvKHbZv/KMr4a0ye2277DSIQLeqCO7psohHofKkFb/q7F5ZhkYl@vger.kernel.org
X-Gm-Message-State: AOJu0YzugG1s9YiYw6WaKk98OjXNy5unHm+VTsM7Rl4qjf8zGxvWOweJ
	8rm/2rG7Itb1a2sPjtmxk3CHNRruVZdd4FdKd57CmP0TW5l34YmWvRMj9i4tNab/my1xxAdUKDk
	gQIchrakQEJYXUtyPYh5IoMgNMUrVw/Y3Mg+Eznjl3Jm7r6W73xcWgOa2JcUgKXZA9Pi/nd8C6X
	bOQZkV1hOkUpYIy1+cK9kMTKExRrtiHnwaOS3a4I+b9JpnjKCx7xqU8XX7LAodU5mY113IxQ6OF
	IeOIQXXI2lM0A==
X-Gm-Gg: AR+sD10q2MTTJw8elncH50eP5rE8GggVDbO1gN9/9fb+f1ps0cS3xNt1fOb7FFWJT+p
	Sc2Mv51JiflUGIRs+wFvq2DaS8sWp6VIl2LktbPBSf5sL/rtAQlDAkeljzIW7jl74ZJapvV8pAo
	BHKDNkT8pz0+y/p84E9xWh+qVyK8M+62dRYNQ4Jl9WCbm9ydA4ni6lOjC+GWIrziC59jiA9Mrvg
	vcjdozrbnWy67faYe00vz1oeAoW1t3OalPx9AqeFaVGLpo1iJdYICsShDWzSiJPY1rsic4xWyYM
	8p4rjGCYg4JLvFPnlOgqmaCp66mbmZkfdefCwf0GZg3I6y+zSq28iFnhKbtv97o60yPjGareypT
	kMd2F/oTesC8vmzJX6Q47jwLBM+YH5PAwkcUHGHyMGUjUoa4eZlhTWi6lKAfVd5SF81e2n3V5Cg
	8kh+vVXKzkbG+QckeJRJyOboAnFbFTig==
X-Received: by 2002:a17:90b:4d08:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-3933b6f0622mr329269a91.4.1786649149680;
        Thu, 13 Aug 2026 12:25:49 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-0.dlp.protect.broadcom.com. [144.49.247.0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3931cd54531sm1668612a91.6.2026.08.13.12.25.49
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Aug 2026 12:25:49 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so311425a91.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 12:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1786649148; x=1787253948; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AD+3lRL5dooLB9G2GOM1E1QrrdybWjnAoLLY1C5cufM=;
        b=WYVMu+nvQLwmkvBVv1lBf0Eu5otbP3r2IoT/0VHwky/JoYJYctIFJbh8kCwWvrQVcY
         37g9IR+j8JZsiXi2ONBZ37ZamBJXm+qxzWZ+TdKCjHAdW6i4QpHrN+JZD0Fn6hU/PoTR
         3Dd2N7SlgYJ1r7ac+iyjWr+Qx2E90hry6Xhac=
X-Forwarded-Encrypted: i=1; AHgh+Rr6W8kyYTOHAoYzWZOnXISO1CVt2Il2ViUVfMRmaLj9E6ww57KdnTmb0MFzP5j+YXl6H2XyfLdI88bL@vger.kernel.org
X-Received: by 2002:a17:90a:d00f:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-3933b8725b5mr327063a91.13.1786649148026;
        Thu, 13 Aug 2026 12:25:48 -0700 (PDT)
X-Received: by 2002:a17:90a:d00f:b0:38e:b400:a860 with SMTP id
 98e67ed59e1d1-3933b8725b5mr327016a91.13.1786649147525; Thu, 13 Aug 2026
 12:25:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427201233.380314-1-kamal.dasu@broadcom.com> <22348975-bfb1-42c9-9593-06215f961845@broadcom.com>
In-Reply-To: <22348975-bfb1-42c9-9593-06215f961845@broadcom.com>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Thu, 13 Aug 2026 15:25:10 -0400
X-Gm-Features: AUfX_mxN_P7bkMCS5QcW3Cvj_IklRaT571N5_-LofS2C8J0BDEg_tav23dcJ0A8
Message-ID: <CAKekbevRigjTVMUvbOsnU0rAvWZRZnuqhnxprujvG_k4OFC0HA@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] Adding brcmstb-hwspinlock support
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: andersson@kernel.org, robh@kernel.org, baolin.wang@linux.alibaba.com, 
	krzysztof.kozlowski@linaro.org, conor+dt@kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000d4eccc0658f2ab40"

--000000000000d4eccc0658f2ab40
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 11:39=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> Hi Bjorn, Baolin,
>
> On 4/27/2026 1:12 PM, Kamal Dasu wrote:
> > This series adds hardware semaphore support for Broadcom set-top SoCs
> > via the generic hwspinlock framework.
> >
> > The semaphore registers live in the sundry block; the DT binding
> > describes only the semaphore register range. The compatible is
> > brcm,bcm7038-sun-top-ctrl-semaphore (BCM7038 is where this block first
> > appeared on set-top chips).
> >
> > The driver has been tested built-in and as a module.
>
> Is there anything else you would want to see being done differently here
> or is this ready for being merged into your tree?
>
> Thanks!
> --
> Florian
>

Florian,

Since there hasn't been a response from the hwspinlock maintainers to
your ping from May, and given that:

Krzysztof reviewed the DT bindings (Reviewed-by),
The series is self-contained under Broadcom STB platform code and has
no core framework changes,

Could you please take this series through your Broadcom SoC tree for
the next merge window?

Thanks,
Kamal

--000000000000d4eccc0658f2ab40
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
H0K0rs+X8O45xZIUJlxzf5UZex3BLi1f/H+08rSQULWEtO/ECwkFod2DIzSX7fZdz5RQ1PpziEOp
goo/JZPYIeCmgt3rIyvMuupj8Ymb0J/velhpXfQuYUM52viw2nmqVcxCwBqyM3Iq7eI4xtEOFRmR
wxSizd3MSQMf6GCHA4/B/6ttnxhGAr3utaOU+x/RnzG0gPLTW1XRAQ0+GVc/tGFdI864OG1cyrRl
GvBnHJQSAFOIKwYrUk2oFpgMbafQ6osCAwEAAaOCAdswggHXMA4GA1UdDwEB/wQEAwIFoDAMBgNV
HRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcwAYYt
aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIAReMFww
CQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZodHRw
czovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwIgYDVR0RBBswGYEX
a2FtYWwuZGFzdUBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYDVR0jBBgwFoAU
ACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFOV9h+N/T9ZsJ40qRxh7NYYD+N6MMA0GCSqG
SIb3DQEBCwUAA4ICAQAKtKh30wv1/30230mCimgUjMWQE/LImRmyfDgrp2IhBVS6mDun+wH8thEB
WhBHQMz3gsGixU4ZBJG72eWi39IzQ7CGnisJwA0+hsGaGg03AVtFtqo1rXYRZ81MEDOb6BPYLigJ
RsHbNmrUGR+LsGeUwOWUeRXqBrYaYFrkgHKvVK1NEewv+vUY08n4tsezO3jq0HKhVDY46bMbf8vL
oQqqhtcQvu2+5FK2jpUayeubpzPwobjEG61RIhBvM0KivY4CB2s9A7qgjL1XBycAybIvG03BbFoT
t282FqXwk9JU6YihLlt+hpzO9UF7E8GZYlQlVIZOLOvytqilhua+2h77Yy8Jz/FJyIXKuaLPtvb2
SC2shL7jF28kQbP3QUKwAig+cxwbpngnUkd9D9cXSHVq9PPwYm0A4eAO0YQ/80Uq20+gXF++g0sy
NKrrV3i0T1dbCd86miGDKvarGzjh7pdsdwNY15liGP6Orib1tnWkJcbtP1rJty4r/mbbxcK8ILO4
IvTGFG6BfjJ+La0aRt69i1fQmjUWHLwzkLNpw9cJH8/MONZcEJeDkq9WELSyy29bagStk5KHu7NO
TH65sZg+i/4qmj3DEeEGTr/Shzp4YWSNn4W7NEelr0VgDlwa7xqlwZjXxG4MIJqy0SsQlAwEXtqd
nH2FpJfzgAetkuyU6DGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2Jh
bFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1FIENBIDIwMjMCDEca
ZUGCu6d0oT1M+zANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgaRP7S/oDZGkREQy2
oPehNZnI2s7W3MUFTE5kbmLMfm0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMjYwODEzMTkyNTQ4WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgB
ZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEw
DQYJKoZIhvcNAQEBBQAEggEAShxqZrNaF7+XBNeeDa+BRffFqdy2U4sBg2pzBzdoJkLUvz7YJu10
DFLP+GU0XgHbtPdjftGzuh2RdKymPa7p0ju/b1D2Ob0z0DQ7DKy/+HqKkPOjykSyvgvyg6UM2OGf
unfY6OtyFY9uj3BQY0caa+PwEVvPt4snurmcxZPa/9bAGS+wJqesoQ1NgZGMpX0Kj9D+iEzG7AAz
Rodv35D8OzVsCybBp28SKQv/dh0Lkb186JVpnzH0FMc7bAMdU1K2rjyt3A/xFiSAcT/f5xoKUK9D
EqdQcrz3czolfE6bpYc0djR+AT8SALSwCr4avg/gTVAMJMsycmzyZz9KMi/ayA==
--000000000000d4eccc0658f2ab40--
