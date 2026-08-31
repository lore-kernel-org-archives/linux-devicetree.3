Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A0C3A7F57
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199871; cv=none; b=ManM7etBu+yeyM+wTmGl4kaTyskWF1Df47/EuA65tigoW4vH0H2sKrMq16+8bka11jpTgE+ZfCTBM0SBodbHiXhchUki+ujo4dmlH0Ykm6EeLNPLyhQ966cR4VlTRM5doQZZkTeYezrB2mGue1yYyvMIvezvDyHa/ZGlmIuxVoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199871; c=relaxed/simple;
	bh=JSKfE3C5hEzTaLOsncNZxFU8cYHA1de8CIzwYuA0+Ik=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oD38j2d8zhqd/m87PBokNqxHJERsfR8xF4vz0ktEUjZoCoBEm36L4vCY3OwvYNAU70h3IHxG848woNYtyrUwYt+qd8SqACKwCxI4B0f04fyVlYjYAtyeV3ZvtFIGd0tAYNNUQQPROkUH2K+02KzAIP9Efg0LHZQKBMF9L8BcQ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jfVSY+Vn; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jfVSY+Vn"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc147d86bebso221612a12.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 11:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199869; x=1788804669; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p9iKASRZYGsmUrW8F/UJhakBf/TxAKXi0Gw9hlqUJM4=;
        b=jfVSY+Vn7NyUew9E8Wt0ktg0nHNSUCOTtdu+pChNuA/N7/u4S0e5bPCe3HQyUoGZ80
         kqTGjnS2d3iKkw3shuBS6fGi4b42/21uimnPDlHLUrFJqm/sstXQqQn/FUdSO4+qV2QE
         DO1CWZxtTQsxwsdZjkFBplW4wG5q4lmqMfevX5LtDbSciDbWLT6m8/UfOuI1mhA2zfdt
         8TvKQh1iFK3SukMGKj9Lm2zspfUO0v0TDhHqx5iwPaUS7DYDVI50FueJqqRStDPclZMF
         4DTNrOIfTu3y6FYYo1zrK2L8RpMrVjHy0jfvcrpSmUrgOsYX4AgVBGeecgJQNeLiukNI
         YDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199869; x=1788804669;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p9iKASRZYGsmUrW8F/UJhakBf/TxAKXi0Gw9hlqUJM4=;
        b=Phii6KURphlZLX0YysqWxS6oceSxZWoRjUX18z1zdmLZ+/Bo2sZMs+MD3Q26h8KCVP
         3smOvQN5gRCLkOgTPA1hDom8wcPeW10eu0+xoyPXsmfUAGTTyR3lPncfQYn3GvJ0aSTC
         5nR068gOppr97kj5UbMiiIkgfFhrgARNskJ/XlTC8L89H42SfMYssBA+xq4AHv9moV6g
         KAtvrZJt05WkHqtmRjgPF9ccUoRJXxpcVdZm7A9SJlTqzM610EqvhnO0FL9uca4yB7md
         UrHp+rzz+/lO4JhUEeo4TA93mOaLAPLfEJ7WVWCGJdRbh+H6FngFpb4qHfqX1PpYH/SG
         ytyA==
X-Gm-Message-State: AFuF++nzVToq0FfKYPUqjSf/Y7lbmGzmsvV+4KikcnhXwpgVNNWps5Er
	BqTJnUasboVpoq7RaTKDZ53NEk1jdOaGXP7+e3Q4/b5HllUgiqdrbhumZWrMu4rR578=
X-Gm-Gg: AYBFou0kVdLiNSABBu4DG6n8kXqZkcXT1vtwd7I5KYKaNZJSSMd7aZ3awy2gfGMz6M4
	RlO/w4kTdiMkdTeFxfAZQk+e5T0/3k7yhk27ACxG0Jbr1Fxyu50GpaI1DN40qNbj876BG9MYEdK
	8EWYd9GnMFgwAN7ixi6zo2lV02ZwXwOMQCbVt2XXoZV0a9iP2qVROfuNKD0AIbjUMv+pKQs8Ac9
	JSsdsB40MHQc+ijPIveb3ZddoR1aPDp5CkYp7Mwd7tGDmqASXPOvkudTJkZE8UfS77fzTO8qYbg
	gw4sSalTDZ7AJj5lpgCWBpz5oluv5ZGa2rLGDmlU9nIm8gWKbQz3NdXqsGc2CKGF6Xsz4IY1Dwm
	QWqIU/Vsw+DzTzjV/Dz1X6fY9Bgu/38Fct87mVFl1ffbRdlUAG1YEgnSa42IdsBuJKQkAJf4GNw
	1K25yil3lVLcscKFhYCV4SgpqKqZ7TCETRks5jvw+93YOTKLN+TlVpsjaBqQ==
X-Received: by 2002:a17:90b:3808:b0:398:ba46:1d9f with SMTP id 98e67ed59e1d1-3990f88aabdmr64927a91.13.1788199868925;
        Mon, 31 Aug 2026 11:11:08 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3990d76622csm765959a91.11.2026.08.31.11.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:08 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org, tony@atomide.com, rogerq@kernel.org, andreas@kemnade.info, 
 aaro.koskinen@iki.fi, 
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: Julian.FRIEDRICH@frequentis.com, upstream+omap@sigma-star.at
In-Reply-To: <20260716113947.92513-1-david.oberhollenzer@sigma-star.at>
References: <20260716113947.92513-1-david.oberhollenzer@sigma-star.at>
Subject: Re: [PATCH] ARM: dts: ti/omap: dra7: fix PCIe PHY clock divider
 definition
Message-Id: <178819986814.2869653.16668434348928229188.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:08 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Thu, 16 Jul 2026 13:39:47 +0200, David Oberhollenzer wrote:
> Commit d0bdd8bb7f35 ("ARM: dts: ti/omap: dra7: fix redundant
> clock divider definition") removes the clock divider definition
> from optfclk_pciephy_div, reasoning that the table is redundant,
> as it contains the values 1 and 2, while also setting ti,max-div
> to 2 while ti,min-div is implicitly initialized to 1.
> 
> What that commit missed was the fact that the values in the table
> are in reverse order, i.e. first 2, then 1.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: ti/omap: dra7: fix PCIe PHY clock divider definition
      commit: 2fabd2f406d0cf787be47b3bbeea99b30004033d

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

