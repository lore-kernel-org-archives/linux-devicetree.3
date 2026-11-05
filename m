Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793858035;
	b=fFruzHcn3Mqq4Kwq1aPOI8z/V8GP27yma7B/dQ/NZvbF/svx5nqjWavYVNKHaOqm8lQB
	 iTi0jjpSzL12uT2+u/SKsgkKIBpTzCbN6DStSxIRyF7Kzdcs6LAQofMEK0nWvTkiQfbNh
	 fxNv5rz4XJe1pHoQ3kQGzB16wvIfbuzawmb7pUPCO00B43X/YgLRoqw0KN/rTF7JQZUEs
	 Qxti30RyWOiM/p4GQ5r2nc8kSpYokfPMIP11Il6VIf9jS+o5EgtaJk3pNsq+eEGWtp8X2
	 MSt4X0/zof95Ie/EawoCzneybh5D14bKb6LWOZ2jcGFa+c9EBFHYpJKXhSAY3S0YikA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793858035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=igsohCGD/my9F05BJ5ZdAf3sM/HA3G6ndburhp8TXQ4=;
	b=hrGVPKOwm4ApY8a0hozEGlSsUCPcCpq70MUmehrb+Z///M02B3jjNASG7ySMhXoKXXkr
	 PsVRp9/ERqDYJ5Pv4f7BjTwZIz0uNpZYOpCIdT79RdmIHAkfGDLW2QWOQk13mpGjzhZPq
	 FUfMI0Vffw/uj7lJqftrkucoblz0Y9E1hEE8qJxH2JXKf2h3lOQVJLLzMc36pFE6iXrRn
	 7P+GglXMorsk9TTeFN9MPyoQST7gOIv+r05VnBiCD2nc+prOmTZO4sSD4q/i77bjA8MY8
	 dxG6vckc9r5SRH6Sdv2adMKDFA6jHUiszku8ePREv5JTOrAc0uceVuMujng3/OqubFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWtEO7kP;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EFE606A331
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 05:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95EFE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWtEO7kP
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso1044502a91.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 21:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793858034; x=1794462834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=igsohCGD/my9F05BJ5ZdAf3sM/HA3G6ndburhp8TXQ4=;
        b=uWtEO7kPbQwyLbeKx3WLFl/Pb+ogG4nPrB4bl7Ex5y0v3lZAgUnyRii+1xiSyFGLIf
         wa5nEo2rQf0TC/A2rsToWG8msA+dWD449sNcAPENrxLbbcuuiSc9y1n1e4Kjm/8zBUVb
         gxcJqidzZp6FzQNdePsgcU/udo+1YyDvocc1lluwY4p6b5Tm74mPMw/C/zrxBTanMy3B
         mhTwMnEw0d81nCSrBwxFUK2KlDr1VUk7ylaQEBskClVlSDY05eqxhdPTDPtu2uxd2lhr
         whRDWrGvqk16DM+0YjJldmrK3TRxxRlg1alNLmD5zTo4AQ98ppxgPXLpCZmtHK7yQOQ7
         S5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793858034; x=1794462834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=igsohCGD/my9F05BJ5ZdAf3sM/HA3G6ndburhp8TXQ4=;
        b=hdds5i/Ko7opi6Xtu9Y7OCAhRpGQjhmvUQgvVhQcCsxT/IjRFQo0pIeVyWlJsDkqOk
         801hjI2vY3VuBAcnol7lDEKyLGb1Rem/CppQtkmx6hWDN59SjreVhZmi43apZHjty2A+
         1HIf2Ayu8rj2N2rUyMaN95Z3uj4jKpG+X9FYhlxBNslFR2MgF0JQ3p8hcNIDAus+5SNt
         k69amAZdrQ//AIVDtnu/0o9L+Hq/mycfdLKKqZTQA+6TLzrUdGiBROAhirBq2un/tWlc
         abUdnwJ57TFnZJmxyMNu7yzBSYumXLVhdkqfFx4JQBmAiVj6VchAtVIsYLM8T9XYNFCn
         fJuw==
X-Forwarded-Encrypted: i=1; AKwUvBzyXTm1Fw+MOIdsTyADEKkPYp4+gjD7vcUaDpw7JZsggKYK+fYNjhQQa4GeeIIlieCLxOP7xQBSLNnK@vger.kernel.org
X-Gm-Message-State: APuU4Z/b9EoLdmEgPUZcPU4bRuXV/qvcZOvv6vbrgWiNDeUo5PzOnH+C
	ffasTWfkojaSJeXZI2Q+Pgj3RhAJycNF7B8hnu2EunnwYfJ46rPLGBQU
