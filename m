Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558046;
	b=RpPew1Y+0PgeE3Y8AgIDcs/1dHKWfW4MVGnefQq3IGYCnelq+LLwkSgyZqIoR0+3ktm7
	 /l7e0Ab0a4xIXc6dMd0g1kFpyqJR73XsgnLWhWISPTBnOWQyz4wINRlUUl5TkqIDpZAXf
	 JYYJrfHxGvcBawDs219k7EKDq0BgdNlNPCbURfW0kxGWfINa2eYw90Du0xE7ioy/EcsP2
	 8pQ7nSuBaSmxifeTJn+urUD1whWTwgC8NKc9lOd+Yi6UgjN1KNnw9r3d3/ggadxC9zjp4
	 ZArsLPsp4QZ3oeEwWiQUQVCGsbqx/cvL8OmJXKHukpPrgnVhlO12Ie8goAz9BsWJsmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558046;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8+HhukhZuFpUmESx9rrAxlUZVKyiO21AXgcFpUXvUvs=;
	b=ot124rkCTCdwSopTki6CZJqgeFMgSDvcK14qZ6C44bVkBC4Yla5g68YOaI07HbSVJuh+
	 9PoPJ9buSLSHmPc2k8GHYZi3El95G91cKVx067BZunezvxCBM4RM+vr1Kse/jIQQSbWWs
	 ffo8EXGk6UCsv6VPWGGDRB3BAktHb4mJwUVjxs3nsucqnz0nutuGYTrGuBAJNmWZhDZAp
	 nXYxcDDd80IxhbkW4TeOQMZrzqW7zTwi9RO07+YykKZLYn0ezOVeUQxFzZMhpL5IWGF+y
	 VyOa6do9UU6gFS1kFCS5ugQeil30AfXpgcvaZrXFYeDNOJlvMTKtyqwDzc7/umqhQjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZdXx7Gw8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XviP7BGW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978CC606A337
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 978CC606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZdXx7Gw8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XviP7BGW
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD6IC741164165
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8+HhukhZuFpUmESx9rrAxl
	UZVKyiO21AXgcFpUXvUvs=; b=ZdXx7Gw877oUzcqjI/khCD4wl/8tumGoJRseaD
	dp31C2d2ZuAlsev+5Bcx7FPzZgzlQJGV1W4pSgfBSp1G6tOkuNVzG//4PHRObgKu
	y0YqF+ohHJASIbRtbV9cgR865nMJ1RJtY4QkEdvk9WCj6UFMIa/2k/Q1UwQOXb/H
	ZvOJIVeuKbX4i3vo2UzZOa+hljTci6ZUd3BVTEXYVrU4HEcK2zAxR4HxzK27hXLE
	0nRkgDEeTdJzAiazoKxrZjHuMhzSga/f0KRkfzYjgPFNK5KPseJCduuB8yAcDjWG
	1EwIdDfcprBsyxhohO5dF/2SfP6V1v0+8a6nghMIUh9DtZ+Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r8cyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:20:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1130732eec.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794558043; x=1795162843; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8+HhukhZuFpUmESx9rrAxlUZVKyiO21AXgcFpUXvUvs=;
        b=XviP7BGW9macQtt8bKsVdFJZWd3zkZrRCnMigzK1JPzSuzGEKTh4TkGYGfjOkY/nkW
         LMaqVziN5Q73g095hK8NYt0jH1hI947ky1DeWht7fuNkvZ96gvHjUmmIQkEMn7n4xSkp
         bbDtjNuH9N6hotZFHQnCmkCXSEkh6yiXLjdGYL0VuKi/bv9cnnJhP1dA6xe8R1uPS+EQ
         ndk4/nZCznv+b1t9AxWcPn+f6CUHDipEzFx6vONt2Cr3vd6JGORD3/6faA4Ugjx/FOG2
         xOQ4jW5rZj0WEe1zMDp175YDrleZrF83y2R6zT9CMst3MJpxJxbDOlw6G84bT35pwL99
         w/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558043; x=1795162843;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8+HhukhZuFpUmESx9rrAxlUZVKyiO21AXgcFpUXvUvs=;
        b=hAKZNK8Hzm4u09c2rMCL270gGx5vH7jk6BEC8OYCmvFqxvDHEjlHoYvsmXyJQkZHtn
         7ST2ZPDjXv/4xm2o/J2Hdi15mDZUNnPlYckN4KfMGJ3XNAaz91+PbE1/Js0mP9kXG8K8
         XHmhZ6ylhCbrlZ6Ey2XwXSdubpKcvbvQUqF0qIEOY1W7nmCHP5IQs/7FcURc8t8bZnjJ
         dBlgUbaDBStRJw9vWYfYQ/LVNJJwEViE0BngzbMw58zoGJpHTpyl8Dk5GIJ7GPTXX7So
         snR741Du493OyuP+8HoZTpJFe0Au2flIrZ+CevtIX6PXpDCxE/UuWAHLUvgctRrheE6D
         8qRg==
