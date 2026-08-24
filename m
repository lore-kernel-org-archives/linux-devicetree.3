Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476C13793B0
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553722; cv=none; b=eZgcTtSO8tuF4DD/N6hY/N6e6jhRBdZnUSHdnaKAeQlflKq7lMZAqZWu89xsX0IpP80cu1EYcktgk4mEjnRnvPdumbsdKr4cKzXRLYI0nrWh9TpROt+5ym0l3tUeyoUgd6vxhQ/7dzBEaCtWDTlzg2EdE2Z7ZYJr6ktrc15+sJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553722; c=relaxed/simple;
	bh=dsKwyMTSl0c2JoLDgYqT8tFMLjWZ/n+uXCicxpa6Qas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ct9n1ujBcInwO83VQGIoyih270jw/+xWfCjJqPN3UEh/5ajYI8L5Tsm6st3u7fB5NwghZ73h/4h4h+RLQcodD5WwWYYvVLV6Zx0///xoYnLsqiZ6AIX5URVWFrUCwC3wCxnhJDpxIPtzzsE8Vz13WsGdEXjYqrHgkmsi8jQnfww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=Kkp7VC/7; arc=none smtp.client-ip=212.227.17.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="Kkp7VC/7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1787553718; x=1788158518;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=dsKwyMTSl0c2JoLDgYqT8tFMLjWZ/n+uXCicxpa6Qas=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Kkp7VC/7GZUOmjmeXVtu88kkL5Pw8xuZBz1v6v5FFCBttEsVxBpI/wkTbzcGbKo7
	 7wxliO+ntBBK83LuIMSj9pr7bhCZxhGgbWdfDE54UOLFIy03c3+8tfZpUu6OfJgbx
	 hD7xKQ8p3XocKnij4Tcf8RiRdFia6lFuDXqFLQOUHu/owNaYIcpmVidrgrLd5mtPG
	 kZWEtJ+0PxFm22865acCqMV/0StNCSQJdLPEUGtUXp7Xr4L9VzWctzPiUfw0hHqeA
	 /++sWMCv94VyBh+O7DwhC4zTDfyg3ErFf4COTtjXvYYkkUDgpFm67E8Vl3jUmIrwY
	 14K3qggMbiua38DCug==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MX0TX-1xQd9v3gev-00IX4f; Mon, 24
 Aug 2026 08:16:26 +0200
Message-ID: <8ac39bd5-0ff6-41fb-95ac-946efde76375@oldschoolsolutions.biz>
Date: Mon, 24 Aug 2026 08:16:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp-microsoft-blackrock:
 enable DisplayPort audio
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260823-blackrock-audio-v1-0-f319387fc6a6@oldschoolsolutions.biz>
 <20260823-blackrock-audio-v1-1-f319387fc6a6@oldschoolsolutions.biz>
 <20260823084234.73A1A1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20260823084234.73A1A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LxBqr9kii1YvZ/8xubGE4TzQSja5IY17rf65kP2NgAwQ4FymlN4
 ekQ03BBJDeemBig1WNyQ6eE4rt/jnrU+WtPyeTSU+zTTVxhKHdO4HpLKJZjXqOCub+a5fF/
 fXEZs2HtCtFe8CNyLlCoqsAvlleIdOHd6r0WJMVtpO4FmnxOI9nJYky9U/BcUEmCJWhCbX0
 pXxHQOPIkoKyqA8tyaFPw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+A7YNGCvIkM=;+yq6F/my6BETgSRd3jTmUayaYZ2
 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

Hi sashiko-bot,

On 23.08.26 10:42, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:
> - [Medium] Incomplete cleanup: `&rxmacro` remains explicitly enabled des=
pite being unused.

You are absolutely right. I have disabled &rxmacro and everything still=20
works as it should. Thank you for the hint, cleanup will be in v2.

with best regards

Jens

