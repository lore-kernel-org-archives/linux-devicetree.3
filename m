Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D443E49ED
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223572; cv=none; b=gajxilHex3HAtrqz2UlXvGpnIlCvlhkRSoliIQ8PByPvjPHdsuPtJi0+vZTqOOie5WORDL78KTbFw+c+5DMCkptCaJae6x0XN/iTHM+N3Uhbt27c9Z1UVqgtENzy8SbbmuKsUhST0+gireyUnfw7L6ayTU6qXcwG/m0wVtq/DSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223572; c=relaxed/simple;
	bh=jI+pMVo6vwrYZtjOru0QK/xwdYDWa9bJ5ruLtvL2BeM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Yj54aiz10Knd8pLIBCLdXVDJI8NUOZP30uCv0e7Ga0I/Ka1DI/7rJJM42e9T0TNx91skNFXEZM8CThtfBOljaQksC4w8x6PNOuVzBPraXGxRddTUG//UXakF1gmfGBQlCpx5tyVzo4UmuAPdAE7iQN3Z/oZisj3ijbQV6Z1aBzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nzMcFnoE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HsZcnWrP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nzMcFnoE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HsZcnWrP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S63WU61387880
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=seiQ//jlDcszo/iyrwaAap
	wYX/N92VueFjzN9Crnozw=; b=nzMcFnoE6ZPdjXOFbHkAWNmnYPPEcVQT1aBFvZ
	VYqszy58ztDHRRMhOL+YT03nSBkBdCSvlHdHXIoWqEqhS7/NGkstKIhSrb3JK7El
	NWBQVL7GwaByrqY+wjh0nwjSzE1h8BCEuOg3ZIl084tUL4Y3fOL9AVioONiT15gg
	KNGvmHhy1KNpqnqmhgfmc6Vhom2eEiZAbvhw5/otS6IV+dulgMNGiiyvxLh8Hy4q
	YEkbZ5L9IFaNe5lZYCvg38Yf+RExXbJvgDuK4B5wPxPXzr3DgDsfBoQV8DQPJvKg
	P3/wNDZE/T9LD6NZVQm4HBar0MAFC2N10yn7uz1HEQwece7g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fppttrb1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:26:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-529ae8e96e8so27220171cf.3
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 00:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785223569; x=1785828369; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=seiQ//jlDcszo/iyrwaAapwYX/N92VueFjzN9Crnozw=;
        b=HsZcnWrPRch+OJ36tDt685OsAdgkUw9Clj2Oc0mNpO5bRLqYlEfnTgP890ohZIaR6v
         VuugP1Q/4Drd/0JWe4GqOYgIc0TN+eHE3xy6jlRBvUqaN5+4UQWa4g+1MJuWatFIOD3f
         c6LTkcXmR3oCjfW8BqhWUXYzrOWWwjVhf9MdWpTa8wD9PD3Ak2TROkNOHzs78tWJxneO
         /q/IaDAUOub/yhku4MSwwcZheZwF8zqdu1Knf3xCoRRCYizGVXBkrd/+95hd4D/8aujA
         razVpbSgC713rbjECTU9HYRF8PZDyITvJSly5uKYBLR+U0BhfcbNOkdEfSBzlrc8Zahf
         QojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785223569; x=1785828369;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=seiQ//jlDcszo/iyrwaAapwYX/N92VueFjzN9Crnozw=;
        b=PW+laG4Ndl0ttBkHECXlz7XcEZJGMsmEOlNjUDb0pmjSrNSVc46lJ+mFKIB9ikNEg9
         yz7Zi7iww3bZtfXZ8eHUoTUDLqCbvz8i6if4+Fosxt3DcWoUTfmWdmoy2S69oOfCTOTf
         DYonmZsRbpD6a0c9UlkYAq4c0lXa+lhB2jwJCMqjUimqrfgaoQY8lKPBmGEOgVe/l5Hv
         XVDElctVBYf74cUh/i0j0wdf3hXfYtCYxJKD++vK4AgvSHSQpfreSx0amPU/ND2n/0VH
         OGgC7SDl7sCk3Vteekp7ljYMWeAIyKz6edmICuyrn5NWlL4BloDWEOL3fqUTBHeKqKCo
         b+Kw==
X-Forwarded-Encrypted: i=1; AHgh+RpJeHSnTRb2sxc/uj9FZ6QSoweKyNrPkBlooc1ii34MFsIzZ6DH3LXlZEeZyoq5nl8hFgutVFDL6gXF@vger.kernel.org
X-Gm-Message-State: AOJu0YwOIbCN2sj4ul6+hcIW9e5UjRPItfK683Ixuu4hisNermW3/Std
	CGtjP81s1c1C1VPWQTb2frC4/QFQc1HXxAz5z9sQjHbPXK6nvwm6VANd+fSDXmdQO/Y13vWiNqG
	Wz6Ul5AfWmLmb8cvrqAm8Ch8x/5a5wKTay7cnYTGx4JZUofw7iUHsG1EGPXDPHIv+
