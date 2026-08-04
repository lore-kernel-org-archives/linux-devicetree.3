Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF7F4399CF
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827842; cv=none; b=OxVbXeEMOWJ5AkL2rZoSMxhINxquic8GK1zLsnYbq6huNGGqxmsjogIILVj82CAiV5Gcppf3u8Zddn8zOmEtgI0u9A4ehmKZf/COGOOcnIhxMxoOT7IJMnxVPEUzWCszo5QfcRE+czhsvz753k3SN0LGu59UtwyB+UnnRBp0/II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827842; c=relaxed/simple;
	bh=vpjPOm3cj55xGdd/EOSoChfrcxstG3L+1v0CwT8/FC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZGFtZ9l6FOq83OBQw4wcq7MEBUPMMXs/90Yzk3KkAJTyu3QOkhEAiaT1ri6EbJLknQWZY8+TljZ6JzvgDTD7LZXjDZFmCXJRn64jZ91KyrXtBDbFfQPVDQXYnh6jq1PnekUuTWEFNix3Fni+p72mUMNCJRyGlfrK0g6M662HzkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0j5J/bZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DBXorMou; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0j5J/bZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DBXorMou"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67417hTs2351978
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 07:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jeq1FQZMP/z+KoXn/UwCyrFH24Dchmhq/uExQ74p/as=; b=b0j5J/bZZv12TD7S
	Fw8b4ovxRgHdkLZMufTZV+bK9ZhRd42bbSEIQPn9E085TreOJBeq2kzaTNsxPMC2
	Km0PBi10KW7cPwxp9pWUBM+CI3heGyzjI+W807WFGPpuXTUkN7sXvireXgbG8Mlh
	ylOFV0Y7FGpcgBdtGNS6uT9NGySWB3Hds1gZ1ENXX5f1vs2EGTPMUlDeDeRc3sZ+
	0mSGZVlo+093B+lETQv1j+jx8sm4l0C3kUYDsch0Aku6b5J4qPRAWxJkLvOO9VCo
	Rck6mLtGIOPOjkPBoXqaF5hGSSD/RI27rvPmMbRGK0ledu0zhgO1jYGqECjLF3mX
	f1/u3g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu1p8abg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 07:17:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8eac2620cb0so43554876d6.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 00:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785827838; x=1786432638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jeq1FQZMP/z+KoXn/UwCyrFH24Dchmhq/uExQ74p/as=;
        b=DBXorMoufZ7V7y+7sMzAlaQ7+JDOYDPfTtShw5tNk4il34DhThUAnlnF0RVAGwuOcM
         o/Dh8nmqJuct1Ot9ZjQ6Hdt9pilJiE5PGfXkJy3fTBSU4Q9da8+0ozTFcpkmDepWYbuV
         mCb6HWl2ZkacQDXcGyaupzozrJarSnejQKHaRSJXffPSoowfCzmyqS2B7OeZ6qdyRpH+
         ZkLseA0DL4wWL29vYcyd4MMPAvlTRKuHWHZsaTxuI1XqRg2zGJliOLwTluGTZLmTaVyQ
         tt0Ota63J7wotuy6OtQZbKg/u6vdxX4LAWpZ7bJZ+c9Bs0Y1+iKZEOdojlUnd78HAchf
         McuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785827838; x=1786432638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jeq1FQZMP/z+KoXn/UwCyrFH24Dchmhq/uExQ74p/as=;
        b=FL4r8hDvtjO6CNBJjQLwwtBNEJche6SvNiuUtXBDcQp7PWuOvFijiscDRyEums4KYe
         W7zxGWLognAMj7otnUGrH0Vuu/ASRQXHAEi8NWm6O/fjzsgoHAg6Y321ytnHiKvBXU81
         0t0nMDGOewbDlTRWoP5rSFoiZN+NetBMNgjoUO0SvCmsaCCapAwQKxPhkCCKMOyPwu2Y
         Lv8XZY8QDvSOkzXtifjJxKkjIIubDN1rivGR0fu0ZQjKfyHZY7Ok68+nXLUvW9COOPzj
         95TFvoJhlLHH6EgdMcjKpY/V4kAhBhqEbofv42mtp7lOWhBXRlfRAi06mb2Zu7nxZbnr
         owyw==
