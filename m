Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795726471;
	b=UzDrhtuj7xJuMMFRtdhCUHp15/erC8gJqyunluJ0jCYybluWoBFZDvh7kmHFwWXzj9FD
	 pCpeFKYCjY37Jy+LCicnjf7aJypTdmEbGWmr/SWREQ83IYhybVyDG7dLe3WITWqo20ia3
	 5AJHzyB3+ySK7S01ike6FSkhpOwTztEULe7Nje/C/9/0NLMFjLbTD7zFOHbRluutLLFF3
	 XvFUuwIesF1IU8Z7nI2NBIMgFHvaLU/SS3ByfpZnUUOAKPHwnQ6aqj6Yc2Adm7GFz0W+d
	 7X3mUFsp7PkYsCpWfhjoQBya0XfA6bIRL8xVAdl0ZI+1jGHC31WghaaC7PpAWdktoug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726471;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=stKO9cjO02tBSWI2HGbicmHUf6utIU4a/LFU7DuUvpY=;
	b=sI3Yl4fW4IdA2llyQLICSeNcFKLwQDtEt0PSo9rhhLBwXarso8k2/Z/W0aumGyG3Rh7t
	 JJXGChSU67XAPke/LkqKso4s3+pepUVjc1+FHJ1E5BmiQZsfcIWkqXrqg3xhlIIhmBtyM
	 m5puTkS+FzETe+Z68eyihxIr4MK5GyQrUKJuLvN9mCuIB43cbYFEWRCau8zwPnKGMWj4j
	 7VrBO/ljhWmlAJ9t5KJOHlFjkQk+e8+x22aTPn5o0ho6hE/fUF63UKS5YAIBtAGzBxJn5
	 VyQhnneo/T7uCcevncsFzKCh+7ojMO0kpbiAv5agTpAbjXXaI4VVmZiutgTxqirYJcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PQcuTmcK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE7B606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 20:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PQcuTmcK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607941F00893;
	Thu, 26 Nov 2026 20:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795726470;
	bh=stKO9cjO02tBSWI2HGbicmHUf6utIU4a/LFU7DuUvpY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PQcuTmcKMXeN3FLyTA7E7bSPBaHTxfaL7k0TDvaDZZveca+AHDOt8YBvcoxkxP+5v
	 7aDVBseJW79KxCeGDlY2MbCzttW1JIYEr/TA+3AcR50G6PWgoLirx/f7ffrF3FJRmS
	 r2gLbR7JoYlWRgamKuD8YyyB+V4VeASLP2lGmdffySeiuYcRlqMXeL46SpAeqYaAER
	 FBP5gZa9IXSJj2rbKNNN/PSXD/u2Z4QtH824BmZKivvLXh3TwRgeTjijjIjXWN75Qg
	 eAS4gVHBGZyC9MamH5S5ZJgYx0VUblrHs0EFMfwLKFtSvglE3TjqT7WbvbK4tWuAJV
	 1AgnTCUDYPyaQ==
Message-ID: <sashiko-outbox-236174@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC net-next 5/7] net: dsa: qca8k: select the four-byte
 format before port activation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-almondplus-offload-rfc-v1-5-703175c6340c@gmail.com>
References: <20261125-almondplus-offload-rfc-v1-0-703175c6340c@gmail.com>
 <20261125-almondplus-offload-rfc-v1-5-703175c6340c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 20:54:30 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential
issues to consider:
- [High] net: dsa: qca8k: pre-open MTU change desynchronizes conduits
  and wedges switch
- [High] net: dsa: qca8k: lock inversion between persistent_lock and
  live_lock on open
- [High] net: dsa: qca8k: missing change_tag_protocol op rejects qca4 DT
  probe
- [Medium] net: dsa: qca8k: qca8k_persistent_first_user_locked() replays
  CPU MACs when ready
- [Medium] net: dsa: qca8k: qca8k_port_enable() ignores
  qca8k_persistent_port_status() error
- [Low] net: dsa: qca8k: unused transaction helpers in persistent_qca4.h
  duplicated
- [Low] net: dsa: qca8k: false fault on remove in
  qca8k_persistent_remove()
--

commit b0b6c968f61aca7939b30eea79316b5b27dbbff1
Author: Fil Dunsky <filipp.dunsky@gmail.com>

net: dsa: qca8k: select the four-byte format before port activation

This commit adds opt-in support for selecting and verifying the four-byte
QCA4 header format on dual-conduit CS7542 QCA8337 switches before user
port activation, and restores the two-byte header format on teardown.