X-Forwarded-Encrypted: i=1; AL+hErGY43lldOrZkZO7N25b09qwm7etUflsV+uLrp9HcpCHZntQ6rfB2+FUmxR+d3RZo2Dyk5UgaZGC1Gnx@vger.kernel.org
X-Gm-Message-State: APuU4Z/SF06Lanpt0QiUOoj/yxsc652vW0s3J+JXsL0XoSE6RQ/w8PCb
	W3sDw0w3dhJE/B4Ivd5qhGZb60NBuOmipEy3AgQACRAwPcVur15uDtO9PdVOwoTQU2466wtOVlQ
	MRLSQyFXE+IxSry0zscrkj+AEKJORil7LsV52IccT3gtXF/uRPCFnzkt0eXtxlexEtg5g5wGO
X-Gm-Gg: AYBFou0LXL9BSjkvThvzBjY5tjVIEkwDIEaPAlwsUDZnzLW8rZQiTrr4ei9dmx3BPgy
	xSu5zffCJ0UqQb/D8owVDAHj11ze4NAZ/1e0UYI0MNmD53KkH2jcPHca8fK8VGDxJYh8wbtRbIm
	Vc+bIPF6U+OBpzF1vbXv0gWLsrebgF4FnDv0qynC+RHqSWP68bLqqibL2wdZmFqMN1OAwMr9n8D
	C3tWw1twHYb2vw7Sk15Ip/w0uBCeA/fLF7dMmOGIJtCf6GsuuZ4ri1Ys/AzOwPIvJnEl7AnCTRL
	ul6Acr6QyT+0BbHPmA8sN5c5wuZLYvaypZonCwBQpVzF59ckZdM2cEBehk/7G4hKlBtB/d2ru7q
	I/nnhSEApv21ElMx0SbPqO9CblEtw0Q8xynru68lfeRT5OeM9SIIjiYV8DANnIJMiaGpg8QtTvX
	UiUH0L
X-Received: by 2002:a05:7300:5994:b0:37a:1be1:e70a with SMTP id 5a478bee46e88-37a1be1e7ecmr176102eec.29.1794558043316;
        Fri, 13 Nov 2026 00:20:43 -0800 (PST)
X-Received: by 2002:a05:7300:5994:b0:37a:1be1:e70a with SMTP id 5a478bee46e88-37a1be1e7ecmr176086eec.29.1794558042788;
        Fri, 13 Nov 2026 00:20:42 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm4971713eec.10.2026.11.13.00.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:20:42 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v2 0/2] media: qcom: camss: Fix Glymur CSIPHY topology
