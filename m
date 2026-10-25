Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792959376;
	b=KI4M04fb2uopma+hNoPNrrWPZX1DvgfTeUj6ZkTBzPcYDDDjkXkmrbaTjJHgXd/+FNgO
	 afQ5bpRDS0prMH/kNKaBoAVRqxQm2X4UpxT44QlVOVALQfzvzNPh6MRRWuKkbsfReKPLK
	 sUy5bQbAEsls9es4qrMXEHVI/9CxNxjGF4qtDB5DLv3n352josOo00EMURXcFLhsacO0L
	 h+JBvA0XJrkX8zzMtqRX+imZjdlFUdfLANRiLQcqrmreVy+vrlJQlIWWrh3zCY+AQPgRk
	 NrQIVQW3lH8keri/I0IXdAy/WndOksv1s3Ev5BJBhghSIq+YFraRUU6WHJKLxWpqCUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792959376;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=b2od8Hanb3Vb0xyYkKzC+ex2lWu87Ihu4lo0lxS3IoE=;
	b=PssltGLv1aX8ByXF+m6R7GdQQPhC0MK7nRlJETeS9esl5AfzPqTDI+kyVsVqjVuygQa+
	 X9neKbOA5tApkXkojc9F/B3cMwsoDKRpgg/NlzDnw6dRGnss/wsMJ7wfrauOP1DKkJX8Z
	 JLkWUxnu1Q9cB4kTpisnyOlnBWL4NytghBkskVXIyvxYuPjOSjBATTrDjWVCe8uRh8k/9
	 T05dBNUxi7/79DwZYdi1stI5o6zLlv0nPjQZplQZlq81SqNc+nSKQOUUcLKqSStMzWO4h
	 1XT6qwIIIC8hw8HYKNgiE0+vB2xNV+mobARudlZPB+wEqypS2m/+CaOwe2ge5cNL2sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ksRGXPf5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405F2606A31B
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 20:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ksRGXPf5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93EC41F01825;
	Sun, 25 Oct 2026 20:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792959375;
	bh=b2od8Hanb3Vb0xyYkKzC+ex2lWu87Ihu4lo0lxS3IoE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ksRGXPf5yKukt5sLUMbeLSgLn50U1jSjBQYRzDRAL1qkwxWrHjc/rxnzfJCfwDAjH
	 Fg/mPtdyCGbIwGFulJtsKcrdDVe4isUYUtggQDpRzpXHi157t+Kizvtn1q/SCFRgHD
	 HBNTsDCv3bqkE3Iyp0E6U/ecr7ZEL6HlvuuaUtaiC0GPeKnSwXFTLT2lgdkzMnVhw3
	 MqDlJ3oZBGbXyq5VnG5iMKRzfrwiPEM6jFNIfdUAOaK3WhdwTSB47lf98m0yQvYkYo
	 VJIngCMEcjjskxMdSIErfUpTVWJIVQapLJMnXJnqumM5InjnQKN4xYQcKC/L/g7Z7t
	 xqlCX4+x6QjmA==
Message-ID: <sashiko-outbox-184417@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] Bluetooth: hci_aml: cope with a controller that is
 already running
Reply-To: sashiko-reviews@lists.linux.dev
To: christian.koever-draxl@student.uibk.ac.at
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261025192338.209574-4-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192338.209574-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192338.209574-4-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 20:16:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Bluetooth: hci_aml: aml_fw_already_running() timeout stalls retries
- [High] Bluetooth: hci_aml: aml_resync() hangs in serdev_device_write()
- [Medium] Bluetooth: hci_aml: unbalanced power state in aml_setup() and am=
l_power_on()
--

commit 603cd1d2f458c40daa60bef1f089a3a6efc3085b
Author: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>

Bluetooth: hci_aml: cope with a controller that is already running

This commit updates the Amlogic Bluetooth HCI UART driver to detect
already-running controller firmware via HCI_OP_READ_LOCAL_VERSION, retry
unanswered firmware download segments after sending UART resync bytes,
increase firmware startup polling delays, and keep the controller powered
across HCI close until driver removal or shutdown.

> diff --git a/drivers/bluetooth/hci_aml.c b/drivers/bluetooth/hci_aml.c
> index 5979b114f2e4f..8561618867e83 100644
> --- a/drivers/bluetooth/hci_aml.c
> +++ b/drivers/bluetooth/hci_aml.c

[ ... ]

> @@ -214,11 +238,33 @@ static int aml_send_firmware_segment(struct hci_dev=
 *hdev,
>  			     op_addr, (u32 *)seg, seg_size);
>  }
> =20
> -static int aml_send_firmware(struct hci_dev *hdev, u8 fw_type,
> -			     u8 *fw, u32 fw_size, u32 offset)
> +static const u8 aml_resync_pattern[256];
> +
> +/* A command that goes unanswered has usually been half received: the
> + * controller took what did arrive for the start of a packet and waits f=
or
> + * the rest, so every following command is swallowed as its payload. Send
> + * enough bytes to complete whatever it is reassembling. Zero is not a v=
alid
> + * H4 packet type, so what is left over afterwards is discarded.
> + */
> +static void aml_resync(struct hci_uart *hu, unsigned int chunks)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < chunks; i++)
> +		serdev_device_write(hu->serdev, aml_resync_pattern,
> +				    sizeof(aml_resync_pattern),
> +				    MAX_SCHEDULE_TIMEOUT);
> +
> +	serdev_device_wait_until_sent(hu->serdev, 0);
> +}

