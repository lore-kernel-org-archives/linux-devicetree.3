Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B88E3A16BF
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858966; cv=none; b=c1SampoiS3r9RUwX9NOpUEZOGGEZttcAeAOUt9UBmvglsykpSRjeUKH6yw9Nfa458g709fQVHNEaLQaC9kcp6/o3kncTuoBZR3JRaAPm9Nh5P8uo0UZg+W4lW0XQTrrmhbj4lXtmEOhOtpYrVTw9Edn6tvVH+XT0HutngJQjdeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858966; c=relaxed/simple;
	bh=4As5q+gp8wtsEkQIP3vVmMGhUye+W1UL+GjS5utEwyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Okj5LJcOLZcvNiKBR+dABiwgFYp1INQec/qvO2OJp12zO0TpC22nzT3zcZbo/7zIrWD0NR07d0Ai9xPACAD0AQv59KkOC/nrgcBo1U7Z7J0yU13PDYXzssF2+lNQPnj1dO+yjKWXueII1IvpwZbWABIIIPRMa3dpJdcqq1qMKfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DSx49QyS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W2C9Jq6F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DSx49QyS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W2C9Jq6F"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4Upaa3031490
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5XbtVGZdE9feRwHMRQyoeczh+AZTExLyPU75oZjITVk=; b=DSx49QyS/bGRl8mf
	EXV5ICRZZ8YHdUgLrQjBKbmjK2tls88XoNKLDOxhNqv0bDwKIVoELfZMC0xV7Hu5
	1gkbYyKlIuvR6b0oZFF7JgQjgDh+kGVDtjm0q8ivSzux2VK6A+o0tM7rAWqqshKx
	QCf2TD8GRwiWACEHwri8RK1M27lP4qXZ+W4pa9NRPDLDBeteF892+p0621drKyE6
	8JUUVRGZr7gXw6FyGKCqiqxF5DPRKOaYmgOlqiFq54YD/sKATfbe7SPOIOfHCsbt
	Mw+f8gwEoZuhK7m7e7L2Af9a0Rfua5nbIe0ucNwizMMCSxrA+GsMGYcTuYcYPGoX
	WY6QUQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqek2mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:22:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4076dc16so79738261cf.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858963; x=1775463763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XbtVGZdE9feRwHMRQyoeczh+AZTExLyPU75oZjITVk=;
        b=W2C9Jq6FGYeOxH89e8j6o1hSvIAQ+BEyYPh6zI7NBZLXFujk9Xd5jtJ1KsWd0H3+EK
         kqvnnJrHqtVTUb1zLvKCMOYA18gIFP4pmBAzeGP1ary6/ukj1G/sYJd6Kx77brXoT3rC
         A4FVVVg92OIrDlEECLJp6XtiqLKeVAHM8URYaFGTdVGWnRbhOIvyavSfJ1V92HbImvWz
         8bTX6DQ5uRk9Mpm9gXtrL3GtxITqTeaNmAI7sfw2XTpcXmY+31TbfLYPVbI4+03U9eK3
         bZlLowCWmWmirEvoOlFIwD1OcyjsWjR4ydYimj7SdfNqNvEp/uEpjtinoPsqzxA42AVF
         v5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858963; x=1775463763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5XbtVGZdE9feRwHMRQyoeczh+AZTExLyPU75oZjITVk=;
        b=c2IAqjV1I727rkYJ0FE+g7vB9/RvZ1KYenWv/ZpOZz4/oMEvHdtYqVsKSMUXLObd9Y
         NZAEMSm+KYMCDdu+VklrZW/xWAqjtZBTo1M/rKEPJEXSg9UPPt/khdJxIWLuJYu2XL9F
         E5pdoa+5vQOETPcBNfIPN1DJIw8SLRepyNwn0Vs+r/S3PEhnFxrJ5VDjUUzv5w6lkcqI
         awbw5uVMzleESa9xR0L3vTd9G/nsn5Ficr8Cf065d7jD9UThaMPXX+mWprN4a3lie6MP
         yZDGClV8mkK110NoF2kyFyIySHV8Gr9OI+1AscDV2DY7wmRB9OaeobzoT2EuzqzkfyaQ
         KAjg==
