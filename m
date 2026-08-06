Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A322B3DD503
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 08:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786006604; cv=none; b=AQOMudPueBz5LVbEnx41b/oylxJbskOL2CHDI0TqsikFFMgsFz6bMrMojbFeJ9zivf9J1a/XbTVAjyl0lw+PtJjpG6DIC5hAc8XmQP/JFizrLLpiWq7+oCN+ngPooNPzj5FIvbk9wJ1MmDI2PXscrSGZKLaSV8KgzbE2JwaNfUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786006604; c=relaxed/simple;
	bh=6S8jS+H4WdeEikp6ah8BZMwIpnA3B3JaOF7LsFLYizk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=denw91bkWOejJ37n71rsMoOBh0CN5yzIjaPuS3lFTmnPTlW5cZkZkkUUBYcz3B+G/ldowkR3d3ShNyO9CpLVFeKXqW+CD+x65/LmJ7w5kQR0zjAyfUs1dAGFlg5JvlO8tb/LI9439eeCmpcekIM0UzavH40WiX16OPoewDHYTjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qh1zXfP3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TdyXL0OR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qh1zXfP3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TdyXL0OR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6767mdJh1024913
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 08:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a9Ufic/MO+ho8EDroMsBRM
	A3eGEwsnBaxF35phytNUM=; b=Qh1zXfP3oVp1JE1pNme7xgBiNUHQRJZ7Jk3ILE
	tBUnsmUpjLX7shAYnPAPtopupDZeoQ+Z3G8nn+CREm7vRR2npfssLSWZXPIksuyf
	aIEQqlX9dCY/aXLitUOf1YkdM3qRxIMXeiNgvlUruNbYS8RiOv3xkx9FXFWSfejT
	S25apRWm9jjChMJsJ0j0vFgtTmjjE3rBju043QXIruNZZQZlpbIk3yqIgwiPQ74v
	6Kv8sgpsteFuH/QjfUApdC4CH6pVdRwjfciQqJz7hqCUy8Rdit9OCNnI3Q6MIEzy
	Y48DVPRQjggP4E0uJNUB3Adqrz3pyBiYaeVlTWTvhxe3P4iA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvp7288qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 08:56:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84eee2147ffso2577591b3a.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 01:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786006600; x=1786611400; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a9Ufic/MO+ho8EDroMsBRMA3eGEwsnBaxF35phytNUM=;
        b=TdyXL0ORwYrSMKyt2983ZZSNu8bfmREv3hCRkiKnqCJOPGbkMuNN4Xl2Sr0D0GA5Sw
         t3jY31Ulhoo4mGZG1u3huHlLMAFqNNI/Zzgqb78EBQwLC3Wd0q5SXRMt5i978wc+6U45
         a49ctayjsr75AAxl2087HcEpZOpWfGr3/FqAPCwpCQIufw13bHs904GslI22bGbY8DVo
         NgD4pIrDRkpK93D3q4s0UhBKdx3NN/ed1i9Os5tGR8qk4/Yz2HxULi1+OseB2tP1wicE
         FtZCXzxcUPA2oRZNf5uiuN2fl1UlalUdta13VJASf1YSh/6TtN0ceiAwtDyR0OSUZ2qN
         zPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786006600; x=1786611400;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a9Ufic/MO+ho8EDroMsBRMA3eGEwsnBaxF35phytNUM=;
        b=B9MPXAjmoI7UXpXO1GpabTRNW4TL8ekWEWMBWI8+zuOQF8VTK7vmexOziucA+oB6OK
         7mvyf7dN+HzYMQXGP4cRqHHhRrScbzoz9u3MoP+lg1i+NWNjRqlDmzb107ccuCXf64yK
         odVILNXYufkcYeDjJeHvaQxXVDNfVs0+nOh34D2oAYZwbQh9GnQkK6kn23pkD60/e4tK
         8IShcuzN6LnonooHNAmtpIpqkhYZmiqJlY0QsZ9AH2gS17Bz5dqRVrxX2lRJ+kX+gUZQ
         H+KKiAsj3vyb4dQnfQdDMt+/wMPK8iFMrA6MWDETlr/AsASf4CRKKNH6aUd14pVZZlMj
         sm7A==
