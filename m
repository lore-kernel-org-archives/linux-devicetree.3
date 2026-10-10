Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0502D47E9
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791638359; cv=none; b=TkcPJsqJlp6D15BXqjKBErBlCd5LggCfjqtcGbIzdJxSBB6G//slL4zkcWHXYNAnheRIZZjiX1UqSOuVuDZ+s9QpurbXr18zeaQA25bhLMpE/oGx/2afkY8WwD9JwY90KyYLleN90pAIkDiigDmeIl8W2v8kfvkdVFck7ldaD5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791638359; c=relaxed/simple;
	bh=6t2YGSPaDT4mNnDOS+yJ2MVSLF8KWIuAcciZnNHn408=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ConidV/ceq8NYVBM5iScEVIPAGNdjTyaTCtQU+vJ/CyIetZqccIKtWZ2H6HkC1fTL0KE+mgb2kfAb/uvkIhuAeH1zEziEKprcobuW4WvIDRr5Z9/ZbJRYE1EGyCZTQ1SgsGEGAYfpZmr0HWJ8HufQK9dco7A7aErK0bs+AmXzAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cd0dEkgX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cd0dEkgX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C530E1F000FF;
	Sat, 10 Oct 2026 13:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791638358;
	bh=uovi2yiHhrWpomGqaWJ1gQ0rj9TkxozQtaJSLDasl+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cd0dEkgXlZP+5D/HAk7Rt5pbM/tw4RuAkU7wex4D6rJQRnlHc2Iynf7fm+nqyF5oh
	 AnF9zEezna+L38V8VeYNgSzr3qTutC24bZ2X76nuZuAM1oKnWBE/R1/jZKB0bU5V0B
	 YHEKi+ljSJwTSxePc18HmHEmgOCSi3miwTihDRW/AoWF6rGwOor1ZBx/yQMs6P0IZh
	 mgmVe9BwnGpCGiJJeWaJhUqXunH1TTXAW7JCvoIO4N3lk+3FxmQ+B/J7COO877vqMI
	 /NZOnZGKirtlw5KHQNpfXxDqaPq+M06pVgkaeUVcAw82teM0y7CHUdzMtt7FLs9u3P
	 9DHZbKaQTorfQ==
Message-ID: <sashiko-outbox-166583@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 18/24] net: ethernet: zte: Add ZX279128S Ethernet switch
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261010130024.177503-19-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-19-ghahramani.navid@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 13:19:17 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [High] mm: unmanaged DMA arena and rhashtable memory leak on probe error =
paths
- [High] hardware: incorrect sequence of command and data writes in SBRG in=
direct accesses
- [High] hardware: out-of-bounds indirect table access in zx_sbrg_fdb_del l=
oop
- [High] lib: unhandled rhashtable_init error leaves ppe_flows in invalid s=
tate
- [High] net: ethernet: zte: hardware VLAN and FDB tables are written with =
stale data
- [High] mm: dma_alloc_coherent 16MB memory leak on probe error paths
- [High] net: zte: active notifiers reschedule work after hardware reset in=
 shutdown
- [Medium] net: permanent leak of valid BMU buffer index 0 in zx_eth_rx
- [Medium] notifier: incomplete cleanup of network notifiers on partial reg=
istration failure
- [Medium] mm: memory and DMA leaks on probe error paths
- [Low] cleanup: mixing __free() scope-based cleanup with goto error handli=
ng
- [Low] cleanup: mixed goto and __free() in zx_eth_probe()
--

commit 119d6d4afd1aad4ec6720d33caee938510d72bf0
Author: Navid Ghahremani <ghahramani.navid@gmail.com>

net: ethernet: zte: Add ZX279128S Ethernet switch driver

This commit introduces a new driver for the five-port gigabit switch
of the ZTE zx279128s SoC. It includes phylink support, switchdev
bridge forwarding, hardware IPv4 flow offload, and MAC statistics.

> diff --git a/drivers/net/ethernet/zte/zx279128s-main.c b/drivers/net/ethe=
rnet/zte/zx279128s-main.c
> index 0000000000000..3b9834d63f81c
> --- /dev/null
> +++ b/drivers/net/ethernet/zte/zx279128s-main.c
[ ... ]
> @@ -731,6 +731,14 @@ static int zx_eth_rx(struct zx_eth_adapter *adapter,=
 int budget)
