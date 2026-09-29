Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EDA4FD783
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687741; cv=pass; b=Ew84PL2H7t+LpW8vbROPzIFrjJSqw013S6aAsksXbn2Se7Y+VZzEuJSRmr5lNCWzwsB7IQHyoz8tbVTDPLYvwhtrFM3lyuA3j2C8ydBHRiV0gDEPZry+JsaqNAZQXXC9/2lyVROPVsQBz1wFkVPWdIE3+0Im8T3/XVs7qbiLJhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687741; c=relaxed/simple;
	bh=T2NGlTdtIyg8Qo2LJnioguv0ZZ4l36GX+Rd94IJDCqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iryCUrie9iwlCwTzU1om9ZIZPOxFnDeD+dlu2+MIpXMRvzCB7wO5+jad3MFS3hnfScXSV87wQ6nmgdCF1NLe/MmeeY/bB6X7PxQPlC2xYukY7+RSSS8I3ULhiOUXgvUZq+1PEmBHTSKH9jbT1KaERhg5QSRdoSaPUPxjpckKzTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0IETqRM; arc=pass smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0IETqRM"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4b28d9537bcso546049b6e.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:15:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790687737; cv=none;
        d=google.com; s=arc-20260327;
        b=D+ibdiopeunHFIXEJk86Q9SYjpJZvWjvraHrBK/1HkhC91rNhDno0oJVpp2kFuAoOF
         vDV09dxkm6TvmRNwk0AGbEGLN9aavCcOy9D2EUz4CpPiyEsJjzL++nq2ZeE1auFS198j
         oG/PnqDe7TuD/x2xERKAVn8NJY1GiuJ6LGk9ya7XvearD+UkcxxTh8mvOadzfWAl6ih5
         zJh7gyj1o2jBTmO3dl6krlJgON1WOLJsYFf5azdpQh6nIZ7M/ai+oaNqm0CYXEF6f+Qz
         Qmd4yZLNOvPl5i0gZZIpj48CvPnXYPJs2J6wiJc3N16Y62YabPqkpXYzCIbBSsCAKNPS
         2gKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lTO9yBJ7Sd0NkFEBQ/8VjEUd1RTpjAiKlOI1jt7xIy8=;
        fh=KI5ASrB4yWF9UzGY/OrdoYYtCeeG9XmO/FCtY1c9gq0=;
        b=ng2CK3hbUXXuOLOyVdHfab9OiFYY7ZFtmL60CIUJNNMKXkrK9y5K+Fh6NdrQZNUaXm
         dqBpnosx7pht9RclGInt89zXLjb5iX3Kq7GTHFv+1+xki07UL7960+tggR8wDtFNi9js
         1LyR2YcVpdWKJa9zSUyD4HlYJW/lVSImiWM1c1hyDDErF87Dt6Nid5HSY+NHEvHiIXjA
         ye0NWTtr6DFSVkPQ+9BXTAP++TxsQ49FwUJIkQZFuNLtZgvLPMj/+/HTx+EAz85jMZuD
         pE+tu+z0ieWQKwECHLttZSnk8LXfoatgRkYBXWZunLD2xtfFUeVeKOh3lpGhLjaDOb0a
         Zp3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687737; x=1791292537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lTO9yBJ7Sd0NkFEBQ/8VjEUd1RTpjAiKlOI1jt7xIy8=;
        b=b0IETqRMTvljeA5WJhWR0ckZi0bSphVRa94W0FBlgA/hjZckAv03THOOYdMhYVAEnD
         IKsMpZvC4carVpTV6PQqoVcmngRRRI8mqPE6yf2IuvLG11PanH31PI57OR9r/hSZ9a2B
         pPyI3dVdZxmVJ29lb0xajyxRV6/kKq0MPTGt10MBvUfR5Xsi6f3wULDYmRg/MDCKZrMe
         hfJw7cllKdKeCH8tloON7JqCTX68wV2AQpVeb/KNBj9vCLgACbjP/D64JmcVCSMyK2l5
         HT/C76UeMEKfj+pPmhqBk1nfTKGkwd/VNqAFyfw4wBtXHhja8Bjdj5gJg6PxiYjZTFc5
         KSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687737; x=1791292537;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lTO9yBJ7Sd0NkFEBQ/8VjEUd1RTpjAiKlOI1jt7xIy8=;
        b=h0fSnM5K7E/5I8NwleErfmGGzsPmdvObOUbpps6CLnLVXygLZxzyByOUlGRBkhUK8h
         S+m5ls84QC9FN4+Ljs9292oKCQD7pmOucJ2QAa8rY1OlZA4x4xAVnMUbEMYteaV+78kc
         Wz46dhFIr6RkRFRq/+aPfn3MXS8IW43wyuQt+djnMj0NLCaOwYCMPrZmNviEFGTHUMzz
         RVBKezoIBMPmOgqZy6yoraV52Q3Lun0UUOambAHFxZNPyWcMiGiZwwaHhxNtNZfR5vCQ
         4XpP2XNttJrbY5kVHId9MclZd+rljfiy2fWxxRQ8C+ZI4iZ4dHM3+OkJZLrZMQ/HoBd+
         5n/A==
