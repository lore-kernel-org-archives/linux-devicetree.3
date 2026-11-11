Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402309;
	b=TaRQDuTs406VyarfV1el1ikhbl5V6H4fMjUvrn+1zQC9WXmamj3G04nXsElbXkFVG8Oa
	 3u+ZLfNp2tXyLHQH4blqF334RibFkSQaZLA5bGioUSFAd25Z/6aQ0bed1J5rsAv8Dwlb7
	 QAMwJ9pA/uq6evJU+6kIQJJWqLOD02HlUcm5ZXq4utnRaTWudXrRIihFuxjLJAsx4Cz++
	 G4fCjhs4gZYKVQPMJlkI+KxlfhYdWwwVKuVaAyF3Gih5+RQbF4ZC4URkxC5vnXwasbjyz
	 yASgf5AMs80L65wsvSlhCmMyyHmCJR5uLxLnV1OHmDBJ8zb+IPTa91YzogFDYxCUxLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bABV6fQnxTbYBuOpfvxRsB4J5GPWk4qJ30CGSqwapjk=;
	b=cjv8FSlF1iUJV2vPnOQ30P6mTO5gVDpe48FzL8yZzVlP7bjf35pCeFTKOp60x5WsM+rf
	 IlRaZc0XOjTONC1UzP1BSKHnLFeKN/FNnGg6FkoirzVQs9gsc3j0P//5JTkv0GkXfV6iB
	 s7StEFHWb3l5ieLP6gSdKDjm85xg8BkvOG2YWOvEbMLMXNtILEWzkn6RkdNlwSovt9VkY
	 1zrRvTg+pLhBFns4Lo2cCWuKuXttm6OQRrB7AbXNjKoroTJoybntjgyt77wU92KXp6dAA
	 bBtwStbpcxR71fdkrrGO1Fd6/soQx+5Gnn3USMPwkS0ZbmCKFHaYE9v2zN8x6bmlM6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GJRvG4u6;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFDB606A332
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FFDB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GJRvG4u6
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdd9e925075so469833a12.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 05:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794402309; x=1795007109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bABV6fQnxTbYBuOpfvxRsB4J5GPWk4qJ30CGSqwapjk=;
        b=GJRvG4u6JmnxyKRunZJMpN5W0/I5srjqR/vnnk+FNmYkMf8T9fU3sM+5nfcCjaaJh9
         APVO577+MOvBRkZfYP35NuRjmVjLZcr3IwUa4CQfzVsXD2+ZxN/COcGckwERwXG5QUS+
         BsQIHbWdILe0Ew7RUOZaCvEPNl630qLxkdeczLRrHwzPAGvrcuSyHddvuNUEo1wLGwMS
         08MdvMAxLF0JXzK34p9PG16iNsIx301LkCJu1xPa3OD3G3FrjWUg00krj22i3ncGa/nX
         gYYgw8IbMyyt4R+S7OU73LTMewRyXAYJa58yKsjWmQ+R3X1pf07FkulvHFurQCo5Vspo
         g/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402309; x=1795007109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bABV6fQnxTbYBuOpfvxRsB4J5GPWk4qJ30CGSqwapjk=;
        b=UR4Ncdb3bfwdY5uE8mC4RtzSlnDMcLBF2576KWOXEjtKLFngGrMbNcemrtygT4YiDw
         u7+hFzHJaEy3KRKKkdZ2rXmyuuqLw5DUWaHx4ssDsPpIFTRPeUmnif8KFzrmDdvDAxda
         YStYYiFLZaKzrktgEXW7WkBzRbuMJrUCZJ/uKEAZqCO05mB3QbHJ9GNlEr7tpLAxqRAc
         ffbjLB3gVCajAb37oyNmR4/dJYil/j465C/qm3hTpfvwte3gJdfOUo7dG+COiShEZBrh
         PtNu5dwc7+5O+QhYrytfxqXh5SHtzIAYPwMqUtGV5NiQC5bSwTc/7CTO3RDA9P/a6VaW
         bJuA==
X-Forwarded-Encrypted: i=1; AL+hErEnJBRsH6W8AFfD3EU7b7sU8q7E/SGIkC+JeFj0FVvFCqRtTWlNmyQUEwFb4PbUNY4wmB3ltz1KHH+v@vger.kernel.org
X-Gm-Message-State: APuU4Z/Bp8iKIgErIlwAbMS3KmD9LQb9u6/8g/RrjNjHmp6pv95bvJQ+
	CZpNJg/ApjQvPmEFRylFo2rE+RaurR+Mhn2QhBxG2OmGH+Ls/9L2TIUY