X-Forwarded-Encrypted: i=1; AHgh+Ro4+/Bmo9LgZFDJc0gXc0J/M5yF7HvSz7+geKuO98gCVVMezB0ynWTWiafHfapKAS+nsdJEWGV2If1I@vger.kernel.org
X-Gm-Message-State: AOJu0YyfYJrGjDN+Se9oAKK8gLsA3UsMcOul+0uXcxlCg//s3caVcFjh
	cjNEyIW/nMrnaBWqpmK7q/5FrAl+zCD/6W23Qbk0xk2G15LSNfuxqt5X20+ZjrejbxlrmBsoKL2
	K0O8hx8IofQjy+dKNRPC88ufvGuf+STiVk2uf7+QbFujT8Ugpgb/P8i9iT8wi8jVt
X-Gm-Gg: AR+sD13dL7/xKYgQHgpUciVhafoR6PtBH+b8VtWzWsJbYutganDzvqCWBjgmilnWyr+
	cM1XItfGe97CcaYzwXqpXcDprJLwuaWDefMSGKEKCig4nSVC3Vq5U2o1f1h+h+fwewRmpQapsPg
	sbAGh9Cb14Hl7HQy/AKuNqbm0X6sae9IC/0CH5VSd08TIICeltm+pNHSTfz/Lg6f+JzMUaZXZ/I
	jb982nzLL/smzXN0bYx7Dyjfi5iDOYLATX/emNd0iLL+7lyKx9thrvu+CCr7GDtK8f093tgeckQ
	Vdg3d+zvf6RhXkCRqUWtfEfrrclq6rczLKEYYh3jroBnm2OEOVZiLGCpUdxrJ0vUR64imd7iE9c
	WuY6NvM2QJ1m/qrHB+DZVQL/r4j1E
X-Received: by 2002:a05:6a00:4143:b0:848:6720:6fec with SMTP id d2e1a72fcca58-84f2e05e73emr15077069b3a.28.1786006600404;
        Thu, 06 Aug 2026 01:56:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:4143:b0:848:6720:6fec with SMTP id d2e1a72fcca58-84f2e05e73emr15077036b3a.28.1786006600006;
        Thu, 06 Aug 2026 01:56:40 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b7368sm953876b3a.37.2026.08.06.01.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:56:39 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH v4 0/3] purwa: Drop the Hamoa PDC workaround from purwa
Date: Thu, 06 Aug 2026 14:26:26 +0530
Message-Id: <20260806-purwa-pdc-v4-0-62467f4b4ddc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADpMdGoC/23OTQ6CMBAF4KuQri3pDxTqynsYF9AOUiMUWkAN4
 e4WNMGFm0ne5OWbmZEHZ8CjYzQjB5PxxrYhJIcIqbpor4CNDhkxwgQRVOBudI8Cd1phKnMieJn
 krJQo9DsHlXlu1vnyyX4sb6CGFfg2HPRjODLstdr4wbrX9sHE1u2/YxPDBOdaFxlULFWQnqz3c
 T8Wd2WbJg4DrdjEdyCj6S/AA1ACySVPtJJU/AGWZXkDnOhofhEBAAA=
