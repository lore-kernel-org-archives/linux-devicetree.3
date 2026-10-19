Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428385;
	b=b7oN1uN8wv0elTM3mUzJqioki9Pe2n7OLId+QULk+d0GTuZBQRfP5fmawt+j1xYNJ54k
	 gp9/aVSlu2Mc418SbP1o4w/GAkmeYHgnZyF5uAnAxr3rqZIxHzVKvg6Wl3JY1X5dqOd8j
	 FyhMWeR7Ktx4A/H0zMt5B5aooaNRmYixlRaAUaNaKFyG/oJkVHqze80wGYAGe4YIZ/3ck
	 6ha3hQdthloa8t1gpQY50S9/FPIO1sSwpQT2cvq/oyPVogL98NzbJFWTiHsKOk4bewQQS
	 ak/2p4Sh+QrZ+A/I+BIFKkql3DPxFCHH/Hu14RGExnJXE+OhkLt4S652kSs/F33K7eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428385;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dpE2Z7eaR0y+FTQIRzAnRUvkDAYm9gECZfte2MsEvBk=;
	b=lrVDMIeP/VQKX4eNuroUQlh/5jddHyfusJY2i1qZw3BZusyI8HJ2TBEBuv36x+1qADnT
	 U8PVhe8OeDdLQn2BR7e79AkmDfXyH0A/vbMWwrh/C+wBCxJxMRQllsswxVbvJk+EuJqCd
	 jhrUU+6xr0Se7e2uCDHKkyNrRscX18Pg9LBbkqcTyXAKClZ65fkOQ1UD9yKlqyGwbudiN
	 HOpmRqXyBGgPfT1lyi0X3LinAayI6+wNse8ivK8p3/qH337dpMttr1TH6NFraExOVB4Ht
	 1sVZrCOT/NPs9f0dqJdbXkLrzcNZGYeVKMMi+JhqI2pXxXIZPMA122pr5KThC6pvjTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i53dx13E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JWBu1Zmk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A5960A2610
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35A5960A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i53dx13E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JWBu1Zmk
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JFOv5F035958
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dpE2Z7eaR0y+FTQIRzAnRU
	vkDAYm9gECZfte2MsEvBk=; b=i53dx13E9XWS4DbtPxBhI0/P4i6ao3NAtxCiPU
	87LCVG4kMZokgU/cs3t/m9O+cmr7lGxNgi9P7VDR1squJh2Ry68Wy4sGKHyUSp1D
	In5butjQfjLj5AMPfj4VUOz3VKqvqZcqzw/dFdC2ef7IResVGrwlneIebpnq0/nY
	NZ1QjP1WEbYuvbo1TdNCfDjkaaVMEDFrJ8taJyjhZtkLI0ODld0vzZoxVSd6Koza
	ZgVJ/Lh5iGI+P6rqrE0+GIxpOrPOOS6YhZj+iKIgSb+OvyPmMd945eGmBlsy//ux
	O4XgasLrbUhcczqO/iGFZo8+kPkAot6VuQplr10OA1zMpitA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf47j9f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:46:24 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so9081253c88.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792428384; x=1793033184; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dpE2Z7eaR0y+FTQIRzAnRUvkDAYm9gECZfte2MsEvBk=;
        b=JWBu1ZmkcAEHQ/HVFrWSNXJ7cbwRA5m4WdjX9SLYFQMoDFlU0V2UoeHFPbutDqsFI9
         XmqaNa4HhJXEOPSmyVtAwVoOWrLkeZDo3ekeLzzDNHVjH07/1if3bN+ZXhBribIIzOpL
         sihSxSUOSa1AGIQ0Agd54kpvSIdScB4fEuyT3CQ28PI06GixKSiVYlhTRnZEi+TENQRF
         33fxxI8gQqGQXw1kPyAvoJXmRZDGBoIISrmROHpXQYdIYtwEnp7besAQY4lWsMPKoZaw
         WOeoOEOYtxGTjzHtqo4GNAL5aMnwo/hYsAvv+0rSE2GBMr+Jj9uoyeUYqLqpYzCF7rWa
         uczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428384; x=1793033184;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dpE2Z7eaR0y+FTQIRzAnRUvkDAYm9gECZfte2MsEvBk=;
        b=UX4V/3kE8Cw9IgvT7h8EkebsAFD8iaj7nLBKc50UBNFTkivuqN/gobGXZxCKY4WBGl
         Js+X6NC4IrlIv3CxQ7OnpZ+FpzIOV1rhVQEdwjdFpU0v2q5Vkvok3THgbmw/s1cDyu1Y
         xa5OfauSM03ffj/LbT4zH5Zq/8JjbJxQrOizVNyXrki2JLJ1IBzqq5/h0yjhjoc2od8f
         kRT5C4rw0S9HnXmNYEVdqrsNYKnhnJKClng9UmdOMu9deSUdJu7uc50EopZRmMfVlf/J
         ghswQQDGUIbsFeJp7sg5VY/YBZG0Ynr/y/tdX9V+rxh6i8H+1ZB3QEipYyq75f17CgUt
         jT8Q==
X-Gm-Message-State: AFq9FYJvgSfL/bOhyUatR6IVTKHJImzDV/5T+HtYp7RivtLomjdsQkx7
	zAcXwrpJt6bJTodefAeuR7Hj0g7Ju2NHRGsJL4Z2xqvgVYer4JmMtmV9KJMQ4wvj1DuKSP7WcIa
	PA4c5nHllvXCV1YDrHi4LQOTyFo9WlLhtXM1vv4VC4ZgNLQLa9w3thHHWKq2f3WlapJkMxGMa
