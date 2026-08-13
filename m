Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AA23A7F7E
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 21:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786657691; cv=none; b=aUJ206N8mZf0l6+2L+TLPJtIT3iJUwAoZuCg2SH1RsXOxbBCD7hzr0EnHawrKqeWINT3yJwlEIzzTXs+d0WwwHdUgkNgyG06tTmAVqYOR5iNSLy4JWjZ0b8N0Hscj2nAZ+VGUCqM2CM8TTY52RbFpY+nFSWZN6B9lvppMTjMG0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786657691; c=relaxed/simple;
	bh=qtlHAtfL5VII2SpRRKp1bWW8L0LWcPmFeXUHHDRpdSA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DBCgGQQDTMPd1HgJ4hnwTfev1mzmrp+g3DHemqvFLfn82HOPvH77YxDFwvFz9zEUTsPxjP+eKGXC23AeXKjqsVRksqNPSCBrvX1yvqbuZNYoK1yuAh23Rlt9l2ALUSrnUTX9p6TUC2iQX/AVKjkODABcCU+JNWnViRmeGJBuj6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZHeryxNz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHeryxNz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F191F000E9;
	Thu, 13 Aug 2026 21:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786657690;
	bh=qtlHAtfL5VII2SpRRKp1bWW8L0LWcPmFeXUHHDRpdSA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZHeryxNzpANv4yGwB/vGWbvcxwIdO79c1+koDM4zVuBEXmqqT+RkiMqpIwqpicw3F
	 gdGmJsC/v7EEKcl9SB+R73qaJNtDPGPjqIlnxXfkQ10L8FR3IYDLGkAKSd/bdW8qb1
	 FtqTvHm2KNaaWOk79Em1JZIDuoVbORnDRe5Tj5tC2kfUnHnP4c7BWkhFAbsWrh701R
	 I/TbV5cwwRVlFzBzy/R1nbH+TGRiKN517wkU5KrZ9NNfYC/goAZxOXOxDYDedqiyti
	 U5tE914oox8BQQFi04EGOMaZz4qmqR1QyhRyVQ4lKxQe2WI4VnfxD1w5vxBO4oZAkV
	 9EIMMiceGj/og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] tcpm: Implement sink support for PD SPR AVS
 negotiation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Badhri Jagan Sridharan" <badhri@google.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260316150301.3892223-4-badhri@google.com>
References: <20260316150301.3892223-4-badhri@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 21:48:09 +0000
Message-Id: <20260813214810.34F191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] SPR AVS current requests are rounded UP and mutated in-place, whic=
h causes valid maximum boundary values to be rejected and permanently corru=
pts the port state.
- [High] The requested operating current and voltage for AVS are never vali=
dated against the sink's minimum operating power requirement (`operating_sn=
k_mw`).
- [High] Activating SPR AVS fails deterministically if the current Fixed PD=
O voltage is below 9V, rendering the feature unusable.
- [High] Unprotected lockless checks of `active` flags in sysfs setters cau=
se TOCTOU races, potentially activating both PPS and AVS simultaneously.
- [Medium] Incorrect VBUS discharge threshold configuration for SPR AVS due=
 to false `pps_active` flag and hardcoded 0V minimum.
- [Medium] `port->spr_avs_data.port_snk_status` is not reset to `SPR_AVS_UN=
KNOWN` when capabilities are updated, leading to the use of stale SPR AVS c=
apabilities.
--

--- Patch [3]: [PATCH v2 3/3] tcpm: Implement sink support for PD SPR AVS n=
egotiation ---
Note: The format of this review has been altered to a free-form summary
without direct patch quoting due to code recitation restrictions.

commit dc9649cdbdf898247e40b664f584f8ccfa0a601b
Author: Badhri Jagan Sridharan <badhri@google.com>
Subject: tcpm: Implement sink support for PD SPR AVS negotiation

This patch adds support to enable TCPM to negotiate with USB PD Standard
Power Range Adjustable Voltage Supply (SPR AVS) when acting as a power sink.

[Severity: Medium]
In drivers/usb/typec/tcpm/tcpm.c:run_state_machine() during the
SNK_TRANSITION_SINK state, the code calls
tcpm_set_auto_vbus_discharge_threshold() passing port->pps_data.active as
the pps_active argument.

Since pps_data.active is false during an SPR AVS contract, doesn't this
result in applying a fixed voltage threshold instead of an adjustable one?
Also, in tcpm_set_auto_vbus_discharge_threshold(), the minimum voltage is
hardcoded to port->pps_data.min_volt (0V) instead of the AVS Tier 1 minimum
of 9V.

[Severity: High]
In drivers/usb/typec/tcpm/tcpm.c:tcpm_pd_select_spr_avs_apdo(), the
requested current req_op_curr_ma is rounded up to the nearest 50mA step
and written directly back to port->spr_avs_data.req_op_curr_ma.

Immediately after, this rounded value is checked against src_max_curr_ma
and snk_max_curr_ma. If a valid max current request (like 2260mA) is
rounded up (to 2300mA), it will exceed the maximum and return -EINVAL,
effectively rejecting valid boundary values.

Since it overwrites the state, does this also permanently corrupt the port
state for subsequent AVS requests?

[Severity: High]
In drivers/usb/typec/tcpm/tcpm.c, both tcpm_aug_set_op_curr() and
tcpm_aug_set_out_volt() perform a validation check ensuring target_mw is
not less than port->operating_snk_mw.

However, this check is placed entirely inside the PPS branch, leaving the
SPR AVS branch unchecked. Similarly, tcpm_pd_build_spr_avs_request() only
sets the RDO_CAP_MISMATCH flag but does not adjust the requested voltage or
current to meet the sink's minimum power like tcpm_pd_build_pps_request()
does.

Could this allow an AVS contract that provides less power than the system
needs to operate?

[Severity: High]
In drivers/usb/typec/tcpm/tcpm.c:tcpm_spr_avs_activate(), when activate is
true, port->spr_avs_data.req_out_volt_mv is initialized to
port->supply_voltage.

If the active fixed PDO is 5V, the request is set to 5000mV. The state
machine then calls tcpm_pd_select_spr_avs_apdo(), which strictly bounds
checks against SPR_AVS_TIER1_MIN_VOLT_MV (9000mV).

Will this cause SPR AVS activation to deterministically fail if the current
supply voltage is below 9V?

[Severity: Medium]
In drivers/usb/typec/tcpm/tcpm.c:tcpm_pd_select_pdo(),
port->pps_data.supported is reset to false before evaluating new
capabilities.

However, port->spr_avs_data.port_snk_status is not reset to
SPR_AVS_UNKNOWN.

If sink capabilities are updated and the new capabilities lack an AVS APDO,
wouldn't port_snk_status remain SPR_AVS_SUPPORTED with a stale
port_snk_pdo_index, causing tcpm_pd_select_spr_avs_apdo() to read invalid
capability data later?

[Severity: High]
In drivers/usb/typec/tcpm/tcpm.c:tcpm_psy_set_online() and
tcpm_disable_pps_avs(), the flags port->spr_avs_data.active and
port->pps_data.active are evaluated without holding port->lock.

If a sysfs write races with a state machine update that sets one of these
flags, could these lockless checks read stale data and allow both PPS and
AVS to be incorrectly activated simultaneously?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260316150301.3892=
223-1-badhri@google.com?part=3D3
