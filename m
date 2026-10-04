Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8DC3CF680
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 16:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132689; cv=none; b=LLfXOTHdzfLqubOWlGPbP+ECdVg0+q5vCIbZDf3oohNkY5NHNwgUndJEXE25wEfogEKRIN0+AeCgSJLWNwAdBe5L5m6osOj+xsdHMxevjwhN4JwSIMiASQwexzZrojN4QenjPd39XoI7uaHSNRfhcc5EZ0cLznRxpmr/KSDZ6/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132689; c=relaxed/simple;
	bh=B1NQoDPcpD7pDGtYHOkFZsvr7R+guI6V8OnUcMpSaOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RklfF4XIaqSKcf3sDrZb//holl03yC++h7JTff1ckPKgu10mmVsgfuSJD04lZ+JRHuyt0Gt0pIbMBpISY1G0OljbUIj9zaheXY4oXSZokKFmeWtsoVmKAFQ6Uj++MGSSO2/uWKNpaCUiaFPnDeJAVQbiHNBYQkATKIbzZsIQ6k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDKxW/BZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDKxW/BZ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so7139395e9.0
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 09:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791132684; x=1791737484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B1NQoDPcpD7pDGtYHOkFZsvr7R+guI6V8OnUcMpSaOk=;
        b=QDKxW/BZ2RUCQIvdERF0IzoPr+3IBkjZX3lvlSWmlv6Ydyd0SWPaYo59b5jnWAdVfT
         8GLD6JmlteUUbwKmfEqY5fFw1Sk5Hgjy5b0k+6yC1HRqUqvPxbO2hJmFXw+I2z1C3OQ3
         hcZEsVn3HRC856TBYQtmg3jxUIgacXJA6tl/k9zl2akmqATPvEygwYEn2Pw1op8w09tP
         jMqD80Dp02a/QyWq3ZpENd7CDOrKFIVtoMYvKqaPeO5+pr8xIAqNreI8emIQMfM1bsdw
         FS6a98ksWiJPEN190Y7emoosi6Dd8jlR5Q38NfvXnuDBGJ38ebUkGWGgFsJ9+X8e+kk5
         5esQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132684; x=1791737484;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1NQoDPcpD7pDGtYHOkFZsvr7R+guI6V8OnUcMpSaOk=;
        b=uU94rB8Kt/lvXU9STkDbqk6mNv3r20mhg4CGFUnXU6QCkR36INk7Rg3E8evgybVUQP
         iCnHCQZSKpQ5pxymGDE4IwkB6B9Ym7L52p1YVc7eUdAa4D5lqedbbIjJgWfWwHAXeaVK
         KH8ZsQdCMA/YhjOWSaH53wCGiqirqZVBZ2kZ/mI4hNqoTaIvKtyHEMuPeLzzzyuG0HOo
         CGBdAAMFDlWxSxGDY3wnidDvNVrVQrKQjDRVFZpwcPE0seYz23JbKAK//PA8LJGbjGlM
         DpHRaPTMF55w6RJba/QHqRdOwsBFdNzdPTjmK5KAuX3/efbKiKVtndjJ1r02tpdxiMGL
         aVtA==
X-Forwarded-Encrypted: i=1; AKwUvBwbzKP2ZD6L2s5dA0DU1Ne59bEYI18MmCujBE+c//8LKICHPW0ILQMtuMOtB83/5R8ZOXKXdSu8+3Xj@vger.kernel.org
X-Gm-Message-State: AFuF++knEScxSTRWhxzbsaiKeIghZYlEpqW7qRTGH/Bg0oNwSsZyEXA+
	jf2jIpDMRONjwVkcJSZN4AI+LgKEL0cQrTslJ063t3Lb7UclaV2T7i71
X-Gm-Gg: AYBFou3cjOpgYrDSaw8Twprk5DJnVu5lWJN82ALO5OpENtmKQK42FlM/S0WfLe546KL
	2SM5gGdHzWj5tleXd9JvNDZR0trk66/MnOn6dp5iGuSk7mHFQK1NgZnmDG72hHBFL5N3i3Cw6Kv
	k4hY+OlUn9e9whcSyjeCM1n+sCf434oqJaax6QAqy5b8+nfTHeQ9H3IXq2gOe7ntSHG1qHf0KhV
	xt7AJOXkCOhfyqRhG92C7xEdtI8NtzdhAt9gplaIjzGg6yEJ8zUF9yqRYEbmc6hGtdSPcpe1SBb
	9iLMgc36WHm0OCZqtkpRpS/tu6XIYpGDDC2wbHrrHwBhpZDG78hJDmW122CH7PnNXLs55eTukVZ
	/8v6PsxdQBUN/Te2g+O0Soh2GOOp6yKLhm0hlfU4dZJcc0sXLPDmNlx38OaOo5hmGjEKC2JSSCN
	y5BbkjUH9TcrvYS8R9oBFuHaSIKqvXzMZl5XhG4SL8I47ys+PWwYLBiIy292phNlhE5wT8PxuST
	MOMyYAxggqSA0e7GryIJA==
X-Received: by 2002:a05:600c:4594:b0:4a0:22d5:908c with SMTP id 5b1f17b1804b1-4a1680eee54mr65008155e9.12.1791132684137;
        Sun, 04 Oct 2026 09:51:24 -0700 (PDT)
Received: from FranzSP11.fritz.box ([31.31.60.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027f2a4cfsm233973165e9.1.2026.10.04.09.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:51:23 -0700 (PDT)
From: =?UTF-8?q?Fran=C3=A7ois=20Roux?= <franzelfranzel@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] dt-bindings: net: wireless: qcom,ath12k: add disable-rfkill
Date: Sun,  4 Oct 2026 18:50:49 +0200
Message-ID: <20261004165049.4174-1-franzelfranzel@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <608f9f6c-a405-4903-a1bb-86ca8a0999f3@kernel.org>
References: <20261003091509.4822-1-franzelfranzel@gmail.com> <20261003091509.4822-2-franzelfranzel@gmail.com> <608f9f6c-a405-4903-a1bb-86ca8a0999f3@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/10/2026 11:27, Krzysztof Kozlowski wrote:
> Please do not duplicate work but build on top or reference previous
> discussions.

Sorry, I missed those threads. Having read them now: a DT property for
this was already rejected there, so please disregard this RFC series.

I will instead send a single ath12k patch following Manivannan's
suggestion from that discussion (board compatible plus device ID,
handled in the driver), with Jérôme and Dale in Cc.

On the tags in 2/3: understood. From now on I sign off with my full
name, and I use the Assisted-by format from
Documentation/process/coding-assistants.rst.

Thanks,
François Roux
