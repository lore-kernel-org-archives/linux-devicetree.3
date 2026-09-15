Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA4A374E40
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464872; cv=none; b=VuSf5dswpcKKTUsuhHuCqEoevhwqHMAFpgMZBwjm0/oP5kjEHGSSULgC+lcy12MffPveBu/rWrVEeLjQktfCpkD9yHblQeenwVUjSbac1GXig+k8xN6i9wj0+cbIusNRZ1I4XjRfA/lvvJJ72N26N2piQeXhWHlnoMHanrjnYdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464872; c=relaxed/simple;
	bh=/10Ksx2Yvqc4JVn1+zTLQ5sAht/bBwFMv9EzEJCZvRs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a/R5mudQeCWcL9K3Ve2PW5rZprrMhhfk/JbOLv48yg76lzPi3ukGVg/239HAFSj/xJRPIFtj/ItEWyAB1BZ1oq1g7J7iqeEZq07U20+x1UIX5oCnhFTtPaoI81Sncq2ao+ZHeAXAdJZwnIFInyHA3DWYW3mT452J3keuNyodBfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JAiugDhZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLIYgUgb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JAiugDhZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLIYgUgb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZA8D2983640
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=myogxTp3zFT7QryrD+LRe9
	7nJL+Ptd3P3r3rqvvVuDg=; b=JAiugDhZ975/BQv6HR10maAmXgw4suuDHr9GxS
	gFLTplHOysJpb9nwYhIGTZq3hxqxPdCTumBd2PGD+UdZpSlSUbklVXtpnnU4bwrj
	CezaXoFYNHJWhwlSkZSW2Y3tpOKxL+KPoVGycm/Lq1KmmyUtSOdcnnvKzhiZhDoh
	NZpfBzhsLoRFAErZvFZC7H8zrf0fKcxXwf5whWuMcYHxuMuD7auErzQl0iKQBMdq
	1pI8OV/yWYoRsNMThDeRHl2uO5fp0jJMLhV3SEEmr5ugg0pRrs7xEXMKfE6T8xQQ
	2UIufFhnKKDN+Ssj7BkdnII2dZBWQogWV/BQ64mubCVOEyug==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpnet3mf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:34:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f27c80a3so843634585a.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 02:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789464866; x=1790069666; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=myogxTp3zFT7QryrD+LRe97nJL+Ptd3P3r3rqvvVuDg=;
        b=GLIYgUgbz6iJLEHCqZrgL4dVBqUjjQeGkFfBuuWJgjh9A26fPoDn1u5mbaxgXibb9V
         iQ1o0EDFxwXvVwEBVRq1b9ZuBey0zqnr90cn1CWgIrkRN7RZhqISZJX171zUBAUCT+aO
         MgjXsDdya3WyQWXIoAsap48gZMDVy2xMaEDR1kjD8hVELqzwiYXee/huMcNJ6Q0yBzw3
         mlfZO6LP2n835De4sXz9xdUtEo+8caxWXTXypF/IVMvo5XdB5jIVh3rhpwvQP7cCjf/U
         EgAWxRKugNnJQZVScBheYroiRo8fw4lmafKr7GwkKG8Cj4EQbzN7cksnchZGwNaU+yX3
         YHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789464866; x=1790069666;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=myogxTp3zFT7QryrD+LRe97nJL+Ptd3P3r3rqvvVuDg=;
        b=gqUVruG8kFriCwkzptckVkLPGhdQgtF6V6/lTkXtSDKdG3QBBP9GqqGtkZCzNQXguv
         mlzy3djYaTJfqvigBGYfwBC+Pedaxtqe9Nfa7l8X4buhB0M1I8n+ZTPCkhkqFQ/7W6ML
         IvfsJBelgMA4sL78tw2emfonT5rZ4klcfpMl+Q5Ia3+LOElLW6JObsIoq/D6f27agn7G
         u0+fpM8AeD7KaLB+dZQ3npy9V3o6Hd0dPRraQThgXXIjZnKGqPu5qacNf5jL31EELOkQ
         KOr/Q9ft4ovuVNpPpr6mNmchf9zd2vdtkMm8EcCg3Oi/AlN7X+LixAJkWa/Xp4CQNhaI
         D8+g==
X-Forwarded-Encrypted: i=1; AKwUvBwANLn1aBwjdQl0hTflXQTrBI2K5dypXxPSCZhQ7r7qEWrND8MWcKUbGmiINjtvarQStEb4B0kUOewh@vger.kernel.org
X-Gm-Message-State: AFuF++mRoSk4VxwWpJ1Rp2y01F+AHYzmLUj5HMiSolmxBg7ps85QRYIp
	wq8D4u20Vl/poo3II76jMG1BQ21qRMNpqsvzkouCc72tsLTDyQPgyT+AJ+HmJjSyUeV2KrV39D7
	pk4/RXcXtRqblIT55UleVglr2vSngC2HDTw2rxAbVPZEBF87yqwtaiPp9az3+EDGI
X-Gm-Gg: AYBFou1ggbVjfGlZ4/93z+e+Xx2a4nuhmnNvYEMeo7+Vt2fNnzDLS2XkoiCRosQXcn6
	XA/UyZWQbW0DQXgB5Kk7nrZ5sDzEhlzUV46BSo1O+D6slZmfI7AXuuXPTkR5kWNiTz0Faxs4vdJ
	ukrOIQir80gxfjswONRn/G4WLpF3BSta0Hw3nQrmzXTAmwIlIKgK0fCM/NFdVcBfg1x0pRvf3N5
	v3RAfZbIX/OWghHZHowexgWtHZaFNQE1M46yYNd1qWIwDRuh2oV9sNJwzH8aP+fb6esCJjAKJ/h
	QWuE8tEzrZqafICVlH9WRQs/m4DEkzaLwjrkkYTjMCsD/BnOqN0/pXm+S4nv52HIX9QC2W01z4l
	IUeo+uVM7MaOGwlfFQDb2VtbQzTGNW5INrjNs9AQ3xYvrkYh0msDVA6MVWu8Y00RqPvF/
