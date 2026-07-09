Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A223FFACC
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587144; cv=none; b=Nrtz8iRA7mg5P3cZqpcWDtaAxSNWVK2ARFX58Rdb+jOSg/Uq/GHzzVgQtJSqIi2d7UyFS7CCOAQkOgiCGwr21amAFlG2NX9oF7tawUyJ1v//L8ZD67PhCyOnHMWZKsId1kXBHheMHYmELEhBnlJE2ZRRFou1QBR6KOy3gyw7x6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587144; c=relaxed/simple;
	bh=CEzdu4hjCxN900cClvyfjf2+rQRO/dcw4HTOGkcHk/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i0YQzUHULOvwRl1XS19aXA6Xpp+5GGLFzy+0x/0EKQHWW82EGFQylmDK6rFrxsgapVVG1tUlb7fZG979ZuQKlgKJJzgmYAUSx92rb5GDHjDh2lpvaYxH92OvFJdDSHszIKhIBrCY12uKMDUJlIMlHi47S5/nlI/xjwXHaUCkeeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M2eC1kdV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLZR+Hjp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M2eC1kdV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLZR+Hjp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960JMF750007
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 08:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GVZrXg9KekARpSXHiVBpNmROGTY7fe3HqB/
	w0Xh3O18=; b=M2eC1kdVmHYcfwQrMy4CsHCN1RhDZ0ug0JVYn6JbknYNm1ViHON
	2JSh1aTN7990OtfdTuq7XBJT7AkOMyKQfmo06MPqIG4CGtsn+gC4I1J0ugHt9fgv
	5HeoANfsZ+Xrk3D3iwy5dSI6BuLuBU46TvBb32QxDBb24KBI9GItQWu6Pb0GJsX+
	KyC5CEu8Gq4IEcWk9V0l+5T0FxzFrAflrnmxtPOdxE0SmpzoCx9qtgDK1CofpGQY
	eQHFBaeQLAxBWBXbFkmJZIgoOGCRXsjAiFa7BizL0gjMIc8aZ3DIKjcdlKua4DSh
	AMARs2jY51Y/Qr53n8rPAt6OR6CNz49kVOA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwft87h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:52:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848551b54f5so1296277b3a.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 01:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587142; x=1784191942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVZrXg9KekARpSXHiVBpNmROGTY7fe3HqB/w0Xh3O18=;
        b=WLZR+HjpHDrl5ql6YjC7Bn+LHyp6qBAJqNJZGweX1IruTsH87og7qLSwGFll4RpuSP
         PiWJi6l6oo4yPK/BSJu8CToXr98Jw0KWVrGFpXAfsNYNUl6nAKXslUGa+lMClEAFYFuG
         C8V5LPXYriZoxxY/r+e2Bg0w3KgXg0q2o1GT/MGeRVar5UD5eosPcXjhyp7+Zijc2pR9
         wIyuszO9naxTkls1INg1/iCDEoknpQ+vM+10KzhN3dKseROCmNRAOUythgG86wLAGypz
         Isfvf50q7QXx7eBLp2mu9QTH97NDhOKJSQ6nMxdeBwt3tHrwXk8eVkDyg//oEiLR0MjC
         yXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587142; x=1784191942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVZrXg9KekARpSXHiVBpNmROGTY7fe3HqB/w0Xh3O18=;
        b=KgVKZmg03mW7umDyMbhGfq0BQrDznkgwloPxXjyeN17rJpDh3lE+6uvUaCbAKI2CYG
         qS3iTzBfk3cJ72bNRI5pz+jM77QVK48Xilldtxx78Lvxr3YcNg8dGvWzFQmsoAc0GAb2
         QrVl4ehuswbPBHM64lJYBZaWvP1EZL7utrDXeRtYtm9x4/WlVXAmHWWW5z/YEQ6tObrl
         2SOiFauIppyBjaKyPAUsRU7gxu3KhZnzEXqKf3peUgRoE2aSySSY7KoH+r7Qbj2yind3
         Qm27mPcuBmXcr9TVqlQc4aLlA4ksR6DH1NHkOD+Llz9n+YVr6SV/vKJ5vJrNAjIBh9LB
         uU6w==
X-Forwarded-Encrypted: i=1; AHgh+Rqll5Jz66xOHStffXwF0I3kdCNI8KFreEe8xLH39Gr0JJVoEEVOQdINv8bLnmR5IeOgE81Jyz+qiA7C@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc+VYEWX7rzqIM57nGvkj+EAktX1ktQFLjfZ6v72m3Pk3Wz8dt
	pnKz86apQ8L2ZhdILSCWWaYNpdkeDikKJx5oTEM1ScHjtvQIwhayCVLwDCAzilxY/EPqZVh/j93
	kB2KVZdHyyxwCWARflSV0PonYXLsXEzjyljabOxEGr7XsIRnVN9aU5fnjIYph3Zq+
