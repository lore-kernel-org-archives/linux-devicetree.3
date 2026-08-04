Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D099A428830
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827830; cv=none; b=r6t4fUC+bcTsFDjJ8/5tCQHCnxUfBj9kfaFKzEBTphrct34+4SYV2CF5fqrOAQ49JprdnRtFGx4ra+QLVUNfmsRK/bwPAFu7zOb652Muyf8NIhSR8G3no9msEhRQFQwAbD+E4aoAXg8RLnUfUnkeYPfSPVDt+YoqgcSanoB90Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827830; c=relaxed/simple;
	bh=Ls46oUW3bm1glu/q7llsd5yplMkVIyezxYsBXy8ZQ4I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F9ImtnQHQofGO0dxs06bKhvDuALXrawC1jCopLPL+GXbmCUP2xzw7JzDu4Ubs4xC9yB364a+qO4Y7udKU4101zhT9QzQC10De5W8W0T/o0mc5ue3WKLT7gItk3zKIi8on4fHJtHRAiMJ4SGSnU+9UvIMgb9uZqQgidA6KGduG7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KXbKONuq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ReBLd5zP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KXbKONuq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ReBLd5zP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67418OkG2265107
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 07:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kHN4m1i4fZ9hfNrrNW/cU4
	TdZC3J0BJV+UC4pM93O7w=; b=KXbKONuqoIHsDYQfmg1pF1W2I3AtqZXbqPoW1P
	SfK2N+9eqsO3ErKvLj/3Rojasp7O+J1w9J4z1UbZ2nMyfQTvI5IevuTVzghfTMHU
	aekbH95E4yJrhV2O1dS5aWJscs0Ts4/FdNhf/+hjuUIVCt+SANI41wq2hOkBQVJl
	95vZzGBMu2JZ9VmV9Z3ehyQROkTtYq7p60fGTZTcLLjtZl4cHfG4CQVSMxJ0BHcX
	aF9wAQndmz3eTTCOWbHD8bjYac8y/2RNbHDgcjDA9WppzSUKkXMPcnTY1EFFuFSQ
	rXlCM9k+Vah+6jiGFACR7W6zApW7A1pztMbsOCvDr/QryHMw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty5sb08s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 07:17:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bff5c7035so88992571cf.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 00:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785827827; x=1786432627; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kHN4m1i4fZ9hfNrrNW/cU4TdZC3J0BJV+UC4pM93O7w=;
        b=ReBLd5zPP4eEpfYCgLlXeu59lk7MsaE6Kb2rOK7Gp3eqIVgW773C1loVayw2994HUM
         1DmEkiNUpKFpSyvaWvais+iXGSJe7i710ycgaFBvMNe8yZL1taxojWmkNLCbUTZwgjBw
         JSA98MaYgLZjJHzLyGi1PC3Re7iPGMEMFQCMNHFISLII3MzL+R/gC4tU2fnaFg4Tpb3u
         uD8KXC2PM/7NdGsv/Dpk/wcOKFHJjFMrvQc1c1dLv7M3fiZuqQD+ljpNYuqqf9UE4PWD
         GgA1oUa+tgkX9iJkELJj8owxeGaogXmo9CAvJVQkp7D05pdazjnZHDL/RNMbiYAWSVxk
         lSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785827827; x=1786432627;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kHN4m1i4fZ9hfNrrNW/cU4TdZC3J0BJV+UC4pM93O7w=;
        b=d1tnnklSRJwjF1BezgxdleZ8mH4FaY9nIAMVI/rPjr9tSnUY1pWRKzViw4fR7H2XHz
         7b6LZx+1j3ckXZrt7JZ8Qf+Gx8cY7pthQwaQTdsCGg4r7jYdCr5fxFyvexSN+57ALJgT
         4I5t8RNJq6rA6O4XsAkRgKO8ubWV8dlElAvw3AKHIHq8bnQ6niZUNOEfmOqY6R/K6qhW
         LagWduGd92gIdMSN2vLQlL4XPHTg4X8PYjy3kjX3uV2x3BRw6bQb2YUSWdYZkOfgdltn
         hyxtc6TmMYetcHrw5MQDZ4SNuMlLTeCkNVuOslMLPZ8Qa/ejBtBtw3c9Rp62S6/2Jze2
         vnwA==
