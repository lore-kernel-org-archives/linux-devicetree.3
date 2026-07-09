Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756163A0B36
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 17:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617173; cv=none; b=rnFyaZhukwO0k75KaGKpXp8yum1l9/9hUwW2qoqVzJDh20eqQOFPjhKR5n1I5ZRDSHVT24sULxw3CH2pWUJb4Ct1aeHvF3cQXmpvXprAPFswcEPpL9CH9eMLMkcjFta0BYMhflQzDZb2o6UqHpOOIssVKNbaVJz3O9Ts19aec48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617173; c=relaxed/simple;
	bh=NKvhaOkurZVQatF18xohmlE/fSfqdtz1XGCSdcMiPiw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nf3U4HEKep/kNkc6VYFHj7yGspxRv+tz/d0Kn7M10zAGg6nxLNUELrZ2BPsWw3BxMBWEk1s6KZae2Sag0KLXkeDmPXO+hC5Dv8vVCBjkII2BLqimN1pbaVp+23mmkKcRjJm0DnlvNZrcsvYI7YKJMdJidXIRnzrxDiDvWFJhb1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wr8sWAwC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wr8sWAwC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C8C1F00A3D;
	Thu,  9 Jul 2026 17:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783617172;
	bh=3QipAW8oOnYho2ZcNW7sgbBMf2EKQGB7A2Z58z5od4g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wr8sWAwCNPDSCpzeOjQnGhQh+BOwPN5zrA1FoAzC0THX8vubLZVap1RuklRlWYViK
	 ujTnTgxZ+DIDR7SQ4p/7+ePtdy4mi+6xe0Ccz4tGrrGb2FbqNySxBLnbE67kmt/AZP
	 Pxfp+e39Br+i5oPAIgVWJZ/Cw5OfFFmVeklLQdmmriWSY36yQA3rcPpC3oW5pvTX0b
	 8AvlDKIEikkiEs5fq8pnON33miv0cMTPLvn9QobBqdvkFbYwfiX5QyCnps6GwQhmKp
	 ik8/rkPu4tXLd5+Yn1PcfWY+Y2SeyvP0vmXzb9Pm7eWXIiaGIfvQLy6ozNDCUuqSSW
	 v3fE6GyPgE3fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 15/15] onsemi: s2500: Added selftest support
 to onsemi's S2500 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal" <Selvamani.Rajagopal@onsemi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260708-s2500-mac-phy-support-v7-15-478c877aa1a9@onsemi.com>
References: <20260708-s2500-mac-phy-support-v7-0-478c877aa1a9@onsemi.com>
 <20260708-s2500-mac-phy-support-v7-15-478c877aa1a9@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:12:51 +0000
Message-Id: <20260709171251.E7C8C1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Returning 0 from `s2500_get_sset_count` for `ETH_SS_TEST` trigge=
rs a kernel warning (WARN_ON) in the ethtool core when `CONFIG_NET_SELFTEST=
S` is disabled.
--

--- Patch [15]: [PATCH net-next v7 15/15] onsemi: s2500: Added selftest sup=
port to onsemi's S2500 driver ---
commit 23684bf1f56c19460bcd699584b785e9017d1ddf
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

onsemi: s2500: Added selftest support to onsemi's S2500 driver

This patch adds selftest support for the onsemi S2500 MAC-PHY driver by
implementing the required ethtool test operations.

> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c b/drivers/=
net/ethernet/onsemi/s2500/s2500_ethtool.c
> --- a/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c
> @@ -229,6 +230,8 @@ static int s2500_get_sset_count(struct net_device *nd=
ev, int sset)
>  	switch (sset) {
>  	case ETH_SS_STATS:
>  		return S2500_MAC_STATS_LEN;
> +	case ETH_SS_TEST:
> +		return net_selftest_get_count();

[Severity: Medium]
Will this trigger a kernel warning in the ethtool core if CONFIG_NET_SELFTE=
STS
is disabled?

When CONFIG_NET_SELFTESTS is not enabled, the inline fallback for
net_selftest_get_count() returns 0. If a privileged user runs "ethtool -t",
ethtool_self_test() directly calls get_sset_count(), receives 0, and
triggers a WARN_ON(test_len =3D=3D 0) assertion.

Should this code check if the returned count is zero and yield -EOPNOTSUPP
instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-s2500-mac-=
phy-support-v7-0-478c877aa1a9@onsemi.com?part=3D15
