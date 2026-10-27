Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793091411;
	b=ZzP0xmnYPHSD1MkztHFaVxAnR68Uzul7vLhereD2H7iU4219/Vaol2XVOhKDyVcwkHKG
	 Gw0qaF3Xj8H2x38w3kawSmqRBSK19qPVW634aQDTWmpgRsUEYSHl8YuBXVpDr5klavcfg
	 ZxO/YEIeWlg7dQNmWERV6DUW7/+bvwlChFqBxVHn36BcqkWX1NEdBPDUB/jsfq7hP4czV
	 1cMmdJ31gE7ymvpaA2m01q7OYja2MglBLqUhjHnDahFtU/v+Za5bnaCeuQPvoOBWERWMj
	 k6FFPzBuNp88m7xpdivOWT53idvbNMimPhHlkW0cqbxCQM//zccVe7m/b7UBr7aSAHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sOH1HE42SviJbPJezzX4tQBmmbjpayWa7pABk2ZxVhU=;
	b=sUeiL6N/+y2T9+4ANxPwJv8vOIzbR/fCgF9FEr4qgieJgLjDZ9AMQ4pWs8JznZeWQpkh
	 oE4Y/mOf2O5hUOp6SLz7GHo3bPpLGbQ5K0ab8yK1Ivq9aUhL0CIAZcXAHLW8zw6jYAQEk
	 DowAJ9Xl3B52rvp0/9/li+7VusuGz4NMLbz+w1GiJdCJQjxUIy3xGwoCuP0D/doTDPBDW
	 Wzj9W/xVs8mYGutinFSqmisiir4krhlZmBqOw2FbMd3O1KAF7Z+t9DpA3qEQ4rG+YSRks
	 QZ8gmgfNUAfS1BsF8VqJvF1iJ6KHJzKwt02MIII4SHbyFXFe+aH+MsBeXwyYPjSmrXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gKD5i7DA;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B095606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B095606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gKD5i7DA
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e83d2cc8a2so5851435ad.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 01:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793091410; x=1793696210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sOH1HE42SviJbPJezzX4tQBmmbjpayWa7pABk2ZxVhU=;
        b=gKD5i7DAr0WSmZ3uf3JtlbEqDMKJPGB3mi2KuhgnRxMQQzVOcCdZwUevcjpCf6vNa5
         MHLE/2991Qk7m9S6cwCexspEE3Jit/3n1ABXJoFDdKxzUUJ/erjLHXv3wIHbqKzIopxt
         l/tv3BJjR+oDiJEZyOXjYObNarFP3MFhgk+sN0XVIc9UEesuNHgi0oHlGe+YR9v0J/db
         8Hb9G0pndHdfICWTNuzwtdhf0Zt/bI1h+HNNDNAJO+MiIq9NhgCzhJ24kjhrzqXnA8Z3
         uxZxB4zU2I43pd4T5TjRoN59h1VbxwqKrTFsyqXsajuk6jyz1Lm2ovl5Ms69fYqtZ/d5
         mOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793091410; x=1793696210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sOH1HE42SviJbPJezzX4tQBmmbjpayWa7pABk2ZxVhU=;
        b=j0t5L3iUcdXRWkdQ75mRg3QwJdgwKvbHLFemNKP4uj8CrYReLDdAgMy89oujYoLA66
         eZXcivOtQxQ5835SB7OOnIlMfkB2QTMRbkrQKI95k06tHYCv3tD9p1uh7DDXIqfAReX5
         NyfORzGhIaAgBLc4kuNeF1wqTqsxCIsRdPXpjpCOCTqye2hiqvlFz29wM3ixs1KSOfO+
         1cgsXLoeLUPHcBiEgUSoFDFta1C1KZr/eg566Vfk76jV0L4bJeq1psqwCRIrYPYupK+3
         0n4+EIspmU6U5FmxkZdVi52k71oPvw19n0Sw/5DGYt2Sp36nvRxhi2hngvuF7hoG76Pp
         Gqlw==
