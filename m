Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794338276;
	b=sL1shDXzJQmDQmbCyllCrYEYeEPz4U94Y5HYLjkalG5TBpyWsfTkTeIaTl172TipkYxz
	 3znmdyML8LyPWxgVNOcQzIOID49OKcJdCCgK4T8pT3ZC0oCKEFQhD3lg+fDEJmknMDYrM
	 Yt+Nnkyt9Tqa/8Jrcv4TxIXePpq0wmcw9NDNNQ/u3JH2S3OlRmthyHMWAWBhuuiwKTN97
	 zBLTpq/6FsY9bgRnLBNqF8wzBjun0Kj9uvpGC19/7kqWIymMVFMNy3/cB8D++d4t7VZ0W
	 WwIc64V773mOnR/piPPh3xnW3ZXZ0OQeyGPHiUqvnqjD2MkIIbltK5JXzDSevOxNusw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794338276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=puDDZt/C2f5Dzo58o7lKVRrUWtH4KzZHgOy66M1m2I0=;
	b=GQ0gqhOPo71xbzMPH3SotpHF75BiY9WVXSNvVtUSug2uMwH4ZoCSamk5UaRgjByd5sOt
	 c/FLqRq9YGdFbIfZoqh/KEZ1P6DEWfAwtrVW0B4DGOpQFUkFMpMIhJtZj/U3VYyQG0Tkn
	 ji5w+dOPnGQASr0vbJK35qfgeJZ4fn4ERkSlBNEKgcHAM7pTQGIKpkvDdF5ZFTtBdIo23
	 ukkx4SYGXiqv4S8uLIaqIn2+kqtYZMjurbuQdyiuoU65EuBo7m8IEtdOALlk8x5tfzsQb
	 v1aXWD4NqvaH4InQqswkE6qN4hgxXjZ9KOqYOM8lzRH+BcN5Rv1Y8tR/UKPR2ij/98w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wG23Iavn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9858D606A32E
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 19:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9858D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wG23Iavn
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b3541bb1a2so15912467b3.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:17:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794338275; cv=none;
        d=google.com; s=arc-20260327;
        b=SPkIbd7HPV0sGqoTDtGooLyyhNfTMWmbnHpDAOHGgLUdNHGbIXLaNTs2PXa43W0sgt
         2Puv/ol6OrnIAusb2Q/h7oLPkiSFkndQpkMD22xNNWt6jK41iCJU3hEEkZzza8F34SAm
         XpDd71FllO4g/ana3WQvo7piuQykWNAe6ejfo0qfE0ukvPw71S/rlKFz4ex/xWuSqIFU
         ObM+hfkqcj+DzXfIauYmBc+itQw33oybT6+Ly0OVih1XI7WN8ztmCp7QtNGzcyaf1lZ7
         RwcIxFKZqMsVHcPsd7N26sKpP7fddYLMQLOkpxw9FAC2yE5Dd/+RdvGmKZJQDGj6Qfgx
         P0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=puDDZt/C2f5Dzo58o7lKVRrUWtH4KzZHgOy66M1m2I0=;
        fh=MRF90n0jpDFV3fxNeAysTrCfoz63z34gHL5S3aKVB88=;
        b=eCdD+dYkqfbVhfLxkWgmWBDQmPnxQLbeuFgwGECySeBX06Swpi1WPHljrwRWM1hl1e
         gFaOSheTxZvJEuWd9zJGSwncA+bMOmBHV29bzfOTF2NzJV4wGc/c4XfRj9aRWHIai+5L
         4eaxmp6alEwpDPb1fJKO/+nubPHRx0iqb6BSaCB2chl9Nr5cxvdSV9pmpu7leKdGHbFr
         +4kwgSui/L4vrEhBaRiAS59vcafw0EqN5OjJGHFPXHGpcupYehvAv5zWLaOOqw6xN8MT
         Ac79V7NMI5jXwntXK1Vy9yACYllfkmt0QQM1iW86XyBjeVE5IGEYkPc8ozqTaWl+EmC0
         6Z+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794338275; x=1794943075; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=puDDZt/C2f5Dzo58o7lKVRrUWtH4KzZHgOy66M1m2I0=;
        b=wG23IavnEf5PBf4OCbe0axelDdxvC0oY3LCq/Qk5QPxH/rJRPbl1XXe8r3rYttBY0E
         fjHM/7cXvWIJOf+q2vNQIwIEjoTrZ4lcPzTPR0Cbory6gtpcZYQ0tn/+iq+VhxnsqAOh
         KOcWZkFlnc03XwyF5ACIQ/5jRaIbKXQNf/1yc+DJPkNi5vpBGaJKAAMxubQtbxkEiH+j
         0nTJQT/37sk8uPHbwHW1hKInsYKMDL7+SMKU7BZGWXjXPlbjMcOy2l6agl9UyQSrvPAw
         LQ8IzBeiVAawq7CUrMxeSucHicW7iOyBOnZJFtiQCNxlMz14X7B4ZKECymH4sJsjiOiR
         lBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794338275; x=1794943075;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=puDDZt/C2f5Dzo58o7lKVRrUWtH4KzZHgOy66M1m2I0=;
        b=jPxRrkX7OJ9zCg8xCJBSNm2DUT8wjzwrLuBfKHnJksGAGkxFokE7TjQzcsOehVwcFx
         wTUSEp4VJJKQV43QGpfgEK/MMmfTLRF+TOZX4j4iN/y6mBax0Ojm4SwrEVZ1Hbl0dlQ6
         x+X7pLetLkGuh+u5X7qGrjCUl4I1/MUI2omLWQ0MM511Te+vjWsJCwfxmodS2MDJdh6P
         WlXqURtT8dfK9adVao5y65uW/0pjCzIHjbK296+UH08a66KtPkCDNjx/xEVXA0Vux3J2
         QjbTOMcC+ktbqJXfxEGPgnB8a7z76lTzxCFkE4ezV+KW0UpaFqdyJ4qC3LNeK5U8Tir8
         1U4g==
