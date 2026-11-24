Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795558208;
	b=kCJDd76kEHXoms3KBkQlQkal2EA90B2aY/i19z0U01hPz8KLC07ILT7aw3eg32L2AIql
	 FUl1Ox1mbAHt8eM8fgttVZAj1La3W7H+KEmj+Rre1CmHOhZoBDvdo47YWPn/Ll4IHDFaa
	 VfRiqMdmUi5OznlTyGJKWYMhnv+C4HJY545hQECFiZxtWAvixT642RGpVjZLbqoTAV/Nv
	 pBPPPO4x3+MXVoRsLpdFgEd+D9XtGUj3AkqYyzV71IC9AfQ+hQGRj2wocp+3DkJqH0A6O
	 7Su4I6h8Z/ubY83gqzNrDL3NbuQFN6jkv1bI8FHaAGV/e4Eo23mMDX8ati4K9DcVeGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558208;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6dmOP6aQ6aqkfzJN8FKFivLq7QwU/1I8ZYZIqVNe2vE=;
	b=XFdBbSkiyYAmFl+1qc41D/j3v32mkW8QQD7V1UuwfZwJXRhJIZf+Fe22LG8+wchb6/zu
	 gVBogT+kaUXrD98ctYYAZgvE1bhfqgjAhEsKHTu2OgFLpXzKQ9wKwZiNvCbr+H/MQKypP
	 v7UkKvgDDve3NFGW2f6YPWL2AqoptrQ37UZdC741Idlg5kQBVHgTMlWVBIPUf4FNRtYFU
	 3DBj+2yNwwRVmuSq4PIAnNDiTu4xkKe4MiaxapFRUBf4w3ILVXuRc3X3jLgzK7rbA2cjd
	 43PZ5Hq7Y5sLiE4XJ+xQfvOOaK3Vv+MAM8OIHT38liSl4tYtf6aGH1bc5xrJc4DudjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dl8qm5l1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F9F606A329;
	Tue, 24 Nov 2026 22:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dl8qm5l1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795558207;
	b=Na79PzDphFEKa4oOb68Qhr2YF9f7gMNISY5oVvuH8wcz6XIkkZ1UD9tXMEBjqIViED2s
	 WL9pej9Fju/LdQWcODfhDrYgtWwEq/vp0U5HLk2rbiRJiDckm9BVYBsakMTWpcrvOXRkw
	 O0ZsNhVZNlKJOfZ6TmJuboTGZVeFltxRMkT3Md37w1oUadYpcwxIkNngzrjcR67S86ZJL
	 tgwKE+36GW9HN+Wmh32UV3959lerDuspyYYETGEIYCpsj7Ck1vdzgBJ3xNNVbF9KXgCwy
	 RmFTjVCjkjyoF8MPASn0NjuuxSW0iwBc+tGiRV6NhUk8+y4RspGW34XfHuyipg5BbeQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795558207;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6dmOP6aQ6aqkfzJN8FKFivLq7QwU/1I8ZYZIqVNe2vE=;
	b=lWujGYIn1yhzMEHXNFls0kgCnUkRP030rCaidSs1ZR23RZqLqUVwWJnz8qneSCBiOWku
	 GfCS39jquJXf0iPPHo0p4kPxMPOIBtpZrasslgnfhf4iWJm1vQAtRzv6NGEaETbXizamM
	 liNpdBuGQTcqvK3+aOkx3qf2+PTlhlgtZMmWLI/nmY62+LEMWBLJx1Z5iw7DLozun/3Zv
	 LDZ4WhHhn4ifs22fuh6f3qyWaT8Hp0DYPMLTf47u2+JgVyIqXREE0EavNUQCCdUpiDUzs
	 LGl62HN4zOLarzDR1DwiTCBSHVjD9oLf2h/w1Flb8bzacHhNbjBXieRxip+xiQP+TIw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32CD81F000D1;
	Tue, 24 Nov 2026 22:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795558207;
	bh=6dmOP6aQ6aqkfzJN8FKFivLq7QwU/1I8ZYZIqVNe2vE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=dl8qm5l1XIEa8HMyaT8ydnMIKCBYS3umbFUPp4eZSvGLJIObId4TfWL3WGnX3LF2T
	 Pb1HhZNTstCBg7rrdRgYCsI24Y+AtT7DKB8suxle15TUpbAvK2EkU0ipVPDsIOiUQq
	 meHWI5BDw7utmQxvnx3JTzBMCUXyh19e1J/LT8BrveBYdJ6Q4ZbkDGPJ9khpReuLEd
	 e/gCn85736jIDgRnQvEhAAS+xNkkgMKwAs8DoUkn/gb1RCffFpnSoXPRFTOq7jWEFH
	 /DeDl8fFluDBtfHyEZzZ9Z90m9V+akEwY7m2SmmN5ZVJDh9YL77A1Pi3xrKK6Cvrvr
	 WNUioCtYWJxZQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B758A4CBCA;
	Tue, 24 Nov 2026 22:09:56 +0000 (UTC)
