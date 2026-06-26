Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290062F6560
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 14:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782483045; cv=none; b=BlMlVJ+EvNgv+ybu2bqH12VLx/oXDLFS5meQ/c5IcIPYZKLRti6aX7t0312/SmYnhzszPOnO4p+LY02tWNxhuFcNr0nGGATJ5tykqVVyC1QN/4XgDRMImvt+ksLfj44Qxa5jaLySa9vNzb6IYkvqzIxfj2YMY9S5fbkQ5atxC+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782483045; c=relaxed/simple;
	bh=FEH9bA1UgN5vxUH/MjOs3rbE+cyeAt8gKwPKaRT+8qU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AW3gGSjgO3Ff/Wi0DR1JsD+AXBSVhVa1nR5zOmeXp6l2rdfImH8pBCXJmndKoGRtthW9SdYZ/nR4/BeptE6xGqPYRCW7NR400Tq5xhCR9cpqvRE0ujz6tjvLzZc/OKBiVD+NURPMR0PyTavOAKZT0XRc38q1gd/ltD3HMY1YlB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cpbbR/lA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cpbbR/lA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3241F000E9;
	Fri, 26 Jun 2026 14:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782483044;
	bh=mnXxb50PAv2cBICoXPWXBuB8S6VWBNx29ou/Kq3NQMk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cpbbR/lAr9FGaads4dE/TjrG4McVuw/kxFfZN4gcKKgVaFwLmvkxohfabbCkrtbGJ
	 4QaApkHyi6LK6DWMhRLGdMNOvkFwhFBp7lNKk6rFeb9Rl3EGdDqf9B9Do7cynIcUVK
	 zI/16Mc0u9kQLmsFFZEf3Jj51dy78XrSUWnl5Fp2dSAXpnrlGLpWPRFb4laJYcWphG
	 ryoAH05MmOQkc7PO8Z0q8BzYkFd1eNed2ToNm/AurrcabD26wC4DQugQmABXxOIGfo
	 6jOxLgkrxaLv5l/4XEbrrjE6YEFldGG0LxYmdttiBgRXJE2lCXm/DuRmHd2iuMcyOU
	 ePYf8W2z/2q+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] Bluetooth: btqca: Add IPQ5018 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem via B4 Relay" <devnull+george.moussalem.outlook.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260625-ipq5018-bluetooth-v1-3-d999be0e04f7@outlook.com>
References: <20260625-ipq5018-bluetooth-v1-0-d999be0e04f7@outlook.com>
 <20260625-ipq5018-bluetooth-v1-3-d999be0e04f7@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 14:10:43 +0000
Message-Id: <20260626141043.BB3241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Out-of-bounds read of tag_id and tag_len via integer underflow in =
qca_tlv_check_data.
--

commit 513dbc31af180171927da878907af8ede1372fc7
Author: George Moussalem <george.moussalem@outlook.com>

Bluetooth: btqca: Add IPQ5018 support

Add the IPQ5018 SoC type and support for loading its firmware.

> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -378,6 +378,9 @@ static int qca_tlv_check_data(struct hci_dev *hdev,
>  		break;
> =20
>  	case TLV_TYPE_NVM:
> +		if (soc_type =3D=3D QCA_IPQ5018)
> +			break;
> +
>  		if (fw_size < sizeof(struct tlv_type_hdr))
>  			return -EINVAL;

[ ... ]

>  		idx =3D 0;
>  		data =3D tlv->data;
>  		while (idx < length - sizeof(struct tlv_type_nvm)) {
>  			tlv_nvm =3D (struct tlv_type_nvm *)(data + idx);
>=20
>  			tag_id =3D le16_to_cpu(tlv_nvm->tag_id);
>  			tag_len =3D le16_to_cpu(tlv_nvm->tag_len);

[Severity: High]
This is a pre-existing issue, but does this loop risk an out-of-bounds read
if length is less than the size of struct tlv_type_nvm?

Since sizeof(struct tlv_type_nvm) evaluates to an unsigned size_t, a small
length (like 0 or 1) will cause the subtraction to underflow and wrap around
to a very large positive value.

This would cause the while loop condition in qca_tlv_check_data() to
incorrectly evaluate to true. The assignments to tag_id and tag_len would
then read 4 bytes of memory, which could be out of bounds of the allocated
firmware buffer if a malformed or truncated TLV_TYPE_NVM file is processed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-ipq5018-bl=
uetooth-v1-0-d999be0e04f7@outlook.com?part=3D3
