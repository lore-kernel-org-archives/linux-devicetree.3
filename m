Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CA2360EF6
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588345; cv=none; b=N+xcKTqd6Df13/lftUl/sH8svj43ekrhrrR5l5hb4VKz3H6YkRXhEGTRfQRyT/Q3k/kHyRNONz01ySKo0cvUaWFAm1Rogipv5V0SHCDW0rAGLj6AFr+e4kZBXprO2QAYFjxyu0Ns3sQzfCbxBz98HVty0gmFTAEdNNj5tESSR2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588345; c=relaxed/simple;
	bh=vPCIcZFi/ehqDMtx+YOdbyRuohx70UKLjM+qLnmTimA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QdKdbHAAndINnIfbY/lZZ6LLboW6HjORUxZThg4VXCMgy2UJJ4U2q7ZXIfoIz6tlS0KgQJFUkq4fJyQxqHYVntcr/S3elO1lpqPuNczxdn6JZQDhBhB7xp2Rz/mM/+ivmuh/ixoBdG514ZFa9AeIOgfq0hPaRzyzfG/G1KQQ0sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YyCtMAVp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZsPlkJXq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YyCtMAVp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZsPlkJXq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB48gh3385016
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=moyklA7z93lE8+Wuu04kiP
	zAGDGUtPT5ReFu5vay3+E=; b=YyCtMAVpcXYZaegOqCD/WzIcY1xdppeceIyD23
	Baq40TiD+iYkyQBjMr31Q/+dLaF/jvdtOZZd0yPAmXobzs0rhQ+Oziim1NgafAI0
	19Nz/xfIwN56kjsmjyzTeVbejJkz98TuD/y5GZOleF1VX7CdlgThUMRSGr6rzyhS
	2xaNmoTRoLpSJiHPMSBuVI7wQ1sVTMhXC3GdeF7iUHIrFaY3naAzWIgdSsNRIMp7
	WABQ5a+2n16/e2QEyr01jMOTjI3JiMz4kGPWbiq5u/b0XsAYH8L/IYdBzzfbTIkc
	mB+XHFK2mIImDNb9kZx29N7WGibHTWX19m8GggMbqtudZz6w==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv4k659-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:19:03 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95df04c5136so6433329241.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 05:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778588342; x=1779193142; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=moyklA7z93lE8+Wuu04kiPzAGDGUtPT5ReFu5vay3+E=;
        b=ZsPlkJXqAycLUbjOeg+y0KgMcrHYQxGsZ3KZ5kTwOcXkTJ1sNDxWrFitpRN3hBqoN0
         ffh9tnEaBnZfUw8yRKYuWGDq9tNvozZ3BNe/CBVozwv2XX5GerXy438LPeYD4asMCKF/
         MlLQyCyu1Nyxc7S3nUxF+BnLT33ur34GYlIsMSym/GAGOUputffseJFyTDJ2UMI7fL+H
         1rZjHs4XPhE98oDSEqF0g68rLc2kKxp0sZHBPk1zw0EupD4fCwusEbhq/hqFwJgpJZ72
         JEWPccItniSxpVYanfgSREFhiEiqOatDmAFQGJ5eIEKJ8s60iFtrytcWj32JyR4dlO3p
         uKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778588342; x=1779193142;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moyklA7z93lE8+Wuu04kiPzAGDGUtPT5ReFu5vay3+E=;
        b=He5I9JWrgaa3XvoEh7vb2rArKpp+LmShnY+zUgPyB6XQAVZkdDe4QXLrAbvnaazZp5
         UKY3IT27/8N/pAlpWWZkJaUDGECqVGexQrFetTCVKBErozlFOsx0lJ6SsNVl2VPP+iV5
         mIrFoGzkMNdvlHh26zWPdl7rqP4Ex7efgCgHqHv8GE6GqfhEJVA3/7BTjsrn46JX5+s3
         6Lt9gnj4Ysi9zAtE7B3z5wGen7DKl3flx+WibZOtyt5D+I+aGZaKZ79mmpx0WuIhxrt2
         Z1RNeP+hzIt9/QdxEOzo92DQofe82Y2E80Dw/fJ50AwXGG6INEkIqqPC7x7kg+1+U2AM
         dixg==
