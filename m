Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011B346C829
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 08:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583809; cv=none; b=gssOTLnSQUGHtYZ48mPcbF6zTKtVzNWK+yVhVgA1ubpGxlS2FRJgAuxYp2C8YA5x5Oc4wMPrA7DpaBjoebUr1/IUY850JgMFU+2puhIPzjaR5NmqxDa9WsB84D+fHiYNf46taCAvBEZRn4sn3uKAuIbhJTBWwoLgUEk5rv9e9fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583809; c=relaxed/simple;
	bh=RqUXkvq+UXggpnZUmpB7u7ETkytsnqwUT8y6iZwRB+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hvlECEnftT8CQi92/t6KyTgvlIcc46LnhrZqUrGdc3VVS4+/gY5Rp6ZRAcVGNVftDfm49Z/S76nMnX6owoLMKhoME3eGVgjfhcpCVotqYmLmIS1aZWRS8Q8gIRoTpYCE05VUuKn02aM11DLQKf4BexV5tDNjvbnhWscABIJo1p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwpDAi+6; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwpDAi+6"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-3a0a97efe99so301450a91.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 01:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790583807; x=1791188607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aCSsLPZpBQSxCmBHl7x2KeIrNsy1qqAi41MGrgkLwNo=;
        b=XwpDAi+63NsW9c2tCeImVzzVprOgOlUt2bqsB0X/EQfBoH7OR7c3pNzxkMvoliMkFv
         9nqNpHf2I4RxUjxJ+1laHGZHs9SvxN/+hSHtXbyhr2x+8bi3jum3/zmx+Etj44mSCCUC
         hAKmcdAeC6sSjU3+h3IwnDs2nLsn9CnwzKHSwcUD5fKy9GAucyram4smdNRME37hR4h5
         ldo0fKdFkj0LK/N/bdT8BADu0BFwagJIlb0Ih2biKsL+uIbV+vg8dZx+jMUsl7+zPTGR
         WR++GbQONzpjEvCtmHbo8DfuY+7kWko6wEvq27l8B7RlYFk9yZ2tHukuD5blb9hg3VHE
         1Ckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790583807; x=1791188607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aCSsLPZpBQSxCmBHl7x2KeIrNsy1qqAi41MGrgkLwNo=;
        b=u77fViXKN5C0FZEA+ZguhubRaEfsG1U1RreGU6bT73XEmDIROMvPVUtueINJ1u0Msq
         Iz3Xv0wv4VHhbV2WdavhhEhFIMRNACkSkmxCNXLLkyJ0jSlYsR37qZobEa+lLHJIPfzg
         SWVcgQM+hfDc3Uw2TM7+gE/9X0bonzrMCf+fDBftQuD46F+I/lSRh/QpGiOO/01+lnT6
         vCttBtKur5GCk5qo1peJD59+pg2KsOO8VgbVMC/gLgd/X300g5jXzEdQ07qTbdn6kUAK
         uMS5N+9Z1p3UPKJrey+si2qWPWI7rdLaYnfNGy75qRZT6FtU+6jjvXdQ4ll5pElRmrdX
         w3Ow==
X-Forwarded-Encrypted: i=1; AKwUvBxEF3K/8WM7kkqasApX3O7VkvpHf8E80JC4a10F8pruqntJgsMVA6+CBJGnT1R//kg6x8UmUWI2oA68@vger.kernel.org
X-Gm-Message-State: AFuF++lkbDCAOr1C/A/aJ5OpTYj4qdqmBO7PY+QcIoP01ic3Ob7SWmza
	h0wz5yV2aP0RJZ2zOmlis1kGLhYagNhgnd1hAtFGWdZQhB1+gvy0kpQ7
X-Gm-Gg: AYBFou3Pfd+wuRwkNFwIe/KYSdo4Zo3Cg7LgXDO2Vzq0+gXk3ineGpj1PqMruuHFFId
	BD1mCt519j6AicsE2SrTTpd08jrNhlt/fc5dZv3Z7F82jpe1WxHePYGK5JTdhfA0T/029Or6zYM
	P++Jgy4xsB6Eaj0RBKJAt1hsUS9dqAq88Tl/opc4uizgR/P20ED6TLWUmj0fZ/e0h6vH5guuWDx
	ZxC8vdGUJJ9UuxlK4UkEOGTW6OGIoNPTPGZ6cQJuQfOWS4wA5DDrMQbLuo3qouuJU5FaWP5G8FV
	1NICNkGg6byw/sk0IeBosiWL+2E/TGfBUpufUWoF5VW+DZpaOAUFwx0OLlEp2n7gDd9DxpnNghh
	xdvg4wNbxYhtzoZAcotkumiU4APFOGjfNnjDAmyeudS9TuGZU3KjOH/DCYgCoyicJfPyiQn+JiJ
	rNXrDpIZi65/efSyESCKjDzOQYuPt+P0ncoswAm80SBCl8GTHaEcS5779slv+bMDqPb2tT51pZM
	3jTe9QKVon5PQ==
X-Received: by 2002:a05:6a20:4306:b0:3de:4f5c:a9ad with SMTP id adf61e73a8af0-3de4f5cbe8bmr5554848637.1.1790583807126;
        Mon, 28 Sep 2026 01:23:27 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7ae09698csm1436154a12.31.2026.09.28.01.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:23:26 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: krzk@kernel.org
Cc: abelvesa@kernel.org,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liujianfeng1994@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add Acer Swift SFA14-11
Date: Mon, 28 Sep 2026 16:23:22 +0800
Message-ID: <20260928082322.10078-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260928-spiffy-calm-mongoose-828a04@quoll>
References: <20260928-spiffy-calm-mongoose-828a04@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 28 Sep 2026 08:39:55 +0200, Krzysztof wrote:
>> +              - acer,sfa14-11
>
>acer,swift-sfa14-11
>
>?

Hi Krzysztof,

As I mentioned in the cover leter, both Swift SFA14-11 and SFA14-11 can be
found in www.acer.com, but the UEFI firmware reports the Product Name as
SFA14-11, and S in SFA should have the meaning of Swift. If you think
acer,swift-sfa14-11 is a better one, I can update a new version with this
compatible string.

Best regards,
Jianfeng
