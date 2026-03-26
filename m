Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50DF33ADA0
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515998; cv=none; b=cO5FE3UKRzgwf1A9VczZ4tPuVWPlk0rxILWAdNXqDTupdNe3Ri3HaiBWLFoSPorg6dqUX3tqSsM7/Raens0+hq1F+7y7NB31etL2bd4kSGvGhUvr/N0dnrykkeYc2vAzOX+zWf/n/GKnAxadOpstAVPNeWHgv2mfJPWlBwciDWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515998; c=relaxed/simple;
	bh=/7/QorcQZWCmJoeyZCBgMaQWGymJXwf6GoULHauSgmk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PJc7IiHZeCkzXu12wt5JGvDvE6yPoWYIkAVL/nvnZRlo48weGnr2pZ3UnDRqpmhWjd/DZLHInRnHH/pFcbifSU2VwuclXzZhVDZzf0Q/XsO8xV9PqArP/RaslhaZpwy5YuXnB5xZ3ZR8sv6FdIIDaUyrfyxwGFleUtDi6rQWApE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JRkt6/JL; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JRkt6/JL"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486b9675d36so6493665e9.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515995; x=1775120795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Xlwh2nloblz8DH/N1OHqaA32fAZ3UK1+Bg0PjnWip8=;
        b=JRkt6/JLfQbrap7gh+d85mD6r5eWUrQSc7ab00ZBmtv3Phs4sVYbvR8EGa/j47XSbM
         ATOTs7fga3/ZQeP/vdU12ybR08754B3efbZlAnglGKEbvB1Ea2b64QOhhSdwnDEkUYp7
         kzpTIl5n6TCxS+HuTs4LOe0sk5N0zGMt3YFVz5BFIj+621UWvoo17ThswZd0cpz/BBYZ
         WDqGExxb/uAMubNT1zcv/TOSoGgo/4ci+RRp3Ni3KwQJMOerkRGbZ66zmKGjtUvl+1sd
         UpTE5PjnqYf16KYNCED57J9xmzq63UVHONcuYWPz8UzaNa3XqPmmHSSVCfUKLPs06vG2
         QCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515995; x=1775120795;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Xlwh2nloblz8DH/N1OHqaA32fAZ3UK1+Bg0PjnWip8=;
        b=iZHeoJFMc/yR25EyITALlxR7+LZv9fIY6AYjGwia+GPJlbstG45OhN2PxdP6V0gbY5
         33mDPNXhFUyaXxfhztmTA4bQIGOA1sv+3w5BBYyvY9vsliOUTz8vhflEBs78OQW9BuEf
         sDSGJLGoxIs34aOZIGv4fIphAancLE0fIBmsx4G1bmCBUdl9qVHybKn4p+roFgXTTC0n
         ChQZT8Mil1xZQLJjq/H7jl0mj+Ixb6MTek7W+SRwFsalUHJo8US5tPCIhzZv8EdHbqC3
         D5L2aO21+Q4O+12rH5xUu/LfqGYGmcqWIRT0YJiEaNrjcnHFOex3kYJ7dxiXmWH86Imi
         QPNw==
X-Forwarded-Encrypted: i=1; AJvYcCV0JHW1hPsz6xszmQ0HgAr4AmZPi2ZPbm66Ppdm8MiM3ON8+NuiinjRe88XHk4f1Lrlo6ICV9Qm0Q0I@vger.kernel.org
X-Gm-Message-State: AOJu0YzCIwgaGnhfydGTyuVCDDEnx9LvGXnTgpUvOgV+iqIKY7Pqy/Ec
	U/7hTX/Vd9Kyad99m5U380SXvhKobdRZ7bpdeaNHLdhMHMCuF4GYFdu9Rq7bwDlK/7g=
X-Gm-Gg: ATEYQzwviiySw9+Qw4hF3L5U73OsJerJu24F6K8pmJeKsa5oAqruXo8QKi32J/5G51W
	JPa/sDDti1tT0O5tD0b/Ij3YAAKIGcZ9BW7rqqWLiysNcBsQfJuCy/84dmWQnH2MB0H7c/R9udq
	ZSEVgZg9FePbrVSOnWs/lrt+kqYBCwb2AAEEij5UHvSCcBH2P3262Zde2ihFHHpQpDVTdwyEIOT
	XuUOOqqDr2Ejx+R8SushgBop+Q+1qTIBc3B8DBugJmHgq0VNMTIvkabmkOgWvreQqZLaWjeORE4
	UJcALrVUVkiL1FLG+SX/fWsdc/bKyWKBBRjgJyfFHi+7XNoAtbNUgYkEauNUNaJzBJRloMfaRM6
	rYJH3WjyjiFeupvV0I9rUreAf2SFbHakk/lcd1qzlzqvVTFwFiRFUrzuICq1ZoGKzrwD4LHio+i
	lkqDDgqlg02tLHRIXwpIvB9MspLON3qArCqm8/jceftcgm7FFr9NrnYBM=
X-Received: by 2002:a05:600c:4baa:b0:47e:e2ec:9947 with SMTP id 5b1f17b1804b1-4871607ac9dmr52495635e9.33.1774515995000;
        Thu, 26 Mar 2026 02:06:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872090368dsm14726905e9.5.2026.03.26.02.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:06:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, martin.blumenstingl@googlemail.com, 
 jbrunet@baylibre.com, Nick Xie <nick@khadas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260306030756.2421841-1-nick@khadas.com>
References: <20260306030756.2421841-1-nick@khadas.com>
Subject: Re: [PATCH] arm64: dts: amlogic: t7: khadas-vim4: fix board model
 name
Message-Id: <177451599416.122020.7359168833224163139.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:06:34 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

Hi,

On Fri, 06 Mar 2026 11:07:56 +0800, Nick Xie wrote:
> Update the model property to "Khadas VIM4" to match the official
> product branding and maintain consistency with other Khadas boards
> (e.g., VIM1, VIM2, VIM3) in the kernel tree.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/1] arm64: dts: amlogic: t7: khadas-vim4: fix board model name
      https://git.kernel.org/amlogic/c/771d092af02a11ec565494052d18ddfb5e2f1428

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

