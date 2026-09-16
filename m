Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023F94DE711
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 20:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789591622; cv=none; b=X7zkUK4TrrjB/VuJ/1m+giPOv3CsVhNING9ryPvtkR+dcKSZMAkL3JpotGyw9Gnrmtr4wbvOiq5J/6Q4mvt/BFhCAoU2+EJOvSTB2H64w7KQpkKaGuSYmDl8zlg/HJ/T3JMvBGreUtx4spCkwxaKo+2xaPSjDp4O1vuqbhTfWD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789591622; c=relaxed/simple;
	bh=boA/geLpFUCqZyUNKsjxk/G3/OJ1tuk4ldtRMf08Nio=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ayq/Io9FaHKGaRu8u/75RwJJfOs8rkVNDsJtThvEEMPKtv1pTE1DF1yzwqIc4edCxzqMdaJay/s3eeHmx2Yvbr81UmekI1el7HW2KbFlV5/MPKj4tQw7kFtZ/yoWUa++8ePi6yQ+WcA73aNmwYIJbQ7H/zL68KgOXvMEsTgbQOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eK39a+Jc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H8Mni3BV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eK39a+Jc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H8Mni3BV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GGtKd43402924
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 20:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mIlriSmV1DgQbexuTZLBld
	yxC5XIABKWFBIiL6gMsIQ=; b=eK39a+JcprCVu6UAbvjtPROoHsVl5M1VX5sSys
	LIjedqcObH2bqvvKEhUk5I0s860GLy17kpQyCtXxXeUZxcYxeGYlU0qNUEA0FWNa
	e2E8iMFjoWKOEf6zk5CvPEi41HWHuaCh+coFHIaJm5qcTuIXjYC+gIIsFp7Ua9Y7
	hoVKEGzmSKg+oC826bGGmCqzkamgF6/pYLfHBl2Ox/6JI7u25Z+NJe4npSvxiCCa
	5lmFKhoGc5sxmxhu0KSVwAFIT97TAu1bSoP4Ds2VoddGMoQ5W6cz0A+rDrHYNhib
	R0f0fqa6rnw6J/Vnu4maQr3QBEdocA7bx0c1uQzXYsa/3RTA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d11vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 20:46:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso20727485a.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789591601; x=1790196401; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mIlriSmV1DgQbexuTZLBldyxC5XIABKWFBIiL6gMsIQ=;
        b=H8Mni3BV1YQimCTCgp/IX6iGmhyhPJShY6qZf3nyGNe04N9KQBKqs5K3wS8JukIJia
         XmRcRL41htxQrG6Ojj3MtlE29SjFxvyVofopxXvIHxm+q6vQHea00QQTRxK9j0/rnofB
         2lf12z/OFZb5148NQIxpiJye7XOnrOIPiJgIXqYmXHuXwyfmLI0yAkJyvgfbHakSHzR6
         kdbg8a8x7HLBgcKa9Rq0rJSLl63X8Hl36tatE1uVOY/uHzpRzp0SRa8Ns+La8xkbOmUw
         v3FpHwZYqdNQu/QxQfiC8NdcHZ2tauPRxDHD3MO+VRpNgDlEUR0y+j0vfbE2vvm3xTTE
         r2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789591601; x=1790196401;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mIlriSmV1DgQbexuTZLBldyxC5XIABKWFBIiL6gMsIQ=;
        b=fGaa1qO3gQ9Kp0FczLd1/trm21RYjzsp6No9WHbbKWC8d/my61HdmQQa+GSuiy3eCB
         s3Pl4zqtalwLRRFko81VJQJgJ8fffcfu83g4dfJNAhdYnog9Jh+dnKHWNFxehc6bBN/i
         CDNGWuM13WbJccafIGAB1nDTvOhhcsU6WoQ+nm5CT3sLS1V6HZld/0cWL6HBhuNG8Pmi
         Hu6SuhVtYG+hBfvwrzrZJnLLPfZQf0Ch/3jOHZ3RsPRpsQcYaLzpxj4rxLGc4RhZld2H
         XC3US3Tzd8lZSB7cfRVb3Hq5uFuNkm2+JL9HxdjsdNb9n0B0ivel2RU2UUQoPlzUQG7i
         pBow==
X-Forwarded-Encrypted: i=1; AKwUvBxcmvtub41B79rWMhqqAOUVeWDBDALvHy3AQnFMFNupJuyVJTSBuQiwhGvwfSQ33KsjwMiqHWlQQdV6@vger.kernel.org
X-Gm-Message-State: AFuF++mRZjjz+1NAQ4+zInoy25NC45pMQEzsoRcegCC7pAVC6I+wk5Vu
	E+AC1bsXbDFw76ciseeeK3xV8/Rcs4kKhAK38TktsyRadEq07+zOEm+BeVzp6VR0AHEpMzixOj9
	1jcK1yQCVPHQIHaQNw/RJEUJWuaoFcmuoIq1iyn4taOPH7Dd8bbx/pUrPIWrXWdm3wbykQcVB
