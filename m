Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFA6401A18
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 11:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198917; cv=none; b=aErt5SjzbnpXJnx7Y40Zah1pBtSRUQoHwI452FXVq/Lx6e7WieZwUabuFz6YuHK8CP6VB2xLlh7Vy9DD0gIRPk3VFtw4um0XZSZSkVTpn0zMiX24u0pqmI3XzS368GYiUhVYDUSOGHekYaP9+rVMhJ3ZC8X9jBTxsm3gEJTcmkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198917; c=relaxed/simple;
	bh=o9HmFfsKECmR8H/NLKI6REvTO0a97pfHpUwnTR1A68c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pcPZETv/xN7sFsio47nGkmdkWefVzkC4JlJ09+LzFUxmPslLMEVBdMw2FoI4QZUf1j81+jxC/9+L0+qkgWonOlwHvYXW2C/+KS5gpnB09B/2TboU7eVQSzjWYngFPkfQzNStLA7LDw0/HZJk7bSZDcyorrMDLUZqAwKx0qNeYg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0IuG+xF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZCYl35p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0IuG+xF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VZCYl35p"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695AoKl91711302
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 11:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=w1NsLwgyjqSIi6Sol8iEAZ
	MZwr2gELkPoARLMdo/k6g=; b=b0IuG+xFQ3I1H2Wxbk73zRa1bdQDlBph8MSHqU
	Hob4ixLDtQ3CblioMe0xLfx1mCaeaovmVAV0S/qYTV0n0RPvrU+D52wk4z/RFQzk
	7jq6pNJTOCIOemJKtQAIOHVL6cqS0HxW5bXarYPQcuzWQ4ib8iW0TAV6JcHdY4dF
	M5Ij/HAnn+iwGsJDFS1STqcsSncezv+wow/P+fxJTwE5rtO17W7bYE/WUGUjcStx
	HBZTCgp8TQrnJ04ybaS0CoK4ijWjQJfpYJ5We/qnVdOe5BcTkV3mcVlR3jhJov3I
	K2WUYkeNJIwxtFmAanJhipwDFp9S851kA4nWMoqZrzhZUUsw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssudm2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 11:15:13 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8886059d3faso3388732b3a.2
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 04:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791198913; x=1791803713; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w1NsLwgyjqSIi6Sol8iEAZMZwr2gELkPoARLMdo/k6g=;
        b=VZCYl35pmxvUuO1K6YQ0RxhT88O3zKwYYij5D8WMz4kUUaSbOYxdWWtceBP9LbNF8d
         5Httb6GU0oQmuDUYI7FpLCIJpVxNsFCgjJR1E3HU+vZgbeWuBiZukbCWZJ6iNM5bnZOq
         0r7jXJwEQ3qxQOAefN7sqLP3KjgK4co1L8YhjZyBRzT2zOFrMwVd+cDUC+/Bw3xr5dmS
         kHe/w7SzeZnk9cqHTOXoLbakKLSm7Qp+RGxgSUckwWSo0qp+Yfmm2Ut/nOa6kvESB347
         Hi9mlzjz4/3etUiTVy25bP9qylKh8ulxU53TQ9iwbp9G8RKN32x5e8kIrPpTmSkXahbS
         NAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198913; x=1791803713;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w1NsLwgyjqSIi6Sol8iEAZMZwr2gELkPoARLMdo/k6g=;
        b=R62g2Iy2NFjcy5ON6YbjhHSiRW/Ym8B0wFRKyz5YV4NNd7L6y9Fd+g8Gc2UpN1sJu2
         D2pQSS7YpVF+K+pRrzuirEV52czEjzp0Aapr7AJGNSi0lkxbfb1hpkYed/0TTxD/OXlY
         gL9lRRzYXpRRT/w3cmn1LJQmqsAmCtmp6ie24hn5lNyV+odjf2l4LFL7fnv6kUIIWcbB
         n0TMXwplsjtuiXxwdp4ELIKma9o/1DFuuaJarYVtQJGSkcW91FV1vfoRRiynE2AT1fY7
         /veQ5mTk/V598J3h28V/B/BL7xlgjVN8XiVXInbRpBuMqBMKy458rcfsGh32oJCkdMYo
         YSbA==
X-Forwarded-Encrypted: i=1; AKwUvByNbMLvF7omD860GIZB6pXongqc9Y13u7yx86k+x7nVagq6K6J0D6/MPMpCtN7pN9ehaIMPK4uUzNYo@vger.kernel.org
X-Gm-Message-State: AFuF++lML4n21Y8+ETT4sq86w3+kgf3dUg/ROaFVzjJAJpP29VSYg3yL
	gNospi9arTiRN6VrcSy1F/xCIpe6Em3j0Z2bpVKl062jMatqDrFnjkq54Yozn/SnkUfpJSa93M8
	tdvhUZQxKLC2wVgp6twFBxvcmiftAGL2SZqEYcftxL8frhQ5tkvLscd7TKwCSTgvO
