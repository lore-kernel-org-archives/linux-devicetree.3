Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862531;
	b=J5dzTanO+xOJpSZ4xis0ik2WZ67JAHwKn8qw8TY/uUqysMyGC/7nZH4TZvMtRc7f83hg
	 5e/dqWGol2KghKU3tQ4QwEqNOaJuY3DGAtoEgFB6JhIkPPAwwWN7DY/WlnmluKsTgmtGQ
	 S6oLAefqwe0pUrTIj3R5vQWzUfR1PEZtcd+4LXxHQSA0V83g1UrlByTgQchkyAH+o163X
	 cXTj7qFji9tP2zDYbkv2vBbUuczoRc++X4AvfloA0Z00CzBvbM58nuQpks8xKdYxLgw1R
	 Zg+2nKZOEPMpxe6RLLSJ5uhKJeDtQJUiqtazuANFRA0pEO9IpWx/qH7fd043eXK+bkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=Gcktu13qCXk+R21AiHSgVbKgfQjzEjPlOwrVGFGC2sw=;
	b=06ZAEnYRnn3LkYMj/NdJcPWNk1afIkSJTCiGluZMPjeii0ul4FjWMxA2RSayMMI1wemn
	 xYcRB+kYSpR4MT5rYuStSw46bKD8VFkYkkf7mdAPoHZyxYBOHlOByE9cA4JexxQlIHpRS
	 ELCg8n2xcmug5ROXcedIZTR5kLLySy+XgzlCPEIdeWzSHFiz7hYBBD2DBGbK6r06jRApm
	 a5GK4qvmVtDg39eOubGzT+2ChZsINXgfUhEklsEvyoYTiKdBCg8Si8D11oOIz3M1LoYJh
	 CkiV+7Uzg4t3ksh7M+2qX6gguH20eN9sX9jHa+9tVarMG7Ule4qQ84O9+rIVcZCOTfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lyXw+tAu;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79113606A32F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 20:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79113606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lyXw+tAu
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d05d51553so22622605e9.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794862530; x=1795467330; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:content-transfer-encoding:mime-version:content-type:date
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gcktu13qCXk+R21AiHSgVbKgfQjzEjPlOwrVGFGC2sw=;
        b=lyXw+tAuRY+vzAmb5MLt7oV6TqjlqADVYJGL7Dcck4tDxKf0rDDD0HWaQ5FO2qsHLU
         ruxqmh4TQqmB+ehVIyshPNidpYHwCmYvdsEdr3bs0UuAVpGX1PHqZUG18BR5bp475wIi
         sKYkHCDCRKb8gBPOGVPa6xFHB83xVOGf1dpupqGVdKsauTnBd6kMUhGOoZiXQHzf01RT
         Qc2+sXyf4eMTGjeDR9J7DjqAiTkUkvYYti0mQRl2av7RtIdgMhXBRgTxMhUGsRZuzlpB
         uaRRtiPONL0x36Rcy21ELLbqQ4CA2xHOI094hGRgEosaAWZChyZjYB65JtOafYWEDR33
         w8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862530; x=1795467330;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:content-transfer-encoding:mime-version:content-type:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Gcktu13qCXk+R21AiHSgVbKgfQjzEjPlOwrVGFGC2sw=;
        b=NFgkHZ+75m+0TXEbVXqdA5QEbZf7PfpCfCsvH0p4lEGIwtdhjPA6oRmxr8UL5ZKvgU
         /rw7W5BwjtMk4aDcYGZ0O/x+/qMZ5bk8ivJLRkkVUVjUofYlEGW05a3vAIt4QgeoONVK
         rkhPE5EAFvdNRsjW/1234S5Qs5uzQUwToAuiDyzkyFM4B2tvHgUNa6NIO51oIVgqsigk
         OngxQ2bg6WTrP/BKVMBpyWoUDSLb2RibHTM/xwWxzKEUC/6dtFzIiBPU8gZbCAN53RzV
         X0F8zboSb5f9QRz1NrAW2TjQCl4LqDkHEnbdsiBf/7k3HE95YI2K6JLVzRbmmwLruzru
         L5zQ==
X-Forwarded-Encrypted: i=1; AL+hErGdnPhAJqXY2nZN5yZO1ANN33AeSYCYIf+w6rQieKpMaGQwK68ox0Rfa6IE4GRb9ASfn7w6Td4w8+zm@vger.kernel.org
X-Gm-Message-State: APuU4Z+xUgfqvjr1ZbPtxyBIiYDw+I0dPV/6SZy6+qG22bocwlpGSNjT
	gAa/Tq9c4lkWZUFc/LGt5ngiFyGWq6j/H9vsmD+SqmKPTMi49F3nRUuX
