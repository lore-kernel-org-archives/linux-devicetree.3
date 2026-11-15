Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794729594;
	b=xjyUoP/9a4CyKxx2E/bczPe+DXgWG2wgnKTz9ueKwbeR7BxMul2slaRZ/MLlmQV0XKRq
	 eLUKpgW9+xiZAAh1kXcJI9Qu8Z9kc0RhL2hvG0dGe3+/Fa+iXOUTECeCmJOLqz+rAAVH4
	 xb44zDIyNXbDA7N41JWWMQTXup0NjhxnP7DCl1WaxbSsFQ9MMH6EQz5TxoiesBxJiWRri
	 LIzH/LPEBaVN6URzVYcyEXu54+B13gKGpwpu6I52MMkYuajJA7d41Oyqy+qN5Fb3rK6FJ
	 fqrTMDL5XFx/cOj/Hn5P4wOyAnN1UT6KE+MKklb7kJP+zP7V1r1gwEQc+tUaWg40NIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794729594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=uTDHqE1Lg6G8+bxeAtYf/i35aEgyOGsm68xtWenUwWc=;
	b=XC4ytkXFAScH0esQ6rUaedsEFTJjVmeRt6gC18xlhEIOCO9b9cbkMQOSvZjsDhIABJzr
	 Gz7+35NZ5RN4sMT27Uw7Y4M2epfB1o6Czr4USRgbseJ7HsL1oDDiWlBKBIidOFwDv1Rai
	 xaTk6R4vU+/JX+sJbkOg/AorPaIT+lHbNBYQSXjzyClZFqvMo9jmgPrHtZE/Da6J1OxsJ
	 qiStbwGDBy26SkmdzN8BH/twx3Ry1eK9e1aDSlO/HwnweuM8Up0/Tz5eoq56HUxjHtvbh
	 PVW01+Kcf8ybHNDdWFsjovFW5JrO3MTj7oQNOPuDK3u0DjSm0OjEBOS0xnEUTPCCAjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l3ZsFgXj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1488606A31D
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 07:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1488606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l3ZsFgXj
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ad3ef75223so2861681fa.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 23:59:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794729592; cv=none;
        d=google.com; s=arc-20260327;
        b=qumAItYAqu2d2cuQ526FdrCZ6GgdBc4SktlWt0x21jG9pVPm5DkEJG8R3zfU0tCEOM
         rPbOnmixC4kbrS3z6H9FR9vr8pIGNDtRraA/ECgwsDQTF639s0DAc4ygt1LxLhmkuZ12
         cS+b+NmwQ5WuGr5YYTMhxC6EukqB/jYaSPqN78PPur42apPjcOA4LHmLqiSJCQas9b4u
         dS3I9tIf8RSpjrAzSrK4JBi3b3Zor1jBKwLD1cfDKorXiLl8CawKs1zlijt5HZJ711VA
         sSuKcGIrZHN06LM8p3Rz5qg6Ec8zzqrdB2uA/tY7j1fVONc5Nfw4fFVzlpnTli5rt47q
         Bd9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uTDHqE1Lg6G8+bxeAtYf/i35aEgyOGsm68xtWenUwWc=;
        fh=COUlEg+NHZ6LSdAIW75AjOlcmWlxiZSIFJbB67Yp8A4=;
        b=jFoJFEWEQhjhb8/uXHfNTZRMIr4GgjrdcZjkeHh6pVXU8MBQO1YuGP7l7XSa858zgn
         4Jqq3D04JXz9JFBukcp0Z9N1oYaMLHxiYXpt4VSy5Ri3pnxfXTcB7yg4DKezxK1nI03l
         S6ZG3O48ZbwoyBAWHpsbWXZbsbEJs3j0HrMdgWhDlaqz0lqjI36dFxhw+76fs24U3+Vq
         eoIGhE7M5mPBRK+yWjwjzIeCjmj+QioeaaYVpWXndQmD/EIqMRaneHrIhafFKlBzl5Lr
         oJObhqmELV7lwv6WZDTxwGuli4VczGyZQUfC31pkKanJuiM54KYKyQ9oDf+9ljtnXBjM
         Vw2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729592; x=1795334392; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uTDHqE1Lg6G8+bxeAtYf/i35aEgyOGsm68xtWenUwWc=;
        b=l3ZsFgXjqQaUHCu/uCWOhjK/dyHAiUzR+hi2m0HmL1j93hV0uGsEBJsWQGdli/PgCR
         1rv+SVpAaBEzQxHWhcuUuCGzyvRzqYMqQ4/ncvBK6a/61yfT8HUkAn/6C+u4ZI3w16yp
         oz8palOkMILd5b6Frdbg+kf6ZE5X2l1gv3fbLAwhEIGbfhpEriGaTI9QbMcUl49HiYsP
         iGpPErs1fUrEv6pRfU2xuOmqNlWQNUCZ5TKgNZmVETnIYRCcL/kCGBw0oxsmKB7XzLhM
         u7aznga62Ev9fV6nD8R32SRlqRLoIf0DA5HM+QGFAJZXEwYaGbIo0FFbRo6/ysveACVY
         MjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729592; x=1795334392;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uTDHqE1Lg6G8+bxeAtYf/i35aEgyOGsm68xtWenUwWc=;
        b=11Mjhq7zgsQKOHT4FdHnrwwY5CreO0KybqOszn1PY4EMHf9ZocX7lzTDf5lB8/lm+J
         M0pPB3GTWDbwUEnMoKpUDXLbOAqnhe4f+N9QUn6XIHIZ1Au2gTEyzKTPQ5W67ZOQnUFs
         2DywbKCPxcVujSKZxY2rWp7rAiF3j9gjojA/iOUNg4laFKUHun7ndkDP4+IFJO0WUDb2
         nwc1INXN7ksxsJArUSstbFDKSbZHpTGaIa4/R7Aps/Mplj5JIs7pHAgM88Cg9/LNn+vW
         O+ZJjmxs1aiBPkL51fH7bPAPcQkrTjT56Z+d//hff6NGPX8n6p7NyEiGIOnyi/vE7lo6
         RFLg==