[Severity: High]
Can calling serdev_device_write() with MAX_SCHEDULE_TIMEOUT in aml_resync()
hang the hdev->req_workqueue worker thread when a firmware segment retry is
triggered via aml_setup() -> aml_setup_controller() ->
aml_download_firmware() -> aml_send_firmware() -> aml_resync()?

In drivers/tty/serdev/core.c:serdev_device_write(), if the controller's
write_buf() callback accepts fewer than count bytes, it waits for
serdev->write_comp:

drivers/tty/serdev/core.c:serdev_device_write() {
	mutex_lock(&serdev->write_lock);
	do {
		reinit_completion(&serdev->write_comp);

		ret =3D ctrl->ops->write_buf(ctrl, buf, count);
		if (ret < 0)
			break;

		written +=3D ret;
		buf +=3D ret;
		count -=3D ret;

		if (count =3D=3D 0)
			break;

		timeout =3D wait_for_completion_interruptible_timeout(&serdev->write_comp,
								    timeout);
	} while (timeout > 0);
	mutex_unlock(&serdev->write_lock);
}

serdev_device_write() requires the serdev client's write_wakeup callback to
call serdev_device_write_wakeup() in order to complete serdev->write_comp.
However, hci_serdev registers hci_uart_write_wakeup() in
drivers/bluetooth/hci_serdev.c, which only calls hci_uart_tx_wakeup(hu) and
never calls serdev_device_write_wakeup(serdev):

drivers/bluetooth/hci_serdev.c:hci_uart_write_wakeup() {
	...
	if (test_bit(HCI_UART_PROTO_READY, &hu->flags))
		hci_uart_tx_wakeup(hu);
}

Because aml_resync() runs on a kernel workqueue thread with
MAX_SCHEDULE_TIMEOUT and serdev->write_comp is never completed, wouldn't any
partial write in serdev_device_write() block forever while holding
serdev->write_lock, as well as bypass hu->write_work without synchronizing
with any in-flight hu->tx_skb?

[ ... ]

> @@ -242,6 +302,35 @@ static int aml_send_firmware(struct hci_dev *hdev, u=
8 fw_type,
>  	return 0;
>  }
> =20
> +/* Dropping the enable line does not reset these controllers: they keep
> + * running the firmware they were last given, at the baud rate they were=
 last
> + * told to use. A warm reboot or a driver reload therefore finds an HCI =
device
> + * at the operational rate that no longer understands TCI commands. Read=
 Local
> + * Version tells the two cases apart: the ROM does not answer it, running
> + * firmware does.
> + */
> +static bool aml_fw_already_running(struct hci_dev *hdev, struct hci_uart=
 *hu)
> +{
> +	struct sk_buff *skb;
> +	int i;
> +
> +	serdev_device_set_baudrate(hu->serdev, hu->proto->oper_speed);
> +
> +	for (i =3D 0; i < AML_RESYNC_RETRIES; i++) {
> +		skb =3D __hci_cmd_sync_ev(hdev, HCI_OP_READ_LOCAL_VERSION, 0,
> +					NULL, HCI_EV_CMD_COMPLETE,
> +					AML_PROBE_TIMEOUT);
> +		if (!IS_ERR(skb)) {
> +			kfree_skb(skb);
> +			return true;
> +		}
> +	}
> +
> +	serdev_device_set_baudrate(hu->serdev, hu->proto->init_speed);
> +
> +	return false;
> +}

[Severity: High]
When the first __hci_cmd_sync_ev() call in aml_fw_already_running() times o=
ut
after AML_PROBE_TIMEOUT (500 ms), are the remaining retry iterations actual=
ly
transmitted over the UART?

On the first iteration (i =3D 0), hci_cmd_work() dequeues the command SKB,
calls hci_send_cmd_sync() which decrements hdev->cmd_cnt to 0, and arms
hdev->cmd_timer for HCI_CMD_TIMEOUT (2000 ms):

net/bluetooth/hci_core.c:hci_cmd_work() {
	if (atomic_read(&hdev->cmd_cnt)) {
		skb =3D skb_dequeue(&hdev->cmd_q);
		if (!skb)
			return;

		err =3D hci_send_cmd_sync(hdev, skb);
		if (err)
			return;

		rcu_read_lock();
		if (test_bit(HCI_RESET, &hdev->flags) ||
		    hci_dev_test_flag(hdev, HCI_CMD_DRAIN_WORKQUEUE))
			cancel_delayed_work(&hdev->cmd_timer);
		else
			queue_delayed_work(hdev->workqueue, &hdev->cmd_timer,
					   HCI_CMD_TIMEOUT);
		rcu_read_unlock();
	}
}

