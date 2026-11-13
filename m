Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580370;
	b=hCnWkjIi5Awy0FSxx8FhRlZURx2HWmTdCTGLEUlo6O4uEsgrwMC/BpuqVtk3LGNuuTIe
	 jI6P3xZiA3sjOK87pGufHiefrPo2fByLJ/PBdEn8E3edXw1hNlAEgEg0VTQEJPALuH+KI
	 uIH7VtC1mhDWSUhgND2O+XFemo1c3WOiNYj0o3u81TTbSR8f2/pNM6h2ecGtlrOUa+86A
	 BUs04H8WtZV0l/N1eLTWJl8Cu2qUSiXyLhE40QHJ0ZFH6DqWozGvivgBYo7pMm9PTAkJP
	 PWz2dHb4yHFOAWRt5bcI+zO6Vo8CzCkMk3pXhC8iR19oxV2ePrKIMOtlv1+LhzZAe9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580370;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1rjsZQSMnAfQ2xKNuqDsFYfnZ1wXBEQg1aBQ/7/A6tA=;
	b=33orDvb0T6Hz4b+W7Hk0TYuf4J/uzIno+/fX4tAkV/tPiUqyqnZ1nl/kydZvNFyuYEBv
	 CYMxJnlabCoVUHaZNwIVWU9N1HbeGV14xLBEWFvUq6xvGS9lQvb/6AZEm2x94xIEk6nzi
	 o2tlEQwBRzxT+sHecFZjARGtYWMi5Q64AzHKmGP5Ad3d90dYmF/ERjWZOcC69bGCHMR2X
	 IQorN4vTk+MLkotrWbZNVBWvD7sllxfNiZO/c1A2OxcnOPP9ykcStOXPMu/cwGHEy/qBT
	 OjfAhRH8rKOCee/qzpTkZT7QL9Qy0azG3rRbAoVL9qutb/tFrbzTWvKG6mKWkikKOpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HLa6u22w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KkHAunv7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6004606A882
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6004606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HLa6u22w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KkHAunv7
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJVNL3771989
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1rjsZQSMnAfQ2xKNuqDsFY
	fnZ1wXBEQg1aBQ/7/A6tA=; b=HLa6u22wkwQbhtzocilLpOdaL41OcFYwoAwAkn
	0NLoL4GXoHwcp2KuMhTrLM4ZSpD9FcvlwxMtgxVhwoRLkM5cxM8JN016/kfl71pQ
	dbwFXK3I1WyDzXo1yHD7njVeZn+6s3Cbb4ES82JIfj2Lba2WRulmHhHqJM10xN7m
	rNdUq3siCq6jRdo/yi7qOM3zqx6R/Ao++PEnL07ZjK9za6TR6PyRJfKCXeVGObqI
	/aa8bN3kf2lC0SPmebL4fKVjjMis0luLRTCNlsHVNypl1Jp7UUK3+5gJclXMW/zR
	jqKzA/Zg4o+yVYQoeMHXDlucncp+i8f09v5bZ46IQxUDWl4Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mt4p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:32:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so212545485a.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794580368; x=1795185168; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1rjsZQSMnAfQ2xKNuqDsFYfnZ1wXBEQg1aBQ/7/A6tA=;
        b=KkHAunv7+ZoEJzFDSgsTf8pMCW0XNVAVt4S9YnnStH0uw1Ne5L8PVh5zIhMSPP7JIz
         G373fT633YXavNT+ubyMaOZGtXVtFhrpx5F+BoAxDBkvUwCYSb9kuU+T4RlTjXkqUpAC
         HHkNfwBbTAOdMqjgcjWjR3QP3OqE+9z2Wl3YntZ4GquhFAkB3hnUWAoPwa9ZTe8Rot1X
         mHKCvqNsyOR2FNZHRHMnLY1GCoIaM4iVyXNT/FfdYi80PfEUm3ggVm/Qowoi9Qbwk+k2
         aFAAZtnq6uiI5LEC0+49jGzMJtHWV51fMmm108g0UueLwqH1q+T3AVddlzNvVU/+KhiL
         uWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580368; x=1795185168;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1rjsZQSMnAfQ2xKNuqDsFYfnZ1wXBEQg1aBQ/7/A6tA=;
        b=DToZWm+152V7DRYMBeBLng3oIEWada4F8aHDTNWRylXWcqdYmr1DhL+82Zp5ICgxEP
         II2/jP5nMxUI61IFH2Xd59y0kFf3kxN+jGI/w2dDy2+vdf8nBaomWtrPuv0IAFWh9BFi
         dp8OLwtiVefdghJmb3HxzolUcFiRkaJuptLmuuLpoLQkhPcl0vBbQqVqF6Y9sbqctN0l
         ahB+iMlryUhnmRpIcMh5TkjM0OwRzD8patPNmz94huaa2bMhEBe9jZj5qJtn+LPcXiC4
         T2UKf23RVDOKJI65bdQtDCqDAFLWRZ9QiKptC9QXfGPVB1w5B2DztAFhexijVnKAFFQp
         8Fgw==
