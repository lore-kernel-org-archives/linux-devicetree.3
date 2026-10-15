Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A80649E13A
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048550; cv=none; b=Pjdq43ZGpMZfce2KOqijduFoRSLCw7RhGIXFjNvoYISqc60uUGdk98K0MEcSJOyrIV3pmJV85kJhqn91ISS07CWKNcvMPerWx4K0l8pWW1/jeyDABDvvXrzJNdHKHad94zFiF2c3VTyieEHMNWziF/EFoJRY8QaolhudxpFtd4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048550; c=relaxed/simple;
	bh=kfvOy1EUNv1svdDA/lC9fwPWtAQEZIOXQqACVTUcNk4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k4qCXTPJtqMZVWCZbL4oMGJVuxX2rqcoOnjDKNnzH2H/MvhS6kYXURjXZe+HcDz/a5XW/KQpw4N0PfqJxIti2aPXjV2+ievHtgmsuF3eqCTnOAWwCVHRi3nvPvuFBsvP8OXuPjNOAbcnDPZAzVF9O5wwNi7rSaaytH1bojEBG0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JhIFBWJi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bmtMYHpH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JhIFBWJi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmtMYHpH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6wDU91672259
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EB2R0b0xpxH
	CFsthVxRDB8IrajwR8tFNaUyoHo0IRjE=; b=JhIFBWJi9YmSlfP0p49Hgnu9x3v
	GZ0NP6tBchLCxdNOTE+QnIPjQlwkDX8bLS9vLX59HsPS1Juu63y4K9T8UiAOwvJl
	Z/ucIsgt/KOFKsY7xmUpIp8iCCW0AWN2fkq8KEgmsKhmk8eXgFgHPokuHZf259hD
	DGNYlkdtQCefKTojNF1K8HVJ5fG+keyK65JPmirfJ85Fxn5UsvjzZv+FoFyIyeRi
	QDgfvv4o1/AUKLAYkyADMREzoCjheEPP4kI25LGKoMSMnp98S0fA+17WoKBp+Vpb
	vHKtj3ufrGKrbhsNObc0IxWZ9yjgeXsqXkreB6EYuuFND0HvWwWEWg1Etrg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrhb2wc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:15:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab9850456aso1794588a91.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 00:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048535; x=1792653335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EB2R0b0xpxHCFsthVxRDB8IrajwR8tFNaUyoHo0IRjE=;
        b=bmtMYHpHxGZ34oXlyghBLMe/diEt8i0BLbWUXtr3O41/7QdhSClzqOrabmQpSoA6TV
         oTfTYb1hxOvU1+T2UIPKHUczd6n+XrUIrzW1766y1v2QXSxWNA0Y4hV6oDZG9pR3q/Co
         FDs0+NSR+hXqO655ZsbzB9BewCi834/tDwxWl2Fu/yT27DKYWUkAyh58M+3IJSKV4igM
         zSJFn7cndMk2ImrZyrH/BodHQSFZEcu2qSCMnVO6e9RvIoQ9aZNjr7z/s2VfgYvvf81u
         JYJ/ArMAUgxj/tdtZJA3XsrqhYJxs0A5dQdKRuphP0rxSHvjy24AyTDYckotB1wVJQ3Q
         l12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048535; x=1792653335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EB2R0b0xpxHCFsthVxRDB8IrajwR8tFNaUyoHo0IRjE=;
        b=A1onLA3LzZKCqJxDlWbX73d2Lhbv+ET/E6u8LWoumkywXf0OUzb1ObsDAh8qAnbAe8
         tsH1CmwHxkp5qkK6BXu2yFzH+OUhfNy+mWa7prwC7gX+Whaj9nvdCc/mZOOzd1kwrfBU
         eTGF0q+BPRXTO/2ylsoQvAEVUcJ0c/Hjfty9FXlzekJNmNkkNspb4KwheplpYlS8pdtr
         A5X1aFWZx4b4ctutMrlXvL6Cjyd1TCCQCzhI2dbT58NVEF/hKaaOaUj4A48OPfqcec1s
         yrnle7g/vhAcLZ065gihUv85GeSj81gOeRslYYkJIihFZMRfX+VvC8jfPJZS2+nh7Km0
         o/Hw==
X-Forwarded-Encrypted: i=1; AKwUvBwL4mo6pP5x3XHHclcoFhrVLTQlTmNujJLUaYDJXtvzo0S7r2q8x08HWW6iIn61/e1jfbakM40MDTZP@vger.kernel.org
X-Gm-Message-State: AFq9FYI696SKugpSfSFvNQivooY6ZMs3DV5dHTJYI5ERTRgw36fLTC6V
	qfF3XZD7OauecZHkJXST6q95f0HrtWvSUdefsVhgggkxWx3O7LRBhWvwdhANvlEtB/U13EmF6WP
	pnat4n5gv221txbnC/YvkstNVUY30lee34z1Pt+GaKE53pTuYWG8+x4bAxKNnlP1f
