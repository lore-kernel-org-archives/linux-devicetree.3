Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795180822;
	b=DsHAyumrSKAcvtSiXrujtridaXCPishfYbliaQHCUQBgPFT0tFbcKVNgAfwsj1GXfjvG
	 0My7ptw2lC2pZT5TxkQWzoYoRvw3lv26YjYDY8cG/4aTvbKlWCMbvZCx9n58/5gpYj97y
	 Cr+wpwHwbMNykum68YkMqW9THYz33zCoXXSsm4mOsAJRaVtEYNrA+k8tsqU2StQrqvO0z
	 5abec8nP94a09q/LyoqI5ye6wl2t9Cd5YwCiEWt9uz6VY+IwSXyeydoYjyyaaqrBbHj9z
	 LNh/CeOBOgOFiszqX3Bf6w4ieH/O5xSzynTXi6qiYXElpeSYNk/41lb3cM6B6Lqu1yQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UG/+FtkvLpFLlhRjXHK8IzxoHZEuN7shKZsx9WuzrBQ=;
	b=2bHuxyCHZzgAVL0PlbiXNCx5O03ozUVI5kduknL8uUvVi1NcvAfIQeaMERfV3ku+o1Fb
	 5NtPhxxa06cOOJjKNCpE3e0jpgI8W3xFpx31t83fVKS/DqOl8ooxr1+eMOyTXEzs+NUB3
	 j3Xzcx9IfHfr4Z8isJ5ZuPCzxn6nsx/tj7P2EfCTBAEDccWmIWA+S+gQaNVuntPJOnSZ3
	 iAds48kb0uRFHLTdy5o47oMR5ZLGV792JRXw5huNRqiRxBvbgXCuGG+6K3yFSbk7XU2yT
	 hwagr9V2vwluH2iphbQX3psKFNJIpfNwqin3T41JJnivFaTfKsHm0SqVemfWyh7KJeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FQl+MLIH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF02F606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF02F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FQl+MLIH
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so550683b3a.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:20:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795180821; cv=none;
        d=google.com; s=arc-20260327;
        b=Q/gp7d5QoVdeHdq6gkMMCx2bNYxKdOj88CAh26Ckq97aWYGnGXOhX0bllKN8rjQb8S
         v/DX8EfhYPUByGA0DOxG06CEclL6TCJQpZLSe6G2mu87W0kAxlaMS9UKNUtirGcnACZo
         ylF7gD1eMcaFtE/zZ6AkW0eb9dYjzXxhZ5Yg23xPlMMcDgg3QKjHbCzH0zAB891mGeVv
         k+NLP+8ZBoXnjutepCnsJgc1Y8FjjZo3tFiVbzgbj4jj+YOyeNAjLWYLH4/Y/nZ3oSDX
         BSbsjpzvzQtsVofMy6/SIdjGVEcixdNP7M4FJIfJspUfPj4lQoLyEhi6mH1xcuQ4ZeVV
         TDFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UG/+FtkvLpFLlhRjXHK8IzxoHZEuN7shKZsx9WuzrBQ=;
        fh=lrGF/RNZKm7rpXuTe6/PgytRPUW+MejoirdRqYxRqDo=;
        b=WzcuYQoAGC0U/BneDisakVYpeZ3WlsEj/GZYBvXYw5OKsg2fbEuFnnfE9akjm2fquL
         i0WADbVO2lNTs9FhKlTreOEdUL1DDFNkICAblv987/xlHEA8/u0XcbxkAdt1fyeTCCXJ
         d23YUlRUa4jY23LthYM0Gj+2StKnbu/1H9AgnRiLeC1OQMCDakNMpdbXfQQQtp7XcRs5
         n5O3GQ4rDR878TpR+xZEJJTYHoquvnGJNF+V3cBz8UKozkMBcYbfV0+SHYlPy/LvGzAl
         r1XD8NdoLJ+cea7ZwZa3SJnJXh3a3BFIKP8ewucKW76T1LiOGpV2QNJGBtzcLRCM4i1+
         bskw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795180821; x=1795785621; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UG/+FtkvLpFLlhRjXHK8IzxoHZEuN7shKZsx9WuzrBQ=;
        b=FQl+MLIHdxwh2JgRj8F2f20mWFiFTwsxLkhLfw2HnmqWXMNLW053JwuDeRIRSNOisJ
         mQaJoHu4ojiilJTpBv17AB4JJsn9/4wDE+rhZoMsNVI2tayYp8cYevr9XtbJVJbLUV5M
         bTY3PTNTRvJLoX9Cqf2MvjnIc3OFp8TnJ7wV64uFNCl6fdQ3rA0hiM01aO2OQQba7GlJ
         RosslAOGIoJECwqw0BKLpQrz3hYjYagI4a9IO37GfHuBVJlihHHPWGevgGJrfumFGCUz
         +39Ls3Xfqs+hwDrG7t/dA6PFRsqqnWURHfyt9OIecMFITiFoJtA37Y0NgWRC8PnidHz1
         qEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180821; x=1795785621;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UG/+FtkvLpFLlhRjXHK8IzxoHZEuN7shKZsx9WuzrBQ=;
        b=I69TLdPoCXEDO/MW272ATYV1/hV4DcGDLuSXwv9JWGo1th+ryPHSIGA4vsPgdYwyYu
         U0LAOcclupNV8JMiNKOpBgrpqkXuvMQAWsHJHdIRL0iXTu+YOKma4QDm4cw0bE6HzEkd
         IFjWXcI8w2JzWqeVyaNLAAqFAlv3rMUeE2D0qzcScn+i3I+lyLw4/PhjQDf3E7wfi3Ra
         rMRt4slkSNSP/SEclxzWB5jsdh/ELmbjbF+l/jWk8EOsSRLmljaqhr9S9vqDGpxwsXoD
         6CLJTvXIHZ/22AxIbLOTlx/7DAm4+mFz/xODhqqERGNtBa6N++06Ne8wphAPmrE6Jk8c
         K9Ow==
