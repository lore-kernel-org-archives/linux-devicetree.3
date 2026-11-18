Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985237;
	b=DOeQ3VzcRC5RladLPoVw2CWfUCxRfJ9EP+HLyI/zz19VkEVM1j8VS9jIfPxYp+8owcDi
	 oitNkTzuMp5advBAea2W7xfHek63Uv1RuCwT+yTEootyk8y5MCPvVEmNcsm9XwWtqkY6b
	 QBQHfXyaoifSvf0Pp3Pgoq8g+4en5fxU/3DgDe1v1eblE1eh3yj5gyLzNsZLjdKr4xBMl
	 99WQV9Dt2FVwEfgSUuRiHRtGYItrgaAog5LyTL4TQt9ZB3n99w+A9/WtKlP99JjVT0UK8
	 skyjS8g5enq4XCgypllj9Aj1cLAQHRp4IVbteSaBXZWCDyK78luFPYZ375R5VNAEpzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985237;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lmQuX0S5Uv7E6e/YfcFegvaf4/mz5xAzkdHo6Nu6EUM=;
	b=o+jL8HDUstUBy3XAtMvFbY+h4HOij2Bml8djl6yGQhQLqIzKUWlYzqakAQ8oYneOetrT
	 z8rUhljyBNDFTmd3tix+b2pxCkK+vXWzRyoV9+MiaDUzin3M+Z2pNOaR2A2Nb2erb5Bjw
	 Fnm7+jfNFbpWYky2/dLdSsb1q8KR8CCz2aJn89EzRCOjQ07PrFcbNHA8aXvEF8nrq83Hp
	 9kfChoDagXYEIescj5T1/wQ+R44FUlnpNnWf0uHeKG9oVEQGPbNoJSPwsjn5aTg5GbEca
	 YRGsS651RhocSEq7OGlx/InJSpjMasWruTm5BZQLyiSBmmlDPyma0Sne8XtYHPQKZeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="e25Sv8/s";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PSej8zOO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ED8606A33E
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2ED8606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e25Sv8/s;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PSej8zOO
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UueH2383162
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lmQuX0S5Uv7E6e/YfcFegv
	af4/mz5xAzkdHo6Nu6EUM=; b=e25Sv8/sUS15LHN4PzaVv+Ta3HHyPsfw26WWaU
	U0B1UimwK/jCylHBbX8P5EYaX57MdM3Nh75b69uDsFcGbyBdI6+CeKbIAs5HP5h4
	QEj66tRs/GVnmfvHDIaVoEWyX+biEgsXi3gzELjs9k/310+XjOhUiiT8hNvu27aH
	BJPJW2258UD9AFSGRfNRHzfE+MEdqoi/wwTyQbpJ/SbdYWrdc9odaC1n70hVZrgm
	pHefravj6SRyYb/6YQhID53X4iqzT7Ql6yvnkcx52aQyM/WP5A+FwvdK+c4sqe4l
	hNSDeew2pr6NWXD2YTcUAWwrKZ7Glj9vu50HGIXFZrTNtyow==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvasqh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:00:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3a74ee77fso424907a91.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794985234; x=1795590034; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lmQuX0S5Uv7E6e/YfcFegvaf4/mz5xAzkdHo6Nu6EUM=;
        b=PSej8zOOdHKXlutB2VHAXHqne2aF3gFDAv4+3wTivP82iKYHFO23q/aAjA9eAPLN/W
         4+p9G9nEvAi2wRD8ffAf8EL8/A6NYVwVzGl9tjVMhzqdw0ruRp6SIklB7AydfvO8RUZW
         0My13XstM6dUt904HjN4kzDU8BP4zZ43TDSFarJ5tMLe1UK/nuNrvS9a5Fn2naQ8pTLx
         lsYaxQ6D4feCpf6pjlTqPc+WHpr07YiAWee7XfPaSBfdPOHffLAU3T3AYc3KTBUWhCup
         DpaxtLFDjX0I4QhTXiPkdPmXdb9KT4FAYh3pujSRzbGMBPnNkiUEpkRSRdfT+FFP9FqG
         D8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794985234; x=1795590034;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lmQuX0S5Uv7E6e/YfcFegvaf4/mz5xAzkdHo6Nu6EUM=;
        b=2tYLPQBXcp7Vk18I0LfleJDX5Nv3cNAEN5oEfLwdQvO5B3hUoO58wzoi6e/MtX1Wp7
         iqtMMNgd57awPX5RGgC7MHz+b88mxuiSziL0On7IDdmEWxlHkqnU75Dj+1ctUSVrPx7n
         3zfdQhdBMt1svLNE5SlP74ZhMTC+/FJH8Eu48wW1Vo36obA4zVMZ3KWigsrqGEyiFnZx
         zmcz9qxmqRUki4/zElBLczOUsNbLOX4xBRQgeswgXhL7YTgyCziwlH4m9BBOJYkldgs3
         udZVmfqo23fjFRA53lz9QrxavI+PW71KlZ46eUZE7yXQZ1pLGZCNBFOyo01OyGtm1bv0
         NviQ==
