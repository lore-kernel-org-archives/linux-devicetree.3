Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794113980;
	b=athomhy5JmNKZBLGM25VRlduD9RuLBOcV/zPBHtkE0Tm1DRkt7U2FfKTFNd2gj2Q09U1
	 WWoSFXfViAU/+TicZQ4e/LB9rZVfpmECEaVFSz3Yym0fT0hZnVN8STzdUNTgdbvNF88Wf
	 gF/OJAtdwgMTJTzFTFb/wKbU1rnD36tXlkFXKRJ6UbqiBR2AHuadNd11ISYV5fJnnDaAz
	 4fmwMqwGCefz43tbK/Xqs0FXEu5A4xcYSQ4wJIcczLvAOmrfTfbjIme3zmF+2vEogKbd5
	 o8DPDI5Mxlt8WVsZUPaPLchBq5ZsT56uKZgVx4QpVUwqmxa+DC+R9ACGlMdrjIR3agw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794113980;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aJFXbFabLiH+FFHWDaDOLoJfwaxT3UGi53iuSbQxDPA=;
	b=dMOHb77B5vTqRsO0Bc2TaHq3DYST5Ad2XJVaVggJRa27E/idTTeq7sq0VJQeIhjq5E47
	 WNizrFGAhN+8xoG0Bpjxn+q8pa1RcTieafCnV6VE9LpqhSfR4sXQ4J04Y7T9FD+DGfVSG
	 8FhXD7UIPyA8QUVx3Dh/vq/0EBuo8ZPPVI7ig1ik43TQDky4l7Wy20OdUMZa8ygMQm0ft
	 pKN3rr4M8AynxbgJK8FJBRwN3MHm/JJCJQb0Uq4aQcKbrRiJX0XlJCc43Lec8Ppvmwaff
	 1ggz1vWOen2zoNpeAaqWckiaFqWiuy9l9zMmTdPiLV54dChczpRoepkaDwc/gfFKftA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="VNzX6y/K";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A491606A31A
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 04:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VNzX6y/K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF191F0089F;
	Sun,  8 Nov 2026 04:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794113980;
	bh=aJFXbFabLiH+FFHWDaDOLoJfwaxT3UGi53iuSbQxDPA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VNzX6y/K9Wdk4oXXmjLMWNEF5eUyYjfWSyNCTreJ5NF7qT12okFM3wnaaEakEsCJ+
	 /71O4ZlOtVEqGLo3HDJKDU0nsNkS59kgr8E1f2eB/MpPmd8980WmQ4ShOazVgpTvuT
	 IHdiwAWQGSB2mkabBROCt1bHlB/SjaQNP9mPVWp3oiN8PtHJS7fUYibjZIKCbmn+yL
	 3ATHkbyqyV3cNso18fjC1GFzGJOc84eIYNJQ5kL9aItL8RKD5L7/d0hiIx7ECgFSPe
	 zD5AmiCDVK/SqFEl0+qWH8yIWBRlxRmJdJD8d4/RiAhGt4WnTuA26hkO02QICpl4tg
	 9zvkfpZNsvSRQ==
Message-ID: <sashiko-outbox-203569@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 5/6] spmi: apple: lock around FIFOs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261107-t603x-spmi-v11-5-322490215f58@chaosmail.tech>
References: <20261107-t603x-spmi-v11-0-322490215f58@chaosmail.tech>
 <20261107-t603x-spmi-v11-5-322490215f58@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 04:59:39 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] spmi: apple: missing Fixes trailer for FIFO locking in
  spmi_raw_cmd()
--

commit d27b65725fd5286319f9551943331b7836effecd
Author: Alba Mendez <me@alba.sh>

> spmi: apple: lock around FIFOs
>
> The driver was missing locking around register interactions.
>
> Signed-off-by: Alba Mendez <me@alba.sh>
> Reviewed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>

[Severity: Low]
The SPMI core invokes controller callbacks without controller-wide
serialization, so concurrent register accesses have been unserialized
since the driver was introduced.  Should this include:

  Fixes: 77ca75e80c71 ("spmi: add a spmi driver for Apple SoC")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-t603x-spmi=
-v11-0-322490215f58@chaosmail.tech?part=3D5