X-Gm-Gg: AYBFou0CX61dc+L0BvkP7d0drJ3k9wgpDebs7Zhph2t99NIEPCfRj6y7y27DFxSp98o
	PjvgO0PGI/voyUhCDKOZdPEve0lv/4d6g8r5S9SGToGwNNkPLkHMHwaB0C9vGi9ImcZaHVQkqtS
	3wcP9uTRfRChykO+rQMT703WahZcPBGL7XWZ3ifMfn+cRgtowB4wXv36ar2uJc6BVsSg6N3+ufA
	A4/zWEDu5ThF60u7qrfy6ze56lpSGRsSRxBpeTEGs2ehWpY6eBAA1GWBvKUxxfq4M42BTwffIAl
	J5bZYHgZutMBFG8N6yrSG7GF6Aov22ShhaA7TsfBZhWMMv4+NnyYSAGO0+o13D4lZUIk8CFuid5
	dhXWcCPkfipSPiYDuLXU0m4QPqh2hjvzYb8oaUTRkMKXAkyJ4I/wNeaUuq6bhEuT2B7VufoUt2M
	hSb90jO52/vwuTkZQbt2fA7FDlKmZg+xZKGQm4EeL2/Tfh1ZzT61tFIkIHZS5a4Inc1WJ+P7K+Z
	ax5A7Q9eSfGqNyZCtL/FKaXf4j4mu47KM5kAj8qvXCHTVGSQXaXlOgq
X-Received: by 2002:a05:600c:483:b0:4a2:526b:d3fd with SMTP id 5b1f17b1804b1-4bb55a4f4c7mr187492355e9.15.1794862529784;
        Mon, 16 Nov 2026 12:55:29 -0800 (PST)
Received: from [127.0.1.1] ([196.237.227.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm24696949f8f.56.2026.11.16.12.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:55:27 -0800 (PST)
Date: Mon, 16 Nov 2026 12:55:27 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: krzk@kernel.org, andersson@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@oss.qualcomm.com, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v5 0/3] arm64: dts: qcom: add device tree for Asus Vivobook 16
 X1607QA
Message-ID: <45f11591823b4395aa19dd3a3ee6dc90@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

SGkgS3J6eXN6dG9mLCBoaSBTcmluaSwgaGkgYWxsLAoKdjUgb2YgdGhlIHNlcmllcywgY29sbGVj
dGluZyB0aGUgdGFncyByZWNlaXZlZCBvbiB2NCBhbmQgYWRkaW5nIHRoZQpDYzogc3RhYmxlIHRo
YXQgU3JpbmkgcmVxdWVzdGVkOgoKQ2hhbmdlcyBzaW5jZSB2NDoKCi0gZHQtYmluZGluZ3MgcGF0
Y2ggMS8zOiBjb2xsZWN0ZWQgS3J6eXN6dG9mJ3MgQWNrZWQtYnkuCi0gc291bmR3aXJlIHBhdGNo
IDMvMzogYWRkZWQgQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgKGFzIHJlcXVlc3RlZAogIGZv
ciBzdGFibGUgYmFja3BvcnRpbmcgZ2l2ZW4gdGhlIEZpeGVzOiB0YWdzKSBhbmQgY29sbGVjdGVk
IFNyaW5pJ3MKICBSZXZpZXdlZC1ieS4gTm8gY29kZSBjaGFuZ2VzIGluIHRoaXMgcGF0Y2guCi0g
cGF0Y2ggMi8zIGlzIHVuY2hhbmdlZC4KLSBUaGUgc2VyaWVzIGlzIHJlYmFzZWQgb250byB2Ny40
LXJjMi4gUGF0Y2ggMy8zIGlzIGZ1bmN0aW9uYWxseQogIGlkZW50aWNhbCB0byB2NCAodmVyaWZp
ZWQgaHVuay1mb3ItaHVuayk7IG9ubHkgaXRzIGRpZmYgY29udGV4dAogIHNoaWZ0ZWQsIGZyb20g
dGhlIHRyZWV3aWRlIGRldm1fa21hbGxvY19vYmogY29udmVyc2lvbiB0aGF0IGxhbmRlZAogIGlu
IHY3LjQtcmMyIGZvciBkcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMuCgpTZXJpZXM6ClsxLzNdIGR0
LWJpbmRpbmdzOiBhcm06IHFjb206IGRvY3VtZW50IEFzdXMgVml2b2Jvb2sgMTYgWDE2MDdRQQpb
Mi8zXSBhcm02NDogZHRzOiBxY29tOiBhZGQgZGV2aWNlIHRyZWUgZm9yIEFzdXMgVml2b2Jvb2sg
MTYgWDE2MDdRQQpbMy8zXSBzb3VuZHdpcmU6IHFjb206IGNoZWNrIGNsa19wcmVwYXJlX2VuYWJs
ZSgpIHJldHVybiB2YWx1ZXMKCkJlc3QgcmVnYXJkcywKRGFuaWVsIENhcnRlcgo=