X-Forwarded-Encrypted: i=1; AFNElJ+Xk0/zG5tGolynreL19DBPc0K0lNcGSarSl8mtkiBNZiZMs/c14iiJUarumvgfrVlEQPUlDcSFy9uy@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlr8fuhDKUjSDkUauCVY5tRWeSBQT1a/7UmnQfbVxXmp5kR3kK
	akHti6C34GzwzFC0JRitcA7884KhxCecAUgPPlnSLmaxohxqhJLOhKvl5MhqLvzSOxovtuOVqCW
	450aIjCXjP9Iq1H5OsyB/r8qfYUHzttatls33l1vgetb34X0Zl4D1xBtNRZCxhaX7
X-Gm-Gg: Acq92OHbxugO2CFhjwNIVY6DeFd4udWZr1SCIzNxfeTRuDjqjeWyjRy20D3yVbfEjgU
	tffxqg80gRNXVkljJmTASMdKULxdKI0Z+WDXOC96n2hxHZsKwxEUKAZis9g/HWLM4lPD3KKR4rK
	wCV9t7SkH107dkgWFaL2D+A6QEkq/TUvCzEPjhpXa3BLg6JYtzJcjfs4YYX1EXv9kAeXOFj8f/O
	VCOoslHuXcFgj0JSnNuaIbc7luyh4spYF7HQ0gkWnbAzgYIpW8D6sH3vSKP2R31lUwAlZns75AU
	nXJRgDjJFNiFAwZsD6iB9+xhfgPM8S612tCzrXqCTkMX5MvIFwgftSTo0yGhzDv94UZipyHs0Kk
	blvsExQ4LWb3RRY8XRgJPyT8nFXJ5rQ==
X-Received: by 2002:a05:6102:3f8a:b0:5ff:e39d:9f93 with SMTP id ada2fe7eead31-631d9b1b51bmr5956845137.11.1778588342298;
        Tue, 12 May 2026 05:19:02 -0700 (PDT)
X-Received: by 2002:a05:6102:3f8a:b0:5ff:e39d:9f93 with SMTP id ada2fe7eead31-631d9b1b51bmr5956825137.11.1778588341662;
        Tue, 12 May 2026 05:19:01 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a6a64sm33700213f8f.6.2026.05.12.05.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:19:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] interconnect: qcom: eliza: Add missing SDCC1 slave
Date: Tue, 12 May 2026 15:18:51 +0300
Message-Id: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-0-b1edf81bac3b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKsaA2oC/yXNwQ6CMAyA4VchPdtkm4GDr2I8jK5gDXZmBWIkv
 LsTj9/l/zcwLsIGl2aDwquYZK3wpwboHnVklFQNwYXOtT4gT/KJKDpzoazKNGNMCZ9iJjqiJSK
 PNsWVUXNi7FoXXDz3gYmgVl+FB3kfx+vtb1v6R+38NrDvX5o6h1CTAAAA
