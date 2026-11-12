Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487900;
	b=QR5YIXnbmNnPSxgB+SWlMcDcLJtmfdIuHCFEjdP4i0vSaueIUejdlq+mX9YUeKgn39ku
	 +sPrk4FYIFQQUe1lEMhZ51yYtiWDgiJfZh/h8yDHCsDZb2yfU0ABCM6FyCi6P0yDhRyWo
	 SR9uLyrO7lIlrQ0j18XtetglktTUSScAnYoB+ZpEypTMIRnCYDDUP/omBqm4zxkQl5MCw
	 DjApSl/oumTF6L7TnxG9bDTZowxb/C60vhu9He1rb8441LDIENEE+dQBoX2z1ec6ZC6Vn
	 ntekSjR6u2lF1MZxZQnKRZGeYbXHmUIgXaYg9OZqsSQ3yItyaZbuWMy7vWOU8UILjVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6Gj36U0uXPVABj8Go0TllSZedfwbAaqUcG4kVbOMuKg=;
	b=42Jz0dhBzNLJMB7sGIMVpH7ByFy4NzbTU9wl8PZaLcy1V+BCklAaU5Eo87MXFMBAwB4v
	 SLErNOa56AK1/oPn29HoNn6GnWxv5gjg5LMdD8fi6bsqfje7EYLNvHULf97ndN3kdpH7S
	 1ngZXImoiSa7gJpfhe/9QxnIqmap0MoShI/QjNfvsV//5YoHe65gTT6AJr8m8Hg3gNAVo
	 RjJ+FKsm8dqck5fnMak030W8sMuObSCQ35I1y8buAM3XROs4A0Q0XCxBT+fLEkLXmI/JU
	 FHC32Pw6J+9xbDBc/m4TkHmswj600bJrhUc8HW2qlXAn7iykG9/Ww3dYbEKRCoqLuIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=buXJgF7K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hjd5h4QC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05A5606A32A
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A05A5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=buXJgF7K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hjd5h4QC
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7iqN6125791
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6Gj36U0uXPVABj8Go0TllS
	ZedfwbAaqUcG4kVbOMuKg=; b=buXJgF7Kz/zYMtt2WgRhslnSLGQMYRLX4x9Y4a
	bv3LNUz9xPEOIIWU/lwzM555gshcvEe5Sf0U4ttzdVuqAy6YGYj6ZcXS59EYXp4x
	q3hV9VpMP2EsVNd7JwwhVtYdBBIz8/7g+c7khtCA+QoB2tAP8xfKIoEAPRSDZZD1
	RT98zr7htkP7SKpDhtbo9IAT6fc/NOJJJfI1pE1anvAUthZGwMT2rwHm0EVAArTc
	Exvnr/rFKrw+cxvbuh9Q/DpEqEEGHxatwn0WKdWYWvOgpR7Q4Bc1IrP28mPHgjmO
	/oTEifSoSzjea/Y2/+10ejvcyTRXkKscVQ9BwL+s17cV7RYQ==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a092ew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:51:38 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-716e54d027dso4883739eaf.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794487898; x=1795092698; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6Gj36U0uXPVABj8Go0TllSZedfwbAaqUcG4kVbOMuKg=;
        b=Hjd5h4QCEk1LIrKFmJTbXHKoJpskhlvON7xMjyjLoptlIGPshuMu2ytWZKNm7QbU+C
         NGq+Wphc6ja62CEIROCFRXtpq4F4Ym1qI9JUUNHvpVldl21wwHWmt5KwxfIjez51JXTi
         /o4779TjX1NyjHMBlLe3UyU5zG3oftivA+/4vLHBOoGMcsBHbdRP8cBSbI14i9t7Oj4M
         pZ/TVDapaosb7/Qzp9W3JMxHPG+lZnadc3nTJ6jpxPV6RLcus0noeeDI/2O+4D6Vrfba
         bugFTLtTz+oZ8HrciEzDuxr/0iHnPKG6vWxfCHgFzp/sv9ygkbckfLPdjlxZCihqZiSz
         SNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487898; x=1795092698;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6Gj36U0uXPVABj8Go0TllSZedfwbAaqUcG4kVbOMuKg=;
        b=g7vp4GYG3bM2trJfd4s40BEnmAzyyyPloIjgLPSFnzn1mMKh79zKvzkdKvycrKgT5q
         LUL6pHs5L5puNCggu0fX6yGf5RVvk6Zysjoyy3aKcVljk8Vfaor5NwvRkIXpR/t52Z60
         An6sBiBJ6MyTcZ50f6/OIJ9IMG4bJYMjZ1e/ZLJPObq1TfwH6td4kfp1+kh1lfA9CjuR
         a6fphSyp7LfPcUl9Mt0zbET9Y/paYp3j2MeUB5rhQuvX416gYzS3I710VBkfTlp9OQhH
         fs1TjPpwqUKCD59iCLmb+0bBs9BrE4KIdk1ewgBcmicSD7fYlwRQEV983H4j8g+YI9wd
         3INA==
