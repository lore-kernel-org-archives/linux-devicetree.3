Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AEF296BA9
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 10:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913852; cv=pass; b=ZTVFemLdorZKoMhyt6rCEo3eLoxgivsko+mqh+HZUTMVugeFoo9+3a6PZAhVHD2rGghbH3iIcWsVAHVz18qzWzsml8XuuVo8cDBSqVs61bRyIORITxgYXHI7hH3mas0AjTYnUeKHpjKmTkQTuL6fWR8OCm0Pzld9svoWoM7UNwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913852; c=relaxed/simple;
	bh=iO1eaGvDzXfIATQ6FbttFqSUgNHzC5DEYjmEOl/H3DI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kzv9/2XToWEx30tw1uQ2eMQ9qDhO5Igy51B6+V1zFL/jh8KNOMBqfdLqFZfMzMPe8OQFT0HIdM19RO03foytazY9wmZrelOzTB1VW6M4p7NAbkaDc+LVqbF2Qxsih9shmTlxMXl9fQ16Zp2O5awbRdNCYlVBVpFa6I5v3rF8Ls4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McJ+j5bB; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McJ+j5bB"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-304d0ac5e3cso7287875eec.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:17:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780913851; cv=none;
        d=google.com; s=arc-20240605;
        b=lH10tDm41KVaPw7v7UQTCreBsx7p5DOujD4vn+FEuO4io7w+DO5NgyukTnqfUKSAis
         cKBG9XqEsYnj1I4n0JAv4Ab0CahnI6Vb+0S7lpqCr7VKrKq5BqTb6RhLd+sb94JUEpGO
         wj3n0GboB1mNEG4HwBfN8C+1zxkdJT79iAnRpVjaiu/YN3+/W9twpV8EJVd19/4DICQ5
         mrv21it724JHBkvkhtelj8RJ3FcebyhsWmeMdHDKziuBKgbOhp9QCNME+GDqf0qjA4h6
         inzKVY3sEjR1eTh6pFcajIwinhsjiHbxB6bmwLBycBlWkVe1bhQ5wiO7CWKBkG3iKP5F
         hx/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iO1eaGvDzXfIATQ6FbttFqSUgNHzC5DEYjmEOl/H3DI=;
        fh=SCzlHVvhqpqLhkMmeGRZFxtTsIdG7j2s7eEYVPD2W1k=;
        b=QqX+OClsEifseLSVJ2PiGdIFFTEOlADVd8Sh8qew8vqhW8CNSXMLybadjj2ZbAhfrF
         btTwktKuYrZvYU2/DBpS6Eh0qRxkvyfbfJfc7TZb2yPyP/tkl71FgZVEzqJq57ZOdgrz
         52pkaaB9uV1TfCEe+kcidefSU/h4fHF/r0CUJInnA+3e2CUG/KLf9e2MlWpE7awhJqwY
         r6fVkYbkELywHB/2Q0qvvou+AZGp2Fc6xlQZsGXzInHbqjtMJHjJ1pN9FqgbkKiUK1D6
         2W7BZCpUgu3+AhCVRl6TygP6OsJTkb+yY9Pc0Y+U25pRuM9zhaHJ3ZrSEhnDBkmrcjCH
         qbQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913851; x=1781518651; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iO1eaGvDzXfIATQ6FbttFqSUgNHzC5DEYjmEOl/H3DI=;
        b=McJ+j5bB93qV60Xd6jL7CB2h0Tol0NTSAwnLQ1NVq7yej0qLYH710QSfrQApf08J+L
         1MWg4Rfic7XZeP9a4/UH/0ITATYISgaoBfer2glZ8JDQBTpx4X38U54yrO8r4zmJvX1i
         mBZIW0jc6EBLRfJCZG8wGqcA1UmsiXLKGNt2Iz+3K6fd8wWSx7YW8T/qimBSZEarF0PB
         KaLD3/K+mHqHov0qv77ZJyOqd55j3WQhjqoks6/je5ppop1NLByGVNQkqIb8Nc0bY52W
         18r1+OgUkNxfGSgut8B6X3INN/4I+OvfEZjhx902EGD5MvJMfTX/09JZvn99hkksxeLq
         HiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913851; x=1781518651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iO1eaGvDzXfIATQ6FbttFqSUgNHzC5DEYjmEOl/H3DI=;
        b=Jh4ERwicPC23pVyEvEpU3tnXFs+jwjGQE9/G/C4cMwabK7S5GAzU4dMUDq8wjzIEpE
         4Sc5VQNAGe6O1SPk6iWSiw/Hlwvc9tdPAlfw6B6CyGf+l7dhShOnouhdTnbtdPbRgL4J
         ryuDKtrZzpADefHo4uVkXbi2MdWAyrOPx2/bFaPKs+H/XwMi2rOx/WdzmfoUBApe7aL2
         6vqsI0SxL8nEBwCFYTxvXhlIFg1Vc2j/HoiLcWdZNusZ7IJnmM4FnupQxY++3rYc0WWz
         T9o1HS+AYsU7OjvaoBv2k8p8Q8zyLC4jGxkOzCA53mKypZxDk9pL0KVsMPqKt+xEgqMv
         PlmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8BLLiTmc4BOJ1VYTPo07ndUgwHOFiuK5aUBF5Ke3pKPY26jFRuWYaLsRTeMlK4N42HABhTZ1Al2Kyb@vger.kernel.org
