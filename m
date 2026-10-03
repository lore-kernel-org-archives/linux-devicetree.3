Received: from mail-lr2-f31.google.com (mail-lr2-f31.google.com [74.125.230.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD093BC673
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 09:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791019527; cv=pass; b=CSn3atpSTCcS5jMhGhi6jjJhySlIuEmyD2+9OMhJYvWL5R7b2FsiUmzAY7arhYFzQ2Auc/OVoUVsRPWbmQy5bo2YQfY6lvsV5Zu80Q2e6My5cVoUywu/Zs+jWdRQ2p9CIhtx4cI1Xlrx5xC0iDAHNiJUkuK/5R5Q0OaFKbR81wE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791019527; c=relaxed/simple;
	bh=x9/9E3ufoV6jMPYJqbetP5DjLiiHxkuNm+gHzjxFZbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cgla4fhu59HtNKsAOCUXJ1Cfg0pUrpYa/DRDBxpm/c1wk8A7ikQPgcVYXya0wIc+XISyXJIiCGg+09VQfmeImpl24H1KK9qNSck6G9jocGVRdP19TbRZEzhfEXOd/Y3AUE71KS1IsS2mwYTEB1cuZh3cl2Kea1KF1yCVUisusvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMaPDg6l; arc=pass smtp.client-ip=74.125.230.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMaPDg6l"
Received: by mail-lr2-f31.google.com with SMTP id 38308e7fff4ca-3a49e560a98so1196131fa.0
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 02:25:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791019523; cv=none;
        d=google.com; s=arc-20260327;
        b=GthPaBVtDWFNYkd61K1KP6l8ipB/avmWLUiZm7wnLPMjgJuMezvseRhC0XImyWcdLK
         EhIDVuz4o4rjKtb/WK/DYHD3t0yvDaRn6FArW7OlEKVb260o5dTbQkAiLxThpD5B7XYH
         0vTXvLPJofBScamGboTDNNrXMtl8/ZtKl+Jb3Y/ASqnWJyUHJbDqx8IPvwbNXLfe0j3E
         Q+fGCdQwWrfdsLUsPOVJDO7ZV7DMLTe7j3a+n45a7vKnTKl0yJuIS8ITQjz7UfNLG7K2
         eahOXGTlz0zhMb33WDjSamzD9CNosT/XWL7k9oQNFHp/71jJzNm4CcpVu45zBaceNR58
         oKlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x9/9E3ufoV6jMPYJqbetP5DjLiiHxkuNm+gHzjxFZbg=;
        fh=ZE1O7jB8L030p8bA92sg/8Jueoa6d1d1vKrjQQcDTvE=;
        b=AVKdDJXYW2Pcwg3SBNOueYQhxAdpjxTGYPYUGh+wue0zUnIckBjZ7rp2yU45NxGyjU
         ag8kCYL4xBTrEpgGc+SGsgFRNBY2eSMrb8VNZ6prufvVN2zy6viVGKB8eu5+AFufFYtv
         6qx7lvVew/IUyEPdgo8+8lZRwegQ5a/QzGVrId/JmCV3dz2EH3HCCu6aS3U6TzpQWlXL
         cmg4sWTuaL+ZDsCJK5gl5EN1EBpzA2NyCZUhGAMLi6IsLIa62J2XMBT0WHRK8KOtwkXw
         QmSeZtsgPrPQHoz1JVgafXy6PEcQguZxnfuQ5+FLORB9KUPxRYr0xqBYdjOHcG+tUy8M
         VInQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791019523; x=1791624323; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9/9E3ufoV6jMPYJqbetP5DjLiiHxkuNm+gHzjxFZbg=;
        b=lMaPDg6lpNv6sIPBcCN4PH9InwlKSOesw9JaWuQu/C+XTKlRv/RbRyZpSPAkxX0YEP
         m5pxRXsWaMpzKawARloQghvt1U55TrLqYcWBPhMHdeX2E7jQC92ROWZVDPdt3y8+nf4E
         wqgTSbO0mTDR7myzCFJ7A2z4gfAh717UVhGSNDtGBrccud8MV/zc6ix/1yIMlBMi15UL
         4wTRIpukI1mZRm05bbKpwm3C5OncnQPyoJpP8LLpf6Kg23PnsUxbpgoNfz/9GeHdraUD
         RJNHNXdTJibzJCN/wfkdW6mLIiIv4mTP+8Ww7noHSmed/EAdEqAEc3/3Q8C+dnFhIQuO
         wxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791019523; x=1791624323;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x9/9E3ufoV6jMPYJqbetP5DjLiiHxkuNm+gHzjxFZbg=;
        b=Frd615EqxQlNmh6sJsv35s5bJikOzPPVB6E847y+Vvf25qG4BUPjQUv7/UMoUn7erg
         y+3KcuVjIhd/DXOiKko+VSblyk00dI4BlGCuxkujDKiBwjxRk2HcwdAbrUwq+V0J0sDo
         7eZB1TtN+//xLRgBiI6JoFzShqHOmeCSzbxk6EoaeO+qkUOkexEMMHpTL6sjFtSCJqAR
         7/b6ZYYnSu20a0spNCP7huDWffI1HhW2Ie5UJC9LDS0pDktZQZYRrzksSuPouLnD8cLt
         2Sco7G9yKTQIG/gZXgm4e15UEIQNk925NcHYa4HflTwj18BnRSEPz6pdhwUHpQIYtfA9
         BxQg==
X-Forwarded-Encrypted: i=1; AKwUvByI6xbs47oOn9/2eke5dqOZnOQHLwqiSLuhkot15odDBQJgOb78fIsBdKcogqxEJ1WN9aG2NoTwvU53@vger.kernel.org
X-Gm-Message-State: AFq9FYJeIKGurbr6GuhVZLLKRozzzaF+T8pc40Kxutptrh7OU42fa/FW
	LmebmevNbvGA6wlQntuG5g5tdjOkehfC2yXTJj1Ha1on+jvFcuIVKdUtDPS2+J8W2Poua3b96BM
	+QB67yDuOhP96vwZSG8QJhR1t1c9zVFM=
X-Gm-Gg: AYBFou0EwV87UhK6B4stgeJv4ZrMWptKJcZ8X2KIUCKBKfgBCVypGIx1M1B7pKKNcRZ
	4+42aQGFJCpsopUQtcO81fmn6DItD9u7GzyuQNGGqzhcXZi2e8MBuWMTidTbQEW4YNFyaXgXR3k
	QUnxBf16F9zG6HlDCy26huVc3hZj7Un77lRz3Rfy8BUkfmfjlC70uwmCaXksIU9LJ8DkKuDLdLH
	GtHaeN0/SsBn/2g36H+audhYqSGPMdcG+lN8gp5zyoRR+At8gbW1DR4nAru9IPoKP1r31Vn1OYr
	Vs9cP1iJp8t84pufHwejFDca+xvqT0Py42JEwAsnZAxmT769bbI3fHVJStIxpcMMw9Qmh/1YHA5
	EW6+7O0FViCFvDtZ1u1/ioda8AL68JhS0IdEg
X-Received: by 2002:a05:6512:4011:b0:5b8:ef9a:40ba with SMTP id
 2adb3069b0e04-5bb9bb1132dmr1845311e87.4.1791019523088; Sat, 03 Oct 2026
 02:25:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003084627.353899-1-chenyou910331@gmail.com>
 <20261003084627.353899-3-chenyou910331@gmail.com> <20261003085118.1D0351F0089B@smtp.kernel.org>
In-Reply-To: <20261003085118.1D0351F0089B@smtp.kernel.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Sat, 3 Oct 2026 17:25:11 +0800
X-Gm-Features: AclHuK-ZzjOilMOUUbSeHgJLk7Cfv53pwgUKF_b_qOYPJ-oKX0eccz27j7k28dQ
Message-ID: <CAKspUh+qp3rVdO51fBFdmKZd-jifHp+47-u6EbFgZtE392eWKA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node name
To: sashiko-reviews@lists.linux.dev
Cc: Conor Dooley <conor+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 03, 2026 at 08:51:17AM +0000, sashiko-bot@kernel.org wrote:
> The commit message states "Rename the node to ethernet-phy@1", but the code
> only changes the unit address from "phy@0" to "phy@1", omitting the
> "ethernet-" prefix.

Right, the description and the change disagree, and ethernet-phy@1 is
the intended name: it is the generic node name for an Ethernet PHY, and
it also brings the node under ethernet-phy.yaml, which phy@1 skips.

I will rename it to ethernet-phy@1 in v3. The internal_ephy label is
unchanged, so the phy-handle reference in gmac0 is unaffected.

Inochi: the only change to this patch is the node name, so I intend to
keep your Reviewed-by for v3 -- let me know if you would rather look at
it again.

Thanks,
Chen-Yu