X-Forwarded-Encrypted: i=1; AHgh+RrAyWPwhAGBPDpzSMXRf3kNpoSoYHFwjDf1NkCX1kbpYYt5zbhnzO1xOrwEV7PloxA+IIpjualihkhQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwvhN09ftkra6kI63oEvuJegF8wyHKqAkC0KNijiquT7xEpHCGe
	l1MS+75N1tBuAjdahl+6hzGPyxnwidLh4SdLlvcdCRW8OKSJecoNmtVbraF2CpslMt/iuDvC+x7
	+Ziwisc8fB0UEWqAyzQIGfQoriIo4+xH760hV0gHdc8I3OfJhoyxJrSWpAp1w2Hf6
X-Gm-Gg: AR+sD12wT2ZhyjH5NrV48NTAHpuxGHYk4VdFJM6nkgvljfB+NGDiLlMyFs4dAEukoyZ
	hm476MMtpkqOxcgGexoqR9ckQhzXosbw2CJax+pX5lonZxYeild3NiZSGLkY2ebSnKJNbOQ1ouj
	TcHKgjkXH6/ouqs0x8CcFvDBfbu4kAHKzEwWXZT/3g5L3y31ocmmpjQtds4rTHz96ahjRjb60HE
	xRnLbWk5lIqMkm9jTgGOMVg3CihVcH7hoeikaxi6JkvyDvAMj0yVn2n0STmYx/jWgwBQmxwq05I
	XDK5nATv8xCtiYN4OLMqBghW77qnAaTdZS4ZP+nl2BCaHTacai99bWBlE7Z+dBCbHAKSIo0Wp9T
	nqlGeC6N16ka7qNppl+xfLDqf
X-Received: by 2002:a05:622a:598e:b0:51c:981:94a6 with SMTP id d75a77b69052e-52b5674b67bmr262412731cf.23.1785827827115;
        Tue, 04 Aug 2026 00:17:07 -0700 (PDT)
X-Received: by 2002:a05:622a:598e:b0:51c:981:94a6 with SMTP id d75a77b69052e-52b5674b67bmr262412501cf.23.1785827826721;
        Tue, 04 Aug 2026 00:17:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm420265975e9.3.2026.08.04.00.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:17:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/5] spi: Few cleanups while looking at num-cs
Date: Tue, 04 Aug 2026 09:16:56 +0200
Message-Id: <20260804-spi-num-cs-v1-0-4ccb13dcc7b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwMT3eKCTN280lzd5GJdo0QTw+REEwOz1CQDJaCGgqLUtMwKsGHRsRB
 +cWlSVmpyCcgEpdpaAIMz7PBuAAAA