Date: Fri, 13 Nov 2026 13:50:21 +0530
Message-Id: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAEXI9moC/22OywqDMBBFf0Vm3YiJ1teq/1GkxDw00JiaUamI/
 96o224GzjD3zN0AlTcKoY428GoxaNwQgN0iED0fOkWMDAwsYTmlCSPde7WzfwluEQkVukx1xrO
 s0BAiH6+0+Z66Z3OxV+McrNO1hJajIsJZa6Y6yuW9ZLIoNZcVHPe9wcn59Wyz0DPw//FCSUK0a
 HNaaVGktHo4xHic+ftwx2FAs+/7Dy6mUtffAAAA
X-Change-ID: 20261102-glymur_camss-1cf83f4a447f
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794558038; l=1301;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=ZIVdnv/pVYDJ6VtZ6cVcvJh54NuXewcKEXwu1xtFH1Q=;
 b=ezUhCnPza1MWnKyzNnbcZxiMALh33SYPFT4aqKXPshbyjjRg7x3Nwlbcpd0iqNPft+UqOp1Qu
 2ckjaTSNqZSC32kw7mcM1REEM1GIN3Bi489FpmLStDFe8xQYpoJR9BY
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX5J5Qb3EUi0DE
 dwZOZqQl02AFeh/egPDPuykk01soDaeMlUWyWseDmGeBf3md/dnrlBW2vpp4xQOuZ7W8IlNa69H
 lGwzIwIzgCCUKthApS3rspdKxH6AO2FncR8dnuCamsBYrbDDPmtCzw3o8Y0uRhd1xkMK5w93WlH
 alZmwtvajAGTvgAQneLfATYWj8wmOoVw+HVKk/a7F4jmX5IM0lE5RXqohzSZ3n0qgOMiVg89s12
 DZsq6JYe0+zvDckItWMlRc5RpMZOv8/rDahH6vJdvC1RpCzX30lcBU4ZD8zKaUUuB9BkR5ng28X
 WQnBkVQ2+ymKL+Z7b5FVwJ71QHD2VWg2NLmZrVJO+bS+ogtTm4iD/lN7Um6uDm2u1qVjVmglWve
 VIjI13D2eie2oKrDohsZ3gaZPy6KglxV01XlW3hfqBwuz2isDqFx+UTzsPtMYgyCFwRLZGeDr9I
 X8IUwfseJfQME5vAKFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX/Cgqwz5LH4+b
 w7HG+0HPk6Wqrr5KSviPMFjiMIT5vZEWazOtxNGdpKAtQrMwx5nwgAe7n4jHURspxR5cZmnE5ri
 rATDuPpDm6I+N/2NCwf+aEt37FdrTRg=
X-Proofpoint-ORIG-GUID: yjKS-fhgJrY_9AeERq9F1eg-xic1zbLR
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af6c85c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ffzozp4-zBr36aKF_PUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: yjKS-fhgJrY_9AeERq9F1eg-xic1zbLR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130033

Glymur reuses the X1E80100 CAMSS block resources, but has only three
CSI2 PHYs instead of four.

Update the binding to describe three logical CAMSS input ports, and add
Glymur-specific CSIPHY resources for the PHYs present on Glymur while
continuing to reuse the common X1E80100 CAMSS resources.

The Glymur DTS is still under review, so this updates the schema and
example before the old port@3 example is used.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Changes in v2:
- Rebase on next-20261112
- Use logical CAMSS ports 0-2 in the Glymur binding example - Krzysztof
- Add Glymur-specific CSIPHY resources for the three available PHYs.
- Link to v1: https://lore.kernel.org/r/20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com

---
Nihal Kumar Gupta (2):
      dt-bindings: media: qcom,glymur-camss: Drop port@3
      media: qcom: camss: Add Glymur-specific resources

 .../bindings/media/qcom,glymur-camss.yaml          |  6 ++--
 drivers/media/platform/qcom/camss/camss.c          | 42 +++++++++++++++++++++-
 2 files changed, 44 insertions(+), 4 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20261102-glymur_camss-1cf83f4a447f

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

