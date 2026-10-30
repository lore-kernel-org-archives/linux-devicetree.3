Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334403;
	b=u/15+WJh2i9KqG7/PNUjqlubdZJp6+rPMRvqE8Anhme022v+mHMVC6zaHs+t/wxCJXES
	 P6uMD55j3xDjXqV7XsyUWEG0kuEJGKcLeDeaLrFNawRB7ja6Hew9/A5ovp8JbL/InEjXi
	 x/GITfsN96AYv9e4Tp7TXhR8L/1UdI5mprZrTGiITp1K3O5SS4iVL3RbCcDu1PrvQu5wu
	 CE/i+dtMmXZst8eAjfQZiQcSG3qXBZnZgN87XBgvss3IZD7Itj50n6PBAZJNgSFq6XqUR
	 HBofkg189seeJ/WmTSBhcOJfy1uK3H7DF2LwQOHcO7svjJUt4dfsqTtukIKi3dKKuVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vjV3ThcETJTQohEswOVEipA/50M6i7Rw1D6pUxeaH6o=;
	b=Q1HQOwm2KKM4xYmd9G68bwIYlNPnozRvvUXuU+fLmMGbrgPx/wKVxFC+8dcqmX0m0jsn
	 ISKj/wRQv/CurrbSe9KWlrqRRo637Bn5uBiq/6HD038/kTsZJ3dwXkXhUFTJnYufVbRLO
	 Hdcy8BsSsyLROrUjtwNzaYgu5uARozUTV3jxZ0V15MRebtYPQff3/FYLp9fgsCHK6ORsC
	 tGlO1JjQV6zkaXtl1lne6Kctbw+hQB8WwvNnV5JivvCMGclyTSjgRfmNnYBxxxFxNyGYc
	 DaVT8GxAkVeel5o+nHZZaUYEHVcXfAk2xAuIK3e6UwwH4+7XsOa2kyuOuTFWtRPmvyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OOGfl08i;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942EA606A320
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 04:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 942EA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OOGfl08i
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e8246b13cbso2756745ad.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 21:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793334402; x=1793939202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjV3ThcETJTQohEswOVEipA/50M6i7Rw1D6pUxeaH6o=;
        b=OOGfl08iTrDcSP5CRoXDmSVya4AolyQdAG5OWHgE9ofXhHL55pCqAnLRy3QOWArl7Q
         waeVAr4qZkWUShO1RmfxQqhrxoPq/ZSnc5SpnwuVgdXh4uUo3uTMWH2m3jGzBhUOoKFx
         piwI3wn6MAqmd1Jhykxn1EE4vgfRhKxFaW6GtH8BDqaTg6lhfH+PQ4OKYqKo0UaA/SHn
         G+h4ly81vQPBO+1raeS2XxMsGTShwbFSSrem/WohBifnUltiwlf2RuGeIQYnhL9m3Aq7
         m0V3jj7XEILRpMI0/2a20+1yKez2+/pkZAsbweZ62X9Oq2XkzL9wOS2u7ALkWWYDls5i
         Qy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334402; x=1793939202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vjV3ThcETJTQohEswOVEipA/50M6i7Rw1D6pUxeaH6o=;
        b=C9U8DsIQyrs2kdjEDfp2YrU2J9MOktmAsN1u4d0RfjlvYVV7OdBse393aJJ86NVg/I
         7m7SuyZ9Tx1p3vPD/W+fFHGDzWb11y0L+lOIdwnrqO7wzpn/VYdIeBa7hRfutCPc+0Cu
         PugquKKPamI9AxgAiG4Sa3WW1ybR1Q5Fpx/3cfnnY2VJOQ4EGMnlo8FVKU42y1HVcmAY
         4NQRHh+vkJXqBqBJQopygxViO9KWb++9gd22MUs0vRvM3123IbNHJU4NLNz2RzwRxqBZ
         7XZx1fMrWUJia6l7E53rL185i1YgsrIthL1PfBgomO2myqsSD3gN9pEYujBROWFkEeU8
         e0Xg==