X-Gm-Gg: AYBFou0jfGRz1p/evTYhUJ3CHO0Am8Bl27ODnCnBLxCo93DDm2YwrqzDa0BuplgGWtd
	UGW3UX28zEnA9LSV3vazK1aolDKeucyZOrYhTg77Dgpjqo3jhQFVcIkMa1NBEPKTm9YMxJT43g8
	PjP5yISrnh8bYUfy0DnFsB0IVPyCX7d1OQXKl2/2/BSbTdJfOloYu9ccTa+vBYbwQq90RXkpUb5
	bKv5hprGDJpPe/P5P6IoT0E+bFoLYYbS0swmS9W1U/1xevYErHKcqSvyU2TtF5fB0xGOFF/Hj9n
	9oWTotsGr6eetAw9zTg1hOhnWMh9PiZzQv0NqZc3y0DSk0j5CiGEen2OZLesDaJrdidFK/yLxOR
	m8cDFH65PYW1+GLmfG2IHL7/uo4N86jaZd4KUDaMQli2aKf+V2LhjcQGU5gouR2WWC8wJ0+XO
X-Received: by 2002:a17:90b:5343:b0:3a8:9d0d:ca50 with SMTP id 98e67ed59e1d1-3ab3a956dd3mr15715123a91.10.1792048535395;
        Thu, 15 Oct 2026 00:15:35 -0700 (PDT)
X-Received: by 2002:a17:90b:5343:b0:3a8:9d0d:ca50 with SMTP id 98e67ed59e1d1-3ab3a956dd3mr15715108a91.10.1792048534847;
        Thu, 15 Oct 2026 00:15:34 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944511c7sm3223475a91.10.2026.10.15.00.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:15:34 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
Subject: [PATCH v1 3/4] arm64: dts: qcom: sm8250: Make the ADSP remote heap no-map
Date: Thu, 15 Oct 2026 15:15:10 +0800
Message-Id: <20261015071511.977-4-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Fs3_cXPXrLQmkY5JpXiLhZJs8lCezDyZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX6mby/dhLFO1Y
 t5Plr2cIuEDVbefPYYQ0o8lvhlPXL3DII2wxE86k27W4uKP9uTCpOGYJF3m2dDPbQbo5/bUv7yX
 WcufWRcd6tWRYeJJNp9wyHjVEVJCquM=
X-Proofpoint-GUID: Fs3_cXPXrLQmkY5JpXiLhZJs8lCezDyZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX6XN7nYsfBxdb
 zdpopnWRD5xGm5Zx0vfQS1WvvwFUF1A+ODkVmi+MeLxlkeagrUjfbUd07UzZmHMJZfvyD3tz6Ib
 /2KkNLLO76tG2v5Gr454z/NRBWihdz8x2BQvEm7RlcjwPS/+YL7c8xrtJOXSCpY9gd7hQNkm5cJ
 GP3u+DUvwlpfX5kOEdNvQThK/0UVE2ZbwTzbLEyn23W3QvtW8T0NSfcp0+eIHTErXp/l3J725N9
 HQmRV75DRyLUvD+smUmimN3gv38XwsMRHLhDQ59rhduh9V1blXmcLFlXZcjRdCSf1ld0jKdd23A
 bLUBgffNcUyCsMPX5mpITaL+DBdtjscVQcjToz01RTSJ9gAnDqKsjGTLg14iXhIkC2vxZRLkgWk
 K6kOB8FqJnLpcJV2HEVT35W+UTtG6BO7tPv3Z++ovSKgVhzKAx+VgJdplRXXTXWHG9H/1gtr9N1
 H2nfwCPaKlgFI+uB6Ng==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad07d98 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lhXw38L0c4fPFhUHQqIA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150028

The ADSP remote heap is declared as a reusable CMA pool. FastRPC
assigns the entire region to the DSP during probe without allocating
the pages from CMA. This allows movable HLOS allocations to use pages
within the region after HLOS access permissions have been revoked,
potentially causing synchronous external aborts.

Replace reusable with no-map to prevent the region from being reused
for normal kernel allocations and exclude it from the kernel's
standard memory mapping.

Fixes: 531ce288b6dd4 ("arm64: dts: qcom: sm8250: Add memory-region for audio PD")
Link: https://lore.kernel.org/all/20260619-sm8250-audio-v1-1-8a76e033e209@oss.qualcomm.com/
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f975c2183269..f415da478c99 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -867,7 +867,7 @@ cdsp_secure_heap: memory@8bf00000 {
 		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
 			compatible = "shared-dma-pool";
 			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
-			reusable;
+			no-map;
 			alignment = <0x0 0x400000>;
 			size = <0x0 0x800000>;
 		};
-- 
2.43.0