> diff --git a/drivers/net/dsa/qca/persistent_qca4.h b/drivers/net/dsa/qca/=
persistent_qca4.h
> new file mode 100644
> index 0000000000000..6e4dc21622748
> --- /dev/null
> +++ b/drivers/net/dsa/qca/persistent_qca4.h
> @@ -0,0 +1,178 @@
[ ... ]
> +struct qca4_persistent_ops {
> +	void *context;
> +	int (*quiesce)(void *context);
> +	int (*stop_all_macs)(void *context);
> +	int (*read_global)(void *context, qca4_word *value);
> +	int (*read_cpu_header)(void *context, unsigned int cpu_port,
> +			       qca4_word *value);
> +	int (*set_global)(void *context, qca4_word value, bool restore,
> +			  bool *verified);
> +	int (*software_ready)(void *context);
> +	int (*replay_cpu_enables)(void *context);
> +};
[ ... ]
> +static inline int qca4_persistent_restore(struct qca4_persistent_state *=
state,
> +					  struct qca4_persistent_ops *ops)
[ ... ]
> +static inline int qca4_persistent_begin(struct qca4_persistent_state *st=
ate,
> +					struct qca4_persistent_ops *ops,
> +					bool opt_in)
[ ... ]
> +static inline int qca4_persistent_ready(struct qca4_persistent_state *st=
ate,
> +					struct qca4_persistent_ops *ops)

[Severity: Low]
This isn't a bug, but struct qca4_persistent_ops, qca4_persistent_restore(),
qca4_persistent_begin(), and qca4_persistent_ready() are never called.
Instead, qca8k-persistent-boot.inc and qca8k-persistent-lifecycle.inc
open-code the same state transitions directly on priv->persistent_boot.

> diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k=
-8xxx.c
> index 382753bcc466a..3e120ddaa684c 100644
> --- a/drivers/net/dsa/qca/qca8k-8xxx.c
> +++ b/drivers/net/dsa/qca/qca8k-8xxx.c
[ ... ]
> @@ -2032,6 +2094,9 @@ static const struct phylink_mac_ops qca8k_phylink_m=
ac_ops =3D {
> =20
>  static const struct dsa_switch_ops qca8k_switch_ops =3D {
>  	.get_tag_protocol	=3D qca8k_get_tag_protocol,
> +#if IS_ENABLED(CONFIG_NET_DSA_QCA8K_4B_MODE)
> +	.teardown		=3D qca8k_persistent_dsa_teardown,
> +#endif
>  	.setup			=3D qca8k_setup,

[Severity: High]
Does probing with dsa-tag-protocol =3D "qca4" in the device tree always fail
with -EINVAL because qca8k_switch_ops has no .change_tag_protocol callback?

qca8k_persistent_boot_admit() requires dsa-tag-protocol =3D "qca4" on every
CPU port node to enable four-byte mode.  When dsa_register_switch() ->
dsa_port_parse_of() -> dsa_port_parse_cpu() sees that property on a CPU
port, it checks ds->ops->change_tag_protocol before comparing the protocol
against ds->ops->get_tag_protocol(), and aborts probe with -EINVAL when the
callback is NULL.

> diff --git a/drivers/net/dsa/qca/qca8k-common.c b/drivers/net/dsa/qca/qca=
8k-common.c
> index ab978cc8367f7..2f690593e913e 100644
> --- a/drivers/net/dsa/qca/qca8k-common.c
> +++ b/drivers/net/dsa/qca/qca8k-common.c
> @@ -741,6 +751,31 @@ int qca8k_port_enable(struct dsa_switch *ds, int por=
t,
>  		      struct phy_device *phy)
>  {
>  	struct qca8k_priv *priv =3D ds->priv;
> +#if IS_ENABLED(CONFIG_NET_DSA_QCA8K_4B_MODE)
> +	int ret;
> +
> +	if (READ_ONCE(priv->persistent_boot.requested) &&
> +	    dsa_is_cpu_port(ds, port)) {
> +		mutex_lock(&priv->persistent_lock);
> +		if (!priv->persistent_boot.ready) {
> +			priv->persistent_cpu_requested |=3D BIT(port);
> +			priv->port_enabled_map |=3D BIT(port);
> +			mutex_unlock(&priv->persistent_lock);
> +			return 0;
> +		}
> +		mutex_unlock(&priv->persistent_lock);
> +	}
> +	if (dsa_is_user_port(ds, port)) {
> +		ret =3D qca8k_persistent_first_user(priv);
> +		if (ret)
> +			return ret;
> +	}
> +
> +#endif
> +
> +	if (IS_ENABLED(CONFIG_NET_DSA_QCA8K_4B_MODE) &&
> +	    READ_ONCE(priv->private_open_blocked))
> +		return -EIO;
> =20
>  	qca8k_port_set_status(priv, port, 1);
>  	priv->port_enabled_map |=3D BIT(port);

[Severity: Medium]
Can qca8k_port_enable() return 0 and mark the port enabled when
qca8k_persistent_port_status() fails inside qca8k_port_set_status()?

If the MDIO update or readback verification in qca8k_persistent_port_status=
()
fails, it sets priv->private_open_blocked =3D true, latches the error, and
stops both CPU MACs.  Because qca8k_port_set_status() returns void and
qca8k_port_enable() only checks priv->private_open_blocked beforehand,
qca8k_port_enable() still sets priv->port_enabled_map |=3D BIT(port) and
returns success to DSA with the switch halted.

> diff --git a/drivers/net/dsa/qca/qca8k-persistent-boot.inc b/drivers/net/=
dsa/qca/qca8k-persistent-boot.inc
> new file mode 100644
> index 0000000000000..88638bb533570
> --- /dev/null
> +++ b/drivers/net/dsa/qca/qca8k-persistent-boot.inc
> @@ -0,0 +1,632 @@
[ ... ]
> +static int qca8k_persistent_change_mtu_locked(struct qca8k_priv *priv, i=
nt port,
> +					      int mtu)
> +{
> +	struct qca4_persistent_mtu_ops ops =3D qca8k_persistent_mtu_ops(priv);
> +	struct dsa_port *user;
> +	unsigned int largest =3D ETH_DATA_LEN;
> +	bool blocked;
> +	int ret =3D 0;
> +
> +	ASSERT_RTNL();
> +	if (!dsa_is_user_port(priv->ds, port) &&
> +	    !dsa_is_cpu_port(priv->ds, port))
> +		return -EOPNOTSUPP;
> +	if (mtu <=3D 0 || mtu > QCA8K_MAX_MTU)
> +		return -EINVAL;
> +	lockdep_assert_held(&priv->persistent_lock);
> +	if (priv->persistent_closing || priv->persistent_boot.first_error ||
> +	    priv->persistent_mtu.pending || priv->persistent_mtu.unknown) {
> +		ret =3D -EUCLEAN;
> +		goto unlock;
> +	}
> +	/*
> +	 * Early DSA allocation has not yet published both conduits. First-open
> +	 * readiness performs the initial checked transaction before MAC replay.
> +	 */
> +	if (!priv->persistent_boot.ready)
> +		goto unlock;

[Severity: High]
Can changing a user port MTU after switch registration but before the first
user port is opened desynchronize the two conduits and permanently wedge the
switch on open?

When userspace changes a user port MTU while all user ports are still down,
dsa_user_change_mtu() updates the assigned conduit (conduit 0) to
largest_mtu + 4 before calling qca8k_port_change_mtu().  Because
priv->persistent_boot.ready is still false,
qca8k_persistent_change_mtu_locked() returns 0 here without clamping
conduit 0 to ETH_DATA_LEN + 4 or updating conduit 6.

If the user port MTUs are lowered below 1500 before the first open (leaving
conduit 0 below 1504), qca8k_persistent_first_user_locked() calls
qca8k_persistent_software_ready() before qca4_pmtu_change().
qca8k_persistent_software_ready() checks cpu->conduit->mtu >=3D 1504, fails
with -EMSGSIZE, and jumps to failed:, latching
priv->persistent_boot.first_error and blocking all future port opens.  If a
user port MTU is raised above 1500 before first open, conduit 0 is raised
while conduit 6 stays at 1504, so the initial qca4_pmtu_change() snapshots a
mismatched pair into state->saved[].

[ ... ]

> +static int qca8k_persistent_first_user_locked(struct qca8k_priv *priv)
> +{
> +	unsigned int port;
> +	u32 value;
> +	int ret;
> +
> +	if (!priv->persistent_boot.requested)
> +		return 0;
> +	ASSERT_RTNL();
> +	if (priv->persistent_closing || !priv->persistent_boot.hardware4 ||
> +	    priv->persistent_boot.unknown || priv->persistent_boot.first_error)
> +		return -EIO;

[Severity: Medium]
Should qca8k_persistent_first_user_locked() return 0 immediately when
priv->persistent_boot.ready is already true?

qca8k_port_enable() calls qca8k_persistent_first_user() on every user port
open.  Without an early return once ready is true, bringing up a second user
port re-runs qca8k_persistent_replay_cpus() and rewrites
QCA8K_REG_PORT_STATUS(0) and QCA8K_REG_PORT_STATUS(6) over MDIO while traff=
ic
is active and after priv->persistent_fe_held has already been released.

> +	ret =3D qca8k_persistent_software_ready(priv, !priv->persistent_mtu.com=
mitted_valid);
> +	/*
> +	 * A netdev can be published before the complete DSA tree. This is a
> +	 * pre-I/O readiness refusal, not an I/O fault or a permanent latch.
> +	 */
> +	if (ret =3D=3D -EAGAIN)
> +		return ret;
> +	if (ret)
> +		goto failed;
> +	if (priv->persistent_status_valid !=3D (BIT(0) | BIT(6)))
> +		return -EAGAIN;
> +	ret =3D qca8k_read_mii(priv, QCA8K_REG_GLOBAL_HDR_CTRL, &value);
> +	if (!ret && (value & QCA4_PERSISTENT_MASK) !=3D QCA4_PERSISTENT_VALUE)
> +		ret =3D -EUCLEAN;
> +	for (port =3D 0; !ret && port <=3D 6; port +=3D 6) {
> +		ret =3D qca8k_read_mii(priv, QCA8K_REG_PORT_HDR_CTRL(port),
> +				     &value);
> +		if (!ret && value !=3D QCA4_PERSISTENT_CPU_HEADER)
> +			ret =3D -EUCLEAN;
> +	}
> +	if (!ret && !priv->persistent_mtu.committed_valid) {
> +		struct qca4_persistent_mtu_ops ops =3D
> +			qca8k_persistent_mtu_ops(priv);
> +		struct dsa_port *user;
> +		unsigned int largest =3D ETH_DATA_LEN;
> +
> +		dsa_switch_for_each_user_port(user, priv->ds)
> +			if (user->user)
> +				largest =3D max_t(unsigned int, largest,
> +						user->user->mtu);
> +		ret =3D qca4_pmtu_change(&priv->persistent_mtu, &ops, largest + 4,
> +				       largest + ETH_HLEN + ETH_FCS_LEN);
> +	}
> +	if (!ret)
> +		ret =3D qca8k_persistent_software_ready(priv, false);
> +	if (!ret)
> +		ret =3D qca8k_persistent_replay_cpus(priv);
> +	if (ret)
> +		goto failed;
> +	if (priv->persistent_fe_held) {
> +		ret =3D cs7542_ft_live_format_release();
> +		if (ret)
> +			goto failed;
> +		priv->persistent_fe_held =3D false;
> +	}

[Severity: High]
Does calling cs7542_ft_live_format_release() under priv->persistent_lock
invert the lock ordering against live_lock?

CPU0                              CPU1
----                              ----
lock(&priv->persistent_lock)
                                  lock(&live_lock)
lock(&live_lock)
                                  lock(&priv->persistent_lock)

 *** DEADLOCK ***

CPU0: qca8k_port_enable() -> qca8k_persistent_first_user() ->
      qca8k_persistent_first_user_locked() -> cs7542_ft_live_format_release=
()
CPU1: live_rule() -> provider_ops->rule() -> ... -> qca8k_persistent_status=
()

Unlike qca8k_persistent_detach_complete(), which drops priv->persistent_lock
around cs7542_ft_live_format_release(), qca8k_persistent_first_user_locked()
calls it while holding priv->persistent_lock.

> diff --git a/drivers/net/dsa/qca/qca8k-persistent-lifecycle.inc b/drivers=
/net/dsa/qca/qca8k-persistent-lifecycle.inc
> new file mode 100644
> index 0000000000000..bd7892b80aba0
> --- /dev/null
> +++ b/drivers/net/dsa/qca/qca8k-persistent-lifecycle.inc
> @@ -0,0 +1,394 @@
[ ... ]
> +static void qca8k_persistent_remove(struct qca8k_priv *priv)
> +{
> +	int completed;
> +
> +	rtnl_lock();
> +	qca8k_persistent_unwind(priv, 0);
> +	rtnl_unlock();
> +	dsa_unregister_switch(priv->ds);
> +	rtnl_lock();
> +	completed =3D qca8k_persistent_detach_complete(priv);
> +	if (completed)
> +		qca8k_persistent_note_fault(priv, completed);
> +	rtnl_unlock();
> +}

[Severity: Low]
Can qca8k_persistent_remove() log and latch a false -EBUSY fault if the
switch is removed before qca8k_persistent_boot_start() sets
priv->persistent_setup_started?

Unlike qca8k_persistent_unwind() and qca8k_persistent_register_complete(),
qca8k_persistent_remove() does not check priv->persistent_setup_started
before calling qca8k_persistent_detach_complete().  If qca8k_setup() never
ran or failed in qca8k_persistent_profile(), qca8k_persistent_unwind()
returns early, leaving qca8k_persistent_can_release() false, so
qca8k_persistent_detach_complete() returns -EBUSY and triggers
qca8k_persistent_note_fault().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-almondplus=
-offload-rfc-v1-0-703175c6340c@gmail.com?part=3D5
