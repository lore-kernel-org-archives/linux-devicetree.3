Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch [109.224.244.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF7A2F8EAC;
	Thu,  8 Oct 2026 21:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791495578; cv=none; b=W3TgZ9KN8JO7+NKQpQYXIaWqUeWSiBEkXrq9qxuFaxctqA7Q3Ij6XjyaSVZ60yY9yj5+UzEOzcHO+pxEV2ZBaCmiENpT9dtfPg5P5wZxQhdXPHquvB/YkU91AlRW89wY5efWMF2ZsfySRS3j7mdC9ZJ7DMn1+aVDHv9bZtLNucI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791495578; c=relaxed/simple;
	bh=xSjNxiodg+6yd07ntk91k2iFIK4a2SynGiN3plsLjO0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IANXzIT6gea9UpS8nBkFXK2yy5Bszm6kCpLwrlfggoVHH7dG7OL9H7ccrYHorvgeTy2Bv9cQDNZjrYXAzLEmeOkfh1KbTvmplcf7qGjJennlQa54A7AYnEycpZADi1Zo+dytdcNhh4xvJESVxL7lH8HOe0dH6ldoDFQ/A7q2pK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dawidwrobel.com; spf=pass smtp.mailfrom=dawidwrobel.com; dkim=pass (2048-bit key) header.d=dawidwrobel.com header.i=@dawidwrobel.com header.b=mtS1b8yA; arc=none smtp.client-ip=109.224.244.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dawidwrobel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dawidwrobel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dawidwrobel.com header.i=@dawidwrobel.com header.b="mtS1b8yA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dawidwrobel.com;
	s=protonmail2; t=1791495565; x=1791754765;
	bh=xSjNxiodg+6yd07ntk91k2iFIK4a2SynGiN3plsLjO0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mtS1b8yA53AqbOvYKBx3JH52RLhEuQ9k/qxtNwwYeknk9Q7E0scU1yDn17212pwXK
	 SkWaJ/tsyNU5Df9pNVy1gzy5fEZDEeoPgHIi4tJBhzmtLilLEPULbIomgLpDcIGyrp
	 tU8k6TnEFqPFH3xT9zW90mzSl1yHVvHuKBgXoaPOMJcb7d61jzVlHE/bxFRI4Z8hfa
	 7bpUs06gSedfvkQbVSgOdiA5Dk4I95YLdmoRw0X0woMR2uMhyhk4KcbYvAMoZYlmya
	 TOfeFA8dZTrT16zecCF5nhfDULi5eIretDZbuWu6l+DAMA7wW7mPsOZVC1I5YUIxP7
	 e23Wh7IG2TmVQ==
Date: Thu, 08 Oct 2026 21:39:16 +0000
To: Jianhua Lu <lujianhua000@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Dawid Wrobel <me@dawidwrobel.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: add the Xiaomi Mi Pad 5 Pro 5G
Message-ID: <acd0ced0-533b-40e4-9514-1c616da6f9cf@dawidwrobel.com>
In-Reply-To: <20260908-sm8250-xiaomi-enuma-v3-0-0198c3bf954a@dawidwrobel.com>
References: <20260908-sm8250-xiaomi-enuma-v3-0-0198c3bf954a@dawidwrobel.com>
Feedback-ID: 173987960:user:proton
X-Pm-Message-ID: 71766e61f2fb574fd04937a409dd73e56ca88dc5
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 8.09.2026 17:56, Dawid Wr=C3=B3bel via B4 Relay wrote:
> The Mi Pad 5 Pro 5G (enuma, 2021) is the modem-equipped variant of the
> Mi Pad 5 Pro (elish). The two boards share a design, so this describes
> enuma as sm8250-xiaomi-elish-common.dtsi plus the three things that
> differ: the board ID the bootloader matches on, the panel compatible and
> the WiFi board data variant.
>=20

Gentle ping.

The series has been on the list for a while now. Krzysztof's Acks are
on both binding patches, which remain unchanged since v1. Konrad's
Reviewed-by is carried on the DTS patch, with the two nits from his
review fixed in v3.

Anything left for me to do before this can be picked up, hopefully
still for 7.4?

--=20
With Kind Regards,
Dawid Wrobel


