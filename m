Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F60474247
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 15:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191526; cv=pass; b=oLr9VXPW+2WhheDq6ygH3V5q49h66CJ/ybPUY92NVvkMoSsB3n7dwTe6FVdfiyVTkA0pgXgat/iqPb6KeTfECjZZcsbHqmX3uu1cBXEbxjnJ6uaUoc9KRDrJpwDdw5AqHaPeRzOljKj72/ZPqt+pQzi2UpsIpMnSRgkOKVrQ7SA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191526; c=relaxed/simple;
	bh=yIMH67iFY/zDCqJa0/kWLUzmpSflEFAoQKZH6A3GiNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jjB/Xv/0ykPj6LAgyXuE17xvSdXz9flMx0vbJ2J8CWSVpCOmyGpP4PGU/ZLM85gzWp4VHo4fVpy4jZs9hy16tNBiOu4hjf1bdErfstIlU29x5QDW0bCEaTwG6kgsKUeaVPyzU9m6NanJwY+zbABBelZphCL31aZKBJE4M0pt0jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LY8a6GUf; arc=pass smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LY8a6GUf"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso3220214a34.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:52:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788191523; cv=none;
        d=google.com; s=arc-20260327;
        b=KZeSKEYBUvFRI47dXI9m545uJafRu1RI9S3LhAtZh8BNx/HQ7HrSjs45uiY4XdYHa5
         e7xE93t+jRYVETqpQgTl/8GYWcaBw/8gkq68IL1GccYyHLHzre5A4A7NUdfETfGV4zDb
         ar/n3tj86w0uJ6RVrSBcf72NHsy8yhG0p8JLargT2bMRRCwdH8ABBnFLg5Bhz6hGZkcL
         2/KPOXcRLG7T8IVskZgB43VnjZnxtYGy9E1GUmCmlHwr9s5fQFrS+LBdJTRpZ9UezrBl
         FnMjCOdeRwMnRY0bRN5Y/OK5j03NoM21XDpOvm3KC2NCZ+DimOc1DTf7ulQkiSyNs3es
         LhfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gv8LTcghy3tRcsgV2tnBunUotldPm+945vyb/VPcFy4=;
        fh=3T1tII5oPbOP83/VCh9cquGfFU3WW2WD8s/dlP8bPb8=;
        b=fGAJ4IU6D1GhQPpmbjIDfGldTwzkxocB0unKUqlInZeu6h3ffex9OPOtx31sB8Yhhu
         oqImJWsO5vxJuSJ4nlYrzcieCHWbxfgorYDZOCfPixQdGcKKKf6tKwzbYKNhu7ELSxvJ
         I1BmnoxPTdU9T9qBlGG3IyIOU8GM/XUw8f1sT9BOKStTCRJEnJwgzNkYSexjjb5N1U+D
         yhrrOJmAYfGn5RcpWCC7eBb1WCzLLvWVvKp1k/QucDNi7li++u/AEv+r8/7wmk5zlr5J
         K7KVNc0ZGFgwnI6hSfpSj/MBT0qG7s4KzbS2O4adLRMT9J1zEHmdN2Y8OhiWzkL3hzwY
         SghA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788191523; x=1788796323; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gv8LTcghy3tRcsgV2tnBunUotldPm+945vyb/VPcFy4=;
        b=LY8a6GUfSW1WuFwgiGseITvQUyDv8nqvd9hLvP0fLzH0DI4shTBICIQ9YsUow0bfUE
         mreHwf1uGsittObwK++MrBy+qpEdTTaZDx6znpbNsW0/wcKsnfUx8xBg0LFJN8JwzqaK
         6NzE6uCNTIClKSkWqLDsZ+QMyIHQnX74YsZJ2SzP7z7NBvuzeqLFGMucTApIYR14nYFc
         frlC7RegaEBS+0jutVcp4eYSmVTGaVO2EuQB3lXFeGeSTxASHKH8OYSTJayVxJWSR2MU
         KH+gvr7m97b7j1cGJ6euZwddyGeJrjOPE6j5zkAWJx+inu3Uk+wBw3VHY21ccT1E5vcP
         OArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788191523; x=1788796323;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gv8LTcghy3tRcsgV2tnBunUotldPm+945vyb/VPcFy4=;
        b=PqvWzz0Y0M20nxmVSWO0toobA73mqeBbwbQKgLe1IOAzpgmoJ6lfpbi4pMktgMm60A
         2YdPqdgJGhau2F+BYEx4raf0i6KiS8+IYW9Oi2mL5xSFf8ATwk/m88h5NX6uA1ZYPSpV
         g+iLce0ve//Ybr+WNWBjyqGyPQjKktc95iwKYn3FmlKd/NxKYZtDpRGOPxKDyyZnRoiO
         m57KINJBZCzaP2zxkBKsdjar2akf0oNuyHHUQRIUQhH9o8posgVtk60+uh8favOapkoB
         7JDrMbgRFEeGKmDoWbCXax+H2DP1PkT+kor6dRAEpOWUxnl84GdHI1rqdUe1ik1GLlSx
         hKMA==
