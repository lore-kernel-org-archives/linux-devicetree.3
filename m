Received: from out28-221.mail.aliyun.com (out28-221.mail.aliyun.com [115.124.28.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA2BF9E8
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 03:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785123097; cv=none; b=cnLma2awnLlcilF2StbFRYyWiC3qvn1Ztdok2tq/oxXIKqnYs39LLDH+UUFOjMU91rHHAwIXrQHbi+LjcHkighXBl+TLptrJLML2SHTSEBhukXvLpoIXGw30F3lL0WMjAzG2zZKt7iQ00VjM4pP7MDp03iUW99MoRZTR5J+/bFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785123097; c=relaxed/simple;
	bh=rVB++8jkNC3hE6fMgqHPUBxEv/eUKumxWGnD+6xJuYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hd7XZS2wV05PLT+0RIuLWDpNaFWDUQkRiOuHg0d6PSz2nRLXx2pld/sqwZsn7DF6L9RnpDdP/kfCtodDexR3Gs31ZyXnT9q5anbGhUa1rdUSbfibSprAg3C12wkTn2ktUF6QXh7i/9EO2LoXLI6M0xyIHcF0vl8+LTYL7xz2aJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=MZEMA52s; arc=none smtp.client-ip=115.124.28.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="MZEMA52s"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1785123085; h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type;
	bh=JJGRsw6h/JlMMNbNDay/y82Dx+xYkIYZLHo80tfh810=;
	b=MZEMA52s+/74unPA4Qlf8hqRF/HbCwqcsjsfQOSYHu2FKvurIaoyg36k08750R2KHuC2tzX0YV7DxIrzgMAVxtRvdVBv/lWJJir8W9Ilnu+iaSHzgOmphfJ69tFZvvTF3P115872oulprrDpTMPB7d+NkUBTeWQ47U/0U8oInIsOmo7PtlwtyN2rD8nlwecuhLzF05HkAkYwVSQ4ntYDsOlCVDCZ6i+boAZwwQRPEc6zgCBXlXCZlrb47V+EZAiBgFeJ9NYqd3SuCXTrCE2mTvr5/kfQUAwfNns2n2d92dKZx/cqyB9vGPpnz+3tCB/5I+LgRIAoJLqgGmEUWPTNPA==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.00819441-0.00028863-0.991517;FP=7600237916455625278|10|1|9|0|-1|-1|-1;HT=maildocker-contentspam033037031241;MF=syyang@lontium.com;NM=1;PH=DS;RN=1;RT=1;SR=0;TI=SMTPD_---.iW5pslE_1785123082;
Received: from mail-oi1-f181.google.com(mailfrom:syyang@lontium.com fp:SMTPD_---.iW5pslE_1785123082 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 27 Jul 2026 11:31:23 +0800
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so216382b6e.0
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 20:31:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpr/fu5e1QqPcXmcrhgcY65no8Q9ihrLg22qEii8nMYRgHm94chBUIHkROEU2hYk/xUNDW8tB8OXiVH@vger.kernel.org
X-Gm-Message-State: AOJu0YxyKs1jlM5uehdsFBQkwGV1+nglKPHYRAXcFuLzy+2jhfst5r0E
	CYOsQoNgunZVtBCd6RUgTO11K8v95NIgLPF/NSDeRamb1WeUKIvH1bZBOxLhKJQn5CkyCirpHVU
	uh+BRLymY3Gt/zrlq04RcpXlYrdnXbME=
X-Received: by 2002:a05:6808:3507:b0:495:dbb:7320 with SMTP id
 5614622812f47-4ab6a3b8215mr6031738b6e.41.1785123081582; Sun, 26 Jul 2026
 20:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715015438.2770155-1-syyang@lontium.com>
In-Reply-To: <20260715015438.2770155-1-syyang@lontium.com>
From: Sunyun Yang <syyang@lontium.com>
Date: Mon, 27 Jul 2026 11:31:10 +0800
X-Gmail-Original-Message-ID: <CAFQXuNbMJjJS4yrW2Dkw_TDGP+LZmn+uuZc4QSqhk4R3ZG+jGQ@mail.gmail.com>
X-Gm-Features: AUfX_mxhh7W27XH1eA06atdYiFdi9PQnCFEbl23GGcWpALjOrcpxz80_mVaeXM4
Message-ID: <CAFQXuNbMJjJS4yrW2Dkw_TDGP+LZmn+uuZc4QSqhk4R3ZG+jGQ@mail.gmail.com>
Subject: Re: [PATCH v17 0/2] Add Lontium LT7911EXC eDP to MIPI DSI bridge
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	dmitry.baryshkov@oss.qualcomm.com, maarten.lankhorst@linux.intel.com, 
	rfoss@kernel.org, mripard@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, tzimmermann@suse.de, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com, rlyu@lontium.com, 
	xbpeng@lontium.com, qdchen@lontium.com, llzhang@lontium.com, 
	hfxia@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<syyang@lontium.com> =E4=BA=8E2026=E5=B9=B47=E6=9C=8815=E6=97=A5=E5=91=A8=
=E4=B8=89 09:54=E5=86=99=E9=81=93=EF=BC=9A
>

Hi all,
Just a gentle ping on this patch series. It has been about two weeks
since I sent it, and I haven't seen any comments yet.

I'm not entirely sure about the next steps. Any guidance would be
greatly appreciated.

Thanks,

> From: Sunyun Yang <syyang@lontium.com>
>
> The LT7911EXC is an I2C-controlled bridge that receives eDP1.4
> and output mipi dsi. This series introduces:
>
> - A device tree binding YAML file describing the hardware
> - A new DRM bridge driver implementing the basic functionality
>
> Signed-off-by: Sunyun Yang<syyang@lontium.com>
> ---
> Change in v17:
> - dt-binding:
> - drm/bridge:
>  1. [High] devm leak and list corruption on panel rebind                 =
                                 [sashiko-bot]
>            False positive. The -EBUSY guard at the top of host_attach() (=
line 527) rejects re-attach
>            when output_bridge is already set, so neither devm_drm_of_get_=
bridge() nor drm_bridge_add()
>            is reached on panel rebind.
>  2. [High] Dangling bridge.dev pointer                                   =
                                  [sashiko-bot]
>            DRM bridge framework limitation. drm_bridge_remove() does not =
clear bridge.dev. All bridge
>            drivers using drm_kms_helper_hotplug_event() share this risk. =
Requires framework-level fix.
>            Triggering needs root sysfs access plus DRM driver unload simu=
ltaneously.
>  3. [Medium] output_bridge not cleared prevents re-attach                =
                                   [sashiko-bot]
>            Intentional. Same as cdns-dsi-core.c cdns_dsi_detach(). Cleari=
ng would
>            cause devm_drm_of_get_bridge() to leak on re-attach. DRM bridg=
e framework does not support
>            dynamic chain reconfiguration. Panel rebind requires host driv=
er reload.
>  4. [Low] Mutating downstream bridge's pre_enable_prev_first             =
                                   [sashiko-bot]
>           Hardware constraint. DSI stream (0xe0b0) must be enabled after =
panel power-on. Safe because
>           transfer() is a stub =E2=80=94 DCS commands are discarded, pane=
l init is done by chip firmware.
>           Comment documents the rationale.
>  5. [Low] Unsynchronized removed read                                    =
                                [sashiko-bot]
>           Fixed. Now protected by ocm_lock (lines 372-375).
> - Link to v16: https://lore.kernel.org/all/20260714105828.2763677-1-syyan=
g@lontium.com/
>
> Change in v16:
> - dt-binding:
>  1. [Low] Use standard generic DT node name
>           Renamed mipi-bridge@41 to bridge@41 per Devicetree spec for sta=
ndard generic names.                 [sashiko-bot]
> - drm/bridge:
>  1. [High] Prevent devm_drm_of_get_bridge() devres leak in host_attach
>            Added -EBUSY guard to reject re-attach, preventing devm memory=
 leak and use-after-free on          [sashiko-bot]
>            panel unbind/rebind.
>  2. [High] Fix double drm_bridge_remove() in lt7911exc_remove()          =
                                     [sashiko-bot]
>            Removed the flawed list_empty() check that caused a second drm=
_bridge_remove() call,
>            leading to double mutex_destroy() and use-after-free.
>  3. [High] Clear upgrade flag before hotplug event                       =
                                     [sashiko-bot]
>            Reordered to clear upgrade =3D false before drm_kms_helper_hot=
plug_event(), preventing modesets from
>            silently skipping hardware enable (0xe0b0) and causing black s=
creen.
>  4. [Medium] Document pre_enable_prev_first override                     =
                                      [sashiko-bot]
>              Added comment explaining the hardware constraint: DSI stream=
 must be enabled after panel power-on.
>              The override is safe because transfer() is a stub =E2=80=94 =
DCS commands are discarded and panel init is
>              handled by chip firmware.
>  5. [Medium] Guard hotplug with removed flag                             =
                                       [sashiko-bot]
>              Added !lt7911exc->removed check to prevent hotplug events du=
ring device removal.
>  6. [High] Use local variable for error handling                         =
                                       [sashiko-bot]
>            Introduced local bridge variable for IS_ERR()/PTR_ERR() checks=
, ensuring output_bridge stays NULL on
>            failure so -EPROBE_DEFER retries are not blocked by the -EBUSY=
 guard.
> - Link to v15: https://lore.kernel.org/all/20260714064822.2753289-1-syyan=
g@lontium.com/
>
> Change in v15:
> - dt-binding:
> - drm/bridge:
>  1. Remove the Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualco=
mm.com> tag.
>  2. Adjust the design architecture of the chip's MIPI host and bridge.
>  3. remove devm_drm_panel_bridge_add_typed and drm_of_find_panel_or_bridg=
e
>  4. Use REGCACHE_NONE to avoid cache inconsistency due to internal MCU mo=
difying registers asynchronously
> - Link to v14: https://lore.kernel.org/all/20260529112928.873766-1-syyang=
@lontium.com/
>
> Change in v14:
> - dt-binding:
> - drm/bridge:
>  1. [High] AB-BA / self-deadlock between the bridge's ocm_lock and DRM mo=
deset                             [sashiko-bot]
>     locks during hotplug notification. - fixed
>  2. [High] Freeing the panel bridge in lt7911exc_dsi_host_detach while it=
 is still
>     attached to the DRM bridge chain causes a Use-After-Free. - fixed
> - Link to v13: https://lore.kernel.org/lkml/20260529094547.869919-1-syyan=
g@lontium.com/
>
> Change in v13:
> - dt-binding:
> - drm/bridge:
>  1. [High] Dangling pointer created during MIPI DSI host detach if the do=
wnstream                           [sashiko-bot]
>            device is a bridge rather than a panel. - fixed
>  2. [High] Firmware upgrade CRC mismatch due to unpadded partial page wri=
tes.
>            - hardware erases the entire flash area into a default state o=
f 0xff. When doing
>              a partial page short write=EF=BC=8Cthe total unwritten resid=
ual bytes on the physical
>              flash sector inherently retain their 0xff state. Therefore, =
no modification is required.
>  3. [High] Firmware upgrade workqueue accesses `bridge.dev` without ensur=
ing the DRM device is alive,
>            leading to a Use-After-Free. - fixed
>  4. [High] Regmap page selector cache desynchronization after device rese=
t causes firmware upgrade
>            commands to be routed to the wrong register page. - fixed
> - Link to v12: https://lore.kernel.org/lkml/20260525010545.9470-1-syyang@=
lontium.com/
>
> Change in v12:
> - dt-binding:
> - drm/bridge:
>  1. Move the cleanup work of drm_panel_bridge_remove() forward into lt791=
1exc_dsi_host_detach().                        [sashiko-bot]
>  2. Do not hold any lock during lt7911exc_reset().
> - Link to v11: https://lore.kernel.org/lkml/20260522015735.2833-1-syyang@=
lontium.com/
>
> Change in v11:
> - dt-binding:
> - drm/bridge:
>  1. Removed Reviewed-by, we would appreciate it if the maintainer could h=
elp review this.
>  2. Use devm_gpiod_get(,, GPIOD_OUT_HIGH) to fix the reset GPIO backpower=
ing issue.                                       [sashiko-bot]
>  3. Fixed Use-After-Free vulnerability due to dynamic DRM bridge removal =
in DSI detach callback.
>  4. Fixed Use-After-Free of regmap during DRM teardown because firmware u=
pgrade worker defeats removal safeguard.
>  5. Fixed firmware upgrade performs a hardware reset, causing silent loss=
 of DRM state and a blank screen.
>  6. Use of kmalloc for a 64KB software buffer is susceptible to memory fr=
agmentation failures - Fix by using kvmalloc
>  7. Use the 'lt7911exc->ocm_lock' mutex and the 'lt7911exc->upgrade' flag=
 to resolve the race condition between
>     DRM atomic modeset and firmware upgrade.
>  8. Use the 'lt7911exc->upgrade_lock' mutex to prevent redundant upgrades=
.
>  9. Use the 'lt7911exc->removed' flag to prevent the driver from being tr=
iggered to upgrade during the unload process.
> - Link to v10: https://lore.kernel.org/lkml/20260519135816.26996-1-syyang=
@lontium.com/
>
> Change in v10:
> - dt-binding:
> - drm/bridge:
>  1. Fixed the firmware upgrade error paths to always clear the upgrade
>     flag before returning, including firmware size validation failures
>     and allocation failures.                                             =
                   [sashiko-bot]
>  2. Added proper locking in lt7911exc_atomic_pre_enable() and
>     lt7911exc_atomic_post_disable() to serialize register accesses with t=
he
>     firmware upgrade flow and avoid concurrent I2C transactions.
>  3. Added an exclusivity check in lt7911exc_dsi_host_attach() to reject m=
ultiple
>     downstream attachments and prevent repeated drm_bridge_add() calls an=
d panel bridge leaks.
>  4. Reworked lt7911exc_firmware_store() to use mutex_trylock() so concurr=
ent sysfs writers
>     immediately return -EBUSY instead of blocking behind an active firmwa=
re upgrade.
>  5. Updated the remove path to prevent new firmware upgrade work from bei=
ng queued after
>     device removal by setting the upgrade state before cancelling the wor=
ker.
> - Link to v9: https://lore.kernel.org/lkml/20260519105019.22622-1-syyang@=
lontium.com/
>
> Change in v9:
> - dt-binding:
> - drm/bridge:
>  1. DSI transfer callback returns success for reads without populating   =
                     [sashiko-bot]
>     the receive buffer, leaking uninitialized memory. - fixed it by
>     implementing  a strict whitelist mechanism.
>  2. DSI transfer callback polls for eDP video readiness before the
>     upstream encoder is enabled, guaranteeing a timeout. - removed
>  3. The driver attempts I2C transfers while the hardware is held in
>     physical reset. - fixed
>  4. Missing DRM_MIPI_DSI Kconfig dependency causes linker errors. - fixed
>  5. request_firmware is called while holding the hardware lock and
>     halting the MCU, risking a system pipeline stall. - fixed
>  6. Sleeping functions are called from atomic context in the DRM bridge c=
allbacks. - fixed
>  7. lt7911exc_dsi_host_transfer bypasses the required MCU hardware halt s=
equence. - fixed by
>     internal firmware controls the panel initialization sequence and hand=
les all MIPI
>     DSI command transmission.
> - Link to v8: https://lore.kernel.org/lkml/20260515080934.9870-1-syyang@l=
ontium.com/
>
> Change in v8:
> - dt-binding:
> - drm/bridge:
>  1. Protect firmware upgrade and DRM bridge callback paths with ocm_lock.=
          [sashiko-bot]
>  2. Remove the hardware reset from the remove callback, and ensure that
>     all hardware reset operations are protected by ocm_lock.
>  3. crc reconstruction explicitly casts each byte to u32 before shifting
>  4. The display configuration is handled by the firmware, and the MIPI
>     DSI host registration issue has been fixed.
>  5. The batch register read/write operations have already been updated
>     to include return value checking.
>  6. The dev_err_probe() used outside of probe context has been fixed.
> - Link to v7: https://lore.kernel.org/lkml/20260512064013.40066-1-syyang@=
lontium.com/
>
> Change in v7:
> - dt-binding:
>  1. fix commit message typos(Receiver=E3=80=81signal)                    =
        [sashiko-bot]
>  2. remove the ambiguity caused by "signal/dual".
> - drm/bridge:
>  1. using devm_regulator_get_enable avoids power leaks.                  =
 [sashiko-bot]
>  2. set reset gpio is low after cutting off power in lt7911exc_remove fun=
ction, avoid backpowering.
>  3. synchronous request_firmware() call cause a permanent probe failure i=
f the driver is built-in,
>     probe executes before the root filesystem is mounted, which would cau=
se this to fail with -ENOENT,
>     we have removed this functionality. Use trigger to upgrade.
>  4. add `depends on I2C` and `select REGMAP_I2C` in Kconfig.
>  5. add return value of `devm_drm_bridge_add()` in `probe()`.
>  6. add directly header files (linux/slab.h, linux/delay.h, linux/regulat=
or/consumer.h)
> - Link to v6: https://lore.kernel.org/lkml/20260508134702.4713-1-syyang@l=
ontium.com/
>
> Change in v6:
> - dt-binding:
> - drm/bridge:
>  1. use #define FW_FILE  "Lontium/lt7911exc_fw.bin" to match linux-firmwa=
re
> - Link to v5: https://lore.kernel.org/lkml/20260506013153.2240-1-syyang@l=
ontium.com/
>
> Change in v5:
> - dt-binding:
> - drm/bridge:
>  1. Change "mipi" to "mipi dsi" in the commit message.     [Dmitry]
>  2. Change "eDP/MIPI" to "eDP/MIPI DSI" in Kconfig.
> - Link to v4: https://lore.kernel.org/lkml/20260430094612.3408174-1-syyan=
g@lontium.com/
>
> Change in v4:
> - dt-binding:
>  1. Fix the missing spaces on the "subject".             [Krzysztof]
>  2. Fix the error descriptions for port@0 and port@1.
> - drm/bridge:
> - Link to v3: https://lore.kernel.org/lkml/20260429040541.3404116-1-syyan=
g@lontium.com/
>
> Change in v3:
> - dt-binding:
> - drm/bridge:
>  1. already submit lt7911exc_fw.bin to linux-firmware.  [Dmitry]
>  2. remove lt7911exc_remove function.
>  3. drop  the "lontium, "  in lt7911exc_i2c_table.
> - Link to v2: https://lore.kernel.org/lkml/20260428063224.3316655-1-syyan=
g@lontium.com/
>
> Change in v2:
> - dt-binding:
>  1. reset pins use active low.                        [Dmitry]
> - drm/bridge:
>  1. use atomic_* callbacks.                           [Quentin]
>  2. fix the incorrect formatting and spaces.
>  3. add the required header files.                    [Dmitry]
>  4. remove "enabled" flag.
>  5. remove *fw from the lt7911exc struct.
>  6. .max_register and .range_max use actual range.
>  7. regulator use bulk interface.
>  8. use dev_err_probe, devm_mutex_init and devm_drm_bridge_add.
>  9. Replace GPL v2 with GPL.
> - Link to v1: https://lore.kernel.org/lkml/20260420023354.1192642-1-syyan=
g@lontium.com/
>
> ---
> Sunyun Yang (2):
>   dt-bindings: bridge: Add Lontium LT7911EXC eDP to MIPI DSI bridge
>   drm/bridge: Add Lontium LT7911EXC eDP to MIPI DSI bridge
>
>  .../display/bridge/lontium,lt7911exc.yaml     |  89 ++
>  drivers/gpu/drm/bridge/Kconfig                |  17 +
>  drivers/gpu/drm/bridge/Makefile               |   1 +
>  drivers/gpu/drm/bridge/lontium-lt7911exc.c    | 787 ++++++++++++++++++
>  4 files changed, 894 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lont=
ium,lt7911exc.yaml
>  create mode 100644 drivers/gpu/drm/bridge/lontium-lt7911exc.c
>
> --
> 2.34.1
>