X-Forwarded-Encrypted: i=1; AL+hErElN8rW93+P7a4c6T1/18r/Fhf40otLRh5LtM5ziASmZP26sKXqcyS3TRdaywtr2SY66GxSjxVCjGsL@vger.kernel.org
X-Gm-Message-State: APuU4Z87TCCfyQKK+HthCIK4bmkTnpPP263C8kmBA+wzmmrzS25eKjHC
	9nAKXVYyvHLHX1iqXxz1KKq4DYP7wfxunmUkeK6mmsmauSOCMgZGmqjkDyO4G7uraanB1LjFWO0
	emhnRGy/6RuKFkWnKD/cKCf9RSi7BfHk=
X-Gm-Gg: AYBFou1XojfxABTTExkPFN+1/SAUBeqMn16zmUVzTAsob9X7Gq7d/kDoHHdma4QKTs0
	ZuH1t3a6F9J/vwythvrROe3xrNHW+32C9kNmABK/KYTk69S+I+gW84lCszRg6eVkwI+hj74cSUA
	0iclThMZLMv8P/SVD6ecFS/4ccYQcG7D3xo5euLGViVYW6Ib7D2n/Ay52XC6c+L4VDH0tICoe75
	+/55M7NWtzKSSPWhu8BPbkj404GE4Kgw5S4C3ToZJEvBnpueGet3TpmaTBMy3CgBslpCkFZtfse
	LjELt8qdmG+hORops+iqazC54dx5xrE2/I7JbwPEBzlcdABQGnPt/fcabTDc3o+JcBb30Pn/61i
	MfdzUvRyVdn3w9eAOb9nE6W+fdNg74H4xzu/WqA==
X-Received: by 2002:a05:690c:a045:b0:8b3:59dd:11bb with SMTP id
 00721157ae682-8b3a80904bbmr1548667b3.32.1794338275490; Tue, 10 Nov 2026
 11:17:55 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-04-k3-pm-support-v3-0-b9dc0857039b@kernel.org> <20261108-04-k3-pm-support-v3-1-b9dc0857039b@kernel.org>
In-Reply-To: <20261108-04-k3-pm-support-v3-1-b9dc0857039b@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 10 Nov 2026 20:16:00 +0100
X-Gm-Features: AclHuK8pMvnG1Q-j9dHb2iJ_gKQ1ShQm5guoJXhhleP_Gp1CskmuEJKcLhqrA_k
Message-ID: <CABdCQ=NCwHn_Qtg-KZCRYWrruDWrP5Fdpeq_Ci_vtcbm92hEkw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: power: spacemit: Add power domain
 controller IDs
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Patch 1/2 is unchanged from v2.

Tested-by: Iker Pedrosa <ikerpedrosam@gmail.com>
Reviewed-by: Iker Pedrosa <ikerpedrosam@gmail.com>
