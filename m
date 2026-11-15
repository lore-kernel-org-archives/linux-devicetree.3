Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794703711;
	b=ubhSYoZEJiVnIkvfezmQt1vx50gv6US9vLhSMEvqX5N30HdC0rOuqvLM+/YCz4GbteE2
	 2VSyROFZgGxSxjV38IqSLhZRiTDBXi4MNs8PxDnwruBY764aTzf1PTH4TijNrW1CjEr7V
	 oJ2YcE6aISfy9+c3yABC0nwP8RicW5nVZWh2DSrcgi+c5nOEFgqw3ItaqgcfzDzAnbQ+8
	 9iR0mJhbESqQ/Cgu/7kfXpJx4vTuaUEjJQPXpcoUA9KDegOmI2thk2nrSLpQK0r8dfqif
	 NWwEGTocHzyxOYLaEiOcqPyUj3No7TwAgl8hd/PpJOau1gpNuIs899hJ0npCkcHWPVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794703711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GNCaXsk/Xt/PN42cfY6qixho/TvY1Q+vI598MxtapPE=;
	b=volI2aBqx1/JlWg09A+NTIng4sjM6Wf8dNi3blw6a33q++qWvtif08T7bDJVPG4M9p2j
	 4Y0vn2aF3RU76rTpPUUIo/9JflCMM4oi3FZAF0AoF7/2jogiVEFZqGvSoCB8TJ5cWw3Lt
	 82kKZPEZiLFBCi5ExtIhP1JX8veah99xjCkvd8FTx78vRnX7snGFOP+7QuZp/vgGcZ+84
	 xWrOpp21eKPUkK7KQiv01T83dl60U6Kf6Ln8UASdOuAN7ELUTXgN+OSMhZ131f3/9EF1a
	 Pl44kUMIre1fasOnYodGtFGF/58940tjYmGztczNiJecVFaeg3eFQJgK1dYmLeaSWdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMcqLdbV;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F351B606A323
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 00:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F351B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMcqLdbV
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b570ff3dfdso2377935a12.3
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 16:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794703709; x=1795308509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNCaXsk/Xt/PN42cfY6qixho/TvY1Q+vI598MxtapPE=;
        b=DMcqLdbVjGQlExaBwxojv82/j1Te2Q8Gs0X17+IG0qyDhCFq+1Nt0dCxNncZ0loGmW
         ZfI5Ao6vE177C6wnSiZfUM7gpK6TuV+0KHsIWXhF/pUoR/PEaV8i6FwFa8Va6yqt/LHd
         h4CEm6Y8C0QXmF+mbfPCvi3DAy7buSqHon2Fx7W1oNtPLWQF4dvDeGIiU8u6lhB8Pti+
         pTIgV5tBB/eUMPJUVssMgjiqdsIAR0Wbd0u+0ec3qtj9TxZyDqlxy9VfCEv1GId/mNun
         1Mml1QtgowP/lu9GKK8iFct9z8Y0WG9Rl7uCqfPiyT2DdUYnrbgZKrSzwm5A3UZj7A82
         ZHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794703709; x=1795308509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GNCaXsk/Xt/PN42cfY6qixho/TvY1Q+vI598MxtapPE=;
        b=st5d4lZipagN/bdk1lqLX9kOk4JP5OT8TH0nJXDieYRUKqnNaCvwhPio6ZAjJxt0nO
         OoGx9LXNYAhi63ohDPL91N6NIZvJIuPXE0awsxHoXUX/oUfsgczABSV2fggtxyn/n1r0
         uJnaglzB0Z5+qqa1LhwFurf1zAdyv1rvQd9zQiMzszz3C6Il7oZKJz8YJeLIdPuPPw5F
         2P1S5tCXRH+q5Prm1NoR63jUDUBX5DmUVST1+6c38jo6MX0CAgtwQnwPDiinU3BAWMMH
         lrBfvLUjpURekxK7LBcEl7jxeD5hZDyio5i5AHbmaQY0wL9IyOoz+5C3flRzm6Yi2iPU
         5h3g==