X-Forwarded-Encrypted: i=1; AL+hErH0SeCB68Eg7h1ih5QcdHlVwMUjrznVI2LhGE5IOfdnDXIbQeY8odmZKAX4QZcZ0Em5HnfP+/8HxMIt@vger.kernel.org
X-Gm-Message-State: APuU4Z8C4yqJq8PfX4LNml5XGBptgGQTER3cbMJFnvE78fpQe1TbIVkI
	DUBy53dsI4lMgRCeBZzD8oeNkXlLMg5nmrtjOfSstqm9AbaoRwZDedr9Kf/bCnjmxDiGUfOvR3c
	0/l8G8czZdpAAVFKf2IbIQ+LaBu0NBXdg7pzrfU59fs10455h4KBFcGY2gxW3vInHz5+HGvbi
X-Gm-Gg: AYBFou134JCPHHL/J4Ahmw64wSJ9BTVoQFRfbnxFLW4Nltb2/uyHrI9bLxtz8Pv65VL
	TxF4QBiWDPxlgY71F4oN88Dhp0N+uBN8pKkLlyOAC9z+GJRJfnmaREQwHiy7+IiJrzvD8Bkzi6Q
	JX25w5rw5V4mYaL0xZ+7KK7C4dFagtiuDUnPFQK7Rzr9QjWvSyuWLlXAWaciCk5P6f/Ye5pp1zb
	OBdyKAMH4u9u271V/pwLMWVo6cGv1xhwzl2lrIYR+7h/+RAeILK48YMjibYqH8TH7VGXQB8tmVC
	k9tqNmi67kQHqiPZsoI8g8KuSq/E52wHn/QQGfj+ekB6wU395JyMbwTjtFK2aT6mqrh+GpRNcOS
	PBwWfGBD9dR47dGCPU1At2D4gsbdYGfck+nsR/3R2WEL14RqsBq8Bgatvtgqn1/oohl0LXg1q65
	pIOKaBqQ==
X-Received: by 2002:a05:6820:f002:b0:703:34cb:a3ad with SMTP id 006d021491bc7-719175f2695mr3473696eaf.10.1794487897719;
        Thu, 12 Nov 2026 04:51:37 -0800 (PST)
X-Received: by 2002:a05:6820:f002:b0:703:34cb:a3ad with SMTP id 006d021491bc7-719175f2695mr3473674eaf.10.1794487897025;
        Thu, 12 Nov 2026 04:51:37 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcbc7eecsm7608191a34.15.2026.11.12.04.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:51:36 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Shikra: Fix qce configuration
