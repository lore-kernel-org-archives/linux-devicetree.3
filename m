Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793068091;
	b=lzf9EO860+U4FPtTDe4SGb7T2jFzGUObamHMhJtA0KNK9nyKYosrKTBhh/VLDo3dltX1
	 duoWKnQaFdieICczNIO1iCmvC5PpGSKI0Evdcm/FmJFE/SRujogy0h4iYKyNlMyKcYKb9
	 IsieIimOri0N3kh51Ya8bJR2n4g0/9RHeoIAdb/zPE3AvcfPrJQ1SpU6crrTAg05WSviO
	 1qe8/kw+whCUCtX9UGVxrQT9AKEgzIfb3bzjDo+ApeQO7aPsmU2lnk1RMfS2Sw3wkKC7g
	 7cPXB98xu6DGuR1IhKU9nLDKXofEfwE7RftKXJ+WKHcXi/FDbTuLW9/xpAYtEdcotXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793068091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/WcSLowB0b2pojOqzb24H45+MS/MsdePMGuj0DzePaw=;
	b=lsAtEqlRtEsAgHmNI1KiPrc91PdVmN0/LzYj9KDdq8bgLtUBsLzGI1hawrvxYjNfblsX
	 f7psH0BW4uwwk4LBuOX5jBMdPgbE2hGmahuXp+/LGoHzRVk8IBEUJ993PVvMrLYHRxvQV
	 EfEulzEt0EuQcdy9e457jrDgFMyMi2m+wlC5yX8UgL4F6zqLRel6/+0z2hoeDZYNnbb3O
	 0eNrIgsBl+9GP1/O3MaMuFrSSSzu8skJ4BIPHSw2iCk8XqTzj83NqDJtYRjXRqHLyGesY
	 S8PMfCKEdjrBJFAY3DUeLY4PVa7byb2chwIZOXOEIxJUZ8dRTGGEOQWdz7wTjKTvtIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FzL4qcf5;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DC3606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 02:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09DC3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FzL4qcf5
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ad0c2e71ebso500606a91.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 19:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793068090; x=1793672890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WcSLowB0b2pojOqzb24H45+MS/MsdePMGuj0DzePaw=;
        b=FzL4qcf5NctPk7sLx8O3gWaS1C9SHXiT1ufLwisUE9VwvAaArWAm5S689nOyuHSoNt
         Ezz153Uml7Pmd/ZPe6/R6zHuNlce9cGwOkZNh7JZDwpU6nNmG/DcS32glxJXs+BoLnzg
         XDiWdDPIkUGznzfOvEGnNE4+dWQEKQgpcQahgCp+bwIJrgWsDY2nkZZDtaI8UOVicr94
         NA3tVmG/EBTT/qKCRlIMgKfkB2D4N6o+8S0fvuyVTV6DbgLW8624hHPafYudfg3Dr9z2
         ucGU0eD0Vi/f2OtKbyfD8B0dAMkPtJcc5lOcuLJ743eWUQu3WDUoiPvsiuUF/UPhc4tE
         kwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793068090; x=1793672890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/WcSLowB0b2pojOqzb24H45+MS/MsdePMGuj0DzePaw=;
        b=IS2mFjp/XCVaFj3pbOc2HWfRyqO3zga/67xrXbEH646gd2aFA8Wyh39balkSUQv5D2
         j4Cf07p0a61B4bu3P8oR+k8/m2wD5stjyNj/vzqHHELRXQOWGWTMCZH320hyynd6gnIa
         DDC24ZLOUpAwmN4GV02BUU3pctYaGKT74m7Y8lUPEM4uXEbe+T8READmAj9eA4sWewZd
         IJdlIG7yVIsJ1s5CG+t7CwIBpSV1tQWzawKSFih9v7ZA7VmhoajxTjVYZTQMXNTrHp3I
         4VKCAV2dy60ulaioOdQtqKyMLe3hK+3CQelWNKrQYi68+p2dt3AhK3ZbMwZsf40w0OF4
         rqpA==
X-Forwarded-Encrypted: i=1; AKwUvBxgfLRHLwNu/iVW+m1nkiViL0KkPY2fY2r6PrUrKkp7VNMoF9jlSbToA3qDbWaxFPbSyuJN+CbpDbxh@vger.kernel.org
X-Gm-Message-State: AFq9FYKKMjRugNAd0eLj0J4QCZFBkBLoNs41oCWX+EXvDeDM4ICAPjVd
	nO1UKOM46K8CLY9wdRyRO3VYSY+VmQz2heuMvIqO4rPmKCvxnuFyME+O