X-Change-ID: 20260616-purwa-pdc-198063b482b9
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786006595; l=3145;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=6S8jS+H4WdeEikp6ah8BZMwIpnA3B3JaOF7LsFLYizk=;
 b=6qt3WlO68yCjUrab96auKW/Hrlz0BW4UDocPWJnqHYAfj5wrP7V5gdTnjDTrSbYjOqtvJ+K0b
 tEOfUkYbbUUALbq/a/UTmagw0jccqhMLkaj9QQeCRUyb/P6zbfsbtFP
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: ls0850BxOucdSgl0ggv0acZ5AMLJPahQ
X-Authority-Analysis: v=2.4 cv=JYCMa0KV c=1 sm=1 tr=0 ts=6a744c49 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=coPjFYPWAAAA:8 a=_lUSTMJetK3BuQb9nwAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=PHqHxvoSLtS9In37M5wo:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2OSBTYWx0ZWRfX53Q/4TJK/NEO
 0bq4fhFl/L9ulrPC+lTKuf2IBCO/m5F+eK6Y+w6kzcSb401oEao0gxBspPD3gGS9hgOGax1Jks7
 gVKz7TxeepjpQESYYjAAErWGtakxlcBcPnethqvGO2hCOVfsXKiMoOcMs0SB/LWLu+Bm8rbrVSs
 K044DonpzKzsz26VO6GlUxlrG8W3RTDk/ynJFEqHPW1+04Rl41zFlOB0FsG310zBXLmJCUWTNFa
 aUdsF5kcqFUCCsf+8QQ82+T0+g9Wgh703EJoIW2irzYSIegmQG/UW1DTCQos45e3MBJ5xXykr40
 0B/tcxnkZ3vbZg6kra82ST/t3crI53vlXvzHLMOJ/9a+z63CV0k9Fpq+7DzqwKlPyyO6jgLqrmP
 QkLpfsfjAiKPFW9CgWryTzFqhNkDrSDyz4AAAM4DmK9ISlR5ZVj/GMLcVksQrQ97o0/IZvXKRzs
 A8Plxr/R9+hjfO3Znyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2OSBTYWx0ZWRfXxT7aHZ2JKafB
 6AP7oMxFcwlGGDqEiFNM5l3wlv/i1RsVQHuHj36/S72i0Y0n55bpJml/YJHhYVQRL/P6BEQH0so
 IhO4lsyuT7nnK/gG+b4HqUEBQCFc+tU=
X-Proofpoint-GUID: ls0850BxOucdSgl0ggv0acZ5AMLJPahQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060069

Purwa shares the Hamoa PDC compatible. Hamoa had the software workaround
added due to hardware register bug mentioned in commit [1] which used
Hamoa/X1E80100 compatible to apply the workaround.

As the hardware bug mentioned in [1] is fixed on purwa silicon add purwa
compatible to avoid applying workaround meant for hamoa.

Patch 1 (dt-bindings) is independent and can be merged.
Patch 2 (irqchip driver) depends on patch 1.
Patch 3 (DTS) depends on patches 1 and 2 landing in mainline first, as
Purwa CRD boards wired up GPIO wakeup support enabled by series [2].

For stable backporting, only patch 3 is needed: since series [2] is not
backported to stable kernels, there is no GPIO wired up for wakeup and
patch 3 alone is sufficient to stop the Hamoa hardware workaround from
being applied on Purwa.

[1] https://lore.kernel.org/all/20250218-x1e80100-pdc-hw-wa-v2-1-29be4c98e355@linaro.org/
[2] https://lore.kernel.org/linux-arm-msm/CAMRc=MeU0QuRozMscv02M59+a66S05Jm18CyvNE-qSYrY=S7hQ@mail.gmail.com/

---
Changes in v4:
- Reorder: move irqchip driver patch before DTS patch
- Clarify dependency on mainline in cover letter
- Clarify backporting to stable kernel in cover letter
- Fix typo: "puwra" -> "purwa" and "sillicon" -> "silicon" in irqchip patch
- Link to v3: https://patch.msgid.link/20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com

Changes in v3:
- Remove the dependency (b4 prerequisite-patch-id) as dependency is merged
- Rebase, Add reviewed-by, acked-by tags for first two changes
- Link to v2: https://patch.msgid.link/20260616-purwa-pdc-v2-0-8dda7ef25ce5@oss.qualcomm.com

Changes in v2:
- Remove Fixes tag from bindings
- Rename $subject to use hamoa and purwa name
- Add comment above compatible in devicetree
- Rebase and mark dependency
- Add new change to invoke SMC call for purwa PDC mode setting
- Link to v1: https://lore.kernel.org/r/20251231-purwa_pdc-v1-0-2b4979dd88ad@oss.qualcomm.com
---

To: Thomas Gleixner <tglx@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

---
Maulik Shah (3):
      dt-bindings: interrupt-controller: qcom,pdc: Document Purwa PDC
      irqchip/qcom-pdc: Add purwa compatible for PDC secondary mode
      arm64: dts: qcom: purwa: Drop the Hamoa workaround for PDC

 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 arch/arm64/boot/dts/qcom/purwa.dtsi                                  | 5 +++++
 drivers/irqchip/qcom-pdc.c                                           | 3 +++
 3 files changed, 9 insertions(+)
---
base-commit: 0f6da28aab51b16762ed82e8fdeaa5042da45b08
change-id: 20260616-purwa-pdc-198063b482b9

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