X-Gm-Gg: AYBFou2MUpN9vj9WqXYbTU30/IUK4EX6bZP9PrlXggcbSEGkqRS3PJY5UWbd+ow97jS
	k8x1W5zTAf/bco41wcki7ctUvSraNkYXXRFKrD7sH/PQR11aOHQnWWLTA2+ndePPgDJr0+Qa+wz
	3OxuVBB0blrmfnVhhcSPLuLREExB+uaDfgXtISlw7SBGHgBE9Xe8WsRrzhv1FdmUmW/FCNkW4O6
	YNoOtviqO02ZpcqK6Bu66DtpXocVTzS05uSS0u00Tru9htTPLU22xjouEspNINS9n33JKxVrJWy
	HWcbzTBsmxOAZ+VNYLQ2pVDzqtEnxE5fho5qjCL9AwEsAS8ToMj0K46n/SJxracwqgpOqQyObbm
	wRGgRZSOam1ICluAfbUnNz2w=
X-Received: by 2002:a05:620a:4512:b0:939:13a7:70f0 with SMTP id af79cd13be357-93bb770c2a0mr672320985a.5.1789591600736;
        Wed, 16 Sep 2026 13:46:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4512:b0:939:13a7:70f0 with SMTP id af79cd13be357-93bb770c2a0mr672316185a.5.1789591600265;
        Wed, 16 Sep 2026 13:46:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fa7dsm9857077f8f.8.2026.09.16.13.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:46:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/3] dtc: dt-check-style: Introduce way to disable checks
Date: Wed, 16 Sep 2026 22:46:31 +0200
Message-Id: <20260916-b4-dts-style-checker-suppress-v1-0-81b86685d068@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0K6dhIwtQJXMSzoMEgVCnYKwRDub
 hESNy7fz897i2Byhljk0SIcTYZNbwMkp0hgU9o7gakCi3N8VnGWKNASKs/A/t0SYEP4JAc8DoM
 jZqiR0jq5YqakEsER1trMX/+t2JlH/SD0m/R4OHqNIez326+bR3s1zv5Xsbfe2JEqaI0lBlRpd
 tEl6lTF+SQ3uy45/PuuMz6PLM0eDqUUxbp+AMLP20f+AAAA
X-Change-ID: 20260916-b4-dts-style-checker-suppress-fce8f17c9646
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3538;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=boA/geLpFUCqZyUNKsjxk/G3/OJ1tuk4ldtRMf08Nio=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqwAqiOLoAQ4VKosBMUlrkktYK2o90/FbCSWkK
 A/Tcwe5c8KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqsAKgAKCRDBN2bmhouD
 1zzSD/9/DhsLnHDk2W22J6HrGdMSypIsRat+8WK/qTFbWJCUIxWuxanIeJuUa0HVREjBB+jBqYt
 Tj/PuIe4lLsyQkfWDotzkALGv+Jfp+PUqlzZPnNXaz63SgdeO8pRrmhtjcjoXsh/gVMbaDRRRab
 gmKJS3NXhpOaFzZzXLxRwxJ6lEjO6b8ALaokJdE/0HFFgLwHCYkudJX0qfCOfB6ryx2gC11zI81
 +BGnwLrAqoiDTqh1O0zzSe3BwRm54QY3Sl0ayYeWuQYi/Hm+uoAzaTOcD7PGzXQ6PKEwGV3sfdp
 bEqEf3ZGr1kaSkghLxOMEQa8XFSjvGmzAZpWWLjPr9I9C08ClJmU+6Q2TLyV47cqxQAgXsdsQrw
 HNza7uHlZqRQssvkRtHdrAYlslb2dA63I0+ON3L+Gza0cQWO+n2Rlz2kzevVgLeF8QYjloOq229
 GKG/r93vI0wDinAtW49wMlBfAoBHm95OGVUmsPLk46vr5kuw0kWPOvXGRIMswvYVFgIhKsqRF4W
 RA+A+EDREryOGFMp4Nb4I5kIbCCEH2H4Jg6hSr0ENEI4xo6GI9z3Knd0c74CV7djF2suiDkce1y
 9nhH+eC701WagnmFTxpGxnA1ESYclsW3GI38iWejHKPU8fSxas93Ar66ztiVGzk2MUTrHRA8Txf
 Flt/6wqNmorz63g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: ZGUrE8xo3_JZe7OFDg5jh-Ta-awvmRxK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI4OCBTYWx0ZWRfX4oG/rXliWlYy
 JH+GQIivQappVwl5X+5PIz3Tbw2JTxVR5SrDgPV2PP0MKSd07VE0OllT/BYkifwa2GJBKhMTszS
 e8NwxoJdyaNh3l+M4c+qIAvG4XtGLyY=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aab0031 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=KBJGa0VgAPS7pA67L9gA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: ZGUrE8xo3_JZe7OFDg5jh-Ta-awvmRxK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI4OCBTYWx0ZWRfX9wqS7141CqhM
 hJK76gVn6xFu5TahYvjcn7e1hfaZYKb4wNDPaC1AijIYDcpZH4mhs5Ya86Fm2hO0u8U+slZtPic
 3w04kZxn/ezj3ejNJo8OhttIis9rF32NbYX17GtYfXafnuK9AebsytWy79AD6Tj7b9aW18wt0BH
 oaW2tOKyXvjTcpFZWRxUqNitv7m+xPC71IqV8LMgEaAy4n2H+n2q760fp6iC8mZTGp1B7LuGcJG
 dvUHtzWLFCvHcE1yhX3ShnYMAzowNA5ih7xE26lQu0HaUQ3QSqa6+PE40sv+mX5kal0shJgcEHL
 erMLBGm9GZrwVQ/6ODZK5qp2/sBxes8qkjbUDY62PjAenyJ51hY01Hd2mQ60CBhFuTR5yDfIuob
 H+LJ9Ms5ML/1MzxDw28l6hkgEUswcx+tGEgzYPYamq73sNMDihLJqKKPppElSgaDuRf1ZLbdrto
 arEC2w2JDFLumXswO2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160288