X-Gm-Message-State: AOJu0YwN63DzJRmzaw0hZV9cE+yYkdBtBgbPSVZPoCgdQv/4Qy1yOxNV
	R7bwe89FGxSALhPo5k7SYYKLqItTOQdEP5iBpzERPzTjtEa/65Vxrp2s83TKDamcad2jJKMTiQx
	vTitV80mIL1JKBfmAJO1JbmKHMUMu4w4=
X-Gm-Gg: Acq92OH4E+n/K8h+0EuP/TbchDccD22+W9a76uLyWqYB6ynHCqY5PqrmlqaYQ+5xhi9
	LoWS+Br5zZhGaRfi2ybBk3n2KWv6EtWdmrJQ3U1fj28EbV89ldV9iwKylBAsDFk0U984jdrpOro
	QoSuC0bYMVF1IJhiVG/or5pmVBIttYX6Lw1jF5i1gXyxUjocW6zf/ykmDmtf2VX+9RVBvEg9QXO
	7YCRkBEPpyD4Knxm41rLrTwfgvQp1SP/czFnDEwOCrUdEFGRQ8dqkKZgLa5NnFF0sz5CFKM0xc7
	bUUq/oEUZfFumg8Bn2A=
X-Received: by 2002:a05:693c:3b04:b0:2dd:c066:bf7 with SMTP id
 5a478bee46e88-3077af4c792mr8284449eec.11.1780913850572; Mon, 08 Jun 2026
 03:17:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603141033.111300-1-clamor95@gmail.com> <20260603141033.111300-2-clamor95@gmail.com>
 <a0c5c1e8-9a36-4835-a5d9-7bafda79c36f@roeck-us.net>
In-Reply-To: <a0c5c1e8-9a36-4835-a5d9-7bafda79c36f@roeck-us.net>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 8 Jun 2026 13:17:18 +0300
X-Gm-Features: AVVi8CcrOQOubOdj9JOPPyVint1e3zMXjsL7b6vwNttA87TuPIhuEKabhXB-TLQ
Message-ID: <CAPVz0n2CZQZSpcdCTD3oPJS3qZVRkktwcNnMgBfmAoHJJMvJ2g@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: hwmon: lm90: Document SMSC EMC1402/1403/1404/1428
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 8 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 02:03=
 Guenter Roeck <linux@roeck-us.net> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 6/3/26 07:10, Svyatoslav Ryhel wrote:
> > Document SMSC (now Microchip) EMC1402/1403/1404/1428 thermal sensors.
> >
>
> This set of chips will need a separate bindings file. The EMC chips
> support several configuration registers (beta configuration, ideality
> factor, consecutive alerts, filter control, just to name a few) which
> are not supported by LM90 and compatible chips. On top of that, the
> EMC series supports up to 8 channels. LM90 compatible chips typically
> support two channels and never more than three.
>
> Claiming "compatibility" with lm90 for the EMC chips is simply not
> appropriate.
>

Since you have such a deep understanding of EMC sensors, perhaps you
could submit a proper conversion of this driver to support OF and
regulators yourself? That way, we can avoid wasting your precious time
with lower-quality patchsets.

> Guenter
>
