Received: from mail-07.mail-europe.com (mail-07.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1652436C0AB
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 22:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783548395; cv=none; b=OyBAYG1KnAkBb9odvXBCcZIFn9ELccGz9oQVotUBDjoOwDtnWYcvM7tX/qwgV4LQYstISDoqflORcgMhJsYJWlGJtnjRd1I9015ZIYxX8DmEwbN+nICZ4At3K9kwX7SByxOVK06QXmeqBbE378JenA2tE9Lu7N0CaPLAzUQw9SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783548395; c=relaxed/simple;
	bh=KfLmTk+gEbbGwSugv/bddjWjN6nhCu/sMPeLjFkeRa0=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iRBGclbQ+7w08gg526AVOnMu/bjo+jwmUrMxat72NvVFD5SvxqdGFLey0nSokRHTxhceKVNxLD/03BfkzY+v7D8poAbA/lKPetnGuI+8cn9wyunZnX5wiNyEkkHzDeSU4CJW1D7F69WRtYkVmleQyCSEUXs8r6NSRZJYbdSw28I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=HuUK/w8v; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="HuUK/w8v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail; t=1783548375; x=1783807575;
	bh=KfLmTk+gEbbGwSugv/bddjWjN6nhCu/sMPeLjFkeRa0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=HuUK/w8v53PRmfhGxVeIkMVlK149cYGsQJNfK6KKNINCYjs6CSCA7AW07qs81C5d3
	 vhBa0jPLG1lfUbxtthpi2Jnh2KwQutogSb4pM+Am4Wz/kkFoTDAUiYy432LTZWyU1i
	 jyvdXo1TrJFAA5Ws70B5ZmKGekjPMlgC7wFhoGJzraSR86shrUBtjjZTPJboaaKMMj
	 0tOagP4i3t2yDq6YNvOAtD0pgjND8om3LI6B1fPzTupvxDK8LOzgTv1hsJaPz8WpEJ
	 97WcUwejWGM9mQFcdE4NmVn7iR83pudp4A95e0s5/gGvK3BFXCtXrhN8zzYh5KmJrn
	 bl6YcAQ91FoAQ==
Date: Wed, 08 Jul 2026 22:06:11 +0000
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-phy@lists.infradead.org
From: Bryan O'Donoghue <bod@nxsw.ie>
Cc: Vinod Koul <vinod.koul@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Subject: Hey Rob could I get your review input on this patch ?
Message-ID: <d07f9d62-aec3-4f5f-89ed-186d3be52e58@nxsw.ie>
Feedback-ID: 54899767:user:proton
X-Pm-Message-ID: c55a6c2cafe274bb642771e6158ff90a2642cbff
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Rob.

You gave me some review feedback here:

https://lore.kernel.org/linux-media/20250710230846.GA44483-robh@kernel.org/

Through subsequent iterations of this patch we have added a=20
port/remote-endpoint.

Current thread is here:

https://lore.kernel.org/linux-media/3ab676ac-919b-4a80-8dd6-71dd7f6fe06c@ke=
rnel.org

Vlad's point is that linux-media bus-type should be used to define the=20
mode of the PHY. I've been sticking to your original suggestion that the=20
consumer defines the mode.

https://lore.kernel.org/linux-media/6b6492a4-7610-4dce-a81c-8dc0387a4061@li=
naro.org

I've been citing you but, I should have _checked_in_with_you_ given=20
evolution of this binding.

Perhaps its something Krzysztof or Conor can resolve from a DT schema=20
perspective ? I trust either of you guys to "do the right thing" - I'd=20
really just like to get an official schema maintainer steer on this one,=20
so I can close it and move on.

So: Stick with #phy-cells =3D 1 and the consumer selecting DPHY/CPHY mode=
=20
or #phy-cells =3D 0 and inferring the mode from endpoint bus-type ?

---
bod

