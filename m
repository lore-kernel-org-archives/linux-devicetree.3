Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32D541D137
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375488; cv=none; b=oUTRVJhEVq1YiQGZUnjCPD0ImYC/68Y/dd419Km8JbqqwQGKFwU7dzVsonO4JkIYEJQvkdBaFR6V1L2NCY1vAV272DaZiARVCKE1jirpYFnshpeyjwQWd89XpPALEUXKFcfp+O2J12Arw4pFdKkMAVHvCKqLKT3XbQZ5d6+IIls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375488; c=relaxed/simple;
	bh=MyG4/H4DcAIPpCJe6XPdeF4pbvoQzAOjtvN2yXg5erY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rMDyHmQeOBh7Fq8ezoypxFWHfZeGwEwhE+sadgQeB1FJ+gJS/o1j/Gkdv29tkGLQZxTn+8fSW/VKJuMfRO19hay4Wv/izwkjMPrTBfrRRIVdJbL2et2Wi+46Rc0aYJCqvVUgrjdp6LEIrfNFVQ6FeFdQRTPKUcx/ZEZENjewX5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C4J3hB6f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aA052coN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C4J3hB6f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aA052coN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj5uV1367801
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LOklvPZbSkI
	l6v6AIVmRwrfMBoY1hOJLM+FnLZPE6WY=; b=C4J3hB6foIx/BjC/I+MQqSuhTZM
	4nvCndqWcbK12lqXwwXM3fsCn8BfLoJwAclEnn6ts4mXIYWhwn/l/TzAAIStGyh4
	4uofn3M479rKO25HL7FKtnDHoYnh2ef9T4Bz7wconPfUkZWJ2klyNkDWOngzwJMl
	Zyh/idKjzc/TAGsWBINOjUX4Tt5MvnleHK4CanNYwcNVGwSPLSueKK17KIIvOUtT
	1UvwAn5OF8RfEPKLamJzc4yCVLY8GILc9PEFp9eUlLcbMapxdduAGHUy9b4ZXXzX
	HjDDKm0MuOBfxJwphy7YKNq5534hMcg0TKlDmbk4X9IHCEn3BM2/w2c7ayw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v4a7ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:24:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e375d9736so2752616b3a.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375484; x=1786980284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOklvPZbSkIl6v6AIVmRwrfMBoY1hOJLM+FnLZPE6WY=;
        b=aA052coN+Wnb5dvRXymCSmV3nF+qp+NCiKhcE128/vpB7zdDoA6BiR80gn8zQJrCCl
         CUHMUGIzzN/RwP7n4kultkpEOg9KH7jKiQnq9knwxRZeYHHwDaDKbI4rqFuWv9iYrWGw
         G3Hpv/jGRkJPXUV04bexNiiwHMuapHUatsFFBvAYeBOiVK1xo2p58rYt8Ugt6U2pHuux
         ykaCXqtE5NrvtptnuUpkbuEbRm7yQ8nqxxu0PvBltsSNXPDJEeAcj5BbU6GTYyph2gCl
         m5cS6r8QPOosrAVqeRsMmxFb6bnFL2X09aWj3OBWZwzBhsdeEHjrVft0VzJn9lHY82da
         ncpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375484; x=1786980284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LOklvPZbSkIl6v6AIVmRwrfMBoY1hOJLM+FnLZPE6WY=;
        b=KdzXYI4Rf5/H27+ImDpw2cOnaZO6AR0ryzWGouZuv/wXWBeN0LKZk7Y1lWaY8KqfVd
         ThCmBUkshwiamchsJSUkv88jY+bG6sFvZrSIDoLeGtrEwPNmejA2KN2ObDQVhULN9EwK
         HRka73nIC9UNb8ONGQRzURzI8oM/YCqyCkB+u1f1tzotneWOk77t16gzlc3Q46MA5w/4
         QgULYpi0eYUgcKYVMdF6be2j9G5GJ1538ERKtPIAnC8y100uc56L5GNZGUQPFVGuAfqQ
         oNB+ST7T3sZFtcvyRXArDXlLbrKJBjfKe7KV7CsbLyZJIvAg2AxJTTI/PUcNAd8BZgOF
         VUhQ==
X-Forwarded-Encrypted: i=1; AHgh+RoaHmrv2b4ytBHn4SYiZY65vniG1LVroPfvTOzg6/f/dIUp7KWnn4trfaC0LPm8aBB7q3mZ0oN4Iwmj@vger.kernel.org
X-Gm-Message-State: AOJu0YwpxXYkaM0fCuWw4JLu3q5ormK0Tbfk+f6CX3xkBCUaXMjji19z
	r+cO2dwaTdVy0Oj/n4aX2NJf3gp2u60WPgetbcepUSHksQ6I7QiuhvUfm9+955nhaJT1cLm6U3Q
	f5pStyW8BXYorOF+MCI/vskfl7E7jMVnncklAGixZHvzvYxGTjXBhfHWV3Ita6Y3c
