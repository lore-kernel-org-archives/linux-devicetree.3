Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20C33E832A
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 19:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792263722; cv=none; b=EBy2LfAhP54m5gJ1wUMwePxXMCQMstHY9uEzWBefUUmzKhDuGxMWZVDtnqS2cF6ruPo33oSY37j+U33HesoRmPSckqfxYQc7d8Mzrb5OJqQroVb2BcbVh1xkrtT6u9cI1FvHapAwUzov6KddPanDCrmUZmWZqBPr33udJbKS+s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792263722; c=relaxed/simple;
	bh=OLRW7s+yNC5tjl37gTdFreL7HOCnw4vNpy7AfT7FaTw=;
	h=From:Content-Type:Mime-Version:Subject:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=cCduhrP9GbrX71kV3bcAB0lqguWc02hTIc+AMR805J2XruIZebFfyjtmMj/cOwyO0gakXLFQvBVxcTuzHYZ4no9YOfgaznJ+79InQnvGCbN4qFhmhDxIVXX7qWlsnAMqQ9rEQ3F/2VAXvtAyql/X2nyjIebBZauvvtHNPlxfAT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFgc+8+z; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFgc+8+z"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df8fe8513so613715f8f.0
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 12:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792263718; x=1792868518; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:subject:mime-version:content-type:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vJ3S+zrJ53PJeoB13lI44vseeQL6ZkTaT4zeMMelbtg=;
        b=FFgc+8+z64PqZZkaSVGU367jYwpOweJeg4qYh+D/KYJIk9fq+4utO6uW5+zHJJ4Wnp
         1884cDf3lzG7fzIAVymVQwmTj5ENqEa22itVXL+rNjDGnpcArWsXeiUDwxsmVgBbQp9z
         aVzjTdoGQnNwh3UHsubIzWIf5zdxIXETVckw7YIKCrj7wSHOYz1FCv3xHgyj0DhGIXdF
         0nsGhSQe6NxpjH0aHBHxozQNyz/KJSFR4vjKSpu9II9CkkjwuvtGtiFdJiAc5Q4RGipX
         MRJInq7jbsrqxzfyhL+exp2Qqezh1YO7PBQgoupkgLG/AWl3rrqZ1m00Mk29uzflLjlW
         dZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792263718; x=1792868518;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:subject:mime-version:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vJ3S+zrJ53PJeoB13lI44vseeQL6ZkTaT4zeMMelbtg=;
        b=t/xfMI5G1zJwMNOBTPF+Be3DW5DOQ7OTn557Py1rbpd/fqcT2pTDjtmhvx01wmsDIY
         XiSKrDihxSFRr3vTyQpFn1SgXVcnCVYboSt8RpupJC9yBsrYEPqlpGVqAVAML4eMa7Rr
         p9UV4DMbQgQ293GLaAqz+4o7z4KzGwSLdoLdQDwo/WU4fPednBurKlDm7/gL0Fqmf4KN
         aefJUMSrfh2IP9B3yo4c8dXOlN3ENPee4R4mbP4qXgpaLShm4dR3aIEhE+dXJ0/netTA
         5OjF4ZSppcJc7v2v+vrGzI265K0CPJ/YgrvqQ+90dcZNGKkahLYj/+wgnRHXkGpnPsng
         7hdw==
X-Forwarded-Encrypted: i=1; AKwUvBxoPeSkjDk+CVZ+VdHFrsdvgZx8O/BBEqco2868+C/LC00mGLvzewfK0rJDL2jmgXeGVyQ/IiFBpZiR@vger.kernel.org
X-Gm-Message-State: AFq9FYKlq5GiKJZoOwsUfvbrbBj1wuc6BY6iclRp/C9pf2Ak1SIP6nse
	RTdRK6PD2laqSXb1zDG2hRcwDb93V5QWEGBbKP0swvL/Mde+RtwGLfmkYRcM5oez
