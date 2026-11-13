Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533581;
	b=VOcycMFz7ftUEZNiFwn9Ag71DAAq+D1mmDD+15Qs+eSpYOF3A0FAtIj6JuQsgZahvlgf
	 D41k8f9l4IpvRrFASdMNwL7sBz7gJxyobP4yPJDthqJ/Y/mzpsPWewVvfedPaGtQQZCK7
	 KJk8ZHNlzYHq/Lthz1XWcY5tJdNok1j5Qdijd7Z66+cinCY2O8HnhZd1QixtMoRCpGdms
	 qi3ByLbJY3kZGguAhPW6dLAUQ7YqZcVJ5vhr/R1r2oNdhxq8AkNDfemJ9xkpJT2nXAQ9y
	 oKs13v7p4aQCFNbVZLI22zCYwR2vWBiNmFXZ1oMbJ5juixmX2AKyIS+Bhuc0iNXr3Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533581;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yQVJRceumFd3S9xDfb9b5jpTVTAv9ljoeKEyL9VyzMM=;
	b=3pd/4uuIAmAor7uurXmexH4hK1djT03jWL7l1kpAg8SDg7URsk677e1eMbT20wZDrNak
	 DMf2dhgfHdTHQQfF2Jey73sBamqEtd3GGfkhdPf6rphD2i/4bJo1E2Bvqg+7xAnMmLQLe
	 Zlo6WAz9UDP/FodFeil5YXWF5h2rE17VOoYFickvPG9xkoJ5cJ+VCs+tR2zV1zNimWQ2f
	 quJm+J7mL+iDadfg8wXfVUvklRqxY5efuCJuWyPncTFINlf045UOHuGgrxMXh89DTaBw+
	 ZkTxFEANZqCUmviS8wrZ/FjBkvbbat0k5HszgJMXs2fFmax0/zKwyoQJkVAcO0KQMxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hlGKjtd/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BABA606A321
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 01:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hlGKjtd/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BC691F000C4;
	Fri, 13 Nov 2026 01:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794533580;
	bh=yQVJRceumFd3S9xDfb9b5jpTVTAv9ljoeKEyL9VyzMM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hlGKjtd/HU4WxY4M9uRAhjiBa88jX/u6l061ApHmmB+lgsD4Nv2UwcVnJ++lxUht9
	 pZxIEWSfI5hMpNugKOxYc/aRt2OS056pj/Hnb9bnW3sddg1mmcKLPCGAitNywc4Wp7
	 e2M0KbYgXaztVVE+eR2DBagf0f7Z7mRhDjnow12lIjt4OwsKtYKi2KHMaDV45L9Qmh
	 556edfnsykGiyMBZtiZAVy89jGey0UWXhF2Txa6N9MnyC53kjUeQjz5Jgx0DGX/cRV
	 9RetbFyUVzLDePOSsK6KjQP5UJrV5YQUt/71jbAoSxJi0VjbkT6SZh3w6ea60PqNi7
	 gHijy6qM9CgAw==
Message-ID: <sashiko-outbox-212063@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/12] arm64: dts: qcom: sm6350-lena: Add PMK8350
 thermals
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-pdx213-upstream-3-v4-10-4b01c50a821c@erebion.eu>
References: <20261113-pdx213-upstream-3-v4-0-4b01c50a821c@erebion.eu>
 <20261113-pdx213-upstream-3-v4-10-4b01c50a821c@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 01:33:00 +0000
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
- [High] arm64: dts: qcom: Signed-off-by trailer uses handle instead of
  real name
--

commit 6202c1bff4c338ba19173eebbf9dc1a6bca1824f
Author: erebion <erebion@erebion.eu>

> arm64: dts: qcom: sm6350-lena: Add PMK8350 thermals
>
> Configure the thermals for the xo-thermal thermistor connected to
> PMK8350.
>
> The trip points can really only be considered as placeholders, more
> configuration with cooling etc. can be added later.
>
> Signed-off-by: erebion <erebion@erebion.eu>

[Severity: High]
The Author header and Signed-off-by trailer use the single-word handle
"erebion" instead of a real full name, which does not meet the Developer's
Certificate of Origin sign-off requirements in
Documentation/process/submitting-patches.rst.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-pdx213-ups=
tream-3-v4-0-4b01c50a821c@erebion.eu?part=3D10
