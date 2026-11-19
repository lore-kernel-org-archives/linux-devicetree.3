Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088660;
	b=xaaLe5xdt20TDS8zd9qupuyQRTRbJ9tvUOyZzX+X3Y6GUuYPfOi4NhUvXsoEHgp+bvXJ
	 RDTTXs55Q48pqQ4IWUN6P5zAzv2rHotC6ifTq5BoGl9uWwm0U5OXFYcOxaJwvC946yNaz
	 f6GDnEFmtZCJeAdP9buefegXc8x2I0tMzg2Z8uiTCpo3uzAAUFVhp1ZQoOBV/spozA2xc
	 hFVwDM1JlnReoeJiWQlNRzzXn+mqebqjl/lxLwN+zR2AHS84jZr+R4akrJvidGQPQuTnj
	 Qb+O7UMAC7JkvnEJxnMho1dGaPkOZxwgMWs2yZwDuMLwOwDu/EkzIvLTlUN/xMYm27Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088660;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m1eQxsHFa699Ua/aFuaIkpdVXk9LDUVO6F+1+W291SE=;
	b=RkbbgQx6s1j55S0rfmBHFj71d9QlKpw/98EdDpEdKjNyA2K5pDVcMRYQJPiYJITWQHCl
	 gcJHctvuMxMqD1MrrPNZFkwvKRlJ2OlmAow+h456GFUF4Ww8czB1Bl/0wYOuT/sX4fYLT
	 v2IKB3/hOrnw1teVTLFzCoF/C2cZQgcuX6/ehifUXq/ujq4u/Dm5RxZC3SXadULbH8mIr
	 mN7/+yVrvw0zaBssgPYoumjTiVyggkRG8oyO+4EFw4nSbwRWt5/s/MKp9z810ln89cvjQ
	 n7ejm6br4YjuqtZQkz/P9kK+134vqO6yeulRB03PCzBXiJ5ewYLWvbgTt6RNTkO0W9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H4fyOGoD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YfKVOHje;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9432E606A333
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9432E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H4fyOGoD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YfKVOHje
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJAuToM3211736
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m1eQxsHFa699Ua/aFuaIkpdVXk9LDUVO6F+1+W291SE=; b=H4fyOGoD3FTNWzU4
	QomiTbFfKGSBwsc9F4fyRREu1WisN2Ej9m2JEwA6J3ip4MBR1Ndyp0FRKFG/Bull
	Lm0qjuB0sRJDayLv4JWG1/vWP3+DLEBX8j4A+0SZ8LbbFGQkTLINAN+4EASbhqyv
	BJukAsR4JtzQQ4+tNSWYidCTiHaAKr+aJGqg3rklBJck+w7f4qI4iRPvtcuP6k6I
	huqVyS9oFa1kry0484xIW+Hn0CjpgqaWU21y5hAYzpTaKfMWfS1gNVk7eK+yKVc8
	s9HCW94nAb2IxBBJwj185z7OAcH/2Kp8R7Baj61++R683Bg9BJMZEKOZKlNdqDP8
	rqgbww==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xx18df2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:44:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b8cef34b43so2504991b3a.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 03:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088657; x=1795693457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1eQxsHFa699Ua/aFuaIkpdVXk9LDUVO6F+1+W291SE=;
        b=YfKVOHjeYKRVMka9xYP0lA1t5WRc6ZRdGh/2hHBSe7XiT4172nAXTG/B1nPmVlTnsO
         oE73CqqpHTr1mVlPnU9afQm51ujbEj9gqvP76UsD9Gi6h9/dKnj+L4Hzvi+YsHOcsvuj
         /dvDG/Khg9pQ+IyNJfMAHagooSJrmCfRRXHKiYKXVPNP6cj3mrhdpZVbHZMi1tj7o26h
         KHbaupvSG2yDedoNKdyl9t/rbCyX5ZqbizATuriRfi19YIB5uoykvahn7I/8zR2ANzMy
         wkanx/Zid9DjntuBzCeWQW+m+fxuLSq1aQJfJ6PLndQvMOH/je9HqlLlBbCH0tgi3QSX
         P6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088657; x=1795693457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1eQxsHFa699Ua/aFuaIkpdVXk9LDUVO6F+1+W291SE=;
        b=N+Q+k2rGs4sCZ9aOaa85v2hqmgrDj6wKvl2/GuAwK39kdrYvYWjf6+937Wovb7blUe
         DqJs8tmR9Ht5ru3ZhIuAXCrAXjb0aLFylBeFTVUG0xS5eI4HAn/6WDcFlSoSn23qBWDO
         Ke2f1te/4wU+M0pjwkT+qcN2du6h5fUn6l4HBHJLBaDx9QdK3Y2+iEKTXQPNR7gf4Pr4
         gURF5YJ0+4XQgb49BKesbT84FzAIH3P/+OY/fnaQnFje1k33/NNPjlZBaD29FzKxydqy
         yQe4zZqZfvDwE+gSok3rtpRiK7nA1yMfBNuIlq2fxeGmFM/PXpCr2I/4zvn0zfQFN6l0
         mHHw==