X-Forwarded-Encrypted: i=1; AJvYcCXB2jkMC+trP3AiwXTSviASMoejmISWixpC0rBMc6RMSBf+o7UMHNQQRDZtqzOn+twgmTp73GtgfwNT@vger.kernel.org
X-Gm-Message-State: AOJu0YzAsxe4r8iNl9oOWlsWECMfy8rAYvMpSDV8zDM7gUG0ZeTdfKE+
	BJpDJHTcHNKu3fDHpr4+H3TQ96lT8utRdpSpAuZUmp9UJICixmkI4zDh2aiWK6bLM4+O84RayK6
	RwxErhpj0vHPYxYhmR/RKEJOY2eVxMn+EcrraLyhVbsBGJsnvbyGJc/SMNoXiZUr9
X-Gm-Gg: ATEYQzxVkKTskAqGbr3PGavIASdVSrEMg6bGkGyvqxkM8YWfn33zkiyQPE2N2wjGuBZ
	tjJi5EyYUY2GSTuQWD/oMnGZ7JyuHnwjNEmGfE94FfKmcfyZQZEQtgdSjgrWz2YApV0/dqugrQ/
	Ki6RERNsZx3LuhNY3sdjkkg4QOLHk311Qxx5BTDJekQnckECWt1p6F1z3EzHAqDwkj7vUzHcHjB
	UcEL9+3uAePlSFIYcUlwHHHUcOPUW+a3HafY2wYu33mawtJ7iw5Za6pnfvHMHSRsxAO/A3NuLzm
	GfsfZDKMBsoxjHMXcZSjntP2mBamde8dZYP0+MkSNmw/Fl8yphyvP9ek2Xlks6UTrSmFrfvE5hK
	3cY8W8cDWREojPQjzDiqEugkbfM1uNwP2ozEBuqS1/UVIQ+Pkbcs=
X-Received: by 2002:a05:622a:5912:b0:509:68c:634d with SMTP id d75a77b69052e-50ba3808d44mr159690701cf.10.1774858963649;
        Mon, 30 Mar 2026 01:22:43 -0700 (PDT)
X-Received: by 2002:a05:622a:5912:b0:509:68c:634d with SMTP id d75a77b69052e-50ba3808d44mr159690491cf.10.1774858963221;
        Mon, 30 Mar 2026 01:22:43 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1143:869f:e06c:4587])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873ab203e9sm70617695e9.0.2026.03.30.01.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:22:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Conor Dooley <conor@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Jamie Gibbons <jamie.gibbons@microchip.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: fix microchip #interrupt-cells
Date: Mon, 30 Mar 2026 10:22:40 +0200
Message-ID: <177485895691.8756.6036629232287740555.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260326-wise-gumdrop-49217723a72a@spud>
References: <20260326-wise-gumdrop-49217723a72a@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69ca32d4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5Kf4PmCHR9txB2KUHaIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: SMtROTCOu38kXUUygfkVrTs9jVi4j9ZQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfXzJxTfpYlcNr8
 wGQ14WS7hN5h8IJywqqZEFKS7Wza/vDDQbpK6eAJLheLFGmJK6YYWloS4tjhqydTBWp9sHrWuhG
 GzA3XrFO2hgb3cO4KtNXqGX4jSbW3aWx17azfwpCqUlyqfsrKlqLSwfcGly6Qz+tXbDh/YaBRZ5
 RBSbQNSaYZrqLkEXdooKyxwi+noP+E6mprPcToAia3B3akoEQGE+KxcdxoDGCMDyhs3AzTHZvUw
 vJ5RjU9pAMITiZmg9l8+k1Wy7qDnN2jgo8QwlGdMJI/7FlzPIj0cC8+eM3yEuECV1ZfG8USZlV7
 6k9i8w3rlu+35XQhsIdnTWTPt+JtmzX7xS0ZyAPLBhDCr6hI8K+TBvRFgUwLxkke6EaJZ+jwJex
 ZMbUbv/W3NA9pAEkTqQd/wYZfCz1wHE/sVRly8qym/rmt1zkQZfonhSLpd6eI/GDKGG8z3VKYwW
 3mI5gTP4NwKKmiYt/5Q==
X-Proofpoint-ORIG-GUID: SMtROTCOu38kXUUygfkVrTs9jVi4j9ZQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300065


On Thu, 26 Mar 2026 17:02:34 +0000, Conor Dooley wrote:
> The GPIO controller on PolarFire SoC supports more than one type of
> interrupt and needs two interrupt cells.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: fix microchip #interrupt-cells
      https://git.kernel.org/brgl/c/6b5ef8c88854b343b733b574ea8754c9dab61f41

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
