Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EE93F8896
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 16:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779120786; cv=none; b=mQbWXggjcSMpV78QkdlQFmEuuoBDT7dPVAOIGr3yv5AyK0WnHK5tRh42VszprblcK2Ug1ytd+zIGz8e+LMQKW/S8iNotnCJox0qJNSkQrtxt15zw9kZTcu6poLkYKHn9V2CxuoUFgqI+A8YgYcFMFD7Gu6ZR5mRO+8xmKaLpx6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779120786; c=relaxed/simple;
	bh=tPH3UHYA7l8VRAO21OcMYyZqTzp2i6IfDEbVAUhWAfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WKad7Zbxn7MdlNSvSZ3eT3+1htL7W/mXpgGTXRb9Znm6rm57VSXjf+kyWe32ovF9QnZwSPNCXi3mirs0J985ABun2VspqPL54I1M0klzTCs0yYsgqZ3C5StKnvXT8dyOmMkSkJ129Qa2bd4gcrh67vpskImKZhLHVTvcLrgVGvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgsNZTb2; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgsNZTb2"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4824176bbbeso701490b6e.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 09:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779120776; x=1779725576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPH3UHYA7l8VRAO21OcMYyZqTzp2i6IfDEbVAUhWAfY=;
        b=HgsNZTb22jNmqWagPBN44KVFwVnrPPFeml+BTVIw4P0WjfCHKiX3CqtAlL9B4kP9u2
         pGFbxOhnjoEcu1/EugMxxOWatyRB1xp4PI4MZEwkBe8gQWDNhijq0b/SF+7Ium4YyuXk
         G0n3eiKS/psSxR/3xZBn6rs4QdZIgpgO6RzZrId1v7pk+uDVuEgsOiFHtFDqSrS/tKcW
         RzoaoWWzHfxzhmuqsVzy76XUQrrFTzCBi2Mv/I8wA9lKBnNWjwrXtNttf81dwnHCSVhC
         A/C6oWCGLufwWPT+XtTZtR63qnxO72UUzlSKCErD4xpwmhW7ACBGMB/PzcBlSndvAQVP
         xukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779120776; x=1779725576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tPH3UHYA7l8VRAO21OcMYyZqTzp2i6IfDEbVAUhWAfY=;
        b=oHK22GGtNIVfnWPV9p7D9u0ayL7QDS5HIDzELEkjwA90dshDKyFqQuY5O9XMJhSOYo
         lARmQ+MCKpaBUTgaHIhSv3h0QgB+ZOcZD7ZvmCowLxvpt+W191W/GMaDujBGa0nJtFZZ
         9UiqQDlHhZfDFlkq6tVb0EEGIHJAT1NCJjZu2Ek1YHyaEDflFunjk5+JgMS4nB/bIwGh
         HctcyY/eJsJ2mxQhsVC5BTfL/SevJP175X96PrhNjxNnQ6lAhS98In1BsUgt5b5vh7oM
         tR+TVU9VAVhsrPzV9SRmwSV7BlkTrsiTYfill1aRy1/NpBOKzCBcD151pZuMW5tvFQfi
         Th1A==
X-Forwarded-Encrypted: i=1; AFNElJ8xHcWoGDYZLsupn6j8DrtnmBI2C/lfFX5tOyrmTwFx1fA2Vrpx/METGku3gCOJFmT+CmzmouFKyM3l@vger.kernel.org
X-Gm-Message-State: AOJu0YylEU4N08B3ihPmeASbpRuSJTE3tfIWLdNOAuepAryWOaNhoG3q
	2en2vRBwtLQccy7T1RqybXKjHrdXHK10LrLEx9GN94itMeNfxq3fOblH
X-Gm-Gg: Acq92OEi+zM9ulYt9S6ZjtxXZBhtdMPuzXnRFPPWhEwYU2Xtyk9fJuzR11QfRLXATw5
	wC1uyyPED1KveAhLDzpNXRViLKh7DnuKpL7UCg7+Ov5ttUWiENTMazSQ+Tr91Feqk5FxpuVCF2e
	mrszK10WwbDFaavd2FziBF4qcS8ui+vT7hjc5fJWJM40BgygvdgAVygbhcfYuqSyw6jQHxPUj/g
	INgqlVx6HVAXIabuj5xXNhKgqTs6c/dkehe2mnDidlMGySkkvxU/7fSlvz5tp2ELXZ3GHLkcNFH
	WimLDDBJHF/lylh/7kXR7ZlIXRxwhNTxeycGyRmbXGF6afOWFy0J8dop++x7D0csgZc3r/oDiLM
	oS2Rm8B3C5nzHrtj28t0xi2TWSxz3PxX2cEP+i0J9lt80/VCzbs+WJY8Cx+IYLgb5kbbKZwfhcH
	cTrmUWEKLjnU/IHAIF/2PmVBV5sdJ+j2J12vvGToFMUACDlaPvKOIOnGimRQumcVvO
X-Received: by 2002:a05:6808:e693:b0:47c:6c99:f20d with SMTP id 5614622812f47-482e57ad3bemr7154228b6e.40.1779120776293;
        Mon, 18 May 2026 09:12:56 -0700 (PDT)
Received: from Dell.cheetah-searobin.ts.net ([108.243.219.47])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-482ee531c50sm5244120b6e.14.2026.05.18.09.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 09:12:54 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: sashiko-bot@kernel.org
Cc: akash.sukhavasi@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 2/2] dt-bindings: usb: richtek,rt1711h: add missing 'port' property
Date: Mon, 18 May 2026 11:12:48 -0500
Message-ID: <20260518161253.21655-1-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518144521.0A681C2BCB7@smtp.kernel.org>
References: <20260518144521.0A681C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Is this port node indented correctly in the example?
>
> It looks like the 10-space indentation places it inside the connector node
> rather than as a top-level property of the rt1711h@4e node as intended by
> the schema update.
>
> Should it be aligned with fewer spaces to be a sibling of the connector node
> instead?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260518142901.1747-1-akash.sukhavasi@gmail.com?part=2

Thanks for catching this. The port node was incorrectly nested inside
the connector, moved it to be a sibling and fixed the indentation.

Will send v2.