X-Change-ID: 20260804-spi-num-cs-2a41ca406eb0
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ls46oUW3bm1glu/q7llsd5yplMkVIyezxYsBXy8ZQ4I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcZHqBPClZfpx1wh5keQDr3zLrCGUMiLQcHA4U
 Zegl36y7uGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanGR6gAKCRDBN2bmhouD
 13xBEACVxYKsnpFVi9D/eGa7cEiCkwXQkiARdpJdGupvhnpc7wn2ew0Fa47XUSOn7TY8c7ES1dM
 OffyXqsuAzvKWCNnEi+XlD5/tBr63if31kI8qU5OChfLHackqYD97Nll11mWmspja1vHutsZCiB
 qZzVBmlTZJzXPCU+RS8JRiam0Ju1jV4K4Ub9s5WiB7qAyo6Q2Jwf02gWD5LWqJTiNa162HYuHvP
 jl3MqLIeXLIR6JHh+i/92OZIQIBFM+C68zfwlR6FtjVp3YXeNc63dQoCMjAf9on6+updiLJ97y9
 be7yhr9GKCj6tVG2T3T7WHhH83KBzgaDiGQS3sQILTFohNrGnB9oQBaipibhZtkUpDfkxFKqnKO
 Ha8pu1ap61SJS5bp4VgT9ajX4BsV3pUXO4opjafzfo4AlH9sZt8M5oNkFnC09B19Qmk6LxigqHj
 6zNr82vtoITYOa1JufbOpf8i+qhszFl7XYvP8MZv/zqRXYu442PIQ0LQA3AiToxRDhcmvgAEUdj
 +X2dTpftGN2ZIY5Y+CRTOqGy0xLCFqI2qMcVSxCz4LhaxEEgvkYy1uxeNcfXk/HXgbpFq4hM7A3
 P3qwmgyMi2Npu9g/FKbQHzRRhv9Lrp9NQOp5e6CcDDB/fbm6XPuGmOikJONdvZo9KvB432nZjue
 ODfKflWYf9ksuPg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=SPJykuvH c=1 sm=1 tr=0 ts=6a7191f3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KYoR_bMC0TEJ0A7QCGIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: vsojUzPoSXwOaak1hzsPYfgXBZ0wSOrh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA1NiBTYWx0ZWRfXwiBx1VPh0Dks
 9g96BRomoNU2cTzIuoN+rNsQzf7OFP0e+OlRM8MZYidyiXRk3NcPqRH/k09W0NTvSXYq5ezOx/U
 CAn220df1f1Vvj3yDtKrkDD+CewOSxtyaZbTLbpNvCMfr+DkOkLs9GJW35TgiGdapbpBx9Wj9/F
 Crff960PCQRHllBe/W7ZbWCRfDylUZGU7kRWfi/iVsa1HUokQIBa+eCZxMRw47DiisGA3/pbb4o
 24ieoefI9JTHYt/r/ziqk+aezbF70Tknfdh3k4iA5jQT6CGZNUANiJgY5+tH/nf23jONcsJTv1m
 n6NURqfn63++LfEd/R5fTOWudWuIsdnKsgHngyAyLIaY+erBLGTNbjn7SMXtX/xGKBOITkyddqf
 B5n7l0f0L4lp++yzNchJAfvIGuzLa6B0CovvxsHoZUZAVZSI0uHw8qytah6xGLwCxfWGwSPo8Za
 oFYgLDFQ02raaXv4CXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA1NiBTYWx0ZWRfX0f8ypgLVYep6
 +sVeYxf5ufEG9hP95UBCE84Y/y0pmTGQerPNYnRxkFiT83nabYlU7WyBNJSbWd1dtHCI4mMesHW
 JMioCTQwT6zqpjk2TpiMi2jEehmYOTo=
X-Proofpoint-GUID: vsojUzPoSXwOaak1hzsPYfgXBZ0wSOrh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040056

Few minor cleanups for DT bindings and Andes driver.

Patches do not have inter-dependencies.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      spi: dt-bindings: andestech,ae350-spi: Drop redundant num-cs
      spi: dt-bindings: marvell,armada-3700-spi: Drop redundant num-cs
      spi: dt-bindings: axiado,ax3000-spi: Drop duplicated type/ref
      spi: dt-bindings: spi-cadence: Drop duplicated type/ref
      spi: atcspi200: Drop redundant andestech,qilai-spi compatible

 Documentation/devicetree/bindings/spi/andestech,ae350-spi.yaml     | 4 ----
 Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml       | 1 -
 Documentation/devicetree/bindings/spi/marvell,armada-3700-spi.yaml | 3 ---
 Documentation/devicetree/bindings/spi/spi-cadence.yaml             | 1 -
 drivers/spi/spi-atcspi200.c                                        | 1 -
 5 files changed, 10 deletions(-)
---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260804-spi-num-cs-2a41ca406eb0

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