X-Forwarded-Encrypted: i=1; AKwUvBzUgsW2BpseLOMHiQ5oHo5YBvVx4Qhy4gllDaCnpk29SiP2L/Fc5EPDN8h0D/JaNPbI7obwb7/BQTl1@vger.kernel.org
X-Gm-Message-State: AFq9FYKI6FbcBesalc5k0d74rZ3dFRSa5iwH32ZkdwflNFBR5f2Czgjy
	jjLbL4HHgvgdwxiRXHTIMVKrSR/yEhS2FnrCW3/Bp6nhtkw/IGMP1ys=
X-Gm-Gg: AYBFou1sxyQwk+C1pum2ZYxk9xRSL5O972E8tyjlBTeirmug5U7hCi6r6KlpUkNvF2V
	94p/VwuVGIWiNivr8ES/yMzzgXU3EvoacRczbfHzF2XEnwHS8VHSHhrBDQGU01jYaRbexoEDBT3
	OYQaQ9pARzvWskhoRL5YUU/AOF6JmvfGwquKe6ZpPVbn5UIJHh+Z5hzgHIohJnCHXm4qoAcGhfw
	vqa8N+axA7rRJzUQf59Q08JRD+Ge+k8OOwTLifDOCWGwQAWrrv1iGvVXlQmeOp/JzBA89ZvWImv
	lY0cdeLEYon9eqJ65NC0QxzBnJ8kBZmfXZf6iFMqaTI2FGhVplNRJn0grJryIfxe8xyVzNh+88H
	B4Wy3FXJmsTqzNFU+1p50qA+y0wmSCH0jFObfC7o9j4nW9ACmLezz6YK4j+XJfqZ1dblX3SY1At
	ao4etneXa7s/krF4JQ/6Y8zjOgqRV3YqjzndZr0xbEHi+PomTl3hO4+wGp7+DLa8I2+1G+x38R9
	uXfjo+dB5xmv7xnhJaY8bjvu1zvUqwV0a6axcwry3PaDc1hKGVJcEBJ+JmQiYtDiFgPD9BIVpps
	NdeQiIIB21Hrs8FZga9AZgUZLuyI7uqykaEWZGu2pjyqVDFUUIIApUzQZLJmZ5UcJtAa
X-Received: by 2002:a17:903:faf:b0:2e9:5eee:e087 with SMTP id d9443c01a7336-2eb364e553fmr13990205ad.43.1793334401915;
        Thu, 29 Oct 2026 21:26:41 -0700 (PDT)
Received: from freddie-kane.lan ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922fbc4sm1965845ad.24.2026.10.29.21.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:26:41 -0700 (PDT)
From: Burke Cates <burke.cates@gmail.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: glymur-zenbook-a16: Add Embedded Controller
Date: Thu, 29 Oct 2026 21:26:27 -0700
Message-ID: <20261030042630.2744339-1-burke.cates@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261015-topic-asus_ec-v4-3-af6305ffcb10@oss.qualcomm.com>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com> <20261015-topic-asus_ec-v4-3-af6305ffcb10@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 15-Oct-26 10:55, Konrad Dybcio wrote:
> The Glymur-based Zenbook A16 features an Embedded Controller running
> custom ASUS firmware [...] It provides keyboard backlight control,
> additional temperature sensor readouts, fan speed monitoring and a
> number of miscellaneous functions.

Tested on an ASUS Zenbook A16 (UX3607OA, BIOS UX3607OA.312), on v7.3
plus out-of-tree Glymur platform/board patches, with the v4 driver
(2/4, now db3a9dddab5f in mainline) and a local change that leaves
the keyboard backlight to the HID driver:

  - The EC driver binds from this node at boot.
  - Both fan speeds and the EC temperatures are readable via hwmon
    and follow load: under an all-core stress-ng run the fans went to
    about 5900 and 5100 rpm, and both fans and temperatures came back
    down within a few minutes after.
  - 115 s2idle suspend/resume cycles in one boot with the EC bound;
    its fan and temperature readings kept updating across them.

I didn't test the EC's keyboard backlight control, because of that
local change.

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)

AI coding assistants helped run these tests and draft this reply; the
results are from the hardware runs.

Thanks,
Burke
