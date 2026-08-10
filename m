Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126753DA5CD
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373868; cv=none; b=Tkr53vAF4RjaoV5OkgYWO3HHD5oCb+M9xt9zi4RZKAP7vhDsr1HKYt6pvQzIKCZgyctoq6ShUgMR3JinvwJ2cW3i3cS7iKHnw3W5cTLLLMRSkikZa0P/rVpOvsoDKWsavVXrSjXtmDb9zWH3BcxkLhMtj1O/Ew/fi6QZ3eHL3Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373868; c=relaxed/simple;
	bh=WVSREEobzWHvkHL2xKDK6zDLqjlIg9d537PhRn/W4mY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PfPRmHSRVeSR/o6nsAGiZO083kZTh4o49M+hcGxwZfzngZrFkQ1VFGY4qeawpysECE1QwofO0gK5Q9TQCeoHtecpPN3OTnGyILmFI57fgH0qJftOJh3YcEHhzKor54icrMEzA/5lQm7SyOJylEWa9eJhjq1rc5YtG8kboF8TRaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PxLniLvl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OmMLJIlz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PxLniLvl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OmMLJIlz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj3hi1706724
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZSbHX3DBaWx0ew7RT4iT/N
	UH9SdU1Tfq8o2faGRyMbY=; b=PxLniLvl2UpMJUCl1Rs/471l7JjUcd9ihqJCKL
	IExJGAQvduVyvrvEPR3rJ47LLLyA2Gr5u978o2tSyY7tsYTVYLNcFfjfg56maN6m
	DQjXx3WqPvxpiUaPdIJwrW4tzhyk4i+E/4DVJhTZ7EV6JZBq4p6PhuZ/vIpe6feb
	aphTRCHZmChDalk/I1vC3RPpgMr7XoXkT6furGPZmOu+rrSqAxnQd6dr0lx/NbmY
	89Wc1Dd+zeri+PzvFEBM5innF99bQRFvcYvnlhb/ayF35fC+hhMcvpfofqsP/zJP
	75Ps+jo8k8iRyxtdOOv/Msy+FNZnxxpahficZY+zfZVmnw/A==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fybh59fre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:57:46 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6b5a8836bso1573350a34.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786373865; x=1786978665; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZSbHX3DBaWx0ew7RT4iT/NUH9SdU1Tfq8o2faGRyMbY=;
        b=OmMLJIlzXyeRUgkvh0RuoCAFJbDvAL4KhiUelBOcI712qDkUlzWlYCUzZObOITkf2Q
         FudjFb9yDtOyjg3reYzfUn2QOnMMkK9r2O+yiSgpz31SLnVGAZEA7mdWnpmShgVChs+r
         aPkXIcEHrWzt/sz0vSYNQCgVnCxS7xfM651B6gfTzXiFpxJ3UHmcs17jfWEPvDn66fcU
         eZnkgS4N8OG5xPEY6EZiMQkQ2xSzjasBMM8K2nvJke25hL5n94dVe5DzyFryiygwRcuL
         UIqe2eIs64NCTE2O0JFDLMqgicKfniTr30jokgKxzFg8NUEAl5ASrbBWAEH8QQg44K9m
         xxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373865; x=1786978665;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZSbHX3DBaWx0ew7RT4iT/NUH9SdU1Tfq8o2faGRyMbY=;
        b=q7nJDvZtmyFVJdYf69hs4fZilv+hFef/y0l3ntmz3imiXh3bOO+KDArHcTCW1bw68L
         cgwsOItiG8E4goQwc1Be5oDu4qddVJFADQflg4eDxzsdjDfgFkgRCV/9KtRpM0jpnnIu
         u1tLmb/eGyIA27LSNwwTfjxILVn5yh3Rg8RAKK4R/gt6Q4hMs6gwIP7jC8d5NLeuuNf6
         tzp3qPoXhp52u38dT8uOeRE312Y7HanAUcCXcVRZja4SoDWFskjf4r/mJYm7dsQAYsjc
         glgOO0It11p31zrhL+MUhYo3O3BoJqRuxSdse3NcH8TvTil2VJfQGJwtUVt4oueukfKl
         bWYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0Q1H/DH3ojszsOG68FfN6hwZ47fNZLos0FAGLPzQuThDn/WMAnaOHxCW4ts4/8wXw6zTjiZAiqksI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmh8xZL4jGaaAq0PFDuNNWrt+3hKsMOuBMBztMLyhoUsAEdHhn
	xlR9W9ggUMxMiF0D1FffjUNnWlMBmpP4FdvahzecaF6XdW5DM6Lhwp0Gke6cOx6xMFUhLGHFqXf
	n0dly2T4AucoyBxI7Jud3KZihbOQBY5ijO1tSr8kRJfhm/wmw9ApmKclQFSOZOJNR
X-Gm-Gg: AR+sD10YL7SrEgTZWo89hfGPyv/sOHHnk083FvP+LE4qsqO7pprf1If2P++709BSH/g
	hqVlil9eS0lGYvlI+0LTQf6xZoH/2vug8hzKy2kd42aCmsTRPhDB5Pz03zeesCRthRy2qVVlGvQ
	H049PR8qLlUq+rBsrtkFSfh/LBykEIV0WiYald71rJDEppwnZ+63ak6zKJhS1ayZqtWuOcqZvep
	PBPnZTk1vS4JaqaDaeP4PSZkT3qSttVZwcKecey/EVBeNaQjuYBEggBdfS/wTQYBdcSB3e9FECP
	qX7NzSYuufhdDT6K9NlzA7yNf/s3/LoPFZZHN/eOmFdfFdPM5umFvHXSCqliCOrTkC2A7gV5hzI
	7+rofC+03CWB5QDTLxuXbQgVEmVUguzIQJ2VJ3H/4MUjPnkhKsfZGd7g3Wah35LdH0yPE0A17zK
	X/rzSEr8qfguTUsh7K6vSx