X-Forwarded-Encrypted: i=1; AL+hErFy8zgq0hrOScxTfrQLDjvIqFnk812tmEf56i0JpeVQEu5VB/cBO+E2zuTdoUr18HnYZeHp/TcZpgCQ@vger.kernel.org
X-Gm-Message-State: APuU4Z+p/jz1LUy7CDAjr+t/ksvzkAS4XLRT+8yvI2pHGfeOwtR/hLH/
	LKUOujcfq3cLlFQNI0eanyCqBjYRYolYPAYObP2MvtU+8VOjK13datE=
X-Gm-Gg: AYBFou3MIwbecUObMi2Hb60z4Ftk0aPPoqNAlDJij5FuJTNzW/Y+gun5/CRZ1fV/HEU
	iCMA9fSZeYCSIVtsUsJjA8xBryM5tpILR89WGGLV4Dmul8GUpzuvI0ILE1JnINKbfVhtrdm7//i
	bOV/WYeuD5RumElv5OP5k2Aci/QbJrLel+ZCdpYu8Z5SCZ0PdSWNIgUJ793S0wRoxvVNHr8gKIx
	/J66Kf1UBhce5l42lc2YHjoVjPRji5ybzdbkBmo+GSLlY6Ma7wzH0dv5otbSxBuoM0ouBOQUSJ9
	HPy7Shiior/cIj5p0qU78M1Rb3DD8qQZjqb2QA0mvC7+M2ZnFoHpSA/88ixu+Vg6rCiqfBYmPhg
	zd9dz7gCfq3pM6tK1Zy28z3AgeAN6WjQDl1Ti+9UwsJn1JHWPPEeNk9rhIYR6c/XGT5KYO2kf4v
	LujCJmO7eka2G8B02cGSA7WtynCtyDju3wmPL1m3U8HZ4W/thEcr+AXoa6PSBr6O1+opHixIKvs
	BVhoEliGk5Q/7NZg1XPfAnZZw1ozuyzww1a5XruRQ5ydsE2DhDbTY8mPL4wRBdYiHaJfrejNC6J
	qeVnOEVsDQ/EQiFWY8zzLxZl4lgDVxznAvXsHLrbOVkgn4gWYu3JBXoQMZCRrCH7AEywE0GF/j5
	ZPCYSoHscCHss1Oh/5rlb0Y5C1qvGvpX4dJJS
X-Received: by 2002:a05:6402:a513:10b0:6b5:6ba3:5860 with SMTP id 4fb4d7f45d1cf-6b7c0c12b08mr3317211a12.17.1794703709333;
        Sat, 14 Nov 2026 16:48:29 -0800 (PST)
Received: from sohrab-omarchy.taila18b31.ts.net (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23dde49sm2857574a12.23.2026.11.14.16.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:48:28 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: admin@mswin.me
Cc: konradybcio@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	amitk@kernel.org,
	thara.gopinath@gmail.com,
	rafael@kernel.org,
	daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: sm6125: add TSENS die temperature sensing
Date: Sun, 15 Nov 2026 01:48:24 +0100
Message-ID: <20261115004824.395133-1-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <a3f071d3-6082-47a1-bb00-9d8e72fa3cdd@mswin.me>
References: <a3f071d3-6082-47a1-bb00-9d8e72fa3cdd@mswin.me>
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

Hi Roman,

On 16.09.2026 10:16, Roman Linev wrote:
> cpu4..cpu7 are the downstream cpu-1-{0..3} cluster
> sensors: they get #cooling-cells and per-CPU passive cooling maps, which
> stay inert until a cpufreq driver registers cooling devices.

I have been running the same TSENS description on a Mi A3 (laurel-sprout),
derived independently from the downstream trinket DT: same TM/SROT
addresses, 16 sensors, SPI 275/190 and the same sensor map. It currently
runs on next-20261113 and the zones read sane values.

I also have cpufreq-hw and CPU idle states for SM6125 working on that
phone, which is the piece your cooling maps are waiting for. I just sent
them as "[PATCH 0/3] arm64: dts: qcom: sm6125: Add cpufreq-hw and CPU idle
states" (you are on Cc) and left #cooling-cells out so that it does not
conflict with your patch 2/2.

I could only find v2 as a reply inside the v1 thread, without reviews
since. Did I miss a standalone posting? If not, it may be worth resending
it as its own series so that it gets picked up. Either way I will test the
latest version on my phone and reply with a Tested-by.

Thanks,
Majid