X-Gm-Gg: AYBFou2Wgb3B42nZw2BFZlCLBNuADVxwTXSmsgpzbtDEud5eLfCS8yY2eWQ/N/u1KqI
	4axow0q4dcWHSUhgXr4Wjh11X0XiB3ijXSmpCVKpW5UPHaGTHHh+XjzI4E0eL0Lppq2jcOlWnaS
	LJd1+0bWfjEtm+lnUNkgT3xGkL009IAzS7ObmCSqXxbjrY1GQG38dQzG09YczSW97V6KjYplTuF
	r+el8TDqHl7e/GOYPteX7fzrtkbYw92sldnVdzDhSpWy7sH4dULc+m4Rrm9N+tTZZoBaGut9/vy
	tM7T+V6T4uYX5WfTJ5WO6vgizAobYoujIj7JFgJAMno6jkPEvHUWkBouGtUFCMkfL12vaeZP7Gu
	5dFd4a/b1DBuzfLy9WoIQPRH7OR4PrlJvQf7n6UWfleJJXLPMcei8UGMO+uzS1p71Pg9kztkFfl
	6lwA3tZb/SS7EAc0pEV6nyAhk4S8diwxScZOpnAIrnUTRGKua7odpIRO2DnftX/mFZnSa3hBzYh
	ETC/LxYJVx8Jeo6m4BBrm5fNrA7FSS1ak+V/UklxeAHUdM0d7jSRtdKqgwoXrx/RAD0u/CXfna4
	31x55LgZaXjrmsdiC1Gq2hRRXvkgvQx776Ofv9WDa+tBwfOwl4RosFPdgAzVmZ/D1Xcz0b9BFrQ
	JmZple4rNtZZFr7p1
X-Received: by 2002:a05:6000:24c7:b0:48e:e98:8b6a with SMTP id ffacd0b85a97d-48e0e988e86mr1971222f8f.4.1792263717875;
        Sat, 17 Oct 2026 12:01:57 -0700 (PDT)
Received: from smtpclient.apple (dynamic-2a00-1028-8388-a84e-4dec-301f-bf3e-93cd.ipv6.o2.cz. [2a00:1028:8388:a84e:4dec:301f:bf3e:93cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8bd9sm13074929f8f.35.2026.10.17.12.01.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 17 Oct 2026 12:01:57 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
X-Google-Original-From: Josef Schlehofer <Pepe.Schlehofer@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v3 2/2] leds: Add support for Turris 1.x LEDs
In-Reply-To: <arvNDgAVO4V_drW7@solitude>
Date: Sat, 17 Oct 2026 21:01:44 +0200
Cc: Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?utf-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Andy Shevchenko <andy@kernel.org>,
 Rong Zhang <i@rong.moe>,
 linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D7371D8B-06B6-4F52-8B08-CC573E699EE5@gmail.com>
References: <20260928111907.72592-1-pepe.schlehofer@gmail.com>
 <20260928111907.72592-3-pepe.schlehofer@gmail.com>
 <arvNDgAVO4V_drW7@solitude>
To: =?utf-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)


Hi Marek,

> On 29. 9. 2026, at 16:45, Marek Beh=C3=BAn <kabel@kernel.org> wrote:
>=20
> My proposal is to register the first LAN LED as a true multicolor LED,
> and the rest of LAN LEDs as simple LEDs, and then create sysfs
> symlinks for the multi_intensity and multi_index attribute files:
>=20
>  rgb:lan-1
>    multi_intensity   (true attribute file)
>    multi_index       (true attribute file)
>  rgb:lan-2
>    multi_intensity   (symlink to ../rgb:lan-1/multi_intensity)
>    multi_index       (symlink to ../rgb:lan-1/multi_index)
>  ...
>=20
> This way the sysfs will somehow reflect this topology.
>=20
> Also, the max_brigthness will need to be set to 1 instead of 255,
> since we can set each LAN LED on/off state individually, but color
> globally.

I tried to reach you privately about this. I am ready to do it, but
before I do, I would like to clarify one thing.

v4 will have rgb:lan-1 as the multicolor LED, the other four LAN LEDs
as plain LEDs, and max_brightness 1 on all five.

I am not sure about the symlinks, though. sysfs_create_link() can only
link a whole kobject. A single attribute can be linked with
compat_only_sysfs_link_entry_to_kobj(), but its callers in the tree
(tpm, fadump, img-ascii-lcd) use it to keep old sysfs paths working.
Would you and Lee be fine with it here, or do you prefer a link to the
whole rgb:lan-1 directory, or only the ABI documentation saying that
rgb:lan-1 sets the colour of all five?

Josef=