X-Gm-Gg: AR+sD13OE45/HHztzzMcH50AevZJD1M+0/ueNdL5lhk8KOCbgR1Q2c7z2GVFqMOlPFs
	Kqb3+kBwD5N55281fYQZT36A7R7hLM8COQwVA8kPYCFdgciSvW8JWs4QqSrvlqB0mb1rBRXVouf
	M3BoUovfHmEpTHARW5QedqrD0tvtaA74YYRq43KsMuOxeIxuCgUnrXfmFomrqx7wP/0Qik2a32F
	yNjJLWNTRtOS4NRu8RZEZgyvlEuEvJrFLVjVDj03wsfVX8fYj8HNPjLqMoFBGYD4wFgLzHJCF1P
	rFx1v6AM5rL3z2/GWL2qf0WrLBavEb+ZL2pY+GFRRWVxJcFztj6G+mYmv5Id24v4y6xGPyzxQo6
	wt233u6LOPl+DZG5x11rrig70
X-Received: by 2002:ac8:7f51:0:b0:51c:7b11:41b0 with SMTP id d75a77b69052e-529d716e501mr9192211cf.76.1785223564729;
        Tue, 28 Jul 2026 00:26:04 -0700 (PDT)
X-Received: by 2002:ac8:7f51:0:b0:51c:7b11:41b0 with SMTP id d75a77b69052e-529d716e501mr9192011cf.76.1785223564234;
        Tue, 28 Jul 2026 00:26:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4443396sm61340805e9.0.2026.07.28.00.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 00:26:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 0/4] dt-bindings: arm: qcom-soc: Improve validation of
 expected SoC naming
Date: Tue, 28 Jul 2026 09:25:52 +0200
Message-Id: <20260728-dt-bindings-qcom-soc-naming-v4-0-39ff32071641@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NQU7DMBAF0KtUXjOVZxLHmBX3QCwSe9IaEZtm0
 ghU5e447aJdlIrNSH/09f5JCY+RRb1sTmrkOUrMqYT6aaP8vk07hhhKVqSp0QYdhAm6mEJMO4G
 DzwNI9pDaoTyg7p0N7E2NlVNF+Bq5j99n/e39kuXYfbCfVnJt7KNMefw5z8+49v63NCNo0NoEc
 oEabPk1i2wPx/azFIdtOWodnOlKWm0fk1RI7GxonOmYGP8gqxuS8DFZFfK5J2u8C1WNdIdcluU
 XloZq9IUBAAA=
