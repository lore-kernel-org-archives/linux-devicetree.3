Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471939;
	b=bggyfPzAy/E/3h82bb5WZ5XVigocxjEGa6pb8fg+XAiLaIIOtNPe4r/qGmwi1D9EvFBE
	 kDOdeE8PMIT3JToeHHjFkM5dx+Rr3t7/9J7c3t+dUO06kpU6Czhs9zrG/m+N3l3Hu7NPC
	 SxlFUwZPXM3sz9x7L1MSihlw8Vcpq9kOEcDAg4Et8C/T8aF471snb9D/JSPnEWK7KD8zz
	 hkgIYPJ8I517fGNREyJSWwvQrEFeyJwoaVFO3yq6bVN+vCRRuaBq5LOJKs4D0xX5IonBp
	 UV85rYibSdWJ8/ZGrT0mheRY0Gtl5gIb7K1qpGehWfQTsweUfovyYYoWCsFYbVmqMkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471939;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RGJAfdrg71ZGzilepcfH7fG0P5vUDbAbU4ltPfqcZCY=;
	b=OsjfWbc8gS1Rb37Vj0If7rPnj5eNBr/yUMPqpJlUjXY1/k2GtTpbBJwW+2MVIDUFahbt
	 By0pSFpxfHtQpopR1iExbrB8fgEaVICV4v191AKs9emWug337KBi9uvSSfKM/5aBhdCK9
	 wKL7flhIt1aWrAB3i74tDBNw1e5bogd4Hu33LhznXdrzcsohhlTXE+BMWd7VzM93lmlkE
	 rbcPZ+QYKM5X/e5SuPjobsupcY2lzuNUQwKbcSxMYFMH6wzJd0l1tKE63OBOExS3kt3EB
	 EeVf0FJvNkxsJ4uKZhEdJsHMjxF5GNKU8S/hQJ7m73yuweIfzrfZOhXgr1One+dkHVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=figAiWkA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bye4dW6l;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97E9606A326
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 22:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A97E9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=figAiWkA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bye4dW6l
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJueal2827540
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 22:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RGJAfdrg71ZGzilepcfH7f
	G0P5vUDbAbU4ltPfqcZCY=; b=figAiWkAS9XyDn0KhTuIaFOQOEj6NJ9wnKUIaA
	MGKrbz0EXevgkGwGMG6YchapPOX9a/PZ6rJdpxbKoh+xRnH1WeezDTR/akVVuWdX
	FUwJz1ymjmkBF/fR18hys29UQ0vjt9F+oJNYMgkb4ewj9/HVukQSp6Wj/FdzKdN+
	U6RA52cfySoXFXMGPdWi8nYsWG1RfSzNwvbFgIYlJiwsyXr8BE8zdaJvgLyUARa1
	V7sFbKM+4CaM3uztT/L06yfHI0YDdOadonC1tqblWRM0dVZAtmHUEJYULZ4pE80n
	rUaW5yPHGpV5sPgwhmSgJ1mVkNAa/Px3z8y1AmH+QSqtZd9w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx3v7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 22:12:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9496ff065bcso531599285a.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795471937; x=1796076737; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RGJAfdrg71ZGzilepcfH7fG0P5vUDbAbU4ltPfqcZCY=;
        b=bye4dW6lIhUnJ05BP1FI0LxBBB67m+yMOzxrjgtRHWaM2HOkACfGFl6nxcYNso7JlL
         rNOiHZ1Y9iV90BXcLO6EWvnqb4UhxbKQvCj3/Bo6hUWk2oRksK20+lbfwGHfMTeMLYV4
         f3jARrAckTRUCzjfH9+uFUergka9pf0fMRCBCY7Tb2B2HeMRr8fDCgxF+N4kZcRe4P+d
         fPq/TOeKodkZU3aH7cNEQLO3SDK1aVYzwFMk/9g2L7zx+2TvVH8jACtR1n0P+U35EHs3
         KYZraTnxbbwntYaScXryKvbihibh/BjIqHprsJROvnTbrMBji3rZH0hJesWaCMiUN7xT
         JERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471937; x=1796076737;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RGJAfdrg71ZGzilepcfH7fG0P5vUDbAbU4ltPfqcZCY=;
        b=DWdMsyBan681QkXI6doT493nmuoPKJ012qYgLwsMwu8RxHPIy/ch62f+kUiKvs4qfm
         r1lYWj5jdWd7jDq4vTxr3llrS/JoLQ87AxCVvpkcVb28z9+HN72H57SfQfAOksjn8UWV
         dRlETZdxCiwRpdBtAe4jblKCfMOzz5Nfi+TUcDbsHTu+kJXvK9IwqjWciFEbR7g15m+T
         5lFMUNJMrLd48N3OZjcogVG7uacBYkZpWUto+M//yPIVTwsIRbm3Ny8moy1R9ci7Blij
         7LYur0QbQ0FBst6n6DBaHmDfZPbvHFHA9yj6JxMiwN+ipdG1BosgpBGhoBY1e3NKhqCI
         l+Vg==
