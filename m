Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139A53C0A17
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271711; cv=pass; b=c6tcahApSlZkKVwu8mIVmG+ZkljCf0aT3GdseMgtiEGOqY8ygvD50lzr1BDsFkqOqZPAS/LGR9dJgdz/ESMnc+Y7w+NEdgyLPb3DdSoLvCQVSQrjBFHJJvVTkGz5H+dVIs3Ns/gXmKlvaM87TekrbnnptlduRH6A4sKSl9t+9Hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271711; c=relaxed/simple;
	bh=RwJxTFnJ5CXL7SNwJ3FzpgAg/ebATche5LLJ2ldkVUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z6VKqpsWs7OWJIuaHxGw5QUwQz+M0UfKMc1EFe1fvuYOSI7lPApV+xP33bFuxFSJuifOuPMuQzLLy0f8Hj+gi9M1vFfhYqQZako5CGG8NPTMQ9AP8puhdDsKWtWQPM7KKHG3s1/z7x+GXVrupERvRzPeY6Mw8BXwZsaNeLNjI8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iba2jLX7; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iba2jLX7"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51c167c58f2so56605391cf.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 00:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784271709; cv=none;
        d=google.com; s=arc-20260327;
        b=etMwOTV0YcdwrWvmnNTdsYGTBo5ZxyNgPkoV4efikSx6aEhiSapxGhmDxqDUGNjeEa
         lwNJbItRAMNCwS7yuI9GhTzdaU/6Vsm6AQRwelznkmVCktbzs892s8QX4vghbVNCP9Of
         M+Js8AbRVPsl4dDMwndOg62PMrFDLGDvxpV5M4anrG994OLNkUdxsId0KeTNgZdz9qFg
         axtVYgM6DX8LMZC3SX2ay1Q7DGzNtjK5rOjaMMZTpsNcaYdhOlQjY/ZXQCe3jhQpeZRK
         mcVHFMm+XR4OXSATmemxCFHn60qV4Ldlpg6N8/gCMhTH98flQaQDA5b7TzW9ouNeooXd
         sfAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RwJxTFnJ5CXL7SNwJ3FzpgAg/ebATche5LLJ2ldkVUg=;
        fh=lkt66EREgjufxmMD/SM19pqJxqWiCokpoB0BHnCBs7c=;
        b=Te5gUVLVivBNgtty75rw9b59RKcIeFsyzkt+tMsi9tyBQx9GhsXeE4IPbth86MkSox
         Zgow8Ra1VbDv/s4wvLJ9YNgPSntwBFI67bqccJEgRTivJBwJDlJEZkjxKJk6Mf5osmf/
         txr8+HW8AVyEdkM0bfLfJ+vqt1rlePQPTsxRg0h1D6RKcNbnlrFDodCGvCbHpN8C6zx0
         yapRjSG8EUuoh5WRYoIqkTaGAtUJB+y44zi/7mP/+62+LAnU8Z3Sm/G/CrHogUEiS+Me
         u023HUVqM/pQT5TZgkMS15/G35RKowhR9QKl6rGArgWfU4uAZ5MhXEvT2auKrExda742
         8ufg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271709; x=1784876509; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwJxTFnJ5CXL7SNwJ3FzpgAg/ebATche5LLJ2ldkVUg=;
        b=iba2jLX7sYz11VR5J9XKKR068YRf3KgpbSfXz2vfpqk9bYxorkfkewRxLn8Vk4a28d
         A1EaIoJC9MvOe7a9U4GSEQF+e7rBQen0/PXBwhBXYOsZWDYChqpd3W6Pwhl6iFcmapmn
         1rvXdHzRWbcHxx2TIxveIBBDfGKesF2ztZvUwLfrhJMKDSvFWCoeo5rjTaOwP87iu3hA
         jccK9duHTf0ZSDWBrb2vrmX83zp94HltwaQpAlQZPwzDqf2lEK3IziaRscM5G+zhbId0
         7FpgDnYsBpPWxsZ1zzx724HXo0WUih2xZlrhFR9MOB4C0Edo67UFYHFuU9Blm24+Xib8
         S53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271709; x=1784876509;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RwJxTFnJ5CXL7SNwJ3FzpgAg/ebATche5LLJ2ldkVUg=;
        b=J7NNJo0cDVG0sySbR9nvMomorer2vAMu6p6C//9f/w+rFBfamPy/Ty7A27eZxpjop8
         3X3cUUhIf4JKgEdxo7EUeQrCqKB5LYc3SYi7cd+31olo+684OB4kmnUUIwitwWVeBJTo
         TONr2Gk04OAxIns+yruoRFLYI/tSEOogECkwY8o2VWtdZ/x1TxyDWa6k/gtQTigtmDoI
         yyoAmVajVrc1z6Jzu1wIEN+xsbjb4c0SL6eYgiDk4/m6kJ57LmSnmckspyGShOlALdPD
         2sral5I46VJvo7BlhdVIqGf/VVGD2LqOGzUd+jjqxDJCUmp6KwaQ/mjUw1cM9Dt3Sc2Z
         1IwA==