X-Forwarded-Encrypted: i=1; AHgh+RpUaD8yE2SbzvRkHXg4IUrwbU5yWISh18bFDx6J+hKkdPPf9UZ1OEEK5fLBFdLkJFVcU+5+bp4k0mjP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7t+M7MJyU6EKPezduNnoBGEB5He4uxEO6GgBNEkCgGu6TE7Dw
	qWkdPNdA8HClNXpbj127o9qDG5RU91OA1AUUtbLNknzowVG2cVBwCcdnyneZ9/hyTTTbudiAGEL
	60Ys9cQfG3oCdwRvd93EoUuW++ztTFzR2MLXIkn9tl8UX6woM13SU973ie+L7iCb1
X-Gm-Gg: AR+sD11cAtiayhG/Yp2lYU2vPU4OcoiWFOjLxRPZkKsRiTJLqlVc9fcbyUh4rWJnRPd
	aEQI/hCa0FVq96fwQw1VgxUGHWWdMoscXHp90nUHnDyqEDCpnnoQeOqWC8sfdsufgLL+9+aYnF/
	mgKH6GCYO5YWclUVB5iSdJlyP5MlHXkvHIPWQTOlXxU/hVNMLgKBtRlHywkjl6fSUx1TOi0tuWn
	EIz+idKU0b3NDvD05a9DoDeLX+ZLX8ONH5Rrd9E7myY2j9F8dbCIiyz5/YeBPcyBpTVNQNHVlMF
	3DknsSbUKZCemqyiEnNr66+koQNelXx/agOoBrAYAKkaYnzvCS+hUk+y93Ei6TLHTE67DX2uqrt
	T2SkhjtLNtq3+FwzV7HjYZcx8
X-Received: by 2002:a05:622a:5790:b0:51c:92a0:b2ca with SMTP id d75a77b69052e-52b56796944mr276102871cf.34.1785827838482;
        Tue, 04 Aug 2026 00:17:18 -0700 (PDT)
X-Received: by 2002:a05:622a:5790:b0:51c:92a0:b2ca with SMTP id d75a77b69052e-52b56796944mr276102651cf.34.1785827838082;
        Tue, 04 Aug 2026 00:17:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm420265975e9.3.2026.08.04.00.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:17:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 09:17:01 +0200