X-Forwarded-Encrypted: i=1; AL+hErF0qPIVGygVwcPG8SN0LBfXCAW3f27zzKKfMdqQrJALSEEWrHZItj8CFyEj15hKr0gUlcFtHlAeFZbG@vger.kernel.org
X-Gm-Message-State: APuU4Z9Xlbe/F4WDxADQGrSrvbr3kt0a7tV6NVWrSXHs7YDXY8iP4WtM
	FxhX2taITOOhHlHR+Sz+sF3JSiLRRzbLqkLjNjhb5AYABN5/fuCPqn0A9KT44Yk0KBWEUmCMKay
	SzOkplfYnvPgsD1yoqMrAn8H+/nKm9ZNpH6niTosg22Da9p5WlI3JFJviYRDtOBjp
X-Gm-Gg: AZFdTZf08LfXHRninOkHlk6leYBVtnNcmvE/8wIRtwzy5fd06OfGicKUlflIj1RERnX
	axmodAuugB0Y0QhJBrD21LOKnY4soaISmWAKYGpOhb39gTA/v2gk37uYRu2KGwfbwmqvn6A2sGY
	hKFwV8QuohJ1gYiz8UvFPFzP2InKZQo7iaqKFDuFhGWbtsI2H4leibtuqTrRKykcfjhUd+K9tr5
	WaMl6TqxqDWV8wgOmcjWhXFbIPsoRre76AWDud8g54TG3DeyoWLUyhRIb//ByclSmvwaY8jB/qM
	pixq9WfSEGX0lIC0pwg01fV+3tH+Zjnrdh8K8dBmgj1dOr4PtPA/aHI7qcWJ/7QsEGZkJc4yfCW
	qU0LPvzOTcVHWAkEgxH8mRInTvs7L0Alov4bsIjVI5XGC1T3XWnBLpPC7sD2qEfaM7N8=
X-Received: by 2002:a05:620a:1d0b:b0:93e:6c4f:bdf1 with SMTP id af79cd13be357-949ba96e85bmr2174130185a.17.1795471936822;
        Mon, 23 Nov 2026 14:12:16 -0800 (PST)
X-Received: by 2002:a05:620a:1d0b:b0:93e:6c4f:bdf1 with SMTP id af79cd13be357-949ba96e85bmr2174125485a.17.1795471936327;
        Mon, 23 Nov 2026 14:12:16 -0800 (PST)
Received: from localhost ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm211804255e9.1.2026.11.23.14.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:12:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/2] soc: qcom: socinfo: Drop DT bindings with IDs
Date: Mon, 23 Nov 2026 23:12:09 +0100
Message-Id: <20261123-qcom-socinfo-id-dt-bindings-v2-0-4504c1ce869a@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQqDMBBFryJZdyQJKtJV71FcxDjRKTWpGZUW8
 e6N9gKdxcBj/ry/CcZIyOKabSLiSkzBJ9CXTNjB+B6BusRCS10ppTVMNozAwZJ3Id2gm6El35H
 vGbByWKuyLYpaimR4RXT0Pu335se8tA+086E8EgPxHOLnrF/VkfuvaVUgAdNI54wuO3MLzPm0m
 Gd6GvO0RLPv+xfcbzLO3wAAAA==