X-Gm-Message-State: APuU4Z+VY8un2PCDq9I0LtXUSDcQnTKIMXFuV1tMc1eYmbCPr9JeeS96
	JH9i4yKEeN/s6JVa6JbtP6TBof5v/PSuE7LTzgfXsHNmbb6NeDH7trCHBgakRleA1b4gOZnZKDe
	77Ys/sQJi9ndiL3/iN4mJBkbLxp9ZZA0=
X-Gm-Gg: AYBFou2jb0OcpXSjjjosIl0hrp8CKofU/J3UEYqc4Mo/6i4VChZh/WXemBJ9PYFLgyf
	DJ3PsHvyKJzhw8dJaPWew7lQAcQlPa+djNaZUhUtkJl5l0FaNWKaZtpr9UmKD8NsRbKJUoXEQJC
	eWtKaZlShc2/oxQAmR/mi2mQWuwsnizLbpMQFcgRxEG38uqJGIh65Gu/NCxvnfpsnyl7xVh2hRd
	OYoK+tJU9619944UYyqBuXV99ege7H5Zd1La6tLHlZqirhey9c9J0oGy3Ltarl9iltMNTM1FFBp
	2fqE+S3YuKokR+etxzvPL+jiqiZT/9bqFaWfdHRmzyopZqsBm0ZaSYSy+QnkE8u5wPgsCSn7K1w
	czgKVEeMi/75h9ViIP6Q8k74y+SA6eB0oyBDQ+c39zjIHs7kc6I0xWYTI+//gWikCNKN366c=
X-Received: by 2002:a05:6512:6c5:b0:5bf:ce24:38c8 with SMTP id
 2adb3069b0e04-5c1709fc01bmr2810875e87.4.1794729591806; Sat, 14 Nov 2026
 23:59:51 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-mmu600-php-v1-0-231196049a3b@gmail.com>
 <20261113-mmu600-php-v1-9-231196049a3b@gmail.com> <sashiko-outbox-214777@kernel.org>
In-Reply-To: <sashiko-outbox-214777@kernel.org>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Sat, 14 Nov 2026 23:59:40 -0800
X-Gm-Features: AclHuK-JybsEZ6nSpOrtN4adzzDq3bM7zDeeZmmerdCe2Ul1Cz2qTLFRAuITT4w
Message-ID: <CAEy9hNVh_DL57=pa4_cEMCVC4j_mLhWCVsfRdqZ1=Pu_QHJakw@mail.gmail.com>
Subject: Re: [PATCH 9/9] arm64: dts: rockchip: Enable the RK3588 PHP SMMU
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-ide@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, dlemoal@kernel.org, cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"

> Does enabling mmu600_php break deep system suspend and resume while
> arm_smmu_driver lacks .driver.pm sleep callbacks?

Yes. That is why the cover letter asks to hold this patch until [1],
which adds the sleep ops, is merged. With [1], deep suspend passed 3/3.
v2 will repeat the dependency.

[1] https://lore.kernel.org/r/20260929034510.2023173-1-praan@google.com