X-Received: by 2002:a05:620a:6892:b0:934:946d:599d with SMTP id af79cd13be357-93a29949981mr860092185a.33.1789464865933;
        Tue, 15 Sep 2026 02:34:25 -0700 (PDT)
X-Received: by 2002:a05:620a:6892:b0:934:946d:599d with SMTP id af79cd13be357-93a29949981mr860088185a.33.1789464865485;
        Tue, 15 Sep 2026 02:34:25 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a26921baesm447229985a.24.2026.09.15.02.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:34:25 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH 0/6] media: qcom: camss: Add support for Nord CAMSS
Date: Tue, 15 Sep 2026 17:34:10 +0800
Message-Id: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABIRqWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0ND3bz8ohRdC8vEJFMLw8S0FHNTJaDSgqLUtMwKsDHRsbW1AL1RkQx
 WAAAA
X-Change-ID: 20260911-nord-89ab581afd75
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789464860; l=2579;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=/10Ksx2Yvqc4JVn1+zTLQ5sAht/bBwFMv9EzEJCZvRs=;
 b=9OJjBlsRy+U0odubIf/rqJfrFoyk6BskpxlAaTUXPN+L5vfHgBNbK8EJnar04Nhl5uP9F2Mym
 EDZpRzyaazMB0gst9chjVklRSXfiFHgFUXBqkNAs2EDX6DcADIreTFQ
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfX1D3VGospd3Ck
 +0PM4nwjCSkCq8oJ6TeiUR3RlibH47piHOzDSd3COba5yuz7s0oB94XFwMzlH4jZ3GR5VPFXCiq
 2n4FbP+0KpsXxT0lzVGz+3FDh64IU9I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfX1T4TgTLqZ/Qn
 V/zfjIrZS11OV/t0pVA2IX4kU+q9xPs3L5B6kIrZB9YtMs62xNo5EQgWHDCtUAcAa48FPdsTfN0
 bzPUcKTj+rmmcz8viYYwZgRCK4F9fib3CbupIr5qzzv8f0rhjZ58wexGxKSyZa4Bg+ShpZt/16d
 PUK7R78EmyRNe2RgwWq1Y3H+l8nwFeQaoi+Ubz9yqhne07yJ1gGapqoqdypX1h+opwFLdEj5/NG
 OlVk4NFbmdtWt0Me3Egzhx+k73cajAoc4jLprYSN9YaALk1rExtR7qeDR4RTyqdBZrvHIesZ7Jz
 Ot8WYyyXVN8pFRom4qF616odlSn7P5zsPEYRIcBHxgi3moQOZdsVYNTs3VP0hXZJkSRo+js5gRk
 P7Bh0SA2EYVNjIrB8HgVg6HVcpcT6a60dGxhvKCH672N1dj2bHNhdBc3Pu7uy0Zj9nAqBMrsPHN
 kSlI0nGcd6Y2fxY4B3g==
X-Authority-Analysis: v=2.4 cv=PKKaavqC c=1 sm=1 tr=0 ts=6aa91122 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=EM_g_5Nrotj72ms4Ud4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: KPhpci3SOdBfurCfwITp2EfWlxPWfTJ2
X-Proofpoint-ORIG-GUID: KPhpci3SOdBfurCfwITp2EfWlxPWfTJ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150137

Add camera subsystem support for the Qualcomm Nord platform.
Nord exposes:
  - 3 x TPG (Test Pattern Generator, v2.5.0)
  - 3 x CSID + 10 x CSID Lite   (v900, driven by csid_ops_900)
  - 3 x VFE + 10 x VFE Lite     (v900, driven by vfe_ops_gen4)

The VFE reuses the gen4 (Kaanapali) driver with a VFE 900 variant for
the different bus register base, CSID900 uses a separate file.
This version only supports TPG and does not yet include CSIPHY support.
We currently do not have suitable hardware available for sensor testing
and validation. The required hardware is expected to become available in
Q4 or later, after which we plan to add CSIPHY and sensor support.

On Nord the CSID domain ID must be programmed to a non-zero value: 
a domain ID of 0 selects an unmapped SMMU SID, so RDI writes never reach
memory and frames are dropped. Only the full IFE path is affected.
The domain ID registers are marked as secure. The workaround I used to
validate that the full CSID path works (programming the domain ID from
CAMSS on stream-on) is here:
https://github.com/qualcomm-linux/kernel/pull/1022/changes
The preferred solution is to initialize the value correctly in TZ, and
we're currently working on implementing that.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Hangxiang Ma (1):
      media: qcom: camss: vfe: Add support for VFE gen4

Wenmeng Liu (5):
      dt-bindings: media: Add bindings for qcom,nord-camss
      media: qcom: camss: csid: Add support for CSID 900
      media: qcom: camss: vfe: Add support for VFE 900
      media: qcom: camss: tpg: Add support for TPG v2.5.0
      media: qcom: camss: Add support for nord camss

 .../devicetree/bindings/media/qcom,nord-camss.yaml | 393 ++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 drivers/media/platform/qcom/camss/camss-csid-900.c | 361 ++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   9 +-
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c |  21 +-
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c | 283 ++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   9 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 602 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 10 files changed, 1676 insertions(+), 7 deletions(-)
---
base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
change-id: 20260911-nord-89ab581afd75

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