X-Forwarded-Encrypted: i=1; AL+hErEKsjF9/c4RvHH7E6oD5ybAE+2b9qUc7jagBOHg7bKEUugpVJ14Upvx4HwMUdHshqYkJU2wiJYEJzD6@vger.kernel.org
X-Gm-Message-State: APuU4Z+nGZtY43R7EenHqDHkOBWzB6+lyEUKRQRFnbuq20voaonN+Gjt
	uOq3DTiUAscKs6vj7VPuh3visFe5VkT3ZaRZNb5NIf32MJCamWc9+dEeq+Pzv6XSIcIymC7dW3J
	ShVdjJzFT1fFtBENnfjbOqPutP53GXBZZtNtL/tO0w+qadxYktUdk6RdDwxHQqaHyS7VTFZsH
X-Gm-Gg: AYBFou2hmg6FahJm9WFapKkAsyTPWMP/hDGHH97bqQfpFgXA5UDIweeexuaZekpwgOh
	nUnAzCs7tMwuAznnr6hNdtj6lV7j0DS7ZPlHnTDqmFdf+q4eg64td5g0CTROklfjyIJyqhiGpGt
	q9cOl2+ehUX3dw2ahfQnt6s00QVUMomJr//O+vkiNsIum7nphnzYLZAOngjmk8bmzGnzGHpeBJi
	aDhHo3lWXFkIK/7lJiFiNajYl69oggUZ0UCkkK7jb3Nz0RvZtzw2NQRLg9fQEQTm9ChQc9Ogq46
	xfJQjmUGoiOu0W7+jFeN+VBFtery0q5THejicbxYSzrdyDX4gvRzWVw07nFd373ee711lej0NeM
	35h4/WN4D3ACR5JLgP70sJXgDuHMwjKWUYx5RnGLrejyzr17TDZDhJvWwHDdUBDEX
X-Received: by 2002:a05:6a20:6a26:b0:3e1:8890:8400 with SMTP id adf61e73a8af0-3fe892fd632mr6601965637.15.1795088657298;
        Thu, 19 Nov 2026 03:44:17 -0800 (PST)
X-Received: by 2002:a05:6a20:6a26:b0:3e1:8890:8400 with SMTP id adf61e73a8af0-3fe892fd632mr6601929637.15.1795088656809;
        Thu, 19 Nov 2026 03:44:16 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534854b1sm1613960a12.12.2026.11.19.03.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:44:16 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:13:47 +0530