X-Forwarded-Encrypted: i=1; AL+hErFkEUsGfjIaocHvv81VeklALu2UTvtA3nAxxN/qS7BexKo4mFgzMtPPmjwKw9ExcXxsjSpBNflmGYjb@vger.kernel.org
X-Gm-Message-State: APuU4Z+t6KaNpwvGjK8WxC9i/k/0iKeEkcdBs43WNG6e1IA8YcDJkHTZ
	4alwJgZYEb2je0gNh0T95GsEP/CONYOIa+67NZfRMYcMJILtr6iiKSQxCGu967ObT/mkm6DgFDU
	VFYXju/XPxsJt0nOhvfpsDP8qBfQOXpDRNKEBBdSUY6Kwlt2eSMwsR2JG3n1ZBY6p
X-Gm-Gg: AZFdTZcl69ZLPLZHmDzGsSUQQkRlkIi2RKw3YbPukGFjZrWY1ZD+EFBv/PcwPLB7vvb
	CyJ7oBy7D3pxjDJ86fQJVmbtcaruA2nD4x3wneOEVsWLGgr8Z3RLJQ3/40+Hb6p1p+3P4br3Phg
	FwZKKegOpn6qYriES6UPE6+KIa6ArBcOf95Jool9ifZBFfrwNOECbe2aNw9a4p0XeMOLHD9LV4f
	fyV70uh3pkJ0io91yVy7z9ccCeKMnVX9ctvzoUHTioC14SsrIjSs/7PoRFz13uBXdOZWy+Ifyrc
	4QabHlMjQ0UCBpzQjx5HBa6bLGap/M9WEB2Assy5v1hfzKKmeEIDY+on2omjAZZk4eqF3YqWFT5
	NAm4ptirs/nLCW4XO3MUrtOXSKFH8yZ2o/dDBt3EQjVM7i1fGSNLJ0Ret1qG6wWJJpros5G1OmN
	1eAXaFYqtdl8xlcUfPAvUGNDa+TxeewVLxp36oEaFpeRBj8Q==
X-Received: by 2002:a17:90a:d445:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3b3d0686792mr1597896a91.6.1794985234459;
        Tue, 17 Nov 2026 23:00:34 -0800 (PST)
X-Received: by 2002:a17:90a:d445:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3b3d0686792mr1597843a91.6.1794985233657;
        Tue, 17 Nov 2026 23:00:33 -0800 (PST)
Received: from cse-cd04-lnx.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acd118sm2743262a91.12.2026.11.17.23.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:00:32 -0800 (PST)
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Subject: [PATCH 0/2] Enable ICE for UFS on Qualcomm Glymur
Date: Wed, 18 Nov 2026 15:00:05 +0800
Message-Id: <20261118-glymur_ufs_ice-v1-0-2ffe4bb931a6@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPZM/WoC/y3Py2rDMBCF4VcxWtegkUa3vEoJQZeZWFA7qWyXh
 pB3j5p0+S/Ox8xdrNQqreIw3EWjn7rWy9IDPgaRp7icaaylt1BSWQBw4/nrNu/ttPN6qplGRhu
 4cGbts+ijayOuvy/w89g7xZXG1OKSpz8mMieTODmvIdmgNGjJwJ4SZgOupKhsieD/qUbfez9pe
 3tvLF/muW6HwWGIWEg7iTKgxczeSKBskkIDhdFkj919UXHLU/+kr5JUJVjjdNRQVHDWFJYstXM
 cg8aYyAWSRhwfjyefc5s8HQEAAA==