dt-style-check patch depends on (context/rebased):
https://patch.msgid.link/20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com

Some style violations are okay to have, because it allows to keep the
code still readable while reaching full dt-style-check compliance.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      dtc: dt-check-style: Introduce way to disable checks
      arm64: dts: qcom: Suppress a few intentional redundant whitespaces
      arm64: dts: exynos5433: Suppress a few intentional redundant whitespaces

 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |  4 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |  6 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  4 +
 scripts/dtc/dt-check-style                         | 97 +++++++++++++++++++++-
 scripts/dtc/dt-style-selftest/bad/dts-suppress.dts | 52 ++++++++++++
 .../expected/dts-suppress.dts.txt                  |  8 ++
 .../dt-style-selftest/good/dts-suppress-file.dts   | 51 ++++++++++++
 .../good/dts-suppress-nodes-properties.dts         | 49 +++++++++++
 8 files changed, 270 insertions(+), 1 deletion(-)
---
base-commit: 2b74cbd61ba866a42f7274bbaca27d59998bdd2b
change-id: 20260916-b4-dts-style-checker-suppress-fce8f17c9646
prerequisite-change-id: 20260909-b4-dts-style-checker-continued-lines-c6895bacb860:v4
prerequisite-patch-id: ac163f170b5b1cfd4170c8fd80b2500377ddb069
prerequisite-patch-id: f470296bdeae881ecc7308e31ea90da0a4b08c52
prerequisite-patch-id: b28b0bf1f1204f861d6e3449d847596c3aa5395f
prerequisite-patch-id: 11247384a57609f071969af426828de6a9b03b1a
prerequisite-patch-id: 95657765f7c99843225fb476b09e9975648a1eb0
prerequisite-patch-id: 8a18d3b03ee753933aef2cac631d3578c2985bd9
prerequisite-patch-id: ef954ae6784ad867e286a64285ed7cae0d62701c
prerequisite-patch-id: c1d5b94ec03e9790bdb245425cbb7144e25ed946
prerequisite-patch-id: 6a7e87d62a887d8bdfda00d379a45ae4c3a88f70
prerequisite-patch-id: 6ecfe2c2e6d3414852049bf184923eb52c8c094f
prerequisite-patch-id: 6fd9f568de9ae35050d90202f7c4ceba9a33f70f
prerequisite-patch-id: d62f7bde6bb1db9655a7969a3692ef098fb3970b
prerequisite-patch-id: 10cc4f931221e5c9c0d3810789b7c677d75417ea
prerequisite-patch-id: f1f6a75fd262291c2d1db0ae7040067c67e08957
prerequisite-patch-id: 613548bf804a4984b202ff69aef258ae327653af
prerequisite-patch-id: b016f9065366d98a39008b4dbfab9a7bcf421da2
prerequisite-patch-id: da84335c3cc8e3fa644ce97e6bcbcf2927e69489
prerequisite-patch-id: 2acaa10ee24a9217a6fa6756473cee3edb085e69
prerequisite-patch-id: d0f34708ce430403cc3403441fba1916edfcb6de
prerequisite-patch-id: 9c4f6161055f697ec1d633cc61e6748c070957bc
prerequisite-patch-id: 3536b2b9f72344868ddece77a48446af0164f53b
prerequisite-patch-id: aade8bf06cfca120500eac3447151ba0a0ffb192
prerequisite-patch-id: 0bb85efe9f0efd7a990cbc524d6360235bbe68a3
prerequisite-patch-id: 07a4da083ce7916285d80de33f989b499c78582c
prerequisite-patch-id: 46309bf89c926711a1f97ceea206e1b733e5e206
prerequisite-patch-id: 14fa558b453aaf560eb17d163500a433e38890bf
prerequisite-patch-id: f8ccd89f399b61ec1dc867ec7955a009c8c7b694
prerequisite-patch-id: 833114edb0c81877ed1182563426ba9695b81081
prerequisite-patch-id: 2ee62b9fd3ca36941fa9191b55136afb2bd699ed
prerequisite-patch-id: 464e2f568391edd2c3a39ea0d8920756a19e3159
prerequisite-patch-id: 0ddb7cb6bf6ba3503500ba8735ef77169a403edf
prerequisite-patch-id: e11ed37bd232ccae179a6ea75391f3dc52864ea4

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

