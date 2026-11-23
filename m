Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414756;
	b=CKZQM89vk4JANbwQQPPmDZuRidVv9y50bJ/bnN1lhxLCqNuDXyY0J2Q7tjzJLAkqKK93
	 hwrH8DSMaT/eStuKNxAmW6qdLBu9o4JHEYw9GealrL1Fu/aTgjo4QNQv/RDTMnUQEHHeM
	 X51KFfANGPEzsqEgVKCgoKkC/nNtXrdHchqQHZqMOGIV7SzpgB7E0NRm4tQinpXsryG+d
	 fyqj30VK23xP2Tcrgw+LDOoED00HOzl0dCZk3rco2LRbExE43KC1fGTx6ceyR3/HGpBvs
	 ZKk8SJYTnrGdfyIDFLNZ8uzBjfv1uTfo7/aDEQYTngcPncVASk3v197AzMXZMML0r2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414756;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aWSbe8A3Zb8UvFWO3X5sIMJbcFwfrEzPaXFLpN8D5wI=;
	b=GS4Ciz3fghV5EmF5zNz7D5f0pX2eewDSRhD7sfYf9+IL91ID7fhS5seqcnXG6wyMIzey
	 fq3b3o6/hsrvycx+HYga2f0ChKQ/wfShsOCiNtbmIWKJc5vd/CS/+HU0MUavCvVT2SL4P
	 EfkpDjVwZRHXqGWcNgKlS6pmDBgArjAX3hI6v/I98/zcbWh9epuc/OyDEw0KBg+Rt1/Ai
	 35B6CseJgZyqpOhOfE+f8r9tbO3Iacpory9oUIT7uUT3wsanyWlQJ1tiDR9jc1byBTXpM
	 ek3Kio16q0cbZAv0pRQZary3It2CT6YvJfgZs29gdjrzexrgDS8ViVdW5cG7h72Bfag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fkGRs3SR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dux0XlyG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3643F606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3643F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fkGRs3SR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dux0XlyG
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN50wo71960986
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aWSbe8A3Zb8UvFWO3X5sIM
	JbcFwfrEzPaXFLpN8D5wI=; b=fkGRs3SRBK4PfreXTSt5m3RM9Gq5/R7epMFyz7
	I1Tcb3LrtQ6bYFDqyjJFq3tNns+ShU0WQeYDjOG23gAVAe4wyfoTesQjvGb8m/9H
	PuamOppxQUl6lpAlDhCI8X/MSDDTy/hcOL+C6utnqqocOvlVIetBxlqJ5IDDwTrY
	GlhxCywiW8A3O4i7zPT6k2hQK9kTjo5G+20apJfgLVnB7vG4emmhxyt3DcVGpLd5
	Te5kbFL4QTCv3QJNwGGwKclghoubmh0DQ4SPrcC6zWxJxbgLAlh3CbYlaCd9jfdR
	CwXimmhrB0x3eYrwlc/eZvm6mq0YvlWFKtk6geubI9RkCe5Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6nhhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:19:13 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so2368299b3a.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 22:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795414753; x=1796019553; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aWSbe8A3Zb8UvFWO3X5sIMJbcFwfrEzPaXFLpN8D5wI=;
        b=Dux0XlyGIDN+T3jPMDioAl47tJM8wze3bwwmCUzMfh5eKA7ZaVNgPcnws4Bpmxdoen
         yMtFHOTQPXeUKvHy99FkFH4FocfhJMUv7weAJR7NaHnHiHeo/1IhjNONWfTtMTNatikQ
         Ssr4B+Ih0Na9AmyLq1DL05KJ5iTJImpmrBRtDTs5qhdySv+B6mZDuFfkAqM35bmSOdeW
         dGibS36Om0hcoSpKMoJdPJYaW3dhyn9urBaCCSxEPm2K9L0ckQQeTGrqftynrLVK7ZyA
         JWPwRbdoR8JQZIFK4jG9DQaGbMR4dP0oG8gjcg037H9pjYxlgxz6xLN5h9kXvHRjrTHN
         MdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795414753; x=1796019553;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aWSbe8A3Zb8UvFWO3X5sIMJbcFwfrEzPaXFLpN8D5wI=;
        b=iPpTZboNwM+Eik63i8V6xdqn4o63bsuTW8tV/Ub/2gZ0i4isJMBpQVOrHf7jBQeYlo
         TSWN3DukwkdPvdYQ/SPyeQmw/msNWrb0m0/HjqL2oez9rlwxAuizHdpvkvIz1tTPKh9p
         FsymQy8XGgK4K1GmyZdTlIuRiDeDMDQlEBaAj5g/RlEUK7MkWUVxnaL+H7eI+3GsXgqR
         3nZ+A9WSOVWBNwemt0mddBa2bg1Y/5iz8DauRAj83E0BYlHMiG+inar70Hy6ulhnSJCI
         6dfDKJFgXF8yO5BoErIFifjKA0hcHSUFJZtEuLQMHmb8Qo9qS+tOjYH8AMu2hTcjdPVf
         EVHw==
