Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597863A7F5D
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096286; cv=none; b=XbIXP42ZCx4W6Ted1VjSOhkePEakO9XS+el8cYPl0LkU7VWzEwCKcgOh94GbrUWhm5zab2Gv96mKBm+TheFwuQFK+Vq7E7iTRiNjwWHe4crJQq6u/AzZORWGlYzXcfMYhf1sT+AKqPZnniDO0NNKtxBnnAEu8v0+NCovQ0t8Vks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096286; c=relaxed/simple;
	bh=I/0dsVqT3+rwe8vxTka27s1co61yM446PDMVcSZYv8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9RUmWPrIRc6RWMeWulcIXLrgdJy3PuI8hsmL30etb0aIAmdiVS7rU2i4uM2MqcEy3gdsaogkHi/zKrDQB45hJ3Fh3Le3hBs95wghQQNDCa1E2JLT/Ut+yGtoUN18t1+aFxL7P3hgfl9W54qelb3rGTaQaInQejLQPImOlryz4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qxiVvasL; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qxiVvasL"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-91591f19c30so993967285a.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 05:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781096284; x=1781701084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I/0dsVqT3+rwe8vxTka27s1co61yM446PDMVcSZYv8k=;
        b=qxiVvasLJsHfk4aVI+ZrI0YAXIs9AMoiXD9g5/OrQrLLHIekqpW0xuYVQVrqbdRLqI
         506YjK+BoDYSZ0klrGotOfsHIfWtjajFDLAOu7CQ8Jw9DfGQdtZBz2D/cRl1RPmeBhiR
         J40A2hL/MILEavDYw0sGCi53FKh+AviarTR85OkOCsMJYlw1U+hXZqszFJG3MMAjaEbq
         h4HQQqZERN3bURr17Bzy5+Aj6Dzc4GnRVbybj8sWst9LMiwox8uxx1Vurf2mvuEpxuj4
         naVfRxqlUhktl8C8fWnlYzdUL953v+zhymtZ64E7Fc2T98XTtR3FEcrhMuhwu/W7zLBs
         XK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096284; x=1781701084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/0dsVqT3+rwe8vxTka27s1co61yM446PDMVcSZYv8k=;
        b=Q4V0+gi0p2Bt0fwtTfbsyH5cPn3UQMZBezh+UtlXSgVwGtch+0zfvA0cM4XtUR2lcl
         suK/3gHSGVvA9pYcldffFdRxiFkBIsyKGub0sENoY1pP4s2A/OSdNLyFkIhekouUBF54
         A/7LAu7HE3nicHMhtrWBSez7bW8VAQjF5jo5heL3FJxjBSqR/ALFRpHKR+G/CrZVJOdI
         +kMyj1e/SrZh3PMvMRiuT/HPWImPlJC3+Arb552FpKpYe1gmUHLYGuRjsghYaeu0iz7C
         UBXkKaHFoJM2TxmdJhFHx3Z9IffZSC399mWCqlDJdhINMz4lwxLWuwsBve8F5pE1ebXY
         uSEQ==
X-Forwarded-Encrypted: i=1; AFNElJ+d/So5Sn+AKUZg5e3grY0uvLUJq6Fkj2VHTx45tRbn6qAbltQg6lHpTyXjBMEMePW32hI8OvkdHTpK@vger.kernel.org
X-Gm-Message-State: AOJu0Yyub/YMOp+U15SmdOBNQ8R9ieEZbqSkA4ZcPevzd/yNpbM2DWMe
	29NHaJsvK1aHri+CBUgmmWUEJfDy41tT+1q8me6sa5hBA3cfIzwUhUAV
X-Gm-Gg: Acq92OEXWUosUSJCHS6krDvO24n1aIut03ZgL3wWU9TdQ9ATP+F3/3koIpeG/sEBHwu
	2Ri8V/2JU6zgUhy9ouWpHW394y7fyACdJ5f4D2TnO0ny0z6Hcv4MqHbjJ9iwW4Nye8ckBQOUcVc
	TFLkjVbZzj0MerLfVfzEq3CHgLByECC/k6xvF6Xv+dE26t2myek7Tk9Q2pbqXxc1ns54j7613NR
	AFXPIlNp5KPza/HcgP8FDxPVvMTiSRXsBoC1Z9EW9XBCzX1M0T8RpSEXlwEgNiXhmSwY2Wghaqd
	7bt1GuLE+jFzM1eIuyoGaPCz3MHPdr6tjGEEkUIaoEsHi7QbrqxxhSxBAalUBUuK6qx7U5ExR6C
	PlHf8OtzBeqbjCxuE21FHdny5XhXFSjFzY/QM/8Dw/vYyrHbzH1+hK2K9ZNzdVaP2mD/+yFCIqU
	BaLuwhs20JSqmD/OkghkCKaDuQpXN01poDFT4cmM+2BOoibUelaspfydakfc/4idTxZao=
X-Received: by 2002:a05:620a:2588:b0:914:9bed:9443 with SMTP id af79cd13be357-915a9cd939dmr4259735285a.25.1781096284172;
        Wed, 10 Jun 2026 05:58:04 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00840dsm2635584485a.1.2026.06.10.05.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:58:03 -0700 (PDT)
Date: Wed, 10 Jun 2026 08:57:55 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com,
	unicorn_wang@outlook.com, inochiama@gmail.com,
	daniel.lezcano@linaro.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, dlan@kernel.org,
	chao.wei@sophgo.com, anup@brainfault.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
	hanguidong02@gmail.com, michael.opdenacker@rootcommit.com,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v5 RESEND 5/5] riscv64: dts: sophgo: add initial Milk-V
 Duo S board support
Message-ID: <ailfU9PHrm6MDhdR@sleek>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <20260530173347.33533-6-josh.milas@gmail.com>
 <DJ0ZYF5C8MMH.2GBBY188VVPSH@mailbox.org>
 <aiawOUHBcKtMVEZk@sleek>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiawOUHBcKtMVEZk@sleek>

Hi Shuwei,

I was able to get the wifi chip working. It requires the proper DT and an
updated aic8800-milkv-duo-s driver [1] that has been updated to Linux 7.1.
The next patch will cover the DT part.

[1] https://gitlab.com/DeepHorizons/aic8800-milkv-duo-s

Have a great day,
- Joshua Milas