X-Forwarded-Encrypted: i=1; AHgh+Rqct8vpN9t4xFt2c5u3NbHmsdiLsUvas/Aoo9jDxVVgMdvOL8Ph+EkOJbFpjaC4NTNieH61Gei+LIdh@vger.kernel.org
X-Gm-Message-State: AFuF++kNudIbshF2DRvSKskT/sGZ09Cxtzs+/8LGzlKxG6upSUlfu9U5
	AdU7V/StoeUQXbqDsBcRQMwmNFg8F0J4+KUs5qnsgzQBkATOWbuYmKBBb1mAayjugA8LJPQudfZ
	36zGhcmG2jFUxyscl7PKUWAu9+5+XC2jghwBwKQUUo515
X-Gm-Gg: AR+sD11G5GYdq04qfn5jRAgns1MOY9W1jqIr37I48Y2s8BA/CKRlpxcQBKzlRhjGeqm
	rsIfE9S/v+4hhVgJw7hbupysDsUQ0XCBEU2mXEtC3ovRugMSIUtNMFCtXEUv0fZrFzDJsRlrKjs
	1cz5a8Idwbto78t6WEMnDSYyiUYm3K0j3jroIVMc9LJIz71C3yOY601FmxV9xoR3sNtFzM0Bfsm
	lU/zbWCwxD5V9Z5U8RPhZ5akkXfAHzq+OO59rMQW8DB8e0g8AG8r1VAsGT7T8OBpicW2O06TlGM
	Rm/H1BWo8ywrcBpTyieXwRO2+AAtMzPjGEhY+pCKSO/a3zIWk0bz8XhI7OQY6CclXJy5Lq/Vwqn
	W
X-Received: by 2002:a4a:d1f9:0:b0:6b1:a667:f0f5 with SMTP id
 006d021491bc7-6b1c673c239mr19248427eaf.20.1788191523257; Mon, 31 Aug 2026
 08:52:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829-surface-pro-11-volume-buttons-v1-1-ace589343a68@gmail.com>
 <6f33aa1f-563a-4ad8-8c81-6f64fb64f6be@oss.qualcomm.com>
In-Reply-To: <6f33aa1f-563a-4ad8-8c81-6f64fb64f6be@oss.qualcomm.com>
From: Dale Whinham <daleyo@gmail.com>
Date: Mon, 31 Aug 2026 16:51:26 +0100
X-Gm-Features: AcwNN1VVfkTEW1Bwp9Kuf4cVK9-fWlNN-1KBCKmFxG5U1PmIDQuPO0voL3CHcBo
Message-ID: <CAFcmK8j09=tGoEUnFwzY+8Te=dBGPBr=pc9C-3dZGwAEorOi_g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1-denali: Add volume up/down GPIO keys
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Aug 2026 at 08:13, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
> Let's order the pin nodes by their gpio number
>
> otherwise:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad

(Resending as plain text, apologies)

Thank you Konrad - how about the gpio-keys { } section, should we
re-order them to:

key-vol-up   { pm8550 6 }
key-vol-down { pm8850 8 }
switch-lid   { tlmm 2 }

Cheers,
Dale
