Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278490;
	b=dT57zQ1JuH7ja+D7TxF57kBISsPkn+MaaaXfL60PLPWQ9gJxhuRrPvrlsXJk0nQrfEj0
	 KpXwl/yZzwfv0U9OLeKWTLAnoWO3vgKoeA1bwyu5vMMV2EJ0uY5oaozRxbJWRd6cyCYDW
	 USR/D7yQCb39Z7eyLN2Y9KbR6I56Orh4cAtC7ks6XoxD/MR3iaTZZDIonKaOAitG9CwD7
	 52qmMDMaNYcYBbOpAuziR/WnFqWSh6zfYdUtGjzGCsrYPo3AkUe/4yBnT4uNQTTldrtAx
	 kLoIwbl0/fVkOv1fIBCFRORQrziszxM4CWu2yEANNYZOyjBQxPMJpUpoqTN8QQHkESw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278490;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+fY3UxgPsk9bFIXxuTnu66UvjuCEOWWytq0455Fgfho=;
	b=a9adQJ4NgSY/+E6iU0phojPw07LIiRRddTijJIxrpsgDsYf9j+plAaJd1VkU5vVCMz54
	 HC32O8w1Abm3oBAEIuZojL07ADDGPUCGUpa3HJrORWQn4HAfSHwxeAjvTv9L0iAZiszzw
	 KAzCSMg98WQ9habQpGsbjDtqWlohQIoXiPHIcJpcM35zRTpZ8GRU3shyOZlhMSUCTU9gJ
	 wEEDL1DHKTOzYh5kquk9BhTIp2WfYdszNlnZz3KJZHbrolCzWE3yvhjqkvMBWo24w8Ba6
	 vQktg3xN31OQ7yOxPcpqfZUYE2xycJHpnkJQArAAh1jB0UeGrTr7OL0V9/53fnbRR9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c0AAhlmT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350D1606A321
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 02:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c0AAhlmT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ACD11F0089F;
	Tue, 10 Nov 2026 02:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794278489;
	bh=+fY3UxgPsk9bFIXxuTnu66UvjuCEOWWytq0455Fgfho=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c0AAhlmTkdrEPPhDs6PP1aq92x2jeFQIiH6e+5IjLNHpOaNjwjO8mmBQTt2q0kJLg
	 8lOONa4qEZqHOypjjvfIznFakTQF9b6U6SUJm24Gj5MZhsD22Pyo7n1D90DvVmMAgB
	 Nsy9yLOAyDkBqCd1ecNcxzv/r0fB8l2WrU3X1gE/H9zSC8woSgvN0eKn6QbwJVUnju
	 hEv/3vvFx1NEfT0uuq2RqKlRMDvPc3lFHbk5WQFPhgo+5ZVj2hBscx5V7CbwHPZKxn
	 G9byuIb/Ged8uY+A0tkiVWaB14pkjyKdngr9sAS385MLSmWW6G1LXeq5hIqmbFwxMv
	 dLLwNaIHVSjMQ==
Message-ID: <sashiko-outbox-206060@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8750: mark the ADSP fastrpc node
 as non-secure domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110023153.84262-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261107032646.32363-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261110023153.84262-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 02:41:29 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] arm64: dts: qcom: sm8750: v2 revision note placed in commit
  message body
- [Low] arm64: dts: qcom: sm8750: qcom,non-secure-domain placed before
  memory-region
--

commit a18d45b6dd4c9437dfa6368a1222360ec6bb808a
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

> arm64: dts: qcom: sm8750: mark the ADSP fastrpc node as non-secure domain
>
> v2: add the Fixes tag requested in the sashiko review
> (<sashiko-outbox-202531@kernel.org>).  The diff is unchanged from v1.
>
> On SM8750 the ADSP fastrpc instance used by the sensor core (and by the
> other non-secure ADSP users) is the one the firmware exposes as
> non-secure; the CDSP fastrpc node already carries
> "qcom,non-secure-domain", the ADSP one does not.  With the fastrpc driver
> keying the secure/non-secure split off that property, the ADSP only
> instantiates /dev/fastrpc-adsp-secure and userspace never gets
> /dev/fastrpc-adsp, so libssc/hexagonrpcd cannot attach to the sensor PD
> (qrtr service 400) and iio-sensor-proxy reports no sensors at all.
>
> Observed on the Lenovo Legion Tab Y700 Gen4 (TB322FC), which is SM8750
> based: without this property /dev/fastrpc-adsp never appears and
> iio-sensor-proxy exposes neither accelerometer, ambient light nor
> proximity; with it, qrtr shows the "Snapdragon Sensor Core service"
> (id 400) and all three sensor types report as available.  The change is
> one property on one node, matching what the CDSP node already does.
>
> Tested with `make CHECK_DTBS=3Dy qcom/sm8750-mtp.dtb` (no new warnings; t=
he
> single avoid_unnecessary_addr_size warning on dsi@ae96000 is present
> before and after).
>
> *** AI-assistance disclosure ***
> This patch and its commit message were prepared with the help of an LLM
> coding assistant.  The author reviewed the change line by line, ran the
> checks quoted above on his own hardware and takes full responsibility
> for the content.
>
> Fixes: be9d54c35312479ed92c85aec3cd43153513210d ("arm64: dts: qcom: sm875=
0: add ADSP fastrpc-compute-cb nodes")
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

[Severity: Low]
This isn't a bug, but the v2 patch changelog paragraph belongs below the
--- separator line so git am strips it rather than recording it in the
permanent commit history.  Also, the Fixes: tag should use a 12-character
SHA prefix:

  Fixes: be9d54c35312 ("arm64: dts: qcom: sm8750: add ADSP fastrpc-compute-=
cb nodes")

> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/q=
com/sm8750.dtsi
> index cf947acc57602..9302481b112af 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -2571,6 +2571,7 @@ fastrpc {
>  					compatible =3D "qcom,fastrpc";
>  					qcom,glink-channels =3D "fastrpcglink-apps-dsp";
>  					label =3D "adsp";
> +					qcom,non-secure-domain;
>  					memory-region =3D <&adsp_rpc_remote_heap_mem>;
>  					qcom,vmids =3D <QCOM_SCM_VMID_LPASS
>  						      QCOM_SCM_VMID_ADSP_HEAP>;

[Severity: Low]
This isn't a bug, but per the Devicetree coding style and
scripts/dtc/dt-check-style, standard properties such as memory-region
should precede vendor-prefixed properties, so qcom,non-secure-domain
should be placed after memory-region.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110023153.8426=
2-1-xiaqinghuan@mail.ustc.edu.cn?part=3D1