X-Gm-Gg: AR+sD10r9K85SvBQEYwDwU2prHgFEQR3jFtDlKfsdtLZp9iSfY16OUK8CiQMJIIKVkU
	Rcfkp38CAp7ih6a/mzWhJ52A+z4dJPHrUKK0K68dAjKkzJUw3LBY6OoeavVD8g+znyOCvzBt059
	ze43e0WxdadXvIBtQFB7RG1TehQLN5DpeERy8DMLw2M+YLJcic3CAZMlv867gbyUtOR+Y8p5t57
	lbrnfNskq7ClCmsDU+v+ruC0K9166HRVYEt3sqXirrm0W83kpvCp5VQmDo1qN3wxbEjINoEjnZi
	L5IC97qGTOmCD5rBQA6EXglIzkZRNg3FQNJpdZEc4s56A32L8jWVC/uSIsYa9rAOSi/HrrXG+Dl
	jUpWQqk71BPTh2xvBqBUA3lq2jeh7BBvu+F0ozWLu6vmy0mHG+cDAPD4Ynp52HsR/gKLZtTOPc6
	Pv4r8iZR+LvhI6IdCDE3WE+Xd0Iw==
X-Received: by 2002:a05:6a00:2d8f:b0:848:48c6:480c with SMTP id d2e1a72fcca58-84f2e00e9ddmr45265709b3a.24.1786375484259;
        Mon, 10 Aug 2026 08:24:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d8f:b0:848:48c6:480c with SMTP id d2e1a72fcca58-84f2e00e9ddmr45265660b3a.24.1786375483712;
        Mon, 10 Aug 2026 08:24:43 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:24:43 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 10/14] riscv: Enable DMA_RESTRICTED_POOL in defconfig
Date: Mon, 10 Aug 2026 20:52:12 +0530
Message-ID: <20260810152223.3946743-11-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vaHuNMMu5W1WZ_-MMETsojVXcgAmXPkH
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX2+H6W1SuRBqi
 vIsxzxmpS/bO9unJkfql+IyQmuuWoQHBTduMcweJ+ZLAwqqwJ1FWkKr1OvhpKbjZxvFmP0UiC7J
 rFOxlM5i1JgrRntNlZYzrSUPoRyPDM4=
X-Authority-Analysis: v=2.4 cv=W5EIkxWk c=1 sm=1 tr=0 ts=6a79ed3d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=GbvFXuxacV0FzgsEJgAA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX8dVS0v8oWFT7
 mQpjZMnFXI5PAAMYQPwEfcLLHcpOWYcTn3zw1blmggvEh5Y6Es3c7oUjlzQbYXlHAaFzZxV/Bbn
 taLOf6lHFmh407Uc1xB1LblHqOx3UbJw7ySaghprCWwbFnaAGUC7RPqU4raj9pXejvO0EzqJzUe
 fkXBBkMoIQQW6sX3K+iy1TQgDh6ZMICe+Ensmqazb4OIy/0hDcS/alABMTm6yBBHsklJUKS2xW4
 /Or5DgiPcCkXfVforjRQt+zy67mvBp5yrc8+my+edTDtXflxNfehdjOAN2c3gwWE1hLCKVfim2v
 2JtVzx+6Bjq1LKIX1K8tt8lMlZTaeLhll/e4Z5Desg62GTdLVfgL+L7ahH65Ipv7558TyteEr2G
 Fs4o+zY2KxRcA+kmLaIFTTu2p1S2+mEYHpHiW1uKXdDp2p5n015TviHgKX2DD4nk/z15QRag7Ad
 cXYE8u3/XgC7YFfwTbA==
X-Proofpoint-GUID: vaHuNMMu5W1WZ_-MMETsojVXcgAmXPkH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100132

From: Anup Patel <anup.patel@oss.qualcomm.com>

The RISC-V ramsink trace component may have implementation specific
restrictions such that the component can only write trace data in
particular parts of DRAM.

Enable DMA_RESTRICTED_POOL in the defconfig so that dma_alloc_*()
and dma_free_*() APIs work for devices with DMA address restrictions.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index ed605b5e3162..57692fcdbb89 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -304,6 +304,7 @@ CONFIG_SECURITY_APPARMOR=y
 CONFIG_DEFAULT_SECURITY_DAC=y
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_DEV_VIRTIO=y
+CONFIG_DMA_RESTRICTED_POOL=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_FS=y
-- 
2.43.0