X-Change-ID: 20261117-glymur_ufs_ice-f469fdfcf38c
To: Abel Vesa <abelvesa@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794985229; l=1690;
 i=wenjia.zhang@oss.qualcomm.com; s=20250717; h=from:subject:message-id;
 bh=JkrUQ7vs/+xT3FOApCQ0TNe2+J3ILw4dg4vIRYpSV3Y=;
 b=eFoVvKqUdP/Y4AZC0DhvXeRgJ+VNuik8ESqOgl99WBzdw6EkBOgHwcppGevFIqb0B7xN8oJaM
 IbNexbum2SgBvbWRAbPNtBGnphKnIdghrEQjnGhZ8hKPcPra49FVEEa
X-Developer-Key: i=wenjia.zhang@oss.qualcomm.com; a=ed25519;
 pk=Of53/+6KgVgPh1R/xUMTbXVCnBiHTmHby8ySh2ShLtw=
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd4d13 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=knTtAJwehH_nPzmuHUMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: YrYuD-3RSoqyEoxzgQ5FaNQgAxdOh_KU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfXzwBo1jMGfxXI
 LqhJoCzGiHxQCby0VERk0rxtPdkzgVTP4/FbWi2azd7Qg1A9+rWck8CaEVN2CNDK1xXh29lEy+T
 ryf+uzhgNxCkM5pvwsh8s9PKLga3siV4hXuotX19dqoJCe7Gfxs0ZH8USwe70Rn5lkcAc+c151z
 c1CGSyfGEmMMSPLU8PDAEBUVMKzf9DnBgKQfIdKjc1Dq6miB40TFCqWUbGJ83UeRX/XRwZmZT9u
 3KbHKiACy1cEAn3hRYo/Bp55j+tSVYXuaPCvRWfc1EtlPBXw6mhBtjuPB0SsZcPVH3oiGE3QZRL
 yfnLtnr6+UsLCHjD8IJZWdNIeJQ8I0g61MiukRAF9fcr+JaKpDhAmodaFwzPVXzHHnQEOEn7OVk
 f3za0hNadORFCv3zrrLMfQM//Kzz0mbjiHwlItp3jvs2achUcV3vFYrgkHiDqwnyzZZrMpp3KWv
 4lzTTpsZ/wnItoipc4A==
X-Proofpoint-ORIG-GUID: YrYuD-3RSoqyEoxzgQ5FaNQgAxdOh_KU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX79APBCMp5WFR
 9goLPi45xLRAId04N9H8h5jvJpezKwsNUKMwICR+3551sxPYL0fqY3z7IWSTH64o2Xj8CfydPuT
 gmnb54ZVQkdd3P2kAbyb4+aN7mwB7XQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180027

This series enables the Inline Crypto Engine (ICE) for UFS storage
on the Qualcomm Glymur platform, including the Glymur QCB board.

The hardware reports ICE v4.0.3 with Hardware Key Manager (HWKM) v2.

Patch 1 documents the Glymur ICE compatible string. 
Patch 2 adds the ICE node with its registers, clocks and power domain,
and connects the UFS host controller to ICE through the qcom,ice phandle.

Dependencies:
Patch 2 requires the UFS nodes added by patch 1/3 ("arm64: dts: qcom: glymur: Add UFS nodes")
from the Glymur UFS support series [1]. Its patch ID is recorded as a prerequisite below.
Board-level UFS operation also requires the QCB enablement and PHY support from that series.

Validation:
- Observed ICE v4.0.3 and HWKM v2 during probe.
- Standard-key and wrapped-key tests passed
- checkpatch --strict --no-signoff: no errors, warnings or checks.
- Targeted ICE DT binding validation passed.
- Glymur QCB DTB compilation passed.

Prerequisite:
[1] https://lore.kernel.org/all/20261028-glymur_ufs_qcb_enablement-v5-0-09cda5e3bab3@oss.qualcomm.com/

---
Wenjia Zhang (2):
      dt-bindings: crypto: qcom,inline-crypto-engine: Add Glymur support
      arm64: dts: qcom: glymur: Add ICE node for UFS inline encryption

 .../bindings/crypto/qcom,inline-crypto-engine.yaml          |  1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi                        | 13 +++++++++++++
 2 files changed, 14 insertions(+)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261117-glymur_ufs_ice-f469fdfcf38c
prerequisite-patch-id: 7b02d96573a31d29765df0f0377fa934abe79e05

Best regards,
-- 
Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>

