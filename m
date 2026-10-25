Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792958902;
	b=eTo2W+Yd9dD3PZJwIOjdvFVrV9OWQie0X4c6rdg+/+3EImsfsLCenxoGzAwiT2xEHxcC
	 O4pN9WlLJ8eDmQh34L4GrmWNkIXu3VEvCKVenlakxF5xevyiHcW17QE6ePnAeKpeRns1M
	 usMs9IKJM8XJnDBm4KQFNp+cy06wgKYptn/RJmlSliQLiNsT7+8joIQKkmU9z+ntcHcwM
	 nmmzLnQMNi9moQ/5IxkunY/k5y0cZaOpyQ42r6lAmiqm5GeKa0f8E+yTxNvbz0o0iFpW6
	 zcIgo6EN9bRaRV2PcywNI2nTm7/j87TfF0WA37SFKp/76+HK1CRGaBkJxUsseYFIY8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792958902;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0pAw7ssMwwqHoXECiMNJXwZAbmNa/ymHKrMxfo2qDdw=;
	b=uSyEpbfPXh83etC2KwiYcaerbQblwVU8x1oSN2C0xbLMA1n1Nmpp/Szs4+FYhR5wPIlb
	 +yudyVm5EZoBZ7G4GoGATMOF1zqa+crURNxdTpMe7CmFlW/pX+ETbYcu0EcS957Rne585
	 /rsTyS24ht/uqmQG5F0OOfpdyexU1QprIM//QYpTwOhpGhcVGLJcGo+o/wb8dZ6f6oogV
	 i21figFsv7IA3bZfDZwktUAHhGzn5ZJTkL6I7yrF7uWf/deFjBp/CfNS/16EMflOGsqmg
	 dZkDdBQ/BKV+Q11NQHMJBeppFIC94kAfRUVi9X7Yf3ii0SdzdWxerAb9WqhzEo1HJDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ji3AOAvt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3D5606A31D
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 20:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ji3AOAvt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E341F01825;
	Sun, 25 Oct 2026 20:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792958901;
	bh=0pAw7ssMwwqHoXECiMNJXwZAbmNa/ymHKrMxfo2qDdw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ji3AOAvtKbCNVmmpALrjy7RyDe6XTEOFGIF26VxhAPqVuRWziB9C4skos0i9pTemN
	 EDPayjv5Y4MWTOA1cIuqwtXWCZLHpcYSGUH2kDmLkJJTIzz2mlUBOMEqTX2UCs+FkM
	 zQ9Fm10HNfzmWtHHwX75DTUv7ipyOM4GzhSYvLVcr977JTfUGGsVzyr/g7giw+XjYu
	 cDg9zFYaRfTpz5HzkkRO/RjmdKatB38SEa/+HNsNBbv+OQLMDWLpKoW7Hh4g6r9e7v
	 NgXiybp2wmtYiKHUY+SM6MX69csxCNSUyU1KehSFPsPTgdrSuliIH/DuGOzN0OQ7fF
	 Jb2SS+XNADdYg==
Message-ID: <sashiko-outbox-184409@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] Bluetooth: add a quirk for controllers that cannot
 enable Secure Connections
Reply-To: sashiko-reviews@lists.linux.dev
To: christian.koever-draxl@student.uibk.ac.at
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261025192338.209574-2-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192338.209574-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192338.209574-2-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 20:08:20 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Bluetooth: unmasked lmp_sc_capable() with HCI_QUIRK_BROKEN_WRITE_S=
C_SUPPORT
- [Low] Bluetooth: inaccurate comment for HCI_QUIRK_BROKEN_WRITE_SC_SUPPORT=
 in hci.h
--

commit 300bedb0d4e07bfd158958e39e058f268b697a0b
Author: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>

Bluetooth: add a quirk for controllers that cannot enable Secure Connections

This commit introduces HCI_QUIRK_BROKEN_WRITE_SC_SUPPORT to skip the
HCI_OP_WRITE_SC_SUPPORT command on controllers that advertise BR/EDR Secure
Connections in their extended features but reject enabling host support. It
also sets this quirk in the Amlogic Bluetooth driver (hci_aml).

> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> index 1641d879dbda9..bcbe76c84d1b5 100644
> --- a/include/net/bluetooth/hci.h
> +++ b/include/net/bluetooth/hci.h
> @@ -375,6 +375,20 @@ enum {
>  	 */
>  	HCI_QUIRK_BROKEN_READ_PAGE_SCAN_TYPE,
> =20
> +	/*
> +	 * When this quirk is set, the HCI_OP_WRITE_SC_SUPPORT command is
> +	 * not supported.
> +	 *
> +	 * This quirk is intended for controllers that list BR/EDR Secure
> +	 * Connections among their extended features and then reject the
> +	 * command that turns host support on. Without it the failure takes
> +	 * the whole of hci_dev_open_sync() with it and the controller can
> +	 * never be powered on.
> +	 *
> +	 * This quirk must be set before hci_register_dev is called.
> +	 */
> +	HCI_QUIRK_BROKEN_WRITE_SC_SUPPORT,

[Severity: Low]
Is the comment stating that this quirk must be set before hci_register_dev
is called accurate?

In drivers/bluetooth/hci_aml.c, aml_serdev_probe() registers the HCI device
first via:

  aml_serdev_probe()
    -> hci_uart_register_device()
      -> hci_uart_register_device_priv()
        -> hci_register_dev()

and aml_setup() sets HCI_QUIRK_BROKEN_WRITE_SC_SUPPORT later inside the
hdev->setup callback during hci_dev_open_sync() -> hci_dev_init_sync() ->
hci_dev_setup_sync().

Should this comment note that the quirk can also be set in the hdev->setup
vendor callback?

> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> index a92a81846e9df..f1dfef81ca961 100644
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c
> @@ -3419,7 +3419,8 @@ int hci_write_sc_support_sync(struct hci_dev *hdev,=
 u8 val)
>  {
>  	int err;
> =20
> -	if (!bredr_sc_enabled(hdev) || lmp_host_sc_capable(hdev))
> +	if (!bredr_sc_enabled(hdev) || lmp_host_sc_capable(hdev) ||
> +	    hci_test_quirk(hdev, HCI_QUIRK_BROKEN_WRITE_SC_SUPPORT))
>  		return 0;
> =20
>  	err =3D __hci_cmd_sync_status(hdev, HCI_OP_WRITE_SC_SUPPORT,
> @@ -5040,7 +5041,8 @@ static int hci_write_sc_support_1_sync(struct hci_d=
ev *hdev)
>  	u8 support =3D 0x01;
> =20
>  	if (!hci_dev_test_flag(hdev, HCI_SSP_ENABLED) ||
> -	    !bredr_sc_enabled(hdev))
> +	    !bredr_sc_enabled(hdev) ||
> +	    hci_test_quirk(hdev, HCI_QUIRK_BROKEN_WRITE_SC_SUPPORT))
>  		return 0;

[Severity: High]
When HCI_QUIRK_BROKEN_WRITE_SC_SUPPORT is set, skipping
HCI_OP_WRITE_SC_SUPPORT in hci_write_sc_support_sync() and
hci_write_sc_support_1_sync() leaves LMP_HOST_SC unset on the controller,
while lmp_sc_capable(hdev) and bredr_sc_enabled(hdev) in
include/net/bluetooth/hci_core.h still evaluate to true:

  #define lmp_sc_capable(dev)     ((dev)->features[2][1] & LMP_SC)
  ...
  #define bredr_sc_enabled(dev)   (lmp_sc_capable(dev) && \
                                   hci_dev_test_flag(dev, HCI_SC_ENABLED))

When userspace (such as bluetoothd) issues MGMT_OP_SET_SECURE_CONN,
set_secure_conn() or set_secure_conn_sync() in net/bluetooth/mgmt.c sets
HCI_SC_ENABLED:

  set_secure_conn_sync()
    hci_dev_set_flag(hdev, HCI_SC_ENABLED);
    return hci_write_sc_support_sync(hdev, val);

Because hci_write_sc_support_sync() returns 0 under the quirk,
set_secure_conn_complete() keeps HCI_SC_ENABLED (and HCI_SC_ONLY if
requested) set, leaving bredr_sc_enabled(hdev) true even though BR/EDR
Secure Connections was never enabled on the controller.

Won't this cause callers of lmp_sc_capable() and bredr_sc_enabled() to
misbehave on BR/EDR links? For example:

- In net/bluetooth/mgmt.c, read_local_oob_data_sync(),
  read_local_oob_data_complete(), and read_local_oob_ext_data_complete()
  check bredr_sc_enabled(hdev) and issue HCI_OP_READ_LOCAL_OOB_EXT_DATA
  instead of HCI_OP_READ_LOCAL_OOB_DATA.

- In net/bluetooth/hci_event.c, bredr_oob_data_present() and
  hci_remote_oob_data_request_evt() check bredr_sc_enabled(hdev) and report
  P-256 OOB data or send HCI_OP_REMOTE_OOB_EXT_DATA_REPLY instead of
  HCI_OP_REMOTE_OOB_DATA_REPLY.

- In net/bluetooth/smp.c and net/bluetooth/l2cap_core.c, smp_register() and
  l2cap_conn_add() check bredr_sc_enabled(hdev) and advertise
  L2CAP_FC_SMP_BREDR to remote BR/EDR peers. When a peer initiates SMP
  pairing / Cross-Transport Key Derivation over BR/EDR,
  smp_cmd_pairing_req() rejects it with SMP_CROSS_TRANSP_NOT_ALLOWED
  because HCI_CONN_AES_CCM is not set on the link, and smp_recv_cb()
  disconnects the ACL connection with HCI_ERROR_AUTH_FAILURE.

- In net/bluetooth/mgmt.c and net/bluetooth/hci_debugfs.c,
  get_supported_settings(), set_secure_conn(), and
  hci_debugfs_create_bredr() check lmp_sc_capable(hdev) and treat BR/EDR
  Secure Connections as supported.

Should lmp_sc_capable(dev) in include/net/bluetooth/hci_core.h instead mask
out the feature bit when the quirk is set (similar to how le_coded_capable()
checks HCI_QUIRK_BROKEN_LE_CODED), so that both lmp_sc_capable() and
bredr_sc_enabled() evaluate to false across the stack while still allowing
HCI_SC_ENABLED for LE Secure Connections?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025192338.2095=
74-1-christian.koever-draxl@student.uibk.ac.at?part=3D1
