Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB413603DA
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 19:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781121051; cv=none; b=YuygKVA3iMe2sHqCL2HNmopLvms93eIBkCIToXsiDUoveV/QvHZZTtCntQoOuEpTVbCg6VUZuNkU3sAJd4hi4kY4qnanu6rEg7nGBOfPKQoOP8oEf+Danyfz4GFRFUgai2RqZcqjpO9FVUQSuNYQi+rycpDUIuSfRtcOYNmTsl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781121051; c=relaxed/simple;
	bh=h6j+KVghOa3b70Rc8c7X86a+7fEgy33fi8HkhEfeq+8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mNgB3ioVLU/u+qPVNpVIfNtbfcEgYfnWledSn2z9XNO2HolywuDWC+4LUuvTSVk98ricL2v5cPzTmUbKm8Lklc/SJj/f6KtadYfy7Ck4nJIEnZSpmFPep046VQSI3gVd/3moPWac3wFMdiF80V5RvEhVzyjX/UvvclhTTT/5t5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKloc1Yq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKloc1Yq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8983C1F00893;
	Wed, 10 Jun 2026 19:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781121050;
	bh=pMvQZxYX+myVk8D3g1dC3leTcq0EyenEhjMXGSPAC14=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UKloc1YqsEglqa947DJNq4iQ6EAgLTpdFGsa6y5pppsUCKEAJV+n0AhJibh3nkFvJ
	 LGubgMbAVC8dJOvClBcXU8wL+WhN6kfpoUP9/tQeJ2jE/Oks1ObIH9rqQ5X6rq2OpN
	 bBQOho4PU4UdpdVv+GBqAJni0b4HkeXYF3pq22AZvDkBepko4J+h9qzA+cGVbCryFC
	 ZJSiPpNqWoegDeNdHMzGRmRIwuFEbHS21tH8JmZ6wJRfMtNCOFRMlVXpFbSPhFHww0
	 VdQwZ4ThwGU1CY197sdkyXjwW6HlxXiOIgK9sfgyCWL/eBF2eslKECUh4UDI3iWmu7
	 ETYb3JzF4HFXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v4 2/4] net: ethernet: oa_tc6: No return on rx
 buffer overflow error
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609-level-trigger-v4-2-6f389abdd192@onsemi.com>
References: <20260609-level-trigger-v4-2-6f389abdd192@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 19:50:49 +0000
Message-Id: <20260610195049.8983C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The newly added check for `-EAGAIN` in the threaded IRQ loop is de=
ad code for its intended purpose (RX overflow recovery) and introduces a da=
ngerous tight busy-loop if the underlying SPI driver fails.

Pre-existing issues:
- [Critical] Missing tailroom check before calling `skb_put()` on the recei=
ve path allows a malformed or malicious MAC-PHY stream to cause an `skb_ove=
r_panic()`.
- [Critical] Out-of-bounds memory access due to unvalidated hardware inputs=
 for TX credits and RX chunks.
- [High] The device IRQ is not disabled before freeing SKB pointers in `oa_=
tc6_exit()`, leading to a race condition and use-after-free.
--

commit bd14c34a7b1c3dad290ba34e28faf15014377d8e
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: oa_tc6: No return on rx buffer overflow error

This patch modifies the threaded IRQ handler to retry the SPI transfer if
oa_tc6_try_spi_transfer() returns -EAGAIN. This is intended to gracefully
recover from RX buffer overflow errors by discarding bad data chunks.

> diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
> --- a/drivers/net/ethernet/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6.c
> @@ -1111,6 +1111,8 @@ static irqreturn_t oa_tc6_macphy_threaded_irq(int i=
rq, void *data)
> =20
>  	while (tc6->int_flag || (tc6->waiting_tx_skb && tc6->tx_credits)) {
>  		ret =3D oa_tc6_try_spi_transfer(tc6);
> +		if (ret =3D=3D -EAGAIN)
> +			continue;

[Severity: High]
Can oa_tc6_try_spi_transfer() actually return -EAGAIN for an RX overflow
condition here?

Looking at oa_tc6_try_spi_transfer(), it catches the -EAGAIN internally:

static int oa_tc6_try_spi_transfer(struct oa_tc6 *tc6)
{
        ...
        ret =3D oa_tc6_process_spi_data_rx_buf(tc6, spi_len);
        if (ret) {
                if (ret =3D=3D -EAGAIN)
                        continue;
        ...
}

Since it loops internally, it seems it won't return -EAGAIN to the IRQ
handler for an RX overflow.

The only way oa_tc6_try_spi_transfer() returns -EAGAIN to the caller
is if the underlying SPI transfer fails with -EAGAIN.

If that happens, wouldn't this new continue statement create a tight infini=
te
busy-loop in the threaded IRQ handler context without sleeping?

>  		if (ret)
>  			break;
>  	}

[Severity: Critical]
This is a pre-existing issue, but does oa_tc6_update_rx_skb() verify that
the skb has sufficient tailroom before calling skb_put()?

In the receive path, data is copied into the skb:

static void oa_tc6_update_rx_skb(struct oa_tc6 *tc6, u8 *payload, u16 lengt=
h)
{
        ...
        memcpy(skb_put(tc6->rx_skb, length), payload, length);
}

This is called repeatedly for ongoing frames by oa_tc6_prcs_ongoing_rx_fram=
e()
which appends 64-byte payload chunks to the skb.

If a faulty MAC-PHY or bit-flip streams chunks without setting the end_valid
bit, could the unconditional calls to skb_put() overrun the SKB's tailroom
and trigger a kernel panic via skb_over_panic()?

[Severity: High]
This is a pre-existing issue, but is the device IRQ properly disabled
before oa_tc6_exit() frees the SKB pointers?

oa_tc6_exit() does the following:

static void oa_tc6_exit(struct oa_tc6 *tc6)
{
        ...
        dev_kfree_skb_any(tc6->ongoing_tx_skb);
        dev_kfree_skb_any(tc6->waiting_tx_skb);
        dev_kfree_skb_any(tc6->rx_skb);
        ...
}

Since the driver uses devm_request_threaded_irq(), the IRQ remains active
until the driver unbinds, which happens after oa_tc6_exit() returns.

If an interrupt fires concurrently while oa_tc6_exit() calls
dev_kfree_skb_any(), could the still-active oa_tc6_macphy_threaded_irq()
handler attempt to access these freed pointers?

[Severity: Critical]
This is a pre-existing issue, but do we validate the chunk counts read
from the hardware?

The driver updates the chunk counts from hardware registers:

static void oa_tc6_update_buffer_status_from_register(struct oa_tc6 *tc6,
                                                      u32 value)
{
        tc6->rx_chunks_available =3D FIELD_GET(BUFFER_STATUS_RX_CHUNKS_AVAI=
LABLE,
                                             value);
        ...
}

These bitfields are 8 bits wide, allowing values up to 255. However, the
SPI data buffers are statically sized to handle a maximum of
OA_TC6_MAX_TX_CHUNKS (48).

If the hardware reports a value larger than 48, could loops like
oa_tc6_add_empty_chunks_to_spi_buf() write past the bounds of
spi_data_tx_buf and cause memory corruption during the SPI transfer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-level-trig=
ger-v4-0-6f389abdd192@onsemi.com?part=3D2