X-Forwarded-Encrypted: i=1; AL+hErHJxQga9yrx6b6dflozQgfgn/A/U9lnR2UJU6KT4uej75MLkFQq4adwZkaxO9LMFyLGHF5LJ5uzfb/i@vger.kernel.org
X-Gm-Message-State: APuU4Z8fKYDJ5lV+eBTbHqCDnR78X+JTPgYGOkYaSuwC2DxibMDPWIWR
	HvpCle2kG9PGihSalJcooQ5XJYIuwmi9MuZ5Lu09PtE4RsqJmOx+CcEXVbDDOHs0PH8p47AfOnK
	K/LK4SiVlDD8LeKRlP4sgxgBZ7E4PYAgxiZBEoHjf+fjiAwNhDcG2xv7UXkLMdDa4
X-Gm-Gg: AZFdTZdWnFp0AZIKViIHxeaGBltkFVVhBu1VBsxxEF1PXIo3A1cwCzliHK5DddmQsWa
	zztUOUaWKimMg1bzx7xJXGTSFwTe7b9B7tvB+960r21d6NOfP9UbRVYkAoYSLj8QkJLUcWDRwVU
	PXcgKhOLDHhJv95alRrXT3y2GD2RqdvA4HC6CHu1Zr7RCkSPFzUa9XWVAMx/B0qYeH7UO3ANDwl
	HOs9EgUfdnj9EJXiKXU9i+lVcQn4tg2M+QvomRUbV3wIldhGEXeA/u9WYiuR/QKO+wSERMUPSiq
	Ry+jUZ17glKKxZQ4wnS+ZyhAtznnhflzRygtnSwTL7Hp5vRjpNZdCkErARMurtF6CwBYpaHCmJ4
	9Ap6xc09Hy5xYiTES6ZIbrgeqfuv8hNhvnLWAI5QaLqZBu3RV8U3HDl81uboGcIwlK7KoyDNlt+
	ot0UaPkWoKUA==
X-Received: by 2002:a05:6a00:9283:b0:8b0:5438:86a4 with SMTP id d2e1a72fcca58-8c87bdb534dmr9611188b3a.16.1795414752977;
        Sun, 22 Nov 2026 22:19:12 -0800 (PST)
X-Received: by 2002:a05:6a00:9283:b0:8b0:5438:86a4 with SMTP id d2e1a72fcca58-8c87bdb534dmr9611178b3a.16.1795414752504;
        Sun, 22 Nov 2026 22:19:12 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm4955870b3a.2.2026.11.22.22.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:19:12 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Mark RPM message RAM as
 no-memory-wc
Date: Mon, 23 Nov 2026 11:48:55 +0530
Message-Id: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIANDaA2sC/32NTQ7CIBCFr9LM2mkEGoyuvIfpAsfBkghUUNQ03
 F3sAdy85Ht5PwtkTo4zHLoFEheXXQwN5KYDmky4MrpLY5BbqYUQO0yzR88+pg+GGPBFSHtltLW
 KByWh9ebE1r3XzdPYeHL50eLrRRE/999aESiQ5aAt6TNpTceYc39/mhtF7/smMNZav18S91+5A
 AAA
