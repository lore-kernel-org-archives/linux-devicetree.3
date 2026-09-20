Received: from mail-ed2-f43.google.com (mail-ed2-f43.google.com [74.125.228.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6154C3C3F5E
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 07:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789891174; cv=none; b=ckD1Qxo/SPNml39a9PIM9D3TdQrcLHcteC0yeAtAMKYQC8e7AsEVgl9oyYIoAniXVjHiTjJNlZzXn+Lp/KiJ5CkVGceHALnjcgY/JtKcxEpm+Jq1OSqqhc6uwEaPHPhU93xE15yEto0BU1MtQElC/Tjm93iRnOmI9jyc0mpmems=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789891174; c=relaxed/simple;
	bh=MushP0BP84JPKDkP4tcmQYX02zkFyL96kfoP8AAE/iI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4M+Wx/e4Xk8YXNHJ7h1e845o5hFFVjBa7+BELSnEi/ExZ/wTv7cNp4u3D0/GVNqGs/ANufW2ar3zScFxdjzthRwe+5WY7YEIohhbUQNE0xpYG6Re/+lBP+yhHsQEub9uBBH1wVFw4VSomm2mZwr5Gbk9NwrpQBnzx8DqEePRGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=HTFggdJy; arc=none smtp.client-ip=74.125.228.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="HTFggdJy"
Received: by mail-ed2-f43.google.com with SMTP id 4fb4d7f45d1cf-6a9ba73bee8so1473147a12.0
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 00:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789891169; x=1790495969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WC80XTsVol38lfzk3PmAIywTUQMAl+IhwVAAjehmhu0=;
        b=HTFggdJyf5aQwEo+IqMi4EUDmhGmILxCDxiBOAcg9Gcx0Grl6U9oHEQlL4CENbt1Hd
         nS53EBNfxH79qOJicTIQTwM9vnmW8DbkfR0el/AOUwNeGRFJaj8EN/fPrGg/I8NnB69E
         NY3qmQh1VXjOCF/3VYHfqP8QwXb/qxUOKMHQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789891169; x=1790495969;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WC80XTsVol38lfzk3PmAIywTUQMAl+IhwVAAjehmhu0=;
        b=fLK4UcW1T5QtMONBF13cTiBQoAUntk0pveuRYPk+6mSm2OmUfF2GMs5BA7Hbw6x508
         AFcotU7YMNQazPtCNwxhR+Xnldr/RLuu0nf4npqAjO+kvlDt/Mnnalp3jx3xy372L0ME
         +fEE4XNtIrMi7x3Mp52V4Cn6KEPrPkTT1nnj4Kqb+QC0FpsLJQkbc/6IPjkOBTziQeB3
         yKnlEEzM0OMDIZ5x/ok6xsC/9bmSN32A10Bb5kmQCnE3UtBqe9Ow8cbV9f//Ljk7xQgT
         0LGTsh1ZmsIF7qrC7Qc/Zv8H0rpH4U5BxWXWriaVecFlHOqk6jE038qpJru3RZNjOLaz
         V1gg==
X-Forwarded-Encrypted: i=1; AKwUvBwbMpBHBhZZPHoZgW0x4HJKPUsQi6oXnjlvq79nbieV378/i9Ligm4iFm310M6UVAnSyvXpByaWff4t@vger.kernel.org
X-Gm-Message-State: AFuF++li0HQbMg3WSC7XRMVqsbp4E/ZvEOBOZ0SUn1nx/+YcX6zzLtvJ
	bXKGsPU565r1DHx8JeY5AdTvSj+LxNs8kMEwVEGbONEmqDoh83r5akACrnlwKh3lLJ8=
X-Gm-Gg: AYBFou3vtsGhClAMIR3zvrlHqpkUhrimrVMf/NfM/vZxm2D9Ft8EjStNNNdcxxtm6ls
	bJ9q7XuZdx1ivDMEqd5hcbnc0g4IOl1/Dh5BTXYwyXnTyn4+FR/9ImEwuKd3WF7F3L3tNPGxe8D
	BM05gfPq/eE9WDwu/Tl8h04h9K0KXncj67iaDcbg1PauA7+pbT1kRND3k6RSgan1YBc2cmMdiWk
	MF2CxvDCn/PAIp/ebexGzpZDEzRh1id+fR5msBDueDaVBy5h34ehhSzQZNAeQzeTpO9tjx2wGSr
	/gebNU6wAxGEUnUnk5Ujb6HsczvlvFC33nc0iOPLvXeHTPH2V6v+S6w0cIebxug5MTJ8ybUhgTa
	462xcvo5TpwLYMzf5QzhjnktlzJ58piP9S+a4WjN4B28C+qi0h6Q39l855mTdsFwTVS2yMRtcKx
	Z9xUGtg4XdWEKBW5dD8/POAwdUIYcv8YV4MxOxFdNmgt3btaFb2bpY3k1bTJk4p7Eh+Xvz/uO05
	JHupQ==
X-Received: by 2002:a05:6402:304c:b0:6a5:f4dd:9ee3 with SMTP id 4fb4d7f45d1cf-6aa4f9cedbcmr4673254a12.8.1789891168794;
        Sun, 20 Sep 2026 00:59:28 -0700 (PDT)
Received: from cabron.k.g ([5.203.112.129])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67dafe8csm2299824a12.13.2026.09.20.00.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:59:27 -0700 (PDT)
Date: Sun, 20 Sep 2026 10:59:24 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dinguyen@kernel.org, arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com
Subject: Re: [PATCH v6 3/3] arm: dts: altera: add Draeger M48 CPU Module
Message-ID: <20260920075924.GC7878@cabron.k.g>
References: <20260917163157.1380860-1-petko.manolov@konsulko.com>
 <20260917163157.1380860-4-petko.manolov@konsulko.com>
 <20260918-strategic-hairy-kelpie-46e807@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-strategic-hairy-kelpie-46e807@quoll>

On 26-09-18 13:57:22, Krzysztof Kozlowski wrote:
> On Thu, Sep 17, 2026 at 07:31:56PM +0300, Petko Manolov wrote:
> > Draeger M48 CPU Module that is built around Altera SoCFPGA.
> 
> How can you run a CPU module alone? To my knowledge there is only one such
> case, only one exception, and it was explained by the authors. If this is
> second, I already asked you to properly explain the hardware in commit msg.

I've described the board/carrier/module/whatever in the cover letter.  When i
put the same text in the commit message Sashiko rejected the patch on the
grounds that there should be just one CPU architecture there.  But there are
two.

> Your sentence above explains nothing.

Pleases read the above.  And now the explanation.

I'll try to describe the board once again.  Draeger folks are CCed so they can
correct me where i'm wrong.

This is a _proprietary_ board that consist of a carrier where the peripheral
devices live and SoM (hence 'module') where the _two_ SoCs live.  As i've
mentioned at least five times already, the imx6 and socfpga work _independently_
of each other but do _monitor_ each other constantly.  If one of the players
detect that the other one misbehaves or malfunctioned due to software or
hardware error, the respective, healthy SoC, takes over.

In this regard there's no _primary_ SoC as the other is capable of performing
the same tasks.  This is a heterogeneous board/module/younameit that is based on
two SoCs.  This is also not so uncommon in the industry.

This is where i am at right now:

	a) if i mention imx6 in the commit message of Altera socfpga binding or
	.dts Sashiko gets mad at me and rejects the patch;

	b) if i remove imx6 of the said commit you yell at me;

	c) M48 is a proprietary board with just one user - Draeger; 

I agree that my patches should not break the existing _semantic_ rules and they
should be refined before being accepted.

However, i do not understand why is it so hard for you to grasp the M48 concept
and apply some logic instead of stubbornness.  The commit message is not perfect
- how big of a deal is it?  Will it break anything important?  Either help me
make the commit message perfect or just accept it as it is.  We've already
wasted so much time on this stupid dts...


		Petko
