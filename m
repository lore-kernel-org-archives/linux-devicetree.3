Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC28E3DB320;
	Wed, 20 May 2026 12:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278417; cv=none; b=MtXqzmNUlx/AI6DxJ0lBYD+O6+ahy1+vcgjdBux7CljXCkTG7Jsg6nKqC01J7aYFzWPsUt915x5jBAV7vdICI0iLr7nZBtFkbHAV82xKHp9mFQ2548M+fgldhFsfFZvkXGcXvvnOeZYbxYeyt1fhcLv7S8JkTVRSxZyHISjIoB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278417; c=relaxed/simple;
	bh=eJsuDBXfnaLF6D4L64VZ7eXC4sIgQoPF5eqTtmWx8Jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I7MQf77/25aTsFz7NvAh91VYbT4jU9VsHNemVid5LawDS03GgML3jy2HMOGwhq0wPDohgccQiDpK5c9ztn6XYRJtylDkARRhxtNwxTMJrmW3vUZ+L7G7NVbggE7As0biUAk49XG5mzRQuE+iD6Zma14Fc9wGZFMolBWC67kmKkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BmuDi27H; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BmuDi27H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779278414;
	bh=eJsuDBXfnaLF6D4L64VZ7eXC4sIgQoPF5eqTtmWx8Jk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BmuDi27HZC6NSgE7XtdgzNVEhrJ40Md5H+LnJYwAV6eXQQyE6UBDx6LiE7maAT71Y
	 PzE9itXp+v+uzO3RnfLLCL5oId/dod4yNon2EeyWe28S7fh61Dj7ejdLEkcKrAGO5u
	 JLFIyQWrcK6iM7nYKM/j0EDel9u8CC9fOQ/VEPuzpdsRk27qNFZdabR7jGJ4O7Z5RB
	 Gl3rxpIKUCWT3c+yO3IjFLAHxwlySO1sKCAhLixM2zusMzxa2PDaYDiKKzoeQh+tBz
	 cqeDrIaTxAYOSXV/xD9yv76G87t/Q2y5CRdkX70RjtWQIxLhQO9fa47PUWGh7iuf9M
	 fviSspxr3CQmg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6311817E040C;
	Wed, 20 May 2026 14:00:13 +0200 (CEST)
Message-ID: <ff184540-be24-47ed-838b-18e9fd260161@collabora.com>
Date: Wed, 20 May 2026 14:00:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH PARTIAL-RESEND v12 0/5] Add support MT6316/6363/MT6373
 PMICs regulators and MFD
To: Mark Brown <broonie@kernel.org>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 lgirdwood@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org
References: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
 <agKBkUBVM81Y6MUk@sirena.co.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <agKBkUBVM81Y6MUk@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/12/26 03:25, Mark Brown wrote:
> On Mon, May 11, 2026 at 12:13:50PM +0200, AngeloGioacchino Del Regno wrote:
>> Changes in v12:
>>   - This is a partial resend. MT6373 regulators and MFD patches were not picked.
>>   - Rebased over next-20260508
> 
> Is there a reason why this is a single patch series, are there any
> interdependencies here?

Just showing the full picture. Nothing else.

Btw, seen your feedback on the other patches, will fix as soon as I can - thanks!

Cheers,
Angelo
