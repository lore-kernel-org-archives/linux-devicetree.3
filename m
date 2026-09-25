Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99EE46D551
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 11:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790337461; cv=none; b=lJ7V1P8tEWKaEutJBAJsFrMg91PYifs2ThBn0wR4Kbt7admLcJNzIu35Bez2I/EhpYUYIyTkn06rUi12XIVt3sbM4ypUIEBDZ487dvciVTJ2QB4SadpePz0ff+VzIXcaPN+2eIm1RpLvTBqYI/Vb+CMu9+orKaSUPmXN3VjPfpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790337461; c=relaxed/simple;
	bh=3sBz5itLxvYcizrO6EmJQbxte/QAab4/sZ9LCRJtS44=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TPEZKNrArpq9gMzb7FWoXzsb7tPFMsmbIVs5wc+bzVfCGrRpZ54IzxsiOqxr6iYxQenuFnUi6Sj3h2FVlAOPNzOlw5yWmxLsQ3lOmGK1YK9P5YkNNjqLCyCrW9Sdd5AGBwrDP2Oa1mPQxufXZYYgtU2pYM7AEKagjYdmMvZfme8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=C+rvW4OM; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="C+rvW4OM"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso5897595e9.2
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 04:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790337457; x=1790942257; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5thDTrl5RosAFyFRItfmsoZ22T14JMex7fuHBweSFQg=;
        b=C+rvW4OM2PVYkKXlH8U53HXxsGAZe5R9er1qJXue3btnBrhKsbCTG2VPFMSTRekqbK
         o65NEYNtfZz3HkEl3v8vlKTp9xcKb5qHFRwfpfONdIeibXqnB/Dio6jhdL0TN4LD9xwU
         cv2pbUPx3R9bWtQ/+qo0S39ve9jbCE/p6LZhoBBRsW1PbLeve4p9agK4AP8jqYePV/s4
         mx6sccJzvw6nLhx0lTaFa7JqgWZv69nKaHDY11Y7nNOE9ztGMibGcL5nsocfkp4wnib1
         SapuZ7BSjW5FuPDXip3b+ZkOiZ/TFa9PT4dQFMlqBWynkgyJ2dx5pZj6GcT23XTitFn2
         wv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790337457; x=1790942257;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5thDTrl5RosAFyFRItfmsoZ22T14JMex7fuHBweSFQg=;
        b=RPmzkgzvyx1bpZFpuKrGS3/pAiN5uTs9HQ0FaZV87rOshlwdQ3a2ydbpbgQ0Tm9tIy
         pqfVrUvrT0pYgzjEXbZLK151fwYFicMVceGDeC9MbpgQQNKF9e/lLswAjlYvKhySFh8E
         ex+i8WvlvDIW2sKt19r6gHIlD6+IgaUrcn4++ZKAcvJOY43kmm2PeLVCpwoYuiYKEI82
         c48PC6VKdpsO21FmWzkU4KWZP1/Az62LoB5QHGBIKVuSvWUNNIhdtdEojXftYtSgaWDU
         tb8EQZPMGT66eANibV1GBo+oHCuM917ft6EgaOTmFWd8H1L+dak5Yzh7LO+U3f5oIaNO
         yjDg==
X-Forwarded-Encrypted: i=1; AKwUvBzpQkyK/k+YDwpnhS7DE1baCaC2k9Jo27cJ2PNj1PSFDOR9Zm1sJvsEUM4G+YGVx8jtj1f9RQck9wjr@vger.kernel.org
X-Gm-Message-State: AFuF++mEHlXorQ21SbHgmhhAHikUeW/1kmVPia2nrcvcGjKNuDGJdbCD
	f8FrGCZwnD/9cpTaCReMaHX9w/QUDtYW1FnXvUZfbCEAcZHW9JWr1tBt7Fnku37w+n0=