X-Forwarded-Encrypted: i=1; AL+hErGVqIRfKufG/VYLLYjsvxjKsHhUV3ICd7DZKO2rG9bCZGlMbJDB+/VrC3jMZT7ozYzhSUmnPbGqjPvQ@vger.kernel.org
X-Gm-Message-State: APuU4Z/lV2l6yFtLt14LWHECUomOZSdznYUvrpaW1EtsWUPBSX92FGfc
	nissg9Th8ugHYvDMuDKhGkQMNyW9kQYwqTr5rsluBtPVpM+fYmd7Yq5UWIIx5dzODDru8XG9goZ
	2EQA4JSUT/LMKfayTXKlpaSpZy67WeLY=
X-Gm-Gg: AYBFou2ihLV+DWrTDa76NZJgCwcMoWx6Z8YI5xAvSklJMP/yT1htvY94U/VG3NXIb8j
	+IxnRCJ96yDidRAKoByQHPD3fzLHsXgh9HJoDaZgCA9iJF/5lOtOWgKxZTecOcON4lDiG0xwkql
	VUofC4DiCDvMftSqPwbAP09Rb9nd3Z5cJx3d+9zV+OcsHvJqB+LoDMh6yXFISeoIA9bUvOmUgZ+
	Vmj4T9PeMh6ugXNRnYTA2tvx2/RL2H8cZzeCND8/mU04C8FueOvFpBiDBCX7IZYYdKFVYcXvOhN
	pB3UdO2nIM+uBvZH5STAwrgQJfUCi8rV0qNb4g6JrfG8gHRWt/Y6Ts3lZfo7pVl6Rb/JN/pc57w
	OO87HsiPDlaC6r+KiftzAznC5UZB3Eg4uuDyUamMDJS3/UPEsNoFMWJ7OvT5mltBJ5+nI51csOt
	mlU3n7TeUThZBO4hu1GCYvHAqRGJ5aSvJexiA1ZiyEterHnLM2ZM4=
X-Received: by 2002:a05:6a00:124c:b0:8b5:b676:4a90 with SMTP id
 d2e1a72fcca58-8c8794b98a3mr3126684b3a.2.1795180820901; Fri, 20 Nov 2026
 05:20:20 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030125024.612396-1-lefteris.koutrakis@gmail.com> <20261030125024.612396-2-lefteris.koutrakis@gmail.com>
In-Reply-To: <20261030125024.612396-2-lefteris.koutrakis@gmail.com>
From: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
Date: Fri, 20 Nov 2026 15:20:10 +0200
X-Gm-Features: AclHuK92flz41PL9Sb5dfrDaVsUaZV45mmq0Zil7HOyndVUpO8HRVID_wLHjZ2U
Message-ID: <CAEFrfdndWX8_xP6N9GzbU1L_ajrGFE+4P260zXOCKqBiN665OQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] powerpc: dts: fsl: Add support for WatchGuard
 Firebox T30
To: linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com, 
	sshegde@linux.ibm.com, maddy@linux.ibm.com, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Gentle ping on this patch. Patch 1/2 has been acked by Krzysztof.
Is there anything else needed for 2/2?

Thanks,
Lefteris
