Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807C831B10B
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 22:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786659009; cv=none; b=dHcY4NkEyWuUX8yM7d+7NAnZoUX/yAqR9CwFrTrPZq0oH2MFRbjer3FebqF8nw3cGib2dKwFXAJxq+B5+QlYOGBh0agPxCuFZeQXQuNPEnjv9xbbbpkyudVXjglt6DBAYhGOZ6JpXQEJibbjXdRuNG0DbLDwflDSuQSrNqtB31I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786659009; c=relaxed/simple;
	bh=79D0SAYb6RXIOuHQ109gsQGkGERX0xKPvIT/J4jAiCI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K53/u3O0G8mA4h7nZlJYmeazvjvXtzrGzN1+APg/0Y+04IU9rjfKV3U8xZkT/XnD/TtjH58b6tMqpBZ+igzhZHC+TIqLyL54XVLnrYm/YkA6DRy3jIgsfO9Je6Zyup6mXhkFlVslAUs0qiEJeJeucGijahRntoR8WgXtJvtoy60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flThoROj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flThoROj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101C01F000E9;
	Thu, 13 Aug 2026 22:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786659008;
	bh=79D0SAYb6RXIOuHQ109gsQGkGERX0xKPvIT/J4jAiCI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=flThoROj92BF1VsUT2BqbG3FmntSdwGL6+XyKs3LAbxo1syJNLB/U29J+BRdxtDs9
	 hp3j9DjlsxM9MCGxOaUlvdhO+JWRaLwGmqyoj7dObnwJDvv/swIsml8amKMottC46M
	 LTTawqjLOCGiLrJnKBBaezhr4/XKMmPib0yei2FsH3wnXB8De+N2Bwdge+1w7ZolvR
	 KFg+04XOWxWMiMzfDygsXhIMYb/QB6EjKhkMuRpTOz4TCJPN0CuhSxIP2bFtPXqZ7A
	 zOGbhnJ34Tu7H+k/tNprdTB9ek0vIkhLT77PCLVi1ZbLqzcf7tVE8ER5nNzx+WYjKs
	 oUCdeSp4ohLHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/6] firmware: mediatek: Add VCP IPC protocol
 interfaces driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xiangzhi Tang" <xiangzhi.tang@mediatek.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260320032014.13608-4-xiangzhi.tang@mediatek.com>
References: <20260320032014.13608-4-xiangzhi.tang@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 22:10:04 +0000
Message-Id: <20260813221005.101C01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] Concurrent messages on different IPI channels sharing the same mai=
lbox will silently corrupt shared metadata.
- [High] Missing unregister API permanently leaks ipi_chan_table and causes=
 a dangling pointer.
- [High] Missing `reinit_completion()` allows late interrupts to falsely co=
mplete subsequent requests.
- [High] Assigning -ENOENT to the u32 mbox index causes a massive out-of-bo=
unds array access.
- [High] Comparing payload length in bytes directly with slot capacity inco=
rrectly rejects valid messages.
- [High] Lack of synchronization in `mtk_vcp_mbox_ipc_unregister` causes a =
NULL pointer dereference race with the receive handler.
- [High] `mtk_vcp_ipc_recv` dereferences `vcp_ipc->ipi_priv` before it is i=
nitialized.
- [Medium] Error path for `setup_mbox_table()` leaks memory and mailbox cha=
nnels.
- [Medium] Spurious completions due to checking an uninitialized field (`ta=
ble->recv_opt`).
- [Medium] Exported APIs use user-supplied IDs as array indices without bou=
nds checking.
--

--- Patch [3]: [PATCH v3 3/6] firmware: mediatek: Add VCP IPC protocol inte=
rfaces driver ---
Note: The format of this review has been altered due to recitation restrict=
ions. I am providing a free-form summary of the findings without directly q=
uoting the original patch code.

commit f8da7c9eaf7b9e57116dc5cb1b79d9e5e51adfc9
Author: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
Subject: firmware: mediatek: Add VCP IPC protocol interfaces driver

This patch adds support for the MediaTek VCP IPC between the host AP and th=
e firmware running on the VCP. It offers send and receive interfaces using =
mediatek-mailbox APIs.

