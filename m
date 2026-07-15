Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4878412BF7
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121730; cv=none; b=jt2taui5Zm+eRypIvrUZxijZD0nHKi2tgf7hzi07fpo45Fn6nUG1Jvryndlmx0t88PGWYithLoSnMdU/h5r5ZvJTcONqWSipcNv/o9YGzEyGke8sGZYUH4s5WdYuUwknjBahmcLXRSGUEbvpSZBNoHTGG5+dbZPIKHOBTBKEFqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121730; c=relaxed/simple;
	bh=ByDHC8dtY78xRmzHX2yJ5VDKFyYEdCxJnLZpQM0rE0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=M+8MWi9qUW+sV9IRo9yFFaCKi46u1lt3MRESl1BhBs7srmkT+nJU1rVVED7O3wsH1rkIt7GDyRK6STxLGqNd89mZ0YuSNmuIcBYt+u4fAt2h5G4eEI+9nul1ezsv2x29q9mFgQSfez33LZoAYR+9e2+SfGdCOWtAUd0in/M5h04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aA++a2B4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YGGhzHW3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aA++a2B4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YGGhzHW3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBccxm3479971
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7L1Ymikwka8l5y8KgVBcA2
	btGkMRADHGPxoYKWS5su0=; b=aA++a2B4oR+5TMhPJjKCbwiNzCvzKJdW+g3vOI
	VtlyBxkaL75fG6jr+yN2KPKKXuylyCyu6hcnAOvK8W46wpMjMXBbYhyS6l8oJOa6
	CRwatgb4FEey2WlZSYTchZoh2ywzuxnw1nhI28ApHqGw9IifbYez401+8/uWIUfi
	HUvSWb+8hC9iOQL5uUtR14iV5xDnf8uTlI6ZlDDBgI0aR1w7xD/a3uImA2AdXND7
	aZNfsXNDTLB8nMed5o8Hnkr/1vz57LLtEgts5VkAZdrCK7jJ2dZor3UM0udXfM4r
	F/jU5lR/UUF9O45Prfow3IAyvmPGNfr6JAElTFdScds2Om+g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe56h9gp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:22:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8efad04d884so41423016d6.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784121727; x=1784726527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7L1Ymikwka8l5y8KgVBcA2btGkMRADHGPxoYKWS5su0=;
        b=YGGhzHW3JbCBoNLQZOuXWWLSJKsKktBb/f1hZt4QCEPV1c5+xEqVHcGwWyax/Ewml+
         BUvBSARdtxzWOdy+E14V4OLfefwFcefoeS3ni84BZvWIbyjZY9pgjHFi8OtIz+VIWWqp
         fFReVZ0KeaopXJTXS197keZdo/weGOP/07HgUlUitwjocY0GPToimrER4v4NrGDm5yCp
         z1hcHcPopD2Hsss8R0BunUtK537G6wrZJOILqWevK63mrO9kaol5XXBrG2oLfn7G7mOq
         nbc7dSIoCh1ixKIsPCFFBm8gFP0JgBhwe5nmqKsuNc8OBOfnt72J49U1J1FPvi/LbcZz
         M4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121727; x=1784726527;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7L1Ymikwka8l5y8KgVBcA2btGkMRADHGPxoYKWS5su0=;
        b=B3vd5mz431lS+IKqPOCnuXnidHzsCmZfrcq9ZeMnXSZyqWsJaEju5F7xffettsVauD
         i813MhBUVkA+KIgsrRJlRe/ygBUZU+zyikt4hvrb706rAeon1C5MiV3dBqZQrxto6xXQ
         IZBPVD4XdM5m2sH3j/vymKMrkz7JL+LUj/5UG3/nPaVOi4DP5eTaHmLKSQBrUlfCIYUC
         EW0PpC+CUWVS36GnYxo57HD/r2ATYQj5JB34vlo1Ze2KDA0MiC2FJa5CHr5TZYJLdrBF
         imI6Vs1d0TzUY5ARUjLAbVZMfWS2U5E74WLZkmj6ZO/MA3oRm+ncQ/ASGjWaqVVUcrbb
         aFUA==
X-Forwarded-Encrypted: i=1; AHgh+RrLZRCUjck6DpW2cVanMUO/6Tss4bbH0ozx3KAcmipnfczaeMMaU+kGx1jRBqvnIX9nkyFHI0Flf1Ee@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv8iK7LOHuiO6FAnaQkl6HUVebr+xIhW9SGuPoSJmQl8njrvGQ
	1kc/rTL0HS1qQe4RAF3N0rPhL4b2LC1riEReAI6xPydQX+JVikdcH46vXHFGzkouSQ1pUBdflBl
	Hz30x1zoJaTnGBjcEaG7Ais6dm2cKn0g1AEyrbel6pEkwO3AEXiCTkdcwedk3jiug
