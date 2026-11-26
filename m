Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691281;
	b=MAWL5j9WyERvzmvLWWM6idsXn/Tq4GPdz/NW/ZdlNm+Co6cN9r86P+QjJ0KkCE1D2TsH
	 mCR9etH36b7q3oMw04vCca6OR9dbkqxOHKoJg4n87yKatkGOydLhBbuC6X3D9sBhXTlg+
	 WkFnpf9C6u2KAZX7XQRWF9ZOK+l8EVGq+yDjQjrQ15y+Uwwzr8ol6mOXhcXtWw2R2iQWx
	 FL3PCmQC9sOyY4hxk911ThyQ1Tnl5+BvCXFGuiNscEf3xJlqM/ZGUqD1x/+UHC5f6MteG
	 mR5ym7iGzgtHriTYl8ewA+vulSFABreuWma/AbX11pJH03KFpJWkXJNlnyn1zA7cF9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691281;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fYqIK+FErJ1y6e4nga17lL1/4WCCjUf7mEHg2/MHzAU=;
	b=s6CwE6dmvHoZfyj4c8JDydwCrE/UkO3Yl0GiuNews/W4F2Ix3OF7Bvstwxm5s1msu4wU
	 yNXtpSBbU6DXl5RC1el+seO9ve05epvpfOB2dEg40qlJ+uqbIvFtZbY7OtNZN0WZnyqKu
	 qBHavh0QmR/Ayvxd1T4f30T01A7594Ab5osORhqeZKa/NFhy918MgsaWrNvg6kh2BkzoS
	 TVGzvdu2zHb+Zzj1Y9MNBzZ2nn/kgWGR4/j7I5g3mnL+G+WRhf2Y9RWtWXB0fkq/K1/9j
	 77dgm9YkjaykxfMwgOJdzyZQtf1G+wE5jzrTKA7ARAnE/nY2tMOSU4Bv/jXVt51rr3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZpMj7Pz3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5D1606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZpMj7Pz3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B200D1F000C6;
	Thu, 26 Nov 2026 11:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795691280;
	bh=fYqIK+FErJ1y6e4nga17lL1/4WCCjUf7mEHg2/MHzAU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZpMj7Pz3JhUFbt1j8OjQLbXlvFOUAC8dQ+cOj55B1QyyGTGcB3Raya9upRAPrlszo
	 Yn9fHhaHaIJalC8OOoiRGHQYa5Wp6qiZDtqROoh5cCuifRcnmq7Z//2BUvJ3wQlRFQ
	 PfpMpEZjPBX0NZfqq6QiULHxbGVsh0Lvy2C7P0op6vtudG3heUmhwbkaK0727BHamv
	 FZdwSNln4j0K2k70MlK8QOv5IQOD4U/s5H5n88GYzXNPCBIbTnlTFjbO+Hbrmw5oJb
	 U+yGIHzZHZV7ANFXjRzUDMnm9UOtmv2APD4w7slT3P/o9Lccm6U7QywlSQj0SUOZhh
	 iAxcQeL5jMWNQ==
Message-ID: <sashiko-outbox-235328@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] soc: qcom: smp2p: kick WCSS after restart when
 requested
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robimarko@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126105722.188103-2-robimarko@gmail.com>
References: <20261126105722.188103-1-robimarko@gmail.com>
 <20261126105722.188103-2-robimarko@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 11:08:00 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] soc: qcom: smp2p: interrupt storm in qcom_smp2p_check_ssr() [1]
--

commit 4020c9b303d93a1d27eff1767bf735415220859a
Author: Ziyang Huang <hzyitc@outlook.com>

soc: qcom: smp2p: kick WCSS after restart when requested

This commit adds support for the qcom,wcss-restart-kick device-tree
property to send an outbound kick in qcom_smp2p_notify_in() when an
inbound entry reads as zero.

> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index cf06a49149be1..bf11b7d450a43 100644
> --- a/drivers/soc/qcom/smp2p.c
> +++ b/drivers/soc/qcom/smp2p.c
[ ... ]
> @@ -341,6 +343,10 @@ static void qcom_smp2p_notify_in(struct qcom_smp2p *=
smp2p)
> =20
>  		trace_smp2p_notify_in(entry, status, val);
> =20
> +		/* Some WCSS firmware needs a kick after restarting. */
> +		if (smp2p->wcss_restart_kick && val =3D=3D 0)
> +			qcom_smp2p_kick(smp2p);
> +
>  		/* No changes of this entry? */
>  		if (!status)
>  			continue;

[Severity: High]
This problem wasn't introduced by this patch, but does
qcom_smp2p_check_ssr() unconditionally reset entry->last_value to 0 on
every interrupt when SSR ACK is enabled [1]?

drivers/soc/qcom/smp2p.c:qcom_smp2p_check_ssr() {
	...
	restart_done =3D in->flags & BIT(SMP2P_FLAGS_RESTART_DONE_BIT);
	restart =3D restart_done !=3D smp2p->ssr_ack;
	list_for_each_entry(entry, &smp2p->inbound, node) {
		if (!entry->value)
			continue;
		entry->last_value =3D 0;
	}

	return restart;
}

Because the loop is not guarded by if (restart), qcom_smp2p_notify_in()
computes status =3D val ^ 0 on every incoming notification and treats every
currently asserted bit as a new rising edge, firing spurious nested
interrupts.

[1] https://sashiko.dev/#/bug/linux-bc3d0c88-94cb-435f-b51e-d084030debce

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126105722.1881=
03-1-robimarko@gmail.com?part=3D2