X-Forwarded-Encrypted: i=1; AKwUvBz5YaYtGlWnqt9aTshU1fajVA0S5nc/V/FkeuBtgpR84irYpSbnDipewj3v5oqm3m/FecyjYHlJ05iJ@vger.kernel.org
X-Gm-Message-State: AFq9FYKbx3NqSrE3VMoHVnKw4lPEgI+rrcrYX7p5vU7Wk3RF3x5wxejE
	rXLnsdDdUbaZb7O94bkcr6WBq4f5zpIsf7OitQgK1aI08UILNkcf60F171G1SbgeuO4=
X-Gm-Gg: AYBFou1i/isxNUQTDbi0tnaLopadan4KiyHH8D2Rn7FKAJERM7rlJ1C2gay+uwuv4lJ
	OWAPxOaN3Fh5wi2HHjsEMdtn+UlTqRY8GO06rTCDkQ5Xhjhdrf4EZPy8f9Mpw7V3MoZXbCPqjsG
	SrjWa/f87Sb1/FEA0pf/wpeSyxSgqtIqSRNZGo++PORyn16JoVUKF7aYuShSffSJwjPm/oIAm/Z
	G0kCBER6CN6xqwC/jIyqWuXOMN3SpfoWf81KmsOE8A5Vn29WHNm7uXIZguYrejKqajcLR+h9sL/
	yLwKrV67RM+rdch50dEyiDGnVg4G5ggNQRbGgEHL+szl85p1xjjZBLqTSioppIdX9uqgcGap0aG
	mqMB31+eUdhudBcsr92Q4XaVVDNNsYdvnbzUEEqp1TeFlUl0lB+Rgh50vIxxqFKwyCAyZaiqwim
	DW4D+9KfuY9xnyDfGxJkCc91CmhYipJ2zWYbIk/dG30mxsuqdv0usd+XhvZw/9NFpm2/Q5aPq6J
	Xl7ajIecoonbUFB0dc6UKQ4S+R9VxDgbR/bqXEZWnhUoFuCK4uX7pp5xUR2Ak3IbSGrVl6mvBnp
	JMjegA==
X-Received: by 2002:a17:902:f70b:b0:2e9:4175:306b with SMTP id d9443c01a7336-2ea9c08b095mr121636605ad.1.1793091410353;
        Tue, 27 Oct 2026 01:56:50 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c91e1bsm5623875ad.59.2026.10.27.01.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:56:49 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: krzk@kernel.org
Cc: HystericalDragons@proton.me,
	amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	hrushirajg23@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	macromorgan@hotmail.com,
	michael.opdenacker@rootcommit.com,
	naoki@radxa.com,
	robh@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Date: Tue, 27 Oct 2026 16:56:34 +0800
Message-ID: <20261027085634.380872-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027-angelic-caribou-of-wonder-02ccc8@quoll>
References: <20261027-angelic-caribou-of-wonder-02ccc8@quoll>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

On 2026-10-27  7:48 UTC, Krzysztof wrote:
>Maybe just install the DTB under new name if they are identical?

Thanks for the suggestion.

Installing the existing CoolPi 4B DTB under a different filename would
solve the DTB naming issue, but the model and compatible properties would
still identify the device as a CoolPi 4B.

This is my main concern. Users running Linux on a Sige7s would still see
"RK3588S CoolPi 4 Model B" in /proc/device-tree/model, even though they
purchased an ArmSoM Sige7s.

I agree that we should avoid duplicating the hardware description, since
the boards are identical. However, I think preserving the correct board
identity in the device tree is useful, especially for a product that is
still being manufactured and will receive ongoing upstream support.

Would it be acceptable to share the entire hardware description while
keeping separate model and compatible properties for the two boards?

Best regards,
Jianfeng