X-Gm-Gg: AYBFou214CvbXOM338LMGQ+rcYlMkVL1pCcHtAVfNzH04XLAlTpyUwG0tgSAnk5fALm
	vwAlWjlrFTrx7rZ3ZOPCnBcjkSq6CuwbtfHkd97JPMLhJCoIB8R4o5EBgjdretLhVIYk78ZlCke
	nsdVEvyvog73tVHkNk6D5Zzsr4lgknL2Enc6la78ZvHgoEM78lEX8hP4fE9SWYAqN8/rzDtxvQM
	+a+Wk9jxjowDeLezQNN618q41KdmgluCJrf4ZBLGx31Up3ceN/vvaPmvUI0djw1l3OlwISuECiO
	YnyOCYaPUwX8hApgJ3U//60DZZKm9I09vgwL8ZKV/S8giM6M2Y9RfFBwFvHZn+9HWcA3AlAsWj7
	XSeIpJnv5Il3JCQVdcF03HvO5+XGrKPv8pPgBINFxQ4kuvN6XAcZqI9NDVcB/Y8/7Rz8PjOpiH4
	sW6MS3xesF23F3IxxDfVa4FFAIrt0EhwSdoWwwZc2ZrciYAUkcM1iFoQNss+RVZIIilTk9KJx74
	nTmoC3jIB2lv4a+KA==
X-Received: by 2002:a05:600c:1991:b0:49f:d6b2:4dfa with SMTP id 5b1f17b1804b1-49fe66c5281mr100026865e9.4.1790337457289;
        Fri, 25 Sep 2026 04:57:37 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff141948dsm22732155e9.1.2026.09.25.04.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 04:57:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, Vyacheslav Yurkov via B4 Relay
 <devnull+V.Yurkov.EXT.bruker.com@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri
 Sarha <jsarha@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Subject: Re: [PATCH v5 2/2] clk: Add gpio-locked fixed clock driver
In-Reply-To: <39fdddbf-0fdb-40e7-9cd5-c8f857ee8b9d@gmail.com>
References: <20260915-feature-clock-guard-v5-0-42ab5dc3a6aa@bruker.com>
 <20260915-feature-clock-guard-v5-2-42ab5dc3a6aa@bruker.com>
 <1j33vaesh7.fsf@starbuckisacylon.baylibre.com>
 <e697d892-fbd2-432a-b71c-8547ead22ea0@gmail.com>
 <1jtsnpcn8l.fsf@starbuckisacylon.baylibre.com>
 <39fdddbf-0fdb-40e7-9cd5-c8f857ee8b9d@gmail.com>
Date: Fri, 25 Sep 2026 13:57:10 +0200
Message-ID: <1j8q4p8rxl.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 17 sept. 2026 at 19:05, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:

> On 16.09.2026 15:57, Jerome Brunet wrote:
>
>>>>> +/* We can't enable the clock, but the Common Clock Framework calls only
>>>>> + * enable() not is_enabled()
>>>>> + */
>>>>> +static int gpio_locked_clk_enable(struct clk_hw *hw)
>>>>> +{
>>>>> +	return gpio_locked_clk_is_enabled(hw);
>>>>> +}
>> 
>> You need to explain your problem a bit more because this is not OK. Your
>> clock should really just provide .is_enabled() AFAICT
>
> When a peripheral driver uses devm_clk_get_enabled(), this is resolved 
> to clk_prepare() and clk_enable(). Neither of them check for 
> .is_enabled(). Is that a flaw in the CCF or expected behavior?
>

.enable() does return an error on failure. It is up to the provider to
return one or not. In your case, it will be probably be necessary to on
the gpio a little.

Note that if the GPIO can sleep, interacting with the gpio must happen
in prepare (think i2c gpio devices)

>
>>>>> +
>>>>> +/* We have to implement it, but we are not going to control
>>>>> + * parent clock selection
>>>>> + */
>>>>> +static u8 gpio_locked_clk_get_parent(struct clk_hw *hw)
>>>>> +{
>>>>> +	return 0;
>>>>> +}
>> 
>> Same, I dont get why you need that. Not needed if there a single parent
>
> This is a remnant from v4, thanks for spotting it.
>
> Slava

-- 
Jerome