X-Gm-Gg: AYBFou14uYWtDOtrBYUIExlFq2kDg4eqaAaKavzOqDJh5IXujlqV3P1ZopzOUvxGljY
	5JqDdM0oQgiQ/URILXqlKRhnKfc3PU+R7Wlvs5AMC9VMD1IUH6xtrBefI5N0viBQUXw4efrHcai
	ha6zy0MJCTH86c+ZypstXorljHNFK+nZrO0CfG/gJrLET78p0G+m0YlQSNhm+NlhxEEJYBJxfQ3
	ZuaYm/jfsKnUxFXBVva9qdM7jYJKT/oM44FoCGemCscO0/1JlV4XBAHYPnHajTzVVJidzegxNrT
	yfAtDk0R9koftnVVW4D7IdjDfwygvN407s2EWI0S6gTVTUG5S3f5yv1LmhMKNhNNaK55+jGJR2j
	J+7G5ID+YLVix6yNka4Q5eszDSpWcfS31u45l4zICFZl6LYlxtWy96gTDvwGtWZZkYysn1NBZUo
	2ClF9PzwdV9/GN6xjo4rnsWdFgjkrfzN+B3RY7TO18PNqRMcBIl+rSq39+mBd3I/EuKWhfMLQ8m
	5x7Pp9EtuIPPVcAEvgTIns2LWUuQHq9ZUHz5jEgvLKmWNjDgNiNWZ8pQkOLh3WBqqcym39cs++5
	DJ0slcq4FgiZ8ADiAHysyX4w4e9t80Rdh1aCmwsT1+TyHZKv4BZJYIA=
X-Received: by 2002:a17:90b:1c02:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3b182eabbd9mr2501115a91.22.1794402308782;
        Wed, 11 Nov 2026 05:05:08 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7fc2dsm4448216a91.13.2026.11.11.05.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:05:07 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: yin.li@oss.qualcomm.com
Cc: sdonthineni@nvidia.com,
	james.morse@arm.com,
	robh@kernel.org,
	ben.horgan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: Re: [PATCH v5 6/7] arm_mpam: Add support for memory controller MSC on DT platforms
Date: Wed, 11 Nov 2026 21:04:57 +0800
Message-Id: <20261111130457.4143667-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <f8911f68-ee78-4eb2-b7e5-1e879224091d@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-6-150335a79381@oss.qualcomm.com> <f8911f68-ee78-4eb2-b7e5-1e879224091d@oss.qualcomm.com>
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

Hi Yin,

Happy to share more details.

1. Our SoC is an automotive-grade platform with an MPAM 1.1
compliant MSC on the DDR egress path for system-wide
bandwidth QoS.

2. The typical scenario is preventing memory-bandwidth-sensitive
workloads from saturating DDR: isolating bandwidth between
infotainment and ADAS domains, and preventing background
services from starving latency-critical workloads.

3. We verified on v5 (with the top-level memory controller MSC
node as a direct child of the root):
   - MSC probe from DT (dmesg: MPAM enabled)
   - resctrl mount with L3/MB/L3_MON resources
   - MB allocation through schemata writes
   - Dynamic throttle change while traffic is running
   - MBWU monitoring (mbm_total_bytes)
   - Monitor assignment across multiple groups

Usage log showing the memory controller MSC working through
resctrl on our board:

    root@hobot:~# mkdir /sys/fs/resctrl/group1
    root@hobot:~# echo "MB:0=50" > /sys/fs/resctrl/group1/schemata
    root@hobot:~# cat /sys/fs/resctrl/group1/schemata
        MB:0=50
        L3:0=ff

    root@hobot:~# my_app &
    root@hobot:~# echo $! > /sys/fs/resctrl/group1/tasks
    root@hobot:~# cat /sys/fs/resctrl/group1/mon_data/mon_L3_00/mbm_total_bytes
    1314

    # Dynamic throttle change while workload is running:
    root@hobot:~# cat /sys/fs/resctrl/schemata
        MB:0=100
        L3:0=ff
    root@hobot:~# echo "MB:0=20" > /sys/fs/resctrl/schemata
    root@hobot:~# echo "MB:0=100" > /sys/fs/resctrl/schemata
    root@hobot:~# cat /sys/fs/resctrl/schemata
        MB:0=100
        L3:0=ff

The bandwidth throttling takes effect immediately on schemata
writes - verified by observing the DDR bandwidth counter drop
and recover in sync with the throttle level changes.

Thanks,
Ping