X-Gm-Message-State: AFuF++kFm/Q2VEwLwvXsLUcW5NS9XdlkEpdkwa5iVyPLMnXQJ15D2VfD
	K95C5mMMBApxfR9241HdU4dtzGz10z0VWf0QJv0oWuTRCFZ0jx65/b4dfgIfQwCg/W9A/VxH/N2
	/DMqUm0DjcXAdnR4dfjPwcawuYnmI/r4=
X-Gm-Gg: AYBFou0WMUWp69nWUDromHVuFm/KzYc2MEaqglct4BcM8GOTOWzFMeWE8cO3mPBHBAH
	Yayhd+Z4eETlhGjOHQ2IX3tIjnmEoIb/s/28n3dJyensXESB/93h0mLB6YB0jRq0Q/9mGV5h6gO
	3QGIIICiVBqbMq90N6l70jjWecjbdUdsYCmtdfKvLvJk4OXtqXp2fPbop3zrPox7zWE7SdcCNGk
	583bKqYHq+Ri6CREhlXnOYEiZgcGt42XUzmqCVN76OmGx530pm1D2v888ql3aGJ/ovZAj3PEMM1
	KVDzV9b4L+hXksjyVJgZqyEdUOQKT2yEEKLs87XhfU6UJQVXmW2lWGJYL80xdT3DKuU=
X-Received: by 2002:a05:6808:15a2:b0:4af:aaca:7be3 with SMTP id
 5614622812f47-4edd8a63ee6mr1681520b6e.12.1790687737021; Tue, 29 Sep 2026
 06:15:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729114312.3947300-1-chou.cosmo@gmail.com>
In-Reply-To: <20260729114312.3947300-1-chou.cosmo@gmail.com>
From: Cosmo Chou <chou.cosmo@gmail.com>
Date: Tue, 29 Sep 2026 21:15:09 +0800
X-Gm-Features: AclHuK-j6stgU1xbuVvm_ryZxtRewkbdHTBcaeY6_Bm9ZHOE5XgHrwabKhmUtJA
Message-ID: <CAOeEDyvbuRHXfeO989dvV06e=qoAYy_1xEgnicL=X44Q8YjuFA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ARM: dts: aspeed: bletchley: Cleanups and second
 source devices
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	cosmo.chou@quantatw.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Gentle ping on this series. Patches 1-2 address the dt-check-style
warnings you pointed out on v1, with no functional change. The
sashiko-bot findings on patches 3-4 were driver issues already fixed
in mainline and 6.18.y; I've replied inline with the commits.

Thanks,
Cosmo

On Wed, Jul 29, 2026 at 7:43=E2=80=AFPM Cosmo Chou <chou.cosmo@gmail.com> w=
rote:
>
> This series resolves dt-check-style warnings, sorts I2C nodes,
> and adds second-source RTC/LED support for the Bletchley.
>
> Changes in v2:
> - Added patch to sort I2C device nodes by address.
> - Added patch to fix dt-check-style warnings.
> - Carried over second-source RTC and LED controller patches from v1.
>
> Cosmo Chou (4):
>   ARM: dts: aspeed: bletchley: Sort i2c device nodes by address
>   ARM: dts: aspeed: bletchley: Fix style warnings
>   ARM: dts: aspeed: bletchley: Add second source PCA9532 LED controllers
>   ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC
>
>  .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 1317 +++++++++++------
>  1 file changed, 903 insertions(+), 414 deletions(-)
>
> --
> 2.43.0
>