X-Received: by 2002:a05:6830:3489:b0:7e9:c6fd:c36e with SMTP id 46e09a7af769-7f1e5ea9deemr15867443a34.3.1786373865458;
        Mon, 10 Aug 2026 07:57:45 -0700 (PDT)
X-Received: by 2002:a05:6830:3489:b0:7e9:c6fd:c36e with SMTP id 46e09a7af769-7f1e5ea9deemr15867429a34.3.1786373865044;
        Mon, 10 Aug 2026 07:57:45 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b806fb3sm7609792a34.25.2026.08.10.07.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:57:44 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH v2 0/2] drm/panel: Add BOE DV215FHM-R01 LVDS panel support
Date: Mon, 10 Aug 2026 20:27:28 +0530
Message-Id: <20260810-b4-lvds-panel-doc-v2-0-f2c2fe309989@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANjmeWoC/32NQQ6CMBBFr0Jm7RBaEJWV9zAs2mGQJkCxo42Gc
 HcrB3Dzk/eT//4KwsGxQJOtEDg6cX5OoA8Z0GDmO6PrEoMudF2c1AVthWPsBBcz84idJyR7LEq
 qrNGWIe2WwL17785bm3hw8vThs19E9Wv/2aJChbVRZ9KqJN3XVy+SP15mJD9NeQpot237AqWG1
 Vm5AAAA
X-Change-ID: 20260719-b4-lvds-panel-doc-cb503c4ba2be
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Liu Ying <victor.liu@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786373857; l=1011;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=WVSREEobzWHvkHL2xKDK6zDLqjlIg9d537PhRn/W4mY=;
 b=fD/Yy0lCh+fpDNZscQJmHt2+tXoU2vo73ZfrWkJyRLfoPWGnqzigGr9rl5uPBGs76rEvj01Jq
 vzwnLFtLQ/zC0sjGTPM07epxPs6hWgUwD6V5uXUhvm+dm/02aUspou2
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a79e6ea cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RIij9G7mhg6n9R0jwBoA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: vnFlzLTAUovRgIepZE9oh4YcW-n1rTnd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyOSBTYWx0ZWRfXx2gW0zi2nCup
 reiz3aHmgzaFpo15HYngxMQgBpObXUZvllPC9M3aOb3R1liuNH0T/0bzwcVlFUoNVucvuWlfejF
 Koje5Y1Ug8pkdBW3zcQa6GN4WCpxzC4=
X-Proofpoint-GUID: vnFlzLTAUovRgIepZE9oh4YcW-n1rTnd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyOSBTYWx0ZWRfX5jUHVTYe8WN3
 onR1d4lCa9hfQU3VMe4oDOWM3dV5JmctPMolKyjfUASAgd7b0cJp+pVihBjV58bbxYa5bgZi/Gz
 eWAn1xjbi2dtb7/IqcHwMH0+MsKOkYj5YPE/UgOgfg2gkt4RJFHDToithMgCx1N9y4ChWTOBGAM
 1FWURd00eSrAofg5AlevDiiIS2ts7IqyVBZE0ldh/wyVSJmCtWQD9rvdKLSTI+7QI2dldhoB6mh
 BUKt3hpYzLcnElqHUXl6zLBaD70SWYA2iKgPcGSzcjv83Ap5IRVmoPTcnMtflph13MrMtffHX0S
 zqhtK7fNLZAh/T8e4OBBh+pxNlBYwim6xHv+g52I2wKPs4dp4SL7jXLOj//eylHGVMcQiJohbMl
 pjR/Ks0z2sai8/9ZvKdd1HN575KwSle+yCqW5qAUZaRcRNqaDSfQTYrcx6XzKMbCIaRnmH5/Ipf
 EKFTjrHgj+x1pSqgn2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100129

This series adds support for the BOE DV215FHM-R01 21.5" FHD
(1920x1080) dual-channel LVDS panel.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Changes in v2:
- Move panel support into panel-simple-lvds-dual-ports.yaml [Rob]
- Add  panel timings which were previously added in DT:
  [https://lore.kernel.org/all/20260719-lvds-support-v1-0-1f1aca3213ba@oss.qualcomm.com/]  
- Link to v1: https://lore.kernel.org/r/20260719-b4-lvds-panel-doc-v1-1-6a18c213c2f6@oss.qualcomm.com

---
Vishnu Saini (2):
      drm/panel: simple: Add BOE DV215FHM-R01 panel
      dt-bindings: display: simple: Add boe,dv215fhm-r01 compatible

 .../panel/panel-simple-lvds-dual-ports.yaml        |  2 ++
 drivers/gpu/drm/panel/panel-simple.c               | 28 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)
---
base-commit: 104c00917264c5b9571072471e3a8689cd1a2c4d
change-id: 20260719-b4-lvds-panel-doc-cb503c4ba2be

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

