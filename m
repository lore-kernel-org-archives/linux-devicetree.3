Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C414E3242
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 14:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791557534; cv=none; b=YeTxuBMcNNpB+Eb22irZ0RuskkhvFgrGSR69KbKYypPJzpAQHd8ilxGeCstKF7/erWKRnvs5QAdS8uGyXGJiCN1kO3n5HNHLgL8fnvbHaosRe3gz0DKpkQPODR0VW7s1/brKVbZwmQ4D1trwLdPpq35oeuvKNqIAMtYydUownzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791557534; c=relaxed/simple;
	bh=kjkOibQQtlwp5EKG1aNjfyMKQ5UtdSHywhkHqv/xiAk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=A9tZ/7dhMFrg9m25xTpLNMaCYKXe9rbVyHxr3kmpY9di54Ehi5wbFZlTwf5/KcO3kPWt6I+80A3JBRBpvR2vQ+VzTgBGSUoI4+RUH7b30Zh3PgRctVK73FtlW4xkZuPi7viHzaxvLHcCUkBza8BDoHo0Qi4wzLX9euyVhXe6tEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N4ayLtPf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N4ayLtPf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2204B1F00899;
	Fri,  9 Oct 2026 14:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791557533;
	bh=AFC5/t/T6JL+5wP1rU0nl1IXSSmC/JLU9B9BMjEDi9E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N4ayLtPfiBq6i4dopR/dEiVRNIinbP+E3lnLD9JcFuZH4aWEc+9OaWUb+8NcZE+iK
	 0f0M5R7iybZ7CEqtydE+J2vF8NoZPM59cdwss1/c/UEuMCrcuUp5SZP3sWjNzIkko6
	 TkYfMXe5+gmsxf/2CLqHRY+ihilZeSf8GcTF7QTuwgCEKYlrbr/YW1e4FR+TZlcu34
	 qb7pTASfICyC5e7hn69dVg2HjcGuA24ZZkHbmBaMDixR7mmyQhDF8jmSHQTqeRT/0M
	 sk/1E9UJf8S509K+uflBDQxvHK526SDH3QdcNsXkXKCW++dpSero0UpNy2xZicHDER
	 xIugqENSPzQSw==
Message-ID: <sashiko-outbox-165734@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 07/11] net: ethernet: qualcomm: ppe: Add
 IPQ5424 QM configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Jie" <jie.luo@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261008-qcom_ipq5424_ppe-v1-7-16caf43e44ee@oss.qualcomm.com>
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
 <20261008-qcom_ipq5424_ppe-v1-7-16caf43e44ee@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 14:52:12 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ppe: debugfs queue counter iteration reads nonexistent queues on I=
PQ5424 causing bus errors
--

commit 4fb437e4b3cf979efa2cd54481de8f5ac5e4963f
Author: Luo Jie <jie.luo@oss.qualcomm.com>

net: ethernet: qualcomm: ppe: Add IPQ5424 QM configuration

This commit adds the Quality of Service (QM) configuration for the
IPQ5424 PPE. It configures the unicast and multicast queues, noting
that IPQ5424 has fewer PPE ports and thus lacks multicast queues
284 to 299.

> diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net=
/ethernet/qualcomm/ppe/ppe_config.c
> index 3afa571193238..dec8eed772539 100644
> --- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
> +++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
> @@ -314,6 +314,37 @@ static const struct ppe_qm_queue_config ipq9574_ppe_=
qm_queue_config[] =3D {
>  	},
>  };
> =20
> +/* Multicast queues are dedicated per PPE port. IPQ5424 has only 3 physi=
cal
> + * PPE ports, versus IPQ9574's 6 PPE ports, so multicast queues 284 to 2=
99
> + * are not available on IPQ5424, and the buffer pool assigned to the gen=
eral
> + * 'group0' is larger here, 2010 versus IPQ9574's 2000.
> + */

[Severity: High]
Since multicast queues 284 to 299 are not available on IPQ5424, will reading
or writing the debugfs counters for these queues cause a bus error?

In drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c:ppe_queue_counter_get(),
the code loops up to PPE_QUEUE_TX_COUNTER_TBL_ENTRIES (300):

	for (i =3D 0; i < PPE_QUEUE_TX_COUNTER_TBL_ENTRIES; i++) {
		...
		} else {
			int mq_offset =3D i - PPE_AC_UNICAST_QUEUE_CFG_TBL_ENTRIES;
			...
			if (mq_offset < PPE_P0_MULTICAST_QUEUE_NUM) {
				reg =3D PPE_CPU_PORT_MULTICAST_FORCE_DROP_CNT_TBL_ADDR(mq_offset);
			} else {
				mq_offset -=3D PPE_P0_MULTICAST_QUEUE_NUM;

				reg =3D PPE_P1_MULTICAST_DROP_CNT_TBL_ADDR;
				reg +=3D (mq_offset / PPE_MULTICAST_QUEUE_NUM) *
					PPE_MULTICAST_QUEUE_PORT_ADDR_INC;

For queues 284-299, this calculates an MMIO address for non-existent logical
ports 4, 5, and 6 on IPQ5424.  Does this lead to an unmapped register access
and a kernel panic when a user reads the 'qm' debugfs file?

A similar unconditional loop occurs in ppe_packet_counter_write() up to que=
ue
299:

	case PPE_CNT_QM:
		for (i =3D 0; i < PPE_QUEUE_TX_COUNTER_TBL_ENTRIES; i++) {

Could this also trigger a panic when writing to the 'qm' debugfs file?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-qcom_ipq54=
24_ppe-v1-0-16caf43e44ee@oss.qualcomm.com?part=3D7