X-Gm-Gg: AYBFou2pXfqHsPet7lr1PF90PVuY51a5gUc8ou3RfEnvTzyfGxlrOhEjVix02pWziTP
	1s2zgk9laB7rM0PC0gWGs8+HhG3oAultqCxaSRZ203T1Yl7Pdq0RsWQ+5mXIq0v0iM7PXMPHreS
	ePpyUA+wngAnGCrAxaWoFzdktED7DFSjhec8xmQ3WQvleegEawdEpNBFS59nDizWL8zs7KDrz2C
	itRTe7vaJ1/RO+01yK4fMCaIYWV9mj/6thUuiw9KSqB77b4mcG0+BITTMkN1aDKs7BlGKWf7Dpz
	s6G8jB5uT1v3Nygjth+1xhpA3nR1oRiITM7sAV7BRVatesA/D0ZQrJl1fgCOPN7hAFCOvZzIQoY
	EcyuOc89uy6BKVpP3QFw10SepJ4Gs/BeLbvB3QtWZwkDgfk3wZi7s+dyYQqRHpisfSPuF0lLJ5q
	850AXXuGRO5uDIAMpzbXunQ653iGWnm8yFqnf/jYbtMqR+uJstodqEqGvAa24BTOltjOxkb/hYE
	hgx4hNYdNjjGWHH53iiZP3AOFtAtUyTSWKMvxuwx1vPqIU/kUVNB48Vaw6EAXQt3sIBjfYPmZMa
	z8URvJO5Ef1OB05EPvzp1qZg/87vvA05
X-Received: by 2002:a17:90b:3dd0:b0:3ad:a84b:df1e with SMTP id 98e67ed59e1d1-3adea1af8bfmr12128791a91.1.1793068090331;
        Mon, 26 Oct 2026 19:28:10 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba38910sm6823109a91.1.2026.10.26.19.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:28:09 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: heiko@sntech.de
Cc: HystericalDragons@proton.me,
	amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	hrushirajg23@gmail.com,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	macromorgan@hotmail.com,
	michael.opdenacker@rootcommit.com,
	naoki@radxa.com,
	robh@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Date: Tue, 27 Oct 2026 10:28:01 +0800
Message-ID: <20261027022801.377819-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <5520293.6fTUFtlzNn@phil>
References: <5520293.6fTUFtlzNn@phil>
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

Hi Heiko,

On 2026-10-26 11:43 UTC, Heiko Stuebner wrote:
>> I confirmed this with ArmSoM. They purchased the original CoolPi 4B
>> hardware design from CoolPi and confirmed that no hardware design
>> modifications were made for the Sige7s.
>> 
>> So the Sige7s uses the same hardware design as the CoolPi 4B, rather
>> than being independently designed.
>
>if it's the completely same board, just with a different print on
>the board, why does it need an empty devicetree. When it's completely
>unchanged, what's speaking against just re-using the original one?

The existing CoolPi 4B DTB does work on the Sige7s, and I agree that there
is no hardware difference requiring a separate device tree.

My main reason for adding a separate DTS is to preserve the Sige7s board
identity for long-term upstream support.

The CoolPi 4B appears to be discontinued and is no longer readily available
through the purchase channels listed on its official website
(https://www.cool-pi.com/buy/). In contrast, ArmSoM is actively selling the
Sige7s and has committed to producing it until at least January 2034.

I'm also planning to add mainline U-Boot support for the Sige7s and
integrate it with Stubble-based UEFI booting.

While U-Boot could update the model and compatible properties before
booting Linux, Stubble may replace the firmware-provided DTB with one
bundled with the kernel. Having a Sige7s-specific DTB would preserve the
correct board identity throughout this process without requiring additional
distribution-specific modifications.

This would also avoid confusing users who purchase a Sige7s but find their
system identified as a CoolPi 4B.

The shared dtsi ensures that we do not duplicate the hardware description,
with the two board DTS files differing only in model and compatible.

Would this be a reasonable justification for keeping a separate board DTS?

Best regards,
Jianfeng