X-Forwarded-Encrypted: i=1; AL+hErGidZOlxcVxmumzqqVAYEYVGiydDc8GBrqjf+T/xOnauLGylmi7SNT45+8RiXdiSf69XYCFfTTI1sS7@vger.kernel.org
X-Gm-Message-State: APuU4Z/L8ycDVd15gzlqSwgZF0WZTbnL+KqbhlqM6bfV/aDHCOwi28HC
	UBJTN5rT9mUl+8H2e6rIPn8lIPsKuk0bL+Eoan+vvstJIAdRV1Rl6GwJIM22XoDgsQVzYvd5H0j
	XwV9pc+TI26sYKOvbx3PykkbZdrHUwH1CDpSnEBTgG3z6PAIp3p4BvTxbUNEDaNDi
X-Gm-Gg: AYBFou1z6siKu+qMnqWJ5na+HJUXO+zM1gRL8jCeG1nBXxccqMO5keGKawJ4hA17xlS
	OlMalBd2sVs0f0XgAsRdGOCvA45+jbFE/dBdnh3/4m+tjAM98tK7ubFhopN1wQCNQrWtvt5VVqS
	GhQm4NGWmxTeSuU7j3dBi4JjOyd9lSVkf06w+JbQhiTlq4UZ4cUjngSXRvzkf5Q20uuoGn+t8hA
	ZH/A5alEVMapmIMvLiQOvE2DejL0wPzAN1YofRiolvxy+mG3mrwH3HzzVWnZeVaRGJJLhZHbliv
	Q4eiXuSFFTuZs4mlv3YB7yUoUc/oBknpQhMC/fwJiXlqDZjlmCMvHXdXyQ4/rCwi0ED50sMMIH/
	luvjgCL2MJtuTlsqYW2w1OwKjSlbFSykTW3k2pxOvDuEagTwUgh7jTZNKN/K9plI=
X-Received: by 2002:a05:620a:2a01:b0:93f:231:9ff with SMTP id af79cd13be357-949330d5136mr931369985a.27.1794580368113;
        Fri, 13 Nov 2026 06:32:48 -0800 (PST)
X-Received: by 2002:a05:620a:2a01:b0:93f:231:9ff with SMTP id af79cd13be357-949330d5136mr931363585a.27.1794580367477;
        Fri, 13 Nov 2026 06:32:47 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9495a5ef5c4sm71948685a.6.2026.11.13.06.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:32:46 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v5 0/3] arm64: dts: qcom: shikra: Add EL2 overlay for EVK
 variants
Date: Fri, 13 Nov 2026 20:02:19 +0530
Message-Id: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHMf92oC/3XMwY7CIBDG8VcxnBczA6WAJ9/D7AHosCWrVkGb3
 Zi++1IPuk30Msl/ku93Y4VyosI2qxvLNKaShmMN9bFioXfHL+Kpq80EiBYsGl769J0dp73g5Ix
 trTQqyMDq4JQppp87tvus3adyGfLv3R5x/r5kRuTIQXsPWnjnJG6HUtbnq9uH4XBY18NmbRT/B
 AkLQXDgEYwQnpRzRG8E+RAQQC0EWYUWTdSyka1V4Y3QPAWEZiE0VbCaNKDtyMf4Qpim6Q+s+X+
 xcQEAAA==