X-Change-ID: 20261122-qcom-socinfo-id-dt-bindings-e6fe815b4480
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1343;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ixs+Xf9HRb6b5amjgvE1FPvRJEPclZ7DZ8oKq2faZXk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrBLo7VKePSkf0Ha+bUy4l2f2Yk24Lvpk5IAHS7
 jks98mNQkuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawS6OwAKCRDBN2bmhouD
 12RXD/4+tibSTTTeA2HDlw3CnAHKxPdq6sr6SQ+6yrKhK0js/EjPWPtTh8a0xk6PnjdlwW1nES+
 YWRK5voXWr++A4DQdprlwrrsAjKRJgrokXqmImjeKSLk142oaePsH0xT5ltiolN37vNp7Txpqd6
 U/zLTmt1faV0/3JK4QdyubzLcc2dJTgtt8EpH434offfCvtbCic6cyTlNk/pihjTPGUj75zp9rC
 fScKfl1r4iZ2Mapu5sudvjNNQCUhxtM8KXQTer2rPYiVBnklk31Cke9PA78UE1OLHuE+mMSekpT
 ehspatFOq1Iws2iuc5+v64sKhJiBDh+x41z87b3e4f+BBrqyfYWHwAYr7IUSGFoHe9hnbSJbSey
 6iTdCBY7HrN5r+1gy/byie2lx+AsSSbyg15+4Oh4vaKAsEgiCnUYbgm4gshEqD6iUyXhpC6ER3/
 r68nzauBUiovvaBqsWtSddWK5fK+5xec273Q+y3mMdzltDzJfhpAc9ABRqeEejNaAcSA3IZFsgW
 KgLeGzLo5QRcNox+iyXtESZ6RAa4XDeb8hA2zL7p63loDbTNiId+5xhZUsoGmom/KZa+sKZWWl2
 ldtgaSB98kkJtjeAGsGkxOQt/D760CPYvt3uVDrdAJnzck3yKYgb+BQWZdFvHhD+uPh/aPekSud
 Y5XRjl8KZa0qGog==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b04ba41 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=1ggKHJeX72ul5W_pt2IA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: RVGUHj_6lrBq8sm2-lsQ2mdU3WCMMXln
X-Proofpoint-GUID: RVGUHj_6lrBq8sm2-lsQ2mdU3WCMMXln
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4OCBTYWx0ZWRfX3vyyLt66OSfO
 DReeUzmu3cWBY2aag05wW/ckhhdE8+Wqlfuq2ccRdSaTS5AOA3p7gwTXnkQ8l/ocatv8sQuBvhe
 DVZwtKlv2K9scl3b5VbYSc9XSNPMXhA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4OCBTYWx0ZWRfXzEI/ELenzEfJ
 5BjCL/XA1s3yPx8k6hMYv5PyYTd5DPcFE97sj3/LcxsRILbbdvOWEOZR53h9SDUSvO95jO1PWsZ
 /vgZ/UxQ3fuWcmima7Hb3lwFRkBgcvBQqmFhqeVS9QwG7v3PD3q2e3P7R9sO/z/U9zry9g5VP/E
 3le612kwGvP9QmJaU08oOZKslC/15KLaTbU2/wBi4zpPtQNNRyTW7+NhGrRIkrg4kDCGggHO62V
 X0HaMGTqRtK6SxixDrhX1koGSyJbPG/Qnxxnh9UXgXSmG32+jv6WaURdlQccjbhFbLP9CpLhe3+
 QrEmnsXON0OY3yyjiw82kffqpyHC3IHQHKlPt5Ws9dTX4dWlLCowgyuasFVgMva7lVIp/CF3jNL
 bA9eTUfuBGbhD3nz4gzpZqxdIa+77neCKGEc0JCxx/DRYGFmbBntBT7P8AELABWVvsE/eIjmORB
 8crITDjSbmJwD6eva3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230088

Changes in v2:
- Fix order of QCOM_ID_IPQ5404 and QCOM_ID_QCS9100
- Keep QCOM_ID_QRB5165 and QCOM_ID_SM7225, as these are the last ones
  allowed to use that DT ABI
- Commit msg fixups
- Link to v1: https://patch.msgid.link/20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com

It turns out that people add SoC IDs as Devicetree bindings, thus ABI,
and then want to change them, for example because renaming/marketing happened.
Well, that is discouraged - either this is ABI and cannot be changed, or
is not an ABI and can be changed.

https://lore.kernel.org/all/9eda2209-d64a-4a1c-915d-4415ac47df45@kernel.org/

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      soc: qcom: socinfo: Copy new SoC IDs from bindings
      dt-bindings: qcom: qcom,ids: Remove unneeded ID constants

 drivers/clk/qcom/apss-ipq6018.c      |  2 +-
 drivers/cpufreq/qcom-cpufreq-nvmem.c |  1 +
 include/dt-bindings/arm/qcom,ids.h   | 91 +----------------------------------
 include/linux/soc/qcom/socinfo.h     | 92 ++++++++++++++++++++++++++++++++++++
 4 files changed, 95 insertions(+), 91 deletions(-)
---
base-commit: 711b991738702a5c144b7cd1d182ec03b08e8853
change-id: 20261122-qcom-socinfo-id-dt-bindings-e6fe815b4480

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

