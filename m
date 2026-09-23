Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F4F443E52
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153945; cv=none; b=tTV+riVdj35bmOvuq6Hd+BWIEHId7ii5wlBPJRTp3I/HE3tjzDJKbsHWkpLoumB6fDP+nkXoSHusB9bCtkr+L6+z/mRfs6cjzNiYOn/sBgCFg0W042zE5WivYR7mE+0zDWERU1wGEsymVp6/LquBI+vcTJN1RCKD+83MedaA2kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153945; c=relaxed/simple;
	bh=N0deKAZvEUC2+qIm2qCL9XPw0JCTKVP9Fpq7a4fZNq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cxCjcmcR/YUbXMJCKaE6W+doC4LAObIhfsiDMjMC0F5IMyxv9lNeFv7S7E9HOTPJ9TkDKIEB6ekRe+tiMg3Y33c6ejdmrmHlGgZHjie3OIRf7KNy70kQJsvmTD3Ge43B+U/I6dcLGzjWRwDNa+e7DxKPSdgG5Ep4GkB42vbKMqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNQco6lq; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNQco6lq"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b93204449so203465e9.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790153941; x=1790758741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0deKAZvEUC2+qIm2qCL9XPw0JCTKVP9Fpq7a4fZNq8=;
        b=PNQco6lqOS0Lk60O2jJSg2VOb8qJPI1cazlBNiwFJoLmjNlzXqbmI2Dt+slUxktVPu
         xbjS4XnsieU6uK/wYn4l89JTnERFPnsI3dd3zVj4h6Nrt8LqSXWa6XkzFQFQcSoUg02V
         xTjFaThwW4//8qtfc/xb9+/2iQKjtKCTKGDCaobVEEuAY92qqOoEedyzXoFLiD0xYLmt
         5vfwiSTaspFktDGQvjKsrkfdR+9VQVmd0yCaspP6jnTG1GU9X746KSJ3g07JJdi/D9/5
         1/B1V4nWAObAw2UML7uzlhXhYiC9SQ5NqaRf+OUQaHz9Ecya1kbhOZ7sSkhawubNhycS
         XL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153941; x=1790758741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N0deKAZvEUC2+qIm2qCL9XPw0JCTKVP9Fpq7a4fZNq8=;
        b=ilPcqzs0qvaJrwFBg5DRdQ2b2oqGC12sq5hJOIRwyxoH0rqykKuMoEniiwB11FQCCV
         TgXcdXvjmgiaidE4P0TIOxQkzrylnhRYawdRzgZOoePO2g6g3UUkFluEmBFYqQAU4OR3
         zuKZTE8nfXNJ53NjcLcsIx7bEojmvT+kFEh0ihPMTt8WoqlRgBXQEAjqsP1vKZ5eKOtV
         3CbM8qKVUWpQ6L5JoQVJg7F5StMD5sqmnT+Plet5AoNVFHbsNEvFuT7gL/Wm/vvtUg+6
         hPV6kDfccpIJnv2VCyDSLmfyDEMMiXJeAc20P5qSsOxw6nc7NidaOnFeuUp8JImYoOOe
         YVog==
X-Forwarded-Encrypted: i=1; AKwUvBznznxpwC9EbvjbhyZCTsdic8GTFWeVch6tVLKV1nMNesKOTZTz2NMbF+p+j7QaIZ+KP9zEXhKZI/+G@vger.kernel.org
X-Gm-Message-State: AFuF++nMqXp/5q5airpmPoKF0Yf/MY/FMfnh6uTLQDBSXHCB4NKLeGMF
	MSCr+/7tBc4dAoKug6tIaFpcGd/nJYNnRwoB4CKLHc+BKiTM+v31/yAy
X-Gm-Gg: AYBFou2fGaoi8ShykZtLZU1h2LBmWBUohG0JhEjd1zsVlfRt+h5t/T6BLxe7rg5YJc2
	smML1I5j1vrah0UDlkvtEnafNy2iste3y9uWO/cWVSWVK4fV/AK7gSc0HNtO4uM4mwRwLajHTuL
	wBA5J5sRZAuFNpr1IiWh73T6hiGjfCOL/zl26OjF6CsF9/wT3YPfBaC26mPm+VBr7SQVd2H3uV5
	dvpW+MHhYCpkoN1cpRbURDLR6/6EtB4ie31sNKjC82OHzVszipAdDtE5eN/tUq9uMoFOKgzoGnw
	vI/zVRK2BZbABRzvgEddlnAd78KDug/cZh0AQQRg+jhd3SXqML5uLszWZF+rjf2+BtAtzzXdgXf
	vr0L8Sm+jdFWjMtmFq0FVoYNVKpzbaXRjpDxRdd5UBfyg+hjKoU1LPdHYt7z9d4HpcDpv466vOY
	mQthDiYLKU5D/uJ0lFxw73lamkK+41annCp2phtt+URCM2WFE/mTZmzwZWZ3+PF2OZzbmnwxfC+
	xl0HAG/RDqG7j35JSDA6mfnyRYjPuBX28h7TqWKzgWZGeoaCmM/l3PBoD5fHIX7nLSixTTehoww
	BeaW
X-Received: by 2002:a05:600c:19d3:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49fdec98921mr21435345e9.0.1790153941274;
        Wed, 23 Sep 2026 01:59:01 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8F4500D949869966507951.dsl.pool.telekom.hu. [2001:4c4e:1b8f:4500:d949:8699:6650:7951])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe23d4288sm30177355e9.12.2026.09.23.01.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:59:00 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/11] dt-bindings: npu: rockchip: allow DVFS and thermal properties
Date: Wed, 23 Sep 2026 10:57:55 +0200
Message-ID: <20260923085755.16219-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922160602.GA3529337-robh@kernel.org>
References: <20260922080114.44662-1-royalnet026@gmail.com> <20260922080114.44662-7-royalnet026@gmail.com> <20260922160602.GA3529337-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 22, 2026 at 11:06:02AM -0500, Rob Herring wrote:
> On Tue, Sep 22, 2026 at 10:01:09AM +0200, Igor Paunovic wrote:
> > Assisted-by: LLM checkpatch dt_binding_check
>
> Drop 'dt_binding_check'. That's expected/assumed.

Will do in v3. By the same reasoning I will drop 'dtbs_check' from the
two DTS patches, 07/11 and 11/11.

Igor
