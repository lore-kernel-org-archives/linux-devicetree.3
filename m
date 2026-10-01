Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B150252378D
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867692; cv=none; b=M4yL06rzJRHW2zhhfI9XG+GqzA/SQZ0bdkPhV3W+K3QoNZYEV0YYguLMNvynNQGEwiiYAc1/cID/B3lhJP8jkZQMg2GLjlZ7ue+F9C+3yEbWfI1dTO1sapCuYVed1xnUgeBM2QVrBQK/T0UtVVI9J617Gr/DJnLcrVLBgH87zKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867692; c=relaxed/simple;
	bh=GVazF3gyk1J8hFATxW/Weu9ULHvZlQGk8yLNNrf/izQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MM0i4tBIvb2swoZGGOADWRv3/YDnH24b+B2WGNTl2Vh9W/ohT+VuPmDFmMy/7ZQ8xJgQT6HtT6qvcZ18/+x+zUe+Pc0z1PS+nldt45RcJZMRwGWxyso0eTCp322qg7uUgFZwVhHg50GAugKpYVktxrhjEntjPyzUKmBpxl7I4wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oYAphiRy; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oYAphiRy"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01c41135so1371651f8f.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790867689; x=1791472489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVazF3gyk1J8hFATxW/Weu9ULHvZlQGk8yLNNrf/izQ=;
        b=oYAphiRyds91YFZijac3xJ6+FxFwOAdrYfc0gdMRsAU8DDd2w6HxhiT6rlJisUiNeh
         iSnACMFPbHw6vcKwHomXeUvNxJMfMr/ZPJeYbytK6qpXWvUXrCEUXCwz1mFnI96yYSRi
         cI+n6mvmcIgTlfS2mBSQ6kTef3LqYafCs83pXsP2FjoXkS/qx5D8yRhPye6Mkw5EKbT2
         d97mMvlyexO6S8Js+0yGFFQUY4XFe75PGH0tcYpWYZhCssHrnVRWJZcOHsPrkAjSf5ve
         zeK1XqodHNlDv9/xbIcDC54PgJfNHajEW/puhmnxUuZjfYrBiGkzbxdfjpkNiWhhEEIy
         Y+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867689; x=1791472489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVazF3gyk1J8hFATxW/Weu9ULHvZlQGk8yLNNrf/izQ=;
        b=egaoRk+6Rn3OO9c43kSGEXFZOiWKuwPYqwiD092d3Xd762yP6aGSGkfk0lBDyPb48x
         i9epUEh8SE+UCXmf6Lc23lyHV6rRP9db/vx6NxyPl8t2kAZLRfv1UDCUmRmTFDDmLZdW
         Y6wBRuxNv52lW7CIIH/dZwzcthZ30p6mTiRfPrs8/t9a6TuKCQaFq4uwiTYg7TGRXv4j
         cw65j0f3OBVAFY1DEh0+uLrIptLyCZnJ5sEcg3NVZCR56+78p12zcNhAtCaXu4FfIoGh
         Xw41OvFYjmzQ+09oNNj9wJXPEEx1n9HKQg2NzJkQEW//zb6LmANV4lVPXuALJfS2Q0tt
         ahQA==
X-Gm-Message-State: AFq9FYKWYrj/S48er2F9vd9jgUTAONVZz2/XC8KUwoMOgpMIy4rg4wf5
	w/e4oiS0biUdCMdHdXtgT6IvTxqox87r+04EKuLWM8qF2bPn0EMgB9e6
X-Gm-Gg: AYBFou0hHcVxbhvtn3fE+qyyjJouHhvLEQJr/TGsqot7UIdxkC4X2DelvQ1eNFpBm4L
	a6FVpH2Z27+yLnqjKgPukVLmVqV0XSMp4++HijcY9cX0wueGKaZMn7Hoc/PchG7pBWsMfr2mSeh
	hQ/2Qjffzprg/uQX8pUcqoTdhlrwCyz+KYKpJgm49et8rEgVumAXioW5u3mnqbcCrgZ9e9I2ny0
	8uBHADUqM4nKyi4XlnL+f3WsFjnzhgDCycsnmVpLwX5Y5sIp1CdyU9iyeQxh9P/PLvo5BfswHfM
	4rCfwKyCNBLm8RxegcZ58YaKKpvNJZEd25pm57v31oZuonPrTlSd+PY2JcRP3DioQQjJdR7FsLt
	o3BdUtDOBJvNwoeqLtH8QBKy0aVPYrAcxU/ivSUp9kr6shn7o2Am4fXZVJQKi4+nkicg0LFEPB/
	8LYt3fFiq53s7Y5hLjTPAm+JVs6H0fz7g4kEE6q/8OByWKB4NtaSmtsrmDy4zdviE5U5qX7zyJ7
	trZmy5w0X73bPcqo8rX+Tq2lgTCZxIdf9zMidr778MAfsjFhVfaFR/EZTn4XjD2lG7ajRchP30H
	J+eiWchi3FvjJHitmX3qDpvN6Qw=
X-Received: by 2002:a05:6000:1ac7:b0:488:823d:5060 with SMTP id ffacd0b85a97d-48b02544bf6mr9213320f8f.48.1790867688738;
        Thu, 01 Oct 2026 08:14:48 -0700 (PDT)
Received: from thinkpad-p52.telekom.ip (2a02-8388-e6ca-5780-e161-768d-5c97-84d0.cable.dynamic.v6.surfer.at. [2a02:8388:e6ca:5780:e161:768d:5c97:84d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0db6de0dsm3293500f8f.43.2026.10.01.08.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:14:48 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
To: hfranco@baylibre.com
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: cv1800b-milkv-duo: enable ethernet 
Date: Thu,  1 Oct 2026 17:14:47 +0200
Message-ID: <20261001151447.12076-1-andrey.lalaev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com>
References: <20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hiago,

Please take a look at the patch [1] and the discussion.

Thank you!

1 - https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/

Best regards,
Andrei Lalaev