Subject: [PATCH v6 4/5] arm64: dts: qcom: shikra: Add EL2 overlay for
 remoteproc SMMU mappings
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
Message-Id: <20261119-shikra-el2-v6-4-0e91a1467e79@oss.qualcomm.com>
References: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
In-Reply-To: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795088627; l=3032;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=jeuAGuJGjEHWmNk486jltyoZtfg/HSQjsJbCk2VSQ8U=;
 b=khI25LKwln4o6xiqJfXSdA0+b1yStMxCm3lUDbl4//WeF6QeYGQVDO+UUw4k5yW20s1TDNllA
 6ewCBIKS2HnDZhMIocMtri6uO4RCy4qxOYro0l1nX2HEpxlTkcxN9cl
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=PcBqFShd c=1 sm=1 tr=0 ts=6afee112 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HO6vDeO3Qxi33uTxly0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 1pmQyqF16oennkgVy6Ta4GpI2Fh_zIjx
X-Proofpoint-GUID: 1pmQyqF16oennkgVy6Ta4GpI2Fh_zIjx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX572sH53+Af0j
 96W5i4utYKKBjWTY9iTCoAsNMegMHHubYFknkUd/3O+hd1u72rDjo75R3gdfHTdzdxI5vYrzCC6
 xou7xKpqL/f1cKZgjclKDg2mjX2brmmI1zqj5d+fuqSVfsIp9iXeggNs7Gky5nttdFssmwUfRSW
 HA0wklTDE7Cczl59qwC/O7TJ4IM4UR3+e8gH52JGfE+9HsKa6Y/v7jIOrMwOgVwNqf8AoI8Ld9H
 KL9e9KdraL00RoCB40ciMMY8yq5xwI4KoDg2s4CDvolsIJLl4z1sfmNUoyCskxzkC6OoL5cQasC
 PELDE8NPGhkTOWmI11nAWlOLhv0ApWcsmAwvVnQIpq2l1bahAFYxjIJI2iJ5FwAdh18B/BWe2gu
 +JTDkDp6DKtzcJlxv0q8PSQwTd9/Pq6dPe6by7i7gKNbfjpgOobsHAZKwpHTefZSlTBfUUTht1I
 DNgMLAVFB1P+B/zgZeQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX4Nay5/yUvGRn
 U6Q4J5E0TzCZ/oset97STAMRH+GTs+uEnjiBokvm7Qj6DavMlfz9xR/RJ1uKa0KSreSmyys3zBc
 M1GyaVZ0yg2avtdmOqn88uavlsrAtdk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190046

All existing Shikra board variants boot Linux under the Gunyah
hypervisor, with Linux running at EL1. Linux can also be booted
directly at EL2 on these devices.

For EL2 boot, describe the IOMMU streams used by the remote
processor firmware in the DeviceTree consumed by Linux.

Add an EL2-specific DT overlay and apply it to the Shikra IoT
variants to produce -el2.dtb artifacts alongside the standard
DTBs.

Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        | 11 +++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso | 38 ++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..5c8d179f2792 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -416,9 +416,20 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
+
+shikra-cqm-evk-el2-dtbs	:= shikra-cqm-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
+
+shikra-cqs-evk-el2-dtbs	:= shikra-cqs-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
+shikra-iqs-evk-el2-dtbs	:= shikra-iqs-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-el2.dtb
+
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
diff --git a/arch/arm64/boot/dts/qcom/shikra-el2.dtso b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
new file mode 100644
index 000000000000..89997ed7699e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Shikra specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&iris {
+	status = "disabled";
+};
+
+&q6apmdai {
+	/delete-property/ memory-region;
+	iommus = <&apps_smmu 0x01cc 0x3>;
+};
+
+&remoteproc_cdsp {
+	iommus = <&apps_smmu 0x0200 0x0>;
+};
+
+&remoteproc_lpaicp {
+	iommus = <&apps_smmu 0x0360 0x0005>,
+		 <&apps_smmu 0x0366 0x0000>,
+		 <&apps_smmu 0x00e7 0x0000>;
+};
+
+&wifi {
+	wifi-firmware {
+		iommus = <&apps_smmu 0x01a2 0x0001>;
+	};
+};

-- 
2.34.1