X-Gm-Gg: AYBFou3MdX909Dpiu3nsCuFBrrX557vY7LW1ZGNDhpP+J739AhKTY8xHhPKWKSIYuhu
	d+c3fjcciEcaJqGmcSe+YG/6xK/xJcDysAmVS2DAb4G+aXom2YT5uLMnqpNO5xrCrB7BEnRWQfr
	m03fPZ9NY3s9A8haZvOjV1pIO7wa4gHqMLZnYYdf0GCQ551/cPqCeCt4I3QHkYAZfjg5qbk1qPZ
	Wt83z0rwfXhHj0ZBwZ2cvqeW6e+DGGd179anClFl0dTkQ9fn7oIphlQGrAfQKi8WTimcwX8xuSn
	YmpJeuz+wxRmVzlZa3ZhISVX7eve+6Axdeq3hM7P3N78bcLOYBBlHFDQEJoqLzajEVUf4mwXZjM
	QFYfc33QOpXaoXyfBXVQ+do4HBqrOrr9pkiwgwtNOz7XPvBs5uAyLuTzNYA3Dw91B5QsQSTZ0rD
	fdyadKHL9+DU3hzRR1ahuYhGujiZJgj4DefMs=
X-Received: by 2002:a05:7022:e808:b0:14a:51c8:e9fd with SMTP id a92af1059eb24-185139aa548mr13258568c88.26.1792428383492;
        Mon, 19 Oct 2026 09:46:23 -0700 (PDT)
X-Received: by 2002:a05:7022:e808:b0:14a:51c8:e9fd with SMTP id a92af1059eb24-185139aa548mr13258525c88.26.1792428382772;
        Mon, 19 Oct 2026 09:46:22 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b16f57sm30379415c88.2.2026.10.19.09.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:46:22 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add support for reporting boot status on Qualcomm
 IPQ9574 and IPQ5332
Date: Mon, 19 Oct 2026 22:16:15 +0530
Message-Id: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFdJ1moC/22NQQ6CMBBFr2K6tmTapiV15T2MMaUOUiNUO0A0h
 LtbcOOCzUx+8v97EyNMAYkddhNLOAYKsctB7XfMN667IQ/XnJkEacBKy0OL7SUh9S71+TuKHRf
 a68rq2jrtWF4+E9bhvVJP51+mobqj7xfU0mgC9TF9Vu0olt5qEABi0zAKDry0tRbGggEBx0hUv
 Ab38LFti3zYIhrlP0puo2RGGVGC8kYZiWoDNc/zF8DAyCQaAQAA
X-Change-ID: 20260929-imem_restart_reason-15c5b95f9a5a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: IS-yag3w_khyqy7JjKdCzfn1A_FQqPDV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX0+jsUCWu3njO
 E24TVdpxu0U7OTWAd+041Jq8ki4uXwtjEWgpjHuv0xMgP1pGov+pZdfwCAOXwFlhjHeQDDL24OZ
 MMfp3X/eSd9O3HFsSnBW8jXyRTGwEfDcMxOOWN0MVhwG+wJ9/4WfOcvUwjXiBMulQ/el1aKl6Ng
 9ERPc3G6ZACbxPdO7v0s9tlw4fFC4QoAb0WVEC3I1RXxv3U2+L2wdc7Kjt83nOF1Xuq+8zjX9Ma
 rByqWHjzxK+dKdsPh9tsa0qia+vXRln1ZL6/Sx9G1BdZz4qmuo/5pcnEfmWPRzCYkEkwTeie02H
 ov4sDCNJ3y4WoUMTDj/N2zpuHnkwyP1bnNno+ZbCOLTHB+ApG7DTxDALTlhIs50ogApQ8LPlC2k
 qznByrFrplizgsDHhZxvV5e2Pp1l6Inm9Fvnesn6/iBhql4rwBIImgjpJsW3wdxBDmgAPaH4PzR
 r8Ml9wD1atw6CA8zOmA==
X-Proofpoint-GUID: IS-yag3w_khyqy7JjKdCzfn1A_FQqPDV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX9XoNGZc6vd5/
 XOXftjz0PnasSLCibTP9OUVIaZbnHb1ZlESEFi9Dqr4v0j0Lan8x/kDqaPuu1w9ibbDi+LPZIVY
 Qq9Nab4HB1VEBMk6AFFAnLj0/bAmjO4=
X-Authority-Analysis: v=2.4 cv=cLt1IVeN c=1 sm=1 tr=0 ts=6ad64960 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=WCa_HgLwREyZps7IH1sA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190066

Similar to IPQ5424, add the IMEM node and the restart-reason child node
on IPQ9574 and IPQ5332 to enable reporting of watchdog boot status.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v3:
- Picked the A-b tag
- Squashed 2/5, 3/5 and 4/5, 5/5 into one to match with the schema
  definition
- Link to v2: https://patch.msgid.link/20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com

Changes in v2:
- Placed the compatibles in alphabetical order
- Fixed the unit-address in the restartreason-sram node in 4/5 and 5/5
- Link to v1: https://patch.msgid.link/20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Kathiravan Thirumoorthy (3):
      dt-bindings: sram: Document IMEM found in Qualcomm's IPQ9574 and IPQ5332
      arm64: dts: qcom: ipq9574: add support to get watchdog bootstatus from IMEM
      arm64: dts: qcom: ipq5332: add support to get watchdog bootstatus from IMEM

 Documentation/devicetree/bindings/sram/sram.yaml |  2 ++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi            | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 16 ++++++++++++++++
 3 files changed, 34 insertions(+)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20260929-imem_restart_reason-15c5b95f9a5a

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