X-Change-ID: 20260519-dt-bindings-qcom-soc-naming-4f97dec54139
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2327;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jI+pMVo6vwrYZtjOru0QK/xwdYDWa9bJ5ruLtvL2BeM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqaFmDJDQb2GVyeoSSSO/sF9nQtaP5ZT6pBI/IW
 /5w/ubDlOCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamhZgwAKCRDBN2bmhouD
 1w7ZD/9bm9Ungs48Hg9LN8ZMtsGqFNmvWZLM1OSKFejgowIqRsbYjR0IH9fsPheOr8UGXv1v10P
 dAIUqLF4fN939QwHFcN0wARyr7JB7DD7LRbanxp5LYfIJ/7sZmNSFb5duDIdcUge2s8nmwhX9X4
 LWfTFBQSpR6Is1O8Y5/Y+Pee/wRIIovHpCszFvgjbklBXCCiJBK9Yvye6ij1W0D8fkTyzhjNXM9
 0i7hmFbu8VdwaW/ZfbWKaAO2Xj5JGx0T/mzjMZh77PgMVpBNJW0CTcWZXUFLZ10BVI+P96MFyvZ
 N8tBY6UTDl9Ks4SmQmZWhsfYQTP+GjpfKNh/fObi+35f3XZ1jXztYneqOdr+Wp0TF+99k3r0R8y
 +T6U/OimngT7SWPIpopZd2IjvcTRHUV36ctBc5hdsjCDKJiie3WwMvXJzWNd9AhKmIU69TF/cJb
 CJ2g75Gt6V4o4fYPyADZQTcj8yl8scYYi6nEsYhuj+Fuh6dALU2q2SOo22dKI7iTZzItnimeUrY
 E2EEfRQtxdeqMkZCjHV7tgXZe4yimtSbfvGW8CeVi/LBqb/j+byZvKaMDpSqBNpNlxQyprh6uWB
 BFe209Xl1uWKvO3Y6LUCWyLa8kCpyfSsdSOtp8b60nDigv/WWr/R1xdqbRPFU2i3FVoIvZNwR0G
 JHiyfMhwanYF0rg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MyBTYWx0ZWRfX1Nv8qhpYs9gb
 q6xuF8DI0X8UtEt53Vv4r+5L+IK2Buq4gd1/1YkVbO4zAWmt0NuoiUr8icLAWu+c6Dl9/ZyDtD2
 NV7TO6R+kBcc3YzK81uuJ3f1AHT9j1E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MyBTYWx0ZWRfX5OfTLvn2zb/6
 ZbdYn8d1BBu7G4D91VIMb2dVc2ETTBU6UbiHt/tn+UKePEevL/6b8B+p3PCg5rthDnBL/xHTQ7F
 HzYn4ZjO6SVhh5ZTklLSi1ta3gzF12R/geWCY8SKe66jPjOJrSNgcok5ICm6A7mVQo814YfQbS8
 CTMzEUi/QROtZi0bnATB/IKKA77wscIOlKmrGYxYWsUkEy6RN7gqNDWOAiPMvYh3BOkYJH9rMUE
 9V5uwRnAp9J/nduTdgQmh84kNjWshfGrzTzBZl3HZud9GfZtfSkJwXl7TQn0rY5OzCPxpgs+1+0
 TflKGOk8Yqa4+2qK2VcJB5LH1rQCHPFVVZq8R8KHVrGcUgRxvnfdHo5ngJ8lRjwG0uWnAO52rrj
 /mE2vQ5iWYq4zOvL+OIgNB3s7dqKerqLHQpuATt+QkiTcRF2xyelWm5oWBddo2os6vTUeNaT32V
 U1QfT85KMKXfsf4m4og==
X-Authority-Analysis: v=2.4 cv=aa1RWxot c=1 sm=1 tr=0 ts=6a685992 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=LvKCfHGxsC2wBnq9YmcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: EXPcXcTCiXGEE2XTFtAAalVADUdm5zWS
X-Proofpoint-ORIG-GUID: EXPcXcTCiXGEE2XTFtAAalVADUdm5zWS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280063

Changes in v4:
- Do not change .* -> .+ in codename compatible pattern by mistake
- Link to v3: https://patch.msgid.link/20260721-dt-bindings-qcom-soc-naming-v3-0-8f275c9d3412@oss.qualcomm.com

Changes in v3:
- Extend qcom,[ak]pss-wdt-xxx pattern to cover also qcom,apss-wdt-x1e80100
- Extend qcom,scm-xxx pattern to cover also qcom,scm-x1e80100
- Add patterns for qcom,rpm-codename, qcom,rpmcc-codename and
  qcom,scm-codename (all used with Shikra)
- Rework patch #3 incorporating Rob's suggestions, but not dropping
  legacy-model-name compatible checks. Now use "contains" in compatible
  property schema and drop all fallbacks from previous approach.
- Tags.
- Link to v2: https://patch.msgid.link/20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com

Changes in v2:
- New patch #4 for WSA speakers
- Add qcom,usb-hsic-phy-mdm9615, qcom,usb-hsic-phy-msm8974, qcom,hamoa-crd-ec
- Add SoC codenames used: maili and nord
- Link to v1: https://patch.msgid.link/20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com

The schema checking for expected naming patterns for SoC IP block nodes
was really incomplete and was checking only nodes with single
compatible.  Improve that because questions about expected compatibles
still appear, e.g. we have
Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml with:

- qcom,pcie-x1e80100 (expected old legacy style)
- qcom,glymur-pcie (change to new style, ok fine, let's switch to new
  style... but...)

I am afraid that a new SoC will revert that back to old style, e.g.:
qcom,pcie-whatever-new-soc

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      dt-bindings: arm: qcom-soc: Include Eliza, Kaanapali and others in SoC names
      dt-bindings: arm: qcom-soc: Document more of existing legacy style compatibles
      dt-bindings: arm: qcom-soc: Validate nodes with fallbacks
      dt-bindings: arm: qcom-soc: Allow WSA88xx speaker compatible

 .../devicetree/bindings/arm/qcom-soc.yaml          | 92 +++++++++++++---------
 1 file changed, 56 insertions(+), 36 deletions(-)
---
base-commit: a2b553a6242618367923d3be0b06c311bcad2e45
change-id: 20260519-dt-bindings-qcom-soc-naming-4f97dec54139

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

