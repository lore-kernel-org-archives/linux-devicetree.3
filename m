Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533639;
	b=Kmwm5mFDOlC7MnV0HGtjB+u7Nwr9a1K/RrgsjUWxHb8tbhtCvdTcwfqj6GoraZNx5j4W
	 hoG48uxs3L4pi+Xr8Kdl2My3/uh1zPp4ogdx83I0ZTUJZMZ3/vF5dNeAcelF8Lnw3nRLv
	 ITpIREeAdBMlqhmDjSyj4GM3WF0WNSWLOj7lpHNAgOkgeDASmInFKt4YYaLrTo7JmVbi5
	 8QB4RzUDY78AD4k384GC3Y6k6kUfMndZeQU732OSwe8X+IE84WjpWyQMYDoqyDLkId6ke
	 rqIhjw5iPfLeKqEJfpnC41Gm/Nrm2OeN9VQUMvoXYmCL6BykYh4QR5MyMv/x6hqRhag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533639;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pXbk8nAr5mOwObpYkax+yv51c3ydDsMqckubch6UOBY=;
	b=tZbQ861hJlWvC4B9T4KV3LsPbornog9im356mk8OLjdcMmpRMs9KV/wgrsgy6PdAM+0s
	 ZS9otjRzXWDwu7lXjx4j4OrPMiT23g0vIHGK+indE6gjl/VZelumNcDwSw4HaBp3mq7q/
	 4sM8Sx5xIEH0XgKulEEVAqJCIdLjxcCj96UGi1Bp+YfdQPQs6HOVuG1ivVSbP+LcM0NYe
	 O2DURIepI9emJIbvgfdeKrr00Pz8m/hzl7OLHTAC+vZRB+fTW3jbKJO7dqCFS4WZrXQ5l
	 PrhlZjWnHfCRzVriWiQpQsBGhywTt+mwWQqzXRsHEfbXS8+7QsIC5jg1/YTVjNFybuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZvGEP6Ag;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A511606A331
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 01:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZvGEP6Ag
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793591F000C5;
	Fri, 13 Nov 2026 01:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794533638;
	bh=pXbk8nAr5mOwObpYkax+yv51c3ydDsMqckubch6UOBY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZvGEP6AgwvLJ4LZVfw2tm2SM/cuOz6t6PExNf6dhVd5/uhdZYgRUbOS8G5/F2gGKv
	 3OYxf34+FpPphK+UCLEhVKnXTiQvHtq5hEkXtyqTPwuZg3aZaqMcgCGhZw+Yej8B3Z
	 VFw82bBTM6rlGvOJuyPV3IqJu/kZdch0B2itJlDGfhEgSa5VZP29NOtEXXPeU3V30t
	 TQIIQWu80sFHL+MBM73ZNH4G4evCQY+PIBJQtIuJgDLiOcWEcMV67v+YmF9RHzrAHo
	 vWzKDhuuN7/y/3t/JnJBUdQzbDdY7NnS1OCNxGOCYleqKVGkR0N4T2RFf2jHaP/BWF
	 5sZFosN5dB1WA==
Message-ID: <sashiko-outbox-212065@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/12] arm64: dts: qcom: sm6350-lena: Enable PMK8350
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-pdx213-upstream-3-v4-8-4b01c50a821c@erebion.eu>
References: <20261113-pdx213-upstream-3-v4-0-4b01c50a821c@erebion.eu>
 <20261113-pdx213-upstream-3-v4-8-4b01c50a821c@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 01:33:58 +0000
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
- [High] arm64: dts: qcom: invalid handle in Signed-off-by trailer
--

commit acc7716614faf15423968aecc6a9f74285660459
Author: erebion <erebion@erebion.eu>

> arm64: dts: qcom: sm6350-lena: Enable PMK8350
>
> Configure and enable nodes for PMK8350 on the Xperia 10 III.
>
> The phone has two PMICs which have a PON block, disable the PMK8350
>  PON and keep the PM6350 PON, as only one should be enabled.
>
> Signed-off-by: erebion <erebion@erebion.eu>

[Severity: High]
Per Documentation/process/submitting-patches.rst, the Signed-off-by
trailer and Author header must use a real human name rather than a
single-word handle or username.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-pdx213-ups=
tream-3-v4-0-4b01c50a821c@erebion.eu?part=3D8
