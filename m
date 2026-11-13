Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533684;
	b=Mmexz4qV+UJzNVb+LcowbtNJJSYt24HwlSv9XqWEUAT2vtPIak9dnUAuVa0igvF/Pxa5
	 6qHv8j1iVLMXhJ1iqJD9z7zYtDftDZ0W38o+G4zQR81kBCciH5Rz7CfYTZONmYyw52jeq
	 V9Q6eSDobXNoyxrbcQ69jgQKs825ndtt8k8EfesL/LmAaN5kkkoqG5I5sUilHiBT5+uez
	 dk17eYClLdvKcahiCBJEMmPIhO9r142eT+HoJevs56BsVq3ADnSe/SaQVWpQaDXLIkZux
	 eN96PH9t0eRsiNyzhEjDYKZhRCg89DC+cogz8eXw6Cb9ltem097S5qMGFx6KqPgySbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533684;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=G5cPLHOu/smKxDh4BisWUuxZ6D1fTrgjFUJHvQzy3hQ=;
	b=JB0OKEPaW0AhnbRon1LCDkP/KDtfK3cRY26OeAHqZw1KOqZmxXm36Jhrq5z4BqhhGA+4
	 YFKZF0pYpnVA8v1RVnH9tDELbD7p4qm1ZrKF1vqOugyuKLf0TrQoHDP2dg/R5+UDxmF6I
	 TtOzRW2EeU6iyFpJIEi9C8gp7IF46eermECPHbDRs8H5Al2ktVebG2HK3Zt1MzMzvaAOw
	 kLgJJD3snB1EBM85uiTMP3RJ6LQ4Gzd1B6rhFYSBW+d2aLiQEYSuxeuTWJX6Inesiu0ga
	 YnllPMvDNXkdCy1GH3EVbwl5mBXFAX3FMOtiyOYiKao+qjtXyytspKgfdHQRrkLL5ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=emoPdwvk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5601606A339
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 01:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=emoPdwvk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392071F000C4;
	Fri, 13 Nov 2026 01:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794533684;
	bh=G5cPLHOu/smKxDh4BisWUuxZ6D1fTrgjFUJHvQzy3hQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=emoPdwvkLBONAGCp2qv4dSeBe6bs+xomGXwKneQ24hq8oV3bmjOrNTOoDvdbR5Q5+
	 u8vCt0ZR/9gsLJq6keG3/FiXe8MD7T8Kye2RbAJUAnB+VKx9l3RM34GL42D+xVxXPT
	 OwE8SYdCcYbFHvLy0dpgvC4qFR5JYUsHo11hoRQGAnyRYjGw9g7awh5uebrWkStGKk
	 b4sNLb/OMP9hBeGjLd4/9E2SIkkbAg1jY7TJQB85z+n3rmtWR1RsUHooPMQ3a/WtI+
	 2xrWuIeYRLjg62fOhefsgzYMTiQrDl+WTeAZN6F2IWogicTcgG1uleIUx0mUZe8A42
	 ZvdiJUkkxXDQg==
Message-ID: <sashiko-outbox-212066@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 07/12] arm64: dts: qcom: sm6350-lena: Enable PM7250B
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-pdx213-upstream-3-v4-7-4b01c50a821c@erebion.eu>
References: <20261113-pdx213-upstream-3-v4-0-4b01c50a821c@erebion.eu>
 <20261113-pdx213-upstream-3-v4-7-4b01c50a821c@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 01:34:43 +0000
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

commit 77c2a693eb35ea890a4be634ad96dc8d86e34270
Author: erebion <erebion@erebion.eu>

> arm64: dts: qcom: sm6350-lena: Enable PM7250B
>
> Enable PM7250B and some components on it for the Xperia 10 III.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: erebion <erebion@erebion.eu>

[Severity: High]
Documentation/process/submitting-patches.rst requires a known real human
name in the Signed-off-by trailer and Author header rather than a handle or
pseudonym, as required by the Developer's Certificate of Origin. Could this
be updated to use a real name?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-pdx213-ups=
tream-3-v4-0-4b01c50a821c@erebion.eu?part=3D7
