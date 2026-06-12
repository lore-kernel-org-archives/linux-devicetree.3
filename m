Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61D23A3E76
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 22:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781304785; cv=none; b=vBZnrnur6bMT8slMu8QUvzbqlvlRKvGbpBw7HHQfQvVEoaifviHfw9DymLlbnbiXNnpE0NPUokag/Y2o2v2NeG5+ft46tl6goLqttyJOzS7hApnvuF82h5KN85Dli4oOFoO1KlgV9WmODM8wL/5q1LLxkQ7toPq8Zk5fXGxSC6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781304785; c=relaxed/simple;
	bh=8xRodfgBzSKdpOj3EtCbpPdnlo6AjQS6X6ftQMuviBU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c5d9RzX4ep1FskjTXjnRyXX7ED3PRZtYr0U9w085dh1R1sNc7PRNbXbjBCMV342UHGwtLHIv5uIHqk1eKYiGqYnumFAg3bssIEAnnAn9LGPbgytmFpqbv1KHGQLpDGHgApjFYpeV+WVHoiiTtp4K5ukf3SgarNvps1KniT0aEjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ab8lbcpM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ab8lbcpM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D541F00A3A;
	Fri, 12 Jun 2026 22:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781304784;
	bh=l+iPF5ssyzaHDv1NALzOsUib8JJgN1MFVRa7Z1Xs4+M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ab8lbcpMf3lJxInRE8aKZgrrcCXeye3FvvLj8AlJOqIP6crLOGpvU/iuhmEfEUENL
	 2cIptHk51yM8MKNm43N1ryuLDCepoE1AbUDbsLgQp9vrjav+m70yXxQa1Avpcn5AtZ
	 bZOmOJkTY6oN/gaP9IxXC2jlw8g5OJf2T80kIOy9ilK4Pvw4LTn0Ky49wFDdN7I6Qj
	 W34DTxu3tGL9RC3eHHIq/2RIC9HOW6aYjYZAzeUsgADyy+0meqkZLbpllPXi/qQMgU
	 4Mndk064dl2wSdMR9Kf8YRzAzMltMwjmzyHDofiR5vbbf6arVyMGpCnmMBUm0VQlhY
	 /5Moq8vFsI6Kg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/31] dt-bindings: firmware: arm,scmi: Add support
 for telemetry protocol
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Marussi" <cristian.marussi@arm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260612223802.1337232-7-cristian.marussi@arm.com>
References: <20260612223802.1337232-7-cristian.marussi@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 22:53:04 +0000
Message-Id: <20260612225304.75D541F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] A race condition in `scmi_protocol_release()` against `scmi_ge=
t_protocol_instance()` leads to a Use-After-Free of the protocol instance.
- [High] Concurrent requests for the same uninitialized protocol will fail =
instead of waiting for initialization.
- [Medium] Using `_IOWR` ioctl macros with structures containing flexible a=
rray members truncates the encoded payload size.
--

commit c0ccec86311b387c10216dd1ee33220fb6d9c890
Author: Cristian Marussi <cristian.marussi@arm.com>

dt-bindings: firmware: arm,scmi: Add support for telemetry protocol

Add new SCMI v4.0 Telemetry protocol bindings definitions.

> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_sc=
mi/driver.c
> index f167194f7cf67..9c1ab9925b1d7 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c

[ ... ]