X-Forwarded-Encrypted: i=1; AHgh+RpjrYIV8Mlb7jWmjBw2Vj9kLeJNXDC0m5GEbZOOqar71sy5fSBW2glSFPgJaREZuREFVgRoD7QYf9JL@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjy5Ho7he6Ifq3pyBTHvvjV5oMxXmm8shHoDqoQ7TSyk1HuQP/
	OiPm1JKEDjZubQWRlox7cbUZqQDStLH64UYEn0xOr5BQ+WYB/VpslYjfmV487cuvYY4+tP7cOJn
	R/zHyhz2IaPiQHv4Rn9Zof3ayjyVF1B0=
X-Gm-Gg: AfdE7cm9C9r9JLuqyfOJOK+Co6pE/HtQ5xl34+7QavZp/7C3NuOcdyjEdRaED7DkJ24
	krK9MPfWhdOcMyzpTJ/yf8nwegT1VDVr/wemkxuY+jIbC6sZRFqNquRO03kVa6c/E27TPXP+xW8
	SalPOvXHC6NS3HaHfr6gSGppLxUIspi1LISrZNyFNqSKInggUErYnfdJDkh7UxKcXLR87WpQ8f1
	JevQeVLGbjplG17CFg+SV4QUnIydkx4ncTfi8YcDbaMfDhEVD8yTfmL/yKZCV81
X-Received: by 2002:a05:622a:1307:b0:51c:73f:e3a7 with SMTP id
 d75a77b69052e-5213c9db3f6mr11147141cf.26.1784271708847; Fri, 17 Jul 2026
 00:01:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716171733.300885-1-akkun11.open@gmail.com>
In-Reply-To: <20260716171733.300885-1-akkun11.open@gmail.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Fri, 17 Jul 2026 16:01:36 +0900
X-Gm-Features: AUfX_mxBhDopugmTygQCr_ewrvNPScsxhXpSrlqnE3VeMGuqzfUam913liCneCI
Message-ID: <CAKr_iV4=TAKGb829nXWBBiPkQHo7dFyhT41K7+Twv=VjaEypyA@mail.gmail.com>
Subject: Re: [PATCH 0/3] soc: mediatek: pwrap: MT6589 + MT6320 support
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Flora Fu <flora.fu@mediatek.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: "open list:MEDIATEK BOARD LEVEL SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>, 
	"open list:MULTIFUNCTION DEVICES (MFD)" <mfd@lists.linux.dev>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

[PATCH 3/3] has a bug, I'll fix in v2.
Please ignore this series for now.

Link: https://sashiko.dev/#/patchset/20260716171733.300885-1-akkun11.open@gmail.com?part=3
