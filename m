Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636890;
	b=v/AYsq2VKMNoKXNo+MTk8cLVU/9T/34tV5VrR1zxPQd1Gm7LB866MQznoKk2pXeUQUVG
	 iMZgm8yYSNmQIGshbmBrT9HmfpfPbOi0r7flJlpZZs9386vEXnkN6dN3JDRIf2Ox9fnfe
	 6F3ajcQXP2dIoX0Npt8y2jT6e3Wb7Vl183YyQHTxTt2Jn3fsg8ztDNgPfm2qJu8bbDnyw
	 aymJcL6+b94cJjhjOKt5oh+PIodJdXBP0j+59rfjmj2HZWthgOGB2w4f5FPo2WkwmDWtK
	 6RZV59lZ1EdBMtjwX3vOzknHxHz49V5LT2ACD562Ssc57iOEZPlvTOV/BFfXPBoZ5NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=9JAGDrtifzK74DUHuN7Oz65oLu+qbPYKqrM5bSwvXzc=;
	b=nbYbBns2j1bkBQsNxMCRGUb4DpmV+NGDtgvhVqEno4vlRspM5ylfYQKSwua0SAD3WZNj
	 1RJGOepSuZX9npnGfpFI1MDWToeaw3pzCUKk1LuHHPo15TEVuDQI0AmkeM7tvb4riKJlZ
	 q2aW1As/Cd/mpLqBtOhTWVFFYq9lkYUUjFSBMSp7tLcooPWMlOcCpOwnfZTwK5LYPl3wF
	 aTHb0jsGytjlopzOYs7VMtf+ohcOxJS2QYTQEQQoUplw6KR6hoYJuwi99lOnIwOXSozfs
	 gmgbSB+FqnciIqwUPu0+OIoS4jk55T5WVjRo2d5ToRJXDwPelPi5fKkZczlxjr57yWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=raAkVNO4;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB27D606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB27D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=raAkVNO4
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso63570025e9.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636888; x=1796241688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9JAGDrtifzK74DUHuN7Oz65oLu+qbPYKqrM5bSwvXzc=;
        b=raAkVNO4Bu1WztYhIBmVvQpMBnofkYMiKZigmahalsSA/4U53tlY0F3DFhooSH9/rP
         9JlkM/3OZ+M54Qx6tNB2qSmW+W2wZ7dTXEiaqwMTUZd7rL8oaxRvpmajSP3Ve6dqzUVz
         SxzIdG+R8feKpPR+Q7L/HfKIsmxexDgQJm1NCKS7XqTwGm81dshgzFGkiFSKp2z8Lmps
         r6oB9RdorlsA/iVd5UbG68sEG6Hb9qZHiVED0sIwTrE1fEBtw+FBhNJC/yP3ja5gLWHq
         Yd0C37UtNBqBubd4AzKbctlXMwiiVb3wTAQ51yy/UzzUtQvP5atRB6Ik49fiEZRHXarT
         Q5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636888; x=1796241688;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9JAGDrtifzK74DUHuN7Oz65oLu+qbPYKqrM5bSwvXzc=;
        b=MeF7aAPm/sGCslPPtuKOJ+5Z5KFXar7niGonNloBUXMdPelJ3+ZIl4Fnjw88ynJn/t
         y5ZhWL3wjzisWXkZ8xFyusUK4+twqqCnidhQd5kOKIAnLbmqg+S+SPuAdmz4u8yGSOMC
         Eo8VazziAHgCdVQBzaMP8OC8iqc9Hm5aTiiuvcNHizjfvKC1q9SZ4KbiXplhIw93y3OC
         Vx2neDOxfoH56lHxerMnaujJV5K/yhFdr4Vg6fjL1bJP7tgfRJo9M68OCPs43pb49t8R
         j1uvSbCm7P9DvwUT+4Qp0keVbYRZE12XdsBlO96kRZLx4P07xh20+dcWMApdb+5oG0rI
         cYcQ==