X-Change-ID: 20260918-shikra-el2-ea8969385c3c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794580360; l=3440;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=bCiMZ8Fv97xxgaf3+Qm3LMt3WxQjKVUrKaptjBGkrrs=;
 b=ZZASSHgFd3GJtQJ8e2kQl+5d+l+L5ObyCc571PvEnLX1MmTtshzTg1vSviPldWND+mWQfIvy9
 DYeHYEugw54ARU8COxidd8BOyxxXTkKgEomv6PXMkQcvMDBsWG3HYXD
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: JFyLZ2T4KcKlResExHQGZqwaR9tbWoL2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfXzBgigg/MSqqq
 QaeekNMAUy2Si2K0usEIXJe9YwytXHiRYN+nzPcL2es3cvOIzxlwlWdjVvR0BU3AM54d2FMTLJ/
 ZhWKtBTVyjh6YZG8E4aCBmeAKE/3Aps7PH1uQ/3q+K8quT0dWRANxRJK8obu/d384C5pYs9WOmY
 sEOsbniJxlO0uSBGtEK0/6DM7f9NBglIOmE2JDdlaWGl5NeJhxjSar6cNNIi4X1Zo2DFtMlJbJC
 6hXJ04N16lYZQPlLjJeOzMH34f3sc9NMcVZ5ANqtl29ulqh3oWVKs2zHJHgcuja5b/CE5cMmB4Z
 Trlr+K/IwuzKnRHz4aDn/ZK/26ta84EsnGRjCORmVqHnzujgm8zNimVQnSzDGnNzKRt/92yH07H
 y8OdlvKu3jqF5FGAr/ulVYM1Cqq2o5lXn45536f0QnaI2wpspR8dKgShT1/5jXr//Z58nWyOxF+
 zLfzgkoKI1Todmi9Vxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfX8CRC5TVmi6v+
 j0DDb+9ZBiMkhVbNgK/DNPAZhEUM0b4/Dt8ftdlNubq3Z0LfIPWkdrY08TFLXhNjPbiNIBE5hk2
 khu6FIXaANB4bLGVyLOV3BozXtmn1ns=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af71f91 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DOWZbCq784I2nnTUJM4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: JFyLZ2T4KcKlResExHQGZqwaR9tbWoL2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130057

All existing Shikra EVK board variants boot Linux under a hypervisor,
which means Linux typically runs at EL1. For EL2 boot without the
hypervisor, remote processor firmware IOMMU streams must be described in
the DeviceTree consumed by Linux.

Add a Shikra EL2-specific DT overlay and wire it up in the Makefile to
produce -el2.dtb artifacts for the Shikra EVK variants alongside the
regular dtbs.

This series also relaxes the Qualcomm PAS remoteproc `iommus` item limit,
needed for Shikra EL2 remoteproc SMMU mappings.

Komal Bajaj (2):
  dt-bindings: remoteproc: qcom,shikra-pas: Allow 3 IOMMUs for LPAICP
  arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings

 .../bindings/remoteproc/qcom,pas-common.yaml       |  3 ++-
 arch/arm64/boot/dts/qcom/Makefile                  | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 23 +++++++++++++++++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v5:
- Declare iommus property once in top-level properties of qcom,sa8775p-pas.yaml instead of repeating it in every allOf branch (Krzysztof, sashiko)
- Add Glymur ADSP/CDSP compatibles to iommus conditional in qcom,sm8550-pas.yaml
- Add sc7280 ADSP/CDSP compatibles to iommus conditional in qcom,sc7180-pas.yaml
- Add a description for each iommus entry
- Shikra: list three entries for LPAICP and drop the iommus property for qcom,shikra-mpss-pas (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com

Changes in v4:
- Add a patch to move the iommus constraint from qcom,pas-common.yaml to SoC-specific PAS bindings (Mukesh)
- Add iommus constraints for all Shikra PAS compatibles instead of only relaxing the limit for LPAICP
- Add WiFi firmware iommus to Shikra EL2 overlay
- Link to v3: https://lore.kernel.org/r/20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com

Changes in v3:
- Drop qcom,pas-common reference and add per-compatible iommus limits for Shikra (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com

Changes in v2:
- Relax the Qualcomm PAS remoteproc `iommus` item limit, needed for Shikra EL2 remoteproc SMMU mappings.
- Link to v1: https://lore.kernel.org/r/20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com

---
Komal Bajaj (3):
      dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
      dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints
      arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings

 .../bindings/remoteproc/qcom,pas-common.yaml       |  3 ---
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |  4 +++
 .../bindings/remoteproc/qcom,sc7180-pas.yaml       | 12 +++++++++
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 16 ++++++++++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       | 13 ++++++++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 15 +++++++++++
 arch/arm64/boot/dts/qcom/Makefile                  | 11 ++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 29 ++++++++++++++++++++++
 8 files changed, 100 insertions(+), 3 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20260918-shikra-el2-ea8969385c3c

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