From: Selvamani Rajagopal via B4 Relay <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Date: Tue, 24 Nov 2026 14:09:50 -0800
Subject: [PATCH net-next v12 02/15] Documentation: networking: Add
 timestamp related APIs to OA TC6 framework
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-s2500-mac-phy-support-v12-2-3575855d99f9@onsemi.com>
References: <20261124-s2500-mac-phy-support-v12-0-3575855d99f9@onsemi.com>
In-Reply-To: <20261124-s2500-mac-phy-support-v12-0-3575855d99f9@onsemi.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
 Selva Rajagopal <selvamani.rajagopal@onsemi.com>, 
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Eric Dumazet <edumazet@kernel.org>, 
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Jerry Ray <jerry.ray@microchip.com>, 
 Ciprian Regus <ciprian.regus@analog.com>, 
 Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795558193; l=5833;
 i=Selvamani.Rajagopal@onsemi.com; s=20260531; h=from:subject:message-id;
 bh=e1D6w+f4ICdcIKoxkxfKUPKsEbTykb38slj0b2WqgHM=;
 b=cwaJZXaWuvCMlHNJzofacuUvmYVqlMiZjvVxM2w4Wpwqigg0B58lyr+d2v3HrGMe6DjQz4HZc
 EOgLCFv9d8VCryRvyyrpk07u1SLf21JspCsyXU6OifmDB8HkCljcC5B
X-Developer-Key: i=Selvamani.Rajagopal@onsemi.com; a=ed25519;
 pk=5QRdM0HS/LGWWcUZZ9hVfZ+qbPQGZCumcTXOiN7Fyug=
X-Endpoint-Received: by B4 Relay for
 Selvamani.Rajagopal@onsemi.com/20260531 with auth_id=803
X-Original-From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
Reply-To: Selvamani.Rajagopal@onsemi.com
Content-Transfer-Encoding: 7bit

From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

Add new APIs to support hardware timestamp feature as defined in
OPEN Alliance 10BASE-T1x MAC-PHY serial interface specification.

Add the newer read/write APIs that take MMS as one of its parameters
as these were not documented so far.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

---
changes in v12
  - Updated rx_filter behavior and return codes for oa_tc6_hwtstamp_set()
changes in v11
  - Changed the wording of timestamp support to make it more clear
changes in v10
  - Added new API oa_tc6_tx_credit_threshold_set
  - Vendor introduced APIs to vendor support patch
changes in v9
  - Added Reviewed tag
changes in v8
  - Updated the order of the parameters in oa_tc6_read_register_mms
    and oa_tc6_write_register_mms apis.
  - Removed the reference to ioctl
changes in v7
  - No change
changes in v6
  - No change
changes in v5
  - Fixed "no blank line" issues in four places
changes in v4
  - Added information for new APIs in OA TC6 framework
changes in v3
  - Added more information for documentation
changes in v2
  - Removed the changes to the existing API
  - Updated information about newly added APIs
changes in v1
  - Added changes to an existing API
  - Added documentation to new hardware timestamp related APIs
---
 Documentation/networking/oa-tc6-framework.rst | 76 +++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/Documentation/networking/oa-tc6-framework.rst b/Documentation/networking/oa-tc6-framework.rst