X-Forwarded-Encrypted: i=1; AL+hErHQX84YdHZtThqpEZgsM+PitGgjXbhBsB92PLbvFKVLuFw1z5Zk+NCbiI9Px4JhfJNfpIDqDp8tm/yG@vger.kernel.org
X-Gm-Message-State: APuU4Z/mpenXuATlLWLPp4GtpnOX8AWE51ROuTKzHpjM2rRWH+oWqUXM
	i6l/yfSuuMEUG8J7xEF3D/40lMo+kOuFFd3+QTFhZgyHP8KV/pxOd0Qu
X-Gm-Gg: AZFdTZcn0o7+xD2oZ82lLdx0EdtyJy0lx+LCcY2jHiNIAqYG0MHo8NHLePmwWm1KjRI
	7To9gAX3RIneqHFfgEQTXWiW/1Vpv+hm8UOQCkOLurpwLhKJvCAMVHtGGNsPfsrsATmJlqyuTgt
	Hy9Xri1e4tfAxHz7oW4FY8EKsotvwzoQsQWUFQprFHsWcQRUVK6tqw5oIkJbgEXbk1H2UCRT4cd
	ll/cJjqVwxvHTYBT7dXJu2Ezmp6KaixO44Uxy6X197/kMZh85mKt+lOOsGWgyBlP0NB1ejnvipy
	CjjJf54/ksDGmfuz0dI5byX+a+myGPYoEBqgqZ5x6A8CBkvxe3o1xBS6I9K8UwuxEnBlA84FDiX
	Jp1r5lkr9vqz29DzweTdKlwy2D5pWWmYqn5RZpXdccKIUnfTHA3Eycd7t4qowuiH9RfWdMpF9Qa
	ZQukXXwfXuDw4d2UxQIDaoxXPyFg0236LocNpPtAyoKRI+9g/m83zGe8ad/yJ1u1kIXI08gOWgK
	Zm8lszU5dG2PGgPBMPqOa9eMCTano9F5k073JPogZ1SX31x3d6kUDHb3/Yh5UdXfvSxtlCfvtEI
	5eX+5OIPF0zBf3ijFOSgS11SPRcR64egW+/H4gc=
X-Received: by 2002:a05:600c:4504:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb887fc396mr389875865e9.3.1795636887762;
        Wed, 25 Nov 2026 12:01:27 -0800 (PST)
