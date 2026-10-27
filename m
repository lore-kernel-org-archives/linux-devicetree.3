Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793138960;
	b=bpg0kGgA8JfttUb2YOfpdCyoLMK+Xuv/7NAmh1BQEzfdb9oTl4e9Yq4z5H3zw2UyAyw0
	 IpeLElmEYWgtijq4VyN0btFwAj00+PtIBkG1CVwjJg+ldRbTqxaWzCWW7MjflKYSKBgE9
	 QOMCWWQ2AWz+ptVgBEmgbxlU88RZuKMXEA6sv+0iO1NgX6K51skfK5UGGAxfVgRp7cSNS
	 xsuE8EhRGlA4OZLd7l7f8CecKypkvEBqHwnNiWwXnKpTVUwvj6b3zaC9GwrWV60TN5kf2
	 NFxeY4mdtIRacn1bvb3pPDO7DZHkzgpZHrjCBq0EVSloOVHNccBdQ/GX/+NnG9y5bsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793138960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/PLmL+V/SYmlIq7ZPKJzSVA7G2MVgEzQyQAcifW2km0=;
	b=odRa1SA1pe4tYbgpO7E+shcFmk/M7zLH5wj+OFjYsmNbIP0bi5xVtQu025YBn2uC4/dl
	 /kfs122siAuijFCi8ks2dgv47vvpk8LgVPQh3HPyavgTSVGNMpYvBr8JUGV5GSb5dbao6
	 5uCSvADCeBujOzUgrjjYtBKBE8xQYR751vcFr1Ezut1ltipCf/Mr0PqV1lfZZX2GcK4PE
	 2+RilQ8m5A/5vAekaiwMUA7cIAxYEwvMoUwD23/k2RfxX6gptwJytEqBLpJolKTrkfqBe
	 k7lVJHcbuQYJS6Z3BZh4BcTWogknsqaHxlpTG8gOlh1c4eYovHZNM+RpQ0iKzPnXsUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PdkMk9ke;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36755606A334
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 22:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36755606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PdkMk9ke
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so9258835e9.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 15:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793138958; x=1793743758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/PLmL+V/SYmlIq7ZPKJzSVA7G2MVgEzQyQAcifW2km0=;
        b=PdkMk9kewIP8utyRGSc4jW43jNTAMvQDKKnT3gKuktZwVf28pYzlLA/+8SiuCRAfrI
         iTP6Wp32ZYmkYmhcNHY+LWMn13O7ReplBh3xR1RTmCprKzhXgsxWqnqvaqpUJ8giL+V1
         +xe0jxSNWptp05NM6xsnj84Gham/RG7I0v7BixpSZKpen9On/xnh5L/fo/U7koThVBIs
         HkAGjIXALNX70uCl3tdEmETxOS2rCvbb6GpILbnhsIveWjpCvtJ7r+xzlfu8vNUfNXfp
         uI9APCpJhu2wiO6jOdmntGI32eOTlFJirCXh5Dkr1AW6sJNNS0tkpH1V/MPuBRsJjy0s
         UL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793138958; x=1793743758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/PLmL+V/SYmlIq7ZPKJzSVA7G2MVgEzQyQAcifW2km0=;
        b=deXBd1jDYEl54fO/NUIQ58tlhOaEwro8DguwWGda6/ogjz5kpPTOuXRfGsJj8diVe7
         rJYfuygAckuoKpRNTj/upi50tg5bYJPHbc+Z+QntNSCBGev580LvT+uj7+LM9XvZZZcy
         Hk5npn5o/IjZQ8VWhK/QulFGa/df/k8KWGHCAdgRw8HKT99tRAPphrNdXOOegnFvyxMw
         ee9PXQlAtpKyWhCPS/k1GuDgTRtN/vxR7hq3kjczMPw4+fXSNBLa4XOHxqRoI6QYUIvi
         yE9XpjJ+GEuEsVX5M7HGbw6qb4wGunA/W/KcolvlxsGrN4ZtMNivzRFc9zFJAbL0C9qw
         2Viw==
X-Forwarded-Encrypted: i=1; AKwUvBz6cj1ZM0KCvPNfu1xR4RoXgIEyKPpyQgRSC8g66jQ99nTQthRu5JEtMYM77PED8//VH6jcUPTZLDUe@vger.kernel.org
X-Gm-Message-State: AFq9FYKVcY4aNKwMjLCcCk6DUuftDn1QUwOIVHRFyblgOD6kj0PK3KrW
	Mgevv6r6R50bIpHZUJ9MBJ9w+nNblPY6QAWrm0PKMDAqCXrRNPykbKHdreehqUDfEW8=
X-Gm-Gg: AYBFou3HwpmD3mOLvSWsAmPQP+pNlUJFARd1+wuCj+WXzxcO83V2eBPy3Pd5iA6EIwp
	ibTgYxAxneKJEu0dtisOgiyJ1YF5p3JAOP8JMYAHFyqCbFU/7NJVPUpOcLoDfeSMUAWol+V204I
	O1quTxECOq9hJ6jntVWaDapE9nF9I5VA+oVbgNk/fcXT9R15Rt7iQb1lZHi7OpFpWnOBNMoZcHJ
	lTIM46EgUNVnoF8BPxdpgXkxJWmS6rrLG6OEqdS/2nt23hGTd6JjT7WQ6viEwEMQ+cxM8M3f2DB
	VKb0PQ7d4VwVxPN73xcu2AKVJxyJMTITDx498CzIlVLMVgf0GZB8TGMC/1ftul1+q2cJmt8Oqf4
	e9xGe6Fupt94kyjXPrVbVODtjPBs03y2YNN3HGtvqg08ZUclvKSo1avP1zzBvBGF8LBfZjLnuuW
	TLBA7eFf05YPx8oJf/XZ/H6GsD580EWzN2PxDWgA0ebqGwHyYL6o2andwAf0uzRDr1GPfkLQZWh
	n3h6U04sFUvqRMqbFNbYXgCp9zZ8ZzYUgCF1D82eoCrEaaZKilwW30/nY1elShIi5ikn1QyFL6s
	VRnS/JQ1klUz
X-Received: by 2002:a05:6000:46c6:b0:48e:6f:19b2 with SMTP id ffacd0b85a97d-48e55a51a7dmr5924445f8f.25.1793138958515;
        Tue, 27 Oct 2026 15:09:18 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5cfb:af57:9834:741b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb958sm25306661f8f.21.2026.10.27.15.09.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 15:09:17 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: Re: [PATCH v2 2/5] dt-bindings: display: Add the Ingenic X1600 LCD controller
Date: Tue, 27 Oct 2026 23:08:02 +0100
Message-ID: <20261027220802.56348-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <465cb935-2648-458b-9cfc-9b7fd5dc53c5@kernel.org>
References: <270ef5220fdd5ec3e0b88ba5c4ce044992fca41a.camel@crapouillou.net> <465cb935-2648-458b-9cfc-9b7fd5dc53c5@kernel.org>
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

Hi Krzysztof,

No, it does not. The X1600's controller fetches its frames from memory
itself, through its own descriptors and DMA (programming manual,
section 10.3.1 and Figure 10-1: AXI -> DMA -> async FIFO -> TFT/SLCD),
and the manual has no IPU or other block in front of it.

So the only link in its datapath is the output, to the panel or bridge,
which the binding's port describes.

Will send a v3 with your other points after -rc1.

Thanks,
Olivier