index 2545ef694016..2df8455bf3ba 100644
--- a/Documentation/networking/oa-tc6-framework.rst
+++ b/Documentation/networking/oa-tc6-framework.rst
@@ -153,6 +153,13 @@ OPEN Alliance TC6 Framework
 - Forwards the received Ethernet frame from 10Base-T1x MAC-PHY to n/w
   subsystem.
 
+- If supported and enabled, timestamps are stored in the skb. Transmit
+  timestamps are requested via the TSC header field and read from
+  timestamp capture register A, B or C. If the next capture register is busy,
+  the frame is transmitted without requesting a timestamp and the TX
+  timestamp error counter is incremented. Receive timestamps are
+  prepended to the frame when the RTSA footer bit is set.
+
 Data Transaction
 ~~~~~~~~~~~~~~~~
 
@@ -496,3 +503,72 @@ the MAC-PHY.
 Zero align receive frame feature can be enabled to align all receive ethernet
 frames data to start at the beginning of any receive data chunk payload with a
 start word offset (SWO) of zero.
+
+.. c:function:: int oa_tc6_ptp_register(struct oa_tc6 *tc6, \
+                                        struct ptp_clock_info *info)
+
+Registers the PTP hardware clock (PHC) with the kernel. Returns 0 immediately
+when the MAC-PHY does not support hardware timestamp. Otherwise it sets the
+name field of ptp_clock_info and registers the clock. Initialization of the
+other fields in the ptp_clock_info structure is left to the vendor as the
+PHC registers and their programming are vendor specific. The fields max_adj,
+owner, and all the functions for the clock operations, like adjfine,
+gettimex64, settime64, adjtime are expected to be initialized in the
+structure before registering the hardware clock.
+
+.. c:function:: void oa_tc6_ptp_unregister(struct oa_tc6 *tc6)
+
+Unregisters the PTP hardware clock.
+
+.. c:function:: int oa_tc6_get_ts_info(struct oa_tc6 *tc6, \
+                                       struct kernel_ethtool_ts_info *info)
+
+Reports the hardware timestamping capabilities and PHC index in info when
+a PTP hardware clock is registered. Otherwise, info is left unchanged.
+Returns 0 (success) in both cases.
+
+.. c:function:: void oa_tc6_hwtstamp_get(struct oa_tc6 *tc6, \
+                                         struct kernel_hwtstamp_config *cfg)
+
+Returns hardware timestamp configuration. Part of net_device_ops callbacks.
+
+.. c:function:: void oa_tc6_get_ts_stats(struct oa_tc6 *tc6, \
+                                         struct ethtool_ts_stats *stats)
+
+Provides hardware timestamp related traffic statistics for ethtool.
+An unexpected TX capture for a frame still being transferred counts as a
+timestamp error, not a lost timestamp. A request abandoned after its frame
+was transmitted, without a capture, counts as lost; a late TTSC event for
+that request does not count as an error.
+
+.. c:function:: int oa_tc6_hwtstamp_set(struct oa_tc6 *tc6, \
+                                        struct kernel_hwtstamp_config *cfg)
+
+Helper to set hardware timestamp configuration. Part of net_device_ops
+callbacks.
+
+The MAC-PHY timestamps all received frames, so any rx_filter other than
+HWTSTAMP_FILTER_NONE, or tx_type HWTSTAMP_TX_ON, results in
+HWTSTAMP_FILTER_ALL. The rx_filter field of cfg is updated with the
+filter that was programmed.
+
+Returns 0 on success, otherwise:
+
+- -EOPNOTSUPP: no PTP hardware clock is registered.
+- -EIO: the interface is down, or the framework has stopped handling
+  traffic after an error.
+- -ERANGE: tx_type or rx_filter is not supported.
+- -ETIMEDOUT: the request was not picked up within 100 ms.
+- A negative error code from the register access.
+
+.. c:function:: int oa_tc6_write_register_mms(struct oa_tc6 *tc6, \
+                                              u8 mms, u16 address, \
+                                              u32 value)
+
+Write a single register addressed by @mms and @address in the MAC-PHY.
+
+.. c:function:: int oa_tc6_read_register_mms(struct oa_tc6 *tc6, \
+                                             u8 mms, u16 address, \
+                                             u32 *value)
+
+Read a single register addressed by @mms and @address in the MAC-PHY.

-- 
2.43.0


