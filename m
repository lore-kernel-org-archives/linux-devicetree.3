Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F53E3CAE66
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 07:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507367; cv=none; b=lRBszUdtXNKc7kQgvynmFaGGzUTenr8r/4iFy30JGesXq4y4FLSEW2IQu7MA11dqZbj9vaDP1ZFEEu3SMfHGRKK64uO/k+SUueyZpxKIWq0Zl3w8+bzvZWKni6mLp1LssvF8omsTRxEr8kbRe0w55x4NqYe5XFnwJXii0D03wuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507367; c=relaxed/simple;
	bh=nd/5ek9o+FS89AY/wB0lPXbQLZpXH5CZcMEcmmo1y+I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=aj71MW78u/xT6VV03bZ1iDKSYzq/tuehq94ULhEBv13JAZgZ7e5YDRZ7XfGWx2GW83cgMXQtfNIuC5lDCxEwKtosIpjOm8H8RgTMIazn5LulbMxC7BgcikfWdmQYcj2Q5GHSoky11OW69j+NV4It+O3lsv7ooivFY5WL3JNfzzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bjMR1neM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bjMR1neM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso10823695e9.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 00:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788507361; x=1789112161; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nd/5ek9o+FS89AY/wB0lPXbQLZpXH5CZcMEcmmo1y+I=;
        b=bjMR1neMOdZ5hvoy60R2kwpTv1NPbW2kVIHKeuE9/BcH1+T/R3aJQlk2DEWIx7Sb0N
         tb9OnhYwY/LnIS3xTW/73gLiDKbZPVmGv8hUwDaOzm+MIT0xmk682rxO1p8CKuFPxC34
         UcfKlt7DTym3oyonXC1EnIvYZvEhvKvrQ+zd78o+OpUnBrMxOrux0rsKrj7BzrCl9YM6
         eLbtdJ2hHsxDHrw3svy1WOY739JpoUj3T7FaybZkSfyLOn85rg+h2d94YifOnCyu///1
         ZtPhez4ENsWQUg2D+9dvqXGyFGO101VZ9DUc4AyrCZqemev9Wu6TOigFFGWhPUjTXFnA
         117Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788507361; x=1789112161;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nd/5ek9o+FS89AY/wB0lPXbQLZpXH5CZcMEcmmo1y+I=;
        b=HLk8A+6xWPDMV46GLNhHURt22ZHr4zjoSdwWK5aLna5rrdAgITqLtYT3k0kUHzvS0M
         1j8TFXairmrI4X1g357fJDMZMDCMhLrdUiMOud7OfuhSNVzaLySB6HWnF8iD7VQEmho1
         uJcZ6Pcj+ieWcWF5ACm2zfM81AutDfPTD3mc39jHdb4hHH57CV74M7DHtEjLJovLIgjv
         xnBUy2OvzIJ7Vy6Z57XEHFKHO+xLNbPltCsQWaZh26Sp83+gbeK4iPnNyyIjkw2AwS6R
         MOMB+3O9ANZWGfmrVaMznrgMqJq9WvJG+Koq6KDqeBnwCJmJbkc//zdE1yFfbSdrybBc
         ring==
X-Forwarded-Encrypted: i=1; AKwUvByACm1lMAg+KCvXbWyKLbKOXxKqll41oDQ0f3VFKKNoqGXQVGBEr4P+zNO92VjvLUXpqpRCLr4uJh20@vger.kernel.org
X-Gm-Message-State: AFuF++nBTEe+8wNIvugbx/hqTfW5qAzXEDJ9FyZfXf2pNu8hD222NLDo
	WW8BN2fLQC/u/LUqimc2AKa9hsfYf56gpzi2zgMTzlYayOkBMby6xY1IfeY8+wcx47I=
X-Gm-Gg: AYBFou2er7NkDm+Gp2dGrWeeI7yocRHFn5uK6icXOXpWuxPhOZVMRAhLNMBSN3mphMl
	XlmRchMxUpbpX466lgUkQbnhz7/JTnq2jUzc+A82EWvrxIItWWKUfX+Sb6jK/xBtoIJUkFbmGuo
	ZfudiPAa9gJyVSRBxcJLt4LyQCYH/aFKttvobq1A6wPWgN3TvpWyl1faQJua1dKVkloUaKE5VPR
	vW21xNTqmej9Jn95fbb75HTA0ETS6658tsW79DRiwh7ue6oAsJeTbGcDEf+FQ26UTCZTPRHAiAX
	lkjefZd4gMbD/O6VAoU+4CNOGABbcceKNyhiUzPiGiFMkDhJ/TGIsg7RNurqUHpw0vAxnJc7bdp
	j615ZkSvZNE8MgyNN/oKO9gj820fQ2OAxlA9SIro84p1ypAqI/7BEC8hyiFoRwKzT6SYRxNU3Mm
	A+S5rYoZsjG4l5iQA9H9Zhd4Iy+TOtSYEeDQojmbatVrlI5cx71cxa3b21
X-Received: by 2002:a05:600c:5251:b0:499:9eb8:a1d7 with SMTP id 5b1f17b1804b1-49cf825c45emr36885685e9.9.1788507360982;
        Fri, 04 Sep 2026 00:36:00 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:489b:7642:1b32:84d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf772692dsm57176265e9.10.2026.09.04.00.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 00:36:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=841e05f6ba8ef64d6b8a02f12b4668f6f7f66f4ea31d2002dde784c4a325;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 04 Sep 2026 09:35:52 +0200
Message-Id: <DL6CXYXHGWQU.193HZVLMKGI0F@baylibre.com>
Cc: <robh@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v8 8/9] arm64: dts: ti: k3-am62p: Split r5f memory
 region
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: <sashiko-reviews@lists.linux.dev>, "Markus Schneider-Pargmann (TI)"
 <msp@baylibre.com>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com> <20260903-topic-am62a-ioddr-dt-v6-19-v8-8-74c650dfdea6@baylibre.com> <20260903125747.881481F00A3A@smtp.kernel.org>
In-Reply-To: <20260903125747.881481F00A3A@smtp.kernel.org>

--841e05f6ba8ef64d6b8a02f12b4668f6f7f66f4ea31d2002dde784c4a325
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Sep 3, 2026 at 2:57 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Splitting the single firmware memory region into multiple smalle=
r regions breaks kernel-side firmware loading for existing firmware binarie=
s whose ELF segments do not perfectly align with the newly introduced exact=
 boundaries.

I am not aware of any kernel-side firmware loading.

Best
Markus

--841e05f6ba8ef64d6b8a02f12b4668f6f7f66f4ea31d2002dde784c4a325
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCapp02BsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlNZ
WgD+NOs4vTIHWzhIMsJOdeF7z0fBc0JvIu28ZPevBdcx+LEA/3Xa8ZHnO8gHH9tw
J+lWbd7woSAs7d6ayJjBNAMhlIcG
=Wtn6
-----END PGP SIGNATURE-----

--841e05f6ba8ef64d6b8a02f12b4668f6f7f66f4ea31d2002dde784c4a325--
