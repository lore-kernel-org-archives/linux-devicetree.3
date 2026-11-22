Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795329661;
	b=yhLpvtTIFjNJOjT6pS1iorunyjM8O1WsWzMErd7qBNHgSa90F6EJvc4VIkDiH03hox4r
	 Sdz/JiwhjGs16CzGOZyV3GCA5C3WEe0QCbKJWvOuovC41jrpwhHPwmaSbW8QXRxHY6vaE
	 m7QqfQhejx4dP7RurXVMSF43UVKaWlcA5lUtmL7aFHhxQ6qy/iMVQ44c5to0gFs0d2nKY
	 hSXOuEymMyI3fITe7lA4jEayqpbTpdoXw3ns+/Q75iwynngjuqAapa8UhlJPLndSk1gSJ
	 J4LTQPW/9P7Q/TFmjsGrxFNaoVzcUHxPXpWBxzPvvxfCVdAopwAOzkU0UHQHQoacg5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795329661;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZAH0hsXA1ka13HYPhYrcAeEuJiemOOmh0kgLuoF9E4c=;
	b=fcuhSlcokcLxlETIafMWzxEXxb4Lwh4UQYV3hPL5yLSswIHuhV6TdYjDub0FwrUrGPeJ
	 pOR5Mzb1bWscqywTSvB1OXlQuAzhAh2iBSdae5Xz4op6yMBu6DIoeT4YSj9cBpBdc63tm
	 7+rpevzyN04ElAjGzIih09RJNhudGaySGAuCI9VFM2mg0OhByZEwKvxBhqUT2BNEgaPQS
	 bTFuLWr9qJgSewcWtneuY0g3aWyPXOigl6jOuV5rx5M0PXGCGXowZfll66ncKLfe+8fhT
	 caidLWtY4zDES8uLxSddiYtrrUSg7drfg/FMj+0xpdn8nuR3vrX+dzUXFAOhOBmv5DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cth32J3s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878AD606A330
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 06:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cth32J3s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF551F000C0;
	Sun, 22 Nov 2026 06:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795329661;
	bh=ZAH0hsXA1ka13HYPhYrcAeEuJiemOOmh0kgLuoF9E4c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cth32J3sY8tpwJF6YjvP0upI4aTGTC3sJ6eSfKuxYsBVeYdRQAqFCib6FZye9w7Mr
	 llMTMXgCxQ5BCVST7Rp3Ip9KKMUcNx30EDk4y0bje6sGb6WRQ2TDhKIDnbqK9jdGu3
	 oWcXk3ScyhCoJQZLuzhxhim4EGHczuztBt2iRoCG1HgLLtCtwdsPfu3sR3WCbBwpJr
	 HtmK0KEuoBX7XaowyJBDDR0bcJnQNF1yTBo4nxDlkDUXrFOrZpn0XMxcO6RiBz2tiQ
	 T/YfbbftLhlCNJE8WBvjttL+YcJUudgwzsXBoVVewLJGK5Y4ffbHisCYnFuTsEkzWB
	 oTNnPl8Mo9lEQ==
Message-ID: <sashiko-outbox-227768@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: chemical: acd10: Add driver for ACD10 CO2
 sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhilesh Patil" <akhilesh.patil@linux.dev>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <07fe3a575ad86493076d5061ed71c15e7b837a10.1795326744.git.akhilesh.patil@linux.dev>
References: <cover.1795326744.git.akhilesh.patil@linux.dev>
 <07fe3a575ad86493076d5061ed71c15e7b837a10.1795326744.git.akhilesh.patil@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 06:40:59 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] iio: chemical: acd10: race and OOB write in acd10_receive_buf()
- [Medium] iio: chemical: acd10: missing MODULE_DEVICE_TABLE() for OF
  matching
- [Medium] iio: chemical: acd10: missing vcc-supply enable in
  acd10_probe()
--

commit 2784731160894116b07cdc2f499cc0eb12597983
Author: Akhilesh Patil <akhilesh.patil@linux.dev>

iio: chemical: acd10: Add driver for ACD10 CO2 sensor

This commit adds an IIO driver for the Aosong ASAIR ACD10 carbon dioxide
sensor communicating over UART via the serdev interface.

> diff --git a/drivers/iio/chemical/acd10.c b/drivers/iio/chemical/acd10.c
> new file mode 100644
> index 0000000000000..b92f01e7bf4a1
> --- /dev/null
> +++ b/drivers/iio/chemical/acd10.c
> @@ -0,0 +1,365 @@

[ ... ]

> +struct acd10_state {
> +	struct serdev_device *serdev;
> +
> +	/* Lock to acquire during CMD/RESP sequence */
> +	struct mutex lock;
> +	struct completion buf_ready;
> +
> +	/* Single buffer to hold tx and rx data */
> +	u8 buf[16];
> +	u8 buf_idx;
> +	u8 rx_expected_len;
> +
> +	u8 sw_rev[16];
> +	u8 inst_num[16];
> +};

[ ... ]