X-Gm-Gg: AYBFou2GDn+CAA+cxfwlCHoIvuy0/wbE2SsjNNUWpwe3PzD6d5Upt7UGwuMwedePKx5
	yNYZHLl4kdZPSZ0euIQpTaqhz9pFkNDxbybPfbWHM3QMfjKKn96JDJRHf4VytW+5nfWqcq8P2KI
	JO7bHxB9YqWiMaYXPH7rp9AzU7Mso6mLNjqgwqQ3LrWX/MnflteVKtmyQS7APEGOrT+lqITem9y
	AuOGyzZA6jUWjGFC0B+bBn/cxdOQY9DktffZvyPwROXpbD/NGmEZepIVMvrjYs683InXjvG5cbf
	5F7cLQmT90vt3msmoOZil87+UFlnLIeyoLEEPXgh4plhYQKrOMMb8trAk2QLewKHjawgUqhpyjt
	D8i+ea18ftSH4upyogHf81FDo1h+hE8susaEe3WxgZkddqWU9sbbee89F1fPmEOS9yqbQ+2meZA
	QIfqYSMVQ0baAZxgfji/ywzkWNaUva9/L+Agtj2F4126lQtVqfYl2c6HCv071b/Li9pUhGdZhCo
	APLcBAFaf+SXMyOBGO4VMmfi1BxrO5S2gFW8Rkp9ZaiOz1urstRtkbU7SYomH3s/pNHS48pj14m
	17T8KUQcuPIIKRDfKcJpJ7Q7Pfsj+k4jMOacPZb15YGSlGAaGCxCt3E=
X-Received: by 2002:a17:90b:1b11:b0:3ad:4bfc:1e77 with SMTP id 98e67ed59e1d1-3ae897dd40fmr15148293a91.66.1793858033891;
        Wed, 04 Nov 2026 21:53:53 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b312cc44sm2293530a91.1.2026.11.04.21.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:53:53 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: yin.li@oss.qualcomm.com
Cc: robh@kernel.org,
	james.morse@arm.com,
	ben.horgan@arm.com,
	sdonthineni@nvidia.com,
	andre.przywara@arm.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: Re: [PATCH v4 0/6] arm-mpam: Add basic device tree support for resctrl
Date: Thu,  5 Nov 2026 13:53:47 +0800
Message-Id: <20261105055347.947416-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <9d370f12-9e4c-4b80-9d28-ff8085ce3aee@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com> <20261104081302.304667-1-leeonion.muyu@gmail.com> <9d370f12-9e4c-4b80-9d28-ff8085ce3aee@oss.qualcomm.com>
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

Sure. Our memory controller MSC is described as a top-level node.
The MPAM register window is mapped independently in the SoC (the
component sits on the DDR egress path rather than being a sub-block
of a memory-controller DT node), so the node is a direct child of
the root:

	ddr_msc: msc@2238000 {
		compatible = "<vendor>,<soc>-ddr-qos",
			     "arm,mpam-memory-controller-msc",
			     "arm,mpam-msc";
		reg = <0x0 0x02238000 0x0 0x1000>;
		arm,not-ready-us = <10>;
	};

The first compatible in the list is for our platform glue; I have
replaced it with a placeholder here since it is not relevant to the
binding discussion.

Notes on the properties, in case they matter for the binding:

- reg: the MPAM register window. Only a subset of the architectural
  register space is implemented, so the size is the truncated window.
- single RIS: the component reports HAS_RIS=0, so there are no
  ris@N child nodes.
- no interrupts: the component has no MPAM ESR block, so there is
  no interrupts property.
- arm,not-ready-us: 10.

The verified probe path: the node matches via "arm,mpam-msc", and
patch 6/8 in v3 classifies it as MPAM_CLASS_MEMORY and treats it as
accessible from all CPUs, which is exactly the behavior we need.

One question in return: with the node being a direct child of the
root rather than a child of a memory-controller node, is that a
form the binding should cover? If the binding expects the MSC to
always be a sub-node of a memory controller, we would need the
top-level form to be allowed as well.

Thanks,
Ping Li
