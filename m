Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E2E435531
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 23:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788047578; cv=none; b=DE7wW/7ryboL//CpzpC4K5ZJue3pvVpZ6YrXCnFFc36yF6GCy57N+QYhygMDMUMOx8HoZCCe4PcAk/L9YFesKau2jlnn0NPliiEC+synsMbaCwXIdMKto8CvBO/gw/23wagt0Ut7wjeJTZYEOnyLuPDrOPyF7PCv2QcluZQhfRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788047578; c=relaxed/simple;
	bh=c3JAQhfMKNk+6kiMRPSrnUdsXyQEdot2+hCdBfwrLbo=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lYYHN8xPqg5uIbS5jU1HyZBktqawzlTtEF0gySp58WpHa8ThnpviJO+Y+gxBUgULPH/NKxcyrxbDU3LNerCXe4diCuDw8fn+75KG+LT3+i+vx/v4W2RR78C2yzfMP3ghmWuAzMXvmTnCBEhDtMvPyzZQMVMv6YDTAb6ikFxDTtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=W1G0yDCZ; arc=none smtp.client-ip=109.224.244.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="W1G0yDCZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1788047574; x=1788306774;
	bh=c3JAQhfMKNk+6kiMRPSrnUdsXyQEdot2+hCdBfwrLbo=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=W1G0yDCZBPDzF6iodFIva6eQ9hApFb5ZLxek8P3Xs1rRPWT4lMB9skCebRaEicvyZ
	 UJGr+ydM3VH5biezkeVsSa6+T2Hu1UY9bDOeGI7YYQLpqivGf28TzLME0iOlg2L+F4
	 YEbgUOOZBBKkU6yXdQORxGQ+a6gu833PmebvKHK47/gcon5nzKTovbd3aaFwsmAIQB
	 a8qPi7y82PJGqI4v1kzb09vvduBgyFjzEWfB8PUkf3U3+fmFr8kYEEzDHnYrYHABdK
	 kiEfvTzRgupvO1aBEI8U12aZL5N3pJw5I8A8KejSngXz4H8UB2viYs8tF2C5LrVYzk
	 eXMtXZ9ikM5Bg==
Date: Sat, 29 Aug 2026 23:52:50 +0000
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4] dt-bindings: soc: qcom: qcom,pmic-glink: Add compatible string for SM8475
Message-ID: <667aa4a5-c14c-4dac-a141-d4f908767eb3@proton.me>
In-Reply-To: <20260829-sm8475-pmic-glink-v4-1-0c646c835f7b@proton.me>
References: <20260829-sm8475-pmic-glink-v4-1-0c646c835f7b@proton.me>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 5d54c3a174ac90576f655080d4fd8fb38fed6448
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

For some reason my mail server sent this message instead of reflecting
it.
Please ignore, sorry for the noise.

Regards,
Esteban