X-Change-ID: 20260512-eliza-interconnect-add-missing-sdcc1-slave-node-65020a3b2ecc
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=vPCIcZFi/ehqDMtx+YOdbyRuohx70UKLjM+qLnmTimA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqAxqwsmKwv6hI8nmsmEy07nafxAoYoR0oMbBhB
 UNnqvaDNcGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagMasAAKCRAbX0TJAJUV
 VsL1D/sFitC5CyqxQKs2qbWH6C6XyfO6B542sW9KJ3Q+mTe1GWX8GFtYlOgSYT9Q9tBimRg/xnC
 3xWGpbXvLoDWDO4wxkQTDNz4/ukDo7zU9VYeVhnyc9JE+WAYaDMkZIPdbxnc/PXWDhoQWV4FulS
 JSgW/VEQ0gWUR6SsucXuXEqIaJ57+ZUs0jz9W8J7MVKqyypu4aXCS4NV0SaTN1nnYiPOGM+4SZE
 +zrt3RAZ1QITl6YrkISiuIlTkSbP7ReiTP6ZS+YBn/yv8myxRpYX8L89c0I45+sYFAOtWNaCVfP
 q4Yk+rtsn16c2c3E5VWCk9p7ZNsb5Mx34G8N1kUyyQ02d5iH5f5pp/c9dOpFFOHCiI4220XWlk2
 8AHGaAcDVR1zbhRGCSRlatveLEaXgq5oFDyGfoLh3wIUl8EII1R+L7upG3D0mHs+voatg04qn5P
 IqsBjXfNMbU5uxbk8R61fOSeEYWE3kn/Tc/PV91s0tfbMr1cnVm9KEq+B+mrQe3xXDGOb/BAneA
 wjiaQEd0tCvQW4gBTt2QYkjKGLqpKQ8FzH5HBwrbcHIsccQ6/FJDPRBPmroFvyClKopNcGKtsGK
 Dxr9/nUjAOvOaO9Hz52LrAc6a9T5CMqlXKqJe+5QSifqgvpNIDs0tqWNelm8nvtAZpM6OcwMh63
 sY9pw+LKL5x6dJQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=ZrTd7d7G c=1 sm=1 tr=0 ts=6a031ab7 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rnE8NOWamw_VgadXKa4A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNyBTYWx0ZWRfX43hv1EZOZKmB
 QlrxCfDDb/y+EL0An0HcNNXwfj6Fxq0aMRRXuWGBSL+xxeplWAaW/QNEV8IJmel4qtvClvwJ/qE
 0cxT4iVN3AVB8Au8VG2+szC5k1OpZO8fF7hTOHRq8TFKLl+DwGPQIbkMgMSSPwOSjAvg4l+RLd7
 tWe0lvZKoQUcYu4xVtPp91TVNYVgggd3lTFvORhlHUmCdcENtS1jDe5pKIMusRFH9n0NRP7K6Kk
 UoRnx/s2CM47O87RLuWZIBTQe1ti2NPuKM53gmeOY5bCQ7v4qZxXUxNxEuRwFGeHJ5vi4GwYe0H
 f8VRlboD/vcEwVGQhJPi+K3y+MZq8+X4XKAah66Wpb5mJnJY/g8KEAEL5Sa74c1w+fuC9TqMKCt
 Ragj1nC+p0Gi70HroytGrweU6kNGUtEPmCe+COtdXBdNtV278u+4bUHt+5disal1JgzpTwtHeV9
 nEFMqlK845gWgt4BTcg==
X-Proofpoint-ORIG-GUID: kGIb7EcLxfRo3EaYhev6ftN372ykA8Op
X-Proofpoint-GUID: kGIb7EcLxfRo3EaYhev6ftN372ykA8Op
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120127

Add the missing Eliza SDCC1 interconnect slave ID and provider node.

The Eliza interconnect binding and provider already describe SDCC2, but the
matching SDCC1 CNOC CFG slave was left out. Add the binding constant and the
provider node so consumers can describe SDCC1 bandwidth paths.

The provider change also adds qhs_sdc1 to qsm_cfg and updates its link count
to match the newly added entry.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      dt-bindings: interconnect: qcom,eliza-rpmh: Add SDCC1 slave
      interconnect: qcom: eliza: Add SDCC1 slave node

 drivers/interconnect/qcom/eliza.c                  | 11 +++++++++--
 include/dt-bindings/interconnect/qcom,eliza-rpmh.h |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260512-eliza-interconnect-add-missing-sdcc1-slave-node-65020a3b2ecc

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