X-Gm-Gg: AYBFou3jACm5kFkfKvR0xAMhyTxxqaLbUiHSxQC8ouI0ATn5M7ud0bx3BqieHs1mSQm
	S7w/S6j1V2gUreMWM8UHJPwfGMfLP/NC+bgh24d2bRAlB6vj0NEeZrPqX01167H2S8hq4kHkU+F
	vnc+MABr7+OejhDX21wlUvbfWYFiDTtou1vD+qHDeQSXIMicQ9hEKu6IXX5cSlT/6mNw+Euvf7s
	TPiFhySeAk0EZG8R4ntnqgvr/lpcU4GOtiB+//waIT5Nxades08qeJINTCa+2EbTwc9V+1Fba+2
	ISbCoDK8IHkkc5ShqqdaxrsUdlgohjsnyR05r6AUACZYmup/HQfrI798XZCC7zojAY7Ml4RVEBA
	5rxHzMN/jt32exQ==
X-Received: by 2002:a05:6a00:3690:b0:851:b03a:fcb with SMTP id d2e1a72fcca58-88af54f7436mr10139706b3a.14.1791198912793;
        Mon, 05 Oct 2026 04:15:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:3690:b0:851:b03a:fcb with SMTP id d2e1a72fcca58-88af54f7436mr10139667b3a.14.1791198912337;
        Mon, 05 Oct 2026 04:15:12 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c59e3afsm3249852b3a.33.2026.10.05.04.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:15:11 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: shikra: Add EL2 overlay for EVK
 variants
Date: Mon, 05 Oct 2026 16:44:44 +0530
Message-Id: <20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKSGw2oC/23MQQ6CMBCF4auQrh3STgMUV97DuGjrII1AtdVGQ
 7i7hZUmbib5J3nfzCIFR5Hti5kFSi46P+WQu4LZXk8XAnfOzZBjzVuhIPbuGjTQgEBatXUrVWW
 lZXlwC9S514YdT7l7Fx8+vDc7ifX7l0kCBPDGGN6g0VqKg4+xvD/1YP04lvmwVUv4JUj+IyBw6
 LhCNFRpTfRHWJblA8P2Xz3tAAAA
X-Change-ID: 20260918-shikra-el2-ea8969385c3c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791198906; l=2084;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=o9HmFfsKECmR8H/NLKI6REvTO0a97pfHpUwnTR1A68c=;
 b=T/us69DYwnNZNHkBsx3fsjcd8xMT8gTuKZhbye2p1W76I50YTGte5KeP8BK2Uu8giOci7OMpp
 mlY+FPwZsubALhB0tKaqtVLZK0wlnTtP0ZgsaaYUBOI1DCGHJEvCt4M
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0MyBTYWx0ZWRfX6QEXZ9Ddo8ep
 km+GTgYqp5xA3RwzkTFe3PHqab3OGyz0kVmPQPokDA7bCmp4nC0I45tUOHb1zlfvds7hCs6sCSA
 VIkdkp3zMpYfMzKnLnAW3H5+n6NoMCI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0MyBTYWx0ZWRfX+Vo71Skjfeut
 zyIx72icp0bny2EPHHHgBgt9b1piF2at2OP9gQdDiCN62XxWKh2NUn1DG17KI4n/Qh1APWWblJj
 EiR3Cow+yOI+AF2rJratbxY3+qfdiqD9/WEWgEkGv+ikRDQVsSh7T8RVQ1jZDq5tjaUz7Oz7y2A
 h9ChaUCH+1EDVDXcNTCBF3Bf9itUJhfzOBu42wp6qv/lNFWfcGrs81WFpG8baTYo+T05EBTKhj9
 Pi/CGCFARtdHj4zXE6MjIHpQqOIAL0JGAEriwx1GjczTfXG8FnQbES40jH1bSN8HSPm1naQQ8JW
 ybMI7LLcbBLQovkeXe/CqYoxaAH7pXv1lFE4TvUrPgKn1Rh6b4FwAkaReeFBfJJFr6th8Lp1fhl
 PASlWkGVhvcqu5qecP5DhRxNUceIoO6YZAAadTbTN6rQp4CCY6SqtzcB3zPPXC0UMFOJqchX06u
 lpl/fhV2xYecauFzRTQ==
X-Proofpoint-GUID: HhSna-zdv6jOVKbrJjAS4sdoxzhMLx6U
X-Proofpoint-ORIG-GUID: HhSna-zdv6jOVKbrJjAS4sdoxzhMLx6U
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac386c1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c34ISMXoqBeJqo_8tdQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050043

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
Changes in v3:
- Drop qcom,pas-common reference and add per-compatible iommus limits for Shikra (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com

Changes in v2:
- Relax the Qualcomm PAS remoteproc `iommus` item limit, needed for Shikra EL2 remoteproc SMMU mappings.
- Link to v1: https://lore.kernel.org/r/20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com

---
Komal Bajaj (2):
      dt-bindings: remoteproc: qcom,shikra-pas: Allow 3 IOMMUs for LPAICP
      arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings

 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 15 ++++++++++++--
 arch/arm64/boot/dts/qcom/Makefile                  | 11 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 23 ++++++++++++++++++++++
 3 files changed, 47 insertions(+), 2 deletions(-)
---
base-commit: f0406245cb9855e6318335a8a223551354291a46
change-id: 20260918-shikra-el2-ea8969385c3c

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