X-Gm-Gg: AfdE7clM+n7dqi3xK6fD9ZWIQpQwZ9MUVC57TVWHfv9G5uT8JmuT64aCzPrEh7I1gKH
	nTbZGQRj0Cs0ldcSx/PPxDqwIJ/DguO1/ESvJpGwLCToQkddNfR+kmz2X0qYFJxXrPq/o9W1+zL
	5b+gD+qeAWtCvzhhWYHsPcPjSYNDOU+Fr6OReYtiGiI64TVf9Z91NJRaKWQxBCNxjp5CN2KfKHh
	uI8QxUaRNI9/YzRKXjsKzCN00XjugZ0L9j2gWay9JwGbZVBDFpF0qHKLnCAmDDlolJVLeBxiCkb
	LXGLI/AS7xgtXqL2ERgb1lBFodKxf3jZfKNqeTl+cZ/BhPtrhwmMDYQV4+VkssS04TaziJ65liE
	Y0tQDb1iZWwTnhrb+VlPwTAodTcJ/60xHdkO5PnNa
X-Received: by 2002:a05:6214:1d2d:b0:8eb:1ffa:4e5a with SMTP id 6a1803df08f44-90400b8abccmr205223886d6.13.1784121725852;
        Wed, 15 Jul 2026 06:22:05 -0700 (PDT)
X-Received: by 2002:a05:6214:1d2d:b0:8eb:1ffa:4e5a with SMTP id 6a1803df08f44-90400b8abccmr205223546d6.13.1784121725395;
        Wed, 15 Jul 2026 06:22:05 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd56c4cd1sm192874866d6.16.2026.07.15.06.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:22:04 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v3 0/2] pinctrl: qcom: Add Eliza LPASS LPI support
Date: Wed, 15 Jul 2026 18:51:48 +0530
Message-Id: <20260715132150.1322663-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfX1oY/QwUj3Zpt
 XPlPEtJBc/BGoHeeBd6n4lRF8CeZOwfHThQ3pCj3bVC9mf8ZuoDSv7jFOsxUu0p9XMBv8wITuo3
 E3OeYNPHH2Qp++zrcjundB0+Mc57vek=
X-Proofpoint-ORIG-GUID: oAxSqMmaMDoW2olAVaP0WFOLyKTv2b7X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfX/ibjIaJp1Vy3
 coKEY4nWuVRcRubEKD1sZ/s+KuY8ZgmxIsi0+GmMTg//6z/+yAMETm7sDZQgcCR/5DONwexyiw6
 +fkhKmd79bQxr+MvUTS8zNmMToi2QqF38mMpr9IzUagG/Wdd8J+SlVZBhRfcwDiRP7CmjgEAQr5
 NMgFk7RGWqlZYVAd4h9WWHFUq0GSNVkBCHWBw2hzHAE/tKAicYRxB45SACxbhP+sHjxB5LhQ1Tc
 9ZEXt6oNBgDzpQwofSn/uxdj4wPDFP8GUvuyhwpIVhU91LPqp4qvEDyTxf3N2VIEjhJAheBZ4GA
 w8eyZICmPdVXUUMPOhFMraHOy/7+cB7hGaPBv02RlqE0gzpG6h4szcWy0h18xLjAu/oHPQ+UMes
 d+F+uNiZvO8T8Wc7NlKqw/HfQjts/JCV44sJLfAr26s33iNfxoeMwgw0w3ml1USlcAW1q7GLhWs
 k3xbOypWInBPXSCQOfw==
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a578980 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=2gB7WEHjjayKgNmZduoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: oAxSqMmaMDoW2olAVaP0WFOLyKTv2b7X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150132

Eliza is a Qualcomm SoC that uses the same LPASS LPI pin mux
functions as Milos. The key difference is the slew rate register
layout — on Eliza the slew rate field lives in the same GPIO config
register rather than a separate dedicated register.

This series adds support for the Eliza LPASS LPI pin controller by
extending the existing Milos driver with a new variant data struct
that uses the correct slew offsets and sets LPI_FLAG_SLEW_RATE_SAME_REG.
The pin descriptors and function table are shared with Milos since
they are identical.

Patch 1 updates the binding to document the new compatible and the
single reg entry used by Eliza.
Patch 2 adds the driver support.

Changes in v3:
- Fix enum compatible list to alphabetical order
  (qcom,eliza before qcom,milos)
  (Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>)
- Drop incorrect Reported-by/Closes tags
- Link to v2: https://lore.kernel.org/all/20260713121518.2724474-1-ravi.hothi@oss.qualcomm.com/

Changes in v2:
- Use 'enum' instead of 'oneOf' + 'const' for compatible property
  (Reported-by: Rob Herring (Arm) <robh@kernel.org>,
   kernel test robot <lkp@intel.com>)
- Restore 'items' descriptions for reg property, drop redundant maxItems
  (Reported-by: Sashiko AI review)
- Link to v1: https://lore.kernel.org/all/20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com/

Ravi Hothi (2):
  dt-bindings: pinctrl: qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
  pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS LPI TLMM

 .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml | 18 ++++++++-
 .../pinctrl/qcom/pinctrl-milos-lpass-lpi.c    | 40 +++++++++++++++++++
 2 files changed, 57 insertions(+), 1 deletion(-)


base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
-- 
2.34.1

