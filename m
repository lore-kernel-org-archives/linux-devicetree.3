Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102694;
	b=SViBgb8elj2E2A6XfOUcTByDguipTw47gIUJbAVYAciB9nbziHw7IuqlNVgyijmR4bJG
	 YSPbNVReb0Klp7yiuUekG2qyEzM3xluDsNio9ifFRqvRXUHbmd11QOLHbhCAxna1Wujn/
	 9QYldb/pwvupEtRgTcoyNq9CsOnKA00zZ2OPSYWidq66E4NjAFoKh+t7cnZr3qeyK5GKn
	 iHa/+6LUPJ0sMu4ZwAMoejB+hhm6m+j9NcKgiBtJYVYuSP+v9vB3eCS6aQJrq1dB474RQ
	 h8RmPVS3GqBs6xII0hJoO4xuaiwYZ1YUzR4g8SeSCOMNdgsWRHeaRo2nFIm2leRmkOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102694;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=l6QCwwOco8+YoyantpGBcWKXqziWQvT+Hz/ITGjUU6I=;
	b=brFMa5p19H5yDxoesYL6RQke8MTOHkGOpf91l/Nt9wT7uP3rV8+a/F5K4Ozsl3+ITbCx
	 X+hfhSXtBbPJOsMaQsxb/hKYMBrHhdRVKOErYeMiIBPCVBGKXCpWZSvXqCUUXrClIKXmv
	 E38XIqQcaWzfgi3Qh929zc2xNYavn995OcFpTgmyIq/9oPw3x1g6eYGKsXWn2dv7pMPOC
	 Li9KkLGYVn++rDfagekJ0bLV7ZmcD+nfcBC7F5FG7tux5pvEZo8zDMAd8Fw+OWd7UUpUg
	 gfD9amIofMZtLpkfZEC5rGHbRN1quJqP1veC8BSIsEjUQECfdmyJly5GqOP9O3rq5cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nPjoXz9e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB5960A2628
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nPjoXz9e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F181F000C5;
	Thu, 19 Nov 2026 15:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795102694;
	bh=l6QCwwOco8+YoyantpGBcWKXqziWQvT+Hz/ITGjUU6I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nPjoXz9e2ni26BSksSyl/j4hPRXnhSMf6q26S78BjKQ4g9GC1ZKdjfryP8sDTvkP2
	 xPxL3rWoE3qk+1rrT3N3lk+zgA/Lq4lb94v2kNL7sn5RhgbQHPRGDMjCXDmR6cGuzV
	 wTxr4rKgAC3/q0J9B/smldGPTEKbEKKW3YhScrOFmcICfTj0eeGrqYUc1YryYlY2JU
	 dhwqGd+5E7SA4HWB+gC5EHJBMe9Gna4zeF2ZxZaWQcltyP0ZMU1wYvS9apUU+HerEo
	 9NrCBTcWbroN7dfqjKvBsHeJ9yQeJYIow1tEJmvbCntlyqMzC+Yu3kh2fxTqiD9ZOR
	 jikzkMqOJFJHg==
Message-ID: <sashiko-outbox-223396@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] scmi: driver: Increase timeout for rx response
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Cercueil" <paul.cercueil@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119152944.276763-4-paul.cercueil@bootlin.com>
References: <20261119152944.276763-1-paul.cercueil@bootlin.com>
 <20261119152944.276763-4-paul.cercueil@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 15:38:13 +0000
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
- [Medium] scmi: global max_rx_timeout_ms increase instead of per-SoC DT
  property
--

commit a587b3cdc57b99607cd614c8d305614227ccea74
Author: George Cherian <gcherian@marvell.com>

scmi: driver: Increase timeout for rx response

This commit increases the default max_rx_timeout_ms in scmi_mailbox_desc
from 30ms to 500ms to accommodate the Marvell CN10K firmware response
time.

> diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/fir=
mware/arm_scmi/transports/mailbox.c
> index 308736c3ead9c..78c38d2644aa0 100644
> --- a/drivers/firmware/arm_scmi/transports/mailbox.c
> +++ b/drivers/firmware/arm_scmi/transports/mailbox.c
> @@ -380,7 +380,7 @@ static const struct scmi_transport_ops scmi_mailbox_o=
ps =3D {
> =20
>  static struct scmi_desc scmi_mailbox_desc =3D {
>  	.ops =3D &scmi_mailbox_ops,
> -	.max_rx_timeout_ms =3D 30, /* We may increase this if required */
> +	.max_rx_timeout_ms =3D 500, /* We may increase this if required */
>  	.max_msg =3D 20, /* Limited by MBOX_TX_QUEUE_LEN */
>  	.max_msg_size =3D SCMI_SHMEM_MAX_PAYLOAD_SIZE,
>  };

[Severity: Medium]
Should the 500ms timeout for Marvell CN10K be configured via the
"arm,max-rx-timeout-ms" DeviceTree property instead of raising
scmi_mailbox_desc.max_rx_timeout_ms for all mailbox platforms?

scmi_transport_setup() already parses "arm,max-rx-timeout-ms" to override
trans->desc.max_rx_timeout_ms per platform:

drivers/firmware/arm_scmi/driver.c:scmi_transport_setup() {
    ...
	ret =3D of_property_read_u32(dev->of_node, "arm,max-rx-timeout-ms",
				   &trans->desc.max_rx_timeout_ms);
    ...
}

Raising the default in scmi_mailbox_desc affects every mailbox platform,
increasing the worst-case busy-wait in shmem_tx_prepare() (2 *
cinfo->rx_timeout_ms, called from mailbox_send_message() -> msg_submit()
under spin_lock_irqsave(&chan->lock)) from 60ms to 1000ms with interrupts
disabled when a channel is busy, as well as the worst-case atomic busy-spin
in scmi_wait_for_reply() from 30ms to 500ms.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119152944.2767=
63-1-paul.cercueil@bootlin.com?part=3D3