>  				continue;
>  			}
>  			adapter->rx_synced[q] =3D true;
> =20
>  			if (bp =3D=3D 0) {
>  				adapter->rx_nobuf_cnt++;
>  				zx_rx_consume(desc, rel);
>  				adapter->rx_cur_idx[q]++;
>  				work_done++;
>  				avail--;
>  				continue;
>  			}

[Severity: Medium]
Does this code permanently leak buffer index 0? The BMU free list is
initialized with index 0 as a valid buffer, but this treats bp =3D=3D 0 as a
sentinel value. If the hardware legitimately uses buffer 0 for a received
frame, it seems we skip the frame and bypass zx_bmu_free_bp(), permanently
losing the buffer.

[ ... ]
> @@ -1213,6 +1213,7 @@ static int zx_eth_probe(struct platform_device *pde=
v)
>  	struct device_node *ports_np __free(device_node) =3D
>  		of_get_child_by_name(dev->of_node, "ethernet-ports");

[Severity: Low]
This isn't a bug, but does mixing scope-based cleanup helpers with goto
jumps in the same function violate the cleanup guidelines? zx_eth_probe()
utilizes both __free(device_node) and traditional goto error handling,
which the core documentation recommends avoiding to prevent out-of-order
execution issues during unwinding.

[ ... ]
> @@ -1245,6 +1246,8 @@ static int zx_eth_probe(struct platform_device *pde=
v)
>  	adapter->base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(adapter->base))
>  		return PTR_ERR(adapter->base);

[Severity: Medium]
Does this early return leak the rhashtable? rhashtable_init() was called
earlier in this function, but this return bypasses rhashtable_destroy().