Date: Thu, 12 Nov 2026 18:21:06 +0530
Message-Id: <20261112-shikra_qce_fix-v2-0-2ce112cc2ccf@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADq29WoC/3WNyw6CMBBFf4XM2pK28tKV/2EIKe0oVaDSAaIh/
 LsF124mOTf3nlmA0FskOEcLeJwtWdcHkIcIdKP6OzJrAoPkMhOcZ4wa+/SqGjRWN/tmMud1fky
 T/KQMhNHLY4h34bX8MU31A/W4WbZGY2l0/rN/nMXW+yufBeOsUDpNTCHQ1MnFEcXDpFrtui4OB
 8p1Xb/ssTjwxQAAAA==
X-Change-ID: 20261006-shikra_qce_fix-270b735479ad
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: wJqnL0e9VgsBgmFpLZ5wX1TaG2Raa_hk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX41bcvIRSIh4z
 Rl90Au9Wjo81YbimZkAxDEmta0X2a/BqEzV/3wqpqadW9vq2Ljk5xNaNV39t1WmeqTCyy27Yeey
 OXz0X3zQT8RSk7+I48doTVSSv7e8HNkGjnVmws2cXM6s0275CYQIJKNpEFi/1iugZobDJiBVfuY
 GDL5SANj9djA+lPdebCqcto71/zzZWaWUFiRk9v7IOvcZQ8noly2xWi1C3RTPFe5XsnYaJiRlrj
 5EgsWhhNYA+4jhWoDI5WCuFdJnHcMaztVrg7WXG1BWxaZKBydJCCzqCA18cJYcijdPoVtfg9BaV
 I7cCcxy2e7RIkxz8FNYRPWGUICrQGx0OP3T24l3/aG1AjiyrCKHHIqF6W11fRc8Zc8rCfHwmVW8
 WPe1dB9SyiDiX/+0ME9qSRzvmE+SMgPxH9TukBPVoN9aUINVsbKlTar/s/HnFgBTQFjjphzbxiu
 yWl1QUHwRanygRZcDeg==
X-Proofpoint-ORIG-GUID: wJqnL0e9VgsBgmFpLZ5wX1TaG2Raa_hk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX9rVfUZg2CV06
 8agTgWHwFILwjNsgnoHt7nI+NmRqlQN2CZQW2rbWrQWXzRgF93A4LxXueenOIQJmYqYy8n9bYKf
 HLOu1565Gx50devfFAgH+dYBamgDaDQ=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af5b65a cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=FNyBlpCuAAAA:8
 a=J1Y8HTJGAAAA:8 a=JAuPaQ-8la7bmygXtKwA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22 a=FO4_E8m0qiDe52t0p3_H:22 a=RlW-AWeGUCXs_Nkyno-6:22
 a=y1Q9-5lHfBjTkpIzbSAN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120051

This patch series fixes QCE on Shikra and targetted for v7.4.

Shikra require explicit clock which is omitted with current binding
description.
Also, one more reason to update shikra-QCE is, clk-smd-rpm was doing proxy
voting and crypto was consuming it. With proxy vote removal, qce need to
vote for it's own clocks explicitly which is already being done for
agatti target. Adapt same mechanism to Shikra QCE too.

The current qce configuration will still work but this one is more
appropriately describing the hardware.

Validations:
- Qce probe and kcapi_convenience.sh tests.
- Correct clk_summary output as prepare_count and enable_count are 0.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Changes in v2:
- Update commit message on Konrad and Krzysztof comments.
- Link to v1: https://patch.msgid.link/20261006-shikra_qce_fix-v1-0-8ac54d81edb4@oss.qualcomm.com

To: Bartosz Golaszewski <brgl@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
To: "David S. Miller" <davem@davemloft.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-crypto@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

---
Kuldeep Singh (2):
      dt-bindings: crypto: Correct Shikra QCE compatible hierarchy
      arm64: dts: qcom: shikra: Correct QCE node configuration

 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 3 ++-
 arch/arm64/boot/dts/qcom/shikra.dtsi                   | 7 +++----
 2 files changed, 5 insertions(+), 5 deletions(-)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261006-shikra_qce_fix-270b735479ad

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