> @@ -2284,27 +2298,25 @@ scmi_alloc_init_protocol_instance(struct scmi_inf=
o *info,
>  static struct scmi_protocol_instance * __must_check
>  scmi_get_protocol_instance(const struct scmi_handle *handle, u8 protocol=
_id)
>  {
> -	struct scmi_protocol_instance *pi;
>  	struct scmi_info *info =3D handle_to_scmi_info(handle);
> +	const struct scmi_protocol *proto;
> =20
> -	mutex_lock(&info->protocols_mtx);
> -	pi =3D idr_find(&info->protocols, protocol_id);
> +	scoped_guard(mutex, &info->protocols_mtx) {
> +		struct scmi_protocol_instance *pi;
> =20
> -	if (pi) {
> -		refcount_inc(&pi->users);
> -	} else {
> -		const struct scmi_protocol *proto;
> -
> -		/* Fails if protocol not registered on bus */
> -		proto =3D scmi_protocol_get(protocol_id, &info->version);
> -		if (proto)
> -			pi =3D scmi_alloc_init_protocol_instance(info, proto);
> -		else
> -			pi =3D ERR_PTR(-EPROBE_DEFER);
> +		pi =3D idr_find(&info->protocols, protocol_id);
> +		if (pi) {
> +			refcount_inc(&pi->users);
> +			return pi;
> +		}
>  	}
> -	mutex_unlock(&info->protocols_mtx);
> =20
> -	return pi;
> +	/* Fails if protocol not registered on bus */
> +	proto =3D scmi_protocol_get(protocol_id, &info->version);
> +	if (!proto)
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	return scmi_alloc_init_protocol_instance(info, proto);
>  }

[Severity: High]
What happens if two threads concurrently request the same uninitialized
protocol?

Since the mutex is dropped after failing to find the protocol, both threads
would independently call scmi_alloc_init_protocol_instance() and initialize
a new protocol instance. The first thread will successfully call idr_alloc(=
),
while the second thread's idr_alloc() for the same ID will fail with -ENOSP=
C.

Would this regression cause the second thread to tear down its allocation a=
nd
return an error, leading to a spurious fatal probe failure for concurrent
devices instead of waiting and reusing the initialized instance?

[ ... ]

> @@ -2335,10 +2347,11 @@ void scmi_protocol_release(const struct scmi_hand=
le *handle, u8 protocol_id)
>  	struct scmi_info *info =3D handle_to_scmi_info(handle);
>  	struct scmi_protocol_instance *pi;
> =20
> -	mutex_lock(&info->protocols_mtx);
> -	pi =3D idr_find(&info->protocols, protocol_id);
> -	if (WARN_ON(!pi))
> -		goto out;
> +	scoped_guard(mutex, &info->protocols_mtx) {
> +		pi =3D idr_find(&info->protocols, protocol_id);
> +		if (WARN_ON(!pi))
> +			return;
> +	}
> =20
>  	if (refcount_dec_and_test(&pi->users)) {

[Severity: Critical]
Could dropping the protocols_mtx lock before calling refcount_dec_and_test()
introduce a use-after-free regression?

If thread 1 reaches this point and is about to drop the refcount to 0,
another thread calling scmi_get_protocol_instance() might acquire the lock,
find the same instance in the IDR, and call refcount_inc(&pi->users) on it
while its refcount is zero.

Once thread 1 re-acquires the lock to remove the instance via idr_remove()
and frees it, thread 2 would be left with a dangling pointer.

[ ... ]

> diff --git a/include/uapi/linux/scmi.h b/include/uapi/linux/scmi.h
> new file mode 100644
> index 0000000000000..abf68bb999606
> --- /dev/null
> +++ b/include/uapi/linux/scmi.h

[ ... ]

> +struct scmi_tlm_intervals {
> +	__u8 discrete;
> +	__u8 pad[3];
> +	__u32 num_intervals;
> +#define SCMI_TLM_UPDATE_INTVL_SEGMENT_LOW	0
> +#define SCMI_TLM_UPDATE_INTVL_SEGMENT_HIGH	1
> +#define SCMI_TLM_UPDATE_INTVL_SEGMENT_STEP	2
> +	__u32 update_intervals[] __counted_by(num_intervals);
> +};

[ ... ]

> +#define SCMI_TLM_GET_INTRVS	_IOWR(SCMI, 0x03, struct scmi_tlm_intervals)
> +#define SCMI_TLM_GET_DE_CFG	_IOWR(SCMI, 0x04, struct scmi_tlm_de_config)
> +#define SCMI_TLM_SET_DE_CFG	_IOWR(SCMI, 0x05, struct scmi_tlm_de_config)
> +#define SCMI_TLM_GET_DE_INFO	_IOWR(SCMI, 0x06, struct scmi_tlm_de_info)
> +#define SCMI_TLM_GET_DE_LIST	_IOWR(SCMI, 0x07, struct scmi_tlm_des_list)
> +#define SCMI_TLM_GET_DE_VALUE	_IOWR(SCMI, 0x08, struct scmi_tlm_de_sampl=
e)
> +#define SCMI_TLM_SET_ALL_CFG	_IOW(SCMI,  0x09, struct scmi_tlm_de_config)
> +#define SCMI_TLM_GET_GRP_LIST	_IOWR(SCMI, 0x0A, struct scmi_tlm_grps_lis=
t)
> +#define SCMI_TLM_GET_GRP_INFO	_IOR(SCMI,  0x0B, struct scmi_tlm_grp_info)
> +#define SCMI_TLM_GET_GRP_DESC	_IOWR(SCMI, 0x0C, struct scmi_tlm_grp_desc)
> +#define SCMI_TLM_SINGLE_SAMPLE	_IOWR(SCMI, 0x0D, struct scmi_tlm_data_re=
ad)
> +#define SCMI_TLM_BULK_READ	_IOWR(SCMI, 0x0E, struct scmi_tlm_data_read)

[Severity: Medium]
Does using the _IOWR() macro with structures containing flexible array
members cause regressions with payload size encoding?

The _IOWR() macro computes the copy size using sizeof(type), which only
covers the fixed header bytes and ignores the flexible array elements (like
update_intervals in struct scmi_tlm_intervals). This embeds an artificially
small size into the IOCTL command number.

While the native kernel driver handles memory boundaries explicitly via
copy_from_user lengths, standard system call tracers like strace and
emulators like QEMU user-mode emulation rely on the _IOC_SIZE() macro
embedded in the IOCTL definition to identify the memory payload size. Will
this result in truncating the array copy and causing emulation faults for
IOCTLs like SCMI_TLM_GET_INTRVS, SCMI_TLM_GET_DE_LIST,
SCMI_TLM_SINGLE_SAMPLE, and SCMI_TLM_BULK_READ?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612223802.1337=
232-1-cristian.marussi@arm.com?part=3D6