X-Gm-Gg: AfdE7cmqjOjqbZwSAo8Xs+LJOoWmgf47T1DFL0rT962R10TjCArkAGDuXH42D1FtCRj
	W//4LPaMY0o4dxQngQCurlq8F/dCXYl+TUGuVX2M5fA8ibHH2R+h7Y75v3ReUFzygWdmjwiJUQK
	4l3UPL0cgzKRyqKwDAP8gyuLYUMYLnzVoA2jQsqSDugKp8lg9W8Zq7Z3lfkcbhWbU/hQXZtnspa
	W8AiNAiytn+MhMIkDiw+2ve9msVhVZOU7pIJf7hkEgyfgSEpCmTtG/GuigNQn/vEoyxQJefQHka
	GFkBjgDc0hpun5L1Z2/H52SzMPRWUmBLMFa8FlZO0rq5lGckjXS6n6yHvzH9zLU97/lRMIyWR7i
	COrI1Q6oBzBFFoKJ1w0dOqYk0ofVOwDrUxr5M5v+kFj02W8daTa6bPjVy9af64PG2ZXXiZTA=
X-Received: by 2002:a05:6a00:170c:b0:847:83bb:9b94 with SMTP id d2e1a72fcca58-84843424973mr5718334b3a.48.1783587141612;
        Thu, 09 Jul 2026 01:52:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:170c:b0:847:83bb:9b94 with SMTP id d2e1a72fcca58-84843424973mr5718311b3a.48.1783587141169;
        Thu, 09 Jul 2026 01:52:21 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3b25204sm3460027a12.28.2026.07.09.01.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:52:20 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/3] Add ADSP support for Nord SoC
Date: Thu,  9 Jul 2026 16:51:46 +0800
Message-ID: <20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX9Nf9S3PJOFGl
 oPhEHLhUxQW71ZKv+Hkko2KdBb3x8ejWKkyRmoUAVdNHVnMmm3nw97RGS5lVqidoGyuV8CcEY/Q
 E2IzcaFRZrcfuN4VrTHCD/wqtu90YzeM6Csn2F391ZJiSNtuVTNItnIo556jCWYmVjz0qPiwOE1
 eJHFQhooOcWPPvDoUFOo42GdikUOYjaQHemrLtlPmC0kyFfAxfJiIqA6Bx8VwCgoQAdgTlqd/Pc
 gZYBLieIWf5RTS4URhIaxpX8+KjEa2t7i11982jUyEMPY1pzJuHLD2J5Z8cwXaIPacYUIWKxJUc
 63NECtnhZPDFInvyJUwPGUiGvHEXnUuVLbtmFX8J6w6HgesHDXlHZ7m0hI057OuZaGieBG92tVN
 7dK8EkSxeDO4rcZ+0ZReQZqevfF8JNwzHivRzbf5JwXQOb46QIKMf+l0wso4XJULW4kGdzp6zSM
 hFw4iZZXYeTsD2bg2BA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfXypZD+h2K7Hhu
 yo0k664WXNcTgxVE2kjv5ROGgjX7LO5zKgXVuQwXFjngMjLbdaJHMBC5+3qh9GZ5DEvmwXjXdjV
 tNOyoqDbJcDytKntIipd7vHjYGQxoJ4=
X-Proofpoint-ORIG-GUID: lS-No13z01EAqPrimis4RTMef-ExmWMd
X-Proofpoint-GUID: lS-No13z01EAqPrimis4RTMef-ExmWMd
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f6146 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=H-xtdE_VxQG5-1k7KcYA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090083

The series documents AOSS side channel and adds ADSP (HPASS DSP)
remoteproc support for Nord SoC.

Nord SoC actually have 3 ADSPs. This series only enables ADSP0 which
can work independently. The rest two instances have dependencies on
ADSP0 regarding start/stop and SSR. And remoteproc framework doesn't
seem to support such "slave" instances yet.

Shawn Guo (3):
  dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel
  dt-bindings: remoteproc: qcom,sm8550-pas: Document Nord ADSP
  remoteproc: qcom: pas: Add Nord ADSP support

 .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 19 ++++++++++++++++
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |  1 +
 drivers/remoteproc/qcom_q6v5_pas.c            | 22 +++++++++++++++++++
 3 files changed, 42 insertions(+)

-- 
2.43.0