[ ... ]
> @@ -1358,16 +1361,16 @@ static int zx_eth_probe(struct platform_device *p=
dev)
> =20
>  err_napi:
>  	netif_napi_del(&adapter->napi);
>  err_disconnect:
>  	for (i =3D 0; i < ZX_NUM_PORTS; i++) {

[Severity: High]
Do the error paths in this function permanently leak the 16 MiB contiguous
DMA arena and the initialized rhashtable? Because dma_alloc_coherent() is
not managed by devres, returning here without calling dma_free_coherent()
and rhashtable_destroy() leaves these resources stranded whenever the probe
fails.

[ ... ]
> @@ -1441,6 +1444,9 @@ static void zx_eth_shutdown(struct platform_device =
*pdev)
>  {
[ ... ]
>  	cancel_work_sync(&adapter->sw_work);
>  	cancel_delayed_work_sync(&adapter->mib_work);
> =20
>  	zx_hw_reset(adapter);
>  }

[Severity: High]
Can active notifiers reschedule the workqueue after the hardware has been
reset? zx_eth_shutdown() calls cancel_work_sync() and zx_hw_reset(), but
leaves the global notifiers registered. If another network device changes
state during the system teardown, the notifiers can catch the event and
call schedule_work(&adapter->sw_work). The worker thread would then run
zx_sw_work() and access MMIO registers while the hardware is in reset,
potentially causing bus faults or hangs.

> diff --git a/drivers/net/ethernet/zte/zx279128s-ppe.c b/drivers/net/ether=
net/zte/zx279128s-ppe.c
> index 0000000000000..d9c6c1d249dbd
> --- /dev/null
> +++ b/drivers/net/ethernet/zte/zx279128s-ppe.c
[ ... ]
> @@ -673,8 +673,9 @@ static void zx_ppe_stop(struct zx_eth_adapter *adapte=
r)
>  {
[ ... ]
>  	rhashtable_free_and_destroy(&adapter->ppe_flows, zx_ppe_flush, adapter);
>  	rhashtable_init(&adapter->ppe_flows, &zx_ppe_ht_params);

[Severity: High]
Does ignoring the return value of rhashtable_init() risk a kernel panic?
The initialization dynamically allocates memory and can fail. If it fails,
adapter->ppe_flows is left broken, and a subsequent offload request calling
rhashtable_insert_fast() on it would cause a crash.

> diff --git a/drivers/net/ethernet/zte/zx279128s-switch.c b/drivers/net/et=
hernet/zte/zx279128s-switch.c
> index 0000000000000..91df8de4556de
> --- /dev/null
> +++ b/drivers/net/ethernet/zte/zx279128s-switch.c
[ ... ]
> @@ -59,10 +59,10 @@ static void zx_sbrg_fdb_del(struct zx_eth_adapter *ad=
apter, const u8 *mac)
>  {
>  	static const int sizes[4] =3D { 1024, 256, 512, 512 };
>  	void __iomem *base =3D adapter->base;
>  	u32 hi =3D mac[0] << 16 | mac[1] << 8 | mac[2];
>  	u32 lo =3D mac[3] << 24 | mac[4] << 16 | mac[5] << 8;
>  	int n =3D sizes[readl(base + ZX_SBRG_TABLE_SEL) & 3];
>  	int ram, i;
> =20
>  	for (ram =3D 0; ram < 4; ram++) {
>  		for (i =3D 0; i < n; i++) {

[Severity: High]
Does this loop read out of bounds on the smaller RAM banks? The loop limit
n is calculated once based on the currently selected SBRG table. Since the
table sizes vary, if n is set to 1024 on the first bank, the loop will
attempt to read up to index 1023 on bank 1, which only has 256 entries.

[ ... ]
>  			if (zx_sbrg_ind(adapter, ram << 22 | i))
>  				return;
>  			writel(0, base + ZX_SBRG_IND_DATA(2));
>  			writel(0, base + ZX_SBRG_IND_DATA(1));
>  			writel(0, base + ZX_SBRG_IND_DATA(0));
>  			adapter->sw_fdb_deleted++;

[Severity: High]
Is this the correct sequence for indirect hardware access? zx_sbrg_ind()
issues the command to the ZX_SBRG_IND_CMD register and polls for completion
before the ZX_SBRG_IND_DATA registers are populated. If the hardware
triggers on the command write, it uses stale data. If it triggers on
DATA(0), zx_sbrg_ind() completes immediately, and the driver fails to wait
for the data write to finish before moving on.

[ ... ]
> @@ -142,6 +142,6 @@ static void zx_sw_apply(struct zx_eth_adapter *adapte=
r)
>  	writel(0, base + ZX_SBRG_LEARN);
>  	if (zx_sbrg_ind(adapter, ZX_SBRG_MEM_VLAN << 22 | 1))
>  		dev_warn(adapter->dev, "bridge VLAN table access timed out\n");
>  	else
>  		writel(members ? vlan | ZX_SBRG_VLAN_VALID : 0,
>  		       base + ZX_SBRG_IND_DATA(0));

[Severity: High]
Similar to the FDB deletion, is it safe to issue the ZX_SBRG_IND_CMD write
and poll for completion via zx_sbrg_ind() before populating
ZX_SBRG_IND_DATA(0)? This risks either writing stale data to the VLAN table
or initiating a write that is never waited on.

[ ... ]
> @@ -328,6 +328,6 @@ void zx_sw_init(struct zx_eth_adapter *adapter)
>  {
>  	adapter->sw_netdev_nb.notifier_call =3D zx_sw_netdev_event;
>  	adapter->sw_switchdev_nb.notifier_call =3D zx_sw_switchdev_event;
>  	adapter->sw_switchdev_blocking_nb.notifier_call =3D
>  		zx_sw_switchdev_blocking_event;
>  	adapter->sw_ready =3D
>  		!register_netdevice_notifier(&adapter->sw_netdev_nb) &&
>  		!register_switchdev_notifier(&adapter->sw_switchdev_nb) &&
>  		!register_switchdev_blocking_notifier(&adapter->sw_switchdev_blocking_=
nb);

[Severity: Medium]
Can a partial registration failure leak notifiers? Because the logical AND
operator uses short-circuit evaluation, if register_netdevice_notifier()
succeeds but register_switchdev_notifier() fails, the sequence stops. The
function marks sw_ready =3D false but leaves the first notifier fully active
without calling unregister_netdevice_notifier() to clean it up.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010130024.1775=
03-1-ghahramani.navid@gmail.com?part=3D18