> +static int acd10_serdev_transfer(struct iio_dev *indio_dev, enum acd10_c=
mds cmd)
> +{
> +	struct acd10_state *drv_state =3D iio_priv(indio_dev);
> +	struct serdev_device *serdev =3D drv_state->serdev;
> +	struct device *dev =3D &indio_dev->dev;
> +	int ret;
> +
> +	/* Prepare transmit buffer along with checksum */
> +	drv_state->buf[0] =3D ACD10_FRAME_START;
> +	drv_state->buf[1] =3D ACD10_FRAME_FIXED_CODE;
> +	drv_state->buf[ACD10_FRAME_DATA_LEN_IDX] =3D cmd_info[cmd].tx_data_len;
> +	drv_state->buf[ACD10_FRAME_CMD_CODE_IDX] =3D cmd_info[cmd].cmd_code;
> +	drv_state->buf[cmd_info[cmd].tx_frame_len - 1] =3D
> +		acd10_get_checksum(drv_state->buf, cmd_info[cmd].tx_frame_len);
> +	drv_state->buf_idx =3D 0;
> +	drv_state->rx_expected_len =3D cmd_info[cmd].rx_frame_len;
> +	reinit_completion(&drv_state->buf_ready);
> +
> +	/* Transmit the buffer over serdev */
> +	ret =3D serdev_device_write(serdev, drv_state->buf, cmd_info[cmd].tx_fr=
ame_len,
> +				  ACD10_SERDEV_TIMEOUT);
> +	if (ret < 0)
> +		return ret;
> +	if (ret !=3D cmd_info[cmd].tx_frame_len)
> +		return -EIO;
> +
> +	/* Read the received bytes in buffer */
> +	ret =3D wait_for_completion_interruptible_timeout(&drv_state->buf_ready,
> +							ACD10_SERDEV_TIMEOUT);
> +	if (ret < 0)
> +		return ret;
> +	if (!ret)
> +		return -ETIMEDOUT;

[ ... ]

> +static size_t acd10_receive_buf(struct serdev_device *serdev,
> +				const u8 *data, size_t len)
> +{
> +	struct iio_dev *indio_dev =3D serdev_device_get_drvdata(serdev);
> +	struct acd10_state *drv_state =3D iio_priv(indio_dev);
> +	size_t consume =3D len;
> +	int i =3D 0;
> +
> +	while (drv_state->rx_expected_len && (consume > 0)) {
> +		drv_state->buf[drv_state->buf_idx++] =3D data[i++];
> +		consume -=3D 1;
> +		drv_state->rx_expected_len -=3D 1;
> +	}
> +
> +	if (drv_state->rx_expected_len =3D=3D 0) {
> +		drv_state->buf_idx =3D 0;
> +		complete(&drv_state->buf_ready);
> +	}
> +
> +	return len;
> +}

[Severity: High]
Can a late UART response after a signal-interrupted or timed-out read race
with the next transfer and overflow drv_state->buf[16]?

If wait_for_completion_interruptible_timeout() returns early on a signal or
timeout, drv_state->rx_expected_len is left non-zero while the sensor is
still transmitting at 1200 baud.  acd10_receive_buf() runs without locking
or a bounds check against sizeof(drv_state->buf):

CPU0                                  CPU1 (tty flip workqueue)
acd10_serdev_transfer()
  wait_for_completion_...()
  -> -ERESTARTSYS (rx_expected_len=3D9)
acd10_serdev_transfer()
  drv_state->buf_idx =3D 0;
                                      acd10_receive_buf()
                                        /* 8 late bytes arrive */
                                        buf_idx becomes 8
  drv_state->rx_expected_len =3D 9;
                                      acd10_receive_buf()
                                        /* 9 new bytes arrive */
                                        drv_state->buf[16] =3D ...
                                          <-- OOB write into drv_state

Even when buf_idx does not overflow, late bytes arriving while
rx_expected_len is still non-zero overwrite drv_state->buf[0..4] while the
next TX command and checksum are being built, and shift subsequent RX
frames out of alignment because acd10_receive_buf() does not resynchronize
on ACD10_FRAME_START.

[ ... ]

> +	ret =3D acd10_get_sw_rev(indio_dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D acd10_get_instrument_num(indio_dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_iio_device_register(dev, indio_dev);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

[Severity: Medium]
Should acd10_probe() enable the vcc-supply regulator before talking to the
sensor?

The DT binding in Documentation/devicetree/bindings/iio/chemical/aosong,acd=
10.yaml
defines vcc-supply, so on boards where that rail is not always-on,
acd10_get_sw_rev() will time out unless acd10_probe() enables it (for
example with devm_regulator_get_enable(dev, "vcc")).

> +
> +static const struct of_device_id acd10_of_match_table[] =3D {
> +	{ .compatible =3D "aosong,acd10", },
> +	{ }
> +};

[Severity: Medium]
Is MODULE_DEVICE_TABLE(of, acd10_of_match_table) missing here?  Without it,
building with CONFIG_ACD10=3Dm will not emit the OF modalias for automatic
module loading.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795326744.gi=
t.akhilesh.patil@linux.dev?part=3D2