Subject: [PATCH 5/5] spi: atcspi200: Drop redundant andestech,qilai-spi
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-spi-num-cs-v1-5-4ccb13dcc7b0@oss.qualcomm.com>
References: <20260804-spi-num-cs-v1-0-4ccb13dcc7b0@oss.qualcomm.com>
In-Reply-To: <20260804-spi-num-cs-v1-0-4ccb13dcc7b0@oss.qualcomm.com>
To: CL Wang <cl634@andestech.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kousik Sanagavarapu <five231003@gmail.com>,
        Vladimir Moravcevic <vmoravcevic@axiado.com>,
        Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>,
        Prasad Bolisetty <pbolisetty@axiado.com>,
        Karthikeyan Mitran <kmitran@axiado.com>,
        Michal Simek <michal.simek@amd.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=841;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vpjPOm3cj55xGdd/EOSoChfrcxstG3L+1v0CwT8/FC0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcZHvKYyBX0HJqdTzsTetFJ/1SdRnFIw572j77
 MJ2k/QKLGyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanGR7wAKCRDBN2bmhouD
 16SzD/48sVjwnveKEw8uD21xQl6zoA8Ch2uI2VMORVCojyGpTpksje1CXf4XxyikjhGAcM2h3vP
 zmbUeFIqWIquuQiaQXVrKmZzEyG7sRsGwh3V6ZcfLMsmvUp9DGxmEKiUdtAGw9au6sv5Uld1TkY
 n6/ubG0Rqg0OlmciitI8RFE8XofIGYNmk2QCF0zXi7ssd7iFypUhqjeVkYAh7+1YcWv734pQGxn
 F2ffhH9qp431HaInw1u2RlOj4O6w8h347tfNjfAQZYl8MKsL4RcC/gJc6O4ZCs4CQxsWA4YwH3p
 vq/py70uI5YWZ1bOSjpO/kOPw9TG+qUfG7pNrFo10UcTv8IhjhfVt3drDpuGXP2lOpehhxRnGbp
 HlFMZXbnGGaDex8yGP+fVNoyEgGAr/Z21ZboHYjQGWOnswDCU3qgvriAjJEprsUDan2FQzEszH8
 Y9tRL6wsaciOWnvLOZEcKbiAYK+LsHfh0ptE6419EhsBF4NT1CED4hqWl+iEM+aYHRp4Yv7rUgV
 ka3M5Zal/fs3AnjmrA+3MObPbx/iTa6ZKEtMm5S4bXd/8pBhPT8hipdTJOnyrn5WC1GUhVQMwGp
 fq7S+FnoOS6mpgY2g9nuEvgiUW+4SG6LktSesv9EQpAFkD+tqSIIEktVbgF/E+XLe8DcAlKI0Q9
 XZb+s74PHUtB3gg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=A5xc+aWG c=1 sm=1 tr=0 ts=6a7191ff cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=9l9ugx5lC3ssAmPyifEA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA1NiBTYWx0ZWRfX+FyHbBUmonN6
 56nF2J/FwfOZp5AuZJ1hqMCZ14Wgl5TMZT0vr5XMfjaCVQ8DYKt01UfkO8EYX1AupbsaXxqSvYU
 jg/93v/8+AEAtQGWneYqiw5ILC4fwHmzmMVZD6WGWgCB3PZ6BMTRoTshTNT/GTERSWBM8VYVIjq
 6VMfLTCGQxR3phN3yMRuTxgMekyXzm69Vd0zlz2rTJ7ZArHzuPl40epXxCuG5ltifwhp+4A3+kY
 pguRz2ZOeXZvDPQDSAZUyOaphmYpr8oEG5eJHuEg3kMuvRdyUYMFNdSUKjUlifFCrxAmIijCXXO
 SYMjE+/cAq/d8qS93x6+w+HdWqY4SbFOiS+7kt2xdru0p0iSZFF5GXx1X/EhLdeNA3Qa3liFRBw
 wTupsg7scYkSvEc9gB1lOBg/13EPyl37B9X9xqIt5Ult7lV7AHSwQN2+I+HA8J+nc25YMxuvoYs
 sVhvx2VkZ8Vo5NjCcEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA1NiBTYWx0ZWRfX/6F74ySEOoYZ
 j25ZvpWtwptYPB/21WSbZ22CaQJ4ALp7GdG4ZnFBGqU8TbHa5ZuzqH3zeezPqMvEXEAHwQ15dXh
 s4Voi4hFIUcUUJRelqEreUDi5Mk/OEU=
X-Proofpoint-ORIG-GUID: 9RtZVJVg4MDjr65JX7xClYKrZpWIikit
X-Proofpoint-GUID: 9RtZVJVg4MDjr65JX7xClYKrZpWIikit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040056

"andestech,qilai-spi" compatible can only be used with a fallback, which
is already matched by the driver's OF device ID table, thus it is
redundant in the driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/spi/spi-atcspi200.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-atcspi200.c b/drivers/spi/spi-atcspi200.c
index b6ea8e556335..b532c58c0ab9 100644
--- a/drivers/spi/spi-atcspi200.c
+++ b/drivers/spi/spi-atcspi200.c
@@ -638,7 +638,6 @@ static int atcspi_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(atcspi_pm_ops, atcspi_suspend, atcspi_resume);
 
 static const struct of_device_id atcspi_of_match[] = {
-	{ .compatible = "andestech,qilai-spi", },
 	{ .compatible = "andestech,ae350-spi", },
 	{ /* sentinel */ }
 };

-- 
2.53.0

