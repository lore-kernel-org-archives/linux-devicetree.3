Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340AB42E8E7
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 09:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191559; cv=none; b=WGJR4j+JHNBn85D2h1jrfg1qmi7wliRYZ5CcWtTMOPB8uCkRXnlnpSpvOxWWlekFLtW7zQnpEbe0TjlaFo6nOHSAmdpPYfL+4CpIbWFnSAwzzwI3DPu1poMeufHBmrU7oaS4z26KD/NzM64wjEPxT3aou7EK+l8bYaLcpmArqSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191559; c=relaxed/simple;
	bh=DEKopGIrQkLh8SWF/zKNuJLXidGRTJJo4QAeZeLI1Kg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F6ojt5+M7ZBVZ1IxOpWnLvTuEuJSnPsS6UQ9RSnj5LeDfPZ8zDAncsJMFhlYGi1ovCc15AjDbKcAS9r51EUbI2KKajEQSEybTPLJn3YBrfflLVMDwI+WRUxaoA6+PQ7mbv1/z+0RVVqgV/TWNmCc4IVTuoS04ATHQsZAzO6gQ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XNYsO8jj; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XNYsO8jj"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a1681949b8so8629435e9.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 02:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791191556; x=1791796356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DEKopGIrQkLh8SWF/zKNuJLXidGRTJJo4QAeZeLI1Kg=;
        b=XNYsO8jjfmPwdlHxjhGD2gOYE4KwbdRGvaUWB4gF9FQAgJ4UMjq+F5EnGYi6alD8vz
         vggoW7EO7joFFi5tHSjBaE7Zp31Yi5WoTij4qKD6V3kOoHC4jgc5YlglLN1leGAM6tF2
         PJJO6bj7BZ1OBB6VxC4NfN7JM+koXy9ywqhRc9gbTlP1/6YbgHcjC0HFqlk/VQWojjoZ
         ml5orml1Ers2fx5fcOIhzryz4Qpb/C2pOUbCxGvgpDLheFkG1fbvt1MWG9OPTGkIKQD4
         uMyiDAHH1hk6diNTjfjClm/aFsEqGw4MXyVv6O74prYzcXuFw8EKkRhLZe2N+DOKwSIC
         FiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791191556; x=1791796356;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEKopGIrQkLh8SWF/zKNuJLXidGRTJJo4QAeZeLI1Kg=;
        b=W5gDVaYU6T/Xc3bcYrifwOGskrWKxZZKi9dpE6otPDjtKBTdb+/IZ4sD4hGKVp0GvT
         J8CEvu3uDMVdX5CRwVIL9jyLuiUABunjKgyX+HPIEe+e3tOjz6P7o9ePNdepQQR73yNR
         dR4P/oFxgoLo+RxDu6Zg/V5KnU5/egriTK6j0XUexL/F5ITCVXD245bvXUM2WS1ViwLw
         0qC/ZJKfuNBk2IuPEJvM4seY7dZVjv5OfGx2wUxXkPqfMCcl//BGXkZ9M/JJLBQOxwYB
         tuz3ihfp8C7/z1Ji+BC0sIiBBNc4+qF6kosjsVZhXEvC6linUfkz8m820aExys8rDOVA
         dZFg==
X-Forwarded-Encrypted: i=1; AKwUvBxFkiKrefb4soyIbL9TZJ2yNsvJKwN7L112p6TQCRN5Ysvtgc1mvgja9+2+1fO1FEVbihcJ3wlv/RXk@vger.kernel.org
X-Gm-Message-State: AFuF++nmLscz8iDXzXsfDmfiUWkjiojD11UfsA9TgddllP4VkS1eJ7G/
	aHTOjISEQ0BVJ2cMcrmfOzi6GmXfsVD4X7mj9idaravmE5YpKKh+zwci43r2j/WgmuzI6k/bedU
	nn78yGjfjQg==
X-Gm-Gg: AYBFou0vVybFlrgXJbE/XJrJNLOZQrXU6XzJR9tMh+yQpo4iPpHm8tQmx2W9vWfyMk/
	N94iz+qX9c9j9rOuk1t5pe96xJiVO0FceMm38fRJcYRiTHZq7thR2N+EEZzYip+X/Imt6y+b+LN
	GXuJLC6lipTjI1GnrSZfjOyD4Ajy3xulfSQbTtZXqqYvM1xwyn7VCRETNQjEy/98Uh5bLvY4Azs
	GYk2IFH0OzRRIFe6HZe8sTXbvSe2FCHME3dsXzXwCvpuhapmxy1xNFazj5JQX8HLsqwWDpPv/vF
	PBd3NHEpAtXpOA2jmSZ3JlG9lauiPl/LLvWzjaonDCCTFDbxBe+yeyjTxb++tYrpNCkstNShaaE
	JMzv0pHzVDm8FsoUzo4B8E20f3Qo7ASNmfx0PFWwCOOrmMGM2IPstvXkTkfrxQTYDx0jNvm0FfK
	omG10tSZulNDXc1w6Tb+5s9J6RzfIjulVNBo7KJeXn5KXktMNe5JymUzHoDX+UKgJfZHlVLirYS
	1owDXEUpPoWgMUQ
X-Received: by 2002:a05:600c:1394:b0:4a0:1c17:4fb2 with SMTP id 5b1f17b1804b1-4a02759dc21mr185147705e9.31.1791191556536;
        Mon, 05 Oct 2026 02:12:36 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff20831sm205138945e9.4.2026.10.05.02.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:12:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 5/7] clk: nuvoton: ma35d1: Reparent SYSPLL correctly
In-Reply-To: <87zewti2pf.fsf@bootlin.com>
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
 <20261004-perso-ma35d1-upstream-clk-v8-5-e1a106a128c0@bootlin.com>
 <20261004205551.6279C1F000FF@smtp.kernel.org> <87zewti2pf.fsf@bootlin.com>
Date: Mon, 05 Oct 2026 11:12:35 +0200
Message-ID: <1jjynw7bp8.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun 04 Oct 2026 at 23:19, Miquel Raynal <miquel.raynal@bootlin.com> wrot=
e:

> On 04/10/2026 at 20:55:50 GMT, sashiko-bot@kernel.org wrote:
>
>> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:
>> - [Low] clk: nuvoton: ma35d1: Modification of global static state
>> during probe
>
> There is a single clock controller. Should never be a problem. I can
> certainly move it in to more local scope if someone asks, but it's not
> practically needed.

I may be missing something key here but why is not in your defined
indexes like the rest of the clocks ?=20

>
> Thanks,
> Miqu=C3=A8l
>

--=20
Jerome