Received: from ?IPV6:2a02:560:4e7d:300::a1e? ([2a02:560:4e7d:300::a1e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1001738825e9.4.2026.11.25.12.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 12:01:27 -0800 (PST)
Message-ID: <68a8dc53-9eca-412a-8098-3f69cd7ab95c@gmail.com>
Date: Wed, 25 Nov 2026 21:01:25 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andre Heider <a.heider@gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
To: Anand Moon <linux.amoon@gmail.com>,
 Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Junhui Liu
 <junhui.liu@pigmoral.tech>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
 <awS2-clBenE1r1a1@aurel32.net>
 <12933da0-9bc8-4f92-96d4-36c5673d3f5e@gmail.com>
 <awXUSuYOUQMPCl-5@aurel32.net>
 <CANAwSgRf0XpWnyDaoiGySFv3NPKCBYn6BODf1M+P4w58BF-duw@mail.gmail.com>
 <CAKyUbwUyYptzZrMFKD-RjmufU7Wni8-w5vQvPyxUgx9BU++vsw@mail.gmail.com>
 <CANAwSgSNuEC72PM=1ai3xj31+=veLkDhAfuNJ3pmCggBtx9v-Q@mail.gmail.com>
Content-Language: de-DE, en-US
In-Reply-To: <CANAwSgSNuEC72PM=1ai3xj31+=veLkDhAfuNJ3pmCggBtx9v-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.11.26 3:21 PM, Anand Moon wrote:
>>> Apologies, this is a different issue.
>>>
>>> I am currently working on enabling multi-DTB support in U-Boot SPL
>>> for SpacemiT K1 boards.
>>>
>>> While investigating the board detection issue, I noticed that the EEPROM
>>> on my Banana Pi BPI-F3 does not contain a Product Name TLV entry.
>>>
>>> alarm@k1:~$ sudo hexdump -C /sys/bus/i2c/devices/2-0050/eeprom
>>> 00000000  54 6c 76 49 6e 66 6f 00  01 00 20 24 06 fe fe fe  |TlvInfo... $....|
>>> 00000010  d5 52 bd 2a 02 00 02 23  0c 39 38 61 39 63 33 61  |.R.*...#.98a9c3a|
>>> 00000020  32 62 64 34 37 fe 04 3b  e3 ff bd ff ff ff ff ff  |2bd47..;........|
>>> 00000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
>>> *
>>> 00000100
>>>
>>> Although the EEPROM is readable, the missing Product Name TLV entry
>>> explains why read_product_name() returns `-ENOENT` (-2), assuming the
>>> EEPROM read and validation succeed.
>>>
>>> Consequently, automatic board detection fails, and U-Boot falls back to
>>> CONFIG_DEFAULT_DEVICE_TREE, which may select an incorrect device
>>> tree for the target board.

I encountered the very same issue [0]. The BPI-CM6 doesn't have a product name in there either, so we just made one up and wrote it to make the detection work... [1].

I'd be surprised if the eeprom is write protected on any board, because the vendor uboot contains code to write a mac if there is none. And I've only seen fe:fe:fe... macs so far, which is the output of the code generating one (iirc, it's been a minute).

In case it helps, here's my collected notes about the topic:

musepipro: commit 6bc75cfa56e885c2eab80e215f0a610075505846
     TlvInfo Header:
        Id String:    TlvInfo
        Version:      1
        Total Length: 58
     TLV Name             Code Len Value
     -------------------- ---- --- -----
     Product Name         0x21  16 k1-x_MUSE-Pi-Pro
     Serial Number        0x23  17 BPMIMXXXXXXXXXXXX
     Unknown              0x41   1  0x02
     Base MAC Address     0x24   6 FE:FE:FE:XX:XX:XX
     MAC Addresses        0x2A   2 2
     CRC-32               0xFE   4 0x395ECD34
     Checksum is valid.

r2s: commit ac436e6879f5bf25e971d80f96f9392b61ff54c6
     TlvInfo Header:
        Id String:    TlvInfo
        Version:      1
        Total Length: 38
     TLV Name             Code Len Value
     -------------------- ---- --- -----
     Base MAC Address     0x24   6 .....
     MAC Addresses        0x2A   2 2
     Product Name         0x21  15 x1_orangepi-r2s
     Unknown              0x41   1  0x01
     CRC-32               0xFE   4 0xE5A74B18
     Checksum is valid.

cm6-io: https://github.com/openwrt/openwrt/pull/23231#issuecomment-5943699070
     TlvInfo Header:
        Id String:    TlvInfo
        Version:      1
        Total Length: 18
     TLV Name             Code Len Value
     -------------------- ---- --- -----
     Base MAC Address     0x24   6 FE:FE:FE:XX:XX:XX
     MAC Addresses        0x2A   2 2
     CRC-32               0xFE   4 0x9775FAA7
     Checksum is valid.

f3: https://github.com/openwrt/openwrt/pull/23231#issuecomment-6339373545
     TlvInfo Header:
        Id String:    TlvInfo
        Version:      1
        Total Length: 32
     TLV Name             Code Len Value
     -------------------- ---- --- -----
     Base MAC Address     0x24   6 FE:FE:FE:AD:18:9C
     MAC Addresses        0x2A   2 2
     Serial Number        0x23  12 0ca91c835b74
     CRC-32               0xFE   4 0x85C81AEE
     Checksum is valid.

     also: commit bfce75e2345fa1ecbf046e696994132f56d6db1c
         no product name

rv2: ?

milkv: commit 77156216f1d0f57e1cfce3452410db20468edca4
     only a product name

[0] https://lore.kernel.org/u-boot/d1a8bab8-4d88-48f2-9ddb-89e8c0e323b8@gmail.com/
[1] https://github.com/openwrt/openwrt/pull/23231#issuecomment-5972395785
