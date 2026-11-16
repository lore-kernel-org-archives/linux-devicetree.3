Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853981;
	b=qDUDX3pGk6MyWx6JcgryPKehH8ZMUOrOVdU/KzMpksUuJUZviuOEB85wCQeDmnHSE6X2
	 iqvGHUAgJr0Xt1X+EwBknf5g/7Byx+Wn7GRUZTwGg57XW+TW1ean8gE/7ijOq2brfdE4W
	 IVI0pg5L5laTIlD17Q1ySbKzTumlmcoKAjqpGjU8h5IJd2q7bAgz3UhMUhjhbXUjfyppv
	 sbp6E6p2CijjRYNJ1229d2QZIJ06p2vVa0VxEVyDEskX/skR8JP6PMYPlDoU6s9BvOPwE
	 V5wTxaUgKlT7ObZPWz343Ckyc+elnGexHYw7qWAJc9ZAKukO6Vz9oHhFReD5SljHTEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853981;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zcD4i+6qJ9A9x9hjT6jGAgh1VhwsjsDFSaS1yjqJXcI=;
	b=LBw3vzIsW0cKMNNff6Ib/pNmO2/E6oV9iABHdsdOWuKY/xIYZkPpyoNzYp+rMrqhgJZo
	 U2WQqKeSpIwTpNkTAV4/wCc8stiqIrIHu1V9B/YDXLs9xUbaf2fU3MZMYbcBf1hx+lhqK
	 IE9KN5qRHSDFYpE98q19POiCIanOJvMHiXt3g+WFsI3G330nsNytb3VEKSjlchQf/7+Jp
	 eR3iL+94CwYDsoyI5/0dU94uOtZajLNTcKje5rimdRUoqY047cbgCu/ucA20SwOaoIJFC
	 pIo9DbVGpmzkBHKye2S1cXDhZKe/b4ukL/wb8LZ468xgdXxqrXpKGmIZ+4SxoWk6a3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OGVsMzz2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB32606A332
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 18:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OGVsMzz2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 981021F000CB;
	Mon, 16 Nov 2026 18:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794853980;
	bh=zcD4i+6qJ9A9x9hjT6jGAgh1VhwsjsDFSaS1yjqJXcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OGVsMzz2iAbtRCPcaRaG94UlMCYeu1S9aIHgwA3DxgqYJzLSb1VRhJG2hBX2aoy1g
	 OI8KoAJas40DOug/ODxhShirXR9VI52bL/p/zDhNDh/9soo0IFYDQh08WuFqKOxizF
	 c15TXGN2lgV9okic6UcncV4H4oFVW0BoOnob1hHm2mnAKSbUgYYueLsdycxC0Mygxi
	 eIjcvWVeoa9Id2uFkbTKUT7ncNwSfUHMEiXfv1p06mnVscIqKaiCyvR27TyASCUjsm
	 ZKfl7U+vhQLNCoYqCQgVORX1ctDyLSVkfgZbi5h4n7NdcKOhg0+w7voIO4dX+5AQdn
	 7xBmM9kl/D6hg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: devicetree@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: arm: vexpress-config: Drop ineffective label limits
Date: Mon, 16 Nov 2026 18:32:53 +0000
Message-ID: <179485392567.1194145.16529125297063579790.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104151042.2776368-1-sudeep.holla@kernel.org>
References: <20261104151042.2776368-1-sudeep.holla@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 04 Nov 2026 15:10:42 +0000, Sudeep Holla wrote:
> The core Devicetree schema defines label as a scalar string. The
> vexpress-config regulator, amp, temp, power and energy child schemas
> apply maxItems: 1 to label. This keyword constrains arrays and has no
> effect on a string value.
> 
> Remove these ineffective constraints from the child schemas.
> 
> [...]

Applied to sudeep.holla/linux (for-next/vexpress/updates), thanks!

[1/1] dt-bindings: arm: vexpress-config: Drop ineffective label limits
      https://git.kernel.org/sudeep.holla/c/8c2f870460b2
-- 
Regards,
Sudeep