When the controller does not reply within 500 ms,
wait_event_interruptible_timeout() in
net/bluetooth/hci_sync.c:__hci_cmd_sync_sk() returns -ETIMEDOUT without
resetting hdev->cmd_cnt or canceling hdev->cmd_timer.

On iterations i =3D 1, 2, and 3, __hci_cmd_sync_ev() queues three more
HCI_OP_READ_LOCAL_VERSION SKBs onto hdev->cmd_q and schedules hdev->cmd_wor=
k,
but hci_cmd_work() sees atomic_read(&hdev->cmd_cnt) =3D=3D 0 and returns wi=
thout
sending them. At 2000 ms (4 * 500 ms =3D=3D HCI_CMD_TIMEOUT), hci_cmd_timeo=
ut()
fires, cancels the final wait, sets hdev->cmd_cnt back to 1, and schedules
hdev->cmd_work:

net/bluetooth/hci_core.c:hci_cmd_timeout() {
	...
	atomic_set(&hdev->cmd_cnt, 1);
	queue_work(hdev->workqueue, &hdev->cmd_work);
}

Doesn't this prevent retries 1..3 from ever being sent on the wire while
probing at oper_speed, and leave three unsent HCI_OP_READ_LOCAL_VERSION SKBs
in hdev->cmd_q that get transmitted asynchronously after
aml_fw_already_running() has already restored init_speed and returned false?

[ ... ]

> @@ -508,6 +597,7 @@ static int aml_power_on(struct aml_serdev *amldev)
>  	}
> =20
>  	gpiod_set_value_cansleep(amldev->bt_en_gpio, 1);
> +	amldev->powered =3D true;
> =20
>  	/* Wait 20ms for bluetooth controller power on */
>  	msleep(20);
> @@ -516,6 +606,10 @@ static int aml_power_on(struct aml_serdev *amldev)
> =20
>  static int aml_power_off(struct aml_serdev *amldev)
>  {
> +	if (!amldev->powered)
> +		return 0;
> +
> +	amldev->powered =3D false;
>  	gpiod_set_value_cansleep(amldev->bt_en_gpio, 0);
> =20
>  	clk_disable_unprepare(amldev->lpo_clk);
> @@ -568,7 +662,6 @@ static int aml_open(struct hci_uart *hu)
> =20
>  static int aml_close(struct hci_uart *hu)
>  {
> -	struct aml_serdev *amldev =3D serdev_device_get_drvdata(hu->serdev);
>  	struct aml_data *aml_data =3D hu->priv;
> =20
>  	skb_queue_purge(&aml_data->txq);
> @@ -577,7 +670,13 @@ static int aml_close(struct hci_uart *hu)
> =20
>  	hu->priv =3D NULL;
> =20
> -	return aml_power_off(amldev);
> +	/* The controller is left powered. Setup, which powers it on, only
> +	 * runs once per registration, and dropping the enable line does not
> +	 * reset it but leaves it unreachable until the combo chip is power
> +	 * cycled, so powering off here would lose the controller on the next
> +	 * open. It is powered off on remove and shutdown.
> +	 */
> +	return 0;
>  }

[Severity: Medium]
What happens to the enable counts on amldev->bt_supply and amldev->lpo_clk =
if
aml_setup() fails after aml_power_on(amldev) succeeds, and the HCI device is
subsequently opened again?

In drivers/bluetooth/hci_aml.c:aml_setup():

	err =3D aml_power_on(amldev);
	if (err)
		return err;

	err =3D aml_setup_controller(hu, amldev, hdev);
	if (err)
		return err;

Previously, if hci_dev_init_sync() failed during hci_dev_open_sync(), the
error path called hdev->close(hdev) -> aml_close() -> aml_power_off(amldev).
With aml_power_off() removed from aml_close() and not called on error in
aml_setup(), a failure in aml_setup_controller(), aml_send_reset(),
aml_check_bdaddr(), or later in hci_dev_init_sync() leaves amldev->powered
set to true while HCI_SETUP remains set on hdev.

If another open attempt is made (for example via hciconfig up or btmgmt pow=
er
on), hci_dev_setup_sync() invokes aml_setup() -> aml_power_on(amldev) again.
Because aml_power_on() does not check amldev->powered before calling
regulator_enable(amldev->bt_supply) and clk_prepare_enable(amldev->lpo_clk),
won't their enable counts be incremented a second time while aml_power_off()
only disables amldev->lpo_clk and amldev->bt_supply once on remove or
shutdown?

Also, unlike aml_serdev_remove() which calls hci_uart_unregister_device()
first, aml_serdev_shutdown() calls aml_power_off(amldev) directly; can that
race with asynchronous aml_setup() work running on hdev->req_workqueue?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025192338.2095=
74-1-christian.koever-draxl@student.uibk.ac.at?part=3D3
