Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A89339395
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 06:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792390469; cv=none; b=oxmTDdYN+ndznX9LvmymWM0HWqhIMT2xmwp+XAazuXxo/77OdCcJ93/o5w+vpWq25TKC1SpOvcxTx3SbmocXQLQ4eTOLZ19ZnBSG6evWa5oPzjC75mo7GZN5KvNd5cW6AwCKJIbBzMwrbQFuM/qISz8BkX9IZuPXaPDSY3xnMK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792390469; c=relaxed/simple;
	bh=a4zYuxAOTe5hOZO9exG0p9T3Y5OYZrqCGPDtfN0/quA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SICBriC3UPGpIT27HjDEgCIPdlkIlMgNSmhHFXbvVdV14y1yks/u8Uy3VCVr4G5nCKyEA/uhX/F6Jujs8eDl9Hz9yNck5TNST+HCYr8UR6jM+MuqUcuoaSl2l60cEyOklR7Gs1sznuIVZPB0UHzLm2Y2rC4mryg1qsLgjN9/0HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wwx52QRw; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wwx52QRw"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e0d1da913so1076006f8f.1
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 23:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792390466; x=1792995266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a4zYuxAOTe5hOZO9exG0p9T3Y5OYZrqCGPDtfN0/quA=;
        b=Wwx52QRwECmAS08gpuFlTTY+yO9Ek0YyyZq50YKLVFBgZw+z4Bd7lbvyx9uOPNO59m
         o8cWZC3Rrk9N4HuqZVlXlM8Y9asJn70lttbQBWw9Cd2gpLDc2M0J77BKMfvSW/1FH+Z+
         dHPiTJ14Npnjvo76bbjzWzbPFnvDqCpF+Z6G13x+Oy3tgZ9Vv9THa4V8gr9pTDAYXZkp
         TF7FzkhUoiu+wdspBCqoOf5605dMaCpKut/S7KVswt7bFu2Sdx4qjqz1bsaU8JH3Owa8
         EnmXJF3PJs6k0Q3L+WqZWT9PRnH6srXEUK0mCpnd3tD0qLETvmaSQIS2FXz7dgqZ2dan
         ZpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792390466; x=1792995266;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a4zYuxAOTe5hOZO9exG0p9T3Y5OYZrqCGPDtfN0/quA=;
        b=NoW/QJi2L5ebBzAfFG8zRbnFyBAaYFKSGsDGMLv890uYnzRfYhmIFVQF9fZicz7100
         4j+S8ii5MQ75hv9LSxKe3i70NiWJ7lUE7+2heWNB45uvHcMV2EvqkktC+FW1LL5hVYEG
         1MJ05RPtggwxra+OnhqvQIcpj9EjWu5A6WSCW4ivlXqKvpStMFPry24bTA5X97pT1gZR
         wLAexhtGpQgzx9EGSFu53Ld2a8uhDTWVxth8/OEXtOZ2wzDCObCekFe7inCbxTfqWpt3
         N4YnsDh2+4jHfqIWbKG5/mUk3fiHK6c0Xb015ddifInq2robAWylJdgf2146/+gf85ow
         h28Q==
X-Forwarded-Encrypted: i=1; AKwUvBxZgopDfoXr6L0GgWugIgPPjKv7c0xPINGZX6BNUV8eHxDRqBTac/Pi3F1K9Kzu/cTRW4bliWL9Wtly@vger.kernel.org
X-Gm-Message-State: AFq9FYJ37b49JhyrQsPCis+KUJ54BNuxplauYM5tIiuH5bCcs8laRBQT
	Ep9FO+QF+VnyD/ha+FWDBtZlE3nNJQySXwIJaxKqa/3gqEkxFvW2WKQJ
X-Gm-Gg: AYBFou2jVxYOEwQ3OZDR9QsVqE8zctdsrgaLwyuRNqzoSTFFWBAvQW6Wc8yKXjzRpuk
	NZF0q+O1jtvP5m+TM3jabi/xLbtdWqUTz6Os6fqlF3p7KAup27SElQ7PgHlz9xp4Xs92PMNKqQ2
	w80/bipOBXP21O5grAp0qm5fQeOb0Fdxr0NzWtFfYP95i8lNFKPMJykuCai3FME7arrgoYOC3c6
	/wsMc8H+I92x+Hwpc4EsHtS/pH5OA9/45Ey4lB+s/X+LV/Ksi1ZBaY/ZCK2WZavqCdvpwxNeN0v
	42PUMV5CuMepmumaYRlXeVWzH6q29RrzktvIKVZROjgk7lB+OyehPBjJ23akA/Tyk46rOwEYlpx
	EsAHQo9wUe8ITcBMHG/9YhjiVUl2GneYCwLzcFzngLPaRQ40XaQi8nVqAi3RpfNor6TvcntiqFt
	kgJTR+we4FXJSlLN1ctxhsj57Hh7OVhbMk1pkfdS6YiaxXQSgqVlJmpq9nERWqEIMER3iDrLbnr
	wzpgYxeuMO+OFEd28cn0+9dehG5znmiE26fFMUv3OemPJGtwVsTY3/7HDElYtCjodrNRams
X-Received: by 2002:adf:edcc:0:b0:48c:7d67:8ee9 with SMTP id ffacd0b85a97d-48e07f98e75mr9489300f8f.19.1792390465937;
        Sun, 18 Oct 2026 23:14:25 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ec8dfsm21937786f8f.26.2026.10.18.23.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:14:25 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sergey Lebedev <lsa.uz@pm.me>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add OmniVision OV13858
Date: Mon, 19 Oct 2026 07:13:21 +0100
Message-ID: <179239003370.10232.14441777373870206418@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <366fba16-a479-4e4b-b6b2-7d0dc6ae4fd4@kernel.org>
References: <20261018-ov13858-x1e-v2-0-cd35434cfcfe@gmail.com>
 <20261018-ov13858-x1e-v2-1-cd35434cfcfe@gmail.com>
 <366fba16-a479-4e4b-b6b2-7d0dc6ae4fd4@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 08:03:11AM +0200, Krzysztof Kozlowski wrote:=0D
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>=0D
> Tested-by: Sergey Lebedev <lsa.uz@pm.me> # Surface Pro 11 (Intel)=0D
>=0D
> Did not happen.=0D
>=0D
> Add only applicable tags. Otherwise please explain how this code was=0D
> executed and tested.=0D
=0D
You're right -- I mistakenly carried Sergey's Tested-by onto the binding=0D
patch. His hardware testing covers the driver/series, not execution of the=
=0D
YAML binding itself. I'll drop that Tested-by from patch 1 in the next=0D
revision.=0D
=0D
For clarity, I carried your Reviewed-by from your v1 reply where you=0D
explicitly gave it. I intend to keep that tag unless you consider the v2=0D
changes substantial enough to invalidate it.=0D
=0D
Thanks for catching this.=0D
=0D
Best regards,=0D
George=0D
