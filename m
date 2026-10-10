Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606763603DF
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 21:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791667609; cv=none; b=nAu6E86xiT2tRtrc+h9QHdda4NCg4U40MeE6EeOvP6D8ykMbr/G5DNm6sZf8ihzMTXKEXBIPV5lGst+x4x+KxVTdzb3Bc48LFfl5CbXsP9WLM87zgAhO5BkNie4HfXYeoL51A5u/uZgTn/hZEUaR0/Bz9jcgPgyByLbqHUOWC9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791667609; c=relaxed/simple;
	bh=HcanjXNG/y1dzMxOcr/CuT3nL3s1yXy3rxN4U86ET6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pJcfCkgzGrTxjSVMe75XQC0PsTRUWsnubZGRxagYX6xT2Wdq1WOx3dK3eXE85rgRIxDQNgK3oR/6Ghv9yyKezQIc9egt06ron0tRl3sAVi1D3M3Emxtui1JrOHM6K/8o07XwAbOxqj/UHG4bdbNv/RS220SLg00tS11vLpMRW98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKd6N34h; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKd6N34h"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-487048857f6so753004f8f.3
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 14:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791667606; x=1792272406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HcanjXNG/y1dzMxOcr/CuT3nL3s1yXy3rxN4U86ET6o=;
        b=NKd6N34hHFAOrbH3dm4SWhB6z8OJXPy/g1M/Z89XhM3bOC8/ZOuEtndUV3C/Dy993I
         vdpQvjqcDOVrCRUfgn3cLExsVUxsx4hMgSqb6L8h6OFNgCTzs6KNE1V1dqzjCDswcAKZ
         cPECDyul13Dsq6SXtqcricppW0MKwNeC7dUjoLQ4AKBDcmFt3r29H0BPwFfhaCUnjNHu
         6RtovI6v9CAdgJMHZoKqdoxio+aO0dQ3nQHncuEq7nWWdeZCyEAfYUVSSlr/D1XpzfuU
         QE6ix9MDnM/qT3+SG8ZI4sHgKHKbgp1alSEtAfbCVtG5GPk86Wu5Gj6Rem0WgstxuyNu
         4CKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791667606; x=1792272406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HcanjXNG/y1dzMxOcr/CuT3nL3s1yXy3rxN4U86ET6o=;
        b=zR0i1oP+RyA33tr9H5VN5f5Jf7yyR2k70vn56JoJ/qDJpH0H97QgAFnM06hairRBqX
         URDDAcXunpMjMtqzy5bRVK3VRuVcxD530bo3mKtpnIky7rr2dbLK8xCVFN4rEOgHchdL
         DnRNSWHH3v56LWSQwpOotpQLJJ1EVfYtWGgN5xGEi3L5fwyzghg6GLDp3gHO3sClZE6r
         Urgao9Mt0NHvCrso8nCqMIP7Ma/PE77wCCoGFxzxBscW8LeYU3xwp2Zp5Fy9k4NPwUsG
         2cfsk+kItaNVXyRuauJmPf4X2ZS+D4m0iTXfdXUrkNgmrI2ffI2Ox1gjl8Z2qiGdD5Wi
         nZvg==
X-Forwarded-Encrypted: i=1; AKwUvBxStBh1gl8xD0tIUADBfGl2DlFInosXRuUHy2fDSdkJwLmieIteGG6lAktxe7SMQ7D/HrsggcbIxLaT@vger.kernel.org
X-Gm-Message-State: AFq9FYKLSTOdnD6S7x5EGKNP3hNSrv4aC1/2STuvg50sEhqrk6LI6Jur
	zOmwStAd0dnc75TS5MQ/lwvGezleExn2CA5stk7+z5/C9CsnG6t7SDMGTcG9YtnrEJEkUA==
X-Gm-Gg: AYBFou2+tn4Xtk+qSlKb5ro3x1+Z0g6F3MN/9vFJxiJd/8/RTLzi9XjR6EqHGCXTWDq
	Q0JwG7EmEAN3pnSsHC4OXH1rsj8yFRDRbSYZACK6zS972Yf7JDRk7VMphn7WVP9L/eUAqjq40an
	4DhccXJtWZMIBDlTOSS3yWryixMH1pZfVPbG0xlXaOzzNQlWR+E62mhUz9P2cbD2iA2bxGR+XPn
	aTwtDppamrh8YjRWfT1lsReDjInM1R+iNn+Tocib4sYN689oNk4/U6ucqeoNKXIri7/0HTYNJpK
	INFE5PIZCzjDsI6MIDFXSK2FwqTgRnTXyuzktFrvNLHrgsZzPiTbsFWRAgRF51HQ4dFaNtY6jWG
	8CuIMq69auV76HbJG7by9DjijyRoRMTyQHG3aWLgXKqsflpNhofu1VkQ3lUugIcXfNbrDnS5WJq
	WZmmUKmA609p2+xP29RGgs9WbuJzjSGQkw4zMiU5Rhoza/SmoWnpKJGjENNE0hj7JZbShkUOZ9K
	D0LYbSdsoBcCuF5WQn2iK+jinw87lyi+Nb4NLxIA0Klb+NEzecltSBTEnVteIVR4yLYSHF1xmys
	cwThDvdUtounjSOHqu1yT83PaxyQYqWVSuqAS7Wc5BElmeHQnqgEQ+Gq3aUk4w==
X-Received: by 2002:adf:e007:0:20b0:48c:656a:f36c with SMTP id ffacd0b85a97d-48dba77cefbmr8056240f8f.3.1791667606295;
        Sat, 10 Oct 2026 14:26:46 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ade914sm9978673f8f.54.2026.10.10.14.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 14:26:45 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: stefandoesinger@gmail.com,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: Re: [PATCH 05/24] ARM: zte: Add ZX279128S platform and CPU hotplug support
Date: Sat, 10 Oct 2026 22:26:39 +0100
Message-ID: <20261010212639.1662820-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <R4jkIz-qRYm8QZxlEgQNPQ@gmail.com>
References: <R4jkIz-qRYm8QZxlEgQNPQ@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Stefan and Arnd,

Thank you both for the feedback and guidance.

I would be very glad to co-maintain the ZTE ZX platform together with Stefan, and I am happy to take responsibility for testing and maintaining the ZX279128S SoC and hardware support.

In v2, I will update MAINTAINERS to combine this into a single unified ARM/ZTE ZX SOC SUPPORT entry with both of us listed as maintainers, rather than creating a separate platform entry.

Stefan, take your time with the review. I look forward to your thoughts over the weekend.

Best regards,
Navid
