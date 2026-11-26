Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692179;
	b=QQDudp8u4sPdnfirDkfklZFwYLlaMQKacySVYigkMWvkmdbypE9GZzr/EkaE/j0lh+WX
	 DKp/c0qvxYbExd9T8M0s5m3/WjMQLbpH+4jQRWgeNg5hLHxfVGupwor1rHwkprmp8EDfP
	 psc6vDlSHOqJTBC5aUr5UlSqN6BwUMnOQBY9Mhw7kG2wbBuZ/9xEX1+tdXh3rAiHyFu0L
	 lQGzjGk3q2wbU6LcJjlwgmnhNvWtVpSZ71TONOwPTYDfRxPSehKewzcammxcVc8c/1yEq
	 7QwXRZ0Gba7f5bKPcG0s829ruRQntuDiMBCpTwEsf/KPb71z3tlLxsH/2UD+oxqQCUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=f2aTJR5ujlY1iuig4Lvg9F+LskDwvfVaLLYuQpm8ut8=;
	b=U0rgV04ofI5ei/t5oKH564Ud6+83WdxvCH9Cp5eUWJ7DZiyLC+e2NmvntGQdBw4MGFUg
	 GvynLd21dZWruEINqFnXUD0q2ro3fDQUad954IVjQPxEOEK4RuvvmM4kcYEbihB11DQB0
	 RATCsM81SwyLCEYxWycmCS6507x24QWkhKq8AKMrfMSNDs/vhfKH0DkOkjkSV+kBDLiCs
	 kbj9uJTMhY00VNPqEj0yxuA4jA3TejKrMV5RQi2fCCN1/wc6fBVtgPSxlB54+opfgtv7S
	 fQKviocTMM8mrBR2d7rRmXjcSm0BxD6tes/iGxTwNzmd/I4dodkQIenhMkWbsiPTtBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rUM4Q+6I;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C49E606A681
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C49E606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rUM4Q+6I
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38190551625so13428226eec.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 03:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795692178; x=1796296978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f2aTJR5ujlY1iuig4Lvg9F+LskDwvfVaLLYuQpm8ut8=;
        b=rUM4Q+6I3/M0io47xi6FkZ4+3QYkLQ+dBxio8MpItCE+cJEueofYt9thzNDnENUtX3
         fe/MgHaw8oRThq9AG98M2yH11d1vS17MQTqBhYIoQJGftHX6l51KsvaOKKCODdnCkfXY
         YzgZAkpmuMro383aEeRzjVbBh2lygiZ5Mhv1b0GeO1QX2QClt3n3Feb54HMaAa1AzTxM
         GGkJJdaoObMKMAa28MfXNdNCSXn69Gz4pqMRLqTcfseWxqas5NE+v+tZpCP/BBIncPwe
         OqZ7PUcX0lnhQ7q4i8+4AqrpnuQM/T+BrL8NwtuOmoJWoCthnmzBDTZcTTGG6dbPUbOR
         vcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795692178; x=1796296978;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2aTJR5ujlY1iuig4Lvg9F+LskDwvfVaLLYuQpm8ut8=;
        b=LWM+uXtGS4oadhup4wfy7CZXP8j6cgIivv4j0n2q0tgNoFBECMp2bSaq03pTM4J2iT
         j6Wpk5Caqnrv94oGG3WcfHtZwose/Zwq/7U46ZjM53W8hsIz3zV3SWmrcF9WfGp7QtYV
         zpz8Jz0PMqao99eecKvP4iuiglfjq2Givgg3OawkfJuY09yjkmnAvKlbHRcXTdsIEsAx
         4IrVmzR8ShQ8jJ4XQL/+9tpXrN02q3HCLJr4Vt5G+izKT4HpwpSN8/zACJALodPj4+3x
         KfdDxH2PacjfBFcy5f+RNO60qLp0Z1t9nU/XaTx5i2Z2bOb51whQr+nxxnn+TxZx0XIb
         05mA==
X-Forwarded-Encrypted: i=1; AL+hErHnoKIc8+Rr85kqXrE0xjnFgnBLeoZEkhlaSq3BkkdhqncMAl0iM7F9zpgCVX37/ik9AV9RUffyoAMk@vger.kernel.org
X-Gm-Message-State: APuU4Z9tDOQBLe6nnjEo228Mb1gk1nmnHaBmPo4nJSCAFDpN3Bhi569x
	RBtnRfBXjzWjkvRSKwi4Ua+yFkJ5CngweKQgWDKlZkdcnjynJZZ+HK42C5RkWkv4yA==
X-Gm-Gg: AZFdTZerLmPTMSwx7pFHcO1pYO9Sry/QaaSM8JCnHMNR7HjoyWDalB4sUrY9NeFQNfF
	PJKfHy2BjLAWtisleeCxaFvHcK2yzdWs5kiGaTbw1mDdcbOt9nB5pLqL8UGDkSmpMLKa6z/kHBZ
	ruBBmZqJHQa+pxdar6tLnXoMQ5ApRXGB58K0I6pE/cQv6+UrtNmInbQwUN8AhOke+R1tsYWiGSQ
	F9p/VSTrW7lM2DWKoKW2t4g/Cqrys3bAQzsdrYLekN5bsT11rfS0ukxWCs/XFjSI6/Dw9aFP613
	2Zr3vOvgFQoifhj3c2pNo3/sPSYLHCndaccnxDKpkJk2oEtEAwdYEWt4GNhRNQ/D7HifAH9m7j2
	V0mplG+klK6K/bh75kVjZFfHTNlxuyD3dZ+Eztile/EpDt9mMokFLRJsZ7L16WqLQ5IY9JwmMl/
	GJctekYTTGbIfXqe5VQs/YvJV/n23XBcgsoiGv/sV/pMiFV0GyjWrok8TCC4f+ntfI/Fi6t8jqL
	chjRD8s42smZTyekHMvwPnga+XZ5FdVFwxRER1O85/EX8Q23+izq56qkqBgodmwvY7JsnOewhBc
	TlJ5N6HLKfbGB5MkItsdYP+dMrtMWqNfYkJR1v7p1f2j4xLkRkcft0guUOfmYnGg7eyE0CQXS+m
	02IaaUTgYb37RwnTs9Q==
X-Received: by 2002:a05:7301:182:b0:386:b4db:74d3 with SMTP id 5a478bee46e88-386b4db7924mr11103689eec.21.1795692177950;
        Thu, 26 Nov 2026 03:22:57 -0800 (PST)
Received: from cantal.lan ([58.136.75.118])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm70620666eec.26.2026.11.26.03.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:22:57 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: alex.cramt@gmail.com
Cc: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mahesh Rao <mahesh.rao@altera.com>,
	Mohamad Asyraaf Azhar <mohamad.asyraaf.azhar@altera.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: socfpga: agilex5: add support for Terasic DE25-Nano
Date: Thu, 26 Nov 2026 18:22:53 +0700
Message-ID: <20261126112253.365806-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-de25-nano-v2-0-02e43ba72681@gmail.com>
References: <20261126-de25-nano-v2-0-02e43ba72681@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tested on a DE25-Nano on v7.4-rc4 with socfpga for-next: boot from
microSD, Ethernet, the HPS LED, I2C1 with the LIS2DW12, and the service
layer interrupt (hwmon readings).

Tested-by: James Clark <jjc@jclark.com>