X-Change-ID: 20261117-rpm-memory-non-wc-c93a6ff3e432
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795414746; l=1853;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=QOvNwqqx4O4iOVdjpSd7/HzP7iVOHcLCpUjNUJzSGAw=;
 b=TfRnkLYYFY0tOEVZHlNqenfl0IClZQqQPXqLGjlYLkIv9UV1M2Wj0dON9sxd1D56ly9xbgAz4
 q8+GvQumUVHCSrezhk+KDg2rYW9vyIIDng0EMd/L7SoUk0qD++sbFOn
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-GUID: 0AHunKYvNivHrtT3lJE-M_Ux9Ymw4qnQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfX4jf/SRN92j7V
 k4/UgFzJ82kEFk8Edtf7EoI6IZHWDnDvmb1mhHtctooqtyimVrp+d7YrkgFDZiIUOIHmQEnbz0l
 GXhKR+Bn/1F2Wg75Q4smerB+Y4g1FLA=
X-Proofpoint-ORIG-GUID: 0AHunKYvNivHrtT3lJE-M_Ux9Ymw4qnQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfX9/8JtIvRHPXY
 XD03yzUXosveWHGc2YnYDTqEMztGNgo1mC1vwKDVhsKJCZqBUCF7SQcuqx9PowiMq0WVi5p4G9z
 y5/zPis8ZmzIvcaZv5A651BlVSYgm4NFNj5T4iSyUCbCFoNpAAF4d7Ttfol9PP7LGi6fVAo88PP
 RD9gh3/dyiJTQIP0b//iI+klOS/SAh9Gxd5kimdTax/9aLqUa0Z0L0jiZ3eSHgaz8NM6bSP2PNs
 HtDrdP+Wfnuyh6wdjrgZQWkxKbduTQn8JH3/CTSzEicJdc2LJNVDHMWBTFPH63fBZakwWSyeEDN
 ZHmHf95zrUjh2v6HbnwPagc0hmW/2zuMTdXv265q3QuDaNRi53WdORCDcHV+/KGrHiHwa+91H7I
 nrtZzz/rpRVwl/oeeA43IGv+wdxDCcsmV2x91HlWm6LLWNZ3YDqJoqsP1yhpZstTUjL4I0AryAG
 k7NuKz1HRSWXb2AvIMA==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b03dae2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=shtKTQ4KWRncmOlHZgAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230024

The RPM message RAM is shared with other subsystems, and parts of it
are not accessible to the APSS. On SoCs where it is described with the
"mmio-sram" compatible, the SRAM driver maps it as write-combined
(Normal Non-cacheable) memory. This allows speculative reads into the
protected parts, which results in XPU violations when Linux runs at
EL2 (KVM with VHE), where there is no stage-2 translation. When Linux
runs at EL1 under Gunyah, Gunyah maps the region as Device memory at
stage-2, and the stricter stage-2 memory type hides the issue.

Mark the region as no-memory-wc on the SoCs that describe it with
"mmio-sram": Shikra, Agatti and SM6375. The XPU violations were
observed on Shikra.

A similar issue was fixed for the Tegra SYSRAM in commit 61192a9d8a63
("arm64: tegra: Mark BPMP channels as no-memory-wc"):
https://lore.kernel.org/all/20220622132300.1746201-2-cyndis@kapsi.fi/

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
Changes in v2:
- Explain in the Shikra commit text why the issue is seen at EL2 and
  not under Gunyah (Mukesh)
- Add the same fix for Agatti and SM6375 (Mukesh)
- Link to v1: https://lore.kernel.org/r/20261117-rpm-memory-non-wc-v1-1-e246fc6bc66c@oss.qualcomm.com

---
Vishnu Santhosh (3):
      arm64: dts: qcom: shikra: Mark RPM message RAM as no-memory-wc
      arm64: dts: qcom: agatti: Mark RPM message RAM as no-memory-wc
      arm64: dts: qcom: sm6375: Mark RPM message RAM as no-memory-wc

 arch/arm64/boot/dts/qcom/agatti.dtsi | 3 +++
 arch/arm64/boot/dts/qcom/shikra.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 3 +++
 3 files changed, 8 insertions(+)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261117-rpm-memory-non-wc-c93a6ff3e432

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