[Severity: High]
In mtk_vcp_ipc_send() and mtk_vcp_ipc_send_compl(), the code acquires a
per-channel lock (table[id].mutex_send) but then modifies the shared
per-mailbox state (minfo->ipi_info.msg). If multiple threads send messages
concurrently on different IPI channels mapped to the same mailbox, won't
this overwrite the shared message metadata? Since the mailbox framework
queues this asynchronously, this might lead to corrupted or duplicated
payloads being sent.

[Severity: High]
The mtk_vcp_ipc_device_register() function allocates ipi_chan_table and
sets the global vcp_ipc->ipi_priv pointer, but there doesn't seem to be a
corresponding unregister function. If the client device module unbinds or
is unloaded, doesn't this permanently leak the allocated table and leave a
dangling pointer in vcp_ipc->ipi_priv that will crash on the next mailbox
interrupt?

[Severity: High]
In mtk_vcp_ipc_send_compl(), wait_for_completion_timeout() is used on
table[id].notify. However, reinit_completion() is never called before
starting a new request. If a previous request times out and the hardware
interrupt fires late (calling complete()), won't the next call to
mtk_vcp_ipc_send_compl() immediately consume the stale token and return
success prematurely?

[Severity: High]
In mtk_fill_in_entry(), the u32 mbox index is assigned -ENOENT if an IPI
mapping is missing. This underflows to a massive unsigned value. Later in
mtk_vcp_ipc_send(), this index is used to look up minfo:
minfo =3D &ipidev->vcp_ipc->info_table[table[id].mbox].

Because this simply computes an out-of-bounds pointer, the subsequent NULL
check (!minfo) will pass. Will this cause arbitrary memory corruption when
the driver writes to minfo->ipi_info?

[Severity: High]
In mtk_vcp_ipc_send(), the caller-provided length (len) is compared directly
against table[id].msg_size. However, the receive path shows that msg_size
represents the number of 4-byte slots, whereas len is in bytes. If a client
sends an 8-byte message on a 2-slot channel, won't 8 > 2 evaluate to true
and incorrectly reject the valid message with IPI_MSG_TOO_BIG?

[Severity: Medium]
In mtk_vcp_ipc_probe(), if setup_mbox_table() returns an error for any
channel other than the first one, the function immediately returns the error
code. Does this error path leak the previously allocated info_table memory
and fail to release the previously acquired mailbox channels using
mbox_free_channel()?

[Severity: Medium]
In mtk_vcp_ipc_recv(), there is a check comparing table->recv_opt to
MBOX_RECV_MESSAGE. However, recv_opt doesn't appear to be populated from
the platform data during mtk_fill_in_entry(), leaving it initialized as 0
(MBOX_RECV_MESSAGE). Won't this condition always evaluate to true, falsely
triggering a complete() for every received message even if it is meant to
be ignored?

[Severity: High]
In mtk_vcp_mbox_ipc_unregister(), table[id].pin_buf is set to NULL without
any locking. Concurrently, an interrupt might fire and enter
mtk_vcp_ipc_recv(). If the receive handler passes the NULL check but the
unregister thread clears the pointer right before the memcpy executes,
could this cause a NULL pointer dereference or a use-after-free if the
client frees the buffer?

[Severity: High]
During mtk_vcp_ipc_probe(), mbox_request_channel_byname() is called, which
registers mtk_vcp_ipc_recv and enables interrupts. But vcp_ipc->ipi_priv
is only initialized later during client registration. If a pending message
or spurious interrupt triggers the handler early, won't mtk_vcp_ipc_recv()
dereference a NULL ipidev pointer and panic the kernel?

[Severity: Medium]
Exported APIs like mtk_vcp_ipc_send() and mtk_vcp_mbox_ipc_register() take
an id parameter from the caller and directly use it to index ipidev->table
without any bounds checking. Since ipi_chan_count is not saved during
registration, bounds validation isn't currently possible. Can a bad ID=20
passed from a client module silently corrupt adjacent heap memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260320032014.1360=
8-1-xiangzhi.tang@mediatek.com?part=3D3
